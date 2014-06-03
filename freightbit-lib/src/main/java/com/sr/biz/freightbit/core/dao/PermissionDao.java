package com.sr.biz.freightbit.core.dao;

import java.util.List;

import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Client;

public interface PermissionDao {
    public Permission createPermission(User user, Client client, long value);

    public Permission createPermission(Group group, Client client, long value);

    public void updatePermission(Permission permission);

    public void deletePermission(Permission permission);

    public void deletePermissions(Client client);

    public void deletePermissions(Group group);

    public void deletePermissions(User user);

    public Permission getPermission(long permissionId);

    public Permission getPermission(Client client, User user);

    public Permission getPermission(Client client, Group group);

    public List getPermissions(Client client);
}
