package com.sr.biz.freightbit.core.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.dao.PermissionDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.User;

/**
 *
 * @author junoroxas
 *
 */
@Transactional
public class PermissionDaoImpl extends HibernateDaoSupport implements PermissionDao {

    private static final Log log = LogFactory.getLog(PermissionDaoImpl.class);

    @Override
    public Permission createPermission(User user, Client client, long value) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Permission createPermission(Group group, Client client, long value) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void updatePermission(Permission permission) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermission(Permission permission) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermissions(Client client) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermissions(Group group) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermissions(User user) {
        // TODO Auto-generated method stub

    }

    @Override
    public Permission getPermission(long permissionId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Permission getPermission(Client client, User user) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Permission getPermission(Client client, Group group) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List getPermissions(Client client) {
        // TODO Auto-generated method stub
        return null;
    }

}
