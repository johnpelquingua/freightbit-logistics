package com.sr.biz.freightbit.core.exceptions;

/**
 * Created by ADMIN on 5/16/2014.
 */
public class VesselAlreadyExistsException extends ObjectAlreadyExistsException{

    public VesselAlreadyExistsException(String msg) {
        super(msg);
    }

    public VesselAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public VesselAlreadyExistsException(long id) {
        super(id);
    }

    public VesselAlreadyExistsException(long id, Throwable cause) {
        super(id, cause);
    }

}

