/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : nacos_config

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 20/06/2020 10:16:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (2, 'nacos-config-example.yaml', 'DEFAULT_GROUP', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 22', 'bb4f939b26f87459815d1729421eb7f2', '2020-06-17 12:34:50', '2020-06-18 08:23:57', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (6, 'nacos-config-example', 'DEFAULT_GROUP', 'user:\r\n  name: miqi\r\n  age: 18\r\n  weight: 110', '444ef0df79fd5d66e20c5dc42e913926', '2020-06-18 08:17:11', '2020-06-18 09:05:06', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (8, 'nacos-config-example-dev.yaml', 'DEFAULT_GROUP', 'user:\r\n  name: Belo-betty', 'ea0a217e1ebb60926d363abf1f685335', '2020-06-18 08:22:55', '2020-06-18 08:22:55', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (12, 'common.yaml', 'DEFAULT_GROUP', 'user:\r\n  birthday: 2020-9-18', '31424b918404d14e181efb6948135207', '2020-06-18 08:39:37', '2020-06-19 08:53:44', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (17, 'extension.yaml', 'DEFAULT_GROUP', 'user: \r\n  weight: 125\r\n  birthday: 2020-9-19', '88a3df7102eb15725ed73968910970b9', '2020-06-18 08:50:52', '2020-06-18 09:06:18', NULL, '0:0:0:0:0:0:0:1', '', '', 'null', 'null', 'null', 'yaml', 'null');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'nacos-config-example.yml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 18', 'fc3aff2b10e4f2e36d479fd622b3e36e', '2020-06-17 12:23:13', '2020-06-17 12:23:14', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'nacos-config-example.yml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 18', 'fc3aff2b10e4f2e36d479fd622b3e36e', '2020-06-17 12:34:35', '2020-06-17 12:34:36', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'nacos-config-example.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 18', 'fc3aff2b10e4f2e36d479fd622b3e36e', '2020-06-17 12:34:50', '2020-06-17 12:34:50', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (2, 4, 'nacos-config-example.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 18', 'fc3aff2b10e4f2e36d479fd622b3e36e', '2020-06-17 12:37:44', '2020-06-17 12:37:44', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 5, 'nacos-config-example.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 19', 'b2e934bbed2f97c1f5057f8d7beb8be1', '2020-06-17 12:41:04', '2020-06-17 12:41:04', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 6, 'nacos-config-example.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 20', 'cd8ed702d7b7db7b2f399a6e35f0042f', '2020-06-18 08:15:05', '2020-06-18 08:15:05', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'nacos-config-example', 'DEFAULT_GROUP', '', 'user:\r\n  age: 18', '2d6d0ac0d4821e10136c78039e6c034e', '2020-06-18 08:17:11', '2020-06-18 08:17:11', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (2, 8, 'nacos-config-example.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal\r\n  age: 202', '376916abed1f56dd6f7ea3e01d29a9d6', '2020-06-18 08:17:33', '2020-06-18 08:17:33', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 9, 'nacos-config-example-dev.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  name: Belo-betty', 'ea0a217e1ebb60926d363abf1f685335', '2020-06-18 08:22:54', '2020-06-18 08:22:55', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (2, 10, 'nacos-config-example.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  id: 1\r\n  name: fatal', 'eef48f466ce7b73452aba9262b1cf0d7', '2020-06-18 08:23:57', '2020-06-18 08:23:57', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (6, 11, 'nacos-config-example', 'DEFAULT_GROUP', '', 'user:\r\n  age: 18', '2d6d0ac0d4821e10136c78039e6c034e', '2020-06-18 08:25:45', '2020-06-18 08:25:45', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (6, 12, 'nacos-config-example', 'DEFAULT_GROUP', '', 'user:\r\n  name: no file extension\r\n  age: 18', 'e3010d1700c27f90932942bf9b3a3e29', '2020-06-18 08:26:17', '2020-06-18 08:26:18', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 13, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-6-18', '2943ccc7c90be23356db13c9428b909d', '2020-06-18 08:39:37', '2020-06-18 08:39:37', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (12, 14, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-6-18', '2943ccc7c90be23356db13c9428b909d', '2020-06-18 08:46:05', '2020-06-18 08:46:05', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (12, 15, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-7-18', '26d3ca118a89cb4e15d61d43cf6e1c90', '2020-06-18 08:47:13', '2020-06-18 08:47:14', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (12, 16, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-6-18', '2943ccc7c90be23356db13c9428b909d', '2020-06-18 08:48:18', '2020-06-18 08:48:19', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (12, 17, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-8-18', '03cff94e0007415a89cd5997a0aa8d44', '2020-06-18 08:49:19', '2020-06-18 08:49:19', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 18, 'extension.yaml', 'DEFAULT_GROUP', '', 'user: \r\n  weight: 120', '2e94f83644f10acfb3a551416317ac91', '2020-06-18 08:50:52', '2020-06-18 08:50:52', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (17, 19, 'extension.yaml', 'DEFAULT_GROUP', '', 'user: \r\n  weight: 120', '2e94f83644f10acfb3a551416317ac91', '2020-06-18 09:04:26', '2020-06-18 09:04:26', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (6, 20, 'nacos-config-example', 'DEFAULT_GROUP', '', 'user:\r\n  name: miqi\r\n  age: 18', '25aaf2b3e6acd1b33834be2b22a748f6', '2020-06-18 09:05:05', '2020-06-18 09:05:06', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (17, 21, 'extension.yaml', 'DEFAULT_GROUP', '', 'user: \r\n  weight: 125', '521a7842afdc83e0192ab3009da20fb5', '2020-06-18 09:06:17', '2020-06-18 09:06:18', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (12, 22, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-9-18', '31424b918404d14e181efb6948135207', '2020-06-18 09:23:33', '2020-06-18 09:23:33', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (12, 23, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-9-18\r\n  hobby: swim', '9d677d957fe3ba4241fe57b185c20f01', '2020-06-18 09:23:41', '2020-06-18 09:23:41', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (12, 24, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-9-18', '31424b918404d14e181efb6948135207', '2020-06-19 08:53:10', '2020-06-19 08:53:10', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (12, 25, 'common.yaml', 'DEFAULT_GROUP', '', 'user:\r\n  birthday: 2020-9-16', '88829957c3a6c77d6750ce2c8eeb4075', '2020-06-19 08:53:44', '2020-06-19 08:53:44', NULL, '0:0:0:0:0:0:0:1', 'U', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `resource` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('role1', ':*:*', 'r');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
INSERT INTO `roles` VALUES ('user1', 'role1');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$1KsndT2HM.MnQj2WUAFYseYYnUFyvQcpXvj34oswBVW7ptrFkJgwK', 1);
INSERT INTO `users` VALUES ('user1', '$2a$10$KX4P253ZmGNgqPJeX12uLeHYNcMMwwsD8jqcXOzYDK0KpoS5rFqXa', 1);

SET FOREIGN_KEY_CHECKS = 1;
