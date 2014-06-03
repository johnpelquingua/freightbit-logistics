package com.sr.biz.freightbit.core.dao;

/**
 * Created by Solutions Resource on 5/26/14.
 */

import java.util.List;

import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Items;
import com.sr.biz.freightbit.core.entity.User;

public interface ItemsDao {

    public void addItems(Items items);

    public void deleteItems(Items items);

    public Items findItemByCustomerItemsId(Integer customerItemsId);

    public List<Items> findAllItems(Integer customerItemsId);

    public List<Items> findUserByItemName(String itemName);

    public void updateItems(Items items);

    public List<Items> findAllItemsByClientId(Integer clientId);

}
