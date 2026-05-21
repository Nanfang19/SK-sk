package com.xddcodec.fs.file.domain;

import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件操作日志实体
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
@Table("file_audit_log")
public class FileAuditLog implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @Id(keyType = KeyType.None)
    private String id;

    /**
     * 操作类型
     */
    private String operationType;

    /**
     * 对象类型
     */
    private String objectType;

    /**
     * 对象ID
     */
    private String objectId;

    /**
     * 对象名称
     */
    private String objectName;

    /**
     * 操作者ID
     */
    private String operatorId;
    
    /**
     * 用户ID（兼容前端）
     */
    private String userId;

    /**
     * 操作者名称
     */
    private String operatorName;

    /**
     * 所属工作空间ID
     */
    private String workspaceId;

    /**
     * 操作时间
     */
    private LocalDateTime operationTime;

    /**
     * IP地址
     */
    private String ipAddress;
    
    /**
     * IP（兼容前端）
     */
    private String ip;

    /**
     * 操作详情（JSON格式）
     */
    private String detail;
    
    /**
     * 旧名称（兼容前端）
     */
    private String oldName;
    
    /**
     * 新名称（兼容前端）
     */
    private String newName;
    
    /**
     * 旧父目录ID（兼容前端）
     */
    private String oldParentId;
    
    /**
     * 新父目录ID（兼容前端）
     */
    private String newParentId;

    /**
     * 操作结果
     */
    private String result;

    /**
     * 错误信息
     */
    private String errorMessage;
    
    /**
     * 兼容性方法：设置操作者ID时同时设置userId
     */
    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
        this.userId = operatorId;
    }
    
    /**
     * 兼容性方法：设置IP地址时同时设置ip
     */
    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
        this.ip = ipAddress;
    }
}
