package com.sr.biz.freightbit.core.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.dao.PermissionDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.PermissionService;

public class PermissionServiceImpl implements PermissionService {

    PermissionDao permissionDao;

    public void setPermissionDao(PermissionDao permissionDao) {
        this.permissionDao = permissionDao;
    }

    @Override
    @Transactional
    public void addUserPermission(User user, Client client,
                                  List<Permission> permList) {
        // TODO Auto-generated method stub

    }

    @Override
    @Transactional
    public void addGroupPermission(Group group, Client client,
                                   List<Permission> permList) {
        // TODO Auto-generated method stub

    }

    @Override
    @Transactional
    public void removeUserPermission(User user, Client client,
                                     List<Permission> permList) {
        // TODO Auto-generated method stub

    }

    @Override
    @Transactional
    public void removeGroupPermission(Group group, Client client,
                                      List<Permission> permList) {
        // TODO Auto-generated method stub

    }

    @Override
    public List<Permission> getPermissions(Integer clientId) {
        List <Permission> permissions = permissionDao.getPermissions(clientId);
        return permissions;
    }

    @Override
    public Permission getPermissionByUser(Client client, User user) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Permission getPermissionByGroup(Client client, Group group) {
        // TODO Auto-generated method stub
        return null;
    }
    
    @Override
    public List<PermissionUserGroup> getPermissionUserGroupsByClientIdAndPermissionId(Integer clientId, Integer permissionId){
        List<PermissionUserGroup> permissionUserGroup = permissionDao.getPermissionUserGroupsByClientIdAndPermissionId(clientId, permissionId);
        return permissionUserGroup;
    }
    
    public Permission findPermissionById(Integer permissionId) {
    	return permissionDao.findPermissionById(permissionId);
    }
    
    @Override
    @Transactional
    public void addPermissionToUser(PermissionUserGroup permissionUserGroup){
    	permissionDao.addPermissionUserGroup(permissionUserGroup);
    }
    
    @Override
    public PermissionUserGroup findPermissionUserGroup(Integer clientId, Integer groupId, Integer userId, Integer permissionId) {
    	List <PermissionUserGroup> permUserGroupList = 	permissionDao.findPermissionUserGroup(clientId, groupId, userId, permissionId);
    	if (permUserGroupList != null && permUserGroupList.size() > 0)
    		return permUserGroupList.get(0);
    	else
    		return null;
    }
    
    @Override
    @Transactional
    public void deletePermissionOfUser(PermissionUserGroup permissionUserGroup) {
    	permissionDao.deletePermissionUserGroup(permissionUserGroup);
    }
    
    @Override
    public List <Permission> findPermissionByGroupAndUser(Integer clientId, Integer groupId, Integer userId) {
    	List <Permission> permissions = new ArrayList<Permission>();
    	Map <String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("clientId", clientId);
    	paramMap.put("groupId", groupId);
    	paramMap.put("userId", userId);
    	List <PermissionUserGroup> permissionUserGroupList = permissionDao.findPermissionUserGroups(paramMap, "PermissionUserGroup");
    	for (PermissionUserGroup permissionUserGroup : permissionUserGroupList) {
    		permissions.add(permissionDao.getPermission(permissionUserGroup.getPermissionId()));
    	}
    	return permissions;
    }
}
