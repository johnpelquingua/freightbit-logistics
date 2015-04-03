package com.sr.biz.freightbit.customer.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

public class CustomerAlreadyExistsException extends ObjectAlreadyExistsException {

    public CustomerAlreadyExistsException(String msg) {
        super(msg);
    }

    public CustomerAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public CustomerAlreadyExistsException(long id) {
        super(id);
    }

    public CustomerAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }
}
