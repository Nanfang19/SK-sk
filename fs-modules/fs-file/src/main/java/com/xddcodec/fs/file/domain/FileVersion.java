package com.xddcodec.fs.file.domain;

import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文件版本实体
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Data
@Table("file_version")
public class FileVersion implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @Id(keyType = KeyType.None)
    private String id;

    /**
     * 关联的文件ID
     */
    private String fileId;

    /**
     * 版本号
     */
    private Integer versionNumber;

    /**
     * 存储的对象键
     */
    private String objectKey;

    /**
     * 文件原始名称
     */
    private String originalName;

    /**
     * 文件大小（字节）
     */
    private Long size;

    /**
     * 文件MD5值
     */
    private String contentMd5;

    /**
     * 版本备注
     */
    private String remark;

    /**
     * 创建者ID
     */
    private String creatorId;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 是否为当前版本
     */
    private Boolean isCurrent;
}
