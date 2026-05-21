package com.xddcodec.fs.file.service.impl;

import cn.hutool.core.util.IdUtil;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import com.xddcodec.fs.file.domain.FileVersion;
import com.xddcodec.fs.file.domain.dto.FileVersionPageQry;
import com.xddcodec.fs.file.domain.vo.FileVersionVO;
import com.xddcodec.fs.file.mapper.FileVersionMapper;
import com.xddcodec.fs.file.service.FileVersionService;
import com.xddcodec.fs.framework.common.domain.PageResult;
import com.xddcodec.fs.framework.common.utils.StringUtils;
import io.github.linpeilie.Converter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

import static com.xddcodec.fs.file.domain.table.FileVersionTableDef.FILE_VERSION;

/**
 * 文件版本 Service Impl
 *
 * @Author: xddcode
 * @Date: 2026/5/13
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FileVersionServiceImpl extends ServiceImpl<FileVersionMapper, FileVersion> implements FileVersionService {

    private final Converter converter;

    @Override
    public PageResult<FileVersionVO> getPages(FileVersionPageQry qry) {
        Page<FileVersion> page = new Page<>(qry.getPage(), qry.getPageSize());
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderBy(FILE_VERSION.VERSION_NUMBER.desc());

        // 文件ID过滤
        if (StringUtils.isNotEmpty(qry.getFileId())) {
            queryWrapper.and(FILE_VERSION.FILE_ID.eq(qry.getFileId()));
        }

        // 关键词搜索
        if (StringUtils.isNotEmpty(qry.getKeyword())) {
            queryWrapper.and(
                    FILE_VERSION.ORIGINAL_NAME.like(qry.getKeyword() + "%")
                            .or(FILE_VERSION.REMARK.like(qry.getKeyword() + "%"))
            );
        }

        this.page(page, queryWrapper);
        Long total = page.getTotalRow();
        List<FileVersion> records = page.getRecords();
        List<FileVersionVO> vos = convertToVO(records);
        PageResult.PageRecord<FileVersionVO> pageRecord = new PageResult.PageRecord<>();
        pageRecord.setRecords(vos);
        pageRecord.setTotal(total);
        return PageResult.<FileVersionVO>builder().data(pageRecord).code(200).build();
    }

    @Override
    public PageResult<FileVersionVO> getFileVersions(String fileId, Integer pageNum, Integer pageSize) {
        Page<FileVersion> page = new Page<>(pageNum != null ? pageNum : 1, pageSize != null ? pageSize : 20);
        QueryWrapper queryWrapper = new QueryWrapper()
                .where(FILE_VERSION.FILE_ID.eq(fileId))
                .orderBy(FILE_VERSION.VERSION_NUMBER.desc());

        this.page(page, queryWrapper);
        Long total = page.getTotalRow();
        List<FileVersion> records = page.getRecords();
        List<FileVersionVO> vos = convertToVO(records);
        PageResult.PageRecord<FileVersionVO> pageRecord = new PageResult.PageRecord<>();
        pageRecord.setRecords(vos);
        pageRecord.setTotal(total);
        return PageResult.<FileVersionVO>builder().data(pageRecord).code(200).build();
    }

    @Override
    public FileVersionVO getVersionDetail(String versionId) {
        FileVersion version = this.getById(versionId);
        if (version == null) {
            return null;
        }
        return convertToVO(version);
    }
    
    /**
     * 手动将 FileVersion 转换为 FileVersionVO
     */
    private List<FileVersionVO> convertToVO(List<FileVersion> records) {
        List<FileVersionVO> vos = new java.util.ArrayList<>();
        for (FileVersion record : records) {
            vos.add(convertToVO(record));
        }
        return vos;
    }
    
    /**
     * 手动将单个 FileVersion 转换为 FileVersionVO
     */
    private FileVersionVO convertToVO(FileVersion record) {
        FileVersionVO vo = new FileVersionVO();
        vo.setId(record.getId());
        vo.setFileId(record.getFileId());
        vo.setVersionNumber(record.getVersionNumber());
        vo.setObjectKey(record.getObjectKey());
        vo.setOriginalName(record.getOriginalName());
        vo.setSize(record.getSize());
        vo.setContentMd5(record.getContentMd5());
        vo.setRemark(record.getRemark());
        vo.setCreatorId(record.getCreatorId());
        vo.setCreateTime(record.getCreateTime());
        vo.setIsCurrent(record.getIsCurrent());
        return vo;
    }

    @Override
    public FileVersionVO rollbackVersion(String versionId, String userId) {
        FileVersion targetVersion = this.getById(versionId);
        if (targetVersion == null) {
            throw new RuntimeException("版本不存在");
        }
        if (targetVersion.getIsCurrent()) {
            throw new RuntimeException("该版本已是当前版本，无需回滚");
        }

        this.updateNonCurrent(targetVersion.getFileId());

        targetVersion.setIsCurrent(true);
        this.updateById(targetVersion);

        log.info("用户 {} 将文件 {} 回滚到版本 {}", userId, targetVersion.getFileId(), targetVersion.getVersionNumber());
        return convertToVO(targetVersion);
    }

    @Override
    public void deleteVersion(String versionId) {
        FileVersion version = this.getById(versionId);
        if (version == null) {
            throw new RuntimeException("版本不存在");
        }
        if (version.getIsCurrent()) {
            throw new RuntimeException("不能删除当前版本");
        }
        this.removeById(versionId);
        log.info("删除文件 {} 的版本 {}", version.getFileId(), version.getVersionNumber());
    }

    @Override
    public FileVersion createVersion(String fileId, String objectKey, String originalName,
                                     Long size, String contentMd5, String remark, String creatorId) {
        // 获取当前最大版本号
        Integer maxVersion = this.getMaxVersion(fileId);
        Integer newVersion = (maxVersion != null ? maxVersion : 0) + 1;

        FileVersion version = new FileVersion();
        version.setId(IdUtil.simpleUUID());
        version.setFileId(fileId);
        version.setVersionNumber(newVersion);
        version.setObjectKey(objectKey);
        version.setOriginalName(originalName);
        version.setSize(size);
        version.setContentMd5(contentMd5);
        version.setRemark(remark);
        version.setCreatorId(creatorId);
        version.setIsCurrent(true);
        version.setCreateTime(LocalDateTime.now());

        // 将旧版本设为非当前
        this.updateNonCurrent(fileId);

        this.save(version);
        log.info("文件 {} 创建版本 {} 成功", fileId, newVersion);

        return version;
    }

    /**
     * 获取文件的最大版本号
     *
     * @param fileId
     * @return
     */
    private Integer getMaxVersion(String fileId) {
        QueryWrapper queryWrapper = new QueryWrapper()
                .where(FILE_VERSION.FILE_ID.eq(fileId))
                .orderBy(FILE_VERSION.VERSION_NUMBER.desc());
        List<FileVersion> versions = this.list(queryWrapper);
        if (versions != null && !versions.isEmpty()) {
            return versions.get(0).getVersionNumber();
        }
        return null;
    }

    /**
     * 将文件的所有版本设为非当前
     *
     * @param fileId
     */
    private void updateNonCurrent(String fileId) {
        QueryWrapper queryWrapper = new QueryWrapper()
                .where(FILE_VERSION.FILE_ID.eq(fileId));
        FileVersion updateVersion = new FileVersion();
        updateVersion.setIsCurrent(false);
        this.update(updateVersion, queryWrapper);
    }
}
