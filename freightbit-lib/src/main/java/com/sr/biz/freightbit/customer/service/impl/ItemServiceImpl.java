package com.sr.biz.freightbit.customer.service.impl;

import com.sr.biz.freightbit.customer.dao.ItemsDao;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.customer.service.ItemService;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Solutions Resource on 5/26/14.
 */
public class ItemServiceImpl implements ItemService {

    private ItemsDao itemsDao;

    public  void setItemsDao(ItemsDao itemsDao){
        this.itemsDao = itemsDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addItem(Items items) throws ItemAlreadyExistsException{
        if(itemsDao.findUserByItemName(items.getItemName()).size() > 0)
            throw new ItemAlreadyExistsException(items.getItemName());
        else
            itemsDao.addItems(items);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteItem(Items items) {
        itemsDao.deleteItems(items);
    }

    @Override
    public List<Items> findAllItems(Integer customerItemsId) {
        return itemsDao.findAllItems(customerItemsId);
    }

    @Override
    public List<Items> findUserByItemName(String itemName) {
        List<Items> result = itemsDao.findUserByItemName(itemName);
        return result;
    }

    @Override
    public Items findItemByCustomerItemsId(Integer customerItemsId) {
        return itemsDao.findItemByCustomerItemsId(customerItemsId);
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateItems(Items items) {
        itemsDao.updateItems(items);
    }


    @Override
    public List<Items> findItemByCustomerId(Integer customerId){
        List<Items> result = itemsDao.findItemByCustomerId(customerId);
        return  result;

    }

}
