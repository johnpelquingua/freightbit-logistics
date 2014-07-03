package com.sr.biz.freightbit.customer.service;

import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;

import java.util.List;

/**
 * Created by Solutions Resource on 5/26/14.
 */
public interface ItemService {

    public void addItem(Items items) throws ItemAlreadyExistsException;

    public void deleteItem(Items items);

    public List<Items> findAllItems(Integer customerItemsId);

    public List<Items> findUserByItemName(String itemName);

    public Items findItemByCustomerItemsId(Integer customerItemsId);

    public void updateItems(Items items);

    public List<Items> findItemByCustomerId(Integer customerId);

}
