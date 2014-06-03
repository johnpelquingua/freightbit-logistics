package com.sr.biz.freightbit.core.exceptions;

/**
 * Created by JMXPSX on 5/16/14.
 */

public class DriverAlreadyExistsException extends ObjectAlreadyExistsException{

    public DriverAlreadyExistsException(String name) {
        super(name);
    }

    public DriverAlreadyExistsException(String name, Throwable cause) {
        super(name, cause);
    }

    public DriverAlreadyExistsException(long driverId) {
        super(driverId);
    }

    public DriverAlreadyExistsException(long driverId, Throwable cause) {
        super(driverId, cause);
    }
}
