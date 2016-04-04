/*
Navicat MySQL Data Transfer

Source Server         : local_utf8
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ui

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-03-30 15:34:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for meiui_rule
-- ----------------------------
DROP TABLE IF EXISTS `meiui_rule`;
CREATE TABLE `meiui_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_name` varchar(150) NOT NULL COMMENT '规则名称',
  `rule_value` text NOT NULL COMMENT '规则内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_rule
-- ----------------------------
INSERT INTO `meiui_rule` VALUES ('1', 'index_order', '8');
