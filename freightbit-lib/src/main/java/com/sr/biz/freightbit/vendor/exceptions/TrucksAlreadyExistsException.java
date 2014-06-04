package com.sr.biz.freightbit.vendor.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 */
public class TrucksAlreadyExistsException extends ObjectAlreadyExistsException {

    public TrucksAlreadyExistsException(String msg) {
        super(msg);
    }

    public TrucksAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public TrucksAlreadyExistsException(long truckId) {
        super(truckId);
    }

    public TrucksAlreadyExistsException(long truckId, Throwable cause) {
        super(truckId, cause);
    }
}
