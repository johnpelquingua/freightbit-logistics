package com.sr.biz.freightbit.customer.dao;

import com.sr.biz.freightbit.customer.entity.Items;

import java.util.List;

public interface ItemsDao {

    public void addItems(Items items);

    public void deleteItems(Items items);

    public Items findItemByCustomerItemsId(Integer customerItemsId);

    public List<Items> findAllItems(Integer customerItemsId);

    public Items findIItemDetailsByItemName(String itemName);

    public Items findItemByCode(String itemCode);

    public List<Items> findUserByItemName(String itemName);

    public void updateItems(Items items);

    public List<Items> findAllItemsByClientId(Integer clientId);

    public List<Items> findItemByCustomerId(Integer customerId);
}
