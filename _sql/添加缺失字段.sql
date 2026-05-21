
-- 给 file_audit_log 表添加缺失的字段
USE `free-fs`;

-- 添加 ip_address 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `ip_address` varchar(50) NULL COMMENT 'IP地址' AFTER `operation_time`;

-- 添加 ip 字段（兼容前端）
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `ip` varchar(50) NULL COMMENT 'IP地址(兼容前端)' AFTER `ip_address`;

-- 添加 detail 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `detail` text NULL COMMENT '操作详情（JSON格式）' AFTER `ip`;

-- 添加 old_name 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `old_name` varchar(255) NULL COMMENT '旧名称(重命名操作)' AFTER `detail`;

-- 添加 new_name 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `new_name` varchar(255) NULL COMMENT '新名称(重命名操作)' AFTER `old_name`;

-- 添加 old_parent_id 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `old_parent_id` varchar(128) NULL COMMENT '旧父目录ID(移动操作)' AFTER `new_name`;

-- 添加 new_parent_id 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `new_parent_id` varchar(128) NULL COMMENT '新父目录ID(移动操作)' AFTER `old_parent_id`;

-- 添加 result 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `result` varchar(20) NULL COMMENT '操作结果' AFTER `new_parent_id`;

-- 添加 error_message 字段
ALTER TABLE `file_audit_log` ADD COLUMN IF NOT EXISTS `error_message` text NULL COMMENT '错误信息' AFTER `result`;

-- 查看最终表结构
DESC `file_audit_log`;
