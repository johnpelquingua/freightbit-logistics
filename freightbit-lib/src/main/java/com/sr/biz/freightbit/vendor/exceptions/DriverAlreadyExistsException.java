package com.sr.biz.freightbit.vendor.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

public class DriverAlreadyExistsException extends ObjectAlreadyExistsException {

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
