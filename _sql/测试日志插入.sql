
-- 测试插入一条日志记录
USE `free-fs`;

-- 插入一条测试记录
INSERT INTO file_audit_log 
(id, operation_type, object_type, object_id, object_name, operator_id, operation_time, result)
VALUES
(UUID(), 'RENAME', 'file', 'test-file-id', '测试文件.txt', '1', NOW(), 'success');

-- 查看插入的记录
SELECT * FROM file_audit_log ORDER BY operation_time DESC LIMIT 5;
