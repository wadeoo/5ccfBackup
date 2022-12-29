/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50553 (5.5.53)
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 50553 (5.5.53)
 File Encoding         : 65001

 Date: 29/12/2022 23:19:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `ma_the_loai` int(11) NOT NULL AUTO_INCREMENT,
  `ten_the_loai` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mo_ta` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_the_loai`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '新款', '新潮衣饰');
INSERT INTO `category` VALUES (2, '促销', '促销品');
INSERT INTO `category` VALUES (3, '时尚', '不要落伍了');
INSERT INTO `category` VALUES (4, '男式', '男人的衣柜');
INSERT INTO `category` VALUES (5, '女式', '性感密码');
INSERT INTO `category` VALUES (6, '鞋类', '奔跑吧');
INSERT INTO `category` VALUES (7, '帽类', '时尚帽饰');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `ma_san_pham` int(11) NULL DEFAULT NULL,
  `ngay_mua` timestamp NULL DEFAULT NULL,
  `so_luong` int(11) NULL DEFAULT NULL,
  `thanh_tien` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_history`) USING BTREE,
  INDEX `fk_history_product`(`ma_san_pham`) USING BTREE,
  INDEX `fk_history_user`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (9, 15, 2, '2022-12-29 06:04:27', 2, 1040000);
INSERT INTO `history` VALUES (10, 15, 2, '2022-12-29 06:04:53', 2, 1040000);
INSERT INTO `history` VALUES (11, 15, 2, '2022-12-29 06:05:22', 2, 1040000);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ma_san_pham` int(11) NOT NULL AUTO_INCREMENT,
  `ma_the_loai` int(11) NULL DEFAULT NULL,
  `ten_san_pham` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hinh_anh` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gia_ban` double NULL DEFAULT NULL,
  `hang_san_xuat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `thong_tin` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_san_pham`) USING BTREE,
  INDEX `fk_product_category`(`ma_the_loai`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, '新款足立夹克', 'new.jpg', 100000, '3452', '热销');
INSERT INTO `product` VALUES (2, 2, '背心', 'nu1.jpg', 520000, '235235', '热销');
INSERT INTO `product` VALUES (3, 3, '短上衣', 'nostyle.jpg', 520000, '345', '热销');
INSERT INTO `product` VALUES (4, 4, '衬衫', 'nam.jpg', 520000, '3462346', '热销');
INSERT INTO `product` VALUES (5, 5, '粉色背心', 'nu2.jpg', 520000, '34632', '热销');
INSERT INTO `product` VALUES (6, 6, '女拖', 'dep.jpg', 520000, '2346', '热销');
INSERT INTO `product` VALUES (7, 7, '嘻哈平舌帽', 'non.jpg', 520000, '34646', '热销');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date NULL DEFAULT NULL,
  `gioitinh` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sdt` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (15, '123', '123', '2022-12-18', 'm', '123@123.com', '123', '123', '2');

SET FOREIGN_KEY_CHECKS = 1;
