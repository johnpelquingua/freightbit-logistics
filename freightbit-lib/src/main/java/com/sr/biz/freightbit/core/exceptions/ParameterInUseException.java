package com.sr.biz.freightbit.core.exceptions;

public class ParameterInUseException extends ObjectAlreadyExistsException {

    public ParameterInUseException(String msg) {
        super(msg);
    }

    public ParameterInUseException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public ParameterInUseException(long id) {
        super(id);
    }

    public ParameterInUseException(long id, Throwable cause) {
        super(id, cause);
    }
}
