package com.sr.biz.freightbit.operations.service.impl;

import com.sr.biz.freightbit.operations.dao.ContainerDao;
import com.sr.biz.freightbit.operations.entity.Container;
import com.sr.biz.freightbit.operations.exceptions.ContainerAlreadyExistsException;
import com.sr.biz.freightbit.operations.service.ContainerService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */
public class ContainerServiceImpl implements ContainerService {

    private ContainerDao containerDao;

    public void setContainerDao(ContainerDao containerDao) {
        this.containerDao = containerDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addContainer(Container container) throws Exception {
        if (containerDao.findContainerByEIRNumber(container.getEirNumber()).size() > 0) {
            throw new ContainerAlreadyExistsException(container.getEirNumber());
        } else {
            containerDao.addContainer(container);
        }

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateContainer(Container container) {

            containerDao.updateContainer(container);

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteContainer(Container container) {
        containerDao.deleteContainer(container);
    }

    @Override
    public List<Container> findAllContainer() {
        List<Container> containers = containerDao.findAllContainer();
        return containers;
    }

    @Override
    public Container findContainerById(Integer containerId) {
        Container container = containerDao.findContainerById(containerId);
        return container;
    }

    @Override
    public List<Container> findContainerByCriteria(String column, String value){
        return containerDao.findContainerByCriteria(column, value);
    }
}
