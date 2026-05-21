-- 初始化扩展功能表
-- 文件版本管理、操作日志、权限管理
-- 使用前请确保数据库名为 free-fs 或者修改下面的 USE 语句

USE `free-fs`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =========================================
-- 1. 文件版本表
-- =========================================
DROP TABLE IF EXISTS `file_version`;
CREATE TABLE `file_version` (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `file_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联的文件ID',
  `version_number` int NOT NULL COMMENT '版本号',
  `object_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储的对象键',
  `original_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件原始名称',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小（字节）',
  `content_md5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文件MD5值',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '版本备注',
  `creator_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_current` tinyint(1) NULL DEFAULT 0 COMMENT '是否为当前版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_file_id` (`file_id` ASC) USING BTREE,
  INDEX `idx_version` (`file_id` ASC, `version_number` DESC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件版本表' ROW_FORMAT = DYNAMIC;

-- =========================================
-- 2. 文件操作日志表
-- =========================================
DROP TABLE IF EXISTS `file_audit_log`;
CREATE TABLE `file_audit_log` (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `operation_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作类型：UPLOAD/DOWNLOAD/DELETE/RENAME/MOVE',
  `object_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对象类型：FILE/FOLDER',
  `object_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对象ID',
  `object_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对象名称',
  `operator_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作者ID',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID(兼容前端)',
  `operator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者名称',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作空间ID',
  `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址(兼容前端)',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作详情（JSON格式）',
  `old_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '旧名称(重命名操作)',
  `new_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新名称(重命名操作)',
  `old_parent_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '旧父目录ID(移动操作)',
  `new_parent_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新父目录ID(移动操作)',
  `result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作结果',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_object` (`object_type` ASC, `object_id` ASC) USING BTREE,
  INDEX `idx_user` (`operator_id` ASC) USING BTREE,
  INDEX `idx_time` (`operation_time` DESC) USING BTREE,
  INDEX `idx_type` (`operation_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件操作日志表' ROW_FORMAT = DYNAMIC;

-- =========================================
-- 3. 文件权限表
-- =========================================
DROP TABLE IF EXISTS `file_permission`;
CREATE TABLE `file_permission` (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `object_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对象类型：FILE/FOLDER',
  `object_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对象ID',
  `subject_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主体类型：USER/ROLE',
  `subject_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主体ID（用户ID或角色ID）',
  `permission_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限类型',
  `can_read` tinyint(1) NULL DEFAULT 0 COMMENT '读取权限',
  `can_write` tinyint(1) NULL DEFAULT 0 COMMENT '写入权限',
  `can_delete` tinyint(1) NULL DEFAULT 0 COMMENT '删除权限',
  `can_manage` tinyint(1) NULL DEFAULT 0 COMMENT '管理权限',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_permission` (`object_type` ASC, `object_id` ASC, `subject_type` ASC, `subject_id` ASC) USING BTREE,
  INDEX `idx_object` (`object_type` ASC, `object_id` ASC) USING BTREE,
  INDEX `idx_subject` (`subject_type` ASC, `subject_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件权限表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;

SELECT '扩展功能表初始化完成！' AS message;
