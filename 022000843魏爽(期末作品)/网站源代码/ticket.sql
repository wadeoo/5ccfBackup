/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50553 (5.5.53)
 Source Host           : localhost:3306
 Source Schema         : ticket

 Target Server Type    : MySQL
 Target Server Version : 50553 (5.5.53)
 File Encoding         : 65001

 Date: 02/01/2023 15:52:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE Database  `ticket`;
use `ticket`;

-- ----------------------------
-- Table structure for moviedatabase
-- ----------------------------
DROP TABLE IF EXISTS `moviedatabase`;
CREATE TABLE `moviedatabase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `genere` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration` int(11) NULL DEFAULT NULL,
  `director` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of moviedatabase
-- ----------------------------
INSERT INTO `moviedatabase` VALUES (11, '我不是药神', '剧情', 150, '文牧野');
INSERT INTO `moviedatabase` VALUES (12, '独行月球', '科幻', 190, '张吃鱼');
INSERT INTO `moviedatabase` VALUES (13, '复仇者联盟1', '动作', 150, ' 佐斯·韦顿');
INSERT INTO `moviedatabase` VALUES (15, '独行月球', '科幻', 120, '张迟昱');

-- ----------------------------
-- Table structure for shows
-- ----------------------------
DROP TABLE IF EXISTS `shows`;
CREATE TABLE `shows`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MId` int(11) NULL DEFAULT NULL,
  `screen` int(11) NULL DEFAULT NULL,
  `slot` int(11) NULL DEFAULT NULL,
  `booked` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `MId`(`MId`) USING BTREE,
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`MId`) REFERENCES `moviedatabase` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shows
-- ----------------------------
INSERT INTO `shows` VALUES (6, 11, 1, 3, 0);
INSERT INTO `shows` VALUES (7, 12, 2, 3, 2);
INSERT INTO `shows` VALUES (8, 13, 3, 3, 0);
INSERT INTO `shows` VALUES (10, 11, 1, 1, 0);
INSERT INTO `shows` VALUES (11, 12, 2, 1, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'USA',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
