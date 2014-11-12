package com.sr.biz.freightbit.operations.dao;

import com.sr.biz.freightbit.operations.entity.Container;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */
public interface ContainerDao {

    public void addContainer(Container container);

    public void updateContainer(Container container);

    public void deleteContainer(Container container);

    public List<Container> findAllContainer();

    public List<Container> findContainerByOrderNumber(String orderNumber);

    public List<Container> findContainerByEIRNumber(String eirNumber);

    public Container findContainerById(Integer containerId);
}
