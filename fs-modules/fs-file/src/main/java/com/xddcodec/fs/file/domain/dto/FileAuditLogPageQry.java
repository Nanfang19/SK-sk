package com.xddcodec.fs.file.domain.dto;

import com.xddcodec.fs.framework.common.domain.PageQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件操作日志查询条件 DTO
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class FileAuditLogPageQry extends PageQuery implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 关键字搜索
     */
    private String keyword;

    /**
     * 操作类型
     */
    private String operationType;

    /**
     * 对象类型
     */
    private String objectType;

    /**
     * 操作者ID
     */
    private String operatorId;

    /**
     * 开始时间
     */
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    private LocalDateTime endTime;
}
