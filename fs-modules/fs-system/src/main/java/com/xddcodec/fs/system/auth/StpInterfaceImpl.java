package com.xddcodec.fs.system.auth;

import cn.dev33.satoken.stp.StpInterface;
import com.xddcodec.fs.framework.common.context.WorkspaceContext;
import com.xddcodec.fs.system.domain.SysRole;
import com.xddcodec.fs.system.domain.SysWorkspaceMember;
import com.xddcodec.fs.system.service.SysRolePermissionService;
import com.xddcodec.fs.system.service.SysRoleService;
import com.xddcodec.fs.system.service.SysWorkspaceMemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 自定义权限加载接口实现类
 * 基于工作空间的权限验证
 *
 * @Author: xddcode
 * @Date: 2024/11/20 14:46
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class StpInterfaceImpl implements StpInterface {

    private final SysWorkspaceMemberService memberService;
    private final SysRoleService roleService;
    private final SysRolePermissionService rolePermissionService;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        String workspaceId = WorkspaceContext.getWorkspaceId();
        log.info("[权限检查] loginId={}, workspaceId={}", loginId, workspaceId);
        if (workspaceId == null || workspaceId.isBlank()) {
            log.warn("[权限检查] workspaceId为空，返回空权限列表");
            return new ArrayList<>();
        }

        String userId = String.valueOf(loginId);
        SysWorkspaceMember member = memberService.findByWorkspaceAndUser(workspaceId, userId);
        if (member == null) {
            log.warn("[权限检查] 用户{}在工作空间{}中不是成员，返回空权限列表", userId, workspaceId);
            return new ArrayList<>();
        }

        List<String> permissions = rolePermissionService.getPermissionCodesByRoleId(member.getRoleId());
        log.info("[权限检查] userId={}, roleId={}, permissions={}", userId, member.getRoleId(), permissions);
        return permissions != null ? permissions : new ArrayList<>();
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        String workspaceId = WorkspaceContext.getWorkspaceId();
        if (workspaceId == null || workspaceId.isBlank()) {
            return new ArrayList<>();
        }

        String userId = String.valueOf(loginId);
        SysWorkspaceMember member = memberService.findByWorkspaceAndUser(workspaceId, userId);
        if (member == null) {
            return new ArrayList<>();
        }

        SysRole role = roleService.getRoleById(member.getRoleId());
        if (role != null) {
            return List.of(role.getRoleCode());
        }

        return new ArrayList<>();
    }
}
