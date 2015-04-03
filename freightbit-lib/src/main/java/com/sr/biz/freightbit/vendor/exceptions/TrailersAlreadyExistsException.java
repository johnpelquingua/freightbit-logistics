package com.sr.biz.freightbit.vendor.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

public class TrailersAlreadyExistsException extends ObjectAlreadyExistsException {

    public TrailersAlreadyExistsException(String msg) {
        super(msg);
    }

    public TrailersAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public TrailersAlreadyExistsException(long trailerId) {
        super(trailerId);
    }

    public TrailersAlreadyExistsException(long trailerId, Throwable cause) {
        super(trailerId, cause);
    }
}
