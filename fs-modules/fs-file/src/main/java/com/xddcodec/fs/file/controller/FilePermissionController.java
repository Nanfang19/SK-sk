package com.xddcodec.fs.file.controller;

import com.xddcodec.fs.file.domain.dto.FilePermissionCmd;
import com.xddcodec.fs.file.domain.dto.FilePermissionPageQry;
import com.xddcodec.fs.file.domain.vo.FilePermissionVO;
import com.xddcodec.fs.file.service.FilePermissionService;
import com.xddcodec.fs.framework.common.domain.PageResult;
import com.xddcodec.fs.framework.common.domain.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 文件权限控制器
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Validated
@RestController
@RequestMapping("/apis/file-permissions")
@RequiredArgsConstructor
@Tag(name = "文件权限管理")
public class FilePermissionController {

    private final FilePermissionService filePermissionService;

    @Operation(summary = "分页获取权限列表")
    @GetMapping("/pages")
    public PageResult<FilePermissionVO> getPages(FilePermissionPageQry qry) {
        return filePermissionService.getPages(qry);
    }

    @Operation(summary = "获取对象的所有权限")
    @GetMapping("/object/{objectType}/{objectId}")
    public PageResult<FilePermissionVO> getObjectPermissions(
            @PathVariable String objectType,
            @PathVariable String objectId) {
        return filePermissionService.getObjectPermissions(objectType, objectId);
    }

    @Operation(summary = "创建权限")
    @PostMapping
    public Result<FilePermissionVO> createPermission(@RequestBody @Validated FilePermissionCmd cmd) {
        return Result.ok(filePermissionService.createPermission(cmd));
    }

    @Operation(summary = "更新权限")
    @PutMapping
    public Result<Void> updatePermission(@RequestBody @Validated FilePermissionCmd cmd) {
        filePermissionService.updatePermission(cmd);
        return Result.ok();
    }

    @Operation(summary = "删除权限")
    @DeleteMapping("/{id}")
    public Result<Void> deletePermission(@PathVariable String id) {
        filePermissionService.deletePermission(id);
        return Result.ok();
    }

    @Operation(summary = "检查权限")
    @GetMapping("/check")
    public boolean hasPermission(
            @RequestParam String userId,
            @RequestParam String objectType,
            @RequestParam String objectId,
            @RequestParam String permissionType) {
        return filePermissionService.hasPermission(userId, objectType, objectId, permissionType);
    }
}
