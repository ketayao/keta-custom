/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : keta_custom

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2013-04-25 23:13:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `security_module`
-- ----------------------------
DROP TABLE IF EXISTS `security_module`;
CREATE TABLE `security_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `priority` int(11) NOT NULL,
  `sn` varchar(32) NOT NULL,
  `url` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6510844BB3395F9` (`parent_id`),
  CONSTRAINT `FK6510844BB3395F9` FOREIGN KEY (`parent_id`) REFERENCES `security_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_module
-- ----------------------------
INSERT INTO `security_module` VALUES ('1', '所有模块的根节点，不能删除。', '根模块', '1', 'Root', '#', null);
INSERT INTO `security_module` VALUES ('2', '安全管理:包含权限管理、模块管理等。', '安全管理', '99', 'Security', '#', '1');
INSERT INTO `security_module` VALUES ('3', '', '用户管理', '99', 'User', '/management/security/user/list', '2');
INSERT INTO `security_module` VALUES ('4', '', '角色管理', '99', 'Role', '/management/security/role/list', '2');
INSERT INTO `security_module` VALUES ('5', '', '模块管理', '99', 'Module', '/management/security/module/tree', '2');
INSERT INTO `security_module` VALUES ('10', '一个开发使用的简单示例。', '开发实例', '99', 'Sample', '#', '1');
INSERT INTO `security_module` VALUES ('14', '', '简单任务实例', '99', 'Task', '/management/sample/task/list', '10');
INSERT INTO `security_module` VALUES ('18', '', '组织管理', '99', 'Organization', '/management/security/organization/tree', '2');
INSERT INTO `security_module` VALUES ('24', '', '缓存管理', '99', 'CacheManage', '/management/security/cacheManage/index', '2');
INSERT INTO `security_module` VALUES ('38', '测试下', '测试模块', '99', 'sdfs', '测试下', '1');
INSERT INTO `security_module` VALUES ('52', '', '自定义权限测试', '99', 'ggg', '/vv', '38');
INSERT INTO `security_module` VALUES ('53', '', '多级模块测试', '99', 'gg', '/gg', '38');
INSERT INTO `security_module` VALUES ('54', '', '模块测试2', '99', '多级模块测试2', '/hh', '53');
INSERT INTO `security_module` VALUES ('55', '', '模块测试3', '99', '多级模块测试3', '/hh', '54');
INSERT INTO `security_module` VALUES ('56', '', '模块测试4', '99', '多级模块测试4', '/hh', '55');
INSERT INTO `security_module` VALUES ('57', '', '模块测试5', '99', '多级模块测试5', '/hh', '56');
INSERT INTO `security_module` VALUES ('58', '', '新模块', '99', 'ff', '/dd', '38');

-- ----------------------------
-- Table structure for `security_organization`
-- ----------------------------
DROP TABLE IF EXISTS `security_organization`;
CREATE TABLE `security_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1DBDA7D2FCC01B00` (`parent_id`),
  CONSTRAINT `FK1DBDA7D2FCC01B00` FOREIGN KEY (`parent_id`) REFERENCES `security_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_organization
-- ----------------------------
INSERT INTO `security_organization` VALUES ('1', '不能删除。', '根组织', null);
INSERT INTO `security_organization` VALUES ('2', '', '泸州电业', '1');
INSERT INTO `security_organization` VALUES ('3', '', '龙马潭供电', '2');
INSERT INTO `security_organization` VALUES ('4', '', '江阳供电', '2');
INSERT INTO `security_organization` VALUES ('5', '', '泸县供电', '2');
INSERT INTO `security_organization` VALUES ('6', '', '纳溪供电', '2');
INSERT INTO `security_organization` VALUES ('7', '', '和益电力', '2');
INSERT INTO `security_organization` VALUES ('8', '', '玉宇电力', '2');
INSERT INTO `security_organization` VALUES ('9', '', '叙永供电', '2');
INSERT INTO `security_organization` VALUES ('10', '', '古蔺供电', '2');
INSERT INTO `security_organization` VALUES ('11', '测试组织权限', '测试组织权限', '3');

