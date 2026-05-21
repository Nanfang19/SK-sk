package com.xddcodec.fs.file.domain.dto;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件权限创建/更新 DTO
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
public class FilePermissionCmd implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID（更新时需要）
     */
    private String id;

    /**
     * 对象类型：folder-目录, file-文件
     */
    private String objectType;

    /**
     * 对象ID
     */
    private String objectId;

    /**
     * 所属工作空间ID
     */
    private String workspaceId;

    /**
     * 授权对象类型：user-用户, role-角色
     */
    private String granteeType;

    /**
     * 授权对象ID
     */
    private String granteeId;

    /**
     * 读权限
     */
    private Boolean canRead;

    /**
     * 写权限
     */
    private Boolean canWrite;

    /**
     * 删除权限
     */
    private Boolean canDelete;

    /**
     * 管理权限
     */
    private Boolean canManage;

    /**
     * 是否继承父目录权限
     */
    private Boolean inheritParent;

    /**
     * 权限优先级
     */
    private Integer priority;

    /**
     * 权限生效开始时间
     */
    private LocalDateTime startTime;

    /**
     * 权限生效结束时间
     */
    private LocalDateTime endTime;
}
