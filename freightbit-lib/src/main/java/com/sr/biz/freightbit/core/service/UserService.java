package com.sr.biz.freightbit.core.service;

import java.util.List;

import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.UserAlreadyExistsException;

public interface UserService {

    public Integer addUser(User user) throws UserAlreadyExistsException;

    public void updateUser(User user);

    /**
     * Can't use updateUser(User) as this need not update the lastModifiedDate
     *
     * @param user
     */
    public void updateLastVisitDate(User user);

    public void deleteUser(User user);

    public User findUserById(Integer userId);

    public List<User> findAllUsers(Integer clientId);

    public List<User> findAllUsersByClientId(long clientId);

    public User findUserByUserName(String userName);

    public List<User> findUsersByCriteria(String column, String value, Integer clientId);
}