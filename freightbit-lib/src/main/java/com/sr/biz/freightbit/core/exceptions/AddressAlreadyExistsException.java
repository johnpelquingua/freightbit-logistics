package com.sr.biz.freightbit.core.exceptions;

public class AddressAlreadyExistsException extends ObjectAlreadyExistsException {

    public AddressAlreadyExistsException(String msg) {
        super(msg);
    }

    public AddressAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public AddressAlreadyExistsException(long id) {
        super(id);
    }

    public AddressAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }
}