-- ----------------------------
-- Table structure for `security_organization_role`
-- ----------------------------
DROP TABLE IF EXISTS `security_organization_role`;
CREATE TABLE `security_organization_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK557CA4C3D069FDD7` (`organization_id`),
  KEY `FK557CA4C3C592DFF7` (`role_id`),
  CONSTRAINT `FK557CA4C3C592DFF7` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`),
  CONSTRAINT `FK557CA4C3D069FDD7` FOREIGN KEY (`organization_id`) REFERENCES `security_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_organization_role
-- ----------------------------
INSERT INTO `security_organization_role` VALUES ('1', '99', '11', '7');

-- ----------------------------
-- Table structure for `security_permission`
-- ----------------------------
DROP TABLE IF EXISTS `security_permission`;
CREATE TABLE `security_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `short_name` varchar(16) NOT NULL,
  `module_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA7A9C2E334A08F7` (`module_id`),
  CONSTRAINT `FKBA7A9C2E334A08F7` FOREIGN KEY (`module_id`) REFERENCES `security_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_permission
-- ----------------------------
INSERT INTO `security_permission` VALUES ('25', '', '增', 'save', '2');
INSERT INTO `security_permission` VALUES ('26', '', '删', 'delete', '2');
INSERT INTO `security_permission` VALUES ('27', '', '查', 'view', '2');
INSERT INTO `security_permission` VALUES ('28', '', '改', 'edit', '2');
INSERT INTO `security_permission` VALUES ('31', '', '查', 'view', '10');
INSERT INTO `security_permission` VALUES ('37', '', '增', 'save', '3');
INSERT INTO `security_permission` VALUES ('38', '', '删', 'delete', '3');
INSERT INTO `security_permission` VALUES ('39', '', '查', 'view', '3');
INSERT INTO `security_permission` VALUES ('40', '', '改', 'edit', '3');
INSERT INTO `security_permission` VALUES ('45', '', '增', 'save', '4');
INSERT INTO `security_permission` VALUES ('46', '', '删', 'delete', '4');
INSERT INTO `security_permission` VALUES ('47', '', '查', 'view', '4');
INSERT INTO `security_permission` VALUES ('48', '', '改', 'edit', '4');
INSERT INTO `security_permission` VALUES ('53', '', '增', 'save', '5');
INSERT INTO `security_permission` VALUES ('54', '', '删', 'delete', '5');
INSERT INTO `security_permission` VALUES ('55', '', '查', 'view', '5');
INSERT INTO `security_permission` VALUES ('56', '', '改', 'edit', '5');
INSERT INTO `security_permission` VALUES ('57', '', '增', 'save', '18');
INSERT INTO `security_permission` VALUES ('58', '', '删', 'delete', '18');
INSERT INTO `security_permission` VALUES ('59', '', '查', 'view', '18');
INSERT INTO `security_permission` VALUES ('60', '', '改', 'edit', '18');
INSERT INTO `security_permission` VALUES ('61', '', '查', 'view', '24');
INSERT INTO `security_permission` VALUES ('62', '', '改', 'edit', '24');
INSERT INTO `security_permission` VALUES ('76', '重置密码、更新状态', '重置', 'reset', '3');
INSERT INTO `security_permission` VALUES ('77', '分配、撤销角色', '授权', 'assign', '3');
INSERT INTO `security_permission` VALUES ('78', '分配、撤销角色', '授权', 'assign', '18');
INSERT INTO `security_permission` VALUES ('100', null, '增', 'save', '52');
INSERT INTO `security_permission` VALUES ('101', null, '删', 'delete', '52');
INSERT INTO `security_permission` VALUES ('102', null, '查', 'view', '52');
INSERT INTO `security_permission` VALUES ('103', null, '改', 'edit', '52');
INSERT INTO `security_permission` VALUES ('104', null, '增', 'save', '53');
INSERT INTO `security_permission` VALUES ('105', null, '删', 'delete', '53');
INSERT INTO `security_permission` VALUES ('106', null, '查', 'view', '53');
INSERT INTO `security_permission` VALUES ('107', null, '改', 'edit', '53');
INSERT INTO `security_permission` VALUES ('108', null, '增', 'save', '54');
INSERT INTO `security_permission` VALUES ('109', null, '删', 'delete', '54');
INSERT INTO `security_permission` VALUES ('110', null, '查', 'view', '54');
INSERT INTO `security_permission` VALUES ('111', null, '改', 'edit', '54');
INSERT INTO `security_permission` VALUES ('112', null, '增', 'save', '55');
INSERT INTO `security_permission` VALUES ('113', null, '删', 'delete', '55');
INSERT INTO `security_permission` VALUES ('114', null, '查', 'view', '55');
INSERT INTO `security_permission` VALUES ('115', null, '改', 'edit', '55');
INSERT INTO `security_permission` VALUES ('116', null, '增', 'save', '56');
INSERT INTO `security_permission` VALUES ('117', null, '删', 'delete', '56');
INSERT INTO `security_permission` VALUES ('118', null, '查', 'view', '56');
INSERT INTO `security_permission` VALUES ('119', null, '改', 'edit', '56');
INSERT INTO `security_permission` VALUES ('120', null, '增', 'save', '57');
INSERT INTO `security_permission` VALUES ('121', null, '删', 'delete', '57');
INSERT INTO `security_permission` VALUES ('122', null, '查', 'view', '57');
INSERT INTO `security_permission` VALUES ('123', null, '改', 'edit', '57');
INSERT INTO `security_permission` VALUES ('124', '', '晒', 'sai', '52');
INSERT INTO `security_permission` VALUES ('125', '', '清除', 'clear', '52');
INSERT INTO `security_permission` VALUES ('126', '', '增', 'save', '14');
INSERT INTO `security_permission` VALUES ('127', '', '删', 'delete', '14');
INSERT INTO `security_permission` VALUES ('128', '', '查', 'view', '14');
INSERT INTO `security_permission` VALUES ('129', '', '改', 'edit', '14');
INSERT INTO `security_permission` VALUES ('130', '', '看', 'look', '14');
INSERT INTO `security_permission` VALUES ('131', null, '增', 'save', '58');
INSERT INTO `security_permission` VALUES ('132', null, '删', 'delete', '58');
INSERT INTO `security_permission` VALUES ('133', null, '查', 'view', '58');
INSERT INTO `security_permission` VALUES ('134', null, '改', 'edit', '58');

