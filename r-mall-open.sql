
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel_picture
-- ----------------------------
DROP TABLE IF EXISTS `carousel_picture`;
CREATE TABLE `carousel_picture`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT 1,
  `enable` tinyint NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousel_picture
-- ----------------------------
INSERT INTO `carousel_picture` VALUES (1, '轮播图1', 'http://ftp.52jdk.com/banner-5.jpg', 1, 1, '2019-12-30 21:50:05', '2020-10-09 13:40:40');
INSERT INTO `carousel_picture` VALUES (2, '轮播图2', 'http://ftp.52jdk.com/banner-7.jpg', 1, 1, '2020-01-02 10:47:05', '2020-10-09 10:07:05');
INSERT INTO `carousel_picture` VALUES (3, '轮播图3', 'http://ftp.52jdk.com/banner-8.jpg', 1, 1, '2020-01-02 10:47:10', '2020-10-09 10:07:08');
INSERT INTO `carousel_picture` VALUES (4, '轮播图4', 'http://ftp.52jdk.com/banner-9.jpg', 1, 1, '2020-01-02 10:47:13', '2020-10-09 10:07:10');
INSERT INTO `carousel_picture` VALUES (5, '按钮图1', 'http://ftp.52jdk.com/button-1.jpg', 2, 1, '2020-01-02 14:05:12', '2020-10-08 21:25:11');
INSERT INTO `carousel_picture` VALUES (6, '按钮图2', 'http://ftp.52jdk.com/button-2.jpg', 2, 1, '2020-01-02 14:05:15', '2020-10-08 21:25:55');
INSERT INTO `carousel_picture` VALUES (7, '按钮图3', 'http://ftp.52jdk.com/button-3.jpg', 2, 1, '2020-01-02 14:05:17', '2020-10-08 21:26:21');
INSERT INTO `carousel_picture` VALUES (8, '按钮图4', 'http://ftp.52jdk.com/button-4.jpg', 2, 1, '2020-01-02 14:05:20', '2020-10-08 21:26:25');
INSERT INTO `carousel_picture` VALUES (9, '按钮图5', 'http://ftp.52jdk.com/button-5.jpg', 2, 1, '2020-01-02 14:05:21', '2020-10-08 21:26:29');
INSERT INTO `carousel_picture` VALUES (10, '按钮图6', 'http://ftp.52jdk.com/button-6.jpg', 2, 1, '2020-01-02 14:05:24', '2020-10-08 21:26:33');
INSERT INTO `carousel_picture` VALUES (11, '按钮图7', 'http://ftp.52jdk.com/button-7.jpg', 2, 1, '2020-01-02 14:05:26', '2020-10-08 21:26:36');
INSERT INTO `carousel_picture` VALUES (12, '按钮图8', 'http://ftp.52jdk.com/button-8.jpg', 2, 1, '2020-01-02 14:05:28', '2020-10-08 21:26:40');
INSERT INTO `carousel_picture` VALUES (13, '按钮图9', 'http://ftp.52jdk.com/button-9.jpg', 2, 1, '2020-01-02 14:05:30', '2020-10-08 21:26:43');
INSERT INTO `carousel_picture` VALUES (14, '按钮图10', 'http://ftp.52jdk.com/button-10.jpg', 2, 1, '2020-01-02 14:05:33', '2020-10-08 21:26:45');

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES (1, '159275128821', '660500', '2020-10-14 16:37:18', '2020-10-14 16:37:18');
INSERT INTO `code` VALUES (2, '159275128821', '540088', '2020-10-14 16:37:15', '2020-10-14 16:37:15');
INSERT INTO `code` VALUES (3, '159275128821', '085547', '2020-10-14 16:37:13', '2020-10-14 16:37:13');
INSERT INTO `code` VALUES (4, '159275128821', '260311', '2020-10-14 16:37:11', '2020-10-14 16:37:11');
INSERT INTO `code` VALUES (5, '159275128821', '196789', '2020-10-14 16:37:10', '2020-10-14 16:37:10');

