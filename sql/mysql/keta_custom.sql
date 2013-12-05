/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50515
Source Host           : 127.0.0.1:3306
Source Database       : keta_custom

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2013-12-05 16:03:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for component_resource
-- ----------------------------
DROP TABLE IF EXISTS `component_resource`;
CREATE TABLE `component_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` longblob,
  `name` varchar(128) DEFAULT NULL,
  `size` varchar(32) DEFAULT NULL,
  `store_type` varchar(16) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of component_resource
-- ----------------------------

-- ----------------------------
-- Table structure for security_data_control
-- ----------------------------
DROP TABLE IF EXISTS `security_data_control`;
CREATE TABLE `security_data_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `control` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_data_control
-- ----------------------------
INSERT INTO `security_data_control` VALUES ('1', '{\"EQ_user.id\":\"#user.id\"}', null, 'user.id关联的资源');

-- ----------------------------
-- Table structure for security_log_entity
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_log_entity
-- ----------------------------
INSERT INTO `security_log_entity` VALUES ('1', '2013-12-05 15:29:09', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('2', '2013-12-05 15:51:05', '127.0.0.1', 'TRACE', '修改了管理员角色的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('3', '2013-12-05 15:52:42', '127.0.0.1', 'TRACE', '添加了manage用户。', 'admin');
INSERT INTO `security_log_entity` VALUES ('4', '2013-12-05 15:52:48', '127.0.0.1', 'TRACE', 'admin用户重置密码成功，默认为123456！', 'admin');
INSERT INTO `security_log_entity` VALUES ('5', '2013-12-05 15:53:00', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('6', '2013-12-05 15:53:11', '127.0.0.1', 'TRACE', 'manage登录了系统。', 'manage');
INSERT INTO `security_log_entity` VALUES ('7', '2013-12-05 15:53:39', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('8', '2013-12-05 15:53:56', '127.0.0.1', 'TRACE', '向manage用户分配了管理员的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('9', '2013-12-05 16:00:02', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('10', '2013-12-05 16:02:16', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');

-- ----------------------------
-- Table structure for security_module
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
  `class_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6510844B953FE581` (`parent_id`),
  CONSTRAINT `FK6510844B953FE581` FOREIGN KEY (`parent_id`) REFERENCES `security_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_module
-- ----------------------------
INSERT INTO `security_module` VALUES ('1', '所有模块的根节点，不能删除。', '根模块', '1', 'Root', '#', null, null);
INSERT INTO `security_module` VALUES ('2', '安全管理:包含权限管理、模块管理等。', '安全管理', '99', 'Security', '#', '1', null);
INSERT INTO `security_module` VALUES ('3', null, '用户管理', '99', 'User', '/management/security/user/list', '2', null);
INSERT INTO `security_module` VALUES ('4', null, '角色管理', '99', 'Role', '/management/security/role/list', '2', null);
INSERT INTO `security_module` VALUES ('5', null, '数据权限', '99', 'DataControl', '/management/security/dataControl/list', '2', null);
INSERT INTO `security_module` VALUES ('6', null, '模块管理', '99', 'Module', '/management/security/module/tree_list', '2', null);
INSERT INTO `security_module` VALUES ('7', null, '组织管理', '99', 'Organization', '/management/security/organization/tree_list', '2', null);
INSERT INTO `security_module` VALUES ('8', null, '缓存管理', '99', 'CacheManage', '/management/security/cacheManage/index', '2', null);
INSERT INTO `security_module` VALUES ('9', null, '日志管理', '99', 'logEntity', '/management/security/logEntity/list', '2', null);
INSERT INTO `security_module` VALUES ('10', null, '组件管理', '99', 'Component', '#', '1', null);
INSERT INTO `security_module` VALUES ('11', '上传系统资源。', '资源管理', '99', 'Resource', '/management/component/resource/list', '10', null);
INSERT INTO `security_module` VALUES ('12', null, '打开外部链接', '99', 'Baidu', 'http://www.baidu.com', '10', null);
INSERT INTO `security_module` VALUES ('13', null, '系统图标', '99', 'Icon', '/management/component/icon/list', '10', null);
INSERT INTO `security_module` VALUES ('14', '一个开发使用的简单示例。', '开发实例', '99', 'Sample', '#', '1', null);
INSERT INTO `security_module` VALUES ('15', null, '简单任务实例', '99', 'Task', '/management/demo/task/list', '14', null);

