/**
 *
 */
package com.sr.biz.freightbit.core.service;

import java.util.List;

import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import com.sr.biz.freightbit.core.entity.User;

/**
 * @author junoroxas
 *
 */
public interface PermissionService {

    public void addUserPermission(User user, Client client, List<Permission>  permList);

    public void addGroupPermission(Group group, Client client, List<Permission>  permList);

    public void removeUserPermission(User user, Client client, List<Permission>  permList);

    public void removeGroupPermission(Group group, Client client, List<Permission>  permList);

    public List<Permission> getPermissions(Integer clientId);

    public Permission getPermissionByUser(Client client, User user);

    public Permission getPermissionByGroup(Client client, Group group);
    
    public List<PermissionUserGroup> getPermissionUserGroupsByClientIdAndPermissionId(Integer clientId, Integer permissionId);
    
    public Permission findPermissionById(Integer permissionId);
    
    public void addPermissionToUser(PermissionUserGroup permissionUserGroup);
    
    public PermissionUserGroup findPermissionUserGroup(Integer clientId, Integer groupId, Integer userId, Integer permissionId);

	void deletePermissionOfUser(PermissionUserGroup permissionUserGroup);
}