-- ----------------------------
-- Table structure for coupon_tpl
-- ----------------------------
DROP TABLE IF EXISTS `coupon_tpl`;
CREATE TABLE `coupon_tpl`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '券名称',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` int NULL DEFAULT NULL COMMENT '券类型',
  `discount` decimal(6, 2) NULL DEFAULT NULL COMMENT '打几折',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '减多少钱',
  `threshold` decimal(10, 2) NULL DEFAULT NULL COMMENT '门槛',
  `send_quantity` int NULL DEFAULT NULL COMMENT '发送数量',
  `quantity` int NULL DEFAULT NULL COMMENT '数量',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '生效时间',
  `invalid_date` datetime(0) NULL DEFAULT NULL COMMENT '失效时间',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_tpl
-- ----------------------------
INSERT INTO `coupon_tpl` VALUES (1, '满30-10元', '全场满30减30元', 1, NULL, 10.00, 30.00, 7, 10, '2020-08-07 11:06:53', '2020-08-31 11:06:58', '2020-08-07 17:32:28');
INSERT INTO `coupon_tpl` VALUES (2, '满100打8.8折', '全场满100打8.8折', 2, 0.88, NULL, 100.00, 0, 3000, '2020-08-07 11:08:02', '2020-08-31 11:08:05', '2020-08-07 11:09:18');
INSERT INTO `coupon_tpl` VALUES (5, '满20-10', '满20-10', 1, 10.00, 10.00, 30.00, NULL, 100, '2020-09-18 16:15:32', '2020-09-26 00:00:00', NULL);

-- ----------------------------
-- Table structure for donate
-- ----------------------------
DROP TABLE IF EXISTS `donate`;
CREATE TABLE `donate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `money` decimal(10, 0) NULL DEFAULT NULL COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of donate
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uid',
  `pay_amount` decimal(11, 2) NOT NULL COMMENT '应付金额',
  `order_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `freight_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '运费',
  `point` int NULL DEFAULT NULL COMMENT '积分',
  `order_status` int NULL DEFAULT NULL COMMENT '订单状态',
  `address_id` int NULL DEFAULT NULL COMMENT '地址id',
  `coupon_tpl_id` int NULL DEFAULT NULL COMMENT '券模板id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `total_num` int NULL DEFAULT NULL COMMENT '商品数量',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `express_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `express_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `receipt_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `ship_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `discount_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (58, '201010725593', '123456', 39996.00, 39996.00, 0.00, 0, 0, NULL, NULL, '2020-10-10 16:30:21', 4, '2020-10-10 15:48:21', NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `order` VALUES (59, '201011573616', '123456', 29997.00, 29997.00, 0.00, 0, 0, NULL, NULL, '2020-10-11 17:31:57', 3, '2020-10-11 17:31:57', NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `order` VALUES (60, '201011359107', '123456', 9999.00, 9999.00, 0.00, 0, 0, NULL, NULL, '2020-10-11 17:34:56', 1, '2020-10-11 17:34:56', NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `order` VALUES (61, '201011633004', '123456', 9999.00, 9999.00, 0.00, 0, 0, NULL, NULL, '2020-10-11 17:36:25', 1, '2020-10-11 17:36:25', NULL, NULL, NULL, NULL, NULL, 0.00, NULL);
INSERT INTO `order` VALUES (62, '201011809722', '123456', 9999.00, 9999.00, 0.00, 0, 0, 2, NULL, '2020-10-11 17:38:05', 1, '2020-10-11 17:38:05', NULL, NULL, NULL, NULL, NULL, 0.00, NULL);

