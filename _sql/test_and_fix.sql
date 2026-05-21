-- 测试和修复脚本
USE `free-fs`;

-- =========================================
-- 第一步：检查并创建表
-- =========================================
SELECT '=== 检查扩展表 ===' AS message;

-- 检查并创建 file_version
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'free-fs' AND table_name = 'file_version');
SET @sql = IF(@table_exists > 0,
    'SELECT ''file_version 表已存在'' AS status',
    'CREATE TABLE `file_version` (
      `id` varchar(128) NOT NULL,
      `file_id` varchar(128) NOT NULL,
      `version_number` int NOT NULL,
      `object_key` varchar(128) NULL,
      `original_name` varchar(128) NULL,
      `size` bigint NULL,
      `content_md5` text NULL,
      `remark` text NULL,
      `creator_id` varchar(128) NULL,
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `is_current` tinyint(1) NULL DEFAULT 0,
      PRIMARY KEY (`id`),
      INDEX `idx_file_id` (`file_id`),
      INDEX `idx_version` (`file_id`, `version_number` DESC)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4; SELECT ''file_version 表创建成功'' AS status'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 检查并创建 file_audit_log
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'free-fs' AND table_name = 'file_audit_log');
SET @sql = IF(@table_exists > 0,
    'SELECT ''file_audit_log 表已存在'' AS status',
    'CREATE TABLE `file_audit_log` (
      `id` varchar(128) NOT NULL,
      `operation_type` varchar(50) NOT NULL,
      `object_type` varchar(20) NOT NULL,
      `object_id` varchar(128) NOT NULL,
      `object_name` varchar(255) NULL,
      `operator_id` varchar(128) NOT NULL,
      `user_id` varchar(128) NULL,
      `operator_name` varchar(255) NULL,
      `workspace_id` varchar(128) NULL,
      `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `ip_address` varchar(50) NULL,
      `ip` varchar(50) NULL,
      `detail` text NULL,
      `old_name` varchar(255) NULL,
      `new_name` varchar(255) NULL,
      `old_parent_id` varchar(128) NULL,
      `new_parent_id` varchar(128) NULL,
      `result` varchar(20) NULL,
      `error_message` text NULL,
      PRIMARY KEY (`id`),
      INDEX `idx_object` (`object_type`, `object_id`),
      INDEX `idx_user` (`operator_id`),
      INDEX `idx_time` (`operation_time` DESC),
      INDEX `idx_type` (`operation_type`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4; SELECT ''file_audit_log 表创建成功'' AS status'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 检查并创建 file_permission
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'free-fs' AND table_name = 'file_permission');
SET @sql = IF(@table_exists > 0,
    'SELECT ''file_permission 表已存在'' AS status',
    'CREATE TABLE `file_permission` (
      `id` varchar(128) NOT NULL,
      `object_type` varchar(20) NOT NULL,
      `object_id` varchar(128) NOT NULL,
      `subject_type` varchar(20) NOT NULL,
      `subject_id` varchar(128) NOT NULL,
      `permission_type` varchar(50) NULL,
      `can_read` tinyint(1) NULL DEFAULT 0,
      `can_write` tinyint(1) NULL DEFAULT 0,
      `can_delete` tinyint(1) NULL DEFAULT 0,
      `can_manage` tinyint(1) NULL DEFAULT 0,
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`),
      UNIQUE INDEX `uk_permission` (`object_type`, `object_id`, `subject_type`, `subject_id`),
      INDEX `idx_object` (`object_type`, `object_id`),
      INDEX `idx_subject` (`subject_type`, `subject_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4; SELECT ''file_permission 表创建成功'' AS status'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- =========================================
-- 第二步：查看现有文件（用于插入测试数据）
-- =========================================
SELECT '=== 查看现有文件（前10个） ===' AS message;
SELECT id, display_name, file_name FROM file_info LIMIT 10;

-- =========================================
-- 第三步：插入测试日志数据（如果表存在且为空）
-- =========================================
SET @log_count = (SELECT COUNT(*) FROM file_audit_log);
SET @sql = IF(@log_count = 0,
    'INSERT INTO file_audit_log 
    (id, operation_type, object_type, object_id, object_name, operator_id, user_id, operation_time, result) 
    VALUES 
    (UUID(), ''UPLOAD'', ''FILE'', (SELECT id FROM file_info LIMIT 1), (SELECT display_name FROM file_info LIMIT 1), ''1'', ''1'', NOW(), ''success''),
    (UUID(), ''RENAME'', ''FILE'', (SELECT id FROM file_info LIMIT 1), (SELECT display_name FROM file_info LIMIT 1), ''1'', ''1'', NOW(), ''success''),
    (UUID(), ''DOWNLOAD'', ''FILE'', (SELECT id FROM file_info LIMIT 1), (SELECT display_name FROM file_info LIMIT 1), ''1'', ''1'', NOW(), ''success'');
    SELECT ''测试日志数据已插入！'' AS message',
    'SELECT CONCAT(''已有 '', @log_count, '' 条日志记录'') AS message'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- =========================================
-- 第四步：显示结果
-- =========================================
SELECT '=== 当前所有 file_ 开头的表 ===' AS message;
SHOW TABLES FROM `free-fs` LIKE 'file_%';

SELECT '=== file_audit_log 表中的数据 ===' AS message;
SELECT * FROM file_audit_log ORDER BY operation_time DESC LIMIT 10;

SELECT '=== 完成！请重启后端服务后测试 ===' AS message;
