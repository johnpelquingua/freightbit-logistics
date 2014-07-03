package com.sr.biz.freightbit.customer.dao;

/**
 * Created by Solutions Resource on 5/26/14.
 */

import com.sr.biz.freightbit.customer.entity.Items;

import java.util.List;

public interface ItemsDao {

    public void addItems(Items items);

    public void deleteItems(Items items);

    public Items findItemByCustomerItemsId(Integer customerItemsId);

    public List<Items> findAllItems(Integer customerItemsId);

    public List<Items> findUserByItemName(String itemName);

    public void updateItems(Items items);

    public List<Items> findAllItemsByClientId(Integer clientId);

    public List<Items> findItemByCustomerId(Integer customerId);
}
