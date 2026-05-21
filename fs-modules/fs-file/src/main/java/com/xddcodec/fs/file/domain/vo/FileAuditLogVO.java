package com.xddcodec.fs.file.domain.vo;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件操作日志 VO
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
public class FileAuditLogVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private String id;
    private String operationType;
    private String objectType;
    private String objectId;
    private String objectName;
    private String operatorId;
    private String userId;
    private String operatorName;
    private String workspaceId;
    private LocalDateTime operationTime;
    private String ipAddress;
    private String ip;
    private String detail;
    private String result;
    private String errorMessage;
    private String oldName;
    private String newName;
    private String oldParentId;
    private String newParentId;
}
