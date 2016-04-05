/*
Navicat MySQL Data Transfer

Source Server         : local_utf8
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ui

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-05 22:37:10
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_app
-- ----------------------------
INSERT INTO `meiui_app` VALUES ('1', 'AirVisual', '2', '', '1', '1459866800', '3');
INSERT INTO `meiui_app` VALUES ('2', 'Day One', '2', '', '1', '1459866801', '3');
INSERT INTO `meiui_app` VALUES ('3', 'Enjoy', '2', '', '1', '1459866803', '3');
INSERT INTO `meiui_app` VALUES ('4', 'IF', '2', '', '1', '1459866804', '3');
INSERT INTO `meiui_app` VALUES ('5', 'Inbox', '2', '', '1', '1459866805', '3');
INSERT INTO `meiui_app` VALUES ('6', 'Like', '2', '', '1', '1459866806', '3');
INSERT INTO `meiui_app` VALUES ('7', 'Notability', '2', '', '1', '1459866807', '3');
INSERT INTO `meiui_app` VALUES ('8', 'OPEN开腔', '2', '', '1', '1459866808', '3');
INSERT INTO `meiui_app` VALUES ('9', 'Paper', '2', '', '1', '1459866808', '3');
INSERT INTO `meiui_app` VALUES ('10', 'Paper 53', '2', '', '1', '1459866809', '3');
INSERT INTO `meiui_app` VALUES ('11', 'Path', '2', '', '1', '1459866810', '3');
INSERT INTO `meiui_app` VALUES ('12', 'Sleep Cycle', '2', '', '1', '1459866811', '3');
INSERT INTO `meiui_app` VALUES ('13', 'Steller', '2', '', '1', '1459866811', '3');
INSERT INTO `meiui_app` VALUES ('14', 'Twitter', '2', '', '1', '1459866813', '3');
INSERT INTO `meiui_app` VALUES ('15', 'ZERO', '2', '', '1', '1459866814', '3');
INSERT INTO `meiui_app` VALUES ('16', '匠物', '2', '', '1', '1459866815', '3');
INSERT INTO `meiui_app` VALUES ('17', '彩云天气', '2', '', '1', '1459866816', '3');
INSERT INTO `meiui_app` VALUES ('18', '懒人天气', '2', '', '1', '1459866817', '3');
INSERT INTO `meiui_app` VALUES ('19', '我的天气', '2', '', '1', '1459866817', '3');
INSERT INTO `meiui_app` VALUES ('20', '每日故宫', '2', '', '1', '1459866818', '3');
INSERT INTO `meiui_app` VALUES ('21', '用家', '2', '', '1', '1459866819', '3');
INSERT INTO `meiui_app` VALUES ('22', '留白', '2', '', '1', '1459866819', '3');
INSERT INTO `meiui_app` VALUES ('23', '空气监测站', '2', '', '1', '1459866821', '3');
INSERT INTO `meiui_app` VALUES ('24', '糗事百科', '2', '', '1', '1459866822', '3');
INSERT INTO `meiui_app` VALUES ('25', '艺术云图', '2', '', '1', '1459866823', '3');
INSERT INTO `meiui_app` VALUES ('26', '艺术狗', '2', '', '1', '1459866824', '3');
INSERT INTO `meiui_app` VALUES ('27', '薄荷家居', '2', '', '1', '1459866826', '3');
INSERT INTO `meiui_app` VALUES ('28', '雨时', '2', '', '1', '1459866827', '3');

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
) ENGINE=MyISAM AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic
-- ----------------------------
INSERT INTO `meiui_pic` VALUES ('1', '1', 'AirVisual', '2', 'http://www.meiui.me/load/init_data/APP/AirVisual/空气质量，列表，卡片式.PNG', '750', '1334', '', '1', '1459866800', '1');
INSERT INTO `meiui_pic` VALUES ('2', '1', 'AirVisual', '2', 'http://www.meiui.me/load/init_data/APP/AirVisual/空气质量，地图，搜索.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('3', '1', 'AirVisual', '2', 'http://www.meiui.me/load/init_data/APP/AirVisual/空气质量，地图，详情页.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('4', '1', 'AirVisual', '2', 'http://www.meiui.me/load/init_data/APP/AirVisual/空气质量，详情页，天气.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('5', '1', 'AirVisual', '2', 'http://www.meiui.me/load/init_data/APP/AirVisual/空气质量，详情页，趋势图，地图.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('6', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/Timeline，列表.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('7', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/主页，日记，简约，列表.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('8', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/关于我们.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('9', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/同步，同步设置.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('10', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/排序，标签.PNG', '750', '1334', '', '1', '1459866801', '1');
INSERT INTO `meiui_pic` VALUES ('11', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/搜索结果.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('12', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/搜索，搜索栏.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('13', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/新建，日记，新增.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('14', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日历，日记.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('15', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日期选择，日期.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('16', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日记，上传照片.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('17', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日记，列表.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('18', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日记，列表，操作栏.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('19', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日记，城市设置.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('20', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日记，天气 .PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('21', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日记，收藏.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('22', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/日记，详情页.PNG', '750', '1334', '', '1', '1459866802', '1');
INSERT INTO `meiui_pic` VALUES ('23', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/标签，排序.PNG', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('24', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/程序密码，密码，解锁密码.PNG', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('25', '2', 'Day One', '2', 'http://www.meiui.me/load/init_data/APP/Day One/系统设置.PNG', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('26', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/上传照片.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('27', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/主页.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('28', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/主页，列表.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('29', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/优惠券.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('30', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/分享.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('31', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/分类.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('32', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/切换位置.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('33', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/定位服务，浮层.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('34', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/意见反馈.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('35', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/手机注册.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('36', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/找回密码.jpg', '750', '1334', '', '1', '1459866803', '1');
INSERT INTO `meiui_pic` VALUES ('37', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/提交订单.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('38', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/搜索关键词.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('39', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/收藏为空.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('40', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/消息页，列表.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('41', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/用户协议.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('42', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/登录页面.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('43', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/订单列表.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('44', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/订单详情.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('45', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/详情页.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('46', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/账户设置.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('47', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/购物车.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('48', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/邀请好友.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('49', '3', 'Enjoy', '2', 'http://www.meiui.me/load/init_data/APP/Enjoy/重置密码.jpg', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('50', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/Timeline.PNG', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('51', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/列表，模板，新增.PNG', '750', '1334', '', '1', '1459866804', '1');
INSERT INTO `meiui_pic` VALUES ('52', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/同步.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('53', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/抽屉式.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('54', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/搜索结果.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('55', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/收藏，列表.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('56', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/新增，evernote，印象笔记.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('57', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/新增，weibo，微博.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('58', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/新增，新建.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('59', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/系统设置.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('60', '4', 'IF', '2', 'http://www.meiui.me/load/init_data/APP/IF/详情页.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('61', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/上传照片，新建，新增，邮件.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('62', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/引导页.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('63', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/引导页，设置.PNG', '750', '1334', '', '1', '1459866805', '1');
INSERT INTO `meiui_pic` VALUES ('64', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/弹窗，设置.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('65', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/意见反馈.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('66', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/抽屉式.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('67', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/按钮，Material Design.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('68', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/新建，新增，邮件.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('69', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/草稿为空.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('70', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/身份验证，登录.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('71', '5', 'Inbox', '2', 'http://www.meiui.me/load/init_data/APP/Inbox/邮箱，收件箱，列表.PNG', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('72', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/个人主页.jpg', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('73', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/主页.jpg', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('74', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/主题，订阅.jpg', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('75', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/举报.jpg', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('76', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/关注为空.jpg', '750', '1334', '', '1', '1459866806', '1');
INSERT INTO `meiui_pic` VALUES ('77', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/分享.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('78', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/弹窗.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('79', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/手机注册.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('80', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/排行.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('81', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/搜索结果.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('82', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/标签.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('83', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/浮层.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('84', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/消息页.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('85', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/游客模式.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('86', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/热门搜索.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('87', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/用户协议.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('88', '6', 'Like', '2', 'http://www.meiui.me/load/init_data/APP/Like/登录页面.jpg', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('89', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/主页.PNG', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('90', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/分享.PNG', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('91', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/工具栏.PNG', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('92', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/工具栏，画笔.PNG', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('93', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/抽屉式.PNG', '750', '1334', '', '1', '1459866807', '1');
INSERT INTO `meiui_pic` VALUES ('94', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/排序.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('95', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/系统设置，主题设置.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('96', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/系统设置，输入设置.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('97', '7', 'Notability', '2', 'http://www.meiui.me/load/init_data/APP/Notability/编辑.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('98', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/个人主页.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('99', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/主页.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('100', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/分享.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('101', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/分享，邀请.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('102', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/列表.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('103', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/弹窗.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('104', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/弹窗，列表.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('105', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/消息页.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('106', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/详情页.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('107', '8', 'OPEN开腔', '2', 'http://www.meiui.me/load/init_data/APP/OPEN开腔/邀请.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('108', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/列表，简约.PNG', '750', '1334', '', '1', '1459866808', '1');
INSERT INTO `meiui_pic` VALUES ('109', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/卡片式，主页.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('110', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/引导页，loading.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('111', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/授予权限，新建，新增.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('112', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/新增，新建.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('113', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/模板.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('114', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/登录页，简约.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('115', '9', 'Paper', '2', 'http://www.meiui.me/load/init_data/APP/Paper/系统设置.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('116', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/个人信息.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('117', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/公告，引导页.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('118', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/关注，列表，涂鸦.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('119', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/帮助，提示.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('120', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/提示信息，引导页.PNG', '750', '1334', '', '1', '1459866809', '1');
INSERT INTO `meiui_pic` VALUES ('121', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/新增，新建，涂鸦.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('122', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/第三方登录.jpg', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('123', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/账户连接，Twitter.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('124', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/账户连接，联系人，通讯录.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('125', '10', 'Paper 53', '2', 'http://www.meiui.me/load/init_data/APP/Paper 53/邮箱注册.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('126', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/Timeline，时间线.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('127', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/列表，搜索栏.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('128', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/引导页，弹窗.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('129', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/弹出按钮.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('130', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/弹窗，引导页.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('131', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/注册页面，邮箱注册，手机验证.jpg', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('132', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/滤镜.PNG', '750', '1334', '', '1', '1459866810', '1');
INSERT INTO `meiui_pic` VALUES ('133', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/登录页面.jpg', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('134', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/账户设置.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('135', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/通知设置，邮箱提醒，手机提醒.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('136', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/重置密码.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('137', '11', 'Path', '2', 'http://www.meiui.me/load/init_data/APP/Path/验证码.jpg', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('138', '12', 'Sleep Cycle', '2', 'http://www.meiui.me/load/init_data/APP/Sleep Cycle/主页，日期选择，闹钟.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('139', '12', 'Sleep Cycle', '2', 'http://www.meiui.me/load/init_data/APP/Sleep Cycle/提示信息.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('140', '12', 'Sleep Cycle', '2', 'http://www.meiui.me/load/init_data/APP/Sleep Cycle/系统设置，闹钟.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('141', '12', 'Sleep Cycle', '2', 'http://www.meiui.me/load/init_data/APP/Sleep Cycle/统计，趋势图.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('142', '12', 'Sleep Cycle', '2', 'http://www.meiui.me/load/init_data/APP/Sleep Cycle/统计，趋势图，柱状图.PNG', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('143', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/主页.jpg', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('144', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/主题，模板，创建主题.jpg', '750', '1334', '', '1', '1459866811', '1');
INSERT INTO `meiui_pic` VALUES ('145', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/关注，关注用户.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('146', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/关注，关注话题.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('147', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/授予权限，照片权限.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('148', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/授予权限，通知权限.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('149', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/排行榜.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('150', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/提示信息，邮箱注册.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('151', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/搜索栏，热门搜索.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('152', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/收藏，关注.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('153', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/权限申请，照片权限.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('154', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/权限申请，通知权限.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('155', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/模板，主题.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('156', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/浮层，手势介绍.jpg', '750', '1334', '', '1', '1459866812', '1');
INSERT INTO `meiui_pic` VALUES ('157', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/瀑布流.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('158', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/登录页面，第三方登录，游客模式.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('159', '13', 'Steller', '2', 'http://www.meiui.me/load/init_data/APP/Steller/邮箱注册.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('160', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/loading.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('161', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/上传照片.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('162', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/主页.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('163', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/关注话题.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('164', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/关注，关注话题.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('165', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/关注，遮罩层.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('166', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/国家设置.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('167', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/密码.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('168', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/引导页.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('169', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/搜索结果，列表.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('170', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/搜索，搜索结果.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('171', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/日期选择.jpg', '750', '1334', '', '1', '1459866813', '1');
INSERT INTO `meiui_pic` VALUES ('172', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/标签.jpg', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('173', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/热门搜索.jpg', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('174', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/登录页面.jpg', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('175', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/筛选.jpg', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('176', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/详情页.jpg', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('177', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/遮罩层，筛选.jpg', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('178', '14', 'Twitter', '2', 'http://www.meiui.me/load/init_data/APP/Twitter/邮箱注册.jpg', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('179', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/上传照片，简约.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('180', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/主页，推荐.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('181', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/分享.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('182', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/列表.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('183', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/列表，简约.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('184', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/列表，选中.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('185', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/卡片式，模板.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('186', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/引导页，卡片式.PNG', '750', '1334', '', '1', '1459866814', '1');
INSERT INTO `meiui_pic` VALUES ('187', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/意见反馈.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('188', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/抽屉式.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('189', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/日历.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('190', '15', 'ZERO', '2', 'http://www.meiui.me/load/init_data/APP/ZERO/详情页.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('191', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/主页，独立设计.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('192', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/分类，品类.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('193', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/列表，主页.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('194', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/列表，分类结果.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('195', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/列表，图文.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('196', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/列表，简约.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('197', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/商品详情.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('198', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/商品详情，弹窗.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('199', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/客户服务.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('200', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/意见反馈.PNG', '750', '1334', '', '1', '1459866815', '1');
INSERT INTO `meiui_pic` VALUES ('201', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/新增，收件人.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('202', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/消息为空.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('203', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/用户协议.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('204', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/登录页面，第三方登录.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('205', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/系统设置，个人设置，个人主页.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('206', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/绑定手机.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('207', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/订单详情.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('208', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/购物车.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('209', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/购物车空.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('210', '16', '匠物', '2', 'http://www.meiui.me/load/init_data/APP/匠物/邀请，弹窗.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('211', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/主页，天气.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('212', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/关于我们.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('213', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/分享.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('214', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/功能介绍.PNG', '750', '1334', '', '1', '1459866816', '1');
INSERT INTO `meiui_pic` VALUES ('215', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/地图，动画.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('216', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/天气，动画.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('217', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/天气，趋势图.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('218', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/搜索结果.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('219', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/空气质量，动画.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('220', '17', '彩云天气', '2', 'http://www.meiui.me/load/init_data/APP/彩云天气/空气质量，趋势图.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('221', '18', '懒人天气', '2', 'http://www.meiui.me/load/init_data/APP/懒人天气/主页，空气质量，天气.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('222', '18', '懒人天气', '2', 'http://www.meiui.me/load/init_data/APP/懒人天气/天气，详情页，空气质量.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('223', '18', '懒人天气', '2', 'http://www.meiui.me/load/init_data/APP/懒人天气/抽屉式.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('224', '18', '懒人天气', '2', 'http://www.meiui.me/load/init_data/APP/懒人天气/陈列式，主页.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('225', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/分享，卡片式.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('226', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/城市设置，天气.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('227', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/天气，上拉刷新.PNG', '750', '1334', '', '1', '1459866817', '1');
INSERT INTO `meiui_pic` VALUES ('228', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/天气，分享.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('229', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/天气，空气质量，趋势图.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('230', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/天气，趋势图，弹窗.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('231', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/搜索，城市设置，搜索栏.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('232', '19', '我的天气', '2', 'http://www.meiui.me/load/init_data/APP/我的天气/系统设置，设置.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('233', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/主页.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('234', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/关于我们.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('235', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/分享，主页.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('236', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/分享，日历.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('237', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/同步.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('238', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/弹窗.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('239', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/收藏.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('240', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/日历.PNG', '750', '1334', '', '1', '1459866818', '1');
INSERT INTO `meiui_pic` VALUES ('241', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/登录页面，注册页面.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('242', '20', '每日故宫', '2', 'http://www.meiui.me/load/init_data/APP/每日故宫/陈列式.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('243', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/主页，分类.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('244', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/列表，弹窗.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('245', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/列表，排序.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('246', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/弹窗，列表.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('247', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/推荐，热门搜索.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('248', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/热门搜索，关注，关注用户.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('249', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/详情页.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('250', '21', '用家', '2', 'http://www.meiui.me/load/init_data/APP/用家/通知权限，权限申请.PNG', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('251', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/上传照片.jpg', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('252', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/个人信息.jpg', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('253', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/主页.jpg', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('254', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/主页，缩略图.jpg', '750', '1334', '', '1', '1459866819', '1');
INSERT INTO `meiui_pic` VALUES ('255', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/举报.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('256', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/信息编辑.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('257', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/修改信息.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('258', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/关于我们.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('259', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/分享.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('260', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/分享，下载.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('261', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/分享，弹窗.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('262', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/失败提示.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('263', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/弹窗，分享.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('264', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/手机注册.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('265', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/抽屉式.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('266', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/提示信息，浮层.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('267', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/搜索结果，关注.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('268', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/模板，明信片.jpg', '750', '1334', '', '1', '1459866820', '1');
INSERT INTO `meiui_pic` VALUES ('269', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/滤镜.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('270', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/登录页面，第三方登录.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('271', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/第三方登录，登录页面.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('272', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/草稿箱.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('273', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/设置.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('274', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/详情页.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('275', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/账户设置.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('276', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/隐身模式，弹窗.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('277', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/预览.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('278', '22', '留白', '2', 'http://www.meiui.me/load/init_data/APP/留白/验证码.jpg', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('279', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，FAQ，空气质量.PNG', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('280', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，主页，空气质量.PNG', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('281', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，关于我们.PNG', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('282', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，分享.PNG', '750', '1334', '', '1', '1459866821', '1');
INSERT INTO `meiui_pic` VALUES ('283', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，城市设置，地理信息.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('284', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，天气，空气质量.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('285', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，详情页，空气质量.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('286', '23', '空气监测站', '2', 'http://www.meiui.me/load/init_data/APP/空气监测站/卡通，通知设置，推送设置.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('287', '24', '糗事百科', '2', 'http://www.meiui.me/load/init_data/APP/糗事百科/主页，列表.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('288', '24', '糗事百科', '2', 'http://www.meiui.me/load/init_data/APP/糗事百科/举报.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('289', '24', '糗事百科', '2', 'http://www.meiui.me/load/init_data/APP/糗事百科/举报，单选框.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('290', '24', '糗事百科', '2', 'http://www.meiui.me/load/init_data/APP/糗事百科/列表，卡片式.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('291', '24', '糗事百科', '2', 'http://www.meiui.me/load/init_data/APP/糗事百科/发布动态，新建.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('292', '24', '糗事百科', '2', 'http://www.meiui.me/load/init_data/APP/糗事百科/审核，公告.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('293', '24', '糗事百科', '2', 'http://www.meiui.me/load/init_data/APP/糗事百科/审核，内容审核.PNG', '750', '1334', '', '1', '1459866822', '1');
INSERT INTO `meiui_pic` VALUES ('294', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/个人主页.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('295', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/主页.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('296', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/举报.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('297', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/关注.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('298', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/关注，搜索结果.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('299', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/分享.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('300', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/发现.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('301', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/引导页.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('302', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/搜索关键词，搜索.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('303', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/搜索结果，搜索.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('304', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/搜索，搜索结果.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('305', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/新增，新建.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('306', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/消息为空.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('307', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/登录页面.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('308', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/系统设置.PNG', '750', '1334', '', '1', '1459866823', '1');
INSERT INTO `meiui_pic` VALUES ('309', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/评论页.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('310', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/详情页.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('311', '25', '艺术云图', '2', 'http://www.meiui.me/load/init_data/APP/艺术云图/邮箱注册.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('312', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/个人主页.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('313', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/个人主页，关注.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('314', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/个人主页，收藏结果.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('315', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/主页.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('316', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/修改信息.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('317', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/兑换页面，兑换记录.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('318', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/关于我们.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('319', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/关注用户，关注.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('320', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/关注，关注用户.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('321', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/分享.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('322', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/发现，热门推荐，热点.PNG', '750', '1334', '', '1', '1459866824', '1');
INSERT INTO `meiui_pic` VALUES ('323', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/城市设置，定位服务.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('324', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/帮助.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('325', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/意见反馈.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('326', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/手机注册.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('327', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/手机登录，登录页面.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('328', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/搜索为空.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('329', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/搜索结果.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('330', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/搜索结果，关注.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('331', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/消息页.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('332', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/版本更新，弹窗.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('333', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/用户协议.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('334', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/登录页面，三方登录.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('335', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/积分明细.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('336', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/积分，兑换页面.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('337', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/系统设置.PNG', '750', '1334', '', '1', '1459866825', '1');
INSERT INTO `meiui_pic` VALUES ('338', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/认证，身份验证.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('339', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/详情页.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('340', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/详情页，活动.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('341', '26', '艺术狗', '2', 'http://www.meiui.me/load/init_data/APP/艺术狗/重置密码.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('342', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/专题，列表.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('343', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/个人主页.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('344', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/主页.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('345', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/分类.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('346', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/商品详情页.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('347', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/排序.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('348', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/搜索关键词，热门搜索.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('349', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/搜索结果.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('350', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/注册页面.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('351', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/消息为空.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('352', '27', '薄荷家居', '2', 'http://www.meiui.me/load/init_data/APP/薄荷家居/详情页.PNG', '750', '1334', '', '1', '1459866826', '1');
INSERT INTO `meiui_pic` VALUES ('353', '28', '雨时', '2', 'http://www.meiui.me/load/init_data/APP/雨时/主页，天气，中国风.PNG', '750', '1334', '', '1', '1459866827', '1');
INSERT INTO `meiui_pic` VALUES ('354', '28', '雨时', '2', 'http://www.meiui.me/load/init_data/APP/雨时/城市设置，天气.PNG', '750', '1334', '', '1', '1459866827', '1');
INSERT INTO `meiui_pic` VALUES ('355', '28', '雨时', '2', 'http://www.meiui.me/load/init_data/APP/雨时/天气，列表页，中国风.PNG', '750', '1334', '', '1', '1459866827', '1');
INSERT INTO `meiui_pic` VALUES ('356', '28', '雨时', '2', 'http://www.meiui.me/load/init_data/APP/雨时/天气，城市设置.PNG', '750', '1334', '', '1', '1459866827', '1');
INSERT INTO `meiui_pic` VALUES ('357', '28', '雨时', '2', 'http://www.meiui.me/load/init_data/APP/雨时/设置，系统设置.PNG', '750', '1334', '', '1', '1459866827', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=937 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_pic_link_tag
-- ----------------------------
INSERT INTO `meiui_pic_link_tag` VALUES ('1', '1', '1', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('2', '1', '1', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('3', '1', '1', '3', '2', '卡片式');
INSERT INTO `meiui_pic_link_tag` VALUES ('4', '1', '1', '4', '2', 'AirVisual');
INSERT INTO `meiui_pic_link_tag` VALUES ('5', '1', '2', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('6', '1', '2', '5', '2', '地图');
INSERT INTO `meiui_pic_link_tag` VALUES ('7', '1', '2', '6', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('8', '1', '2', '4', '2', 'AirVisual');
INSERT INTO `meiui_pic_link_tag` VALUES ('9', '1', '3', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('10', '1', '3', '5', '2', '地图');
INSERT INTO `meiui_pic_link_tag` VALUES ('11', '1', '3', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('12', '1', '3', '4', '2', 'AirVisual');
INSERT INTO `meiui_pic_link_tag` VALUES ('13', '1', '4', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('14', '1', '4', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('15', '1', '4', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('16', '1', '4', '4', '2', 'AirVisual');
INSERT INTO `meiui_pic_link_tag` VALUES ('17', '1', '5', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('18', '1', '5', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('19', '1', '5', '9', '2', '趋势图');
INSERT INTO `meiui_pic_link_tag` VALUES ('20', '1', '5', '5', '2', '地图');
INSERT INTO `meiui_pic_link_tag` VALUES ('21', '1', '5', '4', '2', 'AirVisual');
INSERT INTO `meiui_pic_link_tag` VALUES ('22', '1', '6', '10', '2', 'Timeline');
INSERT INTO `meiui_pic_link_tag` VALUES ('23', '1', '6', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('24', '1', '6', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('25', '1', '7', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('26', '1', '7', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('27', '1', '7', '14', '2', '简约');
INSERT INTO `meiui_pic_link_tag` VALUES ('28', '1', '7', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('29', '1', '7', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('30', '1', '8', '15', '2', '关于我们');
INSERT INTO `meiui_pic_link_tag` VALUES ('31', '1', '8', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('32', '1', '9', '16', '2', '同步');
INSERT INTO `meiui_pic_link_tag` VALUES ('33', '1', '9', '17', '2', '同步设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('34', '1', '9', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('35', '1', '10', '18', '2', '排序');
INSERT INTO `meiui_pic_link_tag` VALUES ('36', '1', '10', '19', '2', '标签');
INSERT INTO `meiui_pic_link_tag` VALUES ('37', '1', '10', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('38', '1', '11', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('39', '1', '11', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('40', '1', '12', '6', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('41', '1', '12', '21', '2', '搜索栏');
INSERT INTO `meiui_pic_link_tag` VALUES ('42', '1', '12', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('43', '1', '13', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('44', '1', '13', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('45', '1', '13', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('46', '1', '13', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('47', '1', '14', '24', '2', '日历');
INSERT INTO `meiui_pic_link_tag` VALUES ('48', '1', '14', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('49', '1', '14', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('50', '1', '15', '25', '2', '日期选择');
INSERT INTO `meiui_pic_link_tag` VALUES ('51', '1', '15', '26', '2', '日期');
INSERT INTO `meiui_pic_link_tag` VALUES ('52', '1', '15', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('53', '1', '16', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('54', '1', '16', '27', '2', '上传照片');
INSERT INTO `meiui_pic_link_tag` VALUES ('55', '1', '16', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('56', '1', '17', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('57', '1', '17', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('58', '1', '17', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('59', '1', '18', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('60', '1', '18', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('61', '1', '18', '28', '2', '操作栏');
INSERT INTO `meiui_pic_link_tag` VALUES ('62', '1', '18', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('63', '1', '19', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('64', '1', '19', '29', '2', '城市设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('65', '1', '19', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('66', '1', '20', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('67', '1', '20', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('68', '1', '20', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('69', '1', '21', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('70', '1', '21', '30', '2', '收藏');
INSERT INTO `meiui_pic_link_tag` VALUES ('71', '1', '21', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('72', '1', '22', '13', '2', '日记');
INSERT INTO `meiui_pic_link_tag` VALUES ('73', '1', '22', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('74', '1', '22', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('75', '1', '23', '19', '2', '标签');
INSERT INTO `meiui_pic_link_tag` VALUES ('76', '1', '23', '18', '2', '排序');
INSERT INTO `meiui_pic_link_tag` VALUES ('77', '1', '23', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('78', '1', '24', '31', '2', '程序密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('79', '1', '24', '32', '2', '密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('80', '1', '24', '33', '2', '解锁密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('81', '1', '24', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('82', '1', '25', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('83', '1', '25', '11', '2', 'Day One');
INSERT INTO `meiui_pic_link_tag` VALUES ('84', '1', '26', '27', '2', '上传照片');
INSERT INTO `meiui_pic_link_tag` VALUES ('85', '1', '26', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('86', '1', '27', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('87', '1', '27', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('88', '1', '28', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('89', '1', '28', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('90', '1', '28', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('91', '1', '29', '36', '2', '优惠券');
INSERT INTO `meiui_pic_link_tag` VALUES ('92', '1', '29', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('93', '1', '30', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('94', '1', '30', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('95', '1', '31', '38', '2', '分类');
INSERT INTO `meiui_pic_link_tag` VALUES ('96', '1', '31', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('97', '1', '32', '39', '2', '切换位置');
INSERT INTO `meiui_pic_link_tag` VALUES ('98', '1', '32', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('99', '1', '33', '40', '2', '定位服务');
INSERT INTO `meiui_pic_link_tag` VALUES ('100', '1', '33', '41', '2', '浮层');
INSERT INTO `meiui_pic_link_tag` VALUES ('101', '1', '33', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('102', '1', '34', '42', '2', '意见反馈');
INSERT INTO `meiui_pic_link_tag` VALUES ('103', '1', '34', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('104', '1', '35', '43', '2', '手机注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('105', '1', '35', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('106', '1', '36', '44', '2', '找回密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('107', '1', '36', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('108', '1', '37', '45', '2', '提交订单');
INSERT INTO `meiui_pic_link_tag` VALUES ('109', '1', '37', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('110', '1', '38', '46', '2', '搜索关键词');
INSERT INTO `meiui_pic_link_tag` VALUES ('111', '1', '38', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('112', '1', '39', '47', '2', '收藏为空');
INSERT INTO `meiui_pic_link_tag` VALUES ('113', '1', '39', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('114', '1', '40', '48', '2', '消息页');
INSERT INTO `meiui_pic_link_tag` VALUES ('115', '1', '40', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('116', '1', '40', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('117', '1', '41', '49', '2', '用户协议');
INSERT INTO `meiui_pic_link_tag` VALUES ('118', '1', '41', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('119', '1', '42', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('120', '1', '42', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('121', '1', '43', '51', '2', '订单列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('122', '1', '43', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('123', '1', '44', '52', '2', '订单详情');
INSERT INTO `meiui_pic_link_tag` VALUES ('124', '1', '44', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('125', '1', '45', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('126', '1', '45', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('127', '1', '46', '53', '2', '账户设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('128', '1', '46', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('129', '1', '47', '54', '2', '购物车');
INSERT INTO `meiui_pic_link_tag` VALUES ('130', '1', '47', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('131', '1', '48', '55', '2', '邀请好友');
INSERT INTO `meiui_pic_link_tag` VALUES ('132', '1', '48', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('133', '1', '49', '56', '2', '重置密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('134', '1', '49', '35', '2', 'Enjoy');
INSERT INTO `meiui_pic_link_tag` VALUES ('135', '1', '50', '10', '2', 'Timeline');
INSERT INTO `meiui_pic_link_tag` VALUES ('136', '1', '50', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('137', '1', '51', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('138', '1', '51', '58', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('139', '1', '51', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('140', '1', '51', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('141', '1', '52', '16', '2', '同步');
INSERT INTO `meiui_pic_link_tag` VALUES ('142', '1', '52', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('143', '1', '53', '59', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('144', '1', '53', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('145', '1', '54', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('146', '1', '54', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('147', '1', '55', '30', '2', '收藏');
INSERT INTO `meiui_pic_link_tag` VALUES ('148', '1', '55', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('149', '1', '55', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('150', '1', '56', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('151', '1', '56', '60', '2', 'evernote');
INSERT INTO `meiui_pic_link_tag` VALUES ('152', '1', '56', '61', '2', '印象笔记');
INSERT INTO `meiui_pic_link_tag` VALUES ('153', '1', '56', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('154', '1', '57', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('155', '1', '57', '62', '2', 'weibo');
INSERT INTO `meiui_pic_link_tag` VALUES ('156', '1', '57', '63', '2', '微博');
INSERT INTO `meiui_pic_link_tag` VALUES ('157', '1', '57', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('158', '1', '58', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('159', '1', '58', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('160', '1', '58', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('161', '1', '59', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('162', '1', '59', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('163', '1', '60', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('164', '1', '60', '57', '2', 'IF');
INSERT INTO `meiui_pic_link_tag` VALUES ('165', '1', '61', '27', '2', '上传照片');
INSERT INTO `meiui_pic_link_tag` VALUES ('166', '1', '61', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('167', '1', '61', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('168', '1', '61', '64', '2', '邮件');
INSERT INTO `meiui_pic_link_tag` VALUES ('169', '1', '61', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('170', '1', '62', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('171', '1', '62', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('172', '1', '63', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('173', '1', '63', '67', '2', '设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('174', '1', '63', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('175', '1', '64', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('176', '1', '64', '67', '2', '设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('177', '1', '64', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('178', '1', '65', '42', '2', '意见反馈');
INSERT INTO `meiui_pic_link_tag` VALUES ('179', '1', '65', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('180', '1', '66', '59', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('181', '1', '66', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('182', '1', '67', '69', '2', '按钮');
INSERT INTO `meiui_pic_link_tag` VALUES ('183', '1', '67', '70', '2', 'Material Design');
INSERT INTO `meiui_pic_link_tag` VALUES ('184', '1', '67', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('185', '1', '68', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('186', '1', '68', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('187', '1', '68', '64', '2', '邮件');
INSERT INTO `meiui_pic_link_tag` VALUES ('188', '1', '68', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('189', '1', '69', '71', '2', '草稿为空');
INSERT INTO `meiui_pic_link_tag` VALUES ('190', '1', '69', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('191', '1', '70', '72', '2', '身份验证');
INSERT INTO `meiui_pic_link_tag` VALUES ('192', '1', '70', '73', '2', '登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('193', '1', '70', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('194', '1', '71', '74', '2', '邮箱');
INSERT INTO `meiui_pic_link_tag` VALUES ('195', '1', '71', '75', '2', '收件箱');
INSERT INTO `meiui_pic_link_tag` VALUES ('196', '1', '71', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('197', '1', '71', '65', '2', 'Inbox');
INSERT INTO `meiui_pic_link_tag` VALUES ('198', '1', '72', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('199', '1', '72', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('200', '1', '73', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('201', '1', '73', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('202', '1', '74', '78', '2', '主题');
INSERT INTO `meiui_pic_link_tag` VALUES ('203', '1', '74', '79', '2', '订阅');
INSERT INTO `meiui_pic_link_tag` VALUES ('204', '1', '74', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('205', '1', '75', '80', '2', '举报');
INSERT INTO `meiui_pic_link_tag` VALUES ('206', '1', '75', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('207', '1', '76', '81', '2', '关注为空');
INSERT INTO `meiui_pic_link_tag` VALUES ('208', '1', '76', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('209', '1', '77', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('210', '1', '77', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('211', '1', '78', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('212', '1', '78', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('213', '1', '79', '43', '2', '手机注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('214', '1', '79', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('215', '1', '80', '82', '2', '排行');
INSERT INTO `meiui_pic_link_tag` VALUES ('216', '1', '80', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('217', '1', '81', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('218', '1', '81', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('219', '1', '82', '19', '2', '标签');
INSERT INTO `meiui_pic_link_tag` VALUES ('220', '1', '82', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('221', '1', '83', '41', '2', '浮层');
INSERT INTO `meiui_pic_link_tag` VALUES ('222', '1', '83', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('223', '1', '84', '48', '2', '消息页');
INSERT INTO `meiui_pic_link_tag` VALUES ('224', '1', '84', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('225', '1', '85', '83', '2', '游客模式');
INSERT INTO `meiui_pic_link_tag` VALUES ('226', '1', '85', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('227', '1', '86', '84', '2', '热门搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('228', '1', '86', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('229', '1', '87', '49', '2', '用户协议');
INSERT INTO `meiui_pic_link_tag` VALUES ('230', '1', '87', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('231', '1', '88', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('232', '1', '88', '77', '2', 'Like');
INSERT INTO `meiui_pic_link_tag` VALUES ('233', '1', '89', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('234', '1', '89', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('235', '1', '90', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('236', '1', '90', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('237', '1', '91', '86', '2', '工具栏');
INSERT INTO `meiui_pic_link_tag` VALUES ('238', '1', '91', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('239', '1', '92', '86', '2', '工具栏');
INSERT INTO `meiui_pic_link_tag` VALUES ('240', '1', '92', '87', '2', '画笔');
INSERT INTO `meiui_pic_link_tag` VALUES ('241', '1', '92', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('242', '1', '93', '59', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('243', '1', '93', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('244', '1', '94', '18', '2', '排序');
INSERT INTO `meiui_pic_link_tag` VALUES ('245', '1', '94', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('246', '1', '95', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('247', '1', '95', '88', '2', '主题设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('248', '1', '95', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('249', '1', '96', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('250', '1', '96', '89', '2', '输入设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('251', '1', '96', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('252', '1', '97', '90', '2', '编辑');
INSERT INTO `meiui_pic_link_tag` VALUES ('253', '1', '97', '85', '2', 'Notability');
INSERT INTO `meiui_pic_link_tag` VALUES ('254', '1', '98', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('255', '1', '98', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('256', '1', '99', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('257', '1', '99', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('258', '1', '100', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('259', '1', '100', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('260', '1', '101', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('261', '1', '101', '92', '2', '邀请');
INSERT INTO `meiui_pic_link_tag` VALUES ('262', '1', '101', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('263', '1', '102', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('264', '1', '102', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('265', '1', '103', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('266', '1', '103', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('267', '1', '104', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('268', '1', '104', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('269', '1', '104', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('270', '1', '105', '48', '2', '消息页');
INSERT INTO `meiui_pic_link_tag` VALUES ('271', '1', '105', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('272', '1', '106', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('273', '1', '106', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('274', '1', '107', '92', '2', '邀请');
INSERT INTO `meiui_pic_link_tag` VALUES ('275', '1', '107', '91', '2', 'OPEN开腔');
INSERT INTO `meiui_pic_link_tag` VALUES ('276', '1', '108', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('277', '1', '108', '14', '2', '简约');
INSERT INTO `meiui_pic_link_tag` VALUES ('278', '1', '108', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('279', '1', '109', '3', '2', '卡片式');
INSERT INTO `meiui_pic_link_tag` VALUES ('280', '1', '109', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('281', '1', '109', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('282', '1', '110', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('283', '1', '110', '94', '2', 'loading');
INSERT INTO `meiui_pic_link_tag` VALUES ('284', '1', '110', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('285', '1', '111', '95', '2', '授予权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('286', '1', '111', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('287', '1', '111', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('288', '1', '111', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('289', '1', '112', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('290', '1', '112', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('291', '1', '112', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('292', '1', '113', '58', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('293', '1', '113', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('294', '1', '114', '96', '2', '登录页');
INSERT INTO `meiui_pic_link_tag` VALUES ('295', '1', '114', '14', '2', '简约');
INSERT INTO `meiui_pic_link_tag` VALUES ('296', '1', '114', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('297', '1', '115', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('298', '1', '115', '93', '2', 'Paper');
INSERT INTO `meiui_pic_link_tag` VALUES ('299', '1', '116', '97', '2', '个人信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('300', '1', '116', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('301', '1', '117', '99', '2', '公告');
INSERT INTO `meiui_pic_link_tag` VALUES ('302', '1', '117', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('303', '1', '117', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('304', '1', '118', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('305', '1', '118', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('306', '1', '118', '101', '2', '涂鸦');
INSERT INTO `meiui_pic_link_tag` VALUES ('307', '1', '118', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('308', '1', '119', '102', '2', '帮助');
INSERT INTO `meiui_pic_link_tag` VALUES ('309', '1', '119', '103', '2', '提示');
INSERT INTO `meiui_pic_link_tag` VALUES ('310', '1', '119', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('311', '1', '120', '104', '2', '提示信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('312', '1', '120', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('313', '1', '120', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('314', '1', '121', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('315', '1', '121', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('316', '1', '121', '101', '2', '涂鸦');
INSERT INTO `meiui_pic_link_tag` VALUES ('317', '1', '121', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('318', '1', '122', '105', '2', '第三方登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('319', '1', '122', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('320', '1', '123', '106', '2', '账户连接');
INSERT INTO `meiui_pic_link_tag` VALUES ('321', '1', '123', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('322', '1', '123', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('323', '1', '124', '106', '2', '账户连接');
INSERT INTO `meiui_pic_link_tag` VALUES ('324', '1', '124', '108', '2', '联系人');
INSERT INTO `meiui_pic_link_tag` VALUES ('325', '1', '124', '109', '2', '通讯录');
INSERT INTO `meiui_pic_link_tag` VALUES ('326', '1', '124', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('327', '1', '125', '110', '2', '邮箱注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('328', '1', '125', '98', '2', 'Paper 53');
INSERT INTO `meiui_pic_link_tag` VALUES ('329', '1', '126', '10', '2', 'Timeline');
INSERT INTO `meiui_pic_link_tag` VALUES ('330', '1', '126', '111', '2', '时间线');
INSERT INTO `meiui_pic_link_tag` VALUES ('331', '1', '126', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('332', '1', '127', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('333', '1', '127', '21', '2', '搜索栏');
INSERT INTO `meiui_pic_link_tag` VALUES ('334', '1', '127', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('335', '1', '128', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('336', '1', '128', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('337', '1', '128', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('338', '1', '129', '113', '2', '弹出按钮');
INSERT INTO `meiui_pic_link_tag` VALUES ('339', '1', '129', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('340', '1', '130', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('341', '1', '130', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('342', '1', '130', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('343', '1', '131', '114', '2', '注册页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('344', '1', '131', '110', '2', '邮箱注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('345', '1', '131', '115', '2', '手机验证');
INSERT INTO `meiui_pic_link_tag` VALUES ('346', '1', '131', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('347', '1', '132', '116', '2', '滤镜');
INSERT INTO `meiui_pic_link_tag` VALUES ('348', '1', '132', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('349', '1', '133', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('350', '1', '133', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('351', '1', '134', '53', '2', '账户设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('352', '1', '134', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('353', '1', '135', '117', '2', '通知设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('354', '1', '135', '118', '2', '邮箱提醒');
INSERT INTO `meiui_pic_link_tag` VALUES ('355', '1', '135', '119', '2', '手机提醒');
INSERT INTO `meiui_pic_link_tag` VALUES ('356', '1', '135', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('357', '1', '136', '56', '2', '重置密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('358', '1', '136', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('359', '1', '137', '120', '2', '验证码');
INSERT INTO `meiui_pic_link_tag` VALUES ('360', '1', '137', '112', '2', 'Path');
INSERT INTO `meiui_pic_link_tag` VALUES ('361', '1', '138', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('362', '1', '138', '25', '2', '日期选择');
INSERT INTO `meiui_pic_link_tag` VALUES ('363', '1', '138', '121', '2', '闹钟');
INSERT INTO `meiui_pic_link_tag` VALUES ('364', '1', '138', '122', '2', 'Sleep Cycle');
INSERT INTO `meiui_pic_link_tag` VALUES ('365', '1', '139', '104', '2', '提示信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('366', '1', '139', '122', '2', 'Sleep Cycle');
INSERT INTO `meiui_pic_link_tag` VALUES ('367', '1', '140', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('368', '1', '140', '121', '2', '闹钟');
INSERT INTO `meiui_pic_link_tag` VALUES ('369', '1', '140', '122', '2', 'Sleep Cycle');
INSERT INTO `meiui_pic_link_tag` VALUES ('370', '1', '141', '123', '2', '统计');
INSERT INTO `meiui_pic_link_tag` VALUES ('371', '1', '141', '9', '2', '趋势图');
INSERT INTO `meiui_pic_link_tag` VALUES ('372', '1', '141', '122', '2', 'Sleep Cycle');
INSERT INTO `meiui_pic_link_tag` VALUES ('373', '1', '142', '123', '2', '统计');
INSERT INTO `meiui_pic_link_tag` VALUES ('374', '1', '142', '9', '2', '趋势图');
INSERT INTO `meiui_pic_link_tag` VALUES ('375', '1', '142', '124', '2', '柱状图');
INSERT INTO `meiui_pic_link_tag` VALUES ('376', '1', '142', '122', '2', 'Sleep Cycle');
INSERT INTO `meiui_pic_link_tag` VALUES ('377', '1', '143', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('378', '1', '143', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('379', '1', '144', '78', '2', '主题');
INSERT INTO `meiui_pic_link_tag` VALUES ('380', '1', '144', '58', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('381', '1', '144', '126', '2', '创建主题');
INSERT INTO `meiui_pic_link_tag` VALUES ('382', '1', '144', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('383', '1', '145', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('384', '1', '145', '127', '2', '关注用户');
INSERT INTO `meiui_pic_link_tag` VALUES ('385', '1', '145', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('386', '1', '146', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('387', '1', '146', '128', '2', '关注话题');
INSERT INTO `meiui_pic_link_tag` VALUES ('388', '1', '146', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('389', '1', '147', '95', '2', '授予权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('390', '1', '147', '129', '2', '照片权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('391', '1', '147', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('392', '1', '148', '95', '2', '授予权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('393', '1', '148', '130', '2', '通知权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('394', '1', '148', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('395', '1', '149', '131', '2', '排行榜');
INSERT INTO `meiui_pic_link_tag` VALUES ('396', '1', '149', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('397', '1', '150', '104', '2', '提示信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('398', '1', '150', '110', '2', '邮箱注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('399', '1', '150', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('400', '1', '151', '21', '2', '搜索栏');
INSERT INTO `meiui_pic_link_tag` VALUES ('401', '1', '151', '84', '2', '热门搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('402', '1', '151', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('403', '1', '152', '30', '2', '收藏');
INSERT INTO `meiui_pic_link_tag` VALUES ('404', '1', '152', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('405', '1', '152', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('406', '1', '153', '132', '2', '权限申请');
INSERT INTO `meiui_pic_link_tag` VALUES ('407', '1', '153', '129', '2', '照片权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('408', '1', '153', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('409', '1', '154', '132', '2', '权限申请');
INSERT INTO `meiui_pic_link_tag` VALUES ('410', '1', '154', '130', '2', '通知权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('411', '1', '154', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('412', '1', '155', '58', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('413', '1', '155', '78', '2', '主题');
INSERT INTO `meiui_pic_link_tag` VALUES ('414', '1', '155', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('415', '1', '156', '41', '2', '浮层');
INSERT INTO `meiui_pic_link_tag` VALUES ('416', '1', '156', '133', '2', '手势介绍');
INSERT INTO `meiui_pic_link_tag` VALUES ('417', '1', '156', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('418', '1', '157', '134', '2', '瀑布流');
INSERT INTO `meiui_pic_link_tag` VALUES ('419', '1', '157', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('420', '1', '158', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('421', '1', '158', '105', '2', '第三方登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('422', '1', '158', '83', '2', '游客模式');
INSERT INTO `meiui_pic_link_tag` VALUES ('423', '1', '158', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('424', '1', '159', '110', '2', '邮箱注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('425', '1', '159', '125', '2', 'Steller');
INSERT INTO `meiui_pic_link_tag` VALUES ('426', '1', '160', '94', '2', 'loading');
INSERT INTO `meiui_pic_link_tag` VALUES ('427', '1', '160', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('428', '1', '161', '27', '2', '上传照片');
INSERT INTO `meiui_pic_link_tag` VALUES ('429', '1', '161', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('430', '1', '162', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('431', '1', '162', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('432', '1', '163', '128', '2', '关注话题');
INSERT INTO `meiui_pic_link_tag` VALUES ('433', '1', '163', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('434', '1', '164', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('435', '1', '164', '128', '2', '关注话题');
INSERT INTO `meiui_pic_link_tag` VALUES ('436', '1', '164', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('437', '1', '165', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('438', '1', '165', '135', '2', '遮罩层');
INSERT INTO `meiui_pic_link_tag` VALUES ('439', '1', '165', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('440', '1', '166', '136', '2', '国家设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('441', '1', '166', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('442', '1', '167', '32', '2', '密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('443', '1', '167', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('444', '1', '168', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('445', '1', '168', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('446', '1', '169', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('447', '1', '169', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('448', '1', '169', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('449', '1', '170', '6', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('450', '1', '170', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('451', '1', '170', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('452', '1', '171', '25', '2', '日期选择');
INSERT INTO `meiui_pic_link_tag` VALUES ('453', '1', '171', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('454', '1', '172', '19', '2', '标签');
INSERT INTO `meiui_pic_link_tag` VALUES ('455', '1', '172', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('456', '1', '173', '84', '2', '热门搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('457', '1', '173', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('458', '1', '174', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('459', '1', '174', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('460', '1', '175', '137', '2', '筛选');
INSERT INTO `meiui_pic_link_tag` VALUES ('461', '1', '175', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('462', '1', '176', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('463', '1', '176', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('464', '1', '177', '135', '2', '遮罩层');
INSERT INTO `meiui_pic_link_tag` VALUES ('465', '1', '177', '137', '2', '筛选');
INSERT INTO `meiui_pic_link_tag` VALUES ('466', '1', '177', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('467', '1', '178', '110', '2', '邮箱注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('468', '1', '178', '107', '2', 'Twitter');
INSERT INTO `meiui_pic_link_tag` VALUES ('469', '1', '179', '27', '2', '上传照片');
INSERT INTO `meiui_pic_link_tag` VALUES ('470', '1', '179', '14', '2', '简约');
INSERT INTO `meiui_pic_link_tag` VALUES ('471', '1', '179', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('472', '1', '180', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('473', '1', '180', '139', '2', '推荐');
INSERT INTO `meiui_pic_link_tag` VALUES ('474', '1', '180', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('475', '1', '181', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('476', '1', '181', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('477', '1', '182', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('478', '1', '182', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('479', '1', '183', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('480', '1', '183', '14', '2', '简约');
INSERT INTO `meiui_pic_link_tag` VALUES ('481', '1', '183', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('482', '1', '184', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('483', '1', '184', '140', '2', '选中');
INSERT INTO `meiui_pic_link_tag` VALUES ('484', '1', '184', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('485', '1', '185', '3', '2', '卡片式');
INSERT INTO `meiui_pic_link_tag` VALUES ('486', '1', '185', '58', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('487', '1', '185', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('488', '1', '186', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('489', '1', '186', '3', '2', '卡片式');
INSERT INTO `meiui_pic_link_tag` VALUES ('490', '1', '186', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('491', '1', '187', '42', '2', '意见反馈');
INSERT INTO `meiui_pic_link_tag` VALUES ('492', '1', '187', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('493', '1', '188', '59', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('494', '1', '188', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('495', '1', '189', '24', '2', '日历');
INSERT INTO `meiui_pic_link_tag` VALUES ('496', '1', '189', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('497', '1', '190', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('498', '1', '190', '138', '2', 'ZERO');
INSERT INTO `meiui_pic_link_tag` VALUES ('499', '1', '191', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('500', '1', '191', '141', '2', '独立设计');
INSERT INTO `meiui_pic_link_tag` VALUES ('501', '1', '191', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('502', '1', '192', '38', '2', '分类');
INSERT INTO `meiui_pic_link_tag` VALUES ('503', '1', '192', '143', '2', '品类');
INSERT INTO `meiui_pic_link_tag` VALUES ('504', '1', '192', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('505', '1', '193', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('506', '1', '193', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('507', '1', '193', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('508', '1', '194', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('509', '1', '194', '144', '2', '分类结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('510', '1', '194', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('511', '1', '195', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('512', '1', '195', '145', '2', '图文');
INSERT INTO `meiui_pic_link_tag` VALUES ('513', '1', '195', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('514', '1', '196', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('515', '1', '196', '14', '2', '简约');
INSERT INTO `meiui_pic_link_tag` VALUES ('516', '1', '196', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('517', '1', '197', '146', '2', '商品详情');
INSERT INTO `meiui_pic_link_tag` VALUES ('518', '1', '197', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('519', '1', '198', '146', '2', '商品详情');
INSERT INTO `meiui_pic_link_tag` VALUES ('520', '1', '198', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('521', '1', '198', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('522', '1', '199', '147', '2', '客户服务');
INSERT INTO `meiui_pic_link_tag` VALUES ('523', '1', '199', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('524', '1', '200', '42', '2', '意见反馈');
INSERT INTO `meiui_pic_link_tag` VALUES ('525', '1', '200', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('526', '1', '201', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('527', '1', '201', '148', '2', '收件人');
INSERT INTO `meiui_pic_link_tag` VALUES ('528', '1', '201', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('529', '1', '202', '149', '2', '消息为空');
INSERT INTO `meiui_pic_link_tag` VALUES ('530', '1', '202', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('531', '1', '203', '49', '2', '用户协议');
INSERT INTO `meiui_pic_link_tag` VALUES ('532', '1', '203', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('533', '1', '204', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('534', '1', '204', '105', '2', '第三方登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('535', '1', '204', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('536', '1', '205', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('537', '1', '205', '150', '2', '个人设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('538', '1', '205', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('539', '1', '205', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('540', '1', '206', '151', '2', '绑定手机');
INSERT INTO `meiui_pic_link_tag` VALUES ('541', '1', '206', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('542', '1', '207', '52', '2', '订单详情');
INSERT INTO `meiui_pic_link_tag` VALUES ('543', '1', '207', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('544', '1', '208', '54', '2', '购物车');
INSERT INTO `meiui_pic_link_tag` VALUES ('545', '1', '208', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('546', '1', '209', '152', '2', '购物车空');
INSERT INTO `meiui_pic_link_tag` VALUES ('547', '1', '209', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('548', '1', '210', '92', '2', '邀请');
INSERT INTO `meiui_pic_link_tag` VALUES ('549', '1', '210', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('550', '1', '210', '142', '2', '匠物');
INSERT INTO `meiui_pic_link_tag` VALUES ('551', '1', '211', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('552', '1', '211', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('553', '1', '211', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('554', '1', '212', '15', '2', '关于我们');
INSERT INTO `meiui_pic_link_tag` VALUES ('555', '1', '212', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('556', '1', '213', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('557', '1', '213', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('558', '1', '214', '154', '2', '功能介绍');
INSERT INTO `meiui_pic_link_tag` VALUES ('559', '1', '214', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('560', '1', '215', '5', '2', '地图');
INSERT INTO `meiui_pic_link_tag` VALUES ('561', '1', '215', '155', '2', '动画');
INSERT INTO `meiui_pic_link_tag` VALUES ('562', '1', '215', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('563', '1', '216', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('564', '1', '216', '155', '2', '动画');
INSERT INTO `meiui_pic_link_tag` VALUES ('565', '1', '216', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('566', '1', '217', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('567', '1', '217', '9', '2', '趋势图');
INSERT INTO `meiui_pic_link_tag` VALUES ('568', '1', '217', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('569', '1', '218', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('570', '1', '218', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('571', '1', '219', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('572', '1', '219', '155', '2', '动画');
INSERT INTO `meiui_pic_link_tag` VALUES ('573', '1', '219', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('574', '1', '220', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('575', '1', '220', '9', '2', '趋势图');
INSERT INTO `meiui_pic_link_tag` VALUES ('576', '1', '220', '153', '2', '彩云天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('577', '1', '221', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('578', '1', '221', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('579', '1', '221', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('580', '1', '221', '156', '2', '懒人天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('581', '1', '222', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('582', '1', '222', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('583', '1', '222', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('584', '1', '222', '156', '2', '懒人天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('585', '1', '223', '59', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('586', '1', '223', '156', '2', '懒人天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('587', '1', '224', '157', '2', '陈列式');
INSERT INTO `meiui_pic_link_tag` VALUES ('588', '1', '224', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('589', '1', '224', '156', '2', '懒人天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('590', '1', '225', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('591', '1', '225', '3', '2', '卡片式');
INSERT INTO `meiui_pic_link_tag` VALUES ('592', '1', '225', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('593', '1', '226', '29', '2', '城市设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('594', '1', '226', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('595', '1', '226', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('596', '1', '227', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('597', '1', '227', '159', '2', '上拉刷新');
INSERT INTO `meiui_pic_link_tag` VALUES ('598', '1', '227', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('599', '1', '228', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('600', '1', '228', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('601', '1', '228', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('602', '1', '229', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('603', '1', '229', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('604', '1', '229', '9', '2', '趋势图');
INSERT INTO `meiui_pic_link_tag` VALUES ('605', '1', '229', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('606', '1', '230', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('607', '1', '230', '9', '2', '趋势图');
INSERT INTO `meiui_pic_link_tag` VALUES ('608', '1', '230', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('609', '1', '230', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('610', '1', '231', '6', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('611', '1', '231', '29', '2', '城市设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('612', '1', '231', '21', '2', '搜索栏');
INSERT INTO `meiui_pic_link_tag` VALUES ('613', '1', '231', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('614', '1', '232', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('615', '1', '232', '67', '2', '设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('616', '1', '232', '158', '2', '我的天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('617', '1', '233', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('618', '1', '233', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('619', '1', '234', '15', '2', '关于我们');
INSERT INTO `meiui_pic_link_tag` VALUES ('620', '1', '234', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('621', '1', '235', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('622', '1', '235', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('623', '1', '235', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('624', '1', '236', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('625', '1', '236', '24', '2', '日历');
INSERT INTO `meiui_pic_link_tag` VALUES ('626', '1', '236', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('627', '1', '237', '16', '2', '同步');
INSERT INTO `meiui_pic_link_tag` VALUES ('628', '1', '237', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('629', '1', '238', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('630', '1', '238', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('631', '1', '239', '30', '2', '收藏');
INSERT INTO `meiui_pic_link_tag` VALUES ('632', '1', '239', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('633', '1', '240', '24', '2', '日历');
INSERT INTO `meiui_pic_link_tag` VALUES ('634', '1', '240', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('635', '1', '241', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('636', '1', '241', '114', '2', '注册页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('637', '1', '241', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('638', '1', '242', '157', '2', '陈列式');
INSERT INTO `meiui_pic_link_tag` VALUES ('639', '1', '242', '160', '2', '每日故宫');
INSERT INTO `meiui_pic_link_tag` VALUES ('640', '1', '243', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('641', '1', '243', '38', '2', '分类');
INSERT INTO `meiui_pic_link_tag` VALUES ('642', '1', '243', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('643', '1', '244', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('644', '1', '244', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('645', '1', '244', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('646', '1', '245', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('647', '1', '245', '18', '2', '排序');
INSERT INTO `meiui_pic_link_tag` VALUES ('648', '1', '245', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('649', '1', '246', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('650', '1', '246', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('651', '1', '246', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('652', '1', '247', '139', '2', '推荐');
INSERT INTO `meiui_pic_link_tag` VALUES ('653', '1', '247', '84', '2', '热门搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('654', '1', '247', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('655', '1', '248', '84', '2', '热门搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('656', '1', '248', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('657', '1', '248', '127', '2', '关注用户');
INSERT INTO `meiui_pic_link_tag` VALUES ('658', '1', '248', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('659', '1', '249', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('660', '1', '249', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('661', '1', '250', '130', '2', '通知权限');
INSERT INTO `meiui_pic_link_tag` VALUES ('662', '1', '250', '132', '2', '权限申请');
INSERT INTO `meiui_pic_link_tag` VALUES ('663', '1', '250', '161', '2', '用家');
INSERT INTO `meiui_pic_link_tag` VALUES ('664', '1', '251', '27', '2', '上传照片');
INSERT INTO `meiui_pic_link_tag` VALUES ('665', '1', '251', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('666', '1', '252', '97', '2', '个人信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('667', '1', '252', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('668', '1', '253', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('669', '1', '253', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('670', '1', '254', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('671', '1', '254', '163', '2', '缩略图');
INSERT INTO `meiui_pic_link_tag` VALUES ('672', '1', '254', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('673', '1', '255', '80', '2', '举报');
INSERT INTO `meiui_pic_link_tag` VALUES ('674', '1', '255', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('675', '1', '256', '164', '2', '信息编辑');
INSERT INTO `meiui_pic_link_tag` VALUES ('676', '1', '256', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('677', '1', '257', '165', '2', '修改信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('678', '1', '257', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('679', '1', '258', '15', '2', '关于我们');
INSERT INTO `meiui_pic_link_tag` VALUES ('680', '1', '258', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('681', '1', '259', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('682', '1', '259', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('683', '1', '260', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('684', '1', '260', '166', '2', '下载');
INSERT INTO `meiui_pic_link_tag` VALUES ('685', '1', '260', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('686', '1', '261', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('687', '1', '261', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('688', '1', '261', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('689', '1', '262', '167', '2', '失败提示');
INSERT INTO `meiui_pic_link_tag` VALUES ('690', '1', '262', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('691', '1', '263', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('692', '1', '263', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('693', '1', '263', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('694', '1', '264', '43', '2', '手机注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('695', '1', '264', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('696', '1', '265', '59', '2', '抽屉式');
INSERT INTO `meiui_pic_link_tag` VALUES ('697', '1', '265', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('698', '1', '266', '104', '2', '提示信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('699', '1', '266', '41', '2', '浮层');
INSERT INTO `meiui_pic_link_tag` VALUES ('700', '1', '266', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('701', '1', '267', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('702', '1', '267', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('703', '1', '267', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('704', '1', '268', '58', '2', '模板');
INSERT INTO `meiui_pic_link_tag` VALUES ('705', '1', '268', '168', '2', '明信片');
INSERT INTO `meiui_pic_link_tag` VALUES ('706', '1', '268', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('707', '1', '269', '116', '2', '滤镜');
INSERT INTO `meiui_pic_link_tag` VALUES ('708', '1', '269', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('709', '1', '270', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('710', '1', '270', '105', '2', '第三方登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('711', '1', '270', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('712', '1', '271', '105', '2', '第三方登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('713', '1', '271', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('714', '1', '271', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('715', '1', '272', '169', '2', '草稿箱');
INSERT INTO `meiui_pic_link_tag` VALUES ('716', '1', '272', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('717', '1', '273', '67', '2', '设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('718', '1', '273', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('719', '1', '274', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('720', '1', '274', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('721', '1', '275', '53', '2', '账户设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('722', '1', '275', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('723', '1', '276', '170', '2', '隐身模式');
INSERT INTO `meiui_pic_link_tag` VALUES ('724', '1', '276', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('725', '1', '276', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('726', '1', '277', '171', '2', '预览');
INSERT INTO `meiui_pic_link_tag` VALUES ('727', '1', '277', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('728', '1', '278', '120', '2', '验证码');
INSERT INTO `meiui_pic_link_tag` VALUES ('729', '1', '278', '162', '2', '留白');
INSERT INTO `meiui_pic_link_tag` VALUES ('730', '1', '279', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('731', '1', '279', '173', '2', 'FAQ');
INSERT INTO `meiui_pic_link_tag` VALUES ('732', '1', '279', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('733', '1', '279', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('734', '1', '280', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('735', '1', '280', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('736', '1', '280', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('737', '1', '280', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('738', '1', '281', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('739', '1', '281', '15', '2', '关于我们');
INSERT INTO `meiui_pic_link_tag` VALUES ('740', '1', '281', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('741', '1', '282', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('742', '1', '282', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('743', '1', '282', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('744', '1', '283', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('745', '1', '283', '29', '2', '城市设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('746', '1', '283', '175', '2', '地理信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('747', '1', '283', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('748', '1', '284', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('749', '1', '284', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('750', '1', '284', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('751', '1', '284', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('752', '1', '285', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('753', '1', '285', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('754', '1', '285', '1', '2', '空气质量');
INSERT INTO `meiui_pic_link_tag` VALUES ('755', '1', '285', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('756', '1', '286', '172', '2', '卡通');
INSERT INTO `meiui_pic_link_tag` VALUES ('757', '1', '286', '117', '2', '通知设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('758', '1', '286', '176', '2', '推送设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('759', '1', '286', '174', '2', '空气监测站');
INSERT INTO `meiui_pic_link_tag` VALUES ('760', '1', '287', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('761', '1', '287', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('762', '1', '287', '177', '2', '糗事百科');
INSERT INTO `meiui_pic_link_tag` VALUES ('763', '1', '288', '80', '2', '举报');
INSERT INTO `meiui_pic_link_tag` VALUES ('764', '1', '288', '177', '2', '糗事百科');
INSERT INTO `meiui_pic_link_tag` VALUES ('765', '1', '289', '80', '2', '举报');
INSERT INTO `meiui_pic_link_tag` VALUES ('766', '1', '289', '178', '2', '单选框');
INSERT INTO `meiui_pic_link_tag` VALUES ('767', '1', '289', '177', '2', '糗事百科');
INSERT INTO `meiui_pic_link_tag` VALUES ('768', '1', '290', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('769', '1', '290', '3', '2', '卡片式');
INSERT INTO `meiui_pic_link_tag` VALUES ('770', '1', '290', '177', '2', '糗事百科');
INSERT INTO `meiui_pic_link_tag` VALUES ('771', '1', '291', '179', '2', '发布动态');
INSERT INTO `meiui_pic_link_tag` VALUES ('772', '1', '291', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('773', '1', '291', '177', '2', '糗事百科');
INSERT INTO `meiui_pic_link_tag` VALUES ('774', '1', '292', '180', '2', '审核');
INSERT INTO `meiui_pic_link_tag` VALUES ('775', '1', '292', '99', '2', '公告');
INSERT INTO `meiui_pic_link_tag` VALUES ('776', '1', '292', '177', '2', '糗事百科');
INSERT INTO `meiui_pic_link_tag` VALUES ('777', '1', '293', '180', '2', '审核');
INSERT INTO `meiui_pic_link_tag` VALUES ('778', '1', '293', '181', '2', '内容审核');
INSERT INTO `meiui_pic_link_tag` VALUES ('779', '1', '293', '177', '2', '糗事百科');
INSERT INTO `meiui_pic_link_tag` VALUES ('780', '1', '294', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('781', '1', '294', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('782', '1', '295', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('783', '1', '295', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('784', '1', '296', '80', '2', '举报');
INSERT INTO `meiui_pic_link_tag` VALUES ('785', '1', '296', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('786', '1', '297', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('787', '1', '297', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('788', '1', '298', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('789', '1', '298', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('790', '1', '298', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('791', '1', '299', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('792', '1', '299', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('793', '1', '300', '183', '2', '发现');
INSERT INTO `meiui_pic_link_tag` VALUES ('794', '1', '300', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('795', '1', '301', '66', '2', '引导页');
INSERT INTO `meiui_pic_link_tag` VALUES ('796', '1', '301', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('797', '1', '302', '46', '2', '搜索关键词');
INSERT INTO `meiui_pic_link_tag` VALUES ('798', '1', '302', '6', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('799', '1', '302', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('800', '1', '303', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('801', '1', '303', '6', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('802', '1', '303', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('803', '1', '304', '6', '2', '搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('804', '1', '304', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('805', '1', '304', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('806', '1', '305', '23', '2', '新增');
INSERT INTO `meiui_pic_link_tag` VALUES ('807', '1', '305', '22', '2', '新建');
INSERT INTO `meiui_pic_link_tag` VALUES ('808', '1', '305', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('809', '1', '306', '149', '2', '消息为空');
INSERT INTO `meiui_pic_link_tag` VALUES ('810', '1', '306', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('811', '1', '307', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('812', '1', '307', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('813', '1', '308', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('814', '1', '308', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('815', '1', '309', '184', '2', '评论页');
INSERT INTO `meiui_pic_link_tag` VALUES ('816', '1', '309', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('817', '1', '310', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('818', '1', '310', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('819', '1', '311', '110', '2', '邮箱注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('820', '1', '311', '182', '2', '艺术云图');
INSERT INTO `meiui_pic_link_tag` VALUES ('821', '1', '312', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('822', '1', '312', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('823', '1', '313', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('824', '1', '313', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('825', '1', '313', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('826', '1', '314', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('827', '1', '314', '186', '2', '收藏结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('828', '1', '314', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('829', '1', '315', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('830', '1', '315', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('831', '1', '316', '165', '2', '修改信息');
INSERT INTO `meiui_pic_link_tag` VALUES ('832', '1', '316', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('833', '1', '317', '187', '2', '兑换页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('834', '1', '317', '188', '2', '兑换记录');
INSERT INTO `meiui_pic_link_tag` VALUES ('835', '1', '317', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('836', '1', '318', '15', '2', '关于我们');
INSERT INTO `meiui_pic_link_tag` VALUES ('837', '1', '318', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('838', '1', '319', '127', '2', '关注用户');
INSERT INTO `meiui_pic_link_tag` VALUES ('839', '1', '319', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('840', '1', '319', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('841', '1', '320', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('842', '1', '320', '127', '2', '关注用户');
INSERT INTO `meiui_pic_link_tag` VALUES ('843', '1', '320', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('844', '1', '321', '37', '2', '分享');
INSERT INTO `meiui_pic_link_tag` VALUES ('845', '1', '321', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('846', '1', '322', '183', '2', '发现');
INSERT INTO `meiui_pic_link_tag` VALUES ('847', '1', '322', '189', '2', '热门推荐');
INSERT INTO `meiui_pic_link_tag` VALUES ('848', '1', '322', '190', '2', '热点');
INSERT INTO `meiui_pic_link_tag` VALUES ('849', '1', '322', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('850', '1', '323', '29', '2', '城市设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('851', '1', '323', '40', '2', '定位服务');
INSERT INTO `meiui_pic_link_tag` VALUES ('852', '1', '323', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('853', '1', '324', '102', '2', '帮助');
INSERT INTO `meiui_pic_link_tag` VALUES ('854', '1', '324', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('855', '1', '325', '42', '2', '意见反馈');
INSERT INTO `meiui_pic_link_tag` VALUES ('856', '1', '325', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('857', '1', '326', '43', '2', '手机注册');
INSERT INTO `meiui_pic_link_tag` VALUES ('858', '1', '326', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('859', '1', '327', '191', '2', '手机登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('860', '1', '327', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('861', '1', '327', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('862', '1', '328', '192', '2', '搜索为空');
INSERT INTO `meiui_pic_link_tag` VALUES ('863', '1', '328', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('864', '1', '329', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('865', '1', '329', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('866', '1', '330', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('867', '1', '330', '100', '2', '关注');
INSERT INTO `meiui_pic_link_tag` VALUES ('868', '1', '330', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('869', '1', '331', '48', '2', '消息页');
INSERT INTO `meiui_pic_link_tag` VALUES ('870', '1', '331', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('871', '1', '332', '193', '2', '版本更新');
INSERT INTO `meiui_pic_link_tag` VALUES ('872', '1', '332', '68', '2', '弹窗');
INSERT INTO `meiui_pic_link_tag` VALUES ('873', '1', '332', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('874', '1', '333', '49', '2', '用户协议');
INSERT INTO `meiui_pic_link_tag` VALUES ('875', '1', '333', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('876', '1', '334', '50', '2', '登录页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('877', '1', '334', '194', '2', '三方登录');
INSERT INTO `meiui_pic_link_tag` VALUES ('878', '1', '334', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('879', '1', '335', '195', '2', '积分明细');
INSERT INTO `meiui_pic_link_tag` VALUES ('880', '1', '335', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('881', '1', '336', '196', '2', '积分');
INSERT INTO `meiui_pic_link_tag` VALUES ('882', '1', '336', '187', '2', '兑换页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('883', '1', '336', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('884', '1', '337', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('885', '1', '337', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('886', '1', '338', '197', '2', '认证');
INSERT INTO `meiui_pic_link_tag` VALUES ('887', '1', '338', '72', '2', '身份验证');
INSERT INTO `meiui_pic_link_tag` VALUES ('888', '1', '338', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('889', '1', '339', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('890', '1', '339', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('891', '1', '340', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('892', '1', '340', '198', '2', '活动');
INSERT INTO `meiui_pic_link_tag` VALUES ('893', '1', '340', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('894', '1', '341', '56', '2', '重置密码');
INSERT INTO `meiui_pic_link_tag` VALUES ('895', '1', '341', '185', '2', '艺术狗');
INSERT INTO `meiui_pic_link_tag` VALUES ('896', '1', '342', '199', '2', '专题');
INSERT INTO `meiui_pic_link_tag` VALUES ('897', '1', '342', '2', '2', '列表');
INSERT INTO `meiui_pic_link_tag` VALUES ('898', '1', '342', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('899', '1', '343', '76', '2', '个人主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('900', '1', '343', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('901', '1', '344', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('902', '1', '344', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('903', '1', '345', '38', '2', '分类');
INSERT INTO `meiui_pic_link_tag` VALUES ('904', '1', '345', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('905', '1', '346', '201', '2', '商品详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('906', '1', '346', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('907', '1', '347', '18', '2', '排序');
INSERT INTO `meiui_pic_link_tag` VALUES ('908', '1', '347', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('909', '1', '348', '46', '2', '搜索关键词');
INSERT INTO `meiui_pic_link_tag` VALUES ('910', '1', '348', '84', '2', '热门搜索');
INSERT INTO `meiui_pic_link_tag` VALUES ('911', '1', '348', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('912', '1', '349', '20', '2', '搜索结果');
INSERT INTO `meiui_pic_link_tag` VALUES ('913', '1', '349', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('914', '1', '350', '114', '2', '注册页面');
INSERT INTO `meiui_pic_link_tag` VALUES ('915', '1', '350', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('916', '1', '351', '149', '2', '消息为空');
INSERT INTO `meiui_pic_link_tag` VALUES ('917', '1', '351', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('918', '1', '352', '7', '2', '详情页');
INSERT INTO `meiui_pic_link_tag` VALUES ('919', '1', '352', '200', '2', '薄荷家居');
INSERT INTO `meiui_pic_link_tag` VALUES ('920', '1', '353', '12', '2', '主页');
INSERT INTO `meiui_pic_link_tag` VALUES ('921', '1', '353', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('922', '1', '353', '202', '2', '中国风');
INSERT INTO `meiui_pic_link_tag` VALUES ('923', '1', '353', '203', '2', '雨时');
INSERT INTO `meiui_pic_link_tag` VALUES ('924', '1', '354', '29', '2', '城市设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('925', '1', '354', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('926', '1', '354', '203', '2', '雨时');
INSERT INTO `meiui_pic_link_tag` VALUES ('927', '1', '355', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('928', '1', '355', '204', '2', '列表页');
INSERT INTO `meiui_pic_link_tag` VALUES ('929', '1', '355', '202', '2', '中国风');
INSERT INTO `meiui_pic_link_tag` VALUES ('930', '1', '355', '203', '2', '雨时');
INSERT INTO `meiui_pic_link_tag` VALUES ('931', '1', '356', '8', '2', '天气');
INSERT INTO `meiui_pic_link_tag` VALUES ('932', '1', '356', '29', '2', '城市设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('933', '1', '356', '203', '2', '雨时');
INSERT INTO `meiui_pic_link_tag` VALUES ('934', '1', '357', '67', '2', '设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('935', '1', '357', '34', '2', '系统设置');
INSERT INTO `meiui_pic_link_tag` VALUES ('936', '1', '357', '203', '2', '雨时');

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
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meiui_tag
-- ----------------------------
INSERT INTO `meiui_tag` VALUES ('1', '空气质量', '1', '1459866800', '2', '1');
INSERT INTO `meiui_tag` VALUES ('2', '列表', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('3', '卡片式', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('4', 'AirVisual', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('5', '地图', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('6', '搜索', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('7', '详情页', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('8', '天气', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('9', '趋势图', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('10', 'Timeline', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('11', 'Day One', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('12', '主页', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('13', '日记', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('14', '简约', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('15', '关于我们', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('16', '同步', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('17', '同步设置', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('18', '排序', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('19', '标签', '1', '1459866801', '2', '1');
INSERT INTO `meiui_tag` VALUES ('20', '搜索结果', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('21', '搜索栏', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('22', '新建', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('23', '新增', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('24', '日历', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('25', '日期选择', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('26', '日期', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('27', '上传照片', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('28', '操作栏', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('29', '城市设置', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('30', '收藏', '1', '1459866802', '2', '1');
INSERT INTO `meiui_tag` VALUES ('31', '程序密码', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('32', '密码', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('33', '解锁密码', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('34', '系统设置', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('35', 'Enjoy', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('36', '优惠券', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('37', '分享', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('38', '分类', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('39', '切换位置', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('40', '定位服务', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('41', '浮层', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('42', '意见反馈', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('43', '手机注册', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('44', '找回密码', '1', '1459866803', '2', '1');
INSERT INTO `meiui_tag` VALUES ('45', '提交订单', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('46', '搜索关键词', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('47', '收藏为空', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('48', '消息页', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('49', '用户协议', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('50', '登录页面', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('51', '订单列表', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('52', '订单详情', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('53', '账户设置', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('54', '购物车', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('55', '邀请好友', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('56', '重置密码', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('57', 'IF', '1', '1459866804', '2', '1');
INSERT INTO `meiui_tag` VALUES ('58', '模板', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('59', '抽屉式', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('60', 'evernote', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('61', '印象笔记', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('62', 'weibo', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('63', '微博', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('64', '邮件', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('65', 'Inbox', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('66', '引导页', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('67', '设置', '1', '1459866805', '2', '1');
INSERT INTO `meiui_tag` VALUES ('68', '弹窗', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('69', '按钮', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('70', 'Material Design', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('71', '草稿为空', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('72', '身份验证', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('73', '登录', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('74', '邮箱', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('75', '收件箱', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('76', '个人主页', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('77', 'Like', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('78', '主题', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('79', '订阅', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('80', '举报', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('81', '关注为空', '1', '1459866806', '2', '1');
INSERT INTO `meiui_tag` VALUES ('82', '排行', '1', '1459866807', '2', '1');
INSERT INTO `meiui_tag` VALUES ('83', '游客模式', '1', '1459866807', '2', '1');
INSERT INTO `meiui_tag` VALUES ('84', '热门搜索', '1', '1459866807', '2', '1');
INSERT INTO `meiui_tag` VALUES ('85', 'Notability', '1', '1459866807', '2', '1');
INSERT INTO `meiui_tag` VALUES ('86', '工具栏', '1', '1459866807', '2', '1');
INSERT INTO `meiui_tag` VALUES ('87', '画笔', '1', '1459866807', '2', '1');
INSERT INTO `meiui_tag` VALUES ('88', '主题设置', '1', '1459866808', '2', '1');
INSERT INTO `meiui_tag` VALUES ('89', '输入设置', '1', '1459866808', '2', '1');
INSERT INTO `meiui_tag` VALUES ('90', '编辑', '1', '1459866808', '2', '1');
INSERT INTO `meiui_tag` VALUES ('91', 'OPEN开腔', '1', '1459866808', '2', '1');
INSERT INTO `meiui_tag` VALUES ('92', '邀请', '1', '1459866808', '2', '1');
INSERT INTO `meiui_tag` VALUES ('93', 'Paper', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('94', 'loading', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('95', '授予权限', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('96', '登录页', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('97', '个人信息', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('98', 'Paper 53', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('99', '公告', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('100', '关注', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('101', '涂鸦', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('102', '帮助', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('103', '提示', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('104', '提示信息', '1', '1459866809', '2', '1');
INSERT INTO `meiui_tag` VALUES ('105', '第三方登录', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('106', '账户连接', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('107', 'Twitter', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('108', '联系人', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('109', '通讯录', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('110', '邮箱注册', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('111', '时间线', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('112', 'Path', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('113', '弹出按钮', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('114', '注册页面', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('115', '手机验证', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('116', '滤镜', '1', '1459866810', '2', '1');
INSERT INTO `meiui_tag` VALUES ('117', '通知设置', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('118', '邮箱提醒', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('119', '手机提醒', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('120', '验证码', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('121', '闹钟', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('122', 'Sleep Cycle', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('123', '统计', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('124', '柱状图', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('125', 'Steller', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('126', '创建主题', '1', '1459866811', '2', '1');
INSERT INTO `meiui_tag` VALUES ('127', '关注用户', '1', '1459866812', '2', '1');
INSERT INTO `meiui_tag` VALUES ('128', '关注话题', '1', '1459866812', '2', '1');
INSERT INTO `meiui_tag` VALUES ('129', '照片权限', '1', '1459866812', '2', '1');
INSERT INTO `meiui_tag` VALUES ('130', '通知权限', '1', '1459866812', '2', '1');
INSERT INTO `meiui_tag` VALUES ('131', '排行榜', '1', '1459866812', '2', '1');
INSERT INTO `meiui_tag` VALUES ('132', '权限申请', '1', '1459866812', '2', '1');
INSERT INTO `meiui_tag` VALUES ('133', '手势介绍', '1', '1459866812', '2', '1');
INSERT INTO `meiui_tag` VALUES ('134', '瀑布流', '1', '1459866813', '2', '1');
INSERT INTO `meiui_tag` VALUES ('135', '遮罩层', '1', '1459866813', '2', '1');
INSERT INTO `meiui_tag` VALUES ('136', '国家设置', '1', '1459866813', '2', '1');
INSERT INTO `meiui_tag` VALUES ('137', '筛选', '1', '1459866814', '2', '1');
INSERT INTO `meiui_tag` VALUES ('138', 'ZERO', '1', '1459866814', '2', '1');
INSERT INTO `meiui_tag` VALUES ('139', '推荐', '1', '1459866814', '2', '1');
INSERT INTO `meiui_tag` VALUES ('140', '选中', '1', '1459866814', '2', '1');
INSERT INTO `meiui_tag` VALUES ('141', '独立设计', '1', '1459866815', '2', '1');
INSERT INTO `meiui_tag` VALUES ('142', '匠物', '1', '1459866815', '2', '1');
INSERT INTO `meiui_tag` VALUES ('143', '品类', '1', '1459866815', '2', '1');
INSERT INTO `meiui_tag` VALUES ('144', '分类结果', '1', '1459866815', '2', '1');
INSERT INTO `meiui_tag` VALUES ('145', '图文', '1', '1459866815', '2', '1');
INSERT INTO `meiui_tag` VALUES ('146', '商品详情', '1', '1459866815', '2', '1');
INSERT INTO `meiui_tag` VALUES ('147', '客户服务', '1', '1459866815', '2', '1');
INSERT INTO `meiui_tag` VALUES ('148', '收件人', '1', '1459866816', '2', '1');
INSERT INTO `meiui_tag` VALUES ('149', '消息为空', '1', '1459866816', '2', '1');
INSERT INTO `meiui_tag` VALUES ('150', '个人设置', '1', '1459866816', '2', '1');
INSERT INTO `meiui_tag` VALUES ('151', '绑定手机', '1', '1459866816', '2', '1');
INSERT INTO `meiui_tag` VALUES ('152', '购物车空', '1', '1459866816', '2', '1');
INSERT INTO `meiui_tag` VALUES ('153', '彩云天气', '1', '1459866816', '2', '1');
INSERT INTO `meiui_tag` VALUES ('154', '功能介绍', '1', '1459866816', '2', '1');
INSERT INTO `meiui_tag` VALUES ('155', '动画', '1', '1459866817', '2', '1');
INSERT INTO `meiui_tag` VALUES ('156', '懒人天气', '1', '1459866817', '2', '1');
INSERT INTO `meiui_tag` VALUES ('157', '陈列式', '1', '1459866817', '2', '1');
INSERT INTO `meiui_tag` VALUES ('158', '我的天气', '1', '1459866817', '2', '1');
INSERT INTO `meiui_tag` VALUES ('159', '上拉刷新', '1', '1459866818', '2', '1');
INSERT INTO `meiui_tag` VALUES ('160', '每日故宫', '1', '1459866818', '2', '1');
INSERT INTO `meiui_tag` VALUES ('161', '用家', '1', '1459866819', '2', '1');
INSERT INTO `meiui_tag` VALUES ('162', '留白', '1', '1459866819', '2', '1');
INSERT INTO `meiui_tag` VALUES ('163', '缩略图', '1', '1459866819', '2', '1');
INSERT INTO `meiui_tag` VALUES ('164', '信息编辑', '1', '1459866820', '2', '1');
INSERT INTO `meiui_tag` VALUES ('165', '修改信息', '1', '1459866820', '2', '1');
INSERT INTO `meiui_tag` VALUES ('166', '下载', '1', '1459866820', '2', '1');
INSERT INTO `meiui_tag` VALUES ('167', '失败提示', '1', '1459866820', '2', '1');
INSERT INTO `meiui_tag` VALUES ('168', '明信片', '1', '1459866820', '2', '1');
INSERT INTO `meiui_tag` VALUES ('169', '草稿箱', '1', '1459866821', '2', '1');
INSERT INTO `meiui_tag` VALUES ('170', '隐身模式', '1', '1459866821', '2', '1');
INSERT INTO `meiui_tag` VALUES ('171', '预览', '1', '1459866821', '2', '1');
INSERT INTO `meiui_tag` VALUES ('172', '卡通', '1', '1459866821', '2', '1');
INSERT INTO `meiui_tag` VALUES ('173', 'FAQ', '1', '1459866821', '2', '1');
INSERT INTO `meiui_tag` VALUES ('174', '空气监测站', '1', '1459866821', '2', '1');
INSERT INTO `meiui_tag` VALUES ('175', '地理信息', '1', '1459866822', '2', '1');
INSERT INTO `meiui_tag` VALUES ('176', '推送设置', '1', '1459866822', '2', '1');
INSERT INTO `meiui_tag` VALUES ('177', '糗事百科', '1', '1459866822', '2', '1');
INSERT INTO `meiui_tag` VALUES ('178', '单选框', '1', '1459866822', '2', '1');
INSERT INTO `meiui_tag` VALUES ('179', '发布动态', '1', '1459866822', '2', '1');
INSERT INTO `meiui_tag` VALUES ('180', '审核', '1', '1459866822', '2', '1');
INSERT INTO `meiui_tag` VALUES ('181', '内容审核', '1', '1459866822', '2', '1');
INSERT INTO `meiui_tag` VALUES ('182', '艺术云图', '1', '1459866823', '2', '1');
INSERT INTO `meiui_tag` VALUES ('183', '发现', '1', '1459866823', '2', '1');
INSERT INTO `meiui_tag` VALUES ('184', '评论页', '1', '1459866824', '2', '1');
INSERT INTO `meiui_tag` VALUES ('185', '艺术狗', '1', '1459866824', '2', '1');
INSERT INTO `meiui_tag` VALUES ('186', '收藏结果', '1', '1459866824', '2', '1');
INSERT INTO `meiui_tag` VALUES ('187', '兑换页面', '1', '1459866824', '2', '1');
INSERT INTO `meiui_tag` VALUES ('188', '兑换记录', '1', '1459866824', '2', '1');
INSERT INTO `meiui_tag` VALUES ('189', '热门推荐', '1', '1459866824', '2', '1');
INSERT INTO `meiui_tag` VALUES ('190', '热点', '1', '1459866824', '2', '1');
INSERT INTO `meiui_tag` VALUES ('191', '手机登录', '1', '1459866825', '2', '1');
INSERT INTO `meiui_tag` VALUES ('192', '搜索为空', '1', '1459866825', '2', '1');
INSERT INTO `meiui_tag` VALUES ('193', '版本更新', '1', '1459866825', '2', '1');
INSERT INTO `meiui_tag` VALUES ('194', '三方登录', '1', '1459866825', '2', '1');
INSERT INTO `meiui_tag` VALUES ('195', '积分明细', '1', '1459866825', '2', '1');
INSERT INTO `meiui_tag` VALUES ('196', '积分', '1', '1459866825', '2', '1');
INSERT INTO `meiui_tag` VALUES ('197', '认证', '1', '1459866826', '2', '1');
INSERT INTO `meiui_tag` VALUES ('198', '活动', '1', '1459866826', '2', '1');
INSERT INTO `meiui_tag` VALUES ('199', '专题', '1', '1459866826', '2', '1');
INSERT INTO `meiui_tag` VALUES ('200', '薄荷家居', '1', '1459866826', '2', '1');
INSERT INTO `meiui_tag` VALUES ('201', '商品详情页', '1', '1459866826', '2', '1');
INSERT INTO `meiui_tag` VALUES ('202', '中国风', '1', '1459866827', '2', '1');
INSERT INTO `meiui_tag` VALUES ('203', '雨时', '1', '1459866827', '2', '1');
INSERT INTO `meiui_tag` VALUES ('204', '列表页', '1', '1459866827', '2', '1');

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
