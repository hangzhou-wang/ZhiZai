/*
Navicat MySQL Data Transfer

Source Server         : Jarvis
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : jarvis

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-04-27 18:02:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jarvis_user
-- ----------------------------
DROP TABLE IF EXISTS `jarvis_user`;
CREATE TABLE `jarvis_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL DEFAULT '',
  `registerDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(128) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jarvis_user
-- ----------------------------

-- ----------------------------
-- Table structure for jarvis_words
-- ----------------------------
DROP TABLE IF EXISTS `jarvis_words`;
CREATE TABLE `jarvis_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jarvis_words
-- ----------------------------
INSERT INTO `jarvis_words` VALUES ('4', '你是谁', '我的中文名字叫芝仔，英文名字叫Jarvis');
INSERT INTO `jarvis_words` VALUES ('5', '今天天气怎样', '对不起，气象局不愿意告诉我。还骂我不是人');
INSERT INTO `jarvis_words` VALUES ('6', '你的主人是谁', '王杭州');
INSERT INTO `jarvis_words` VALUES ('7', '你是', '我叫芝仔');
