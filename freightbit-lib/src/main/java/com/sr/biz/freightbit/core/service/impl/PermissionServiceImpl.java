package com.sr.biz.freightbit.core.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.dao.PermissionDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
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
    public List<Permission> getPermissions(Client client) {
        // TODO Auto-generated method stub
        return null;
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

}
