package com.xddcodec.fs.file.service;

import com.mybatisflex.core.service.IService;
import com.xddcodec.fs.file.domain.FileAuditLog;
import com.xddcodec.fs.file.domain.dto.FileAuditLogPageQry;
import com.xddcodec.fs.file.domain.vo.FileAuditLogVO;
import com.xddcodec.fs.framework.common.domain.PageResult;

/**
 * 文件操作日志 Service
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
public interface FileAuditLogService extends IService<FileAuditLog> {

    /**
     * 分页查询操作日志
     *
     * @param qry
     * @return
     */
    PageResult<FileAuditLogVO> getPages(FileAuditLogPageQry qry);

    /**
     * 获取文件的操作历史
     *
     * @param fileId
     * @return
     */
    PageResult<FileAuditLogVO> getFileHistory(String fileId, Integer page, Integer pageSize);

    /**
     * 记录文件上传日志
     *
     * @param fileId
     * @param fileName
     * @param userId
     */
    void logFileUpload(String fileId, String fileName, String userId);

    /**
     * 记录文件下载日志
     *
     * @param fileId
     * @param fileName
     * @param userId
     */
    void logFileDownload(String fileId, String fileName, String userId);

    /**
     * 记录文件删除日志
     *
     * @param fileId
     * @param fileName
     * @param userId
     * @param replace
     */
    void logFileDelete(String fileId, String fileName, String userId, String replace);

    /**
     * 记录文件重命名日志
     *
     * @param fileId
     * @param oldName
     * @param newName
     * @param userId
     */
    void logFileRename(String fileId, String oldName, String newName, String userId);

    /**
     * 记录文件移动日志
     *
     * @param fileId
     * @param fileName
     * @param oldDir
     * @param newDir
     * @param userId
     */
    void logFileMove(String fileId, String fileName, String oldDir, String newDir, String userId);
}
