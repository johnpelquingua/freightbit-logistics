package com.sr.biz.freightbit.core.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.dao.UserDao;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.UserAlreadyExistsException;
import com.sr.biz.freightbit.core.service.UserService;


public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addUser(User user) throws UserAlreadyExistsException {
        if (userDao.findUserByUserName(user.getUsername()).size() > 0)
            throw new UserAlreadyExistsException(user.getUsername());
        else
            userDao.addUser(user);
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteUser(User user) {
        userDao.deleteUser(user);
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
        List<User> result = userDao.findUserByUserName(userName);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
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
    public List<User> findUsersByCriteria(String column, String value, Integer clientId) {
    	return userDao.findUsersByCriteria(column, value, clientId);
    }
}