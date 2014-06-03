package com.sr.biz.freightbit.core.exceptions;

public class UserAlreadyExistsException extends ObjectAlreadyExistsException {

    public UserAlreadyExistsException(String msg) {
        super(msg);
    }

    public UserAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public UserAlreadyExistsException(long id) {
        super(id);
    }

    public UserAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }
}