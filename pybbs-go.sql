/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : pybbs-go

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-14 13:32:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '0', '', '', '话题节点');
INSERT INTO `permission` VALUES ('2', '1', '/topic/create', 'topic:add', '创建话题');
INSERT INTO `permission` VALUES ('3', '1', '/topic/edit/[0-9]+', 'topic:edit', '编辑话题');
INSERT INTO `permission` VALUES ('4', '1', '/topic/delete/[0-9]+', 'topic:delete', '删除话题');
INSERT INTO `permission` VALUES ('5', '0', '', '', '回复节点');
INSERT INTO `permission` VALUES ('6', '5', '/reply/delete/[0-9]+', 'reply:delete', '删除回复');
INSERT INTO `permission` VALUES ('7', '5', '/reply/save', 'reply:save', '创建回复');
INSERT INTO `permission` VALUES ('8', '5', '/reply/up', 'reply:up', '点赞回复');
INSERT INTO `permission` VALUES ('12', '0', '', '', '权限节点');
INSERT INTO `permission` VALUES ('13', '12', '/user/list', 'user:list', '用户列表');
INSERT INTO `permission` VALUES ('14', '12', '/user/edit/[0-9]+', 'user:edit', '角色配置');
INSERT INTO `permission` VALUES ('15', '12', '/user/delete/[0-9]+', 'user:delete', '用户删除');
INSERT INTO `permission` VALUES ('16', '12', '/role/list', 'role:list', '角色列表');
INSERT INTO `permission` VALUES ('17', '12', '/role/add', 'role:add', '添加角色');
INSERT INTO `permission` VALUES ('18', '12', '/role/delete/[0-9]+', 'role:delete', '删除角色');
INSERT INTO `permission` VALUES ('20', '12', '/role/edit/[0-9]+', 'role:edit', '编辑角色');
INSERT INTO `permission` VALUES ('21', '12', '/permission/list', 'permission:list', '权限列表');
INSERT INTO `permission` VALUES ('22', '12', '/permission/add', 'permission:add', '添加权限');
INSERT INTO `permission` VALUES ('23', '12', '/permission/edit/[0-9]+', 'permission:edit', '编辑权限');
INSERT INTO `permission` VALUES ('24', '12', '/permission/delete/[0-9]+', 'permission:delete', '删除权限');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `up` int(11) NOT NULL DEFAULT '0',
  `in_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '1', '分享世界', '1', '0', '2016-08-26 09:22:52');
INSERT INTO `reply` VALUES ('2', '3', '# h1大标签', '1', '0', '2019-02-13 10:39:30');
INSERT INTO `reply` VALUES ('6', '3', '这是一级标题\r\n===\r\n这是二级标题\r\n---', '1', '0', '2019-02-13 10:42:00');
INSERT INTO `reply` VALUES ('4', '3', '## 小标签', '1', '0', '2019-02-13 10:40:40');
INSERT INTO `reply` VALUES ('5', '3', '### 更小的', '1', '0', '2019-02-13 10:40:55');
INSERT INTO `reply` VALUES ('7', '3', '> 这段文字将被高亮显示...\r\n都是范德萨', '1', '0', '2019-02-13 10:44:16');
INSERT INTO `reply` VALUES ('8', '3', '方法', '1', '0', '2019-02-13 10:44:42');
INSERT INTO `reply` VALUES ('9', '3', 'werewolf', '1', '0', '2019-02-13 10:44:48');
INSERT INTO `reply` VALUES ('10', '3', '![得到图片](https://upload-images.jianshu.io/upload_images/703764-605e3cc2ecb664f6.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)', '1', '0', '2019-02-13 10:47:31');
INSERT INTO `reply` VALUES ('11', '3', '是的发生的\r\n***\r\n是的范德萨', '1', '0', '2019-02-13 10:48:53');

-- ----------------------------
-- Table structure for reply_up_log
-- ----------------------------
DROP TABLE IF EXISTS `reply_up_log`;
CREATE TABLE `reply_up_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL,
  `in_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of reply_up_log
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', '超级管理员');
INSERT INTO `role` VALUES ('4', '版主');
INSERT INTO `role` VALUES ('5', '普通用户');

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
INSERT INTO `role_permissions` VALUES ('47', '4', '3');
INSERT INTO `role_permissions` VALUES ('48', '4', '4');
INSERT INTO `role_permissions` VALUES ('49', '4', '6');
INSERT INTO `role_permissions` VALUES ('50', '5', '2');
INSERT INTO `role_permissions` VALUES ('51', '5', '7');
INSERT INTO `role_permissions` VALUES ('52', '5', '8');
INSERT INTO `role_permissions` VALUES ('64', '3', '2');
INSERT INTO `role_permissions` VALUES ('65', '3', '3');
INSERT INTO `role_permissions` VALUES ('66', '3', '4');
INSERT INTO `role_permissions` VALUES ('67', '3', '6');
INSERT INTO `role_permissions` VALUES ('68', '3', '7');
INSERT INTO `role_permissions` VALUES ('69', '3', '8');
INSERT INTO `role_permissions` VALUES ('70', '3', '13');
INSERT INTO `role_permissions` VALUES ('71', '3', '14');
INSERT INTO `role_permissions` VALUES ('72', '3', '15');
INSERT INTO `role_permissions` VALUES ('73', '3', '16');
INSERT INTO `role_permissions` VALUES ('74', '3', '17');
INSERT INTO `role_permissions` VALUES ('75', '3', '18');
INSERT INTO `role_permissions` VALUES ('76', '3', '20');
INSERT INTO `role_permissions` VALUES ('77', '3', '21');
INSERT INTO `role_permissions` VALUES ('78', '3', '22');
INSERT INTO `role_permissions` VALUES ('79', '3', '23');
INSERT INTO `role_permissions` VALUES ('80', '3', '24');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', '分享');
INSERT INTO `section` VALUES ('3', '博客');
INSERT INTO `section` VALUES ('4', '招聘');
INSERT INTO `section` VALUES ('2', '问答');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `in_time` datetime NOT NULL,
  `user_id` int(255) NOT NULL,
  `section_id` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `reply_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_user_id` int(11) DEFAULT NULL,
  `last_reply_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '测试话题 ，hello world', '你好，世界', '2016-08-26 09:22:42', '1', '1', '15', '1', null, '2016-08-26 09:22:42');
INSERT INTO `topic` VALUES ('2', '我来了', '什么是markdown语法', '2019-02-13 10:27:09', '1', '2', '1', '0', null, '2019-02-13 10:27:09');
INSERT INTO `topic` VALUES ('3', '水电费第三方', '同一日同一人头\r\n\r\n![图片](https://upload-images.jianshu.io/upload_images/703764-605e3cc2ecb664f6.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n似懂非懂', '2019-02-13 10:29:24', '1', '2', '23', '9', null, '2019-02-13 10:29:24');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `signature` varchar(1000) DEFAULT NULL,
  `in_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '朋也', '$2a$10$71uucm/oAMwDIRf/p8KPL.SjVzIQbjm9G5dRBybOktU4fO9yKJbE2', 'fcd1cb8e-b71f-46c3-9974-7225997b40c7', '/static/upload/avatar/banner1_a.jpg', '', 'https://yiiu.co', '这家伙很懒，什么都没留下~', '2016-08-26 09:22:16');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('5', '1', '3');
