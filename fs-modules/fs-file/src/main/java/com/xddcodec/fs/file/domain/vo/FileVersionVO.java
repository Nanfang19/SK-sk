package com.xddcodec.fs.file.domain.vo;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件版本 VO
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
public class FileVersionVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private String id;
    private String fileId;
    private Integer versionNumber;
    private String objectKey;
    private String originalName;
    private Long size;
    private String contentMd5;
    private String remark;
    private String creatorId;
    private LocalDateTime createTime;
    private Boolean isCurrent;
}
