package com.sr.biz.freightbit.core.exceptions;

public class ContactAlreadyExistsException extends ObjectAlreadyExistsException {

    public ContactAlreadyExistsException(String msg) {
        super(msg);
    }

    public ContactAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public ContactAlreadyExistsException(long id) {
        super(id);
    }

    public ContactAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }
}
