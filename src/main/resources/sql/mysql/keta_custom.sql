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
INSERT INTO `security_log_entity` VALUES ('8', '2013-05-26 10:41:16', '127.0.0.1', 'TRACE', 'admin:登录成功。', null);
INSERT INTO `security_log_entity` VALUES ('9', '2013-05-26 10:41:24', '127.0.0.1', 'TRACE', 'admin:修改用户gl成功。', null);
INSERT INTO `security_log_entity` VALUES ('10', '2013-05-26 10:42:22', '127.0.0.1', 'TRACE', 'admin:修改用户gl成功。', null);
INSERT INTO `security_log_entity` VALUES ('15', '2013-05-26 15:21:49', '127.0.0.1', 'TRACE', '添加模块日志管理成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('16', '2013-05-26 15:22:01', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('17', '2013-05-26 15:22:40', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('18', '2013-05-26 17:21:24', '127.0.0.1', 'TRACE', '删除日志id=[Ljava.lang.Long;@6ffeb成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('19', '2013-05-26 17:24:00', '127.0.0.1', 'TRACE', '添加用户{0}成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('20', '2013-05-26 17:27:13', '127.0.0.1', 'TRACE', '删除日志id=[Ljava.lang.Long;@263003成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('21', '2013-05-26 17:27:46', '127.0.0.1', 'TRACE', '删除日志id=[Ljava.lang.Long;@3c0196成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('22', '2013-05-26 17:29:34', '127.0.0.1', 'TRACE', '添加用户{0}成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('23', '2013-05-26 17:29:54', '127.0.0.1', 'TRACE', '删除用户id=[Ljava.lang.Long;@103b1e4成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('24', '2013-05-26 17:54:53', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('25', '2013-05-26 18:04:52', '127.0.0.1', 'TRACE', '修改古蔺供电1组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('26', '2013-05-26 18:07:53', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('27', '2013-05-26 18:12:20', '127.0.0.1', 'TRACE', '修改新模块2模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('28', '2013-05-26 18:15:35', '127.0.0.1', 'TRACE', '修改新模块1模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('29', '2013-05-26 18:16:26', '127.0.0.1', 'TRACE', '修改古蔺供电2组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('30', '2013-05-26 18:36:38', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('31', '2013-05-26 18:36:55', '127.0.0.1', 'TRACE', '修改古蔺供电1组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('32', '2013-05-26 18:37:14', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('33', '2013-05-26 18:39:07', '127.0.0.1', 'TRACE', '修改古蔺供电5组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('34', '2013-05-26 18:39:40', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('35', '2013-05-26 18:39:55', '127.0.0.1', 'TRACE', '修改古蔺供电6组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('36', '2013-05-26 18:40:35', '127.0.0.1', 'TRACE', '修改古蔺供电7组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('37', '2013-05-26 18:45:20', '127.0.0.1', 'TRACE', '修改古蔺供电8组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('38', '2013-05-26 18:46:53', '127.0.0.1', 'TRACE', '修改古蔺供电9组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('39', '2013-05-26 18:48:12', '127.0.0.1', 'TRACE', '修改古蔺供电1组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('40', '2013-05-26 18:52:22', '127.0.0.1', 'TRACE', '修改古蔺供电u组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('41', '2013-05-26 18:53:56', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('42', '2013-05-26 18:54:19', '127.0.0.1', 'TRACE', '修改古蔺供电o组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('43', '2013-05-26 18:55:34', '127.0.0.1', 'TRACE', '修改古蔺供电m组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('44', '2013-05-26 18:56:12', '127.0.0.1', 'TRACE', '修改古蔺供电ml组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('45', '2013-05-26 19:27:22', '127.0.0.1', 'TRACE', '修改组织管理模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('46', '2013-05-26 19:27:34', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('47', '2013-05-26 19:53:47', '127.0.0.1', 'TRACE', '修改古蔺供电ml7组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('48', '2013-05-26 19:54:44', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('49', '2013-05-26 19:54:56', '127.0.0.1', 'TRACE', '修改古蔺供电ml78组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('50', '2013-05-26 19:55:43', '127.0.0.1', 'TRACE', '修改古蔺供电m组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('51', '2013-05-26 19:56:26', '127.0.0.1', 'TRACE', '修改古蔺供电8组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('52', '2013-05-26 20:02:29', '127.0.0.1', 'TRACE', '修改古蔺供电8组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('53', '2013-05-26 20:05:31', '127.0.0.1', 'TRACE', '修改古蔺供电89组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('54', '2013-05-26 20:05:43', '127.0.0.1', 'TRACE', '修改古蔺供电6组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('55', '2013-05-26 20:05:54', '127.0.0.1', 'TRACE', '修改古蔺供电66组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('56', '2013-05-26 20:07:09', '127.0.0.1', 'TRACE', '修改古蔺供电66组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('57', '2013-05-26 20:07:17', '127.0.0.1', 'TRACE', '修改古蔺供电645组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('58', '2013-05-26 20:07:42', '127.0.0.1', 'TRACE', '修改古蔺供电0组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('59', '2013-05-26 20:10:13', '127.0.0.1', 'TRACE', '修改古蔺供电09组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('60', '2013-05-26 20:10:23', '127.0.0.1', 'TRACE', '修改古蔺供电0934组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('61', '2013-05-26 20:13:59', '127.0.0.1', 'TRACE', '修改古蔺供电05组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('62', '2013-05-26 20:14:33', '127.0.0.1', 'TRACE', '修改古蔺供电05组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('63', '2013-05-26 20:15:03', '127.0.0.1', 'TRACE', '修改古蔺供电999组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('64', '2013-05-26 20:16:10', '127.0.0.1', 'TRACE', '修改古蔺供电9996组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('65', '2013-05-26 20:17:24', '127.0.0.1', 'TRACE', '修改古蔺供电9组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('66', '2013-05-26 20:18:33', '127.0.0.1', 'TRACE', '修改新模块13模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('67', '2013-05-26 20:19:56', '127.0.0.1', 'TRACE', '修改古蔺供电91组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('68', '2013-05-26 20:21:00', '127.0.0.1', 'TRACE', '修改古蔺供电912组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('69', '2013-05-26 20:24:20', '127.0.0.1', 'TRACE', '修改古蔺供电9128组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('70', '2013-05-26 20:33:55', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('71', '2013-05-26 20:34:14', '127.0.0.1', 'TRACE', '修改新模块14模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('72', '2013-05-26 20:34:43', '127.0.0.1', 'TRACE', '修改新模块141模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('73', '2013-05-26 20:35:12', '127.0.0.1', 'TRACE', '修改新模块1416模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('74', '2013-05-26 20:35:58', '127.0.0.1', 'TRACE', '修改新模块14162模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('75', '2013-05-26 20:36:31', '127.0.0.1', 'TRACE', '修改新模块141620模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('76', '2013-05-26 20:36:46', '127.0.0.1', 'TRACE', '修改新模块1416208模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('77', '2013-05-26 20:37:49', '127.0.0.1', 'TRACE', '修改新模块141621111模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('78', '2013-05-26 20:39:20', '127.0.0.1', 'TRACE', '修改新模块1416214模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('79', '2013-05-26 20:39:56', '127.0.0.1', 'TRACE', '修改新模块模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('80', '2013-05-26 20:44:06', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('81', '2013-05-26 20:44:46', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('82', '2013-05-26 20:47:21', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('83', '2013-05-26 20:48:24', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('84', '2013-05-26 20:58:27', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('85', '2013-05-26 21:00:33', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('86', '2013-05-26 21:19:11', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('87', '2013-05-26 21:36:42', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('88', '2013-05-27 10:05:24', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('89', '2013-05-27 10:05:45', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('90', '2013-05-27 10:14:06', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('91', '2013-05-27 10:23:08', '127.0.0.1', 'TRACE', '模块id=57,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('92', '2013-05-27 10:48:45', '127.0.0.1', 'TRACE', '{0}', 'admin');
INSERT INTO `security_log_entity` VALUES ('93', '2013-05-27 10:49:36', '127.0.0.1', 'TRACE', '添加模块123123成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('94', '2013-05-27 10:50:22', '127.0.0.1', 'TRACE', '模块id=60,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('95', '2013-05-27 10:58:06', '127.0.0.1', 'TRACE', '添加组织vv成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('96', '2013-05-27 10:59:18', '127.0.0.1', 'TRACE', '添加组织121成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('97', '2013-05-27 11:14:38', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('98', '2013-05-27 11:14:52', '127.0.0.1', 'TRACE', '组织id=13,删除组织成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('99', '2013-05-27 11:16:18', '127.0.0.1', 'TRACE', '组织id=13,删除组织成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('100', '2013-05-27 11:17:16', '127.0.0.1', 'TRACE', '组织id=12,删除组织成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('101', '2013-05-27 11:17:26', '127.0.0.1', 'TRACE', '添加组织1212成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('102', '2013-05-27 11:17:33', '127.0.0.1', 'TRACE', '修改古蔺供电组织成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('103', '2013-05-27 11:17:55', '127.0.0.1', 'TRACE', '添加模块11成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('104', '2013-05-27 11:18:02', '127.0.0.1', 'TRACE', '修改116模块成功', 'admin');
INSERT INTO `security_log_entity` VALUES ('105', '2013-05-27 11:18:07', '127.0.0.1', 'TRACE', '模块id=61,删除模块成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('106', '2013-05-27 11:24:14', '127.0.0.1', 'TRACE', '登录成功。', 'admin');
INSERT INTO `security_log_entity` VALUES ('107', '2013-05-27 11:24:27', '127.0.0.1', 'TRACE', '组织id=14,删除组织成功！', 'admin');
INSERT INTO `security_log_entity` VALUES ('108', '2013-05-27 17:05:03', '127.0.0.1', 'TRACE', '{0}登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('109', '2013-05-27 17:18:42', '127.0.0.1', 'TRACE', '{0}登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('110', '2013-05-27 17:20:34', '127.0.0.1', 'TRACE', '{0}登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('111', '2013-05-27 17:21:55', '127.0.0.1', 'TRACE', '{0}登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('112', '2013-05-27 17:22:57', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('113', '2013-05-28 09:18:31', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('114', '2013-05-28 09:19:02', '127.0.0.1', 'TRACE', '修改用户{0}信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('115', '2013-05-28 09:22:20', '127.0.0.1', 'TRACE', '修改用户{0}信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('116', '2013-05-28 09:23:45', '127.0.0.1', 'TRACE', '修改用户gl信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('117', '2013-05-28 09:53:29', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('118', '2013-05-28 09:54:03', '127.0.0.1', 'TRACE', '添加了用户now。', 'admin');
INSERT INTO `security_log_entity` VALUES ('119', '2013-05-28 09:54:22', '127.0.0.1', 'TRACE', '修改用户now信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('120', '2013-05-28 09:54:34', '127.0.0.1', 'TRACE', '用户now，重置密码成功，默认为123456！', 'admin');
INSERT INTO `security_log_entity` VALUES ('121', '2013-05-28 09:54:45', '127.0.0.1', 'TRACE', '用户now，更新状态成功，当前为不可用', 'admin');
INSERT INTO `security_log_entity` VALUES ('122', '2013-05-28 09:54:54', '127.0.0.1', 'TRACE', '用户now，更新状态成功，当前为可用', 'admin');
INSERT INTO `security_log_entity` VALUES ('123', '2013-05-28 09:55:04', '127.0.0.1', 'TRACE', '分配null用户的null角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('124', '2013-05-28 09:56:59', '127.0.0.1', 'TRACE', '分配null用户的null角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('125', '2013-05-28 09:57:10', '127.0.0.1', 'TRACE', '撤销now用户的管理员角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('126', '2013-05-28 09:57:36', '127.0.0.1', 'TRACE', '删除用户[ceshi, now]。', 'admin');
INSERT INTO `security_log_entity` VALUES ('127', '2013-05-28 09:58:29', '127.0.0.1', 'TRACE', 'admin修改了密码。', 'admin');
INSERT INTO `security_log_entity` VALUES ('128', '2013-05-28 09:59:10', '127.0.0.1', 'TRACE', 'admin修改了密码。', 'admin');
INSERT INTO `security_log_entity` VALUES ('129', '2013-05-28 09:59:33', '127.0.0.1', 'TRACE', 'admin修改了详细信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('130', '2013-05-28 10:44:26', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('131', '2013-05-28 10:44:39', '127.0.0.1', 'TRACE', '添加了nn角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('132', '2013-05-28 10:44:50', '127.0.0.1', 'TRACE', '修改了nn2角色的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('133', '2013-05-28 10:45:05', '127.0.0.1', 'TRACE', '删除了nn2角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('134', '2013-05-28 10:46:17', '127.0.0.1', 'TRACE', '添加了ewrwerew模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('135', '2013-05-28 10:46:29', '127.0.0.1', 'TRACE', '修改了ewrwerew2模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('136', '2013-05-28 10:46:34', '127.0.0.1', 'TRACE', '删除了ewrwerew2模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('137', '2013-05-28 10:49:03', '127.0.0.1', 'TRACE', '添加了rwrew模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('138', '2013-05-28 10:49:06', '127.0.0.1', 'TRACE', '删除了rwrew模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('139', '2013-05-28 10:49:27', '127.0.0.1', 'TRACE', '添加了1212sad组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('140', '2013-05-28 10:49:33', '127.0.0.1', 'TRACE', '修改了1212sadsdas组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('141', '2013-05-28 10:49:40', '127.0.0.1', 'TRACE', '向null组织分配了null的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('142', '2013-05-28 10:49:44', '127.0.0.1', 'TRACE', '撤销了1212sadsdas组织的管理员角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('143', '2013-05-28 10:52:49', '127.0.0.1', 'TRACE', '向null组织分配了null的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('144', '2013-05-28 10:53:58', '127.0.0.1', 'TRACE', '向null组织分配了null的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('145', '2013-05-28 10:55:28', '127.0.0.1', 'TRACE', '向null组织分配了null的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('146', '2013-05-28 10:56:33', '127.0.0.1', 'TRACE', '向null用户分配了null的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('147', '2013-05-28 11:00:30', '127.0.0.1', 'TRACE', '向1212sadsdas组织分配了任务实例角色的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('148', '2013-05-28 11:00:48', '127.0.0.1', 'TRACE', '撤销了1212sadsdas组织的任务实例角色角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('149', '2013-05-28 11:00:58', '127.0.0.1', 'TRACE', '删除了1212sadsdas组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('150', '2013-05-28 11:02:30', '127.0.0.1', 'TRACE', '删除了模块测试4模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('151', '2013-05-28 11:16:04', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('152', '2013-05-28 11:16:41', '127.0.0.1', 'TRACE', '删除了模块测试3模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('153', '2013-05-28 11:22:23', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('154', '2013-05-28 11:22:43', '127.0.0.1', 'TRACE', '添加了vv组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('155', '2013-05-28 11:22:58', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('156', '2013-05-28 11:23:18', '127.0.0.1', 'TRACE', '添加了gg组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('157', '2013-05-28 11:23:25', '127.0.0.1', 'TRACE', '删除了gg组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('158', '2013-05-28 11:23:34', '127.0.0.1', 'TRACE', '修改了vv2组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('159', '2013-05-28 11:23:51', '127.0.0.1', 'TRACE', '添加了2222模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('160', '2013-05-28 11:24:01', '127.0.0.1', 'TRACE', '修改了1212模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('161', '2013-05-28 11:24:08', '127.0.0.1', 'TRACE', '删除了1212模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('162', '2013-05-28 11:24:19', '127.0.0.1', 'TRACE', '删除了vv2组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('163', '2013-05-28 11:24:24', '127.0.0.1', 'TRACE', '进行了缓存清理。', 'admin');
INSERT INTO `security_log_entity` VALUES ('164', '2013-05-28 11:24:39', '127.0.0.1', 'TRACE', '删除了2条日志。', 'admin');
INSERT INTO `security_log_entity` VALUES ('165', '2013-05-28 13:10:28', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('166', '2013-05-28 13:10:39', '127.0.0.1', 'INFO', '添加了ee任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('167', '2013-05-28 14:09:21', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('168', '2013-05-28 14:10:06', '127.0.0.1', 'TRACE', 'Log的override用法实例，override为true，会忽略掉level。', 'admin');
INSERT INTO `security_log_entity` VALUES ('169', '2013-05-28 14:32:44', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('170', '2013-05-28 14:33:41', '127.0.0.1', 'INFO', '添加了1111任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('171', '2013-05-28 14:34:07', '127.0.0.1', 'TRACE', 'Log的override用法实例，override为true，会忽略掉level。', 'admin');
INSERT INTO `security_log_entity` VALUES ('172', '2013-05-28 14:35:46', '127.0.0.1', 'INFO', '添加了bbbb任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('173', '2013-05-28 14:35:54', '127.0.0.1', 'TRACE', 'Log的override用法实例，override为true，会忽略掉level。', 'admin');
INSERT INTO `security_log_entity` VALUES ('174', '2013-05-28 14:42:52', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('175', '2013-05-28 14:43:03', '127.0.0.1', 'INFO', '添加了ee2任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('176', '2013-05-28 15:01:01', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('177', '2013-05-28 15:01:13', '127.0.0.1', 'TRACE', 'Log的override用法实例，override为true，会忽略掉level。', 'admin');
INSERT INTO `security_log_entity` VALUES ('178', '2013-05-28 15:02:09', '127.0.0.1', 'INFO', '添加了123123任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('179', '2013-05-28 15:02:14', '127.0.0.1', 'TRACE', 'Log的override用法实例，override为true，会忽略掉level。', 'admin');
INSERT INTO `security_log_entity` VALUES ('180', '2013-05-28 15:05:08', '127.0.0.1', 'INFO', '添加了1212任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('181', '2013-05-28 16:14:39', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('182', '2013-05-28 16:15:38', '127.0.0.1', 'TRACE', '修改了测试模块模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('183', '2013-05-29 09:12:47', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('184', '2013-05-29 17:31:36', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('185', '2013-05-29 17:31:50', '127.0.0.1', 'TRACE', '添加了12121组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('186', '2013-05-31 09:12:41', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('187', '2013-05-31 11:02:12', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('188', '2013-05-31 11:42:10', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('189', '2013-05-31 11:56:34', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('190', '2013-05-31 12:00:58', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('191', '2013-05-31 12:08:42', '127.0.0.1', 'TRACE', '修改了新模块模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('192', '2013-05-31 12:09:12', '127.0.0.1', 'TRACE', '修改了121215组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('193', '2013-05-31 12:10:40', '127.0.0.1', 'TRACE', '修改了新模块模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('194', '2013-05-31 12:13:28', '127.0.0.1', 'TRACE', '修改了多级模块测试模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('195', '2013-05-31 12:23:09', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('196', '2013-05-31 12:25:46', '127.0.0.1', 'TRACE', '修改了121215组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('197', '2013-06-02 17:43:48', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('198', '2013-06-03 09:41:22', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('199', '2013-06-03 09:42:07', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('200', '2013-06-03 09:42:36', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('201', '2013-06-03 09:42:50', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('202', '2013-06-03 09:43:18', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('203', '2013-06-03 09:43:43', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('204', '2013-06-03 09:44:16', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('205', '2013-06-03 09:53:40', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('206', '2013-06-03 09:53:58', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('207', '2013-06-03 09:55:04', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('208', '2013-06-03 09:55:23', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('209', '2013-06-03 09:55:38', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('210', '2013-06-03 09:55:52', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('211', '2013-06-03 09:55:59', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('212', '2013-06-03 10:00:48', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('213', '2013-06-03 10:02:25', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('214', '2013-06-03 11:05:45', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('215', '2013-06-03 11:05:50', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('216', '2013-06-03 11:12:54', '127.0.0.1', 'TRACE', 'cya用户重置密码成功，默认为123456！', 'admin');
INSERT INTO `security_log_entity` VALUES ('217', '2013-06-03 11:17:14', '127.0.0.1', 'TRACE', 'admin修改了详细信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('218', '2013-06-03 11:21:06', '127.0.0.1', 'TRACE', 'admin修改了密码。', 'admin');
INSERT INTO `security_log_entity` VALUES ('219', '2013-06-03 11:27:41', '127.0.0.1', 'TRACE', '修改了cya用户的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('220', '2013-06-03 11:36:40', '127.0.0.1', 'TRACE', '添加了kblog用户。', 'admin');
INSERT INTO `security_log_entity` VALUES ('221', '2013-06-03 11:48:02', '127.0.0.1', 'TRACE', '向kblog用户分配了管理员的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('222', '2013-06-03 11:48:10', '127.0.0.1', 'TRACE', '向kblog用户分配了营销人员的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('223', '2013-06-03 11:52:39', '127.0.0.1', 'TRACE', '撤销了kblog用户的营销人员角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('224', '2013-06-03 11:56:18', '127.0.0.1', 'TRACE', 'cya用户重置密码成功，默认为123456！', 'admin');
INSERT INTO `security_log_entity` VALUES ('225', '2013-06-03 14:25:27', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('226', '2013-06-03 14:32:22', '127.0.0.1', 'TRACE', '修改了cya用户的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('227', '2013-06-03 14:32:54', '127.0.0.1', 'TRACE', '删除了[kblog]用户。', 'admin');
INSERT INTO `security_log_entity` VALUES ('228', '2013-06-03 14:33:02', '127.0.0.1', 'TRACE', 'task2用户重置密码成功，默认为123456！', 'admin');
INSERT INTO `security_log_entity` VALUES ('229', '2013-06-03 14:33:07', '127.0.0.1', 'TRACE', 'task2用户更新状态成功，当前为不可用', 'admin');
INSERT INTO `security_log_entity` VALUES ('230', '2013-06-03 16:32:52', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('231', '2013-06-03 17:01:38', '127.0.0.1', 'TRACE', '添加了hh角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('232', '2013-06-04 09:17:44', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('233', '2013-06-04 09:54:50', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('234', '2013-06-04 10:20:30', '127.0.0.1', 'TRACE', '添加了gg模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('235', '2013-06-04 10:28:22', '127.0.0.1', 'TRACE', '修改了ggk模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('236', '2013-06-04 10:42:07', '127.0.0.1', 'TRACE', '修改了ggk模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('237', '2013-06-04 10:42:37', '127.0.0.1', 'TRACE', '删除了ggk模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('238', '2013-06-04 11:19:49', '127.0.0.1', 'TRACE', '添加了gg组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('239', '2013-06-04 11:24:18', '127.0.0.1', 'TRACE', '修改了gg2组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('240', '2013-06-04 11:29:02', '127.0.0.1', 'TRACE', '向gg2组织分配了管理员的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('241', '2013-06-04 11:29:05', '127.0.0.1', 'TRACE', '向gg2组织分配了营销人员的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('242', '2013-06-04 11:33:53', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('243', '2013-06-04 11:35:40', '127.0.0.1', 'TRACE', '撤销了gg2组织的营销人员角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('244', '2013-06-04 11:36:57', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('245', '2013-06-04 11:39:12', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('246', '2013-06-04 11:55:03', '127.0.0.1', 'TRACE', '添加了tt角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('247', '2013-06-04 15:08:17', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('248', '2013-06-04 15:14:04', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('249', '2013-06-04 16:30:57', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('250', '2013-06-04 16:40:22', '127.0.0.1', 'TRACE', '添加了tt2角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('251', '2013-06-04 17:06:50', '127.0.0.1', 'TRACE', '修改了tt2角色的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('252', '2013-06-04 17:14:03', '127.0.0.1', 'TRACE', '删除了tt2角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('253', '2013-06-04 17:22:15', '127.0.0.1', 'TRACE', '修改了yaan用户的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('254', '2013-06-04 17:22:36', '127.0.0.1', 'TRACE', '添加了opnmzxcvb用户。', 'admin');
INSERT INTO `security_log_entity` VALUES ('255', '2013-06-04 17:23:06', '127.0.0.1', 'TRACE', 'opnmzxcvb用户重置密码成功，默认为123456！', 'admin');
INSERT INTO `security_log_entity` VALUES ('256', '2013-06-04 17:23:12', '127.0.0.1', 'TRACE', 'opnmzxcvb用户更新状态成功，当前为不可用', 'admin');
INSERT INTO `security_log_entity` VALUES ('257', '2013-06-05 08:56:04', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('258', '2013-06-05 09:00:42', '127.0.0.1', 'TRACE', '添加了gg用户。', 'admin');
INSERT INTO `security_log_entity` VALUES ('259', '2013-06-05 09:01:14', '127.0.0.1', 'TRACE', '修改了gg用户的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('260', '2013-06-05 09:02:26', '127.0.0.1', 'TRACE', '向gg用户分配了tt的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('261', '2013-06-05 09:02:30', '127.0.0.1', 'TRACE', '撤销了gg用户的tt角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('262', '2013-06-05 09:19:12', '127.0.0.1', 'TRACE', '添加了人人组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('263', '2013-06-05 09:20:35', '127.0.0.1', 'TRACE', '修改了人人2组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('264', '2013-06-05 09:20:45', '127.0.0.1', 'TRACE', '修改了人人2组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('265', '2013-06-05 09:21:07', '127.0.0.1', 'TRACE', '向121215组织分配了管理员的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('266', '2013-06-05 09:21:13', '127.0.0.1', 'TRACE', '撤销了121215组织的管理员角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('267', '2013-06-05 09:22:16', '127.0.0.1', 'TRACE', '删除了人人2组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('268', '2013-06-05 09:27:20', '127.0.0.1', 'TRACE', '添加了bb模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('269', '2013-06-05 09:27:43', '127.0.0.1', 'TRACE', '修改了bb模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('270', '2013-06-05 09:27:59', '127.0.0.1', 'TRACE', '删除了bb模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('271', '2013-06-05 09:29:07', '127.0.0.1', 'TRACE', '进行了缓存清理。', 'admin');
INSERT INTO `security_log_entity` VALUES ('272', '2013-06-05 09:29:24', '127.0.0.1', 'TRACE', '删除了2条日志。', 'admin');
INSERT INTO `security_log_entity` VALUES ('273', '2013-06-05 09:42:12', '127.0.0.1', 'INFO', '添加了基于SimpleJdbcDaoSupport通用分页任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('274', '2013-06-05 09:45:26', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('275', '2013-06-05 09:46:54', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('276', '2013-06-05 09:47:41', '127.0.0.1', 'TRACE', 'Log的override用法实例，override为true，会忽略掉level。删除了[基于SimpleJdbcDaoSupport通用分页]任务。', 'admin');
INSERT INTO `security_log_entity` VALUES ('277', '2013-06-05 09:55:26', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('278', '2013-06-05 09:56:12', '127.0.0.1', 'TRACE', '删除了1212组织。', 'admin');
INSERT INTO `security_log_entity` VALUES ('279', '2013-06-05 09:57:43', '127.0.0.1', 'TRACE', '会话超时， 该用户重新登录系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('280', '2013-06-05 09:58:28', '127.0.0.1', 'TRACE', '删除了116模块。', 'admin');
INSERT INTO `security_log_entity` VALUES ('281', '2013-06-05 10:00:08', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('282', '2013-06-05 10:08:11', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('283', '2013-06-05 10:08:17', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('284', '2013-06-05 10:10:10', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('285', '2013-06-05 10:12:17', '127.0.0.1', 'TRACE', '修改了新模块2模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('286', '2013-06-05 10:12:46', '127.0.0.1', 'TRACE', '修改了新模块26模块的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('287', '2013-06-05 10:31:25', '127.0.0.1', 'TRACE', 'admin登录了系统。', 'admin');
INSERT INTO `security_log_entity` VALUES ('288', '2013-06-05 10:32:40', '127.0.0.1', 'INFO', '添加了的粉丝任务，LogMessageObject的isWritten为true。', 'admin');
INSERT INTO `security_log_entity` VALUES ('289', '2013-06-05 10:32:46', '127.0.0.1', 'TRACE', 'Log的override用法实例，override为true，会忽略掉level。删除了[1212, 的粉丝]任务。', 'admin');
INSERT INTO `security_log_entity` VALUES ('290', '2013-06-05 10:44:14', '127.0.0.1', 'TRACE', '修改了vv3组织的信息。', 'admin');
INSERT INTO `security_log_entity` VALUES ('291', '2013-06-05 10:44:31', '127.0.0.1', 'TRACE', '向vv3组织分配了管理员的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('292', '2013-06-05 10:44:36', '127.0.0.1', 'TRACE', '撤销了vv3组织的管理员角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('293', '2013-06-05 10:44:40', '127.0.0.1', 'TRACE', '向vv3组织分配了tt的角色。', 'admin');
INSERT INTO `security_log_entity` VALUES ('294', '2013-06-05 10:46:07', '127.0.0.1', 'TRACE', '删除了tt角色。', 'admin');

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
