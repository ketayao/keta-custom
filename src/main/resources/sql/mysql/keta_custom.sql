/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : keta_custom

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2013-06-06 16:26:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `security_log_entity`
-- ----------------------------
DROP TABLE IF EXISTS `security_log_entity`;
CREATE TABLE `security_log_entity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `log_level` varchar(16) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_log_entity
-- ----------------------------
INSERT INTO `security_log_entity` VALUES ('4', '2013-05-25 17:41:41', '127.0.0.1', 'TRACE', 'admin:登录成功。', null);
INSERT INTO `security_log_entity` VALUES ('5', '2013-05-25 21:48:05', '127.0.0.1', 'TRACE', 'admin:登录成功。', null);


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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_module
-- ----------------------------
INSERT INTO `security_module` VALUES ('1', '所有模块的根节点，不能删除。', '根模块', '1', 'Root', '#', null);
INSERT INTO `security_module` VALUES ('2', '安全管理:包含权限管理、模块管理等。', '安全管理', '99', 'Security', '#', '1');
INSERT INTO `security_module` VALUES ('3', '', '用户管理', '99', 'User', '/management/security/user/list', '2');
INSERT INTO `security_module` VALUES ('4', '', '角色管理', '99', 'Role', '/management/security/role/list', '2');
INSERT INTO `security_module` VALUES ('5', '', '模块管理', '99', 'Module', '/management/security/module/tree_list', '2');
INSERT INTO `security_module` VALUES ('10', '一个开发使用的简单示例。', '开发实例', '99', 'Sample', '#', '1');
INSERT INTO `security_module` VALUES ('14', '', '简单任务实例', '99', 'Task', '/management/sample/task/list', '10');
INSERT INTO `security_module` VALUES ('18', '', '组织管理', '99', 'Organization', '/management/security/organization/tree_list', '2');
INSERT INTO `security_module` VALUES ('24', '', '缓存管理', '99', 'CacheManage', '/management/security/cacheManage/index', '2');
INSERT INTO `security_module` VALUES ('38', '测试下', '测试模块', '99', 'sdfs', '测试下', '1');
INSERT INTO `security_module` VALUES ('52', '', '自定义权限测试', '99', 'ggg', '/vv', '38');
INSERT INTO `security_module` VALUES ('53', '', '多级模块测试', '99', 'gg', '/gg', '52');
INSERT INTO `security_module` VALUES ('54', '', '模块测试2', '99', '多级模块测试2', '/hh', '53');
INSERT INTO `security_module` VALUES ('58', '', '新模块26', '99', 'ff', '/dd', '53');
INSERT INTO `security_module` VALUES ('59', '', '日志管理', '99', 'logEntity', '/management/security/logEntity/list', '2');
INSERT INTO `security_module` VALUES ('60', '', '123123', '99', 'ggg222', '/ds', '1');
INSERT INTO `security_module` VALUES ('61', '', '组件管理', '99', 'Component', '#', '1');
INSERT INTO `security_module` VALUES ('63', '', '系统图标', '99', 'Icon', '/management/component/icon/list', '61');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

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
INSERT INTO `security_organization` VALUES ('12', '', 'vv3', '1');
INSERT INTO `security_organization` VALUES ('13', '', '121', '1');
INSERT INTO `security_organization` VALUES ('15', '', '121215', '10');
INSERT INTO `security_organization` VALUES ('16', 'asd', 'gg2', '15');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_organization_role
-- ----------------------------
INSERT INTO `security_organization_role` VALUES ('1', '99', '11', '7');
INSERT INTO `security_organization_role` VALUES ('2', '99', '16', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

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
INSERT INTO `security_permission` VALUES ('135', null, '增', 'save', '59');
INSERT INTO `security_permission` VALUES ('136', null, '删', 'delete', '59');
INSERT INTO `security_permission` VALUES ('137', null, '查', 'view', '59');
INSERT INTO `security_permission` VALUES ('138', null, '改', 'edit', '59');
INSERT INTO `security_permission` VALUES ('139', null, '增', 'save', '60');
INSERT INTO `security_permission` VALUES ('140', null, '删', 'delete', '60');
INSERT INTO `security_permission` VALUES ('141', null, '查', 'view', '60');
INSERT INTO `security_permission` VALUES ('142', null, '改', 'edit', '60');
INSERT INTO `security_permission` VALUES ('159', '', '增', 'save', '38');
INSERT INTO `security_permission` VALUES ('160', '', '删', 'delete', '38');
INSERT INTO `security_permission` VALUES ('161', '', '查', 'view', '38');
INSERT INTO `security_permission` VALUES ('162', '', '改', 'edit', '38');

-- ----------------------------
-- Table structure for `security_role`
-- ----------------------------
DROP TABLE IF EXISTS `security_role`;
CREATE TABLE `security_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_role
-- ----------------------------
INSERT INTO `security_role` VALUES ('3', null, '管理员');
INSERT INTO `security_role` VALUES ('4', null, '财务人员');
INSERT INTO `security_role` VALUES ('5', null, '营销人员');
INSERT INTO `security_role` VALUES ('7', null, '任务实例角色');
INSERT INTO `security_role` VALUES ('8', '仅仅是测试角色2', 'test');
INSERT INTO `security_role` VALUES ('9', 'hh', 'hh');

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
  CONSTRAINT `FK679E223926E70397` FOREIGN KEY (`permission_id`) REFERENCES `security_permission` (`id`),
  CONSTRAINT `FK679E2239C592DFF7` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`)
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
INSERT INTO `security_role_permission` VALUES ('77', '25', '9');
INSERT INTO `security_role_permission` VALUES ('78', '26', '9');
INSERT INTO `security_role_permission` VALUES ('79', '27', '9');
INSERT INTO `security_role_permission` VALUES ('80', '28', '9');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_user
-- ----------------------------
INSERT INTO `security_user` VALUES ('1', '2012-08-03 14:58:38', 'ketayao@gmail.com', '7a8f27edd04296d1a2f484cca71c6834a87356b6', '13518109993', '姚强', '9754469b0353a6a7', 'enabled', 'admin', '2');
INSERT INTO `security_user` VALUES ('3', '2012-08-07 00:00:00', 'task@task.com', '802874fa2303c5ef3d5ce56fbeba6a16f2ff7aef', '84893620', '简单任务实例用户', 'acda641cfd0f313d', 'enabled', 'task', '11');
INSERT INTO `security_user` VALUES ('4', '2012-08-07 16:12:17', 'sdf@ss.com', 'e36219917bddd2405d6afbee52a5bf7456d8ca3c', '1231231', '任务实例用户2', '91843ac5f24430dc', 'disabled', 'task2', '11');
INSERT INTO `security_user` VALUES ('5', '2012-08-13 11:17:31', 'jjyy@sina.com', '638c3e2f7984d9bc6f539df5dfc6a1e7b5088743', '13658025333', '王五', 'fabffbdfe3f64c0b', 'enabled', 'ww', '4');
INSERT INTO `security_user` VALUES ('6', '2012-08-28 10:14:20', '', 'c2d8884974f8e4d586815c8d05b3e94bdcd40eee', '4411455', '龟六', '683552b3232cadaa', 'enabled', 'gl', '5');
INSERT INTO `security_user` VALUES ('8', '2012-09-11 17:07:46', '', '0d44d808a023549ff328a358c2ff4e11b82a38c9', '', '管理员', 'e094b48ae2aec9ed', 'enabled', 'gly', '2');
INSERT INTO `security_user` VALUES ('9', '2012-09-11 17:08:37', '', 'cd96c812a562b24f9aa1e16c29a14496a566c1f1', '', '财务', 'ece0bed822f7bd56', 'disabled', 'cw', '2');
INSERT INTO `security_user` VALUES ('11', '2013-04-17 21:39:30', 'kkkk@sina.com', '449a9feae1d5ba02571e4c36ee026e59ec9ea759', '1198897', '陈诚', '0e62c4d6cf2d35c6', 'enabled', 'cc', '6');
INSERT INTO `security_user` VALUES ('12', '2013-04-17 21:41:57', '', '8881cebe212c3811ac261b1a4d3222665aa9e523', '123121123123', '雅安加油', '26ba58c8e43ae927', 'enabled', 'yaan', '8');
INSERT INTO `security_user` VALUES ('13', '2013-04-17 21:43:01', '', 'a44416b929e52db57c04bc2fced80485a3e12735', '', '庐山', '3874746de55953bf', 'enabled', 'lushan', '10');
INSERT INTO `security_user` VALUES ('14', '2013-04-17 21:43:55', '', '12afbc40964938e5a2e49ceab0eba9ee7e55d5b6', '114349203', '陈雅', '29aad8354b24a552', 'enabled', 'cya', '5');
INSERT INTO `security_user` VALUES ('15', '2013-04-20 13:27:54', '', 'ef3ba970aeabbcc91818c10e906900db9f5a7b10', '', '一般管理员', '4fd3ebe72f684f6d', 'enabled', 'manage', '2');
INSERT INTO `security_user` VALUES ('16', '2013-06-04 17:22:36', '', '42581c277a26527051a0380ce58a7dc200be16b2', '', '12312', '4e166cb90ef19ca7', 'disabled', 'opnmzxcvb', '8');
INSERT INTO `security_user` VALUES ('17', '2013-06-05 09:00:42', 'sdfsd@sina.com', '385a965e1a0035f1def3cdd564bf3c2115a3150e', '12312312', '1212123', '4b38243e2fe01055', 'disabled', 'gg', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
INSERT INTO `security_user_role` VALUES ('22', '99', '5', '14');
INSERT INTO `security_user_role` VALUES ('23', '99', '7', '3');
INSERT INTO `security_user_role` VALUES ('24', '99', '3', '11');
INSERT INTO `security_user_role` VALUES ('27', '99', '3', '6');

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
