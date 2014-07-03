package com.sr.biz.freightbit.customer.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

/**
 * Created by ADMIN on 5/13/14.
 */
public class ItemAlreadyExistsException extends ObjectAlreadyExistsException {

    public ItemAlreadyExistsException(String msg) {
        super(msg);
    }

    public ItemAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public ItemAlreadyExistsException(Integer customerItemsId) {
        super(customerItemsId);
    }

    public ItemAlreadyExistsException(Integer customerItemsId, Throwable cause) {
        super(customerItemsId, cause);
    }
}
