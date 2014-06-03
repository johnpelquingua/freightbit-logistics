package com.sr.biz.freightbit.core.exceptions;

public class ObjectAlreadyExistsException extends RuntimeException {

    public ObjectAlreadyExistsException(String name) {
        this(name, null);
    }

    public ObjectAlreadyExistsException(String name, Throwable cause) {
        super(cause);
        this.name = name;
    }

    public ObjectAlreadyExistsException(long id) {
        this(id, null);
    }

    public ObjectAlreadyExistsException(long id, Throwable cause) {
        super(cause);
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    private String name = null;
    private long id = -1;
}
