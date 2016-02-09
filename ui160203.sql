/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.11
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : ui

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-02-03 10:50:08
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_app
-- ----------------------------
INSERT INTO `meiui_app` VALUES ('1', 'facebook', 'IOS', 'pc', '', 'ds', '1,3', 'mk', '1');
INSERT INTO `meiui_app` VALUES ('2', 'wechat', 'IOS', 'no', 'np', 'shongshou', '2,1', 'mk', '1');
INSERT INTO `meiui_app` VALUES ('3', 'alipay', 'IOS', 'npoo', 'no', 'shouw', '2,4', 'kk', '3');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_classification
-- ----------------------------
INSERT INTO `meiui_classification` VALUES ('15', '0', '0', '0', '0', 'å¥¢åŽ', '0', '0', '1');
INSERT INTO `meiui_classification` VALUES ('14', '0', '0', '0', '0', 'æ‰å¹³åŒ–', '0', '0', '1');
INSERT INTO `meiui_classification` VALUES ('13', '0', '0', '0', '0', 'ç™»é™†', '0', '0', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_feedback
-- ----------------------------
INSERT INTO `meiui_feedback` VALUES ('8', '', '2147483647', 'meiui@163.com', '', '1453362801', '1', '12');
INSERT INTO `meiui_feedback` VALUES ('9', '', '12223', 'm2eiui@163.com', 'http://s2.51offer.com/school/diy/images/2014-11-25/vi_pic2.png , http://s2.51offer.com/school/diy/images/2014-11-25/vi_pic2.png', '1453363108', '1', 'sdsd');
INSERT INTO `meiui_feedback` VALUES ('10', '', '122233', 'm2ei2ui@163.com', '', '1453363257', '1', 'sdsd');
INSERT INTO `meiui_feedback` VALUES ('11', '', '1222332', '2m2ei2ui@163.com', '', '1453363278', '1', 'sdsd');
INSERT INTO `meiui_feedback` VALUES ('12', '', '2147483647', 'sds1d@123.com', '', '1453363715', '1', '1111');
INSERT INTO `meiui_feedback` VALUES ('13', 'meiui', '2147483647', 'sd2s1d@123.com', '', '1453363731', '1', '1111');
INSERT INTO `meiui_feedback` VALUES ('14', 'meiui', '1223', '112@12.com', '', '1453607260', '1', 'sdsddsd');

-- ----------------------------
-- Table structure for meiui_pic
-- ----------------------------
DROP TABLE IF EXISTS `meiui_pic`;
CREATE TABLE `meiui_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `app_id` int(10) NOT NULL COMMENT '图片归属APP_id',
  `pic_sys` tinyint(1) NOT NULL DEFAULT '2' COMMENT '所属系统(1:android, 2:ios)',
  `pic_url` varchar(250) NOT NULL DEFAULT '' COMMENT '图片封面图表',
  `pic_w` varchar(250) NOT NULL DEFAULT '' COMMENT '图片封面图表',
  `pic_h` varchar(250) NOT NULL DEFAULT '' COMMENT '图片封面图表',
  `brief` mediumtext NOT NULL COMMENT '简介',
  `create_by` int(10) NOT NULL COMMENT '创建者id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `using_flag` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态1 未审核通过  2 删除 3 显示',
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'APP名称',
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  KEY `create_by` (`create_by`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic
-- ----------------------------
INSERT INTO `meiui_pic` VALUES ('1', '2', '2', 'www.baidu.com/img/baidu_jgylogo3.gif', '240', '360', 'aaaaaaaaaaaaap', '6', '1453362031', '1', 'facebook');
INSERT INTO `meiui_pic` VALUES ('2', '1', '2', 'www.baidu.com/img/baidu_jgylogo3.gif', '180', '224', 'aaaaaaaaaaaaap', '6', '1453362031', '1', 'weichat');

-- ----------------------------
-- Table structure for meiui_pic_link_tag
-- ----------------------------
DROP TABLE IF EXISTS `meiui_pic_link_tag`;
CREATE TABLE `meiui_pic_link_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `pic_id` int(10) NOT NULL COMMENT '图片id',
  `tag_id` int(10) NOT NULL COMMENT '分类标签ID',
  `tag_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '标签类型 1 系统  2 用户',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名字',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic_link_tag
-- ----------------------------
INSERT INTO `meiui_pic_link_tag` VALUES ('1', '6', '1', '15', '2', 'å¥¢åŽ');
INSERT INTO `meiui_pic_link_tag` VALUES ('2', '6', '2', '14', '2', 'æ‰å¹³åŒ–');
INSERT INTO `meiui_pic_link_tag` VALUES ('3', '7', '2', '13', '2', 'ç™»é™†');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_search
-- ----------------------------
INSERT INTO `meiui_search` VALUES ('1', 'æœç´¢', '0', '1');
INSERT INTO `meiui_search` VALUES ('2', 'æœç´¢', '0', '2');
INSERT INTO `meiui_search` VALUES ('3', 'æœç´¢å•Š', '0', '1');
INSERT INTO `meiui_search` VALUES ('4', 'awsa', '0', '2');
INSERT INTO `meiui_search` VALUES ('5', 'wpq', '0', '2');
INSERT INTO `meiui_search` VALUES ('6', 'xc', '0', '2');
INSERT INTO `meiui_search` VALUES ('7', 'qq2w', '0', '2');

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
  `user_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_users
-- ----------------------------
INSERT INTO `meiui_users` VALUES ('6', 'meiui', '114f7111b5b1ffd5d27c1bb1d957ee889f4df4a7', '2147483647', 'meiui@163.com', '1453362031', '1', '1', '2', 'www.baidu.com/img/baidu_jgylogo3.gif');
INSERT INTO `meiui_users` VALUES ('7', 'wwy', 'ea2e099e93a3ecf4b80f66b5e128ead133c8e0d2', '123', 'sdsd@123.com', '1453362216', '1', '1', '2', 'www.baidu.com/img/baidu_jgylogo3.gif');
INSERT INTO `meiui_users` VALUES ('8', 'my455628442', '114f7111b5b1ffd5d27c1bb1d957ee889f4df4a7', '2147483647', 'my455628442@gmail.com', '1453431389', '2', '1', '2', 'www.baidu.com/img/baidu_jgylogo3.gif');
INSERT INTO `meiui_users` VALUES ('9', '12w', '114f7111b5b1ffd5d27c1bb1d957ee889f4df4a7', '123', 'qw2@123.com', '1453536315', '2', '1', '2', 'www.baidu.com/img/baidu_jgylogo3.gif');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_data
-- ----------------------------
INSERT INTO `meiui_user_data` VALUES ('3', '6', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('4', '7', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('5', '8', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('6', '9', '0', '0', '0');

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
