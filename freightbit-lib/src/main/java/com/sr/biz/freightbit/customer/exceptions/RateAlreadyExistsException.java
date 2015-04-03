package com.sr.biz.freightbit.customer.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

public class RateAlreadyExistsException extends ObjectAlreadyExistsException {

    public RateAlreadyExistsException(String msg) {
        super(msg);
    }

    public RateAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public RateAlreadyExistsException(long id) {
        super(id);
    }

    public RateAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }
}
