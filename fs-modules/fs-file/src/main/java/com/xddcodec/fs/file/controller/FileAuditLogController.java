package com.xddcodec.fs.file.controller;

import com.xddcodec.fs.file.domain.dto.FileAuditLogPageQry;
import com.xddcodec.fs.file.domain.vo.FileAuditLogVO;
import com.xddcodec.fs.file.service.FileAuditLogService;
import com.xddcodec.fs.framework.common.domain.PageResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 文件操作日志控制器
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Validated
@RestController
@RequestMapping("/apis/file-audit-logs")
@RequiredArgsConstructor
@Tag(name = "文件操作日志")
public class FileAuditLogController {

    private final FileAuditLogService fileAuditLogService;

    @Operation(summary = "分页获取文件操作日志列表")
    @GetMapping("/pages")
    public PageResult<FileAuditLogVO> getPages(FileAuditLogPageQry qry) {
        return fileAuditLogService.getPages(qry);
    }

    @Operation(summary = "获取文件的操作历史")
    @GetMapping("/file/{fileId}/history")
    public PageResult<FileAuditLogVO> getFileHistory(
            @PathVariable String fileId,
            @RequestParam(required = false, defaultValue = "1") Integer page,
            @RequestParam(required = false, defaultValue = "20") Integer pageSize) {
        return fileAuditLogService.getFileHistory(fileId, page, pageSize);
    }
}
