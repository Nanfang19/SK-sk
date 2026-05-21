package com.xddcodec.fs.file.domain.vo;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

@Data
public class FileTypeStatsVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private String category;

    private String categoryName;

    private Long count;

    private Long size;

    public FileTypeStatsVO() {
    }

    public FileTypeStatsVO(String category, String categoryName, Long count, Long size) {
        this.category = category;
        this.categoryName = categoryName;
        this.count = count;
        this.size = size;
    }
}
