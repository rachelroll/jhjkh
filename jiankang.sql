/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : jiankang

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-12-22 14:09:52
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '报名用户ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动名称',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动详情',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `apply_count` int(11) NOT NULL COMMENT '报名人数',
  `apply_count_limit` int(11) NOT NULL COMMENT '最多报名人数',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '截止时间',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动';

-- ----------------------------
-- Records of fa_app_activity
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_article
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_article`;
CREATE TABLE `fa_app_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type_id` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '类型:0=健康秀,1=讲座,2=专家,3=教练,4=膳食',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `view_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论量',
  `like_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章';

-- ----------------------------
-- Records of fa_app_article
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章标签关联';

-- ----------------------------
-- Records of fa_app_article_label
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_banner
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_banner`;
CREATE TABLE `fa_app_banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `position` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '展示位置:1=首页,2=运动,3=计划,4=发布',
  `click_type` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '跳转类型:0=无,1=网页链接,2=图文内容',
  `url_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图文内容',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '上架时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '下架时间',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Banner';

-- ----------------------------
-- Records of fa_app_banner
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论';

-- ----------------------------
-- Records of fa_app_comment
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_dynamic`;
CREATE TABLE `fa_app_dynamic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type_id` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '动态类型1=评论,2=发布,3=点赞',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='动态';

-- ----------------------------
-- Records of fa_app_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_label
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_label`;
CREATE TABLE `fa_app_label` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) NOT NULL COMMENT '主题',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态:0=禁用,1=启用',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标签';

-- ----------------------------
-- Records of fa_app_label
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='点赞';

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
-- Table structure for fa_app_step
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_step`;
CREATE TABLE `fa_app_step` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `step_number` int(11) NOT NULL DEFAULT '0' COMMENT '实际步数',
  `target_step` int(11) NOT NULL DEFAULT '0' COMMENT '目标步数',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `likes_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日期',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信运动步数';

-- ----------------------------
-- Records of fa_app_step
-- ----------------------------

-- ----------------------------
-- Table structure for fa_app_theme
-- ----------------------------
DROP TABLE IF EXISTS `fa_app_theme`;
CREATE TABLE `fa_app_theme` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主题名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=启用',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='主题';

-- ----------------------------
-- Records of fa_app_theme
-- ----------------------------

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
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态:0=禁用,1=正常',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';

-- ----------------------------
-- Records of fa_app_user
-- ----------------------------
INSERT INTO `fa_app_user` VALUES ('1', '', '', '', '', '', '1123123', '', '111111111111111', '', '0', '', '', '2019', '2019');
