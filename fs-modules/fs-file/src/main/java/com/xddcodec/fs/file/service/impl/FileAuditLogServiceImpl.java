package com.xddcodec.fs.file.service.impl;

import cn.hutool.core.util.IdUtil;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import com.xddcodec.fs.file.domain.FileAuditLog;
import com.xddcodec.fs.file.domain.dto.FileAuditLogPageQry;
import com.xddcodec.fs.file.domain.vo.FileAuditLogVO;
import com.xddcodec.fs.file.mapper.FileAuditLogMapper;
import com.xddcodec.fs.file.service.FileAuditLogService;
import com.xddcodec.fs.framework.common.domain.PageResult;
import com.xddcodec.fs.framework.common.utils.StringUtils;
import io.github.linpeilie.Converter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

import static com.xddcodec.fs.file.domain.table.FileAuditLogTableDef.FILE_AUDIT_LOG;

/**
 * 文件操作日志 Service Impl
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FileAuditLogServiceImpl extends ServiceImpl<FileAuditLogMapper, FileAuditLog> implements FileAuditLogService {

    private final Converter converter;

    @Override
    public PageResult<FileAuditLogVO> getPages(FileAuditLogPageQry qry) {
        Page<FileAuditLog> page = new Page<>(qry.getPage(), qry.getPageSize());
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderBy(FILE_AUDIT_LOG.OPERATION_TIME.desc());

        // 关键字搜索
        if (StringUtils.isNotEmpty(qry.getKeyword())) {
            queryWrapper.where(
                    FILE_AUDIT_LOG.OPERATOR_NAME.like(qry.getKeyword() + "%")
                            .or(FILE_AUDIT_LOG.OBJECT_NAME.like(qry.getKeyword() + "%"))
                            .or(FILE_AUDIT_LOG.IP_ADDRESS.like(qry.getKeyword() + "%"))
            );
        }

        // 操作类型过滤
        if (StringUtils.isNotEmpty(qry.getOperationType())) {
            queryWrapper.and(FILE_AUDIT_LOG.OPERATION_TYPE.eq(qry.getOperationType()));
        }

        // 对象类型过滤
        if (StringUtils.isNotEmpty(qry.getObjectType())) {
            queryWrapper.and(FILE_AUDIT_LOG.OBJECT_TYPE.eq(qry.getObjectType()));
        }

        // 操作者过滤
        if (StringUtils.isNotEmpty(qry.getOperatorId())) {
            queryWrapper.and(FILE_AUDIT_LOG.OPERATOR_ID.eq(qry.getOperatorId()));
        }

        // 时间范围过滤
        if (qry.getStartTime() != null) {
            queryWrapper.and(FILE_AUDIT_LOG.OPERATION_TIME.ge(qry.getStartTime()));
        }
        if (qry.getEndTime() != null) {
            queryWrapper.and(FILE_AUDIT_LOG.OPERATION_TIME.le(qry.getEndTime()));
        }

        this.page(page, queryWrapper);
        Long total = page.getTotalRow();
        List<FileAuditLog> records = page.getRecords();
        List<FileAuditLogVO> vos = convertToVO(records);
        PageResult.PageRecord<FileAuditLogVO> pageRecord = new PageResult.PageRecord<>();
        pageRecord.setRecords(vos);
        pageRecord.setTotal(total);
        return PageResult.<FileAuditLogVO>builder().data(pageRecord).code(200).build();
    }

    @Override
    public PageResult<FileAuditLogVO> getFileHistory(String fileId, Integer pageNum, Integer pageSize) {
        Page<FileAuditLog> page = new Page<>(pageNum != null ? pageNum : 1, pageSize != null ? pageSize : 20);
        QueryWrapper queryWrapper = new QueryWrapper()
                .where(FILE_AUDIT_LOG.OBJECT_ID.eq(fileId))
                .and(FILE_AUDIT_LOG.OBJECT_TYPE.in("file", "FILE"))
                .orderBy(FILE_AUDIT_LOG.OPERATION_TIME.desc());

        this.page(page, queryWrapper);
        Long total = page.getTotalRow();
        List<FileAuditLog> records = page.getRecords();
        List<FileAuditLogVO> vos = convertToVO(records);
        PageResult.PageRecord<FileAuditLogVO> pageRecord = new PageResult.PageRecord<>();
        pageRecord.setRecords(vos);
        pageRecord.setTotal(total);
        return PageResult.<FileAuditLogVO>builder().data(pageRecord).code(200).build();
    }
    
    /**
     * 手动将 FileAuditLog 转换为 FileAuditLogVO
     */
    private List<FileAuditLogVO> convertToVO(List<FileAuditLog> records) {
        List<FileAuditLogVO> vos = new java.util.ArrayList<>();
        for (FileAuditLog record : records) {
            FileAuditLogVO vo = new FileAuditLogVO();
            vo.setId(record.getId());
            vo.setOperationType(record.getOperationType());
            vo.setObjectType(record.getObjectType());
            vo.setObjectId(record.getObjectId());
            vo.setObjectName(record.getObjectName());
            vo.setOperatorId(record.getOperatorId());
            vo.setUserId(record.getUserId());
            vo.setOperatorName(record.getOperatorName());
            vo.setWorkspaceId(record.getWorkspaceId());
            vo.setOperationTime(record.getOperationTime());
            vo.setIpAddress(record.getIpAddress());
            vo.setIp(record.getIp());
            vo.setDetail(record.getDetail());
            vo.setResult(record.getResult());
            vo.setErrorMessage(record.getErrorMessage());
            vo.setOldName(record.getOldName());
            vo.setNewName(record.getNewName());
            vo.setOldParentId(record.getOldParentId());
            vo.setNewParentId(record.getNewParentId());
            vos.add(vo);
        }
        return vos;
    }

    @Override
    public void logFileUpload(String fileId, String fileName, String userId) {
        try {
            FileAuditLog auditLog = new FileAuditLog();
            auditLog.setId(IdUtil.simpleUUID());
            auditLog.setOperationType("UPLOAD");
            auditLog.setObjectType("file");
            auditLog.setObjectId(fileId);
            auditLog.setObjectName(fileName);
            auditLog.setOperatorId(userId);
            auditLog.setOperationTime(LocalDateTime.now());
            auditLog.setResult("success");

            this.save(auditLog);
            log.debug("文件上传日志记录成功: {}", fileName);
        } catch (Exception e) {
            log.error("文件上传日志记录失败", e);
        }
    }

    @Override
    public void logFileDownload(String fileId, String fileName, String userId) {
        try {
            FileAuditLog auditLog = new FileAuditLog();
            auditLog.setId(IdUtil.simpleUUID());
            auditLog.setOperationType("DOWNLOAD");
            auditLog.setObjectType("file");
            auditLog.setObjectId(fileId);
            auditLog.setObjectName(fileName);
            auditLog.setOperatorId(userId);
            auditLog.setOperationTime(LocalDateTime.now());
            auditLog.setResult("success");

            this.save(auditLog);
            log.debug("文件下载日志记录成功: {}", fileName);
        } catch (Exception e) {
            log.error("文件下载日志记录失败", e);
        }
    }

    @Override
    public void logFileDelete(String fileId, String fileName, String userId, String replace) {
        try {
            FileAuditLog auditLog = new FileAuditLog();
            auditLog.setId(IdUtil.simpleUUID());
            auditLog.setOperationType("DELETE");
            auditLog.setObjectType("file");
            auditLog.setObjectId(fileId);
            auditLog.setObjectName(fileName);
            auditLog.setOperatorId(userId);
            auditLog.setOperationTime(LocalDateTime.now());
            auditLog.setResult("success");

            this.save(auditLog);
            log.debug("文件删除日志记录成功: {}", fileName);
        } catch (Exception e) {
            log.error("文件删除日志记录失败", e);
        }
    }

    @Override
    public void logFileRename(String fileId, String oldName, String newName, String userId) {
        try {
            log.info("========== 开始记录文件重命名日志 ==========");
            log.info("fileId: {}, oldName: {}, newName: {}, userId: {}", fileId, oldName, newName, userId);
            
            FileAuditLog auditLog = new FileAuditLog();
            auditLog.setId(IdUtil.simpleUUID());
            auditLog.setOperationType("RENAME");
            auditLog.setObjectType("file");
            auditLog.setObjectId(fileId);
            auditLog.setObjectName(newName);
            auditLog.setOldName(oldName);
            auditLog.setNewName(newName);
            auditLog.setOperatorId(userId);
            auditLog.setOperationTime(LocalDateTime.now());
            auditLog.setDetail("{\"oldName\":\"" + oldName + "\",\"newName\":\"" + newName + "\"}");
            auditLog.setResult("success");

            log.info("准备保存审计日志: {}", auditLog);
            boolean result = this.save(auditLog);
            log.info("保存审计日志结果: {}", result);
            log.info("文件重命名日志记录成功: {} -> {}", oldName, newName);
            log.info("========== 文件重命名日志记录完成 ==========");
        } catch (Exception e) {
            log.error("文件重命名日志记录失败", e);
            log.error("异常堆栈: ", e);
        }
    }

    @Override
    public void logFileMove(String fileId, String fileName, String oldDir, String newDir, String userId) {
        try {
            FileAuditLog auditLog = new FileAuditLog();
            auditLog.setId(IdUtil.simpleUUID());
            auditLog.setOperationType("MOVE");
            auditLog.setObjectType("file");
            auditLog.setObjectId(fileId);
            auditLog.setObjectName(fileName);
            auditLog.setOldParentId(oldDir);
            auditLog.setNewParentId(newDir);
            auditLog.setOperatorId(userId);
            auditLog.setOperationTime(LocalDateTime.now());
            auditLog.setDetail("{\"oldDir\":\"" + (oldDir != null ? oldDir : "") + "\",\"newDir\":\"" + (newDir != null ? newDir : "") + "\"}");
            auditLog.setResult("success");

            this.save(auditLog);
            log.debug("文件移动日志记录成功: {}", fileName);
        } catch (Exception e) {
            log.error("文件移动日志记录失败", e);
        }
    }

    /**
     * 记录操作日志
     *
     * @param operationType 操作类型
     * @param objectType    对象类型
     * @param objectId      对象ID
     * @param objectName    对象名称
     * @param result        结果
     * @param errorMessage  错误信息
     */
    public void log(String operationType, String objectType, String objectId, String objectName,
                    String result, String errorMessage) {
        try {
            FileAuditLog auditLog = new FileAuditLog();
            auditLog.setId(IdUtil.simpleUUID());
            auditLog.setOperationType(operationType);
            auditLog.setObjectType(objectType);
            auditLog.setObjectId(objectId);
            auditLog.setObjectName(objectName);
            auditLog.setOperationTime(LocalDateTime.now());
            auditLog.setResult(result);
            auditLog.setErrorMessage(errorMessage);

            this.save(auditLog);
            log.debug("文件操作日志记录成功: {} - {}", operationType, objectName);
        } catch (Exception e) {
            log.error("文件操作日志记录失败", e);
        }
    }
}
