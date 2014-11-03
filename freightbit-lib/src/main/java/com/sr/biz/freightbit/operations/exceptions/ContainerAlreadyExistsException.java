package com.sr.biz.freightbit.operations.exceptions;

import com.sr.biz.freightbit.core.exceptions.ObjectAlreadyExistsException;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */
public class ContainerAlreadyExistsException extends ObjectAlreadyExistsException {

    public ContainerAlreadyExistsException(String eirNumber) {
        super(eirNumber);
    }

    public ContainerAlreadyExistsException(String eirNumber, Throwable cause) {
        super(eirNumber, cause);
    }

    public ContainerAlreadyExistsException(Integer containerId) {
        super(containerId);
    }

    public ContainerAlreadyExistsException(Integer containerId, Throwable cause) {
        super(containerId, cause);
    }
}
