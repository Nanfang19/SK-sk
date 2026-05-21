package com.xddcodec.fs.file.service.impl;

import cn.hutool.core.util.IdUtil;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import com.xddcodec.fs.file.domain.FilePermission;
import com.xddcodec.fs.file.domain.dto.FilePermissionCmd;
import com.xddcodec.fs.file.domain.dto.FilePermissionPageQry;
import com.xddcodec.fs.file.domain.vo.FilePermissionVO;
import com.xddcodec.fs.file.mapper.FilePermissionMapper;
import com.xddcodec.fs.file.service.FilePermissionService;
import com.xddcodec.fs.framework.common.domain.PageResult;
import com.xddcodec.fs.framework.common.utils.StringUtils;
import io.github.linpeilie.Converter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

import static com.xddcodec.fs.file.domain.table.FilePermissionTableDef.FILE_PERMISSION;

/**
 * 文件权限 Service Impl
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FilePermissionServiceImpl extends ServiceImpl<FilePermissionMapper, FilePermission> implements FilePermissionService {

    private final Converter converter;

    @Override
    public PageResult<FilePermissionVO> getPages(FilePermissionPageQry qry) {
        Page<FilePermission> page = new Page<>(qry.getPage(), qry.getPageSize());
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderBy(FILE_PERMISSION.CREATE_TIME.desc());

        // 对象类型过滤
        if (StringUtils.isNotEmpty(qry.getObjectType())) {
            queryWrapper.and(FILE_PERMISSION.OBJECT_TYPE.eq(qry.getObjectType()));
        }

        // 对象ID过滤
        if (StringUtils.isNotEmpty(qry.getObjectId())) {
            queryWrapper.and(FILE_PERMISSION.OBJECT_ID.eq(qry.getObjectId()));
        }

        // 授权对象类型过滤
        if (StringUtils.isNotEmpty(qry.getGranteeType())) {
            queryWrapper.and(FILE_PERMISSION.GRANTEE_TYPE.eq(qry.getGranteeType()));
        }

        // 授权对象ID过滤
        if (StringUtils.isNotEmpty(qry.getGranteeId())) {
            queryWrapper.and(FILE_PERMISSION.GRANTEE_ID.eq(qry.getGranteeId()));
        }

        // 状态过滤
        if (qry.getStatus() != null) {
            queryWrapper.and(FILE_PERMISSION.STATUS.eq(qry.getStatus()));
        }

        this.page(page, queryWrapper);
        Long total = page.getTotalRow();
        List<FilePermission> records = page.getRecords();
        List<FilePermissionVO> vos = convertToVO(records);
        PageResult.PageRecord<FilePermissionVO> pageRecord = new PageResult.PageRecord<>();
        pageRecord.setRecords(vos);
        pageRecord.setTotal(total);
        return PageResult.<FilePermissionVO>builder().data(pageRecord).code(200).build();
    }

    @Override
    public PageResult<FilePermissionVO> getObjectPermissions(String objectType, String objectId) {
        Page<FilePermission> page = new Page<>(1, 100);
        QueryWrapper queryWrapper = new QueryWrapper()
                .where(FILE_PERMISSION.OBJECT_TYPE.eq(objectType))
                .and(FILE_PERMISSION.OBJECT_ID.eq(objectId))
                .and(FILE_PERMISSION.STATUS.eq(0))
                .orderBy(FILE_PERMISSION.PRIORITY.desc());

        this.page(page, queryWrapper);
        Long total = page.getTotalRow();
        List<FilePermission> records = page.getRecords();
        List<FilePermissionVO> vos = convertToVO(records);
        PageResult.PageRecord<FilePermissionVO> pageRecord = new PageResult.PageRecord<>();
        pageRecord.setRecords(vos);
        pageRecord.setTotal(total);
        return PageResult.<FilePermissionVO>builder().data(pageRecord).code(200).build();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public FilePermissionVO createPermission(FilePermissionCmd cmd) {
        FilePermission permission = new FilePermission();
        permission.setId(IdUtil.simpleUUID());
        permission.setObjectType(cmd.getObjectType());
        permission.setObjectId(cmd.getObjectId());
        permission.setWorkspaceId(cmd.getWorkspaceId());
        permission.setGranteeType(cmd.getGranteeType());
        permission.setGranteeId(cmd.getGranteeId());
        permission.setCanRead(cmd.getCanRead());
        permission.setCanWrite(cmd.getCanWrite());
        permission.setCanDelete(cmd.getCanDelete());
        permission.setCanManage(cmd.getCanManage());
        permission.setInheritParent(cmd.getInheritParent());
        permission.setPriority(cmd.getPriority() != null ? cmd.getPriority() : 0);
        permission.setStartTime(cmd.getStartTime());
        permission.setEndTime(cmd.getEndTime());
        permission.setCreatorId(cmd.getGranteeId());
        permission.setCreateTime(LocalDateTime.now());
        permission.setUpdateTime(LocalDateTime.now());
        permission.setStatus(0);

        this.save(permission);
        log.info("创建文件权限成功: {}", permission);

        return convertToVO(permission);
    }
    
    /**
     * 手动将 FilePermission 转换为 FilePermissionVO
     */
    private List<FilePermissionVO> convertToVO(List<FilePermission> records) {
        List<FilePermissionVO> vos = new java.util.ArrayList<>();
        for (FilePermission record : records) {
            vos.add(convertToVO(record));
        }
        return vos;
    }
    
    /**
     * 手动将单个 FilePermission 转换为 FilePermissionVO
     */
    private FilePermissionVO convertToVO(FilePermission record) {
        FilePermissionVO vo = new FilePermissionVO();
        vo.setId(record.getId());
        vo.setObjectType(record.getObjectType());
        vo.setObjectId(record.getObjectId());
        vo.setWorkspaceId(record.getWorkspaceId());
        vo.setGranteeType(record.getGranteeType());
        vo.setGranteeId(record.getGranteeId());
        vo.setCanRead(record.getCanRead());
        vo.setCanWrite(record.getCanWrite());
        vo.setCanDelete(record.getCanDelete());
        vo.setCanManage(record.getCanManage());
        vo.setInheritParent(record.getInheritParent());
        vo.setPriority(record.getPriority());
        vo.setStartTime(record.getStartTime());
        vo.setEndTime(record.getEndTime());
        vo.setCreatorId(record.getCreatorId());
        vo.setCreateTime(record.getCreateTime());
        vo.setUpdateTime(record.getUpdateTime());
        vo.setStatus(record.getStatus());
        return vo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updatePermission(FilePermissionCmd cmd) {
        if (cmd.getId() == null) {
            throw new RuntimeException("权限ID不能为空");
        }

        FilePermission permission = this.getById(cmd.getId());
        if (permission == null) {
            throw new RuntimeException("权限不存在");
        }

        permission.setCanRead(cmd.getCanRead());
        permission.setCanWrite(cmd.getCanWrite());
        permission.setCanDelete(cmd.getCanDelete());
        permission.setCanManage(cmd.getCanManage());
        permission.setInheritParent(cmd.getInheritParent());
        permission.setPriority(cmd.getPriority() != null ? cmd.getPriority() : 0);
        permission.setStartTime(cmd.getStartTime());
        permission.setEndTime(cmd.getEndTime());
        permission.setUpdateTime(LocalDateTime.now());

        this.updateById(permission);
        log.info("更新文件权限成功: {}", permission);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deletePermission(String id) {
        this.removeById(id);
        log.info("删除文件权限成功: {}", id);
    }

    @Override
    public boolean hasPermission(String userId, String objectType, String objectId, String permissionType) {
        QueryWrapper queryWrapper = new QueryWrapper()
                .where(FILE_PERMISSION.OBJECT_TYPE.eq(objectType))
                .and(FILE_PERMISSION.OBJECT_ID.eq(objectId))
                .and(FILE_PERMISSION.GRANTEE_TYPE.eq("user"))
                .and(FILE_PERMISSION.GRANTEE_ID.eq(userId))
                .and(FILE_PERMISSION.STATUS.eq(0));

        // 检查时间范围
        LocalDateTime now = LocalDateTime.now();
        queryWrapper.and(
                FILE_PERMISSION.START_TIME.isNull().or(FILE_PERMISSION.START_TIME.le(now))
        );
        queryWrapper.and(
                FILE_PERMISSION.END_TIME.isNull().or(FILE_PERMISSION.END_TIME.ge(now))
        );

        List<FilePermission> permissions = this.list(queryWrapper);
        if (permissions == null || permissions.isEmpty()) {
            // 如果没有显式设置权限，默认允许（为了向后兼容）
            return true;
        }

        // 取优先级最高的权限
        FilePermission highestPermission = permissions.stream()
                .max((p1, p2) -> Integer.compare(
                        p1.getPriority() != null ? p1.getPriority() : 0,
                        p2.getPriority() != null ? p2.getPriority() : 0
                ))
                .orElse(null);

        if (highestPermission == null) {
            return true;
        }

        // 检查对应权限
        return switch (permissionType.toLowerCase()) {
            case "read" -> Boolean.TRUE.equals(highestPermission.getCanRead());
            case "write" -> Boolean.TRUE.equals(highestPermission.getCanWrite());
            case "delete" -> Boolean.TRUE.equals(highestPermission.getCanDelete());
            case "manage" -> Boolean.TRUE.equals(highestPermission.getCanManage());
            default -> false;
        };
    }

    @Override
    public boolean hasReadPermission(String fileId, String userId) {
        return hasPermission(userId, "file", fileId, "read");
    }

    @Override
    public boolean hasWritePermission(String fileId, String userId) {
        return hasPermission(userId, "file", fileId, "write");
    }

    @Override
    public boolean hasDeletePermission(String fileId, String userId) {
        return hasPermission(userId, "file", fileId, "delete");
    }

    @Override
    public boolean hasManagePermission(String fileId, String userId) {
        return hasPermission(userId, "file", fileId, "manage");
    }
}
