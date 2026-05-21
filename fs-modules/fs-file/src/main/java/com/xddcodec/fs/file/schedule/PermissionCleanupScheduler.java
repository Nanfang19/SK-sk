package com.xddcodec.fs.file.schedule;

import com.mybatisflex.core.query.QueryWrapper;
import com.xddcodec.fs.file.domain.FilePermission;
import com.xddcodec.fs.file.service.FilePermissionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

import static com.xddcodec.fs.file.domain.table.FilePermissionTableDef.FILE_PERMISSION;

@Slf4j
@Component
@RequiredArgsConstructor
public class PermissionCleanupScheduler {

    private final FilePermissionService filePermissionService;

    @Scheduled(cron = "0 0 * * * ?")
    public void cleanExpiredPermissions() {
        LocalDateTime now = LocalDateTime.now();
        QueryWrapper query = QueryWrapper.create()
                .where(FILE_PERMISSION.END_TIME.isNotNull())
                .and(FILE_PERMISSION.END_TIME.lt(now))
                .and(FILE_PERMISSION.STATUS.eq(0));
        List<FilePermission> expired = filePermissionService.list(query);
        if (!expired.isEmpty()) {
            for (FilePermission perm : expired) {
                perm.setStatus(1);
            }
            filePermissionService.updateBatch(expired);
            log.info("清理过期权限: {} 条", expired.size());
        }
    }
}