-- ----------------------------
-- Table structure for `security_role`
-- ----------------------------
DROP TABLE IF EXISTS `security_role`;
CREATE TABLE `security_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_role
-- ----------------------------
INSERT INTO `security_role` VALUES ('3', null, '管理员');
INSERT INTO `security_role` VALUES ('4', null, '财务人员');
INSERT INTO `security_role` VALUES ('5', null, '营销人员');
INSERT INTO `security_role` VALUES ('7', null, '任务实例角色');
INSERT INTO `security_role` VALUES ('8', '仅仅是测试角色2', 'test');

-- ----------------------------
-- Table structure for `security_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `security_role_permission`;
CREATE TABLE `security_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK679E223926E70397` (`permission_id`),
  KEY `FK679E2239C592DFF7` (`role_id`),
  CONSTRAINT `FK679E2239C592DFF7` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`),
  CONSTRAINT `FK679E223926E70397` FOREIGN KEY (`permission_id`) REFERENCES `security_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_role_permission
-- ----------------------------
INSERT INTO `security_role_permission` VALUES ('30', '27', '3');
INSERT INTO `security_role_permission` VALUES ('31', '37', '3');
INSERT INTO `security_role_permission` VALUES ('32', '38', '3');
INSERT INTO `security_role_permission` VALUES ('33', '39', '3');
INSERT INTO `security_role_permission` VALUES ('34', '40', '3');
INSERT INTO `security_role_permission` VALUES ('35', '47', '3');
INSERT INTO `security_role_permission` VALUES ('36', '53', '3');
INSERT INTO `security_role_permission` VALUES ('37', '54', '3');
INSERT INTO `security_role_permission` VALUES ('38', '55', '3');
INSERT INTO `security_role_permission` VALUES ('39', '56', '3');
INSERT INTO `security_role_permission` VALUES ('40', '57', '3');
INSERT INTO `security_role_permission` VALUES ('41', '58', '3');
INSERT INTO `security_role_permission` VALUES ('42', '59', '3');
INSERT INTO `security_role_permission` VALUES ('43', '60', '3');
INSERT INTO `security_role_permission` VALUES ('44', '61', '3');
INSERT INTO `security_role_permission` VALUES ('45', '62', '3');
INSERT INTO `security_role_permission` VALUES ('71', '31', '7');
INSERT INTO `security_role_permission` VALUES ('72', '126', '7');
INSERT INTO `security_role_permission` VALUES ('73', '127', '7');
INSERT INTO `security_role_permission` VALUES ('74', '128', '7');
INSERT INTO `security_role_permission` VALUES ('75', '129', '7');
INSERT INTO `security_role_permission` VALUES ('76', '130', '7');
INSERT INTO `security_role_permission` VALUES ('77', '131', '8');
INSERT INTO `security_role_permission` VALUES ('78', '132', '8');
INSERT INTO `security_role_permission` VALUES ('79', '133', '8');
INSERT INTO `security_role_permission` VALUES ('80', '134', '8');

