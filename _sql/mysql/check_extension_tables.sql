-- 检查扩展表是否存在
USE `free-fs`;

SELECT '正在检查扩展表...' AS message;

-- 检查 file_version 表
SELECT 
    'file_version' AS table_name,
    CASE 
        WHEN COUNT(*) > 0 THEN '✅ 已存在'
        ELSE '❌ 不存在'
    END AS status
FROM information_schema.tables 
WHERE table_schema = 'free-fs' AND table_name = 'file_version';

-- 检查 file_audit_log 表
SELECT 
    'file_audit_log' AS table_name,
    CASE 
        WHEN COUNT(*) > 0 THEN '✅ 已存在'
        ELSE '❌ 不存在'
    END AS status
FROM information_schema.tables 
WHERE table_schema = 'free-fs' AND table_name = 'file_audit_log';

-- 检查 file_permission 表
SELECT 
    'file_permission' AS table_name,
    CASE 
        WHEN COUNT(*) > 0 THEN '✅ 已存在'
        ELSE '❌ 不存在'
    END AS status
FROM information_schema.tables 
WHERE table_schema = 'free-fs' AND table_name = 'file_permission';

-- 如果表存在，显示表结构
SET @table_exists = (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'free-fs' AND table_name = 'file_audit_log');

SET @sql = IF(@table_exists > 0,
    'SHOW CREATE TABLE `file_audit_log`',
    'SELECT ''file_audit_log 表不存在'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
