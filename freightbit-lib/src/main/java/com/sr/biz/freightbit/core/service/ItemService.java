package com.sr.biz.freightbit.core.service;

import java.util.List;
import com.sr.biz.freightbit.core.dao.UserDao;
import com.sr.biz.freightbit.core.entity.Items;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.ItemAlreadyExistsException;

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

}
