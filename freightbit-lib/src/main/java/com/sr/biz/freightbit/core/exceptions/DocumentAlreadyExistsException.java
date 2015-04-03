package com.sr.biz.freightbit.core.exceptions;

public class DocumentAlreadyExistsException extends ObjectAlreadyExistsException {

    public DocumentAlreadyExistsException(String msg) {
        super(msg);
    }

    public DocumentAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public DocumentAlreadyExistsException(long id) {
        super(id);
    }

    public DocumentAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }
}