-- ----------------------------
-- Table structure for security_organization
-- ----------------------------
DROP TABLE IF EXISTS `security_organization`;
CREATE TABLE `security_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1DBDA7D2F464A488` (`parent_id`),
  CONSTRAINT `FK1DBDA7D2F464A488` FOREIGN KEY (`parent_id`) REFERENCES `security_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_organization
-- ----------------------------
INSERT INTO `security_organization` VALUES ('1', '不能删除。', '根组织', null);
INSERT INTO `security_organization` VALUES ('2', null, '泸州电业', '1');
INSERT INTO `security_organization` VALUES ('3', null, '龙马潭供电', '2');
INSERT INTO `security_organization` VALUES ('4', null, '江阳供电', '2');
INSERT INTO `security_organization` VALUES ('5', null, '泸县供电', '2');
INSERT INTO `security_organization` VALUES ('6', null, '纳溪供电', '2');
INSERT INTO `security_organization` VALUES ('7', null, '和益电力', '2');
INSERT INTO `security_organization` VALUES ('8', null, '玉宇电力', '2');
INSERT INTO `security_organization` VALUES ('9', null, '叙永供电', '2');
INSERT INTO `security_organization` VALUES ('10', null, '古蔺供电', '2');

-- ----------------------------
-- Table structure for security_organization_role
-- ----------------------------
DROP TABLE IF EXISTS `security_organization_role`;
CREATE TABLE `security_organization_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK557CA4C3C80E875F` (`organization_id`),
  KEY `FK557CA4C33FFD717F` (`role_id`),
  CONSTRAINT `FK557CA4C33FFD717F` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`),
  CONSTRAINT `FK557CA4C3C80E875F` FOREIGN KEY (`organization_id`) REFERENCES `security_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_organization_role
-- ----------------------------

-- ----------------------------
-- Table structure for security_permission
-- ----------------------------
DROP TABLE IF EXISTS `security_permission`;
CREATE TABLE `security_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `short_name` varchar(16) NOT NULL,
  `module_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA7A9C2EBD56587F` (`module_id`),
  CONSTRAINT `FKBA7A9C2EBD56587F` FOREIGN KEY (`module_id`) REFERENCES `security_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_permission
-- ----------------------------
INSERT INTO `security_permission` VALUES ('1', null, '看', 'show', '2');
INSERT INTO `security_permission` VALUES ('2', null, '看', 'show', '3');
INSERT INTO `security_permission` VALUES ('3', null, '增', 'save', '3');
INSERT INTO `security_permission` VALUES ('4', null, '删', 'delete', '3');
INSERT INTO `security_permission` VALUES ('5', null, '查', 'view', '3');
INSERT INTO `security_permission` VALUES ('6', null, '改', 'edit', '3');
INSERT INTO `security_permission` VALUES ('7', '重置密码、更新状态', '重置', 'reset', '3');
INSERT INTO `security_permission` VALUES ('8', '分配、撤销角色', '授权', 'assign', '3');
INSERT INTO `security_permission` VALUES ('9', null, '看', 'show', '4');
INSERT INTO `security_permission` VALUES ('10', null, '增', 'save', '4');
INSERT INTO `security_permission` VALUES ('11', null, '删', 'delete', '4');
INSERT INTO `security_permission` VALUES ('12', null, '查', 'view', '4');
INSERT INTO `security_permission` VALUES ('13', null, '改', 'edit', '4');
INSERT INTO `security_permission` VALUES ('14', null, '授权', 'assign', '4');
INSERT INTO `security_permission` VALUES ('15', null, '看', 'show', '5');
INSERT INTO `security_permission` VALUES ('16', null, '增', 'save', '5');
INSERT INTO `security_permission` VALUES ('17', null, '删', 'delete', '5');
INSERT INTO `security_permission` VALUES ('18', null, '查', 'view', '5');
INSERT INTO `security_permission` VALUES ('19', null, '改', 'edit', '5');
INSERT INTO `security_permission` VALUES ('20', null, '看', 'show', '6');
INSERT INTO `security_permission` VALUES ('21', null, '增', 'save', '6');
INSERT INTO `security_permission` VALUES ('22', null, '删', 'delete', '6');
INSERT INTO `security_permission` VALUES ('23', null, '查', 'view', '6');
INSERT INTO `security_permission` VALUES ('24', null, '改', 'edit', '6');
INSERT INTO `security_permission` VALUES ('25', null, '看', 'show', '7');
INSERT INTO `security_permission` VALUES ('26', null, '增', 'save', '7');
INSERT INTO `security_permission` VALUES ('27', null, '删', 'delete', '7');
INSERT INTO `security_permission` VALUES ('28', null, '查', 'view', '7');
INSERT INTO `security_permission` VALUES ('29', null, '改', 'edit', '7');
INSERT INTO `security_permission` VALUES ('30', null, '授权', 'assign', '7');
INSERT INTO `security_permission` VALUES ('31', null, '看', 'show', '8');
INSERT INTO `security_permission` VALUES ('32', null, '删', 'delete', '8');
INSERT INTO `security_permission` VALUES ('33', null, '看', 'show', '9');
INSERT INTO `security_permission` VALUES ('34', null, '删', 'delete', '9');
INSERT INTO `security_permission` VALUES ('35', null, '查', 'view', '9');
INSERT INTO `security_permission` VALUES ('36', null, '看', 'show', '10');
INSERT INTO `security_permission` VALUES ('37', null, '看', 'show', '11');
INSERT INTO `security_permission` VALUES ('38', null, '增', 'save', '11');
INSERT INTO `security_permission` VALUES ('39', null, '删', 'delete', '11');
INSERT INTO `security_permission` VALUES ('40', null, '查', 'view', '11');
INSERT INTO `security_permission` VALUES ('41', null, '改', 'edit', '11');
INSERT INTO `security_permission` VALUES ('42', null, '看', 'show', '12');
INSERT INTO `security_permission` VALUES ('43', null, '看', 'show', '13');
INSERT INTO `security_permission` VALUES ('44', null, '看', 'show', '14');
INSERT INTO `security_permission` VALUES ('45', null, '看', 'show', '15');
INSERT INTO `security_permission` VALUES ('46', null, '增', 'save', '15');
INSERT INTO `security_permission` VALUES ('47', null, '删', 'delete', '15');
INSERT INTO `security_permission` VALUES ('48', null, '查', 'view', '15');
INSERT INTO `security_permission` VALUES ('49', null, '改', 'edit', '15');

-- ----------------------------
-- Table structure for security_role
-- ----------------------------
DROP TABLE IF EXISTS `security_role`;
CREATE TABLE `security_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_role
-- ----------------------------
INSERT INTO `security_role` VALUES ('1', null, '管理员');
INSERT INTO `security_role` VALUES ('2', null, '财务人员');
INSERT INTO `security_role` VALUES ('3', null, '营销人员');

