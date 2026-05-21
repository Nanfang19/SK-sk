package com.xddcodec.fs.file.service;

import com.mybatisflex.core.service.IService;
import com.xddcodec.fs.file.domain.FilePermission;
import com.xddcodec.fs.file.domain.dto.FilePermissionCmd;
import com.xddcodec.fs.file.domain.dto.FilePermissionPageQry;
import com.xddcodec.fs.file.domain.vo.FilePermissionVO;
import com.xddcodec.fs.framework.common.domain.PageResult;

/**
 * 文件权限 Service
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
public interface FilePermissionService extends IService<FilePermission> {

    /**
     * 分页查询权限
     *
     * @param qry
     * @return
     */
    PageResult<FilePermissionVO> getPages(FilePermissionPageQry qry);

    /**
     * 获取对象的所有权限
     *
     * @param objectType
     * @param objectId
     * @return
     */
    PageResult<FilePermissionVO> getObjectPermissions(String objectType, String objectId);

    /**
     * 创建权限
     *
     * @param cmd
     * @return
     */
    FilePermissionVO createPermission(FilePermissionCmd cmd);

    /**
     * 更新权限
     *
     * @param cmd
     */
    void updatePermission(FilePermissionCmd cmd);

    /**
     * 删除权限
     *
     * @param id
     */
    void deletePermission(String id);

    /**
     * 检查用户是否有指定权限
     *
     * @param userId
     * @param objectType
     * @param objectId
     * @param permissionType read/write/delete/manage
     * @return
     */
    boolean hasPermission(String userId, String objectType, String objectId, String permissionType);

    /**
     * 检查用户是否有读取权限
     *
     * @param fileId
     * @param userId
     * @return
     */
    boolean hasReadPermission(String fileId, String userId);

    /**
     * 检查用户是否有写入权限
     *
     * @param fileId
     * @param userId
     * @return
     */
    boolean hasWritePermission(String fileId, String userId);

    /**
     * 检查用户是否有删除权限
     *
     * @param fileId
     * @param userId
     * @return
     */
    boolean hasDeletePermission(String fileId, String userId);

    /**
     * 检查用户是否有管理权限
     *
     * @param fileId
     * @param userId
     * @return
     */
    boolean hasManagePermission(String fileId, String userId);
}
