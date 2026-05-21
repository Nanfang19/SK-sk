package com.xddcodec.fs.file.domain.vo;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件权限 VO
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
public class FilePermissionVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private String id;
    private String objectType;
    private String objectId;
    private String workspaceId;
    private String granteeType;
    private String granteeId;
    private Boolean canRead;
    private Boolean canWrite;
    private Boolean canDelete;
    private Boolean canManage;
    private Boolean inheritParent;
    private Integer priority;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private String creatorId;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer status;
}
