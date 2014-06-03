/**
 *
 */
package com.sr.biz.freightbit.core.service;

import java.util.List;

import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.entity.Client;

/**
 * @author junoroxas
 *
 */
public interface PermissionService {

    public void addUserPermission(User user, Client client, List<Permission>  permList);

    public void addGroupPermission(Group group, Client client, List<Permission>  permList);

    public void removeUserPermission(User user, Client client, List<Permission>  permList);

    public void removeGroupPermission(Group group, Client client, List<Permission>  permList);

    public List<Permission> getPermissions(Client client);

    public Permission getPermissionByUser(Client client, User user);

    public Permission getPermissionByGroup(Client client, Group group);
}
