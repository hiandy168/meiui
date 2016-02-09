/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ui

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-01-21 16:13:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for meiui_app
-- ----------------------------
DROP TABLE IF EXISTS `meiui_app`;
CREATE TABLE `meiui_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `app_name` varchar(50) NOT NULL COMMENT 'APP名称',
  `app_sys` varchar(50) NOT NULL DEFAULT 'IOS' COMMENT '所属系统',
  `using_pic` varchar(150) NOT NULL DEFAULT '' COMMENT '图片封面图表',
  `array_pic` mediumtext NOT NULL COMMENT '数组图片多图',
  `description` mediumtext NOT NULL COMMENT '描述',
  `app_classification` varchar(150) NOT NULL DEFAULT '' COMMENT '分类相关 逗号分开',
  `create_by` varchar(150) NOT NULL DEFAULT '' COMMENT '创建者',
  `using_flag` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态1 显示  2 屏蔽 3 未审核通过',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_app
-- ----------------------------
INSERT INTO `meiui_app` VALUES ('1', 'as', 'IOS', 'pc', '', 'ds', '1,3', 'mk', '1');

-- ----------------------------
-- Table structure for meiui_classification
-- ----------------------------
DROP TABLE IF EXISTS `meiui_classification`;
CREATE TABLE `meiui_classification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上一级分类 如果没有上级分类 默认0 ',
  `arrparentid` varchar(255) NOT NULL DEFAULT '0' COMMENT '拥有的所有上级分类，逗号分开 0,1,2',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否拥有子分类 有1 没有0',
  `arrchildid` varchar(255) NOT NULL DEFAULT '0' COMMENT '拥有的所有子分类，逗号分开 0,1,2',
  `catname` varchar(30) NOT NULL COMMENT '分类名字',
  `image_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类下图片数',
  `user_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类关联用户数',
  `using_flag` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1正常 2屏蔽',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_classification
-- ----------------------------
INSERT INTO `meiui_classification` VALUES ('1', '0', '0', '0', '0', 'fenlei1', '2', '3', '1');
INSERT INTO `meiui_classification` VALUES ('2', '0', '0', '0', '0', 'fenlei2', '5', '4', '1');
INSERT INTO `meiui_classification` VALUES ('3', '0', '0', '0', '0', 'as', '0', '0', '1');
INSERT INTO `meiui_classification` VALUES ('7', '0', '0', '0', '0', 'æˆ‘åŽ»', '0', '0', '1');
INSERT INTO `meiui_classification` VALUES ('6', '0', '0', '0', '0', 'asss', '0', '0', '1');
INSERT INTO `meiui_classification` VALUES ('8', '0', '0', '0', '0', 'æ›¹', '0', '0', '1');
INSERT INTO `meiui_classification` VALUES ('9', '0', '0', '0', '0', 'åˆ†ç±»åç§°', '0', '0', '1');

-- ----------------------------
-- Table structure for meiui_feedback
-- ----------------------------
DROP TABLE IF EXISTS `meiui_feedback`;
CREATE TABLE `meiui_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` int(18) NOT NULL COMMENT '手机号',
  `email` varchar(70) NOT NULL DEFAULT '' COMMENT '邮箱',
  `pic_arr` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `created_at` int(10) unsigned NOT NULL COMMENT '时间戳',
  `msg_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1未处理 2已处理',
  `msg` varchar(255) NOT NULL COMMENT '反映问题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_feedback
-- ----------------------------
INSERT INTO `meiui_feedback` VALUES ('8', '', '2147483647', 'meiui@163.com', '', '1453362801', '1', '12');
INSERT INTO `meiui_feedback` VALUES ('9', '', '12223', 'm2eiui@163.com', '', '1453363108', '1', 'sdsd');
INSERT INTO `meiui_feedback` VALUES ('10', '', '122233', 'm2ei2ui@163.com', '', '1453363257', '1', 'sdsd');
INSERT INTO `meiui_feedback` VALUES ('11', '', '1222332', '2m2ei2ui@163.com', '', '1453363278', '1', 'sdsd');
INSERT INTO `meiui_feedback` VALUES ('12', '', '2147483647', 'sds1d@123.com', '', '1453363715', '1', '1111');
INSERT INTO `meiui_feedback` VALUES ('13', 'meiui', '2147483647', 'sd2s1d@123.com', '', '1453363731', '1', '1111');

-- ----------------------------
-- Table structure for meiui_search
-- ----------------------------
DROP TABLE IF EXISTS `meiui_search`;
CREATE TABLE `meiui_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `keyword` varchar(150) NOT NULL COMMENT '关键词',
  `image_count` varchar(70) NOT NULL DEFAULT '0' COMMENT '分类下图片数',
  `del_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1未删除 2删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_search
-- ----------------------------
INSERT INTO `meiui_search` VALUES ('1', 'æœç´¢', '0', '1');
INSERT INTO `meiui_search` VALUES ('2', 'æœç´¢', '0', '1');
INSERT INTO `meiui_search` VALUES ('3', 'æœç´¢å•Š', '0', '1');

-- ----------------------------
-- Table structure for meiui_users
-- ----------------------------
DROP TABLE IF EXISTS `meiui_users`;
CREATE TABLE `meiui_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` char(40) NOT NULL COMMENT '密码',
  `phone` int(18) NOT NULL COMMENT '手机号',
  `email` varchar(70) NOT NULL COMMENT '邮箱',
  `created_at` int(10) unsigned NOT NULL COMMENT '时间戳',
  `del_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1正常 2为删除',
  `group` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组类型普通用户1，后台用户2',
  `source` tinyint(1) NOT NULL DEFAULT '2' COMMENT '用户来源 1微信 2网站注册',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_users
-- ----------------------------
INSERT INTO `meiui_users` VALUES ('6', 'meiui', '114f7111b5b1ffd5d27c1bb1d957ee889f4df4a7', '2147483647', 'meiui@163.com', '1453362031', '1', '1', '2');
INSERT INTO `meiui_users` VALUES ('7', 'wwy', 'ea2e099e93a3ecf4b80f66b5e128ead133c8e0d2', '123', 'sdsd@123.com', '1453362216', '1', '1', '2');

-- ----------------------------
-- Table structure for meiui_user_data
-- ----------------------------
DROP TABLE IF EXISTS `meiui_user_data`;
CREATE TABLE `meiui_user_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `user_collection_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户收藏总数',
  `user_classification_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户相关分类总数',
  `user_upload_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户上传总数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_data
-- ----------------------------
INSERT INTO `meiui_user_data` VALUES ('3', '6', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('4', '7', '0', '0', '0');

-- ----------------------------
-- Table structure for meiui_user_link_classification
-- ----------------------------
DROP TABLE IF EXISTS `meiui_user_link_classification`;
CREATE TABLE `meiui_user_link_classification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `user_classification` int(10) unsigned NOT NULL COMMENT '用户相关分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_link_classification
-- ----------------------------

-- ----------------------------
-- Table structure for meiui_user_link_collection
-- ----------------------------
DROP TABLE IF EXISTS `meiui_user_link_collection`;
CREATE TABLE `meiui_user_link_collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `user_collection` int(10) unsigned NOT NULL COMMENT '用户收藏ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_link_collection
-- ----------------------------
