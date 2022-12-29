/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50553 (5.5.53)
 Source Host           : localhost:3306
 Source Schema         : fee

 Target Server Type    : MySQL
 Target Server Version : 50553 (5.5.53)
 File Encoding         : 65001

 Date: 29/12/2022 15:05:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fee_accountant
-- ----------------------------
DROP TABLE IF EXISTS `fee_accountant`;
CREATE TABLE `fee_accountant`  (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTACT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fee_accountant
-- ----------------------------
INSERT INTO `fee_accountant` VALUES (5, '12', '12@qq.com', '12', '12', '12');

-- ----------------------------
-- Table structure for fee_student
-- ----------------------------
DROP TABLE IF EXISTS `fee_student`;
CREATE TABLE `fee_student`  (
  `ROLLNO` int(200) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEX` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COURSE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FEE` decimal(8, 0) NULL DEFAULT NULL,
  `PAID` decimal(8, 0) NULL DEFAULT NULL,
  `DUE` decimal(8, 0) NULL DEFAULT NULL,
  `ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTACT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLLNO`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fee_student
-- ----------------------------
INSERT INTO `fee_student` VALUES (4, '2', '2@qq.com', 'm', 'PHP', 2, 2, 2, '2', '2');
INSERT INTO `fee_student` VALUES (2, '1', '1@1.com', 'f', 'Java', 1, 1, 0, '1', '1');

SET FOREIGN_KEY_CHECKS = 1;
