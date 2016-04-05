/*
Navicat MySQL Data Transfer

Source Server         : local_utf8
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ui

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-05 22:17:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for meiui_app
-- ----------------------------
DROP TABLE IF EXISTS `meiui_app`;
CREATE TABLE `meiui_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `app_name` varchar(50) NOT NULL COMMENT 'APP名称',
  `app_sys` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '所属系统(1:android, 2:ios)',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '描述',
  `create_user` varchar(32) NOT NULL COMMENT '用户名',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `using_flag` tinyint(2) unsigned NOT NULL DEFAULT '3' COMMENT '状态1 显示  2 屏蔽 3 未审核通过',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_app
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for meiui_pic
-- ----------------------------
DROP TABLE IF EXISTS `meiui_pic`;
CREATE TABLE `meiui_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `app_id` int(10) NOT NULL COMMENT '图片归属APP_id',
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'APP名称',
  `pic_sys` tinyint(1) NOT NULL DEFAULT '2' COMMENT '所属系统(1:android, 2:ios)',
  `pic_url` varchar(250) NOT NULL DEFAULT '' COMMENT '图片URL 地址',
  `pic_w` int(6) NOT NULL DEFAULT '0' COMMENT '图片宽',
  `pic_h` int(6) NOT NULL DEFAULT '0' COMMENT '图片高',
  `brief` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_user` int(10) NOT NULL COMMENT '创建者id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `using_flag` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态1 未审核通过  2 删除 3 显示',
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  KEY `create_user` (`create_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic
-- ----------------------------

-- ----------------------------
-- Table structure for meiui_pic_link_tag
-- ----------------------------
DROP TABLE IF EXISTS `meiui_pic_link_tag`;
CREATE TABLE `meiui_pic_link_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `pic_id` int(10) NOT NULL COMMENT '图片id',
  `tag_id` int(10) NOT NULL COMMENT '分类标签ID',
  `tag_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '标签类型 1 用户  2 系统',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic_link_tag
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_search
-- ----------------------------
INSERT INTO `meiui_search` VALUES ('1', '邮箱提醒', '0', '1');
INSERT INTO `meiui_search` VALUES ('2', '权限申请', '0', '1');
INSERT INTO `meiui_search` VALUES ('3', '验证码', '0', '1');
INSERT INTO `meiui_search` VALUES ('4', '注册页面', '0', '1');
INSERT INTO `meiui_search` VALUES ('5', '通讯录', '0', '1');

-- ----------------------------
-- Table structure for meiui_tag
-- ----------------------------
DROP TABLE IF EXISTS `meiui_tag`;
CREATE TABLE `meiui_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名字',
  `create_user` varchar(32) NOT NULL COMMENT '创建用户名',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `tag_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态1 个人  2 系统',
  `using_flag` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态1 显示  2 屏蔽',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_tag
-- ----------------------------

-- ----------------------------
-- Table structure for meiui_user
-- ----------------------------
DROP TABLE IF EXISTS `meiui_user`;
CREATE TABLE `meiui_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `password` char(40) NOT NULL COMMENT '密码',
  `phone` varchar(18) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(70) NOT NULL COMMENT '邮箱',
  `created_at` int(10) unsigned NOT NULL COMMENT '时间戳',
  `source` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户来源 1微信 2网站注册 3后台用户',
  `del_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1正常 2为删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user
-- ----------------------------
INSERT INTO `meiui_user` VALUES ('1', 'meiui', '', 'http://www.meiui.me/img/head.jpg', '279b7af46ccf8220f88c8071bb1a6692589329be', '15068159661', 'meiui@meiui.me', '1458024235', '3', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_data
-- ----------------------------
INSERT INTO `meiui_user_data` VALUES ('1', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for meiui_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `meiui_user_tag`;
CREATE TABLE `meiui_user_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `pic_id` int(10) NOT NULL COMMENT '图片id',
  `tag_id` int(10) unsigned NOT NULL COMMENT '用户关联标签ID',
  `created_at` int(10) unsigned NOT NULL COMMENT '时间戳',
  `del_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1正常 2为删除',
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_tag
-- ----------------------------