-- ----------------------------
-- Table structure for `security_user`
-- ----------------------------
DROP TABLE IF EXISTS `security_user`;
CREATE TABLE `security_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `realname` varchar(32) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `status` varchar(16) NOT NULL,
  `username` varchar(32) NOT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD607B56A453A1286` (`org_id`),
  CONSTRAINT `FKD607B56A453A1286` FOREIGN KEY (`org_id`) REFERENCES `security_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_user
-- ----------------------------
INSERT INTO `security_user` VALUES ('1', '2012-08-03 14:58:38', 'yaoqiang@yahoo.cn', '86ddd168b0c218ea7c7e77c7766a59bb81262419', '13518109997', '姚强', '6d37bd5678f411f5', 'enabled', 'admin', '2');
INSERT INTO `security_user` VALUES ('3', '2012-08-07 00:00:00', 'task@task.com', '802874fa2303c5ef3d5ce56fbeba6a16f2ff7aef', '84893620', '简单任务实例用户', 'acda641cfd0f313d', 'enabled', 'task', '11');
INSERT INTO `security_user` VALUES ('4', '2012-08-07 16:12:17', 'sdf@ss.com', '0448b9fa8b0b4ad255e71ad3305e1677114ccf08', '1231231', '任务实例用户2', '6c3eb539e4f04701', 'enabled', 'task2', '11');
INSERT INTO `security_user` VALUES ('5', '2012-08-13 11:17:31', 'jjyy@sina.com', '638c3e2f7984d9bc6f539df5dfc6a1e7b5088743', '13658025333', '王五', 'fabffbdfe3f64c0b', 'enabled', 'ww', '4');
INSERT INTO `security_user` VALUES ('6', '2012-08-28 10:14:20', '', 'c2d8884974f8e4d586815c8d05b3e94bdcd40eee', '646456565', '龟六', '683552b3232cadaa', 'enabled', 'gl', '5');
INSERT INTO `security_user` VALUES ('8', '2012-09-11 17:07:46', '', '0d44d808a023549ff328a358c2ff4e11b82a38c9', '', '管理员', 'e094b48ae2aec9ed', 'enabled', 'gly', '2');
INSERT INTO `security_user` VALUES ('9', '2012-09-11 17:08:37', '', '3caa91db8be780ff39f9878f6ddef05e765b6ff0', '', '财务', '141f8ee62d55a0a3', 'disabled', 'cw', '2');
INSERT INTO `security_user` VALUES ('10', '2012-09-11 17:08:47', '', 'a8de31d4ebdb8343ee3b2cfbbc961dd5ccd0683b', '', '营销', 'b573ee6422fd07ee', 'enabled', 'yx', '10');
INSERT INTO `security_user` VALUES ('11', '2013-04-17 21:39:30', 'kkkk@sina.com', '449a9feae1d5ba02571e4c36ee026e59ec9ea759', '1198897', '陈诚', '0e62c4d6cf2d35c6', 'enabled', 'cc', '6');
INSERT INTO `security_user` VALUES ('12', '2013-04-17 21:41:57', '', '8881cebe212c3811ac261b1a4d3222665aa9e523', '', '雅安加油', '26ba58c8e43ae927', 'enabled', 'yaan', '8');
INSERT INTO `security_user` VALUES ('13', '2013-04-17 21:43:01', '', 'a44416b929e52db57c04bc2fced80485a3e12735', '', '庐山', '3874746de55953bf', 'enabled', 'lushan', '10');
INSERT INTO `security_user` VALUES ('14', '2013-04-17 21:43:55', '', 'a1637c74f77ae7e5aa358958a89b30d9c01ee6a0', '', '陈雅', '9a76bb09259a3d78', 'enabled', 'cya', '9');
INSERT INTO `security_user` VALUES ('15', '2013-04-20 13:27:54', '', 'ef3ba970aeabbcc91818c10e906900db9f5a7b10', '', '一般管理员', '4fd3ebe72f684f6d', 'enabled', 'manage', '2');
INSERT INTO `security_user` VALUES ('16', '2013-04-20 19:27:45', '', '5aade7bec0fe81a01ecd937d9d051174c19bbfdc', '', '团结', 'f46ec0c789090e69', 'enabled', 'dizhen', '6');
INSERT INTO `security_user` VALUES ('20', '2013-04-21 13:30:39', '', 'bfc70598705b5fb84f3c6bdbc09f7848a67a7090', '123123123', '合伙人', 'c6e29c4517c27503', 'enabled', 'gg', '4');
INSERT INTO `security_user` VALUES ('21', '2013-04-21 13:31:02', '', '21567faa0a42e8e6715a8bc0b6390e5bd4b42bc1', '', '底楼', '7fbb84f07260b879', 'enabled', 'bb', '4');
INSERT INTO `security_user` VALUES ('22', '2013-04-21 13:31:53', '', '89137e55863bbb1785a095c02972d2a958aff8ca', '1100043', '楼上', '07a3eff8b716ee32', 'enabled', 'zxczx', '4');
INSERT INTO `security_user` VALUES ('23', '2013-04-25 17:18:26', '1212@sj.com', 'a25f666f0ff589ef8cdb427ab6408cb1f81e5a61', '123123123', '121211', 'bca140d89e2b640a', 'disabled', 'ceshi', '11');

-- ----------------------------
-- Table structure for `security_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `security_user_role`;
CREATE TABLE `security_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6DD3562BC592DFF7` (`role_id`),
  KEY `FK6DD3562B6ABDA3D7` (`user_id`),
  CONSTRAINT `FK6DD3562B6ABDA3D7` FOREIGN KEY (`user_id`) REFERENCES `security_user` (`id`),
  CONSTRAINT `FK6DD3562BC592DFF7` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_user_role
