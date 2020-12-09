package com.robot.order.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.robot.api.enums.OrderStatusEnum;
import com.robot.api.enums.RedisKeyEnum;
import com.robot.api.exception.BizException;
import com.robot.api.middleware.BaseRedis;
import com.robot.api.pojo.*;
import com.robot.api.request.CreateOrderRequest;
import com.robot.api.request.OrderListRequest;
import com.robot.api.request.OrderSureRequest;
import com.robot.api.response.*;
import com.robot.api.util.DateUtil;
import com.robot.api.util.HttpClientUtil;
import com.robot.api.util.RandomCodeUtil;
import com.robot.api.util.wxpay.WXPayConstants;
import com.robot.api.util.wxpay.WXPayUtil;
import com.robot.member.provider.MemberProvider;
import com.robot.order.dao.OrderDao;
import com.robot.order.dao.OrderLineDao;
import com.robot.order.dao.PaymentDetailsDao;
import com.robot.order.producer.BaseProducer;
import com.robot.order.service.CartService;
import com.robot.order.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import static com.robot.api.util.QRCodeUtil.codeCreate;
import static com.robot.api.util.StaticUtil.out_time;
import static com.robot.api.util.wxpay.WXPayUtil.*;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {

    @Value("${orderTopic}")
    private String orderTopic;

    @Value("${accessKey}")
    private String accessKey;

    @Value("${secretKey}")
    private String secretKey;

    @Value("${mySecretKey}")
    private String mySecretKey;

    @Value("${bucket}")
    private String bucket;

    @Value("${myUrl}")
    private String myUrl;

    @Value("${body}")
    private String body;

    @Value("${appid}")
    private String appid;

    @Value("${mchId}")
    private String mchId;

    @Value("${notifyUrl}")
    private String notifyUrl;

    @Value("${key}")
    private String key;

    @Value("${payIp}")
    private String payIp;

    @Value("${payAccessKey}")
    private String payAccessKey;

    @Value("${paySecretKey}")
    private String paySecretKey;

    @Value("${payBucket}")
    private String payBucket;


    @Resource
    private BaseRedis baseRedis;

    @Reference(version = "1.0.0", check = false)
    private MemberProvider memberProvider;


    @Resource
    private CartService cartService;

    @Resource
    private OrderDao orderDao;

    @Resource
    private OrderLineDao orderLineDao;

    @Resource
    private BaseProducer baseProducer;

    @Resource
    private PaymentDetailsDao paymentDetailsDao;

    private static final String userAdvance = "userAdvanceOrder";
    //微信支付地址
    private static final String unifiedorder_url = "https://api.mch.weixin.qq.com/pay/unifiedorder";

    private ExecutorService executor = new ThreadPoolExecutor(2, 5, 0L,
            TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>());


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Message createOrder(CreateOrderRequest request, String uid) throws Exception {
        ErrorType errorType = ErrorType.SUCCESS;
        CartResponse cartResponse = cartService.checkCartEntry(uid);
        UserCoupon userCoupon = new UserCoupon();
        BigDecimal payAmount = cartResponse.getTotal();
        BigDecimal orderAmount = cartResponse.getTotal();
        BigDecimal discountAmount = BigDecimal.ZERO;
        int point = 0;
        //这里判断用户的优惠券，在提交订单一瞬间过期，算不算，这里要看自己的本身业务
        if (request.getCouponId() != null) {
            userCoupon = memberProvider.findCouponById(uid, request.getCouponId());
            if (userCoupon == null) {
                errorType = ErrorType.COUPON_IS_USE;
            } else {
                //判断优惠券的时间
                if (userCoupon.getStartAt().after(new Date())) {
                    errorType = ErrorType.COUPON_NOT_UP;
                } else if (userCoupon.getEndAt().before(new Date())) {
                    errorType = ErrorType.COUPON_EXPIRE;
                } else {
                    if (orderAmount.compareTo(userCoupon.getAmount()) >= 0) {
                        errorType = ErrorType.COUPON_THRESHOLD;
                    } else {
                        if (userCoupon.getDiscount() != null) {
                            orderAmount = orderAmount.multiply(userCoupon.getDiscount());
                        } else {
                            orderAmount = orderAmount.subtract(userCoupon.getAmount());
                        }
                    }
                }
            }
        }
        if (!StringUtils.equals(errorType.getErrorCode(), ErrorType.SUCCESS.getErrorCode())) {
            throw new BizException(errorType);
        }
        String orderCode = createOrderCode();
        Order order = Order.convertOrder(userCoupon, request, payAmount, orderAmount, discountAmount, point, orderCode);
        order.setUid(uid);
        order.setTotalNum(cartResponse.getTotalNum());
        List<OrderLine> orderLine = OrderLine.convertOrderLine(cartResponse.getCartEntries(), orderCode);
        OrderAndLine orderAndLine = new OrderAndLine();
        orderAndLine.setOrder(order);
        orderAndLine.setOrderLine(orderLine);

        //这里可以采用mq的方式，由于小R的服务器内存快爆（各位看官打赏打赏吧）了
        // 不得不用同步的方式
//        orderAndLine.setOrder(order);
//        orderAndLine.setOrderLine(orderLine);
//        baseProducer.sendOrderMsg(orderTopic, orderAndLine);


        orderDao.insert(orderAndLine.getOrder());
        orderLineDao.insertBatch(orderAndLine.getOrderLine());
        //创建订单完成 清空购物车
        baseRedis.del(String.format(RedisKeyEnum.CART_KEY.getKey(), uid));

        //创建订单成功消耗库存 todo
        return Message.success(orderCode, ErrorType.SUCCESS);
    }

    @Override
    public Message orderPay(String uid, String orderCode) throws Exception {
        String body = "小R商城";
        String wnonce_str = String.valueOf(System.currentTimeMillis());
        BigDecimal wtotal_fee = new BigDecimal("0.1").multiply(new BigDecimal("100.00")).setScale(0);
        String time_expire = getOrderExpireTime(2 * 60 * 1000L);
        Map<String, Object> paraMap = new HashMap<>();
        paraMap.put("appid", appid);
        paraMap.put("mch_id", mchId);
        paraMap.put("nonce_str", wnonce_str);
        paraMap.put("notify_url", notifyUrl);
        paraMap.put("body", body);
        paraMap.put("time_expire", time_expire);
        paraMap.put("out_trade_no", orderCode);
        paraMap.put("spbill_create_ip", payIp);
        paraMap.put("total_fee", wtotal_fee.toString());
        paraMap.put("trade_type", "NATIVE");
        String sign;
        String xml;
        try {
            sign = generateNewSignature(paraMap, key, WXPayConstants.SignType.MD5);
            paraMap.put("sign", sign);
            xml = newMapToXml(paraMap);
            String xmlStr = HttpClientUtil.httpsRequest(unifiedorder_url, "POST", xml);
            Map<String, String> map = WXPayUtil.xmlToMap(xmlStr);
            String qrCode = codeCreate(map.get("code_url"), payAccessKey,
                    paySecretKey, payBucket, myUrl);
            return Message.success(qrCode);
        } catch (Exception e) {
            return Message.error(ErrorType.ERROR);
        }
    }


    @Override
    public Message orderSure(OrderSureRequest request, String uid) throws Exception {

        OrderSureResponse orderSureResponse = new OrderSureResponse();
        BigDecimal freeOrderFreight = new BigDecimal(99);
        BigDecimal freight = new BigDecimal(10);
        UserAddress defaultAddress = new UserAddress();
        UserCoupon userCoupon = new UserCoupon();
        BigDecimal couponDiscount = BigDecimal.ZERO;
        int point = 0;
        ErrorType errorType = ErrorType.SUCCESS;
        Map<String, List<UserCouponResponse>> userCouponMap = new HashMap<>();
        //查询商品
        CartResponse cartResponse = cartService.checkCartEntry(uid);
        BigDecimal totalMoney = cartResponse.getTotal();
        //查询默认地址
        if (null != request.getAddressId()) {
            defaultAddress = memberProvider.findAddressById(request.getAddressId(), uid);
        } else {
            defaultAddress = memberProvider.findDefault(uid);
        }
        orderSureResponse.convertOrderSure(orderSureResponse, defaultAddress);
        //查询优惠券 优惠券这段逻辑真想把他删了
        //这里写的比较急，没有多考虑，不知道小伙伴有什么好的办法
        //可以加我微信和我沟通哦
        if (StringUtils.isNotBlank(request.getCouponId())) {
            userCoupon = memberProvider.findCouponById(uid, request.getCouponId());
            //判断优惠券是否用掉
            if (userCoupon == null) {
                errorType = ErrorType.COUPON_IS_USE;
            } else {
                //判断优惠券的时间
                if (userCoupon.getStartAt().after(new Date())) {
                    errorType = ErrorType.COUPON_NOT_UP;
                } else if (userCoupon.getEndAt().before(new Date())) {
                    errorType = ErrorType.COUPON_EXPIRE;
                } else {
                    if (totalMoney.compareTo(userCoupon.getAmount()) < 0) {
                        errorType = ErrorType.COUPON_THRESHOLD;
                    } else {
                        if (userCoupon.getDiscount() != null) {
                            couponDiscount = totalMoney.subtract(totalMoney.multiply(userCoupon.getDiscount()));
                            totalMoney = totalMoney.multiply(userCoupon.getDiscount());
                        } else {
                            couponDiscount = userCoupon.getAmount();
                            totalMoney = totalMoney.subtract(userCoupon.getAmount());

                        }
                        cartResponse.setTotal(totalMoney);
                    }
                }
            }
        } else {
            //说明第一次进来
            userCouponMap = memberProvider.findCoupon(uid);
        }

        //查询积分


        //查询运费，目前全国包邮,后期有需求可以二次开发
        if (cartResponse.getTotal().compareTo(freeOrderFreight) >= 0) {
            freight = BigDecimal.ZERO;
            orderSureResponse.setFreight(freight);
        }
        BigDecimal payAmount = cartResponse.getTotal().add(freight).subtract(couponDiscount);
        orderSureResponse.setCartResponse(cartResponse);
        orderSureResponse.setCartResponse(cartResponse);
        orderSureResponse.setPoint(point);
        orderSureResponse.setUserCoupon(userCouponMap);
        orderSureResponse.setCouponDiscount(couponDiscount);
        orderSureResponse.setPayAmount(payAmount);
        return Message.success(orderSureResponse, errorType);
    }

    @Override
    public void insertOrder(OrderAndLine orderAndLine, Integer status) throws Exception {
        orderDao.insert(orderAndLine.getOrder());
        orderLineDao.insertBatch(orderAndLine.getOrderLine());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String payNotify(Map<String, String> params) throws Exception {
        Map<String, String> return_data = new HashMap<>();
        if (!WXPayUtil.isSignatureValid(params, mySecretKey)) {
            // 支付失败
            return_data.put("return_code", "FAIL");
            return_data.put("return_msg", "return_code不正确");
        } else {
            PaymentDetails paymentDetails = new PaymentDetails();
            BigDecimal total_fee = new BigDecimal(params.get("total_fee")).divide(new BigDecimal(100));
            String orderCode = params.get("out_trade_no");
            Date accountTime = DateUtil.parseDate(params.get("time_end"), "yyyy-MM-dd HH:mm:ss");
            String tradeNo = params.get("transaction_id");
            paymentDetails.setOrderCode(orderCode);
            paymentDetails.setTransactionAmount(total_fee);
            paymentDetails.setPaidAmount(total_fee);
            paymentDetails.setPaymentStatus(2);
            paymentDetails.setTransactionNo(tradeNo);
            paymentDetails.setPaymentType(1);
            paymentDetails.setTransactionTime(accountTime);
            paymentDetailsDao.insert(paymentDetails);
            orderDao.updateByOrderCode(OrderStatusEnum.PAID.getCode(), orderCode);
            return_data.put("return_code", "SUCCESS");
            return_data.put("return_msg", "OK");
        }
        return WXPayUtil.mapToXml(return_data);
    }

    @Override
    public Message orderRedDot(String uid) {
        PersonCenterResponse personCenterResponse = new PersonCenterResponse();
        List<Order> orders = orderDao.orderRedDot(uid);
        if (CollectionUtils.isNotEmpty(orders)) {
            personCenterResponse = OrderStatusEnum.orderNum(orders);
        }
        User user = memberProvider.findUserByUid(uid);
        personCenterResponse.setUser(user);
        return Message.success(personCenterResponse);
    }

    @Override
    public Message orderList(String uid, OrderListRequest request) {
        List<OrderListResponse> orderListResponse = new ArrayList<>();
        //pageHelper 要用这种方式获取总数
        Page page = PageHelper.startPage(request.getPageNumber(), request.getPageSize());


        List<Order> orders = orderDao.orderListByStatus(uid, request.getStatus());
        if (CollectionUtils.isEmpty(orders)) {
            return Message.success(ErrorType.SUCCESS);
        }
        for (Order order : orders) {
            OrderListResponse response = new OrderListResponse();
            OrderLine orderLine = orderLineDao.selectOrderLineByCode(order.getOrderCode());
            response.setOrder(order);
            response.setTimeStr(DateUtil.date2String(order.getCreateTime(), "YYYY-dd-MM HH:mm:ss"));
            response.setOrderLine(orderLine);
            response.setTotal(page.getTotal());
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(order.getCreateTime());
            calendar.add(Calendar.HOUR, 1);
            Date date = calendar.getTime();
            //计算还剩多少时间
            long time = (date.getTime() - new Date().getTime());
            response.setTime(time);
            orderListResponse.add(response);
        }
        return Message.success(orderListResponse);
    }

    @Override
    public void deleteOrder() {
        //删除1小时未支付的订单
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.HOUR, -1);
        orderDao.deleteByTime(c.getTime());
    }

    public String createOrderCode() throws Exception {
        String id = RandomCodeUtil.getOrderCode();
        int times = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        String key = String.format(RedisKeyEnum.ORDER_CODE_KEY.getKey(), sdf.format(new Date()));
        boolean result = baseRedis.sismember(key, id);
        while (result && (times < 20)) {
            times++;
            id = RandomCodeUtil.getOrderCode();
        }
        baseRedis.sadd(key, id);
        baseRedis.expire(key, out_time);
        return id;
    }
}
