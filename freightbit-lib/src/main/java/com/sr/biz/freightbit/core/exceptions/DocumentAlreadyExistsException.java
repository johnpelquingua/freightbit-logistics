package com.sr.biz.freightbit.core.exceptions;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 10/10/14
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */

public class DocumentAlreadyExistsException extends ObjectAlreadyExistsException {
    //
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