-- ----------------------------
-- Table structure for order_line
-- ----------------------------
DROP TABLE IF EXISTS `order_line`;
CREATE TABLE `order_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_line
-- ----------------------------
INSERT INTO `order_line` VALUES (1, '200821971019', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-21 16:29:35', '2020-08-21 16:29:35');
INSERT INTO `order_line` VALUES (2, '200821971019', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-21 16:29:35', '2020-08-21 16:29:35');
INSERT INTO `order_line` VALUES (3, '200823372096', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-23 22:24:38', '2020-08-23 22:24:38');
INSERT INTO `order_line` VALUES (4, '200823372096', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-23 22:24:38', '2020-08-23 22:24:38');
INSERT INTO `order_line` VALUES (5, '200825103270', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:56:02', '2020-08-25 13:56:02');
INSERT INTO `order_line` VALUES (6, '200825103270', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:56:02', '2020-08-25 13:56:02');
INSERT INTO `order_line` VALUES (7, '200825906604', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:57:29', '2020-08-25 13:57:29');
INSERT INTO `order_line` VALUES (8, '200825906604', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:57:29', '2020-08-25 13:57:29');
INSERT INTO `order_line` VALUES (9, '200825995317', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:58:49', '2020-08-25 13:58:49');
INSERT INTO `order_line` VALUES (10, '200825995317', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:58:49', '2020-08-25 13:58:49');
INSERT INTO `order_line` VALUES (11, '200825157374', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:59:15', '2020-08-25 13:59:15');
INSERT INTO `order_line` VALUES (12, '200825157374', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 13:59:15', '2020-08-25 13:59:15');
INSERT INTO `order_line` VALUES (13, '200825482222', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 14:58:38', '2020-08-25 14:58:38');
INSERT INTO `order_line` VALUES (14, '200825482222', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 14:58:38', '2020-08-25 14:58:38');
INSERT INTO `order_line` VALUES (15, '200825448682', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:03:32', '2020-08-25 15:03:32');
INSERT INTO `order_line` VALUES (16, '200825448682', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:03:32', '2020-08-25 15:03:32');
INSERT INTO `order_line` VALUES (17, '200825691836', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:07:38', '2020-08-25 15:07:38');
INSERT INTO `order_line` VALUES (18, '200825691836', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:07:38', '2020-08-25 15:07:38');
INSERT INTO `order_line` VALUES (19, '200825865786', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:10:35', '2020-08-25 15:10:35');
INSERT INTO `order_line` VALUES (20, '200825865786', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:10:35', '2020-08-25 15:10:35');
INSERT INTO `order_line` VALUES (21, '200825853839', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:18:32', '2020-08-25 15:18:32');
INSERT INTO `order_line` VALUES (22, '200825853839', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:18:32', '2020-08-25 15:18:32');
INSERT INTO `order_line` VALUES (23, '200825579513', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:32:05', '2020-08-25 15:32:05');
INSERT INTO `order_line` VALUES (24, '200825579513', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:32:05', '2020-08-25 15:32:05');
INSERT INTO `order_line` VALUES (25, '200825212672', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:38:04', '2020-08-25 15:38:04');
INSERT INTO `order_line` VALUES (26, '200825212672', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:38:04', '2020-08-25 15:38:04');
INSERT INTO `order_line` VALUES (27, '200825205440', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:50:37', '2020-08-25 15:50:37');
INSERT INTO `order_line` VALUES (28, '200825205440', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 15:50:37', '2020-08-25 15:50:37');
INSERT INTO `order_line` VALUES (29, '200825520318', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:01:12', '2020-08-25 16:01:12');
INSERT INTO `order_line` VALUES (30, '200825520318', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:01:12', '2020-08-25 16:01:12');
INSERT INTO `order_line` VALUES (31, '200825955252', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:32:15', '2020-08-25 16:32:15');
INSERT INTO `order_line` VALUES (32, '200825955252', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:32:15', '2020-08-25 16:32:15');
INSERT INTO `order_line` VALUES (33, '200825380743', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:32:24', '2020-08-25 16:32:24');
INSERT INTO `order_line` VALUES (34, '200825380743', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:32:24', '2020-08-25 16:32:24');
INSERT INTO `order_line` VALUES (35, '200825293436', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:40:21', '2020-08-25 16:40:21');
INSERT INTO `order_line` VALUES (36, '200825293436', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:40:21', '2020-08-25 16:40:21');
INSERT INTO `order_line` VALUES (37, '200825771555', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:43:07', '2020-08-25 16:43:07');
INSERT INTO `order_line` VALUES (38, '200825771555', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 16:43:07', '2020-08-25 16:43:07');
INSERT INTO `order_line` VALUES (39, '200825886604', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:07:27', '2020-08-25 17:07:27');
INSERT INTO `order_line` VALUES (40, '200825886604', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:07:27', '2020-08-25 17:07:27');
INSERT INTO `order_line` VALUES (41, '200825651620', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:07:32', '2020-08-25 17:07:32');
INSERT INTO `order_line` VALUES (42, '200825651620', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:07:32', '2020-08-25 17:07:32');
INSERT INTO `order_line` VALUES (43, '200825960945', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:13:37', '2020-08-25 17:13:37');
INSERT INTO `order_line` VALUES (44, '200825960945', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:13:37', '2020-08-25 17:13:37');
INSERT INTO `order_line` VALUES (45, '200825362772', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:13:45', '2020-08-25 17:13:45');
INSERT INTO `order_line` VALUES (46, '200825362772', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:13:45', '2020-08-25 17:13:45');
INSERT INTO `order_line` VALUES (47, '200825245166', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:14:23', '2020-08-25 17:14:23');
INSERT INTO `order_line` VALUES (48, '200825245166', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:14:23', '2020-08-25 17:14:23');
INSERT INTO `order_line` VALUES (49, '200825194127', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:18:15', '2020-08-25 17:18:15');
INSERT INTO `order_line` VALUES (50, '200825194127', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:18:15', '2020-08-25 17:18:15');
INSERT INTO `order_line` VALUES (51, '200825765149', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:23:28', '2020-08-25 17:23:28');
INSERT INTO `order_line` VALUES (52, '200825765149', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:23:28', '2020-08-25 17:23:28');
INSERT INTO `order_line` VALUES (53, '200825888082', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:30:57', '2020-08-25 17:30:57');
INSERT INTO `order_line` VALUES (54, '200825888082', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:30:57', '2020-08-25 17:30:57');
INSERT INTO `order_line` VALUES (55, '200825348723', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:39:22', '2020-08-25 17:39:22');
INSERT INTO `order_line` VALUES (56, '200825348723', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:39:22', '2020-08-25 17:39:22');
INSERT INTO `order_line` VALUES (57, '200825646561', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:53:18', '2020-08-25 17:53:18');
INSERT INTO `order_line` VALUES (58, '200825646561', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 17:53:18', '2020-08-25 17:53:18');
INSERT INTO `order_line` VALUES (59, '200825458606', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 18:07:17', '2020-08-25 18:07:17');
INSERT INTO `order_line` VALUES (60, '200825458606', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 18:07:17', '2020-08-25 18:07:17');
INSERT INTO `order_line` VALUES (61, '200825949723', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 18:07:22', '2020-08-25 18:07:22');
INSERT INTO `order_line` VALUES (62, '200825949723', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-08-25 18:07:22', '2020-08-25 18:07:22');
INSERT INTO `order_line` VALUES (63, '201010421306', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:23:52', '2020-10-10 10:23:52');
INSERT INTO `order_line` VALUES (64, '201010421306', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:23:52', '2020-10-10 10:23:52');
INSERT INTO `order_line` VALUES (65, '201010569349', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:24:00', '2020-10-10 10:24:00');
INSERT INTO `order_line` VALUES (66, '201010569349', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:24:00', '2020-10-10 10:24:00');
INSERT INTO `order_line` VALUES (67, '201010279077', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:24:15', '2020-10-10 10:24:15');
INSERT INTO `order_line` VALUES (68, '201010279077', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:24:15', '2020-10-10 10:24:15');
INSERT INTO `order_line` VALUES (69, '201010752808', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:24:31', '2020-10-10 10:24:31');
INSERT INTO `order_line` VALUES (70, '201010752808', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:24:31', '2020-10-10 10:24:31');
INSERT INTO `order_line` VALUES (71, '201010497891', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:27:27', '2020-10-10 10:27:27');
INSERT INTO `order_line` VALUES (72, '201010497891', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:27:27', '2020-10-10 10:27:27');
INSERT INTO `order_line` VALUES (73, '201010591316', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:27:34', '2020-10-10 10:27:34');
INSERT INTO `order_line` VALUES (74, '201010591316', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:27:34', '2020-10-10 10:27:34');
INSERT INTO `order_line` VALUES (75, '201010181976', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:27:50', '2020-10-10 10:27:50');
INSERT INTO `order_line` VALUES (76, '201010181976', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:27:50', '2020-10-10 10:27:50');
INSERT INTO `order_line` VALUES (77, '201010139829', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:28:17', '2020-10-10 10:28:17');
INSERT INTO `order_line` VALUES (78, '201010139829', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:28:17', '2020-10-10 10:28:17');
INSERT INTO `order_line` VALUES (79, '201010995917', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:29:04', '2020-10-10 10:29:04');
INSERT INTO `order_line` VALUES (80, '201010995917', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:29:04', '2020-10-10 10:29:04');
INSERT INTO `order_line` VALUES (81, '201010286922', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:29:43', '2020-10-10 10:29:43');
INSERT INTO `order_line` VALUES (82, '201010286922', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:29:43', '2020-10-10 10:29:43');
INSERT INTO `order_line` VALUES (83, '201010565912', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:35:30', '2020-10-10 10:35:30');
INSERT INTO `order_line` VALUES (84, '201010565912', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:35:30', '2020-10-10 10:35:30');
INSERT INTO `order_line` VALUES (85, '201010513419', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:36:32', '2020-10-10 10:36:32');
INSERT INTO `order_line` VALUES (86, '201010513419', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:36:32', '2020-10-10 10:36:32');
INSERT INTO `order_line` VALUES (87, '201010380964', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:39:49', '2020-10-10 10:39:49');
INSERT INTO `order_line` VALUES (88, '201010380964', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:39:49', '2020-10-10 10:39:49');
INSERT INTO `order_line` VALUES (89, '201010717999', '1000001', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 10:40:41', '2020-10-10 10:40:41');
INSERT INTO `order_line` VALUES (90, '201010717999', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 10:40:41', '2020-10-10 10:40:41');
INSERT INTO `order_line` VALUES (91, '201010725593', '1000001', 'Apple iphone 11 Pro Max', 3, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-10 15:48:21', '2020-10-10 15:48:21');
INSERT INTO `order_line` VALUES (92, '201010725593', '1000002', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-10 15:48:21', '2020-10-10 15:48:21');
INSERT INTO `order_line` VALUES (93, '201011573616', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-11 17:31:57', '2020-10-11 17:31:57');
INSERT INTO `order_line` VALUES (94, '201011573616', '1000002', 'Apple iphone 11 Pro Max', 2, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', 9999.00, '2020-10-11 17:31:57', '2020-10-11 17:31:57');
INSERT INTO `order_line` VALUES (95, '201011359107', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-11 17:34:56', '2020-10-11 17:34:56');
INSERT INTO `order_line` VALUES (96, '201011633004', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-11 17:36:25', '2020-10-11 17:36:25');
INSERT INTO `order_line` VALUES (97, '201011809722', '1000001', 'Apple iphone 11 Pro Max', 1, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', 9999.00, '2020-10-11 17:38:05', '2020-10-11 17:38:05');

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员',
  `control_log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_order_code`(`order_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_log
