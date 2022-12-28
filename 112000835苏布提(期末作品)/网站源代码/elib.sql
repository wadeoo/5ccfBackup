/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50553 (5.5.53)
 Source Host           : localhost:3306
 Source Schema         : elib

 Target Server Type    : MySQL
 Target Server Version : 50553 (5.5.53)
 File Encoding         : 65001

 Date: 28/12/2022 16:18:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_book
-- ----------------------------
DROP TABLE IF EXISTS `e_book`;
CREATE TABLE `e_book`  (
  `CALLNO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AUTHOR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PUBLISHER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `QUANTITY` decimal(8, 0) NULL DEFAULT NULL,
  `ISSUED` decimal(8, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`CALLNO`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_book
-- ----------------------------
INSERT INTO `e_book` VALUES ('1', '1', '1', '1', 1, 0);

-- ----------------------------
-- Table structure for e_issuebook
-- ----------------------------
DROP TABLE IF EXISTS `e_issuebook`;
CREATE TABLE `e_issuebook`  (
  `CALLNO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STUDENTID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STUDENTNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STUDENTMOBILE` decimal(8, 0) NULL DEFAULT NULL,
  `ISSUEDDATE` datetime NULL DEFAULT NULL,
  `RETURNSTATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_issuebook
-- ----------------------------
INSERT INTO `e_issuebook` VALUES ('1', '123', '123', 123, '2022-12-28 00:00:00', 'yes');

-- ----------------------------
-- Table structure for e_librarian
-- ----------------------------
DROP TABLE IF EXISTS `e_librarian`;
CREATE TABLE `e_librarian`  (
  `ID` int(8) NOT NULL DEFAULT 1 AUTO_INCREMENT,
  `NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MOBILE` decimal(8, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_librarian
-- ----------------------------
INSERT INTO `e_librarian` VALUES (123, '123', '123', '123@123.com', 123);
INSERT INTO `e_librarian` VALUES (1, '5', '5', '5@5.com', 6);

SET FOREIGN_KEY_CHECKS = 1;
