SET NAMES utf8mb4;

DROP TABLE IF EXISTS `file_permission`;
CREATE TABLE `file_permission` (
  `id` varchar(128) NOT NULL COMMENT '主键ID',
  `object_type` varchar(20) NOT NULL COMMENT '对象类型：folder-目录, file-文件',
  `object_id` varchar(128) NOT NULL COMMENT '对象ID',
  `workspace_id` varchar(128) NULL DEFAULT NULL COMMENT '所属工作空间ID',
  `grantee_type` varchar(20) NOT NULL COMMENT '授权对象类型：user-用户, role-角色',
  `grantee_id` varchar(128) NOT NULL COMMENT '授权对象ID',
  `can_read` tinyint(1) NULL DEFAULT 0 COMMENT '读取权限',
  `can_write` tinyint(1) NULL DEFAULT 0 COMMENT '写入权限',
  `can_delete` tinyint(1) NULL DEFAULT 0 COMMENT '删除权限',
  `can_manage` tinyint(1) NULL DEFAULT 0 COMMENT '管理权限',
  `inherit_parent` tinyint(1) NULL DEFAULT 0 COMMENT '是否继承父目录权限',
  `priority` int NULL DEFAULT 0 COMMENT '权限优先级',
  `start_time` datetime NULL DEFAULT NULL COMMENT '权限生效开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '权限生效结束时间',
  `creator_id` varchar(128) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int NULL DEFAULT 0 COMMENT '状态：0-正常, 1-禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_object` (`object_type` ASC, `object_id` ASC) USING BTREE,
  INDEX `idx_grantee` (`grantee_type` ASC, `grantee_id` ASC) USING BTREE,
  INDEX `idx_workspace` (`workspace_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件权限表' ROW_FORMAT = DYNAMIC;

SELECT 'file_permission 表重建完成！' AS message;