-- ----------------------------
INSERT INTO `security_user_role` VALUES ('4', '99', '4', '4');
INSERT INTO `security_user_role` VALUES ('6', '99', '5', '5');
INSERT INTO `security_user_role` VALUES ('8', '99', '3', '8');
INSERT INTO `security_user_role` VALUES ('9', '99', '4', '9');
INSERT INTO `security_user_role` VALUES ('11', '99', '5', '8');
INSERT INTO `security_user_role` VALUES ('12', '99', '4', '6');
INSERT INTO `security_user_role` VALUES ('13', '99', '3', '15');
INSERT INTO `security_user_role` VALUES ('20', '99', '5', '16');
INSERT INTO `security_user_role` VALUES ('22', '99', '5', '14');
INSERT INTO `security_user_role` VALUES ('23', '99', '7', '3');

-- ----------------------------
-- Table structure for `ss_task`
-- ----------------------------
DROP TABLE IF EXISTS `ss_task`;
CREATE TABLE `ss_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_task
-- ----------------------------
INSERT INTO `ss_task` VALUES ('1', '', '开发任务');
INSERT INTO `ss_task` VALUES ('2', '', '测试任务2');
INSERT INTO `ss_task` VALUES ('3', '', '销售任务');
INSERT INTO `ss_task` VALUES ('4', '', '售后任务');
INSERT INTO `ss_task` VALUES ('5', '', '集成任务');
INSERT INTO `ss_task` VALUES ('6', '', '更新任务');
INSERT INTO `ss_task` VALUES ('7', '', '后续任务');
