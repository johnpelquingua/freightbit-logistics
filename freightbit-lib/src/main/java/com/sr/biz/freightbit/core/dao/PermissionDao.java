package com.sr.biz.freightbit.core.dao;

import com.sr.biz.freightbit.core.entity.*;

import java.util.List;
import java.util.Map;

public interface PermissionDao {
    public Permission createPermission(User user, Client client, long value);

    public Permission createPermission(Group group, Client client, long value);

    public void updatePermission(Permission permission);

    public void deletePermission(Permission permission);

    public void deletePermissions(Client client);

    public void deletePermissions(Group group);

    public void deletePermissions(User user);

    public Permission getPermissionById(Integer permissionId);

    public Permission getPermission(Client client, User user);

    public Permission getPermission(Client client, Group group);

    public List<Permission> getPermissions(Integer clientId);

    public List<PermissionUserGroup> getPermissionUserGroupsByClientIdAndPermissionId(Integer clientId, Integer permissionId);

    public Permission findPermissionById(Integer permissionId);

    public void addPermissionUserGroup(PermissionUserGroup permissionUserGroup);

    public List<PermissionUserGroup> findPermissionUserGroup(Integer clientId, Integer groupId, Integer userId, Integer permissionId);

    public void deletePermissionUserGroup(PermissionUserGroup permissionUserGroup);

    public List<PermissionUserGroup> findPermissionUserGroups(Map<String, Object> paramMap, String entity);
}
