UPDATE `sys_role` SET `role_name` = '系统管理员', `description` = '拥有系统全部权限，可管理所有用户、角色、权限及系统配置' WHERE `role_code` = 'admin';
UPDATE `sys_role` SET `role_name` = '部门管理员', `description` = '可管理本部门空间、成员权限、查看操作日志及存储空间' WHERE `role_code` = 'department_admin';
UPDATE `sys_role` SET `role_name` = '普通员工', `description` = '可进行文件上传、下载、预览、分享等日常操作，可查看文件版本历史' WHERE `role_code` = 'member';
UPDATE `sys_role` SET `role_name` = '受限成员', `description` = '仅可浏览、预览与下载' WHERE `role_code` = 'viewer';

INSERT IGNORE INTO `sys_role` (`workspace_id`, `role_code`, `role_name`, `description`, `role_type`, `created_at`, `updated_at`)
SELECT `workspace_id`, 'department_admin', '部门管理员', '可管理本部门空间、成员权限、查看操作日志及存储空间', 0, NOW(), NOW()
FROM `sys_workspace`
WHERE NOT EXISTS (SELECT 1 FROM `sys_role` WHERE `workspace_id` = `sys_workspace`.`id` AND `role_code` = 'department_admin');

INSERT IGNORE INTO `sys_role_permission` (`role_id`, `role_code`, `permission_code`)
SELECT r.id, 'department_admin', p.permission_code
FROM `sys_role` r
CROSS JOIN `sys_permission` p
WHERE r.role_code = 'department_admin'
AND NOT EXISTS (SELECT 1 FROM `sys_role_permission` WHERE role_id = r.id AND permission_code = p.permission_code);

SELECT * FROM sys_role;
