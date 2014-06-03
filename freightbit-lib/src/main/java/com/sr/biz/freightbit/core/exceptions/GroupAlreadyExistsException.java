package com.sr.biz.freightbit.core.exceptions;


public class GroupAlreadyExistsException extends ObjectAlreadyExistsException {

    public GroupAlreadyExistsException(String msg) {
        super(msg);
    }

    public GroupAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public GroupAlreadyExistsException(long id) {
        super(id);
    }

    public GroupAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }
}
