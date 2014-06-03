package com.sr.biz.freightbit.core.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sr.biz.freightbit.core.entity.Items;
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

import com.sr.biz.freightbit.core.dao.ItemsDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.entity.Customer;
import com.sr.biz.freightbit.core.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.core.service.impl.ItemServiceImpl;

/**
 * Created by Solutions Resource on 5/26/14.
 */

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class ItemServiceTest {

    @Mock
    private ItemsDao itemsDao;

    @InjectMocks
    private ItemServiceImpl itemService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    private Items initItem(){
        Client client = new Client("Ernest", new Date(), "Juno", new Date(), "Juno");
        Customer customer = new Customer();

        Items item = new Items();
        item.setClient(client);
        item.setCustomerId(customer);
        item.setItemName("ROCK");
        item.setItemCode("ROK-101");
        item.setLength(2);
        item.setWidth(2);
        item.setLength(2);
        item.setSrp(2.0);
        item.setCriticalQuality(2);
        item.setBasePrice(2.00);
        item.setNote("Matigas");
        item.setDescription("HARD");

        return item;
    }

    @Test(expected=ItemAlreadyExistsException.class)
    public void testAddExistingItem() {
        Items item = initItem();
        List<Items> existingItemList = new ArrayList<Items>();
        existingItemList.add(item);
        /**
         * Mock DAO: 1. Determine which DAO methods are invoked by the service
         * 2.  SYNTAX: when(dao.xMethod()).thenReturn(y) means when xMethod() is invoked, then return y
         */
        Mockito.when(itemsDao.findUserByItemName("ROCK")).thenReturn(existingItemList);
        itemService.addItem(item);
    }

}
