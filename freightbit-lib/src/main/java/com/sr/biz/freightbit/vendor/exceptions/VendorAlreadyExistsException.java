package com.sr.biz.freightbit.vendor.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

public class VendorAlreadyExistsException extends ObjectAlreadyExistsException {
    public VendorAlreadyExistsException(String msg) {
        super(msg);
    }

    public VendorAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public VendorAlreadyExistsException(long vendorId) {
        super(vendorId);
    }

    public VendorAlreadyExistsException(long vendorId, Throwable cause) {
        super(vendorId, cause);
    }
}
