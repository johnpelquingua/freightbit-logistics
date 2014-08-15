package com.sr.biz.freightbit.core.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.dao.ClientDao;
import com.sr.biz.freightbit.core.dao.GroupDao;
import com.sr.biz.freightbit.core.dao.GroupUserDao;
import com.sr.biz.freightbit.core.dao.PermissionDao;
import com.sr.biz.freightbit.core.dao.UserDao;
import com.sr.biz.freightbit.core.entity.GroupUser;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.UserAlreadyExistsException;
import com.sr.biz.freightbit.core.service.UserService;


public class UserServiceImpl implements UserService {

    private UserDao userDao;
    private ClientDao clientDao;
    private PermissionDao permissionDao;
    private GroupUserDao groupUserDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}
	
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer addUser(User user) throws UserAlreadyExistsException {
        if (userDao.findUserByUserName(user.getUsername()) != null)
            throw new UserAlreadyExistsException(user.getUsername());
        else {
        	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        	String hashedPassword = passwordEncoder.encode(user.getPassword());
        	user.setPassword(hashedPassword);
        	return userDao.addUser(user);
        }
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteUser(User user) {
        userDao.deleteUser(user);
        
        Map<String, Object> paramMap = new HashMap();
        paramMap.put("userId", user.getUserId());
        List <PermissionUserGroup> permissionUserGroupList = permissionDao.findPermissionUserGroups(paramMap, "PermissionUserGroup");
        for (PermissionUserGroup permissionUserGroup: permissionUserGroupList) {
        	permissionDao.deletePermissionUserGroup(permissionUserGroup);
        }
        
        List <GroupUser> groupUserList = groupUserDao.findAllGroupsByUserId(user.getUserId());
        for (GroupUser groupUser: groupUserList) {
        	groupUserDao.deleteGroupUser(groupUser);
        }
        
    }


    @Override
    public List<User> findAllUsersByClientId(long clientId) {
        return userDao.findAllUsersByClientId(clientId);
    }


    @Override
    public List<User> findAllUsers(Integer clientId) {
        List<User> users = userDao.findAllUsers(clientId);
        return users;
    }

    @Override
    public User findUserById(Integer userId) {
        return userDao.findUserById(userId);
    }

    public User findUserByUserName(String userName) {
       User result = userDao.findUserByUserName(userName);
       return result;
    }

    @Override
    public void updateLastVisitDate(User user) {
        user.setLastVisitDate(new Date());
        userDao.updateUser(user);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateUser(User user) {
        userDao.updateUser(user);
    }
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateUserPassword(User user) {
     	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	String hashedPassword = passwordEncoder.encode(user.getPassword());
    	user.setPassword(hashedPassword);
    	userDao.updateUser(user);
    }

    @Override
    public List<User> findUsersByCriteria(String column, String value, Integer clientId) {
        return userDao.findUsersByCriteria(column, value, clientId);
    }

	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	public void setGroupUserDao(GroupUserDao groupUserDao) {
		this.groupUserDao = groupUserDao;
	}
    
    

}