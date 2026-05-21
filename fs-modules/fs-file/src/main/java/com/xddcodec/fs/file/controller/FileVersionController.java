package com.xddcodec.fs.file.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.xddcodec.fs.file.domain.dto.FileVersionPageQry;
import com.xddcodec.fs.file.domain.vo.FileVersionVO;
import com.xddcodec.fs.file.service.FileVersionService;
import com.xddcodec.fs.framework.common.domain.PageResult;
import com.xddcodec.fs.framework.common.domain.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 文件版本控制器
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Validated
@RestController
@RequestMapping("/apis/file-versions")
@RequiredArgsConstructor
@Tag(name = "文件版本管理")
public class FileVersionController {

    private final FileVersionService fileVersionService;

    @Operation(summary = "分页获取文件版本列表")
    @GetMapping("/pages")
    public PageResult<FileVersionVO> getPages(FileVersionPageQry qry) {
        return fileVersionService.getPages(qry);
    }

    @Operation(summary = "获取文件的所有版本列表")
    @GetMapping("/file/{fileId}")
    public PageResult<FileVersionVO> getFileVersions(
            @PathVariable String fileId,
            @RequestParam(required = false, defaultValue = "1") Integer page,
            @RequestParam(required = false, defaultValue = "20") Integer pageSize) {
        return fileVersionService.getFileVersions(fileId, page, pageSize);
    }

    @Operation(summary = "获取版本详情")
    @GetMapping("/{versionId}")
    public FileVersionVO getVersionDetail(@PathVariable String versionId) {
        return fileVersionService.getVersionDetail(versionId);
    }

    @Operation(summary = "回滚到指定版本")
    @PutMapping("/{versionId}/rollback")
    public Result<FileVersionVO> rollbackVersion(@PathVariable String versionId) {
        String userId = StpUtil.getLoginIdAsString();
        FileVersionVO result = fileVersionService.rollbackVersion(versionId, userId);
        return Result.ok(result);
    }

    @Operation(summary = "删除指定版本")
    @DeleteMapping("/{versionId}")
    public Result<Void> deleteVersion(@PathVariable String versionId) {
        fileVersionService.deleteVersion(versionId);
        return Result.ok();
    }
}
