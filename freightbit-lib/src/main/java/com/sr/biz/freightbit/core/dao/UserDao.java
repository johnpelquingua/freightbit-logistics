package com.sr.biz.freightbit.core.dao;

import java.util.List;

import com.sr.biz.freightbit.core.entity.User;

public interface UserDao {

    public void updateUser(User user);

    public void addUser(User user);

    public void deleteUser(User user);

    public User findUserById(Integer id);

    public List<User> findUserByUserName(String username);

    public List<User> findAllUsers(Integer clientId);

    public List<User> findAllUsersByClientId(Long clientId);

}