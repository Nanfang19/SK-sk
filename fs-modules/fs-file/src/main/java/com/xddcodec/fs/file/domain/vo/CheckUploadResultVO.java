package com.xddcodec.fs.file.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckUploadResultVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 是否秒传
     */
    private Boolean isQuickUpload;

    /**
     * 秒传成功后的文件信息
     */
    private String fileId;

    /**
     * 任务ID
     */
    private String taskId;
    /**
     * 上传ID
     */
    private String uploadId;

    /**
     * 提示信息
     */
    private String message;

    /**
     * 是否存在同名文件
     */
    private Boolean hasDuplicate;

    /**
     * 同名文件信息
     */
    private DuplicateFileInfo duplicateFile;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class DuplicateFileInfo implements Serializable {
        @Serial
        private static final long serialVersionUID = 1L;
        
        private String fileId;
        private String fileName;
        private Long fileSize;
        private String uploadTime;
    }
}
