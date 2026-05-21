package com.xddcodec.fs.system.controller;

import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.xddcodec.fs.framework.common.domain.Result;
import com.xddcodec.fs.system.domain.SysUser;
import com.xddcodec.fs.system.domain.vo.SysUserVO;
import com.xddcodec.fs.system.service.SysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.xddcodec.fs.system.domain.table.SysUserTableDef.SYS_USER;

@RequiredArgsConstructor
@RestController
@RequestMapping("/apis/admin")
@Tag(name = "系统管理", description = "管理员操作接口")
public class AdminController {

    private final SysUserService sysUserService;

    @GetMapping("/users/pages")
    @Operation(summary = "分页查询用户列表")
    public Result<Map<String, Object>> getUserPages(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int pageSize,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Integer status) {
        QueryWrapper query = QueryWrapper.create();
        if (keyword != null && !keyword.isBlank()) {
            query.and(SYS_USER.USERNAME.like(keyword)
                    .or(SYS_USER.EMAIL.like(keyword))
                    .or(SYS_USER.NICKNAME.like(keyword)));
        }
        if (status != null) {
            query.and(SYS_USER.STATUS.eq(status));
        }
        query.orderBy(SYS_USER.CREATED_AT, false);
        Page<SysUser> userPage = sysUserService.page(new Page<>(page, pageSize), query);

        List<SysUserVO> voList = userPage.getRecords().stream().map(user -> {
            SysUserVO vo = new SysUserVO();
            vo.setId(user.getId());
            vo.setUsername(user.getUsername());
            vo.setEmail(user.getEmail());
            vo.setNickname(user.getNickname());
            vo.setAvatar(user.getAvatar());
            vo.setStatus(user.getStatus());
            vo.setCreatedAt(user.getCreatedAt());
            vo.setLastLoginAt(user.getLastLoginAt());
            return vo;
        }).toList();

        Map<String, Object> result = new HashMap<>();
        result.put("records", voList);
        result.put("total", userPage.getTotalRow());
        return Result.ok(result);
    }

    @PutMapping("/users/{userId}/status")
    @Operation(summary = "更新用户状态（启用/禁用）")
    public Result<Void> updateUserStatus(
            @PathVariable String userId,
            @RequestBody Map<String, Integer> body) {
        SysUser user = sysUserService.getById(userId);
        if (user == null) {
            return Result.error("用户不存在");
        }
        Integer statusValue = body.get("status");
        if (statusValue == null || (statusValue != 0 && statusValue != 1)) {
            return Result.error("状态值无效");
        }
        user.setStatus(statusValue);
        sysUserService.updateById(user);
        return Result.ok();
    }
}
