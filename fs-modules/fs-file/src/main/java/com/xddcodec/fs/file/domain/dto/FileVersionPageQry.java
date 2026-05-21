package com.xddcodec.fs.file.domain.dto;

import com.xddcodec.fs.framework.common.domain.PageQuery;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.io.Serializable;

/**
 * 文件版本查询条件 DTO
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class FileVersionPageQry extends PageQuery implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 文件ID
     */
    private String fileId;

    /**
     * 版本备注关键词
     */
    private String keyword;
}
