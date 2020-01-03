/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : fastadmin_jhjkh

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-01-04 01:05:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', 'admin', 'Admin', 'e13cca8b364e098adcd8da41c3a7b254', '2edd77', '/uploads/20200102/f57ebce8a72b823912904fe76eda0909.png', 'admin@admin.com', '0', '1577977489', '127.0.0.1', '1492186163', '1577977574', '1808a3e3-52c0-4fb8-b05e-84b1ab3e5471', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES ('1', '1', 'admin', '/gWqP6hutKT.php/index/login?url=%2FgWqP6hutKT.php', '登录', '{\"url\":\"\\/gWqP6hutKT.php\",\"__token__\":\"9d77bfe3dd4c7e22cae05b8d84b1bb83\",\"username\":\"admin\",\"captcha\":\"c7yt\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715400');
INSERT INTO `fa_admin_log` VALUES ('2', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715829');
INSERT INTO `fa_admin_log` VALUES ('3', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715830');
INSERT INTO `fa_admin_log` VALUES ('4', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_plan_data\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715834');
INSERT INTO `fa_admin_log` VALUES ('5', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_data\",\"controller\":\"app\\/PlanData\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715849');
INSERT INTO `fa_admin_log` VALUES ('6', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_data\",\"controller\":\"app\\/PlanData\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715849');
INSERT INTO `fa_admin_log` VALUES ('7', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715849');
INSERT INTO `fa_admin_log` VALUES ('8', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715853');
INSERT INTO `fa_admin_log` VALUES ('9', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715855');
INSERT INTO `fa_admin_log` VALUES ('10', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715857');
INSERT INTO `fa_admin_log` VALUES ('11', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/PlanData.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715858');
INSERT INTO `fa_admin_log` VALUES ('12', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/PlanData.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715859');
INSERT INTO `fa_admin_log` VALUES ('13', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715859');
INSERT INTO `fa_admin_log` VALUES ('14', '1', 'admin', '/gWqP6hutKT.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"22c9f55364b88bd0adac80d029acda80\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"plan\",\"title\":\"\\u8ba1\\u5212\\u4e2d\\u5fc3\",\"icon\":\"fa fa-glide\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715918');
INSERT INTO `fa_admin_log` VALUES ('15', '1', 'admin', '/gWqP6hutKT.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"82e54cb4f80ea4f39adc024f4499ab01\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"plan\",\"title\":\"\\u8ba1\\u5212\\u4e2d\\u5fc3\",\"icon\":\"fa fa-glide\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715920');
INSERT INTO `fa_admin_log` VALUES ('16', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715920');
INSERT INTO `fa_admin_log` VALUES ('17', '1', 'admin', '/gWqP6hutKT.php/auth/rule/edit/ids/278?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"6dce67327ce3f3a0c1a6743bd8df3928\",\"row\":{\"ismenu\":\"1\",\"pid\":\"284\",\"name\":\"app\\/plan_data\",\"title\":\"\\u6570\\u636e\\u7c7b\\u578b\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"278\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715937');
INSERT INTO `fa_admin_log` VALUES ('18', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577715937');
INSERT INTO `fa_admin_log` VALUES ('19', '1', 'admin', '/gWqP6hutKT.php/app/plan_data/add?dialog=1', '小程序设置 数据类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u4f53\\u91cd\",\"sketch\":\"\\u4f53\\u91cd\\u7b80\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577716040');
INSERT INTO `fa_admin_log` VALUES ('20', '1', 'admin', '/gWqP6hutKT.php/app/plan_data/add?dialog=1', '小程序设置 数据类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u8840\\u538b\",\"sketch\":\"\\u8840\\u538b\\u7b80\\u8ff0\",\"type_id\":\"1\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577716050');
INSERT INTO `fa_admin_log` VALUES ('21', '1', 'admin', '/gWqP6hutKT.php/app/plan_data/add?dialog=1', '小程序设置 数据类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u8840\\u7cd6\",\"sketch\":\"\\u8840\\u7cd6\\u7b80\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577716064');
INSERT INTO `fa_admin_log` VALUES ('22', '1', 'admin', '/gWqP6hutKT.php/app/plan_data/add?dialog=1', '小程序设置 数据类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u5fc3\\u7387\",\"sketch\":\"\\u5fc3\\u7387\\u7b80\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577716083');
INSERT INTO `fa_admin_log` VALUES ('23', '1', 'admin', '/gWqP6hutKT.php/app/plan_data/add?dialog=1', '小程序设置 数据类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u5c3f\\u9178\\u503c\",\"sketch\":\"\\u5c3f\\u9178\\u503c\\u7b80\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577716099');
INSERT INTO `fa_admin_log` VALUES ('24', '1', 'admin', '/gWqP6hutKT.php/app/plan_data/add?dialog=1', '小程序设置 数据类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u4f4e\\u5bc6\\u5ea6\\u80c6\\u56fa\\u9187\",\"sketch\":\"\\u4f4e\\u5bc6\\u5ea6\\u80c6\\u56fa\\u9187\\u7b80\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577716118');
INSERT INTO `fa_admin_log` VALUES ('25', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717305');
INSERT INTO `fa_admin_log` VALUES ('26', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717308');
INSERT INTO `fa_admin_log` VALUES ('27', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717312');
INSERT INTO `fa_admin_log` VALUES ('28', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717330');
INSERT INTO `fa_admin_log` VALUES ('29', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717331');
INSERT INTO `fa_admin_log` VALUES ('30', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/PlanRecipe.php,app\\/PlanSport.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717332');
INSERT INTO `fa_admin_log` VALUES ('31', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/PlanRecipe.php,app\\/PlanSport.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717333');
INSERT INTO `fa_admin_log` VALUES ('32', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717334');
INSERT INTO `fa_admin_log` VALUES ('33', '1', 'admin', '/gWqP6hutKT.php/auth/rule/edit/ids/285?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e0d18cdbcd3cb9e858d4430d9609c167\",\"row\":{\"ismenu\":\"1\",\"pid\":\"284\",\"name\":\"app\\/plan_recipe\",\"title\":\"\\u98df\\u8c31\\u7c7b\\u578b\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"285\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717347');
INSERT INTO `fa_admin_log` VALUES ('34', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717347');
INSERT INTO `fa_admin_log` VALUES ('35', '1', 'admin', '/gWqP6hutKT.php/auth/rule/edit/ids/291?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"c311f9fdcbc5d9fed4843cbc17ae5ff9\",\"row\":{\"ismenu\":\"1\",\"pid\":\"284\",\"name\":\"app\\/plan_sport\",\"title\":\"\\u8fd0\\u52a8\\u7c7b\\u578b\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"291\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717358');
INSERT INTO `fa_admin_log` VALUES ('36', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577717358');
INSERT INTO `fa_admin_log` VALUES ('37', '1', 'admin', '/gWqP6hutKT.php/app/plan_recipe/add?dialog=1', '小程序设置 食谱类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u65e9\\u9910\",\"sketch\":\"\\u65e9\\u9910\\u63cf\\u8ff0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718298');
INSERT INTO `fa_admin_log` VALUES ('38', '1', 'admin', '/gWqP6hutKT.php/app/plan_recipe/add?dialog=1', '小程序设置 食谱类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u65e9\\u52a0\\u9910\",\"sketch\":\"\\u65e9\\u52a0\\u9910\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718316');
INSERT INTO `fa_admin_log` VALUES ('39', '1', 'admin', '/gWqP6hutKT.php/app/plan_recipe/add?dialog=1', '小程序设置 食谱类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u5348\\u9910\",\"sketch\":\"\\u5348\\u9910\\u7b80\\u8ff0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718334');
INSERT INTO `fa_admin_log` VALUES ('40', '1', 'admin', '/gWqP6hutKT.php/app/plan_recipe/add?dialog=1', '小程序设置 食谱类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u52a0\\u9910\",\"sketch\":\"\\u52a0\\u9910\\u7b80\\u8ff0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718344');
INSERT INTO `fa_admin_log` VALUES ('41', '1', 'admin', '/gWqP6hutKT.php/app/plan_recipe/add?dialog=1', '小程序设置 食谱类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u665a\\u9910\",\"sketch\":\"\\u665a\\u9910\\u7b80\\u8ff0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718359');
INSERT INTO `fa_admin_log` VALUES ('42', '1', 'admin', '/gWqP6hutKT.php/app/plan_recipe/edit/ids/4?dialog=1', '小程序设置 食谱类型 编辑', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u5348\\u52a0\\u9910\",\"sketch\":\"\\u52a0\\u9910\\u7b80\\u8ff0\",\"sort\":\"0\",\"status\":\"1\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718383');
INSERT INTO `fa_admin_log` VALUES ('43', '1', 'admin', '/gWqP6hutKT.php/app/plan_sport/add?dialog=1', '小程序设置 运动类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u592a\\u6781\\u62f3\",\"sketch\":\"\\u592a\\u6781\\u62f3\\u7b80\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718666');
INSERT INTO `fa_admin_log` VALUES ('44', '1', 'admin', '/gWqP6hutKT.php/app/plan_sport/add?dialog=1', '小程序设置 运动类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u8d70\\u6b65\",\"sketch\":\"\\u8d70\\u6b65\\u63cf\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718718');
INSERT INTO `fa_admin_log` VALUES ('45', '1', 'admin', '/gWqP6hutKT.php/app/plan_sport/add?dialog=1', '小程序设置 运动类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u6162\\u8dd1\",\"sketch\":\"\\u6162\\u8dd1\\u63cf\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718761');
INSERT INTO `fa_admin_log` VALUES ('46', '1', 'admin', '/gWqP6hutKT.php/app/plan_sport/add?dialog=1', '小程序设置 运动类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u5065\\u5eb7\\u64cd\",\"sketch\":\"\\u5065\\u5eb7\\u64cd\\u63cf\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718774');
INSERT INTO `fa_admin_log` VALUES ('47', '1', 'admin', '/gWqP6hutKT.php/app/plan_sport/add?dialog=1', '小程序设置 运动类型 添加', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u6e38\\u6cf3\",\"sketch\":\"\\u6e38\\u6cf3\\u63cf\\u8ff0\",\"type_id\":\"0\",\"sort\":\"0\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718799');
INSERT INTO `fa_admin_log` VALUES ('48', '1', 'admin', '/gWqP6hutKT.php/app/plan_sport/edit/ids/4?dialog=1', '小程序设置 运动类型 编辑', '{\"dialog\":\"1\",\"row\":{\"cover_image\":\"\\/uploads\\/20191229\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"name\":\"\\u5065\\u5eb7\\u64cd\",\"sketch\":\"\\u5065\\u5eb7\\u64cd\\u63cf\\u8ff0\",\"type_id\":\"1\",\"sort\":\"0\",\"status\":\"1\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577718806');
INSERT INTO `fa_admin_log` VALUES ('49', '1', 'admin', '/gWqP6hutKT.php/index/login?url=%2FgWqP6hutKT.php', '登录', '{\"url\":\"\\/gWqP6hutKT.php\",\"__token__\":\"b35f98cc8880cbdbe8765142aa49148d\",\"username\":\"admin\",\"captcha\":\"4vqj\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577872340');
INSERT INTO `fa_admin_log` VALUES ('50', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874362');
INSERT INTO `fa_admin_log` VALUES ('51', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_dynamic\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874366');
INSERT INTO `fa_admin_log` VALUES ('52', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_dynamic\",\"controller\":\"app\\/Dynamic\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874452');
INSERT INTO `fa_admin_log` VALUES ('53', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874458');
INSERT INTO `fa_admin_log` VALUES ('54', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874458');
INSERT INTO `fa_admin_log` VALUES ('55', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874458');
INSERT INTO `fa_admin_log` VALUES ('56', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874458');
INSERT INTO `fa_admin_log` VALUES ('57', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_activity\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874460');
INSERT INTO `fa_admin_log` VALUES ('58', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_activity\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874460');
INSERT INTO `fa_admin_log` VALUES ('59', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874465');
INSERT INTO `fa_admin_log` VALUES ('60', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874465');
INSERT INTO `fa_admin_log` VALUES ('61', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874465');
INSERT INTO `fa_admin_log` VALUES ('62', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874465');
INSERT INTO `fa_admin_log` VALUES ('63', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_article\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874471');
INSERT INTO `fa_admin_log` VALUES ('64', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_article\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874471');
INSERT INTO `fa_admin_log` VALUES ('65', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874479');
INSERT INTO `fa_admin_log` VALUES ('66', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874479');
INSERT INTO `fa_admin_log` VALUES ('67', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874479');
INSERT INTO `fa_admin_log` VALUES ('68', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874479');
INSERT INTO `fa_admin_log` VALUES ('69', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_comment\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874485');
INSERT INTO `fa_admin_log` VALUES ('70', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_comment\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874485');
INSERT INTO `fa_admin_log` VALUES ('71', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874502');
INSERT INTO `fa_admin_log` VALUES ('72', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874502');
INSERT INTO `fa_admin_log` VALUES ('73', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874502');
INSERT INTO `fa_admin_log` VALUES ('74', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874502');
INSERT INTO `fa_admin_log` VALUES ('75', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_article_like\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874639');
INSERT INTO `fa_admin_log` VALUES ('76', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_dynamic\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874641');
INSERT INTO `fa_admin_log` VALUES ('77', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874643');
INSERT INTO `fa_admin_log` VALUES ('78', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874643');
INSERT INTO `fa_admin_log` VALUES ('79', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874643');
INSERT INTO `fa_admin_log` VALUES ('80', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874643');
INSERT INTO `fa_admin_log` VALUES ('81', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_activity\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874649');
INSERT INTO `fa_admin_log` VALUES ('82', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_activity\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874649');
INSERT INTO `fa_admin_log` VALUES ('83', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874655');
INSERT INTO `fa_admin_log` VALUES ('84', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874655');
INSERT INTO `fa_admin_log` VALUES ('85', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874655');
INSERT INTO `fa_admin_log` VALUES ('86', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874655');
INSERT INTO `fa_admin_log` VALUES ('87', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_article\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874657');
INSERT INTO `fa_admin_log` VALUES ('88', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_article\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874657');
INSERT INTO `fa_admin_log` VALUES ('89', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874663');
INSERT INTO `fa_admin_log` VALUES ('90', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874663');
INSERT INTO `fa_admin_log` VALUES ('91', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874663');
INSERT INTO `fa_admin_log` VALUES ('92', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874663');
INSERT INTO `fa_admin_log` VALUES ('93', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_comment\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874668');
INSERT INTO `fa_admin_log` VALUES ('94', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_comment\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874668');
INSERT INTO `fa_admin_log` VALUES ('95', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874673');
INSERT INTO `fa_admin_log` VALUES ('96', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874673');
INSERT INTO `fa_admin_log` VALUES ('97', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874673');
INSERT INTO `fa_admin_log` VALUES ('98', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874673');
INSERT INTO `fa_admin_log` VALUES ('99', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_article_like\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874677');
INSERT INTO `fa_admin_log` VALUES ('100', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_article_like\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874677');
INSERT INTO `fa_admin_log` VALUES ('101', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874695');
INSERT INTO `fa_admin_log` VALUES ('102', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874695');
INSERT INTO `fa_admin_log` VALUES ('103', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874695');
INSERT INTO `fa_admin_log` VALUES ('104', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874695');
INSERT INTO `fa_admin_log` VALUES ('105', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_activity_like\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874699');
INSERT INTO `fa_admin_log` VALUES ('106', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_activity_like\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874699');
INSERT INTO `fa_admin_log` VALUES ('107', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_dynamic\",\"controller\":\"app\\/Dynamic\",\"model\":\"\",\"relation\":{\"6\":{\"relation\":\"fa_app_activity\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"activity_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"title\"]},\"7\":{\"relation\":\"fa_app_article\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"article_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"title\"]},\"8\":{\"relation\":\"fa_app_comment\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"comment_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"content\"]},\"9\":{\"relation\":\"fa_app_article_like\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"article_like_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"id\"]},\"10\":{\"relation\":\"fa_app_activity_like\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"activity_like_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"id\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874709');
INSERT INTO `fa_admin_log` VALUES ('108', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_dynamic\",\"controller\":\"app\\/Dynamic\",\"model\":\"\",\"relation\":{\"6\":{\"relation\":\"fa_app_activity\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"activity_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"title\"]},\"7\":{\"relation\":\"fa_app_article\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"article_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"title\"]},\"8\":{\"relation\":\"fa_app_comment\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"comment_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"content\"]},\"9\":{\"relation\":\"fa_app_article_like\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"article_like_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"id\"]},\"10\":{\"relation\":\"fa_app_activity_like\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"activity_like_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"id\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874711');
INSERT INTO `fa_admin_log` VALUES ('109', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577874711');
INSERT INTO `fa_admin_log` VALUES ('110', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577875047');
INSERT INTO `fa_admin_log` VALUES ('111', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577875050');
INSERT INTO `fa_admin_log` VALUES ('112', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577875052');
INSERT INTO `fa_admin_log` VALUES ('113', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/Dynamic.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577875053');
INSERT INTO `fa_admin_log` VALUES ('114', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/Dynamic.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577875053');
INSERT INTO `fa_admin_log` VALUES ('115', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577875053');
INSERT INTO `fa_admin_log` VALUES ('116', '1', 'admin', '/gWqP6hutKT.php/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"b9cfceb608ebc1a12b6463964a569556\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"plan_item\",\"title\":\"\\u8ba1\\u5212\\u5185\\u5bb9\\u9879\",\"icon\":\"fa fa-sliders\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878062');
INSERT INTO `fa_admin_log` VALUES ('117', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878063');
INSERT INTO `fa_admin_log` VALUES ('118', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878084');
INSERT INTO `fa_admin_log` VALUES ('119', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_plan_data\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878090');
INSERT INTO `fa_admin_log` VALUES ('120', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_data\",\"controller\":\"app\\/PlanData\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878138');
INSERT INTO `fa_admin_log` VALUES ('121', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_data\",\"controller\":\"app\\/PlanData\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878139');
INSERT INTO `fa_admin_log` VALUES ('122', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878139');
INSERT INTO `fa_admin_log` VALUES ('123', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_plan_recipe\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878144');
INSERT INTO `fa_admin_log` VALUES ('124', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_recipe\",\"controller\":\"app\\/PlanRecipe\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878153');
INSERT INTO `fa_admin_log` VALUES ('125', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_recipe\",\"controller\":\"app\\/PlanRecipe\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878153');
INSERT INTO `fa_admin_log` VALUES ('126', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878154');
INSERT INTO `fa_admin_log` VALUES ('127', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_plan_sport\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878156');
INSERT INTO `fa_admin_log` VALUES ('128', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_sport\",\"controller\":\"app\\/PlanSport\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878162');
INSERT INTO `fa_admin_log` VALUES ('129', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan_sport\",\"controller\":\"app\\/PlanSport\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878162');
INSERT INTO `fa_admin_log` VALUES ('130', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878163');
INSERT INTO `fa_admin_log` VALUES ('131', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878169');
INSERT INTO `fa_admin_log` VALUES ('132', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878170');
INSERT INTO `fa_admin_log` VALUES ('133', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878171');
INSERT INTO `fa_admin_log` VALUES ('134', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878174');
INSERT INTO `fa_admin_log` VALUES ('135', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878174');
INSERT INTO `fa_admin_log` VALUES ('136', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878174');
INSERT INTO `fa_admin_log` VALUES ('137', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/PlanData.php,app\\/PlanRecipe.php,app\\/PlanSport.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878176');
INSERT INTO `fa_admin_log` VALUES ('138', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/PlanData.php,app\\/PlanRecipe.php,app\\/PlanSport.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878176');
INSERT INTO `fa_admin_log` VALUES ('139', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577878176');
INSERT INTO `fa_admin_log` VALUES ('140', '1', 'admin', '/gWqP6hutKT.php/auth/rule/edit/ids/303?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"8a8498bb905164fb53a24901f3b1cc16\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"plan_item\",\"title\":\"\\u8ba1\\u5212\\u6a21\\u677f\",\"icon\":\"fa fa-sliders\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"303\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883116');
INSERT INTO `fa_admin_log` VALUES ('141', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883116');
INSERT INTO `fa_admin_log` VALUES ('142', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883159');
INSERT INTO `fa_admin_log` VALUES ('143', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_plan\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883165');
INSERT INTO `fa_admin_log` VALUES ('144', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883170');
INSERT INTO `fa_admin_log` VALUES ('145', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883170');
INSERT INTO `fa_admin_log` VALUES ('146', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883170');
INSERT INTO `fa_admin_log` VALUES ('147', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883170');
INSERT INTO `fa_admin_log` VALUES ('148', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883181');
INSERT INTO `fa_admin_log` VALUES ('149', '1', 'admin', '/gWqP6hutKT.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_app_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883181');
INSERT INTO `fa_admin_log` VALUES ('150', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan\",\"controller\":\"app\\/Plan\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_app_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\",\"avatar\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883186');
INSERT INTO `fa_admin_log` VALUES ('151', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_app_plan\",\"controller\":\"app\\/Plan\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"fa_app_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\",\"avatar\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883187');
INSERT INTO `fa_admin_log` VALUES ('152', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883187');
INSERT INTO `fa_admin_log` VALUES ('153', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883195');
INSERT INTO `fa_admin_log` VALUES ('154', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883197');
INSERT INTO `fa_admin_log` VALUES ('155', '1', 'admin', '/gWqP6hutKT.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883199');
INSERT INTO `fa_admin_log` VALUES ('156', '1', 'admin', '/gWqP6hutKT.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/Plan.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883200');
INSERT INTO `fa_admin_log` VALUES ('157', '1', 'admin', '/gWqP6hutKT.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"app\\/Plan.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883201');
INSERT INTO `fa_admin_log` VALUES ('158', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883201');
INSERT INTO `fa_admin_log` VALUES ('159', '1', 'admin', '/gWqP6hutKT.php/auth/rule/edit/ids/304?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e444e85355e8ad39b3915ec29b4c5ea9\",\"row\":{\"ismenu\":\"1\",\"pid\":\"303\",\"name\":\"app\\/plan\",\"title\":\"\\u8ba1\\u5212\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"304\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883219');
INSERT INTO `fa_admin_log` VALUES ('160', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577883220');
INSERT INTO `fa_admin_log` VALUES ('161', '1', 'admin', '/gWqP6hutKT.php/index/login?url=%2FgWqP6hutKT.php', '登录', '{\"url\":\"\\/gWqP6hutKT.php\",\"__token__\":\"f426faa0446a30fce4fa5318c3b6bb70\",\"username\":\"admin\",\"captcha\":\"xuyp\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577976869');
INSERT INTO `fa_admin_log` VALUES ('162', '1', 'admin', '/gWqP6hutKT.php/addon/config?name=alioss&dialog=1', '插件管理 配置', '{\"name\":\"alioss\",\"dialog\":\"1\",\"row\":{\"app_id\":\"LTAI4FkmnxiS1HzMWckQdHwi\",\"app_key\":\"K1BmtlPXIHLdN9rNoUpAqMPYCebQpS\",\"bucket\":\"jiahejiankanghui\",\"endpoint\":\"oss-cn-beijing.aliyuncs.com\",\"cdnurl\":\"http:\\/\\/jiahejiankanghui.oss-cn-beijing.aliyuncs.com\",\"uploadmode\":\"client\",\"savekey\":\"\\/uploads\\/{year}{mon}{day}\\/{filemd5}{.suffix}\",\"expire\":\"600\",\"maxsize\":\"10M\",\"mimetype\":\"*\",\"multiple\":\"0\",\"syncdelete\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977185');
INSERT INTO `fa_admin_log` VALUES ('163', '1', 'admin', '/gWqP6hutKT.php/general/attachment/del/ids/9,8,7,5,4,3', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"9,8,7,5,4,3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977370');
INSERT INTO `fa_admin_log` VALUES ('164', '1', 'admin', '/gWqP6hutKT.php/index/login', '登录', '{\"__token__\":\"952944de657ff1d129f6b00551c2ed3d\",\"username\":\"admin\",\"captcha\":\"yiy4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977489');
INSERT INTO `fa_admin_log` VALUES ('165', '1', 'admin', '/gWqP6hutKT.php/general.profile/update', '常规管理 个人资料 更新个人信息', '{\"__token__\":\"94678de946d5d29134a73310d0537dee\",\"row\":{\"avatar\":\"\\/uploads\\/20200102\\/26f5e51b8ac7fbd6f1c649cc45a18265.png\",\"email\":\"admin@admin.com\",\"nickname\":\"Admin\",\"password\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977560');
INSERT INTO `fa_admin_log` VALUES ('166', '1', 'admin', '/gWqP6hutKT.php/general.profile/update', '常规管理 个人资料 更新个人信息', '{\"__token__\":\"5fbbd4dba16894b9948a899cfceaee14\",\"row\":{\"avatar\":\"\\/uploads\\/20200102\\/f57ebce8a72b823912904fe76eda0909.png\",\"email\":\"admin@admin.com\",\"nickname\":\"Admin\",\"password\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977574');
INSERT INTO `fa_admin_log` VALUES ('167', '1', 'admin', '/gWqP6hutKT.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977583');
INSERT INTO `fa_admin_log` VALUES ('168', '1', 'admin', '/gWqP6hutKT.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977590');
INSERT INTO `fa_admin_log` VALUES ('169', '1', 'admin', '/gWqP6hutKT.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977638');
INSERT INTO `fa_admin_log` VALUES ('170', '1', 'admin', '/gWqP6hutKT.php/addon/state', '插件管理 禁用启用', '{\"name\":\"alioss\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977650');
INSERT INTO `fa_admin_log` VALUES ('171', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977650');
INSERT INTO `fa_admin_log` VALUES ('172', '1', 'admin', '/gWqP6hutKT.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977657');
INSERT INTO `fa_admin_log` VALUES ('173', '1', 'admin', '/gWqP6hutKT.php/auth/group/roletree', '权限管理 角色组', '{\"id\":\"2\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577977663');
INSERT INTO `fa_admin_log` VALUES ('174', '1', 'admin', '/gWqP6hutKT.php/addon/state', '插件管理 禁用启用', '{\"name\":\"alioss\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577978090');
INSERT INTO `fa_admin_log` VALUES ('175', '1', 'admin', '/gWqP6hutKT.php/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1577978091');

-- ----------------------------
-- Table structure for fa_app_achievement
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_achievement`;
CREATE TABLE `fa_app_achievement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '成就名称',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成就';

-- ----------------------------
-- Records of fa_app_achievement
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_activity
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_activity`;
CREATE TABLE `fa_app_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cover_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动名称',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动详情',
  `apply_count` int(11) NOT NULL COMMENT '已报名人数',
  `apply_count_limit` int(11) NOT NULL COMMENT '最多报名人数',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '截止时间',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=展示',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动';

-- ----------------------------
-- Records of fa_app_activity
-- ----------------------------
INSERT INTO `fa_app_activity` VALUES ('1', '/uploads/20191229/f57ebce8a72b823912904fe76eda0909.png', '活动01', '<p>啦啦啦啦啦，快来参加啊</p>', '1', '0', '1577602260', '1577602260', '2', '1', '0', '1', '1577602321', '1577876891');

-- ----------------------------
-- Table structure for fa_app_activity_apply
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_activity_apply`;
CREATE TABLE `fa_app_activity_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动',
  `user_id` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='活动申请';

-- ----------------------------
-- Records of fa_app_activity_apply
-- ----------------------------
INSERT INTO `fa_app_activity_apply` VALUES ('2', '1', '6', '1577634966', '1577634966');

-- ----------------------------
-- Table structure for fa_app_activity_like
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_activity_like`;
CREATE TABLE `fa_app_activity_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `operate_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '点赞用户',
  `target_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被赞用户',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动点赞';

-- ----------------------------
-- Records of fa_app_activity_like
-- ----------------------------
INSERT INTO `fa_app_activity_like` VALUES ('5', '1', '6', '0', '1577876891', '1577876891');

-- ----------------------------
-- Table structure for fa_app_activity_view
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_activity_view`;
CREATE TABLE `fa_app_activity_view` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `operate_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '浏览用户',
  `target_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章发布者',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动浏览';

-- ----------------------------
-- Records of fa_app_activity_view
-- ----------------------------
INSERT INTO `fa_app_activity_view` VALUES ('6', '1', '6', '0', '1577634877', '1577634877');

-- ----------------------------
-- Table structure for fa_app_article
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_article`;
CREATE TABLE `fa_app_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '类型:0=健康秀,1=达人',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `column_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '封面',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `view_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `like_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `comment_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论量',
  `sort` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=展示',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章';

-- ----------------------------
-- Records of fa_app_article
-- ----------------------------
INSERT INTO `fa_app_article` VALUES ('3', '1', '6', '1', '健康秀文章01', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '<div id=\"description\" class=\"J_DetailSection tshop-psm ke-post\">\r\n    \r\n    <div id=\"J_DivItemDesc\" class=\"content\" data-spm-anchor-id=\"2013.1.0.i0.b2e71844bLqqvP\"><p><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01JP77Xq1BzMp8PE5o3_!!2859020016.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01EuNabr1BzMp7sVsmJ_!!2859020016.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01L6ltJQ1BzMp5YNw8E_!!2859020016.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01Aha09p1BzMp1Cl4Vw_!!2859020016.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01Xebls81BzMp8PF6Bj_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"730\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01cDFi7G1BzMp9PT3H2_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"828\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01mFwaZp1BzMp7sUTX2_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"725\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01b2bxEp1BzMp8WI8du_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"847\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01JQXZOc1BzMp8PD1Jb_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"787\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01jAs4st1BzMp9t7fVH_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"875\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01zz1RXl1BzMp8WHKjQ_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1069\" data-spm-anchor-id=\"2013.1.0.i2.b2e71844bLqqvP\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01ZkH8XF1BzMp9t7bLy_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"624\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN012q9fwL1BzMp9t6jJF_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1218\" data-spm-anchor-id=\"2013.1.0.i1.b2e71844bLqqvP\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01iuDCo31BzMsd2K74Z_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1039\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01SoPzWL1BzMsbOwymw_!!2859020016.jpg\" class=\"\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1020\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01a1UBDG1BzMsbLwTVD_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1017\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01e9hvWF1BzMsZT4Iz1_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1019\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01gNg02u1BzMsaEDt7c_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1059\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01VQT1XF1BzMp1Cngcv_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1019\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01nChLmO1BzMsJIn8ai_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1016\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01TesvdJ1BzMr3weysJ_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"511\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01XpJNWW1BzMr3wlDwc_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"532\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01RyWcyg1BzMp7HIX5X_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1021\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01ctzn5T1BzMp90c2s0_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1031\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01DS1XoX1BzMp8WIoH2_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1024\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN011098qb1BzMp7HJKze_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1022\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01ew7cRE1BzMp8bxrBy_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1049\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01ools3Y1BzMp9gjeOH_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"748\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01dmpq0b1BzMp8PGRTo_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"532\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01sLP1ld1BzMr2mF9jI_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"532\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01YMA50u1BzMr5XKl4t_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"532\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01Y03uSd1BzMr6AAwRW_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"532\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01GYYuiC1BzMp9PTiwb_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"544\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01H9dJqh1BzMp9PV8Fy_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"541\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01zxSNS21BzMp9gmOtK_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"512\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01KVZWDt1BzMp7zpxlP_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"534\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN0197NjHl1BzMp1Co5ex_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"530\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01QjgH7f1BzMp7sX9vB_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"529\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01q3Izyj1BzMp8bySdo_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"529\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2859020016/O1CN01zIMpRz1BzMp90cv0V_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"531\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01TSWjSy1BzMp8WKUHJ_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"539\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2859020016/O1CN01fUVyq91BzMp7mHvJD_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"936\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2859020016/O1CN01KPv4PT1BzMp7HLPwq_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"699\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2859020016/O1CN01uEACCu1BzMp7HKc3a_!!2859020016.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"600\"></p></div>\r\n</div>', '0', '1', '2', '0', '1', '1577610969', '1577876802');
INSERT INTO `fa_app_article` VALUES ('4', '1', '6', '1', '健康秀文章01', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '<p>啦啦啦啦</p>', '0', '0', '1', '0', '1', '1577611771', '1577877288');
INSERT INTO `fa_app_article` VALUES ('5', '1', '6', '1', '健康秀文章01', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '<p>啦啦啦啦</p>', '0', '0', '0', '0', '1', '1577612296', '1577612296');
INSERT INTO `fa_app_article` VALUES ('6', '1', '6', '1', '???????', '???????', '???????', '0', '1', '3', '0', '1', '1577877206', '1577877392');

-- ----------------------------
-- Table structure for fa_app_article_label
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_article_label`;
CREATE TABLE `fa_app_article_label` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `label_id` int(11) NOT NULL DEFAULT '0' COMMENT '标签ID',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章标签关联';

-- ----------------------------
-- Records of fa_app_article_label
-- ----------------------------
INSERT INTO `fa_app_article_label` VALUES ('1', '3', '1', '1577610969', '1577610969');
INSERT INTO `fa_app_article_label` VALUES ('2', '3', '2', '1577610969', '1577610969');
INSERT INTO `fa_app_article_label` VALUES ('3', '4', '1', '1577611771', '1577611771');
INSERT INTO `fa_app_article_label` VALUES ('4', '4', '2', '1577611771', '1577611771');
INSERT INTO `fa_app_article_label` VALUES ('5', '5', '1', '1577612296', '1577612296');
INSERT INTO `fa_app_article_label` VALUES ('6', '5', '2', '1577612296', '1577612296');
INSERT INTO `fa_app_article_label` VALUES ('7', '6', '1', '1577877206', '1577877206');

-- ----------------------------
-- Table structure for fa_app_article_like
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_article_like`;
CREATE TABLE `fa_app_article_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `operate_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '点赞用户',
  `target_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被赞用户',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章点赞';

-- ----------------------------
-- Records of fa_app_article_like
-- ----------------------------
INSERT INTO `fa_app_article_like` VALUES ('9', '3', '6', '6', '1577876802', '1577876802');
INSERT INTO `fa_app_article_like` VALUES ('10', '6', '6', '6', '1577877392', '1577877392');

-- ----------------------------
-- Table structure for fa_app_article_view
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_article_view`;
CREATE TABLE `fa_app_article_view` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `operate_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '浏览用户',
  `target_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章发布者',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章浏览';

-- ----------------------------
-- Records of fa_app_article_view
-- ----------------------------
INSERT INTO `fa_app_article_view` VALUES ('2', '2', '6', '6', '1577619886', '1577619886');
INSERT INTO `fa_app_article_view` VALUES ('3', '3', '6', '6', '1577623817', '1577623817');

-- ----------------------------
-- Table structure for fa_app_banner
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_banner`;
CREATE TABLE `fa_app_banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `position` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '展示位置:1=首页,2=运动,3=计划',
  `click_type` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '跳转类型:0=无,1=网页链接,2=图文内容,3=活动跳转,4=Ta的个人主页',
  `url_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '网页连接地址',
  `activity_id` int(11) NOT NULL COMMENT '跳转活动',
  `user_id` int(11) NOT NULL COMMENT '跳转Ta的主页',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图文内容',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '上架时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '下架时间',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=展示',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Banner';

-- ----------------------------
-- Records of fa_app_banner
-- ----------------------------
INSERT INTO `fa_app_banner` VALUES ('1', 'banner01', '/uploads/20191229/0e6e125347dd00583f8e0a15845522e4.jpg', '1', '0', '', '0', '0', '', '1577602146', '1577602146', '0', '1', '1577602159', '1577602159');
INSERT INTO `fa_app_banner` VALUES ('2', 'banner02', '/uploads/20191229/0e6e125347dd00583f8e0a15845522e4.jpg', '1', '1', 'https://www.baidu,com', '0', '0', '', '1577602195', '1577602195', '0', '1', '1577602229', '1577602229');
INSERT INTO `fa_app_banner` VALUES ('3', 'banner03', '/uploads/20191229/0e6e125347dd00583f8e0a15845522e4.jpg', '1', '2', '', '0', '0', '<p>这里是图文内容啊</p>', '1577602195', '1577602195', '0', '1', '1577602240', '1577602482');
INSERT INTO `fa_app_banner` VALUES ('4', 'banner04', '/uploads/20191229/0e6e125347dd00583f8e0a15845522e4.jpg', '1', '3', '', '1', '0', '', '1577602267', '1577602267', '0', '1', '1577602353', '1577602487');
INSERT INTO `fa_app_banner` VALUES ('5', 'banner05', '/uploads/20191229/0e6e125347dd00583f8e0a15845522e4.jpg', '1', '4', '', '0', '8', '', '1577602267', '1577602267', '0', '1', '1577602356', '1577602625');

-- ----------------------------
-- Table structure for fa_app_column
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_column`;
CREATE TABLE `fa_app_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `subtitle` varchar(50) NOT NULL COMMENT '副标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `sort` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=正常',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='栏目';

-- ----------------------------
-- Records of fa_app_column
-- ----------------------------
INSERT INTO `fa_app_column` VALUES ('1', '讲座', '讲座描述', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '0', '0', '1577020599', '1577020599');
INSERT INTO `fa_app_column` VALUES ('2', '专家', '专家描述', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '0', '0', '1577020609', '1577020609');
INSERT INTO `fa_app_column` VALUES ('3', '教练', '教练描述', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '0', '0', '1577020628', '1577020628');
INSERT INTO `fa_app_column` VALUES ('4', '膳食', '膳食描述', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '0', '0', '1577020639', '1577603604');

-- ----------------------------
-- Table structure for fa_app_comment
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_comment`;
CREATE TABLE `fa_app_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `reply_count` int(11) NOT NULL COMMENT '回复数量',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论';

-- ----------------------------
-- Records of fa_app_comment
-- ----------------------------
INSERT INTO `fa_app_comment` VALUES ('4', '6', '3', '0', '不错啊~', '0', '1', '1577620838', '1577620838');
INSERT INTO `fa_app_comment` VALUES ('6', '6', '3', '4', '你是水军？？？？？？', '1', '0', '1577620865', '1577872933');
INSERT INTO `fa_app_comment` VALUES ('7', '6', '4', '0', '???????', '0', '0', '1577877288', '1577877288');
INSERT INTO `fa_app_comment` VALUES ('8', '6', '6', '0', '???????', '0', '0', '1577877324', '1577877324');
INSERT INTO `fa_app_comment` VALUES ('9', '6', '6', '0', '???????', '0', '0', '1577877325', '1577877325');
INSERT INTO `fa_app_comment` VALUES ('10', '6', '6', '0', '???????', '0', '0', '1577877326', '1577877326');

-- ----------------------------
-- Table structure for fa_app_comment_like
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_comment_like`;
CREATE TABLE `fa_app_comment_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `operate_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '点赞用户',
  `target_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被赞用户',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论点赞';

-- ----------------------------
-- Records of fa_app_comment_like
-- ----------------------------
INSERT INTO `fa_app_comment_like` VALUES ('7', '6', '6', '6', '1577872933', '1577872933');

-- ----------------------------
-- Table structure for fa_app_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_dynamic`;
CREATE TABLE `fa_app_dynamic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_type_id` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '类型:0=健康秀,1=达人',
  `article_column_id` int(11) NOT NULL COMMENT '所属栏目',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `article_like_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章点赞ID',
  `activity_like_id` int(11) NOT NULL COMMENT '活动点赞ID',
  `type_id` enum('1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '动态类型:1=发布文章,2=评论文章,3=点赞文章,4=点赞活动,5=转发文章,6=转发活动',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='动态';

-- ----------------------------
-- Records of fa_app_dynamic
-- ----------------------------
INSERT INTO `fa_app_dynamic` VALUES ('2', '0', '0', '6', '0', '1', '0', '5', '0', '4', '点赞活动', '1577876891', '1577876891');
INSERT INTO `fa_app_dynamic` VALUES ('3', '0', '0', '6', '0', '1', '0', '0', '0', '6', '转发动态', '1577877002', '1577877002');
INSERT INTO `fa_app_dynamic` VALUES ('4', '1', '1', '6', '6', '0', '0', '0', '0', '1', '发布文章', '1577877206', '1577877206');
INSERT INTO `fa_app_dynamic` VALUES ('5', '1', '1', '6', '4', '0', '7', '0', '0', '2', '评论文章', '1577877288', '1577877288');
INSERT INTO `fa_app_dynamic` VALUES ('6', '1', '1', '6', '6', '0', '8', '0', '0', '2', '评论文章', '1577877324', '1577877324');
INSERT INTO `fa_app_dynamic` VALUES ('7', '1', '1', '6', '6', '0', '9', '0', '0', '2', '评论文章', '1577877325', '1577877325');
INSERT INTO `fa_app_dynamic` VALUES ('8', '1', '1', '6', '6', '0', '10', '0', '0', '2', '评论文章', '1577877326', '1577877326');
INSERT INTO `fa_app_dynamic` VALUES ('9', '1', '1', '6', '6', '0', '0', '10', '0', '3', '点赞文章', '1577877392', '1577877392');
INSERT INTO `fa_app_dynamic` VALUES ('10', '1', '1', '6', '6', '0', '0', '0', '0', '5', '转发文章', '1577877412', '1577877412');

-- ----------------------------
-- Table structure for fa_app_label
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_label`;
CREATE TABLE `fa_app_label` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标签';

-- ----------------------------
-- Records of fa_app_label
-- ----------------------------
INSERT INTO `fa_app_label` VALUES ('1', '主食', '0', '1', '1576999076', '1577603347');
INSERT INTO `fa_app_label` VALUES ('2', '辅食', '0', '1', '1576999083', '1577603347');
INSERT INTO `fa_app_label` VALUES ('3', '健康操', '0', '1', '1577603347', '1577603347');

-- ----------------------------
-- Table structure for fa_app_like
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_like`;
CREATE TABLE `fa_app_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `step_id` int(11) NOT NULL COMMENT '步数id',
  `like_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '点赞类型:1=文章,2=评论,3=步数',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='点赞（废弃）';

-- ----------------------------
-- Records of fa_app_like
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_message
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_message`;
CREATE TABLE `fa_app_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '消息标题',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '消息正文',
  `type_id` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '消息类型:1=系统,2=活动,3=事件,4=评论,5=点赞',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站内消息';

-- ----------------------------
-- Records of fa_app_message
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_plan
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan`;
CREATE TABLE `fa_app_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '计划名称',
  `number_of_days` int(11) NOT NULL COMMENT '合计天数',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=展示',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划';

-- ----------------------------
-- Records of fa_app_plan
-- ----------------------------
INSERT INTO `fa_app_plan` VALUES ('43', '2020010201055816056', '6', '/uploads/img.png', 'LrhX7PLj44', '14', '0', '1', '1577898358', '1577898358');

-- ----------------------------
-- Table structure for fa_app_plan_data
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_data`;
CREATE TABLE `fa_app_plan_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_image` varchar(255) NOT NULL COMMENT '封面图片',
  `name` varchar(30) NOT NULL COMMENT '数据名称',
  `sketch` varchar(30) NOT NULL COMMENT '简述',
  `type_id` enum('0','1') NOT NULL DEFAULT '0' COMMENT '数据类型:0=普通数据,1=血压数据',
  `start_time` varchar(30) NOT NULL COMMENT '测量时间',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=展示',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='数据类型';

-- ----------------------------
-- Records of fa_app_plan_data
-- ----------------------------
INSERT INTO `fa_app_plan_data` VALUES ('1', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '体重', '体重简述', '0', '18:30', '0', '1', '1577716040', '1577716040');
INSERT INTO `fa_app_plan_data` VALUES ('2', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '血压', '血压简述', '1', '18:45', '0', '1', '1577716050', '1577716050');
INSERT INTO `fa_app_plan_data` VALUES ('3', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '血糖', '血糖简述', '0', '18:45', '0', '1', '1577716064', '1577716064');
INSERT INTO `fa_app_plan_data` VALUES ('4', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '心率', '心率简述', '0', '19:00', '0', '1', '1577716083', '1577716083');
INSERT INTO `fa_app_plan_data` VALUES ('5', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '尿酸值', '尿酸值简述', '0', '19:00', '0', '1', '1577716099', '1577716099');
INSERT INTO `fa_app_plan_data` VALUES ('6', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '低密度胆固醇', '低密度胆固醇简述', '0', '20:00', '0', '1', '1577716118', '1577716118');

-- ----------------------------
-- Table structure for fa_app_plan_event_base
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_event_base`;
CREATE TABLE `fa_app_plan_event_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `date` int(11) NOT NULL COMMENT '计划日期',
  `format_date` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_the_week` enum('0','1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '星期几:0=星期日,1=星期一,2=星期二,3=星期三,4=星期四,5=星期五,6=星期六',
  `wake_up_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '起床时间',
  `fall_asleep_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入睡时间',
  `lunch_break_start` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '午睡开始时间',
  `lunch_break_end` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '午睡结束时间',
  `format_fall_asleep_time` int(11) NOT NULL COMMENT '入睡时间',
  `format_lunch_break_start` int(11) NOT NULL COMMENT '午睡开始时间',
  `format_lunch_break_end` int(11) NOT NULL COMMENT '午睡结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划基础事件';

-- ----------------------------
-- Records of fa_app_plan_event_base
-- ----------------------------
INSERT INTO `fa_app_plan_event_base` VALUES ('15', '6', '43', '1578412800', '2020-01-08', '3', '07:30', '11:30', '13:00', '13:30', '1578454200', '1578459600', '1578461400');
INSERT INTO `fa_app_plan_event_base` VALUES ('16', '6', '43', '1579017600', '2020-01-15', '3', '07:30', '11:30', '13:00', '13:30', '1579059000', '1579064400', '1579066200');

-- ----------------------------
-- Table structure for fa_app_plan_event_data
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_event_data`;
CREATE TABLE `fa_app_plan_event_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `date` int(11) NOT NULL COMMENT '计划日期',
  `format_date` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_the_week` enum('0','1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '星期几:0=星期日,1=星期一,2=星期二,3=星期三,4=星期四,5=星期五,6=星期六',
  `data_id` int(11) NOT NULL,
  `data_type_id` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '数据类型:0=普通数据,1=血压数据',
  `start_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format_start_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划数据事件';

-- ----------------------------
-- Records of fa_app_plan_event_data
-- ----------------------------
INSERT INTO `fa_app_plan_event_data` VALUES ('25', '6', '43', '1578412800', '2020-01-08', '3', '1', '0', '18:30', '1578479400');
INSERT INTO `fa_app_plan_event_data` VALUES ('26', '6', '43', '1578412800', '2020-01-08', '3', '2', '1', '18:45', '1578480300');
INSERT INTO `fa_app_plan_event_data` VALUES ('27', '6', '43', '1578412800', '2020-01-08', '3', '4', '0', '19:00', '1578481200');
INSERT INTO `fa_app_plan_event_data` VALUES ('28', '6', '43', '1578412800', '2020-01-08', '3', '6', '0', '20:00', '1578484800');
INSERT INTO `fa_app_plan_event_data` VALUES ('29', '6', '43', '1579017600', '2020-01-15', '3', '1', '0', '18:30', '1579084200');
INSERT INTO `fa_app_plan_event_data` VALUES ('30', '6', '43', '1579017600', '2020-01-15', '3', '2', '1', '18:45', '1579085100');
INSERT INTO `fa_app_plan_event_data` VALUES ('31', '6', '43', '1579017600', '2020-01-15', '3', '4', '0', '19:00', '1579086000');
INSERT INTO `fa_app_plan_event_data` VALUES ('32', '6', '43', '1579017600', '2020-01-15', '3', '6', '0', '20:00', '1579089600');

-- ----------------------------
-- Table structure for fa_app_plan_event_data_list
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_event_data_list`;
CREATE TABLE `fa_app_plan_event_data_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '组类型:0=高压,1=低压',
  `event_data_id` int(11) NOT NULL COMMENT '食谱事件ID',
  `value` tinyint(4) NOT NULL COMMENT '记录值',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划血压数据';

-- ----------------------------
-- Records of fa_app_plan_event_data_list
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_plan_event_recipe
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_event_recipe`;
CREATE TABLE `fa_app_plan_event_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `date` int(11) NOT NULL COMMENT '计划日期',
  `format_date` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_the_week` enum('0','1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '星期几:0=星期日,1=星期一,2=星期二,3=星期三,4=星期四,5=星期五,6=星期六',
  `set_notice_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提醒时间',
  `format_set_notice_time` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL COMMENT '食谱ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划食谱事件';

-- ----------------------------
-- Records of fa_app_plan_event_recipe
-- ----------------------------
INSERT INTO `fa_app_plan_event_recipe` VALUES ('112', '6', '43', '1578412800', '2020-01-08', '3', '08:00', '1578441600', '1');
INSERT INTO `fa_app_plan_event_recipe` VALUES ('113', '6', '43', '1578412800', '2020-01-08', '3', '09:50', '1578448200', '2');
INSERT INTO `fa_app_plan_event_recipe` VALUES ('114', '6', '43', '1579017600', '2020-01-15', '3', '08:00', '1579046400', '1');
INSERT INTO `fa_app_plan_event_recipe` VALUES ('115', '6', '43', '1579017600', '2020-01-15', '3', '09:50', '1579053000', '2');

-- ----------------------------
-- Table structure for fa_app_plan_event_recipe_list
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_event_recipe_list`;
CREATE TABLE `fa_app_plan_event_recipe_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '组类型:0=主食,1=辅食',
  `event_recipe_id` int(11) NOT NULL COMMENT '食谱事件ID',
  `article_id` int(11) NOT NULL,
  `group_sort` int(11) NOT NULL COMMENT '组排序',
  `article_sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食谱所含商品';

-- ----------------------------
-- Records of fa_app_plan_event_recipe_list
-- ----------------------------
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('583', '0', '112', '1', '1', '1');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('584', '0', '112', '2', '1', '2');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('585', '0', '112', '3', '1', '3');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('586', '1', '112', '8', '2', '1');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('587', '1', '112', '11', '2', '2');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('588', '0', '113', '1', '1', '1');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('589', '0', '113', '3', '1', '2');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('590', '1', '113', '6', '2', '1');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('591', '0', '114', '1', '1', '1');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('592', '0', '114', '2', '1', '2');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('593', '0', '114', '3', '1', '3');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('594', '1', '114', '8', '2', '1');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('595', '1', '114', '11', '2', '2');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('596', '0', '115', '1', '1', '1');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('597', '0', '115', '3', '1', '2');
INSERT INTO `fa_app_plan_event_recipe_list` VALUES ('598', '1', '115', '6', '2', '1');

-- ----------------------------
-- Table structure for fa_app_plan_event_sport
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_event_sport`;
CREATE TABLE `fa_app_plan_event_sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `date` int(11) NOT NULL COMMENT '计划日期',
  `format_date` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_the_week` enum('0','1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '星期几:0=星期日,1=星期一,2=星期二,3=星期三,4=星期四,5=星期五,6=星期六',
  `sport_id` int(11) NOT NULL,
  `sport_type_id` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '运动类型:0=普通,1=健康操',
  `start_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开始时间',
  `end_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '结束时间',
  `format_start_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开始时间',
  `format_end_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '结束时间',
  `target_step` int(11) NOT NULL COMMENT '目标步数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划运动事件';

-- ----------------------------
-- Records of fa_app_plan_event_sport
-- ----------------------------
INSERT INTO `fa_app_plan_event_sport` VALUES ('17', '6', '43', '1578412800', '2020-01-08', '3', '1', '0', '08:00', '08:00', '1578441600', '1578441600', '8');
INSERT INTO `fa_app_plan_event_sport` VALUES ('18', '6', '43', '1578412800', '2020-01-08', '3', '2', '1', '08:00', '08:00', '1578441600', '1578441600', '0');
INSERT INTO `fa_app_plan_event_sport` VALUES ('19', '6', '43', '1579017600', '2020-01-15', '3', '1', '0', '08:00', '08:00', '1579046400', '1579046400', '8');
INSERT INTO `fa_app_plan_event_sport` VALUES ('20', '6', '43', '1579017600', '2020-01-15', '3', '2', '1', '08:00', '08:00', '1579046400', '1579046400', '0');

-- ----------------------------
-- Table structure for fa_app_plan_event_sport_list
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_event_sport_list`;
CREATE TABLE `fa_app_plan_event_sport_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '组类型:0=主食,1=辅食',
  `event_sport_id` int(11) NOT NULL COMMENT '食谱事件ID',
  `article_id` int(11) NOT NULL,
  `group_sort` int(11) NOT NULL COMMENT '组排序',
  `article_sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计划运动数据';

-- ----------------------------
-- Records of fa_app_plan_event_sport_list
-- ----------------------------
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('41', '0', '18', '1', '1', '1');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('42', '0', '18', '2', '1', '2');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('43', '0', '18', '3', '1', '3');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('44', '1', '18', '8', '2', '1');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('45', '1', '18', '11', '2', '2');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('46', '0', '20', '1', '1', '1');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('47', '0', '20', '2', '1', '2');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('48', '0', '20', '3', '1', '3');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('49', '1', '20', '8', '2', '1');
INSERT INTO `fa_app_plan_event_sport_list` VALUES ('50', '1', '20', '11', '2', '2');

-- ----------------------------
-- Table structure for fa_app_plan_form_data
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_form_data`;
CREATE TABLE `fa_app_plan_form_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `form_data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='创建计划时的原始传入参数';

-- ----------------------------
-- Records of fa_app_plan_form_data
-- ----------------------------
INSERT INTO `fa_app_plan_form_data` VALUES ('6', '43', '{\"plan_name\":\"LrhX7PLj44\",\"plan_cover_image\":\"\\/uploads\\/img.png\",\"number_of_days\":\"14\",\"setting\":{\"3\":{\"base\":{\"wake_up_time\":\"07:30\",\"fall_asleep_time\":\"11:30\",\"lunch_break_start\":\"13:00\",\"lunch_break_end\":\"13:30\"},\"recipe\":{\"1\":{\"set_notice_time\":\"08:00\",\"article_list\":[[\"1\",\"2\",\"3\"],[\"8\",\"11\"]]},\"2\":{\"set_notice_time\":\"09:50\",\"article_list\":[[\"1\",\"3\"],[\"6\"]]}},\"sport\":{\"1\":{\"sport_type_id\":\"0\",\"start_time\":\"08:00\",\"end_time\":\"08:00\",\"target_step\":\"08:00\"},\"2\":{\"sport_type_id\":\"1\",\"start_time\":\"08:00\",\"end_time\":\"08:00\",\"article_list\":[[\"1\",\"2\",\"3\"],[\"8\",\"11\"]]}},\"info\":[1,2,4,6]}}}');

-- ----------------------------
-- Table structure for fa_app_plan_recipe
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_recipe`;
CREATE TABLE `fa_app_plan_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_image` varchar(255) NOT NULL COMMENT '封面图片',
  `name` varchar(30) NOT NULL COMMENT '食谱名称',
  `sketch` varchar(30) NOT NULL COMMENT '简述',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=展示',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='食谱类型';

-- ----------------------------
-- Records of fa_app_plan_recipe
-- ----------------------------
INSERT INTO `fa_app_plan_recipe` VALUES ('1', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '早餐', '早餐描述', '0', '1', '1577718298', '1577718298');
INSERT INTO `fa_app_plan_recipe` VALUES ('2', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '早加餐', '早加餐', '0', '1', '1577718316', '1577718316');
INSERT INTO `fa_app_plan_recipe` VALUES ('3', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '午餐', '午餐简述', '0', '1', '1577718333', '1577718333');
INSERT INTO `fa_app_plan_recipe` VALUES ('4', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '午加餐', '加餐简述', '0', '1', '1577718344', '1577718383');
INSERT INTO `fa_app_plan_recipe` VALUES ('5', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '晚餐', '晚餐简述', '0', '1', '1577718359', '1577718359');

-- ----------------------------
-- Table structure for fa_app_plan_sport
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_plan_sport`;
CREATE TABLE `fa_app_plan_sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_image` varchar(255) NOT NULL COMMENT '封面图片',
  `name` varchar(30) NOT NULL COMMENT '运动名称',
  `sketch` varchar(30) NOT NULL COMMENT '简述',
  `type_id` enum('0','1') NOT NULL DEFAULT '0' COMMENT '运动类型:0=普通,1=健康操',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=展示',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='运动类型';

-- ----------------------------
-- Records of fa_app_plan_sport
-- ----------------------------
INSERT INTO `fa_app_plan_sport` VALUES ('1', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '太极拳', '太极拳简述', '0', '0', '1', '1577718666', '1577718666');
INSERT INTO `fa_app_plan_sport` VALUES ('2', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '走步', '走步描述', '0', '0', '1', '1577718718', '1577718718');
INSERT INTO `fa_app_plan_sport` VALUES ('3', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '慢跑', '慢跑描述', '0', '0', '1', '1577718761', '1577718761');
INSERT INTO `fa_app_plan_sport` VALUES ('4', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '健康操', '健康操描述', '1', '0', '1', '1577718774', '1577718806');
INSERT INTO `fa_app_plan_sport` VALUES ('5', '/uploads/20191229/26f5e51b8ac7fbd6f1c649cc45a18265.png', '游泳', '游泳描述', '0', '0', '1', '1577718799', '1577718799');

-- ----------------------------
-- Table structure for fa_app_step
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_step`;
CREATE TABLE `fa_app_step` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `step_number` int(11) NOT NULL DEFAULT '0' COMMENT '实际步数',
  `target_step` int(11) NOT NULL DEFAULT '0' COMMENT '目标步数',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `timestamp` int(11) NOT NULL COMMENT '日期',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信运动步数';

-- ----------------------------
-- Records of fa_app_step
-- ----------------------------
INSERT INTO `fa_app_step` VALUES ('36', '6', '0', '0', '0', '1574352000', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('37', '6', '0', '0', '0', '1574438400', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('38', '6', '0', '0', '0', '1574524800', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('39', '6', '0', '0', '0', '1574611200', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('40', '6', '0', '0', '0', '1574697600', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('41', '6', '0', '0', '0', '1574784000', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('42', '6', '0', '0', '0', '1574870400', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('43', '6', '0', '0', '0', '1574956800', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('44', '6', '0', '0', '0', '1575043200', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('45', '6', '0', '0', '0', '1575129600', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('46', '6', '0', '0', '0', '1575216000', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('47', '6', '0', '0', '0', '1575302400', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('48', '6', '0', '0', '0', '1575388800', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('49', '6', '0', '0', '0', '1575475200', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('50', '6', '0', '0', '0', '1575561600', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('51', '6', '0', '0', '0', '1575648000', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('52', '6', '0', '0', '0', '1575734400', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('53', '6', '0', '0', '0', '1575820800', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('54', '6', '0', '0', '0', '1575907200', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('55', '6', '0', '0', '0', '1575993600', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('56', '6', '0', '0', '0', '1576080000', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('57', '6', '0', '0', '0', '1576166400', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('58', '6', '0', '0', '0', '1576252800', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('59', '6', '0', '0', '0', '1576339200', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('60', '6', '0', '0', '0', '1576425600', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('61', '6', '0', '0', '0', '1576512000', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('62', '6', '0', '0', '0', '1576598400', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('63', '6', '0', '0', '0', '1576684800', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('64', '6', '0', '0', '0', '1576771200', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('65', '6', '5561', '0', '0', '1576857600', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('66', '6', '1251', '0', '0', '1576944000', '1577019297', '1577019297');
INSERT INTO `fa_app_step` VALUES ('67', '6', '5792', '0', '0', '1577030400', '1577610355', '1577610355');
INSERT INTO `fa_app_step` VALUES ('68', '6', '10989', '0', '0', '1577116800', '1577610355', '1577610355');
INSERT INTO `fa_app_step` VALUES ('69', '6', '6195', '0', '0', '1577203200', '1577610355', '1577610355');
INSERT INTO `fa_app_step` VALUES ('70', '6', '5508', '0', '0', '1577289600', '1577610355', '1577610355');
INSERT INTO `fa_app_step` VALUES ('71', '6', '6209', '0', '0', '1577376000', '1577610355', '1577610355');
INSERT INTO `fa_app_step` VALUES ('72', '6', '5905', '0', '0', '1577462400', '1577610355', '1577610355');
INSERT INTO `fa_app_step` VALUES ('73', '6', '1162', '0', '0', '1577548800', '1577610355', '1577610355');

-- ----------------------------
-- Table structure for fa_app_step_like
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_step_like`;
CREATE TABLE `fa_app_step_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `step_id` int(11) NOT NULL COMMENT '步数ID',
  `operate_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '点赞用户',
  `target_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被赞用户',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='运动步数点赞';

-- ----------------------------
-- Records of fa_app_step_like
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_theme
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_theme`;
CREATE TABLE `fa_app_theme` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL COMMENT '标签',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主题名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='主题';

-- ----------------------------
-- Records of fa_app_theme
-- ----------------------------
INSERT INTO `fa_app_theme` VALUES ('1', '1', '降血糖', '0', '1', '1576995308', '1576995343');
INSERT INTO `fa_app_theme` VALUES ('2', '1', '糖尿病康复', '0', '1', '1576995322', '1576995343');
INSERT INTO `fa_app_theme` VALUES ('3', '2', '降血脂', '0', '1', '1576997510', '1576997510');
INSERT INTO `fa_app_theme` VALUES ('4', '2', '心血管', '0', '1', '1576997520', '1576997531');
INSERT INTO `fa_app_theme` VALUES ('5', '2', '甲状腺', '0', '1', '1576997540', '1576999092');

-- ----------------------------
-- Table structure for fa_app_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_user`;
CREATE TABLE `fa_app_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信昵称',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `gender` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '性别:0=未知,1=男,2=女',
  `phone_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `unionid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionid',
  `session_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'session_key',
  `role` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '角色:0=普通,1=达人',
  `is_bind` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '授权手机号:0=未授权,1=已授权',
  `bg_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主页背景图片',
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=正常',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_openid` (`openid`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';

-- ----------------------------
-- Records of fa_app_user
-- ----------------------------
INSERT INTO `fa_app_user` VALUES ('6', '池艺林', 'Y_Lin', 'https://wx.qlogo.cn/mmopen/vi_32/2TdZ2bbwCNxfj0UPicQMiaBtFq7ibbVte3RS6kXk2FIr3Dkd4Ie7DX0EjFy10VjibSbEJdTcr34IJMEyichtJcHnPibQ/132', '1', '17600604129', 'oXXyo5aN4ePWCKg-k5OPVxP-4Ops', '', 'gK5QtIEr9WtXuupasF3AMQ==', '1', '0', '', '', '1', '1577011426', '1577629135');
INSERT INTO `fa_app_user` VALUES ('8', '', '雨后的向日葵', 'https://wx.qlogo.cn/mmopen/vi_32/2TdZ2bbwCNxfj0UPicQMiaBtFq7ibbVte3RS6kXk2FIr3Dkd4Ie7DX0EjFy10VjibSbEJdTcr34IJMEyichtJcHnPibQ/132', '1', '17600604129', 'oXXyo5aN4ePWCKg-5OPVxP-4Ops', '', 'gK5QtIEr9WtXuupasF3AMQ==', '0', '0', '', '', '1', '1577011426', '1577011426');

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES ('10', '1', '0', '/uploads/20200102/f57ebce8a72b823912904fe76eda0909.png', '0', '0', 'png', '0', '15135', 'image/png', '', '1577977387', '1577977387', '1577977387', 'alioss', 'f57ebce8a72b823912904fe76eda0909');
INSERT INTO `fa_attachment` VALUES ('11', '1', '0', '/uploads/20200102/26f5e51b8ac7fbd6f1c649cc45a18265.png', '0', '0', 'png', '0', '21859', 'image/png', '', '1577977556', '1577977556', '1577977556', 'alioss', '26f5e51b8ac7fbd6f1c649cc45a18265');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `fa_auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `fa_auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `fa_auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `fa_auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '0', '1497429920', '1577598810', '143', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '137', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-leaf', '', 'Category tips', '0', '1497429920', '1577598770', '119', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1577599430', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '99', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '104', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '142', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '141', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '140', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '139', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '138', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('59', 'file', '4', 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('66', 'file', '0', 'user', 'User', 'fa fa-list', '', '', '0', '1516374729', '1577598778', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('67', 'file', '66', 'user/user', 'User', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('68', 'file', '67', 'user/user/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('69', 'file', '67', 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('70', 'file', '67', 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('71', 'file', '67', 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('72', 'file', '67', 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('73', 'file', '66', 'user/group', 'User group', 'fa fa-users', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('74', 'file', '73', 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('75', 'file', '73', 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('76', 'file', '73', 'user/group/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('77', 'file', '73', 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('78', 'file', '73', 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('79', 'file', '66', 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('80', 'file', '79', 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('81', 'file', '79', 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('82', 'file', '79', 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('83', 'file', '79', 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('84', 'file', '79', 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('85', 'file', '0', 'command', '在线命令管理', 'fa fa-terminal', '', '', '1', '1576679517', '1577603270', '9999', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('86', 'file', '85', 'command/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679517', '1576679517', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('87', 'file', '85', 'command/add', '添加', 'fa fa-circle-o', '', '', '0', '1576679517', '1576679517', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('88', 'file', '85', 'command/detail', '详情', 'fa fa-circle-o', '', '', '0', '1576679517', '1576679517', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('89', 'file', '85', 'command/execute', '运行', 'fa fa-circle-o', '', '', '0', '1576679517', '1576679517', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('90', 'file', '85', 'command/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679517', '1576679517', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('91', 'file', '85', 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679517', '1576679517', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('92', 'file', '0', 'example', '开发示例管理', 'fa fa-magic', '', '', '0', '1576679563', '1577598789', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('93', 'file', '92', 'example/bootstraptable', '表格完整示例', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('94', 'file', '93', 'example/bootstraptable/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('95', 'file', '93', 'example/bootstraptable/detail', '详情', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('96', 'file', '93', 'example/bootstraptable/change', '变更', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('97', 'file', '93', 'example/bootstraptable/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('98', 'file', '93', 'example/bootstraptable/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('99', 'file', '92', 'example/customsearch', '自定义搜索', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('100', 'file', '99', 'example/customsearch/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('101', 'file', '99', 'example/customsearch/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('102', 'file', '99', 'example/customsearch/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('103', 'file', '92', 'example/customform', '自定义表单示例', 'fa fa-edit', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('104', 'file', '103', 'example/customform/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('105', 'file', '92', 'example/tablelink', '表格联动示例', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('106', 'file', '105', 'example/tablelink/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('107', 'file', '92', 'example/colorbadge', '彩色角标', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('108', 'file', '107', 'example/colorbadge/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('109', 'file', '107', 'example/colorbadge/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('110', 'file', '107', 'example/colorbadge/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('111', 'file', '92', 'example/controllerjump', '控制器间跳转', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('112', 'file', '111', 'example/controllerjump/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('113', 'file', '111', 'example/controllerjump/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('114', 'file', '111', 'example/controllerjump/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('115', 'file', '92', 'example/cxselect', '多级联动', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('116', 'file', '115', 'example/cxselect/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('117', 'file', '115', 'example/cxselect/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('118', 'file', '115', 'example/cxselect/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('119', 'file', '92', 'example/multitable', '多表格示例', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('120', 'file', '119', 'example/multitable/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('121', 'file', '119', 'example/multitable/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('122', 'file', '119', 'example/multitable/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('123', 'file', '92', 'example/relationmodel', '关联模型示例', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('124', 'file', '123', 'example/relationmodel/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('125', 'file', '123', 'example/relationmodel/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('126', 'file', '123', 'example/relationmodel/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('127', 'file', '92', 'example/tabletemplate', '表格模板示例', 'fa fa-table', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('128', 'file', '127', 'example/tabletemplate/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('129', 'file', '127', 'example/tabletemplate/detail', '详情', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('130', 'file', '127', 'example/tabletemplate/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('131', 'file', '127', 'example/tabletemplate/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('132', 'file', '92', 'example/baidumap', '百度地图示例', 'fa fa-map-pin', '', '', '1', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('133', 'file', '132', 'example/baidumap/index', '查看', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('134', 'file', '132', 'example/baidumap/map', '详情', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('135', 'file', '132', 'example/baidumap/del', '删除', 'fa fa-circle-o', '', '', '0', '1576679563', '1576679563', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('163', 'file', '0', 'calendar', '日历管理', 'fa fa-calendar', '', '', '0', '1576680213', '1577598795', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('164', 'file', '163', 'calendar/index', '查看', 'fa fa-circle-o', '', '', '0', '1576680213', '1576680213', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('165', 'file', '163', 'calendar/addevent', '添加事件', 'fa fa-circle-o', '', '', '0', '1576680213', '1576680213', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('166', 'file', '163', 'calendar/delevent', '删除事件', 'fa fa-circle-o', '', '', '0', '1576680213', '1576680213', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('167', 'file', '163', 'calendar/add', '添加日历', 'fa fa-circle-o', '', '', '0', '1576680213', '1576680213', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('168', 'file', '163', 'calendar/edit', '编辑日历', 'fa fa-circle-o', '', '', '0', '1576680213', '1576680213', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('169', 'file', '163', 'calendar/del', '删除日历', 'fa fa-circle-o', '', '', '0', '1576680213', '1576680213', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('170', 'file', '163', 'calendar/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576680213', '1576680213', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('171', 'file', '0', 'app', '小程序设置', 'fa fa-list', '', '', '1', '1576995122', '1577602791', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('172', 'file', '171', 'app/label', '标签设置', 'fa fa-circle-o', '', '', '1', '1576995122', '1577602944', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('173', 'file', '172', 'app/label/index', '查看', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('174', 'file', '172', 'app/label/add', '添加', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('175', 'file', '172', 'app/label/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('176', 'file', '172', 'app/label/del', '删除', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('177', 'file', '172', 'app/label/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('178', 'file', '171', 'app/theme', '主题设置', 'fa fa-circle-o', '', '', '1', '1576995122', '1577602964', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('179', 'file', '178', 'app/theme/index', '查看', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('180', 'file', '178', 'app/theme/add', '添加', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('181', 'file', '178', 'app/theme/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('182', 'file', '178', 'app/theme/del', '删除', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('183', 'file', '178', 'app/theme/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1576995122', '1576995122', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('184', 'file', '171', 'app/user', '用户列表', 'fa fa-circle-o', '', '', '1', '1577006620', '1577602981', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('185', 'file', '184', 'app/user/index', '查看', 'fa fa-circle-o', '', '', '0', '1577006620', '1577006620', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('186', 'file', '184', 'app/user/add', '添加', 'fa fa-circle-o', '', '', '0', '1577006620', '1577006620', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('187', 'file', '184', 'app/user/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577006620', '1577006620', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('188', 'file', '184', 'app/user/del', '删除', 'fa fa-circle-o', '', '', '0', '1577006620', '1577006620', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('189', 'file', '184', 'app/user/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577006620', '1577006620', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('190', 'file', '264', 'app/step', '微信运动步数', 'fa fa-circle-o', '', '', '1', '1577018607', '1577603133', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('191', 'file', '190', 'app/step/index', '查看', 'fa fa-circle-o', '', '', '0', '1577018607', '1577018607', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('192', 'file', '190', 'app/step/add', '添加', 'fa fa-circle-o', '', '', '0', '1577018607', '1577018607', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('193', 'file', '190', 'app/step/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577018607', '1577018607', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('194', 'file', '190', 'app/step/del', '删除', 'fa fa-circle-o', '', '', '0', '1577018607', '1577018607', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('195', 'file', '190', 'app/step/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577018607', '1577018607', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('196', 'file', '171', 'app/column', '栏目设置', 'fa fa-circle-o', '', '', '1', '1577020480', '1577603253', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('197', 'file', '196', 'app/column/index', '查看', 'fa fa-circle-o', '', '', '0', '1577020480', '1577020480', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('198', 'file', '196', 'app/column/add', '添加', 'fa fa-circle-o', '', '', '0', '1577020480', '1577020480', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('199', 'file', '196', 'app/column/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577020480', '1577020480', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('200', 'file', '196', 'app/column/del', '删除', 'fa fa-circle-o', '', '', '0', '1577020480', '1577020480', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('201', 'file', '196', 'app/column/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577020480', '1577020480', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('202', 'file', '265', 'app/article', '文章列表', 'fa fa-circle-o', '', '', '1', '1577022259', '1577603196', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('203', 'file', '202', 'app/article/index', '查看', 'fa fa-circle-o', '', '', '0', '1577022259', '1577022259', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('204', 'file', '202', 'app/article/add', '添加', 'fa fa-circle-o', '', '', '0', '1577022259', '1577022259', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('205', 'file', '202', 'app/article/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577022259', '1577022259', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('206', 'file', '202', 'app/article/del', '删除', 'fa fa-circle-o', '', '', '0', '1577022259', '1577022259', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('207', 'file', '202', 'app/article/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577022259', '1577022259', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('208', 'file', '263', 'app/comment', '评论列表', 'fa fa-circle-o', '', '', '1', '1577026416', '1577602865', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('209', 'file', '208', 'app/comment/index', '查看', 'fa fa-circle-o', '', '', '0', '1577026416', '1577026416', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('210', 'file', '208', 'app/comment/add', '添加', 'fa fa-circle-o', '', '', '0', '1577026416', '1577026416', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('211', 'file', '208', 'app/comment/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577026416', '1577026416', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('212', 'file', '208', 'app/comment/del', '删除', 'fa fa-circle-o', '', '', '0', '1577026416', '1577026416', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('213', 'file', '208', 'app/comment/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577026416', '1577026416', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('220', 'file', '265', 'app/article_like', '文章点赞', 'fa fa-circle-o', '', '', '1', '1577027679', '1577603205', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('221', 'file', '220', 'app/article_like/index', '查看', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('222', 'file', '220', 'app/article_like/add', '添加', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('223', 'file', '220', 'app/article_like/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('224', 'file', '220', 'app/article_like/del', '删除', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('225', 'file', '220', 'app/article_like/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('226', 'file', '263', 'app/comment_like', '评论点赞', 'fa fa-circle-o', '', '', '1', '1577027679', '1577603212', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('227', 'file', '226', 'app/comment_like/index', '查看', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('228', 'file', '226', 'app/comment_like/add', '添加', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('229', 'file', '226', 'app/comment_like/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('230', 'file', '226', 'app/comment_like/del', '删除', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('231', 'file', '226', 'app/comment_like/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('232', 'file', '264', 'app/step_like', '运动步数点赞', 'fa fa-circle-o', '', '', '1', '1577027679', '1577603144', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('233', 'file', '232', 'app/step_like/index', '查看', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('234', 'file', '232', 'app/step_like/add', '添加', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('235', 'file', '232', 'app/step_like/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('236', 'file', '232', 'app/step_like/del', '删除', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('237', 'file', '232', 'app/step_like/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577027679', '1577027679', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('238', 'file', '262', 'app/activity', '活动列表', 'fa fa-circle-o', '', '', '1', '1577029191', '1577602746', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('239', 'file', '238', 'app/activity/index', '查看', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('240', 'file', '238', 'app/activity/add', '添加', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('241', 'file', '238', 'app/activity/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('242', 'file', '238', 'app/activity/del', '删除', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('243', 'file', '238', 'app/activity/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('244', 'file', '262', 'app/activity_apply', '活动申请', 'fa fa-circle-o', '', '', '1', '1577029191', '1577602752', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('245', 'file', '244', 'app/activity_apply/index', '查看', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('246', 'file', '244', 'app/activity_apply/add', '添加', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('247', 'file', '244', 'app/activity_apply/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('248', 'file', '244', 'app/activity_apply/del', '删除', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('249', 'file', '244', 'app/activity_apply/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577029191', '1577029191', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('250', 'file', '262', 'app/activity_like', '活动点赞', 'fa fa-circle-o', '', '', '1', '1577029619', '1577602760', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('251', 'file', '250', 'app/activity_like/index', '查看', 'fa fa-circle-o', '', '', '0', '1577029619', '1577029619', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('252', 'file', '250', 'app/activity_like/add', '添加', 'fa fa-circle-o', '', '', '0', '1577029619', '1577029619', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('253', 'file', '250', 'app/activity_like/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577029619', '1577029619', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('254', 'file', '250', 'app/activity_like/del', '删除', 'fa fa-circle-o', '', '', '0', '1577029619', '1577029619', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('255', 'file', '250', 'app/activity_like/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577029619', '1577029619', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('256', 'file', '171', 'app/banner', 'Banner', 'fa fa-circle-o', '', '', '1', '1577289629', '1577289629', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('257', 'file', '256', 'app/banner/index', '查看', 'fa fa-circle-o', '', '', '0', '1577289629', '1577289629', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('258', 'file', '256', 'app/banner/add', '添加', 'fa fa-circle-o', '', '', '0', '1577289629', '1577289629', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('259', 'file', '256', 'app/banner/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577289629', '1577289629', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('260', 'file', '256', 'app/banner/del', '删除', 'fa fa-circle-o', '', '', '0', '1577289629', '1577289629', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('261', 'file', '256', 'app/banner/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577289629', '1577289629', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('262', 'file', '0', 'activity', '活动中心', 'fa fa-file-sound-o', '', '', '1', '1577602709', '1577602709', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('263', 'file', '265', 'comment', '评论中心', 'fa fa-comments', '', '', '1', '1577602829', '1577603231', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('264', 'file', '0', 'sports', '微信运动', 'fa fa-th-list', '', '', '1', '1577603103', '1577603103', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('265', 'file', '0', 'article', '文章管理', 'fa fa-pagelines', '', '', '1', '1577603179', '1577603179', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('266', 'file', '265', 'app/article_view', '文章浏览', 'fa fa-circle-o', '', '', '1', '1577619500', '1577619519', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('267', 'file', '266', 'app/article_view/index', '查看', 'fa fa-circle-o', '', '', '0', '1577619500', '1577619500', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('268', 'file', '266', 'app/article_view/add', '添加', 'fa fa-circle-o', '', '', '0', '1577619500', '1577619500', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('269', 'file', '266', 'app/article_view/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577619500', '1577619500', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('270', 'file', '266', 'app/article_view/del', '删除', 'fa fa-circle-o', '', '', '0', '1577619500', '1577619500', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('271', 'file', '266', 'app/article_view/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577619500', '1577619500', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('272', 'file', '262', 'app/activity_view', '活动浏览', 'fa fa-circle-o', '', '', '1', '1577633601', '1577633625', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('273', 'file', '272', 'app/activity_view/index', '查看', 'fa fa-circle-o', '', '', '0', '1577633601', '1577633601', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('274', 'file', '272', 'app/activity_view/add', '添加', 'fa fa-circle-o', '', '', '0', '1577633601', '1577633601', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('275', 'file', '272', 'app/activity_view/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577633601', '1577633601', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('276', 'file', '272', 'app/activity_view/del', '删除', 'fa fa-circle-o', '', '', '0', '1577633601', '1577633601', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('277', 'file', '272', 'app/activity_view/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577633601', '1577633601', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('278', 'file', '284', 'app/plan_data', '数据类型', 'fa fa-circle-o', '', '', '1', '1577715859', '1577715937', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('279', 'file', '278', 'app/plan_data/index', '查看', 'fa fa-circle-o', '', '', '0', '1577715859', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('280', 'file', '278', 'app/plan_data/add', '添加', 'fa fa-circle-o', '', '', '0', '1577715859', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('281', 'file', '278', 'app/plan_data/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577715859', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('282', 'file', '278', 'app/plan_data/del', '删除', 'fa fa-circle-o', '', '', '0', '1577715859', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('283', 'file', '278', 'app/plan_data/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577715859', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('284', 'file', '0', 'plan', '计划中心', 'fa fa-glide', '', '', '1', '1577715920', '1577715920', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('285', 'file', '284', 'app/plan_recipe', '食谱类型', 'fa fa-circle-o', '', '', '1', '1577717333', '1577717347', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('286', 'file', '285', 'app/plan_recipe/index', '查看', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('287', 'file', '285', 'app/plan_recipe/add', '添加', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('288', 'file', '285', 'app/plan_recipe/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('289', 'file', '285', 'app/plan_recipe/del', '删除', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('290', 'file', '285', 'app/plan_recipe/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('291', 'file', '284', 'app/plan_sport', '运动类型', 'fa fa-circle-o', '', '', '1', '1577717333', '1577717358', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('292', 'file', '291', 'app/plan_sport/index', '查看', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('293', 'file', '291', 'app/plan_sport/add', '添加', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('294', 'file', '291', 'app/plan_sport/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('295', 'file', '291', 'app/plan_sport/del', '删除', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('296', 'file', '291', 'app/plan_sport/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577717333', '1577878176', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('297', 'file', '171', 'app/dynamic', '动态', 'fa fa-circle-o', '', '', '1', '1577875053', '1577875053', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('298', 'file', '297', 'app/dynamic/index', '查看', 'fa fa-circle-o', '', '', '0', '1577875053', '1577875053', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('299', 'file', '297', 'app/dynamic/add', '添加', 'fa fa-circle-o', '', '', '0', '1577875053', '1577875053', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('300', 'file', '297', 'app/dynamic/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577875053', '1577875053', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('301', 'file', '297', 'app/dynamic/del', '删除', 'fa fa-circle-o', '', '', '0', '1577875053', '1577875053', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('302', 'file', '297', 'app/dynamic/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577875053', '1577875053', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('303', 'file', '0', 'plan_item', '计划模板', 'fa fa-sliders', '', '', '1', '1577878062', '1577883116', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('304', 'file', '303', 'app/plan', '计划', 'fa fa-circle-o', '', '', '1', '1577883201', '1577883219', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('305', 'file', '304', 'app/plan/index', '查看', 'fa fa-circle-o', '', '', '0', '1577883201', '1577883201', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('306', 'file', '304', 'app/plan/add', '添加', 'fa fa-circle-o', '', '', '0', '1577883201', '1577883201', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('307', 'file', '304', 'app/plan/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1577883201', '1577883201', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('308', 'file', '304', 'app/plan/del', '删除', 'fa fa-circle-o', '', '', '0', '1577883201', '1577883201', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('309', 'file', '304', 'app/plan/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1577883201', '1577883201', '0', 'normal');

-- ----------------------------
-- Table structure for fa_calendar
-- ----------------------------
DROP TABLE IF EXISTS `fa_calendar`;
CREATE TABLE `fa_calendar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `title` varchar(100) NOT NULL COMMENT '任务标题',
  `url` varchar(100) NOT NULL COMMENT '链接',
  `starttime` int(10) NOT NULL COMMENT '开始时间',
  `endtime` int(10) NOT NULL COMMENT '结束时间',
  `background` varchar(10) NOT NULL COMMENT '背景颜色',
  `classname` varchar(30) NOT NULL COMMENT '自定义类名',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `status` enum('normal','hidden','expired','completed') NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='日历表';

-- ----------------------------
-- Records of fa_calendar
-- ----------------------------
INSERT INTO `fa_calendar` VALUES ('148', '1', '外部链接事件', 'http://www.baidu.com', '1505059200', '1505059200', '#f012be', '', '1505125111', '1505125111', 'normal');
INSERT INTO `fa_calendar` VALUES ('149', '1', '新选项卡事件', 'dashboard', '1505235600', '1505235600', '#e74c3c', 'btn-addtabs', '1505125095', '1505125559', 'normal');
INSERT INTO `fa_calendar` VALUES ('150', '1', '弹窗事件', 'general/profile', '1505498400', '1505539800', '#0073b7', 'btn-dialog', '1505125066', '1505125555', 'completed');
INSERT INTO `fa_calendar` VALUES ('151', '1', '普通事件', '', '1506009600', '1506009600', '#18bc9c', '', '1505125044', '1505125044', 'normal');
INSERT INTO `fa_calendar` VALUES ('152', '1', '普通事件', '', '1505244600', '1505428200', '#18bc9c', '', '1505125044', '1505125575', 'normal');
INSERT INTO `fa_calendar` VALUES ('153', '1', '新选项卡事件', 'dashboard', '1506009600', '1506009600', '#e74c3c', 'btn-addtabs', '1505125095', '1505125095', 'normal');
INSERT INTO `fa_calendar` VALUES ('154', '1', '外部链接事件', 'http://www.baidu.com', '1506009600', '1506009600', '#f012be', '', '1505125111', '1505125111', 'normal');
INSERT INTO `fa_calendar` VALUES ('155', '1', '新选项卡事件', 'dashboard', '1505491200', '1505491200', '#e74c3c', 'btn-addtabs', '1505125095', '1505125095', 'normal');
INSERT INTO `fa_calendar` VALUES ('156', '1', '新选项卡事件', 'dashboard', '1504886400', '1504886400', '#e74c3c', 'btn-addtabs', '1505125095', '1505125095', 'normal');
INSERT INTO `fa_calendar` VALUES ('157', '1', '新选项卡事件', 'dashboard', '1504713600', '1505059200', '#e74c3c', 'btn-addtabs', '1505125095', '1505125631', 'completed');
INSERT INTO `fa_calendar` VALUES ('158', '1', '弹窗事件', 'general/profile', '1504713600', '1504713600', '#0073b7', 'btn-dialog', '1505125066', '1505125066', 'completed');
INSERT INTO `fa_calendar` VALUES ('159', '1', '弹窗事件', 'general/profile', '1505232000', '1505232000', '#0073b7', 'btn-dialog', '1505125066', '1505125066', 'normal');

-- ----------------------------
-- Table structure for fa_calendar_event
-- ----------------------------
DROP TABLE IF EXISTS `fa_calendar_event`;
CREATE TABLE `fa_calendar_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '任务标题',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `background` varchar(10) NOT NULL COMMENT '背景颜色',
  `classname` varchar(30) NOT NULL COMMENT '自定义类名',
  `createtime` int(10) NOT NULL COMMENT '添加时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='事件表';

-- ----------------------------
-- Records of fa_calendar_event
-- ----------------------------
INSERT INTO `fa_calendar_event` VALUES ('42', '1', '普通事件', '', '#18bc9c', '', '1505125044', '1505125044');
INSERT INTO `fa_calendar_event` VALUES ('43', '1', '弹窗事件', 'general/profile', '#0073b7', 'btn-dialog', '1505125066', '1505125066');
INSERT INTO `fa_calendar_event` VALUES ('44', '1', '新选项卡事件', 'dashboard', '#e74c3c', 'btn-addtabs', '1505125095', '1505125095');
INSERT INTO `fa_calendar_event` VALUES ('45', '1', '外部链接事件', 'http://www.baidu.com', '#f012be', '', '1505125111', '1505125111');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1495262190', '1', 'normal');
INSERT INTO `fa_category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `fa_category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `fa_category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `fa_category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `fa_category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `fa_category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'normal');
INSERT INTO `fa_category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `fa_category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `fa_category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `fa_category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `fa_category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `fa_category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for fa_command
-- ----------------------------
DROP TABLE IF EXISTS `fa_command`;
CREATE TABLE `fa_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='在线命令表';

-- ----------------------------
-- Records of fa_command
-- ----------------------------
INSERT INTO `fa_command` VALUES ('1', 'crud', '[\"--table=fa_app_theme\",\"--controller=app\\\\Theme\"]', 'php think crud --table=fa_app_theme --controller=app\\Theme', 'Build Successed', '1576995088', '1576995088', '1576995088', 'successed');
INSERT INTO `fa_command` VALUES ('2', 'crud', '[\"--table=fa_app_label\",\"--controller=app\\\\Label\",\"--relation=fa_app_theme\",\"--relationmode=belongsto\",\"--relationforeignkey=theme_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --table=fa_app_label --controller=app\\Label --relation=fa_app_theme --relationmode=belongsto --relationforeignkey=theme_id --relationprimarykey=id --relationfields=name', 'Build Successed', '1576995113', '1576995113', '1576995113', 'successed');
INSERT INTO `fa_command` VALUES ('3', 'menu', '[\"--controller=app\\/Label\",\"--controller=app\\/Theme\"]', 'php think menu --controller=app/Label --controller=app/Theme', 'Build Successed!', '1576995122', '1576995122', '1576995122', 'successed');
INSERT INTO `fa_command` VALUES ('4', 'crud', '[\"--table=fa_app_label\",\"--controller=app\\/Label\"]', 'php think crud --table=fa_app_label --controller=app/Label', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1576998651', '1576998651', '1576998651', 'failured');
INSERT INTO `fa_command` VALUES ('5', 'crud', '[\"--table=fa_app_label\",\"--controller=app\\/Label\"]', 'php think crud --table=fa_app_label --controller=app/Label', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1576998666', '1576998666', '1576998666', 'failured');
INSERT INTO `fa_command` VALUES ('6', 'crud', '[\"--table=fa_app_label\",\"--controller=app\\/Label\"]', 'php think crud --table=fa_app_label --controller=app/Label', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1576998694', '1576998694', '1576998694', 'failured');
INSERT INTO `fa_command` VALUES ('7', 'crud', '[\"--table=fa_app_user\",\"--controller=app\\/User\"]', 'php think crud --table=fa_app_user --controller=app/User', 'Build Successed', '1577006616', '1577006616', '1577006616', 'successed');
INSERT INTO `fa_command` VALUES ('8', 'menu', '[\"--controller=app\\/User\"]', 'php think menu --controller=app/User', 'Build Successed!', '1577006620', '1577006620', '1577006620', 'successed');
INSERT INTO `fa_command` VALUES ('9', 'crud', '[\"--table=fa_app_step\",\"--controller=app\\/Step\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\"]', 'php think crud --table=fa_app_step --controller=app/Step --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar', 'Build Successed', '1577018597', '1577018597', '1577018597', 'successed');
INSERT INTO `fa_command` VALUES ('10', 'menu', '[\"--controller=app\\/Step\"]', 'php think menu --controller=app/Step', 'Build Successed!', '1577018607', '1577018607', '1577018607', 'successed');
INSERT INTO `fa_command` VALUES ('11', 'crud', '[\"--table=fa_app_column\",\"--controller=app\\/column\"]', 'php think crud --table=fa_app_column --controller=app/column', 'Build Successed', '1577020475', '1577020475', '1577020475', 'successed');
INSERT INTO `fa_command` VALUES ('12', 'menu', '[\"--controller=app\\/Column\"]', 'php think menu --controller=app/Column', 'Build Successed!', '1577020480', '1577020480', '1577020480', 'successed');
INSERT INTO `fa_command` VALUES ('13', 'crud', '[\"--table=fa_app_article\",\"--controller=app\\/Article\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_column\",\"--relationmode=belongsto\",\"--relationforeignkey=column_id\",\"--relationprimarykey=id\",\"--relationfields=title,subtitle\"]', 'php think crud --table=fa_app_article --controller=app/Article --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_column --relationmode=belongsto --relationforeignkey=column_id --relationprimarykey=id --relationfields=title,subtitle', 'Build Successed', '1577022217', '1577022217', '1577022217', 'successed');
INSERT INTO `fa_command` VALUES ('14', 'menu', '[\"--controller=app\\/Article\"]', 'php think menu --controller=app/Article', 'Build Successed!', '1577022259', '1577022259', '1577022259', 'successed');
INSERT INTO `fa_command` VALUES ('15', 'crud', '[\"--table=fa_app_comment\",\"--controller=app\\/Comment\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_article\",\"--relationmode=belongsto\",\"--relationforeignkey=article_id\",\"--relationprimarykey=id\",\"--relationfields=title\"]', 'php think crud --table=fa_app_comment --controller=app/Comment --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_article --relationmode=belongsto --relationforeignkey=article_id --relationprimarykey=id --relationfields=title', 'Build Successed', '1577026409', '1577026409', '1577026410', 'successed');
INSERT INTO `fa_command` VALUES ('16', 'menu', '[\"--controller=app\\/Comment\"]', 'php think menu --controller=app/Comment', 'Build Successed!', '1577026416', '1577026416', '1577026416', 'successed');
INSERT INTO `fa_command` VALUES ('17', 'crud', '[\"--table=fa_app_like\",\"--controller=app\\/Like\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_article\",\"--relationmode=belongsto\",\"--relationforeignkey=article_id\",\"--relationprimarykey=id\",\"--relationfields=title\",\"--relation=fa_app_comment\",\"--relationmode=belongsto\",\"--relationforeignkey=comment_id\",\"--relationprimarykey=id\",\"--relationfields=id,content\",\"--relation=fa_app_step\",\"--relationmode=belongsto\",\"--relationforeignkey=step_id\",\"--relationprimarykey=id\",\"--relationfields=step_number,target_step,timestamp\"]', 'php think crud --table=fa_app_like --controller=app/Like --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_article --relationmode=belongsto --relationforeignkey=article_id --relationprimarykey=id --relationfields=title --relation=fa_app_comment --relationmode=belongsto --relationforeignkey=comment_id --relationprimarykey=id --relationfields=id,content --relation=fa_app_step --relationmode=belongsto --relationforeignkey=step_id --relationprimarykey=id --relationfields=step_number,target_step,timestamp', 'Build Successed', '1577026788', '1577026788', '1577026788', 'successed');
INSERT INTO `fa_command` VALUES ('18', 'menu', '[\"--controller=app\\/Like\"]', 'php think menu --controller=app/Like', 'Build Successed!', '1577026794', '1577026794', '1577026794', 'successed');
INSERT INTO `fa_command` VALUES ('19', 'crud', '[\"--delete=1\",\"--table=fa_app_like\",\"--controller=app\\/Like\"]', 'php think crud --delete=1 --table=fa_app_like --controller=app/Like', null, '1577027274', '1577027274', '1577027274', 'failured');
INSERT INTO `fa_command` VALUES ('20', 'crud', '[\"--table=fa_app_article_like\",\"--controller=app\\/ArticleLike\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=operate_user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_article\",\"--relationmode=belongsto\",\"--relationforeignkey=article_id\",\"--relationprimarykey=id\",\"--relationfields=title\"]', 'php think crud --table=fa_app_article_like --controller=app/ArticleLike --relation=fa_app_user --relationmode=belongsto --relationforeignkey=operate_user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_article --relationmode=belongsto --relationforeignkey=article_id --relationprimarykey=id --relationfields=title', 'Build Successed', '1577027550', '1577027550', '1577027550', 'successed');
INSERT INTO `fa_command` VALUES ('21', 'crud', '[\"--table=fa_app_comment_like\",\"--controller=app\\/CommentLike\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=operate_user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_comment\",\"--relationmode=belongsto\",\"--relationforeignkey=comment_id\",\"--relationprimarykey=id\",\"--relationfields=content\"]', 'php think crud --table=fa_app_comment_like --controller=app/CommentLike --relation=fa_app_user --relationmode=belongsto --relationforeignkey=operate_user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_comment --relationmode=belongsto --relationforeignkey=comment_id --relationprimarykey=id --relationfields=content', 'Build Successed', '1577027608', '1577027608', '1577027608', 'successed');
INSERT INTO `fa_command` VALUES ('22', 'crud', '[\"--table=fa_app_step_like\",\"--controller=app\\/StepLike\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=operate_user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_step\",\"--relationmode=belongsto\",\"--relationforeignkey=step_id\",\"--relationprimarykey=id\",\"--relationfields=step_number,target_step,timestamp\"]', 'php think crud --table=fa_app_step_like --controller=app/StepLike --relation=fa_app_user --relationmode=belongsto --relationforeignkey=operate_user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_step --relationmode=belongsto --relationforeignkey=step_id --relationprimarykey=id --relationfields=step_number,target_step,timestamp', 'Build Successed', '1577027664', '1577027664', '1577027664', 'successed');
INSERT INTO `fa_command` VALUES ('23', 'menu', '[\"--controller=app\\/ArticleLike\",\"--controller=app\\/CommentLike\",\"--controller=app\\/StepLike\"]', 'php think menu --controller=app/ArticleLike --controller=app/CommentLike --controller=app/StepLike', 'Build Successed!', '1577027679', '1577027679', '1577027679', 'successed');
INSERT INTO `fa_command` VALUES ('24', 'crud', '[\"--table=fa_app_activity\",\"--controller=app\\/Activity\"]', 'php think crud --table=fa_app_activity --controller=app/Activity', 'Build Successed', '1577029156', '1577029156', '1577029156', 'successed');
INSERT INTO `fa_command` VALUES ('25', 'crud', '[\"--table=fa_app_activity_apply\",\"--controller=app\\/ActivityApply\",\"--relation=fa_app_activity\",\"--relationmode=belongsto\",\"--relationforeignkey=activity_id\",\"--relationprimarykey=id\",\"--relationfields=title\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\"]', 'php think crud --table=fa_app_activity_apply --controller=app/ActivityApply --relation=fa_app_activity --relationmode=belongsto --relationforeignkey=activity_id --relationprimarykey=id --relationfields=title --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar', 'Build Successed', '1577029184', '1577029184', '1577029184', 'successed');
INSERT INTO `fa_command` VALUES ('26', 'menu', '[\"--controller=app\\/Activity\",\"--controller=app\\/ActivityApply\"]', 'php think menu --controller=app/Activity --controller=app/ActivityApply', 'Build Successed!', '1577029191', '1577029191', '1577029191', 'successed');
INSERT INTO `fa_command` VALUES ('27', 'crud', '[\"--table=fa_app_activity_like\",\"--controller=app\\/ActivityLike\",\"--relation=fa_app_activity\",\"--relationmode=belongsto\",\"--relationforeignkey=activity_id\",\"--relationprimarykey=id\",\"--relationfields=title\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=operate_user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\"]', 'php think crud --table=fa_app_activity_like --controller=app/ActivityLike --relation=fa_app_activity --relationmode=belongsto --relationforeignkey=activity_id --relationprimarykey=id --relationfields=title --relation=fa_app_user --relationmode=belongsto --relationforeignkey=operate_user_id --relationprimarykey=id --relationfields=nickname,avatar', 'Build Successed', '1577029401', '1577029401', '1577029401', 'successed');
INSERT INTO `fa_command` VALUES ('28', 'menu', '[\"--controller=app\\/ActivityLike\"]', 'php think menu --controller=app/ActivityLike', 'Build Successed!', '1577029619', '1577029619', '1577029619', 'successed');
INSERT INTO `fa_command` VALUES ('29', 'crud', '[\"--table=fa_app_banner\",\"--controller=app\\/Banner\",\"--relation=fa_app_activity\",\"--relationmode=belongsto\",\"--relationforeignkey=activity_id\",\"--relationprimarykey=id\",\"--relationfields=cover_file,title\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\"]', 'php think crud --table=fa_app_banner --controller=app/Banner --relation=fa_app_activity --relationmode=belongsto --relationforeignkey=activity_id --relationprimarykey=id --relationfields=cover_file,title --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar', 'Build Successed', '1577289621', '1577289621', '1577289621', 'successed');
INSERT INTO `fa_command` VALUES ('30', 'menu', '[\"--controller=app\\/Banner\"]', 'php think menu --controller=app/Banner', 'Build Successed!', '1577289629', '1577289629', '1577289629', 'successed');
INSERT INTO `fa_command` VALUES ('31', 'crud', '[\"--table=fa_app_banner\",\"--controller=app\\/Banner\"]', 'php think crud --table=fa_app_banner --controller=app/Banner', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1577600768', '1577600768', '1577600768', 'failured');
INSERT INTO `fa_command` VALUES ('32', 'crud', '[\"--table=fa_app_article_view\",\"--controller=app\\/ArticleView\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=operate_user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_article\",\"--relationmode=belongsto\",\"--relationforeignkey=article_id\",\"--relationprimarykey=id\",\"--relationfields=title\"]', 'php think crud --table=fa_app_article_view --controller=app/ArticleView --relation=fa_app_user --relationmode=belongsto --relationforeignkey=operate_user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_article --relationmode=belongsto --relationforeignkey=article_id --relationprimarykey=id --relationfields=title', 'Build Successed', '1577619494', '1577619494', '1577619494', 'successed');
INSERT INTO `fa_command` VALUES ('33', 'menu', '[\"--controller=app\\/ArticleView\"]', 'php think menu --controller=app/ArticleView', 'Build Successed!', '1577619500', '1577619500', '1577619500', 'successed');
INSERT INTO `fa_command` VALUES ('34', 'crud', '[\"--table=fa_app_step\",\"--controller=app\\/Step\"]', 'php think crud --table=fa_app_step --controller=app/Step', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1577628940', '1577628940', '1577628940', 'failured');
INSERT INTO `fa_command` VALUES ('35', 'crud', '[\"--table=fa_app_step\",\"--controller=app\\/Step\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\"]', 'php think crud --table=fa_app_step --controller=app/Step --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1577629199', '1577629199', '1577629199', 'failured');
INSERT INTO `fa_command` VALUES ('36', 'crud', '[\"--table=fa_app_activity_view\",\"--controller=app\\/ActivityView\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=operate_user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\",\"--relation=fa_app_activity\",\"--relationmode=belongsto\",\"--relationforeignkey=activity_id\",\"--relationprimarykey=id\",\"--relationfields=title\"]', 'php think crud --table=fa_app_activity_view --controller=app/ActivityView --relation=fa_app_user --relationmode=belongsto --relationforeignkey=operate_user_id --relationprimarykey=id --relationfields=nickname,avatar --relation=fa_app_activity --relationmode=belongsto --relationforeignkey=activity_id --relationprimarykey=id --relationfields=title', 'Build Successed', '1577633487', '1577633487', '1577633487', 'successed');
INSERT INTO `fa_command` VALUES ('37', 'menu', '[\"--controller=app\\/ActivityView\"]', 'php think menu --controller=app/ActivityView', 'Build Successed!', '1577633601', '1577633601', '1577633601', 'successed');
INSERT INTO `fa_command` VALUES ('38', 'crud', '[\"--table=fa_app_plan_data\",\"--controller=app\\/PlanData\"]', 'php think crud --table=fa_app_plan_data --controller=app/PlanData', 'Build Successed', '1577715849', '1577715849', '1577715849', 'successed');
INSERT INTO `fa_command` VALUES ('39', 'menu', '[\"--controller=app\\/PlanData\"]', 'php think menu --controller=app/PlanData', 'Build Successed!', '1577715859', '1577715859', '1577715859', 'successed');
INSERT INTO `fa_command` VALUES ('40', 'menu', '[\"--controller=app\\/PlanRecipe\",\"--controller=app\\/PlanSport\"]', 'php think menu --controller=app/PlanRecipe --controller=app/PlanSport', 'Build Successed!', '1577717333', '1577717333', '1577717333', 'successed');
INSERT INTO `fa_command` VALUES ('41', 'crud', '[\"--table=fa_app_dynamic\",\"--controller=app\\/Dynamic\",\"--relation=fa_app_activity\",\"--relationmode=belongsto\",\"--relationforeignkey=activity_id\",\"--relationprimarykey=id\",\"--relationfields=title\",\"--relation=fa_app_article\",\"--relationmode=belongsto\",\"--relationforeignkey=article_id\",\"--relationprimarykey=id\",\"--relationfields=title\",\"--relation=fa_app_comment\",\"--relationmode=belongsto\",\"--relationforeignkey=comment_id\",\"--relationprimarykey=id\",\"--relationfields=content\",\"--relation=fa_app_article_like\",\"--relationmode=belongsto\",\"--relationforeignkey=article_like_id\",\"--relationprimarykey=id\",\"--relationfields=id\",\"--relation=fa_app_activity_like\",\"--relationmode=belongsto\",\"--relationforeignkey=activity_like_id\",\"--relationprimarykey=id\",\"--relationfields=id\"]', 'php think crud --table=fa_app_dynamic --controller=app/Dynamic --relation=fa_app_activity --relationmode=belongsto --relationforeignkey=activity_id --relationprimarykey=id --relationfields=title --relation=fa_app_article --relationmode=belongsto --relationforeignkey=article_id --relationprimarykey=id --relationfields=title --relation=fa_app_comment --relationmode=belongsto --relationforeignkey=comment_id --relationprimarykey=id --relationfields=content --relation=fa_app_article_like --relationmode=belongsto --relationforeignkey=article_like_id --relationprimarykey=id --relationfields=id --relation=fa_app_activity_like --relationmode=belongsto --relationforeignkey=activity_like_id --relationprimarykey=id --relationfields=id', 'Build Successed', '1577874711', '1577874711', '1577874711', 'successed');
INSERT INTO `fa_command` VALUES ('42', 'menu', '[\"--controller=app\\/Dynamic\"]', 'php think menu --controller=app/Dynamic', 'Build Successed!', '1577875053', '1577875053', '1577875053', 'successed');
INSERT INTO `fa_command` VALUES ('43', 'crud', '[\"--table=fa_app_plan_data\",\"--controller=app\\/PlanData\"]', 'php think crud --table=fa_app_plan_data --controller=app/PlanData', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1577878139', '1577878139', '1577878139', 'failured');
INSERT INTO `fa_command` VALUES ('44', 'crud', '[\"--table=fa_app_plan_recipe\",\"--controller=app\\/PlanRecipe\"]', 'php think crud --table=fa_app_plan_recipe --controller=app/PlanRecipe', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1577878153', '1577878153', '1577878153', 'failured');
INSERT INTO `fa_command` VALUES ('45', 'crud', '[\"--table=fa_app_plan_sport\",\"--controller=app\\/PlanSport\"]', 'php think crud --table=fa_app_plan_sport --controller=app/PlanSport', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', '1577878162', '1577878162', '1577878162', 'failured');
INSERT INTO `fa_command` VALUES ('46', 'menu', '[\"--controller=app\\/PlanData\",\"--controller=app\\/PlanRecipe\",\"--controller=app\\/PlanSport\"]', 'php think menu --controller=app/PlanData --controller=app/PlanRecipe --controller=app/PlanSport', 'Build Successed!', '1577878176', '1577878176', '1577878176', 'successed');
INSERT INTO `fa_command` VALUES ('47', 'crud', '[\"--table=fa_app_plan\",\"--controller=app\\/Plan\",\"--relation=fa_app_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname,avatar\"]', 'php think crud --table=fa_app_plan --controller=app/Plan --relation=fa_app_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname,avatar', 'Build Successed', '1577883187', '1577883187', '1577883187', 'successed');
INSERT INTO `fa_command` VALUES ('48', 'menu', '[\"--controller=app\\/Plan\"]', 'php think menu --controller=app/Plan', 'Build Successed!', '1577883201', '1577883201', '1577883201', 'successed');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `fa_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of fa_ems
-- ----------------------------

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Records of fa_sms
-- ----------------------------

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', null, '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES ('1', '1', 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '', '0', '0', '2017-04-15', '', '0.00', '0', '1', '1', '1516170492', '1516171614', '127.0.0.1', '0', '127.0.0.1', '1491461418', '0', '1516171614', '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员组表';

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES ('1', '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', '1515386468', '1516168298', 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员余额变动表';

-- ----------------------------
-- Records of fa_user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员规则表';

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES ('1', '0', 'index', '前台', '', '1', '1516168079', '1516168079', '1', 'normal');
INSERT INTO `fa_user_rule` VALUES ('2', '0', 'api', 'API接口', '', '1', '1516168062', '1516168062', '2', 'normal');
INSERT INTO `fa_user_rule` VALUES ('3', '1', 'user', '会员模块', '', '1', '1515386221', '1516168103', '12', 'normal');
INSERT INTO `fa_user_rule` VALUES ('4', '2', 'user', '会员模块', '', '1', '1515386221', '1516168092', '11', 'normal');
INSERT INTO `fa_user_rule` VALUES ('5', '3', 'index/user/login', '登录', '', '0', '1515386247', '1515386247', '5', 'normal');
INSERT INTO `fa_user_rule` VALUES ('6', '3', 'index/user/register', '注册', '', '0', '1515386262', '1516015236', '7', 'normal');
INSERT INTO `fa_user_rule` VALUES ('7', '3', 'index/user/index', '会员中心', '', '0', '1516015012', '1516015012', '9', 'normal');
INSERT INTO `fa_user_rule` VALUES ('8', '3', 'index/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '4', 'normal');
INSERT INTO `fa_user_rule` VALUES ('9', '4', 'api/user/login', '登录', '', '0', '1515386247', '1515386247', '6', 'normal');
INSERT INTO `fa_user_rule` VALUES ('10', '4', 'api/user/register', '注册', '', '0', '1515386262', '1516015236', '8', 'normal');
INSERT INTO `fa_user_rule` VALUES ('11', '4', 'api/user/index', '会员中心', '', '0', '1516015012', '1516015012', '10', 'normal');
INSERT INTO `fa_user_rule` VALUES ('12', '4', 'api/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '3', 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分变动表';

-- ----------------------------
-- Records of fa_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of fa_version
-- ----------------------------
INSERT INTO `fa_version` VALUES ('1', '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', '1', '1520425318', '0', '0', 'normal');
