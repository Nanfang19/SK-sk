package com.xddcodec.fs.file.service;

import com.mybatisflex.core.service.IService;
import com.xddcodec.fs.file.domain.FileVersion;
import com.xddcodec.fs.file.domain.dto.FileVersionPageQry;
import com.xddcodec.fs.file.domain.vo.FileVersionVO;
import com.xddcodec.fs.framework.common.domain.PageResult;

/**
 * 文件版本 Service
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
public interface FileVersionService extends IService<FileVersion> {

    /**
     * 分页查询文件版本
     *
     * @param qry
     * @return
     */
    PageResult<FileVersionVO> getPages(FileVersionPageQry qry);

    /**
     * 获取文件的所有版本列表
     *
     * @param fileId
     * @param page
     * @param pageSize
     * @return
     */
    PageResult<FileVersionVO> getFileVersions(String fileId, Integer page, Integer pageSize);

    /**
     * 获取版本详情
     *
     * @param versionId
     * @return
     */
    FileVersionVO getVersionDetail(String versionId);

    FileVersionVO rollbackVersion(String versionId, String userId);

    void deleteVersion(String versionId);

    FileVersion createVersion(String fileId, String objectKey, String originalName,
                              Long size, String contentMd5, String remark, String creatorId);
}
