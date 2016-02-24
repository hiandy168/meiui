/*
Navicat MySQL Data Transfer

Source Server         : local_utf8
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ui

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-02-24 11:02:47
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
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_app
-- ----------------------------
INSERT INTO `meiui_app` VALUES ('8', 'path', '2', '', '1', '1453362801', '3');
INSERT INTO `meiui_app` VALUES ('9', 'twitter', '2', '', '2', '1453362801', '3');
INSERT INTO `meiui_app` VALUES ('10', 'wechat', '2', '', '3', '1453362801', '3');
INSERT INTO `meiui_app` VALUES ('11', 'facebook', '2', '', '6', '1453362801', '3');
INSERT INTO `meiui_app` VALUES ('84', 'Enjoy', '2', '', '4', '1455892696', '3');
INSERT INTO `meiui_app` VALUES ('85', 'Like', '2', '', '4', '1455892696', '3');
INSERT INTO `meiui_app` VALUES ('88', '生辰', '2', '', '4', '1456122020', '3');
INSERT INTO `meiui_app` VALUES ('89', '留白', '2', '', '4', '1456122020', '3');

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
  `app_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'APP名称',
  `pic_sys` tinyint(1) NOT NULL DEFAULT '2' COMMENT '所属系统(1:android, 2:ios)',
  `pic_url` varchar(250) NOT NULL DEFAULT '' COMMENT '图片URL 地址',
  `pic_w` int(6) NOT NULL DEFAULT '0' COMMENT '图片宽',
  `pic_h` int(6) NOT NULL DEFAULT '0' COMMENT '图片高',
  `brief` mediumtext NOT NULL COMMENT '简介',
  `create_user` int(10) NOT NULL COMMENT '创建者id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `using_flag` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态1 未审核通过  2 删除 3 显示',
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  KEY `create_user` (`create_user`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic
-- ----------------------------
INSERT INTO `meiui_pic` VALUES ('1', '8', 'path', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E6%B3%A8%E5%86%8C%EF%BC%8C%E7%99%BB%E5%BD%95.jpg', '750', '1334', 'null brief default', '6', '1453362801', '2');
INSERT INTO `meiui_pic` VALUES ('2', '8', 'path', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E8%B4%A6%E5%8F%B7%E9%AA%8C%E8%AF%81.jpg', '750', '1334', 'null brief default', '6', '1453362801', '3');
INSERT INTO `meiui_pic` VALUES ('3', '8', 'path', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E5%A4%B4%E5%83%8F%E8%AE%BE%E7%BD%AE.jpg', '750', '1334', 'null brief default', '6', '1453362801', '3');
INSERT INTO `meiui_pic` VALUES ('4', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E4%BF%A1%E6%81%AF%E6%B5%81.jpg', '750', '1334', 'null brief default', '6', '1453362801', '3');
INSERT INTO `meiui_pic` VALUES ('5', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E5%A4%B4%E5%83%8F%E8%AE%BE%E7%BD%AE.jpg', '750', '1334', 'null brief default', '6', '1453362801', '3');
INSERT INTO `meiui_pic` VALUES ('12', '84', 'Enjoy', '2', '127.0.0.1/load/init_data/APP/Enjoy/信息流.jpg', '750', '1334', 'brief default tag  Enjoy,信息流', '4', '1455955960', '1');
INSERT INTO `meiui_pic` VALUES ('6', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E5%BC%95%E5%AF%BC%E9%A1%B5.jpg', '750', '1334', 'null brief default', '6', '1453362801', '1');
INSERT INTO `meiui_pic` VALUES ('7', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E6%90%9C%E7%B4%A2.jpg', '750', '1334', 'null brief default', '6', '1453362801', '1');
INSERT INTO `meiui_pic` VALUES ('8', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E9%80%89%E6%8B%A9%E6%8E%A7%E4%BB%B6.jpg', '750', '1334', 'null brief default', '6', '1453362801', '1');
INSERT INTO `meiui_pic` VALUES ('9', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E9%82%AE%E7%AE%B1%E8%AE%BE%E7%BD%AE.jpg', '750', '1334', 'null brief default', '6', '1453362801', '1');
INSERT INTO `meiui_pic` VALUES ('10', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E5%A4%B4%E5%83%8F%E8%AE%BE%E7%BD%AE.jpg', '750', '1334', 'null brief default', '6', '1453362801', '1');
INSERT INTO `meiui_pic` VALUES ('11', '8', 'twitter', '2', 'http://7nar8n.com1.z0.glb.clouddn.com/%E5%A4%B4%E5%83%8F%E8%AE%BE%E7%BD%AE.jpg', '750', '1334', 'null brief default', '6', '1453362801', '1');
INSERT INTO `meiui_pic` VALUES ('50', '84', 'Enjoy', '2', '52.68.155.92/load/init_data/APP/Enjoy/信息流.jpg', '750', '1334', 'brief default tag  Enjoy,信息流', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('51', '84', 'Enjoy', '2', '52.68.155.92/load/init_data/APP/Enjoy/找回密码.jpg', '750', '1334', 'brief default tag  Enjoy,找回密码', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('52', '84', 'Enjoy', '2', '52.68.155.92/load/init_data/APP/Enjoy/注册.jpg', '750', '1334', 'brief default tag  Enjoy,注册', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('53', '84', 'Enjoy', '2', '52.68.155.92/load/init_data/APP/Enjoy/浮层.jpg', '750', '1334', 'brief default tag  Enjoy,浮层', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('54', '84', 'Enjoy', '2', '52.68.155.92/load/init_data/APP/Enjoy/用户协议.jpg', '750', '1334', 'brief default tag  Enjoy,用户协议', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('55', '85', 'Like', '2', '52.68.155.92/load/init_data/APP/Like/信息流.jpg', '750', '1334', 'brief default tag  Like,信息流', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('56', '85', 'Like', '2', '52.68.155.92/load/init_data/APP/Like/引导页.jpg', '750', '1334', 'brief default tag  Like,引导页', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('57', '85', 'Like', '2', '52.68.155.92/load/init_data/APP/Like/标签.jpg', '750', '1334', 'brief default tag  Like,标签', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('58', '85', 'Like', '2', '52.68.155.92/load/init_data/APP/Like/注册，登录.jpg', '750', '1334', 'brief default tag  Like,注册，登录', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('59', '85', 'Like', '2', '52.68.155.92/load/init_data/APP/Like/浮层.jpg', '750', '1334', 'brief default tag  Like,浮层', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('60', '8', 'path', '2', '52.68.155.92/load/init_data/APP/Path/注册，登录.jpg', '750', '1334', 'brief default tag  Path,注册，登录', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('61', '8', 'path', '2', '52.68.155.92/load/init_data/APP/Path/账号验证.jpg', '750', '1334', 'brief default tag  Path,账号验证', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('62', '8', 'path', '2', '52.68.155.92/load/init_data/APP/Path/验证码.jpg', '750', '1334', 'brief default tag  Path,验证码', '4', '1456110287', '1');
INSERT INTO `meiui_pic` VALUES ('63', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/信息流.jpg', '750', '1334', 'brief default tag  Twitter,信息流', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('64', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/头像设置.jpg', '750', '1334', 'brief default tag  Twitter,头像设置', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('65', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/引导页.jpg', '750', '1334', 'brief default tag  Twitter,引导页', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('66', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/搜索.jpg', '750', '1334', 'brief default tag  Twitter,搜索', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('67', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/极简，头像设置.jpg', '750', '1334', 'brief default tag  Twitter,极简，头像设置', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('68', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/标签，个人资料.jpg', '750', '1334', 'brief default tag  Twitter,标签，个人资料', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('69', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/注册，登录.jpg', '750', '1334', 'brief default tag  Twitter,注册，登录', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('70', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/详情页.jpg', '750', '1334', 'brief default tag  Twitter,详情页', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('71', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/选择控件.jpg', '750', '1334', 'brief default tag  Twitter,选择控件', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('72', '9', 'twitter', '2', '52.68.155.92/load/init_data/APP/Twitter/邮箱设置.jpg', '750', '1334', 'brief default tag  Twitter,邮箱设置', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('73', '86', '生辰', '2', '52.68.155.92/load/init_data/APP/生辰/极简、纯黑.jpg', '750', '1334', 'brief default tag  生辰,极简、纯黑', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('74', '86', '生辰', '2', '52.68.155.92/load/init_data/APP/生辰/极简，纯白.jpg', '750', '1334', 'brief default tag  生辰,极简，纯白', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('75', '86', '生辰', '2', '52.68.155.92/load/init_data/APP/生辰/选择控件.jpg', '750', '1334', 'brief default tag  生辰,选择控件', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('76', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/个人资料，修改信息.jpg', '750', '1334', 'brief default tag  留白,个人资料，修改信息', '4', '1456110288', '1');
INSERT INTO `meiui_pic` VALUES ('77', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/举报.jpg', '750', '1334', 'brief default tag  留白,举报', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('78', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/修改头像.jpg', '750', '1334', 'brief default tag  留白,修改头像', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('79', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/弹层，分享.jpg', '750', '1334', 'brief default tag  留白,弹层，分享', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('80', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/手机注册，极简.jpg', '750', '1334', 'brief default tag  留白,手机注册，极简', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('81', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/抽屉式.jpg', '750', '1334', 'brief default tag  留白,抽屉式', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('82', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/搜索，关注.jpg', '750', '1334', 'brief default tag  留白,搜索，关注', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('83', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/模板，cover.jpg', '750', '1334', 'brief default tag  留白,模板，cover', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('84', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/注册，个人资料.jpg', '750', '1334', 'brief default tag  留白,注册，个人资料', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('85', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/滤镜选择.jpg', '750', '1334', 'brief default tag  留白,滤镜选择', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('86', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/登录，微信登录.jpg', '750', '1334', 'brief default tag  留白,登录，微信登录', '4', '1456110289', '1');
INSERT INTO `meiui_pic` VALUES ('87', '87', '留白', '2', '52.68.155.92/load/init_data/APP/留白/详情页.jpg', '750', '1334', 'brief default tag  留白,详情页', '4', '1456110289', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic_link_tag
-- ----------------------------
INSERT INTO `meiui_pic_link_tag` VALUES ('1', '6', '1', '1', '2', 'sign');
INSERT INTO `meiui_pic_link_tag` VALUES ('2', '6', '1', '2', '2', 'login');
INSERT INTO `meiui_pic_link_tag` VALUES ('3', '6', '2', '3', '2', 'validate');
INSERT INTO `meiui_pic_link_tag` VALUES ('4', '6', '1', '5', '2', 'path');
INSERT INTO `meiui_pic_link_tag` VALUES ('5', '6', '11', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('6', '6', '10', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('7', '6', '9', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('8', '6', '8', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('9', '6', '7', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('10', '6', '6', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('11', '6', '5', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('12', '6', '4', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('13', '6', '6', '6', '2', 'search');
INSERT INTO `meiui_pic_link_tag` VALUES ('14', '6', '7', '7', '2', 'blue_search');
INSERT INTO `meiui_pic_link_tag` VALUES ('15', '6', '3', '8', '2', 'user_pic');
INSERT INTO `meiui_pic_link_tag` VALUES ('241', '4', '50', '57', '2', '信息流');
INSERT INTO `meiui_pic_link_tag` VALUES ('242', '4', '50', '58', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('243', '4', '51', '59', '2', '找回密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('244', '4', '51', '58', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('245', '4', '52', '60', '2', '注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('246', '4', '52', '58', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('247', '4', '53', '61', '2', '浮层');
INSERT INTO `meiui_pic_link_tag` VALUES ('248', '4', '53', '58', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('249', '4', '54', '62', '2', '用户协议');
INSERT INTO `meiui_pic_link_tag` VALUES ('250', '4', '54', '58', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('251', '4', '55', '57', '2', '信息流');
INSERT INTO `meiui_pic_link_tag` VALUES ('252', '4', '55', '63', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('253', '4', '56', '64', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('254', '4', '56', '63', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('255', '4', '57', '65', '2', '标签');
INSERT INTO `meiui_pic_link_tag` VALUES ('256', '4', '57', '63', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('257', '4', '58', '60', '2', '注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('258', '4', '58', '66', '2', '登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('259', '4', '58', '63', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('260', '4', '59', '61', '2', '浮层');
INSERT INTO `meiui_pic_link_tag` VALUES ('261', '4', '59', '63', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('262', '4', '60', '60', '2', '注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('263', '4', '60', '66', '2', '登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('264', '4', '60', '5', '2', 'path');
INSERT INTO `meiui_pic_link_tag` VALUES ('265', '4', '61', '67', '2', '账号验证');
INSERT INTO `meiui_pic_link_tag` VALUES ('266', '4', '61', '5', '2', 'path');
INSERT INTO `meiui_pic_link_tag` VALUES ('267', '4', '62', '68', '2', '验证码');
INSERT INTO `meiui_pic_link_tag` VALUES ('268', '4', '62', '5', '2', 'path');
INSERT INTO `meiui_pic_link_tag` VALUES ('269', '4', '63', '57', '2', '信息流');
INSERT INTO `meiui_pic_link_tag` VALUES ('270', '4', '63', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('271', '4', '64', '69', '2', '头像设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('272', '4', '64', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('273', '4', '65', '64', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('274', '4', '65', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('275', '4', '66', '70', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('276', '4', '66', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('277', '4', '67', '71', '2', '极简');
INSERT INTO `meiui_pic_link_tag` VALUES ('278', '4', '67', '69', '2', '头像设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('279', '4', '67', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('280', '4', '68', '65', '2', '标签');
INSERT INTO `meiui_pic_link_tag` VALUES ('281', '4', '68', '72', '2', '个人资料');
INSERT INTO `meiui_pic_link_tag` VALUES ('282', '4', '68', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('283', '4', '69', '60', '2', '注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('284', '4', '69', '66', '2', '登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('285', '4', '69', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('286', '4', '70', '73', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('287', '4', '70', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('288', '4', '71', '74', '2', '选择控件');
INSERT INTO `meiui_pic_link_tag` VALUES ('289', '4', '71', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('290', '4', '72', '75', '2', '邮箱设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('291', '4', '72', '4', '2', 'twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('292', '4', '73', '76', '2', '极简、纯黑');
INSERT INTO `meiui_pic_link_tag` VALUES ('293', '4', '73', '77', '2', '生辰');
INSERT INTO `meiui_pic_link_tag` VALUES ('294', '4', '74', '71', '2', '极简');
INSERT INTO `meiui_pic_link_tag` VALUES ('295', '4', '74', '78', '2', '纯白');
INSERT INTO `meiui_pic_link_tag` VALUES ('296', '4', '74', '77', '2', '生辰');
INSERT INTO `meiui_pic_link_tag` VALUES ('297', '4', '75', '74', '2', '选择控件');
INSERT INTO `meiui_pic_link_tag` VALUES ('298', '4', '75', '77', '2', '生辰');
INSERT INTO `meiui_pic_link_tag` VALUES ('299', '4', '76', '72', '2', '个人资料');
INSERT INTO `meiui_pic_link_tag` VALUES ('300', '4', '76', '79', '2', '修改信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('301', '4', '76', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('302', '4', '77', '81', '2', '举报');
INSERT INTO `meiui_pic_link_tag` VALUES ('303', '4', '77', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('215', '4', '40', '36', '2', '修改头像');
INSERT INTO `meiui_pic_link_tag` VALUES ('216', '4', '40', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('217', '4', '41', '50', '2', '弹层');
INSERT INTO `meiui_pic_link_tag` VALUES ('218', '4', '41', '51', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('219', '4', '41', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('220', '4', '42', '52', '2', '手机注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('221', '4', '42', '46', '2', '极简');
INSERT INTO `meiui_pic_link_tag` VALUES ('222', '4', '42', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('223', '4', '43', '39', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('224', '4', '43', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('225', '4', '44', '26', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('226', '4', '44', '53', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('227', '4', '44', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('228', '4', '45', '54', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('229', '4', '45', '55', '2', 'cover');
INSERT INTO `meiui_pic_link_tag` VALUES ('230', '4', '45', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('231', '4', '46', '17', '2', '注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('232', '4', '46', '47', '2', '个人资料');
INSERT INTO `meiui_pic_link_tag` VALUES ('233', '4', '46', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('234', '4', '47', '43', '2', '滤镜选择');
INSERT INTO `meiui_pic_link_tag` VALUES ('235', '4', '47', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('236', '4', '48', '45', '2', '登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('237', '4', '48', '56', '2', '微信登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('238', '4', '48', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('239', '4', '49', '29', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('240', '4', '49', '13', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('304', '4', '78', '82', '2', '修改头像');
INSERT INTO `meiui_pic_link_tag` VALUES ('305', '4', '78', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('306', '4', '79', '83', '2', '弹层');
INSERT INTO `meiui_pic_link_tag` VALUES ('307', '4', '79', '84', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('308', '4', '79', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('309', '4', '80', '85', '2', '手机注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('310', '4', '80', '71', '2', '极简');
INSERT INTO `meiui_pic_link_tag` VALUES ('311', '4', '80', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('312', '4', '81', '86', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('313', '4', '81', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('314', '4', '82', '70', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('315', '4', '82', '87', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('316', '4', '82', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('317', '4', '83', '88', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('318', '4', '83', '89', '2', 'cover');
INSERT INTO `meiui_pic_link_tag` VALUES ('319', '4', '83', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('320', '4', '84', '60', '2', '注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('321', '4', '84', '72', '2', '个人资料');
INSERT INTO `meiui_pic_link_tag` VALUES ('322', '4', '84', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('323', '4', '85', '90', '2', '滤镜选择');
INSERT INTO `meiui_pic_link_tag` VALUES ('324', '4', '85', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('325', '4', '86', '66', '2', '登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('326', '4', '86', '91', '2', '微信登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('327', '4', '86', '80', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('328', '4', '87', '73', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('329', '4', '87', '80', '2', '留白');

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
INSERT INTO `meiui_search` VALUES ('1', '搜索', '0', '1');
INSERT INTO `meiui_search` VALUES ('2', '搜索', '0', '2');
INSERT INTO `meiui_search` VALUES ('3', '搜索啊', '0', '1');
INSERT INTO `meiui_search` VALUES ('4', 'awsa', '0', '2');
INSERT INTO `meiui_search` VALUES ('5', 'wpq', '0', '2');
INSERT INTO `meiui_search` VALUES ('6', 'xc', '0', '2');
INSERT INTO `meiui_search` VALUES ('7', 'qq2w', '0', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_tag
-- ----------------------------
INSERT INTO `meiui_tag` VALUES ('1', 'sign', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('2', 'login', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('3', 'validate', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('4', 'twitter', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('5', 'path', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('6', 'search', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('7', 'blue_search', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('8', 'user_pic', '6', '1453362801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('57', '信息流', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('58', 'Enjoy', '4', '1456110287', '2', '2');
INSERT INTO `meiui_tag` VALUES ('59', '找回密码', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('60', '注册', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('61', '浮层', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('62', '用户协议', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('63', 'Like', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('64', '引导页', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('65', '标签', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('66', '登录', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('67', '账号验证', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('68', '验证码', '4', '1456110287', '2', '1');
INSERT INTO `meiui_tag` VALUES ('69', '头像设置', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('70', '搜索', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('71', '极简', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('72', '个人资料', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('73', '详情页', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('74', '选择控件', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('75', '邮箱设置', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('76', '极简、纯黑', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('77', '生辰', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('78', '纯白', '4', '1456110288', '2', '1');
INSERT INTO `meiui_tag` VALUES ('79', '修改信息', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('80', '留白', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('81', '举报', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('82', '修改头像', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('83', '弹层', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('84', '分享', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('85', '手机注册', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('86', '抽屉式', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('87', '关注', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('88', '模板', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('89', 'cover', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('90', '滤镜选择', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('91', '微信登录', '4', '1456110289', '2', '1');
INSERT INTO `meiui_tag` VALUES ('92', 'ttst', '4', '1456124116', '1', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user
-- ----------------------------
INSERT INTO `meiui_user` VALUES ('3', 'meiui_b', '11', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_b@meiui.com', '1455702365', '1', '1');
INSERT INTO `meiui_user` VALUES ('4', 'meiui', '1', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui@meiui.com', '1455702380', '1', '1');
INSERT INTO `meiui_user` VALUES ('5', 'meiui_c', '1', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_c@meiui.com', '1455702473', '1', '1');
INSERT INTO `meiui_user` VALUES ('6', 'meiui_d', '1', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_d@meiui.com', '1455702481', '1', '1');
INSERT INTO `meiui_user` VALUES ('7', 'meiui_e', '1', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_e@meiui.com', '1455702487', '1', '1');
INSERT INTO `meiui_user` VALUES ('8', 'meiui_f', '1', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_f@meiui.com', '1455702494', '1', '1');
INSERT INTO `meiui_user` VALUES ('9', 'meiui_g', '1', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_g@meiui.com', '1455702502', '1', '1');
INSERT INTO `meiui_user` VALUES ('10', 'meiui_h', '1', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_h@meiui.com', '1455702509', '1', '1');
INSERT INTO `meiui_user` VALUES ('11', 'meiui_i', '12', 'http://7nar8n.com1.z0.glb.clouddn.com/u%3D26322481%2C1670928949%26fm%3D11%26gp%3D0.jpg', 'bf4cf01376edbc82263a6d5e6ff034c03ae04200', '15068159661', 'meiui_i@meiui.com', '1455702516', '1', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_data
-- ----------------------------
INSERT INTO `meiui_user_data` VALUES ('10', '3', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('11', '4', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('12', '5', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('13', '6', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('14', '7', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('15', '8', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('16', '9', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('17', '10', '0', '0', '0');
INSERT INTO `meiui_user_data` VALUES ('18', '11', '0', '0', '0');

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

-- ----------------------------
-- Table structure for meiui_user_link_tag
-- ----------------------------
DROP TABLE IF EXISTS `meiui_user_link_tag`;
CREATE TABLE `meiui_user_link_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `user_tag` int(10) unsigned NOT NULL COMMENT '用户相关分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_user_link_tag
-- ----------------------------
