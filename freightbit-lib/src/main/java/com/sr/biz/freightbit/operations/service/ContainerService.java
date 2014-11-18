package com.sr.biz.freightbit.operations.service;

import com.sr.biz.freightbit.operations.entity.Container;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */
public interface ContainerService {

    public void addContainer(Container container) throws Exception;

    public void updateContainer(Container container);

    public void deleteContainer(Container container);

    public List<Container> findAllContainer();

    public Container findContainerById(Integer containerId);

    public List<Container> findContainerByCriteria(String column, String value);
}
