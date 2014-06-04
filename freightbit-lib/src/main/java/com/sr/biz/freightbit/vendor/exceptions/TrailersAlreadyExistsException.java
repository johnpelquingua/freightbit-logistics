package com.sr.biz.freightbit.vendor.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 5/14/14
 * Time: 8:40 PM
 * To change this template use File | Settings | File Templates.
 */
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