-- ----------------------------
INSERT INTO `order_log` VALUES (1, '200825157374', '管理员', '退款', '2020-09-16 16:14:40');
INSERT INTO `order_log` VALUES (2, '200823372096', '管理员', '发货', '2020-09-16 17:58:47');

-- ----------------------------
-- Table structure for payment_details
-- ----------------------------
DROP TABLE IF EXISTS `payment_details`;
CREATE TABLE `payment_details`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `transaction_amount` decimal(8, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `transaction_time` datetime(0) NULL DEFAULT NULL COMMENT '交易时间',
  `transaction_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付订单号(交易单号)',
  `payment_status` int NULL DEFAULT 3 COMMENT '支付状态',
  `paid_amount` decimal(16, 2) NULL DEFAULT 0.00 COMMENT '实付金额',
  `payment_type` int NULL DEFAULT 6 COMMENT '支付类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_order_code`(`order_code`) USING BTREE,
  INDEX `index_transaction_no`(`transaction_no`) USING BTREE,
  INDEX `index_transaction_time`(`transaction_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_details
-- ----------------------------
INSERT INTO `payment_details` VALUES (131, 'de0d9a990a8a4632ae229dd8fea7fae5', NULL, NULL, '4200000711202008258583953325', 2, 0.10, 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品编码',
  `species_option_id` int NULL DEFAULT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sku名称',
  `recommend` int NULL DEFAULT NULL,
  `virtual_num` int NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主图',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `rights` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权益',
  `enable` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'sku表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (22, '10020912', 1, 'Apple iphone 11 Pro Max', 1, 9999, 999, '全面屏 IOS14 全网通', 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4', 9999.00, '2020-10-14 09:57:51', '2020-10-14 10:23:51', '1,2,3,4,5', 1);
INSERT INTO `product` VALUES (23, '10201013', 13, '华为 HUAWEI Mate 30 5G', 1, 0, 0, '麒麟990 4000万超感光徕卡影像双超级快充8GB+128GB青山黛5G全网通游戏手机', 'http://ftp.52jdk.com/3aea79c0f6d54e359487662d34e6c999', 4899.00, '2020-10-13 17:58:30', '2020-10-13 17:58:45', NULL, 1);

-- ----------------------------
-- Table structure for product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE `product_attribute`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '选项名称',
  `type` int NULL DEFAULT 1,
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_multiple` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_attribute_option_name_attr_id_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_attribute
-- ----------------------------
INSERT INTO `product_attribute` VALUES (1, '颜色', 1, 999, '2020-07-14 19:17:51', '2020-07-14 19:17:54', 0);
INSERT INTO `product_attribute` VALUES (2, '内存', 2, 999, '2020-07-14 21:53:05', '2020-07-14 21:53:07', 0);
INSERT INTO `product_attribute` VALUES (3, '加料', 1, 999, '2020-07-14 21:55:27', '2020-07-14 21:55:29', 0);

-- ----------------------------
-- Table structure for product_attribute_option
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_option`;
CREATE TABLE `product_attribute_option`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `attr_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名字',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '规格属性绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_attribute_option
-- ----------------------------
INSERT INTO `product_attribute_option` VALUES (1, 1, '玫瑰金', 999, '2020-09-11 17:57:10', '2020-09-11 17:57:08');
INSERT INTO `product_attribute_option` VALUES (2, 1, '白色', 999, '2020-09-11 17:57:32', '2020-09-11 17:57:30');
INSERT INTO `product_attribute_option` VALUES (3, 2, '128G', 999, '2020-09-11 17:59:30', '2020-09-11 17:59:28');
INSERT INTO `product_attribute_option` VALUES (4, 2, '256G', 999, '2020-09-11 17:59:37', '2020-09-11 17:59:34');
INSERT INTO `product_attribute_option` VALUES (5, 1, '银白色', 999, '2020-10-13 17:32:54', '2020-10-13 17:32:57');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品编码',
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格名称',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自定义规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '10020912', '颜色', 999, '2020-06-01 22:17:44', '2020-06-01 22:17:46');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'product_id',
  `roll_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '滚动图',
  `detail_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细图',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES (13, '10020912', 'http://ftp.52jdk.com/d1b8007f50164888bce53bc8a91342c4,http://ftp.52jdk.com/2cc13568e64243928a2f8d763b276b10,http://ftp.52jdk.com/c5c4d68bb3fb4c4e80d8d7162388f5a1,http://ftp.52jdk.com/fd884840940043979e857e66ba2c2aa9,http://ftp.52jdk.com/d842d232d1de4823b45fc2c3b3f6ebd6', 'http://ftp.52jdk.com/8c66430040a741ed92fdbc191edf79e7,http://ftp.52jdk.com/699ea065ee6a42f69824b7143612130d,http://ftp.52jdk.com/93b18ac821d74248aa7b2c0723588bbc', '2020-10-14 09:57:51', '2020-10-14 09:57:51');
INSERT INTO `product_img` VALUES (14, '10201013', 'http://ftp.52jdk.com/33b042f7755a49758627ff4e938e137a,http://ftp.52jdk.com/f19d994e1e26448f9824b263f89e7bb0,http://ftp.52jdk.com/19adc973f53b47ebaf5489e389af89a8', 'http://ftp.52jdk.com/7d0e3a26a35a47b5b948cc9d9856dfe3,http://ftp.52jdk.com/4c0446478b0545ea908ce545fa13c5b3,http://ftp.52jdk.com/5c2caf79ffa0432f86060ce5b6052d5f', '2020-10-13 17:58:30', '2020-10-13 17:58:30');

-- ----------------------------
-- Table structure for product_rights
-- ----------------------------
DROP TABLE IF EXISTS `product_rights`;
CREATE TABLE `product_rights`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_rights
-- ----------------------------
INSERT INTO `product_rights` VALUES (1, 2, 'http://52jdk.com/daikuan.png', '全站自营', '2020-07-08 16:04:52', '2020-07-08 16:04:55');
INSERT INTO `product_rights` VALUES (2, 2, 'http://52jdk.com/dianfei.png', '正品货源', '2020-07-08 16:10:35', '2020-07-08 16:10:37');
INSERT INTO `product_rights` VALUES (3, 2, 'http://52jdk.com/jiaotongfakuan.png', '权威鉴定', '2020-07-08 16:11:10', '2020-07-08 16:11:12');
INSERT INTO `product_rights` VALUES (4, 2, 'http://52jdk.com/wuliu.png', '顺丰配送', '2020-07-08 16:27:11', '2020-07-08 16:27:13');
INSERT INTO `product_rights` VALUES (5, 1, 'http://52jdk.com/licai.png', '假一赔十，100%保证', '2020-07-08 16:32:14', '2020-07-08 16:32:18');

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `attr_one` int NOT NULL COMMENT '商品品类编号',
  `attr_two` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简述',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品关键字',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签',
  `price` decimal(8, 2) NOT NULL COMMENT '商品价格',
  `market_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '市场价格',
  `stock` int NOT NULL COMMENT '库存量',
  `warning_stock` int NOT NULL COMMENT '库存警告',
  `picture_url` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面图',
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_sku`(`sku`) USING BTREE,
  INDEX `index_product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES (45, '1000004', '10201013', '华为 HUAWEI Mate 30 5G', 5, 3, '麒麟990 4000万超感光徕卡影像双超级快充8GB+128GB青山黛5G全网通游戏手机', NULL, NULL, 4499.00, 4499.00, 100, 10, 'http://ftp.52jdk.com/ea7bfce0fa084521b1ca7490d73027e3', '2020-10-13 17:58:30', '2020-10-13 17:58:30');
INSERT INTO `product_sku` VALUES (46, '1000005', '10201013', '华为 HUAWEI Mate 30 5G', 5, 4, '麒麟990 4000万超感光徕卡影像双超级快充8GB+128GB青山黛5G全网通游戏手机', NULL, NULL, 4899.00, 4899.00, 100, 10, 'http://ftp.52jdk.com/2de31d23b23f42ca8df6366c9a418b5d', '2020-10-13 17:58:30', '2020-10-13 17:58:30');
INSERT INTO `product_sku` VALUES (103, '1000001', '10020912', 'Apple iphone 11 Pro Max', 1, 4, '全面屏 IOS14 全网通', NULL, NULL, 9999.00, 10988.00, 9999, 100, 'http://ftp.52jdk.com/9baa42244eb74f1d81c50021c72037a9', '2020-10-14 09:57:51', '2020-10-14 09:57:51');
INSERT INTO `product_sku` VALUES (104, '1000002', '10020912', 'Apple iphone 11 Pro Max', 2, 4, '全面屏 IOS14 全网通', NULL, NULL, 9999.00, 10988.00, 9999, 100, 'http://ftp.52jdk.com/7ba528d4eabf43d19e9be17e221aeb7c', '2020-10-14 09:57:51', '2020-10-14 09:57:51');

-- ----------------------------
-- Table structure for species
-- ----------------------------
DROP TABLE IF EXISTS `species`;
CREATE TABLE `species`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` tinyint NULL DEFAULT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of species
-- ----------------------------
INSERT INTO `species` VALUES (1, '热门推荐', NULL, NULL);
INSERT INTO `species` VALUES (2, '手机数码', NULL, NULL);
INSERT INTO `species` VALUES (3, '电脑办公', NULL, NULL);
INSERT INTO `species` VALUES (4, '家用电器', NULL, NULL);
INSERT INTO `species` VALUES (5, '计生情趣', NULL, NULL);
INSERT INTO `species` VALUES (6, '美妆护肤', NULL, NULL);
INSERT INTO `species` VALUES (7, '个护清洁', NULL, NULL);
INSERT INTO `species` VALUES (8, '男装女装', NULL, NULL);
INSERT INTO `species` VALUES (9, '男鞋女鞋', NULL, NULL);
INSERT INTO `species` VALUES (10, '医疗保健', NULL, NULL);

-- ----------------------------
-- Table structure for species_option
-- ----------------------------
DROP TABLE IF EXISTS `species_option`;
CREATE TABLE `species_option`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `species_id` int NULL DEFAULT NULL COMMENT '分类编号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `cate_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of species_option
-- ----------------------------
INSERT INTO `species_option` VALUES (1, 1, 'iphone', NULL, 'http://ftp.52jdk.com/iphone-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (2, 1, '华为', NULL, 'http://ftp.52jdk.com/huawei-logo.jpeg', NULL);
INSERT INTO `species_option` VALUES (3, 1, 'oppo', NULL, 'http://ftp.52jdk.com/oppo-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (4, 1, '小米', NULL, 'http://ftp.52jdk.com/xiaomi-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (5, 1, '三星', NULL, 'http://ftp.52jdk.com/sanx-logo.png', NULL);
INSERT INTO `species_option` VALUES (6, 1, '戴尔', NULL, 'http://ftp.52jdk.com/dell-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (7, 1, '蒙牛', NULL, 'http://ftp.52jdk.com/mengniu-logo.png', NULL);
INSERT INTO `species_option` VALUES (8, 1, '伊利', NULL, 'http://ftp.52jdk.com/yili-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (9, 1, '良品铺子', NULL, 'http://ftp.52jdk.com/lppz-logo.png', NULL);
INSERT INTO `species_option` VALUES (10, 1, 'Nike', NULL, 'http://ftp.52jdk.com/nike-logo.png', NULL);
INSERT INTO `species_option` VALUES (11, 1, 'adidas', NULL, 'http://ftp.52jdk.com/addidas-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (12, 2, 'iphone', NULL, 'http://ftp.52jdk.com/iphone-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (13, 2, '华为', NULL, 'http://ftp.52jdk.com/huawei-logo.jpeg', NULL);
INSERT INTO `species_option` VALUES (14, 2, 'oppo', NULL, 'http://ftp.52jdk.com/oppo-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (15, 2, '小米', NULL, 'http://ftp.52jdk.com/xiaomi-logo.jpg', NULL);
INSERT INTO `species_option` VALUES (16, 2, '三星', NULL, 'http://ftp.52jdk.com/sanx-logo.png', NULL);
INSERT INTO `species_option` VALUES (17, 3, '戴尔', NULL, 'http://ftp.52jdk.com/dell-logo.jpg', NULL);

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `permissions_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permissions_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `required_permission` int NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES (1, 'order', '订单管理', 'order:list', '列表', 1);
INSERT INTO `sys_permissions` VALUES (4, 'order', '订单管理', 'order:refund', '退款', 2);
INSERT INTO `sys_permissions` VALUES (6, 'order', '订单管理', 'order:delivery', '发货', 2);
INSERT INTO `sys_permissions` VALUES (7, 'order', '订单管理', 'order:detail', '详情', 2);
INSERT INTO `sys_permissions` VALUES (8, 'coupon', '优惠券管理', 'coupon:list', '列表', 1);
INSERT INTO `sys_permissions` VALUES (9, 'coupon', '优惠券管理', 'coupon:add', '添加', 2);
INSERT INTO `sys_permissions` VALUES (10, 'coupon', '优惠券管理', 'coupon:findCouponById', '查询', 2);
INSERT INTO `sys_permissions` VALUES (11, 'coupon', '优惠券管理', 'coupon:deleteCoupon', '删除', 2);
INSERT INTO `sys_permissions` VALUES (12, 'coupon', '优惠券管理', 'coupon:sendCoupon', '发送', 2);
INSERT INTO `sys_permissions` VALUES (13, 'permission', '权限管理', 'permission:list', '用户权限列表', 1);
INSERT INTO `sys_permissions` VALUES (14, 'permission', '权限管理', 'permission:permissionList', '所有权限列表', 1);
INSERT INTO `sys_permissions` VALUES (15, 'permission', '权限管理', 'permission:update', '更新权限', 2);
INSERT INTO `sys_permissions` VALUES (16, 'product', '商品管理', 'product:list', '列表', 1);
INSERT INTO `sys_permissions` VALUES (17, 'product', '商品管理', 'product:enable', '开启', 2);
INSERT INTO `sys_permissions` VALUES (18, 'product', '商品管理', 'product:add', '添加', 2);
INSERT INTO `sys_permissions` VALUES (19, 'product', '商品管理', 'product:delete', '删除', 2);
INSERT INTO `sys_permissions` VALUES (20, 'product', '商品管理', 'product:uploadFile', '上传', 2);
INSERT INTO `sys_permissions` VALUES (21, 'router', '路由管理', 'router:list', '列表', 1);
INSERT INTO `sys_permissions` VALUES (22, 'router', '路由管理', 'router:update', '更新', 2);
INSERT INTO `sys_permissions` VALUES (23, 'router', '路由管理', 'router:delete', '删除', 2);

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `pid` bigint NULL DEFAULT 0 COMMENT '父节点',
  `available` tinyint(1) NULL DEFAULT 0 COMMENT '是否锁定',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_roles_role`(`role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 607 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES (101, '管理员', '拥有最高权限', 0, 0);
INSERT INTO `sys_roles` VALUES (202, '运营', '负责推广运营系统', 0, 0);
INSERT INTO `sys_roles` VALUES (303, '开发', '负责开发运维系统', 0, 0);
INSERT INTO `sys_roles` VALUES (404, '测试', '负责测试系统', 0, 0);
INSERT INTO `sys_roles` VALUES (505, '产品', '负责市场调研、需求分析、原型设计', 0, 0);
INSERT INTO `sys_roles` VALUES (606, '游客', '用于浏览后台', 0, 0);

-- ----------------------------
-- Table structure for sys_roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户编号',
  `permissions_id` int NULL DEFAULT NULL COMMENT '权限id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 239 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES (93, 2, 1, '2020-10-06 23:25:18', '2020-10-06 23:25:18');
INSERT INTO `sys_roles_permissions` VALUES (94, 2, 8, '2020-10-06 23:25:18', '2020-10-06 23:25:18');
INSERT INTO `sys_roles_permissions` VALUES (95, 2, 13, '2020-10-06 23:25:18', '2020-10-06 23:25:18');
INSERT INTO `sys_roles_permissions` VALUES (96, 2, 14, '2020-10-06 23:25:18', '2020-10-06 23:25:18');
INSERT INTO `sys_roles_permissions` VALUES (97, 2, 16, '2020-10-06 23:25:18', '2020-10-06 23:25:18');
INSERT INTO `sys_roles_permissions` VALUES (98, 2, 21, '2020-10-06 23:25:18', '2020-10-06 23:25:18');
INSERT INTO `sys_roles_permissions` VALUES (183, 3, 1, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (184, 3, 4, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (185, 3, 6, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (186, 3, 7, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (187, 3, 8, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (188, 3, 9, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (189, 3, 10, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (190, 3, 12, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (191, 3, 13, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (192, 3, 14, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (193, 3, 15, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (194, 3, 16, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (195, 3, 17, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (196, 3, 18, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (197, 3, 21, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (198, 3, 22, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (199, 3, 20, '2020-10-11 18:01:00', '2020-10-11 18:01:00');
INSERT INTO `sys_roles_permissions` VALUES (219, 1, 20, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (220, 1, 18, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (221, 1, 17, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (222, 1, 16, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (223, 1, 19, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (224, 1, 12, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (225, 1, 8, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (226, 1, 9, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (227, 1, 10, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (228, 1, 11, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (229, 1, 14, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (230, 1, 13, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (231, 1, 6, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (232, 1, 1, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (233, 1, 7, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (234, 1, 4, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (235, 1, 21, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (236, 1, 22, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (237, 1, 23, '2020-10-13 15:50:06', '2020-10-13 15:50:06');
INSERT INTO `sys_roles_permissions` VALUES (238, 1, 15, '2020-10-13 15:50:06', '2020-10-13 15:50:06');

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图像',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐值',
  `locked` tinyint(1) NULL DEFAULT 0 COMMENT '是否锁定',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sys_users_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表：管理员账号 密码admin ,123456' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, 'http://ftp.52jdk.com/head3.jpg', 'admin', '01dcad5519d28fe466545530cc9c01d9', 'bc1ece0c4ff62b7c386637df3b6905a4', 0, 101);
INSERT INTO `sys_users` VALUES (2, 'http://ftp.52jdk.com/head4.jpg', 'user', '735d015ebb29d25f2660053d16e4d81c', 'c8ef163dad19922eb6bc3c5772ae4cd7', 0, 606);
INSERT INTO `sys_users` VALUES (3, 'http://ftp.52jdk.com/head5.jpg', 'yy123', 'abc1a8987f620dd2af23ee3e4787e694', '784821fc7a16df06d40f225851c05983', 0, 202);

-- ----------------------------
-- Table structure for system_attribute
-- ----------------------------
DROP TABLE IF EXISTS `system_attribute`;
CREATE TABLE `system_attribute`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL COMMENT '商品类别编号',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性名称',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排列次序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_attribute_category_id_name_index`(`category_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for system_attribute_option
-- ----------------------------
DROP TABLE IF EXISTS `system_attribute_option`;
CREATE TABLE `system_attribute_option`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '选项名称',
  `attr_id` int NOT NULL COMMENT '属性编码',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_attribute_option_name_attr_id_index`(`name`, `attr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统属性option' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_attribute_option
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_status` tinyint NOT NULL DEFAULT 2 COMMENT '用户状态',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `register_ip` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `register_source` tinyint NULL DEFAULT NULL COMMENT '注册渠道',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123456', 'http://ftp.52jdk.com/head.png', '因为太帅被罚5块', '1591234567', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL, '2020-01-07 17:06:33', '2020-10-10 14:05:04');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `county` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addressDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postalCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deafult` tinyint NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (1, '张三', '123456', '15927512213', '台湾省', '彰化县', '鹿港镇', '湖北省黄梅县', '711778', '313213', 0, '2020-08-05 13:59:17', '2020-10-14 09:59:12');
INSERT INTO `user_address` VALUES (2, '张三', '123456', '15927512321', '宁夏回族自治区', '石嘴山市', '惠农区', '杭州市西湖区 黄龙万科中心', '640205', '313213', 1, '2020-08-05 13:59:20', '2020-10-14 09:59:10');
INSERT INTO `user_address` VALUES (4, '张三', '123456', '13972728212', '台湾省', '彰化县', '鹿港镇', '杭州市西湖区 黄龙万科中心', '711778', '321312', 0, '2020-08-05 17:07:29', '2020-10-14 09:59:15');

SET FOREIGN_KEY_CHECKS = 1;