-- ----------------------------
-- Table structure for security_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `security_role_permission`;
CREATE TABLE `security_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK679E22392BB04F1F` (`permission_id`),
  KEY `FK679E22393FFD717F` (`role_id`),
  CONSTRAINT `FK679E22393FFD717F` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`),
  CONSTRAINT `FK679E22392BB04F1F` FOREIGN KEY (`permission_id`) REFERENCES `security_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_role_permission
-- ----------------------------
INSERT INTO `security_role_permission` VALUES ('1', '1', '1');
INSERT INTO `security_role_permission` VALUES ('2', '2', '1');
INSERT INTO `security_role_permission` VALUES ('3', '3', '1');
INSERT INTO `security_role_permission` VALUES ('4', '4', '1');
INSERT INTO `security_role_permission` VALUES ('5', '5', '1');
INSERT INTO `security_role_permission` VALUES ('6', '6', '1');
INSERT INTO `security_role_permission` VALUES ('7', '7', '1');
INSERT INTO `security_role_permission` VALUES ('8', '8', '1');
INSERT INTO `security_role_permission` VALUES ('9', '9', '1');
INSERT INTO `security_role_permission` VALUES ('10', '10', '1');
INSERT INTO `security_role_permission` VALUES ('11', '11', '1');
INSERT INTO `security_role_permission` VALUES ('12', '12', '1');
INSERT INTO `security_role_permission` VALUES ('13', '13', '1');
INSERT INTO `security_role_permission` VALUES ('14', '14', '1');
INSERT INTO `security_role_permission` VALUES ('15', '15', '1');
INSERT INTO `security_role_permission` VALUES ('16', '16', '1');
INSERT INTO `security_role_permission` VALUES ('17', '17', '1');
INSERT INTO `security_role_permission` VALUES ('18', '18', '1');
INSERT INTO `security_role_permission` VALUES ('19', '19', '1');
INSERT INTO `security_role_permission` VALUES ('20', '20', '1');
INSERT INTO `security_role_permission` VALUES ('21', '21', '1');
INSERT INTO `security_role_permission` VALUES ('22', '22', '1');
INSERT INTO `security_role_permission` VALUES ('23', '23', '1');
INSERT INTO `security_role_permission` VALUES ('24', '24', '1');
INSERT INTO `security_role_permission` VALUES ('25', '25', '1');
INSERT INTO `security_role_permission` VALUES ('26', '26', '1');
INSERT INTO `security_role_permission` VALUES ('27', '27', '1');
INSERT INTO `security_role_permission` VALUES ('28', '28', '1');
INSERT INTO `security_role_permission` VALUES ('29', '29', '1');
INSERT INTO `security_role_permission` VALUES ('30', '30', '1');
INSERT INTO `security_role_permission` VALUES ('31', '31', '1');
INSERT INTO `security_role_permission` VALUES ('32', '32', '1');
INSERT INTO `security_role_permission` VALUES ('33', '33', '1');
INSERT INTO `security_role_permission` VALUES ('34', '34', '1');
INSERT INTO `security_role_permission` VALUES ('35', '35', '1');
INSERT INTO `security_role_permission` VALUES ('36', '36', '1');
INSERT INTO `security_role_permission` VALUES ('37', '37', '1');
INSERT INTO `security_role_permission` VALUES ('38', '38', '1');
INSERT INTO `security_role_permission` VALUES ('39', '39', '1');
INSERT INTO `security_role_permission` VALUES ('40', '40', '1');
INSERT INTO `security_role_permission` VALUES ('41', '41', '1');
INSERT INTO `security_role_permission` VALUES ('42', '42', '1');
INSERT INTO `security_role_permission` VALUES ('43', '43', '1');
INSERT INTO `security_role_permission` VALUES ('44', '44', '1');
INSERT INTO `security_role_permission` VALUES ('45', '45', '1');
INSERT INTO `security_role_permission` VALUES ('46', '46', '1');
INSERT INTO `security_role_permission` VALUES ('47', '47', '1');
INSERT INTO `security_role_permission` VALUES ('48', '48', '1');
INSERT INTO `security_role_permission` VALUES ('49', '49', '1');

