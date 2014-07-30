package com.sr.biz.freightbit.core.service;

import com.sr.biz.freightbit.core.dao.UserDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.UserAlreadyExistsException;
import com.sr.biz.freightbit.core.service.impl.UserServiceImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.MockitoAnnotations.Mock;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceTest {

    @Mock
    private UserDao userDao;

    @InjectMocks
    private UserServiceImpl userService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }


    @Test(expected = UserAlreadyExistsException.class)
    public void testAddExistingUser() {
        User user = initUser();
        List<User> existingUserList = new ArrayList<User>();
        existingUserList.add(user);
        /**
         * Mock DAO: 1. Determine which DAO methods are invoked by the service
         * 2.  SYNTAX: when(dao.xMethod()).thenReturn(y) means when xMethod() is invoked, then return y
         */
        //Mockito.when(userDao.findUserByUserName("admin")).thenReturn(existingUserList);
        userService.addUser(user);
    }

    @Test
    public void testFindAllUsersByClientId() {
        Integer clientId = 1;
        List<User> users = new ArrayList();
        users.add(initUser());

        Mockito.when(userDao.findAllUsers(clientId)).thenReturn(users);
        List<User> results = userService.findAllUsersByClientId(clientId);
        Assert.assertEquals(users.size(), 1);
    }

    @Test
    public void testFindAllUsers() {
        Integer clientId = 1;
        List<User> users = new ArrayList();
        users.add(initUser());
    }

    private User initUser() {
        Client client = new Client("Ernest", new Date(), "Juno", new Date(), "Juno");

        User user = new User();
        user.setClient(client);
        user.setCreationDate(new Date());
        user.setEmail("admin@test.com");
        user.setFirstName("Juno");
        user.setLastName("Roxas");
        user.setLastVisitDate(new Date());
        user.setModifiedDate(new Date());
        user.setStatus("Active");
        user.setUserId(2);
        user.setUsername("admin");
        System.out.print(client);
        return user;
    }
}

