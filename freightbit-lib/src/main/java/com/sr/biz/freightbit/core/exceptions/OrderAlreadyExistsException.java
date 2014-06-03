package com.sr.biz.freightbit.core.exceptions;

/**
 * Created by JMXPSX on 5/27/14.
 */
public class OrderAlreadyExistsException extends ObjectAlreadyExistsException{


    public OrderAlreadyExistsException(String name) {
        super(name);
    }

    public OrderAlreadyExistsException(String name, Throwable cause) {
        super(name, cause);
    }

    public OrderAlreadyExistsException(Integer orderId) {
        super(orderId);
    }

    public OrderAlreadyExistsException(Integer orderId, Throwable cause) {
        super(orderId, cause);
    }
}
