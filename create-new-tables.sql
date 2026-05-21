-- ============================================
-- 企业级文件管理系统 - 新功能建表SQL
-- ============================================
-- 数据库：free-fs
-- 执行时间：2026-05-13
-- ============================================

-- ============================================
-- 1. 文件版本表
-- ============================================
CREATE TABLE IF NOT EXISTS `file_version` (
  `id` VARCHAR(36) NOT NULL COMMENT '版本ID',
  `file_id` VARCHAR(36) NOT NULL COMMENT '关联的文件ID',
  `version_number` INT NOT NULL DEFAULT 1 COMMENT '版本号',
  `object_key` VARCHAR(500) NOT NULL COMMENT '存储的对象键',
  `original_name` VARCHAR(255) NOT NULL COMMENT '文件原始名称',
  `size` BIGINT DEFAULT NULL COMMENT '文件大小（字节）',
  `content_md5` VARCHAR(32) DEFAULT NULL COMMENT '文件MD5值',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '版本备注',
  `creator_id` VARCHAR(36) DEFAULT NULL COMMENT '创建者ID',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `is_current` TINYINT(1) DEFAULT 0 COMMENT '是否为当前版本（0-否，1-是）',
  PRIMARY KEY (`id`),
  KEY `idx_file_id` (`file_id`),
  KEY `idx_version_number` (`version_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件版本表';

-- ============================================
-- 2. 文件操作日志表
-- ============================================
CREATE TABLE IF NOT EXISTS `file_audit_log` (
  `id` VARCHAR(36) NOT NULL COMMENT '日志ID',
  `operation_type` VARCHAR(50) NOT NULL COMMENT '操作类型：upload-上传, download-下载, delete-删除, rename-重命名, move-移动, share-分享, permission-权限变更',
  `object_type` VARCHAR(20) DEFAULT NULL COMMENT '对象类型：file-文件, folder-文件夹, share-分享',
  `object_id` VARCHAR(36) DEFAULT NULL COMMENT '操作对象ID',
  `object_name` VARCHAR(255) DEFAULT NULL COMMENT '操作对象名称',
  `operator_id` VARCHAR(36) DEFAULT NULL COMMENT '操作者ID',
  `operator_name` VARCHAR(100) DEFAULT NULL COMMENT '操作者名称',
  `workspace_id` VARCHAR(36) DEFAULT NULL COMMENT '所属工作空间ID',
  `operation_time` DATETIME DEFAULT NULL COMMENT '操作时间',
  `ip_address` VARCHAR(50) DEFAULT NULL COMMENT 'IP地址',
  `detail` TEXT DEFAULT NULL COMMENT '操作详情（JSON格式）',
  `result` VARCHAR(20) DEFAULT NULL COMMENT '操作结果：success-成功, failed-失败',
  `error_message` VARCHAR(500) DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`),
  KEY `idx_operation_type` (`operation_type`),
  KEY `idx_object_id` (`object_id`),
  KEY `idx_operator_id` (`operator_id`),
  KEY `idx_operation_time` (`operation_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件操作日志表';

-- ============================================
-- 3. 文件权限表
-- ============================================
CREATE TABLE IF NOT EXISTS `file_permission` (
  `id` VARCHAR(36) NOT NULL COMMENT '权限ID',
  `object_type` VARCHAR(20) NOT NULL COMMENT '对象类型：folder-目录, file-文件',
  `object_id` VARCHAR(36) NOT NULL COMMENT '对象ID',
  `workspace_id` VARCHAR(36) DEFAULT NULL COMMENT '所属工作空间ID',
  `grantee_type` VARCHAR(20) NOT NULL COMMENT '授权对象类型：user-用户, role-角色',
  `grantee_id` VARCHAR(36) NOT NULL COMMENT '授权对象ID',
  `can_read` TINYINT(1) DEFAULT 0 COMMENT '读权限',
  `can_write` TINYINT(1) DEFAULT 0 COMMENT '写权限',
  `can_delete` TINYINT(1) DEFAULT 0 COMMENT '删除权限',
  `can_manage` TINYINT(1) DEFAULT 0 COMMENT '管理权限',
  `inherit_parent` TINYINT(1) DEFAULT 1 COMMENT '是否继承父目录权限',
  `priority` INT DEFAULT 0 COMMENT '权限优先级',
  `start_time` DATETIME DEFAULT NULL COMMENT '权限生效开始时间',
  `end_time` DATETIME DEFAULT NULL COMMENT '权限生效结束时间',
  `creator_id` VARCHAR(36) DEFAULT NULL COMMENT '创建者ID',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `status` TINYINT(1) DEFAULT 0 COMMENT '状态：0-正常, 1-禁用',
  PRIMARY KEY (`id`),
  KEY `idx_object` (`object_type`, `object_id`),
  KEY `idx_grantee` (`grantee_type`, `grantee_id`),
  KEY `idx_workspace` (`workspace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件权限表';

-- ============================================
-- 执行完成提示
-- ============================================
SELECT 'SQL建表完成！' AS '执行结果';
