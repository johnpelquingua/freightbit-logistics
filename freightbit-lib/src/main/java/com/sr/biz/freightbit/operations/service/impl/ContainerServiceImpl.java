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
    public void addContainer(Container container) {
/*        if (containerDao.findContainerByEIRNumber(container.getEirNumber()).size() > 0) {
            throw new ContainerAlreadyExistsException(container.getEirNumber());
        } else {

        }*/
        containerDao.addContainer(container);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateContainer(Container container) {
        if (containerDao.findContainerByEIRNumber(container.getEirNumber()).size() > 0) {
            throw new ContainerAlreadyExistsException(container.getEirNumber());
        } else {
            containerDao.updateContainer(container);
        }
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
    public List<Container> findContainerByOrderNumber(String orderNumber) {
        List<Container> containers = containerDao.findContainerByOrderNumber(orderNumber);
        return containers;
    }

    @Override
    public List<Container> findContainerByEIRNumber(String eirNumber) {
        List<Container> containers = containerDao.findContainerByEIRNumber(eirNumber);
        return containers;
    }


    public List<Container> findContainerByEIRNumber2(String eirNumber2){
        List<Container> containers = containerDao.findContainerByEIRNumber2(eirNumber2);
        return containers;
    }

    public List<Container> findContainerByReceiptNumber(String receiptNumber){
        List<Container> containers = containerDao.findContainerByReceiptNumber(receiptNumber);
        return containers;
    }

    public List<Container> findContainerBySealNumber(String sealNumber){
        List<Container> containers = containerDao.findContainerBySealNumber(sealNumber);
        return containers;
    }

    public List<Container> findContainerByContainerNumber(String containerNumber){
        List<Container> containers = containerDao.findContainerByContainerNumber(containerNumber);
        return containers;
    }

    public List<Container> findContainerByContainerSize(String containerSize){
        List<Container> containers = containerDao.findContainerByContainerSize(containerSize);
        return containers;
    }

    public List<Container> findContainerByContainerType(String containerType){
        List<Container> containers = containerDao.findContainerByContainerType(containerType);
        return containers;
    }

    public List<Container> findContainerByContainerStatus(String containerStatus){
        List<Container> containers = containerDao.findContainerByContainerStatus(containerStatus);
        return containers;
    }

    public List<Container> findContainerByShipping(String shipping){
        List<Container> containers = containerDao.findContainerByShipping(shipping);
        return containers;
    }

    public List<Container> findContainerByTrucking(String trucking){
        List<Container> containers = containerDao.findContainerByTrucking(trucking);
        return containers;
    }

    public List<Container> findContainerByPlateNumber(String plateNumber){
        List<Container> containers = containerDao.findContainerByPlateNumber(plateNumber);
        return containers;
    }

    public List<Container> findContainerByVanNumber(String vanNumber){
        List<Container> containers = containerDao.findContainerByVanNumber(vanNumber);
        return containers;
    }

    public List<Container> findContainerByDriver(String driver){
        List<Container> containers = containerDao.findContainerByDriver(driver);
        return containers;
    }

    public List<Container> findContainerByBookingNum(String bookingNum){
        List<Container> containers = containerDao.findContainerByBookingNum(bookingNum);
        return containers;
    }

    public List<Container> findContainerByVanLocation(String vanLocation){
        List<Container> containers = containerDao.findContainerByVanLocation(vanLocation);
        return containers;
    }

    public List<Container> findContainerByLadenEmpty(String ladenEmpty){
        List<Container> containers = containerDao.findContainerByLadenEmpty(ladenEmpty);
        return containers;
    }

    public List<Container> findContainerByRemarks(String remarks){
        List<Container> containers = containerDao.findContainerByRemarks(remarks);
        return containers;
    }

    public List<Container> findContainerByVanTo(String vanTo){
        List<Container> containers = containerDao.findContainerByVanTo(vanTo);
        return containers;
    }

    public List<Container> findContainerByVanFrom(String vanFrom){
        List<Container> containers = containerDao.findContainerByVanFrom(vanFrom);
        return containers;
    }

    public List<Container> findContainerByForkliftOperator(String forkliftOperator){
        List<Container> containers = containerDao.findContainerByForkliftOperator(forkliftOperator);
        return containers;
    }

    public List<Container> findContainerByOperationsDept(String operationsDept){
        List<Container> containers = containerDao.findContainerByOperationsDept(operationsDept);
        return containers;
    }

    @Override
    public Container findContainerById(Integer containerId) {
        Container container = containerDao.findContainerById(containerId);
        return container;
    }
}
