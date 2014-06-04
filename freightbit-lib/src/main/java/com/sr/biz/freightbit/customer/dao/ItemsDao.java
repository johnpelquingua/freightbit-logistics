package com.sr.biz.freightbit.customer.dao;

/**
 * Created by Solutions Resource on 5/26/14.
 */

import java.util.List;

import com.sr.biz.freightbit.customer.entity.Items;

public interface ItemsDao {

    public void addItems(Items items);

    public void deleteItems(Items items);

    public Items findItemByCustomerItemsId(Integer customerItemsId);

    public List<Items> findAllItems(Integer customerItemsId);

    public List<Items> findUserByItemName(String itemName);

    public void updateItems(Items items);

    public List<Items> findAllItemsByClientId(Integer clientId);

}
