-- 检查并初始化扩展表
-- 此脚本会检查表是否存在，不存在则创建
USE `free-fs`;

SELECT '开始检查扩展表...' AS message;

-- =========================================
-- 检查并创建 file_version 表
-- =========================================
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'free-fs' AND table_name = 'file_version');

SET @sql = IF(@table_exists > 0,
    'SELECT ''file_version 表已存在 ✓'' AS message',
    'CREATE TABLE `file_version` (
      `id` varchar(128) NOT NULL COMMENT ''主键ID'',
      `file_id` varchar(128) NOT NULL COMMENT ''关联的文件ID'',
      `version_number` int NOT NULL COMMENT ''版本号'',
      `object_key` varchar(128) NULL DEFAULT NULL COMMENT ''存储的对象键'',
      `original_name` varchar(128) NULL DEFAULT NULL COMMENT ''文件原始名称'',
      `size` bigint NULL DEFAULT NULL COMMENT ''文件大小（字节）'',
      `content_md5` text NULL COMMENT ''文件MD5值'',
      `remark` text NULL COMMENT ''版本备注'',
      `creator_id` varchar(128) NULL DEFAULT NULL COMMENT ''创建者ID'',
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
      `is_current` tinyint(1) NULL DEFAULT 0 COMMENT ''是否为当前版本'',
      PRIMARY KEY (`id`),
      INDEX `idx_file_id` (`file_id`),
      INDEX `idx_version` (`file_id`, `version_number` DESC)
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = ''文件版本表''; SELECT ''file_version 表创建成功 ✓'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================
-- 检查并创建 file_audit_log 表
-- =========================================
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'free-fs' AND table_name = 'file_audit_log');

SET @sql = IF(@table_exists > 0,
    'SELECT ''file_audit_log 表已存在 ✓'' AS message',
    'CREATE TABLE `file_audit_log` (
      `id` varchar(128) NOT NULL COMMENT ''主键ID'',
      `operation_type` varchar(50) NOT NULL COMMENT ''操作类型：UPLOAD/DOWNLOAD/DELETE/RENAME/MOVE'',
      `object_type` varchar(20) NOT NULL COMMENT ''对象类型：FILE/FOLDER'',
      `object_id` varchar(128) NOT NULL COMMENT ''对象ID'',
      `object_name` varchar(255) NULL DEFAULT NULL COMMENT ''对象名称'',
      `operator_id` varchar(128) NOT NULL COMMENT ''操作者ID'',
      `user_id` varchar(128) NULL DEFAULT NULL COMMENT ''用户ID(兼容前端)'',
      `operator_name` varchar(255) NULL DEFAULT NULL COMMENT ''操作者名称'',
      `workspace_id` varchar(128) NULL DEFAULT NULL COMMENT ''工作空间ID'',
      `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''操作时间'',
      `ip_address` varchar(50) NULL DEFAULT NULL COMMENT ''IP地址'',
      `ip` varchar(50) NULL DEFAULT NULL COMMENT ''IP地址(兼容前端)'',
      `detail` text NULL COMMENT ''操作详情（JSON格式）'',
      `old_name` varchar(255) NULL DEFAULT NULL COMMENT ''旧名称(重命名操作)'',
      `new_name` varchar(255) NULL DEFAULT NULL COMMENT ''新名称(重命名操作)'',
      `old_parent_id` varchar(128) NULL DEFAULT NULL COMMENT ''旧父目录ID(移动操作)'',
      `new_parent_id` varchar(128) NULL DEFAULT NULL COMMENT ''新父目录ID(移动操作)'',
      `result` varchar(20) NULL DEFAULT NULL COMMENT ''操作结果'',
      `error_message` text NULL COMMENT ''错误信息'',
      PRIMARY KEY (`id`),
      INDEX `idx_object` (`object_type`, `object_id`),
      INDEX `idx_user` (`operator_id`),
      INDEX `idx_time` (`operation_time` DESC),
      INDEX `idx_type` (`operation_type`)
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = ''文件操作日志表''; SELECT ''file_audit_log 表创建成功 ✓'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================
-- 检查并创建 file_permission 表
-- =========================================
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'free-fs' AND table_name = 'file_permission');

SET @sql = IF(@table_exists > 0,
    'SELECT ''file_permission 表已存在 ✓'' AS message',
    'CREATE TABLE `file_permission` (
      `id` varchar(128) NOT NULL COMMENT ''主键ID'',
      `object_type` varchar(20) NOT NULL COMMENT ''对象类型：FILE/FOLDER'',
      `object_id` varchar(128) NOT NULL COMMENT ''对象ID'',
      `subject_type` varchar(20) NOT NULL COMMENT ''主体类型：USER/ROLE'',
      `subject_id` varchar(128) NOT NULL COMMENT ''主体ID（用户ID或角色ID）'',
      `permission_type` varchar(50) NULL DEFAULT NULL COMMENT ''权限类型'',
      `can_read` tinyint(1) NULL DEFAULT 0 COMMENT ''读取权限'',
      `can_write` tinyint(1) NULL DEFAULT 0 COMMENT ''写入权限'',
      `can_delete` tinyint(1) NULL DEFAULT 0 COMMENT ''删除权限'',
      `can_manage` tinyint(1) NULL DEFAULT 0 COMMENT ''管理权限'',
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''更新时间'',
      PRIMARY KEY (`id`),
      UNIQUE INDEX `uk_permission` (`object_type`, `object_id`, `subject_type`, `subject_id`),
      INDEX `idx_object` (`object_type`, `object_id`),
      INDEX `idx_subject` (`subject_type`, `subject_id`)
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = ''文件权限表''; SELECT ''file_permission 表创建成功 ✓'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =========================================
-- 最后显示所有相关表
-- =========================================
SELECT '检查完成！以下是所有 file_ 开头的表：' AS message;
SHOW TABLES FROM `free-fs` LIKE 'file_%';
