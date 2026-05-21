package com.xddcodec.fs.file.domain.dto;

import com.xddcodec.fs.framework.common.domain.PageQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件权限查询条件 DTO
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class FilePermissionPageQry extends PageQuery implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 对象类型：folder-目录, file-文件
     */
    private String objectType;

    /**
     * 对象ID
     */
    private String objectId;

    /**
     * 授权对象类型：user-用户, role-角色
     */
    private String granteeType;

    /**
     * 授权对象ID
     */
    private String granteeId;

    /**
     * 状态：0-正常, 1-禁用
     */
    private Integer status;
}