-- ----------------------------
-- Table structure for security_role_permission_data_control
-- ----------------------------
DROP TABLE IF EXISTS `security_role_permission_data_control`;
CREATE TABLE `security_role_permission_data_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_control_id` bigint(20) DEFAULT NULL,
  `role_permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBB731E0E50319A20` (`data_control_id`),
  KEY `FKBB731E0E58F6F1AC` (`role_permission_id`),
  CONSTRAINT `FKBB731E0E58F6F1AC` FOREIGN KEY (`role_permission_id`) REFERENCES `security_role_permission` (`id`),
  CONSTRAINT `FKBB731E0E50319A20` FOREIGN KEY (`data_control_id`) REFERENCES `security_data_control` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_role_permission_data_control
-- ----------------------------

-- ----------------------------
-- Table structure for security_user
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
  KEY `FKD607B56A3CDE9C0E` (`org_id`),
  CONSTRAINT `FKD607B56A3CDE9C0E` FOREIGN KEY (`org_id`) REFERENCES `security_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_user
-- ----------------------------
INSERT INTO `security_user` VALUES ('1', '2012-08-03 14:58:38', 'ketayao@gmail.com', '413389882da8dd535f3da6076c55d8d80b6bcfb7', '13518109994', '姚强', 'd6c64a11c75762f5', 'enabled', 'admin', '2');
INSERT INTO `security_user` VALUES ('2', '2013-12-05 15:52:42', null, 'a93db582a2cc021f7adfd89b2a0c9c175a509ba5', null, '编程土超哥', '5f27becbbc663cc2', 'enabled', 'manage', '2');

-- ----------------------------
-- Table structure for security_user_role
-- ----------------------------
DROP TABLE IF EXISTS `security_user_role`;
CREATE TABLE `security_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6DD3562B3FFD717F` (`role_id`),
  KEY `FK6DD3562BE528355F` (`user_id`),
  CONSTRAINT `FK6DD3562BE528355F` FOREIGN KEY (`user_id`) REFERENCES `security_user` (`id`),
  CONSTRAINT `FK6DD3562B3FFD717F` FOREIGN KEY (`role_id`) REFERENCES `security_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_user_role
-- ----------------------------
INSERT INTO `security_user_role` VALUES ('1', '99', '1', '2');

-- ----------------------------
-- Table structure for ss_task
-- ----------------------------
DROP TABLE IF EXISTS `ss_task`;
CREATE TABLE `ss_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT 'bb' COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_task
-- ----------------------------
