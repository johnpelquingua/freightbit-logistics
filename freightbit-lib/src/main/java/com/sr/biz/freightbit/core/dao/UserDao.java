package com.sr.biz.freightbit.core.dao;

import com.sr.biz.freightbit.core.entity.User;

import java.util.List;

public interface UserDao {
    public void updateUser(User user);

    public Integer addUser(User user);

    public void deleteUser(User user);

    public User findUserById(Integer id);

    public User findUserByUserName(String username);

    public List<User> findAllUsers(Integer clientId);

    public List<User> findAllUsersByClientId(Long clientId);

    public List<User> findUsersByCriteria(String column, String value, Integer clientId);

	public List<User> findDuplicateUserByUserName(String userName, Integer userId);
}