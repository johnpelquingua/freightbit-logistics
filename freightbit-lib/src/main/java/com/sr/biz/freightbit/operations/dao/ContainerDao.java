package com.sr.biz.freightbit.operations.dao;

import com.sr.biz.freightbit.operations.entity.Container;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */
public interface ContainerDao {

    public void addContainer(Container container) throws Exception;

    public void updateContainer(Container container);

    public void deleteContainer(Container container);

    public List findAllContainer();

    public List<Container> findContainerByOrderNumber(String orderNumber);

    public List<Container> findContainerByEIRNumber(String eirNumber);

    public List<Container> findContainerByPortCode(String portCode);

    public List<Container> findContainerByReceiptNumber(String receiptNumber);

    public List<Container> findContainerBySealNumber(String sealNumber);

    public List<Container> findContainerByContainerNumber(String containerNumber);

    public List<Container> findContainerByContainerSize(String containerSize);

    public List<Container> findContainerByContainerType(String containerType);

    public List<Container> findContainerByContainerStatus(String containerStatus);

    public List<Container> findContainerByShipping(String shipping);

    public List<Container> findContainerByTrucking(String trucking);

    public List<Container> findContainerByPlateNumber(String plateNumber);

    public List<Container> findContainerByVanNumber(String vanNumber);

    public List<Container> findContainerByDriver(String driver);

    public List<Container> findContainerByBookingNum(String bookingNum);

    public List<Container> findContainerByVanLocation(String vanLocation);

    public List<Container> findContainerByLadenEmpty(String ladenEmpty);

    public List<Container> findContainerByRemarks(String remarks);

    public List<Container> findContainerByVanTo(String vanTo);

    public List<Container> findContainerByVanFrom(String vanFrom);

    public List<Container> findContainerByForkliftOperator(String forkliftOperator);

    public List<Container> findContainerByOperationsDept(String operationsDept);

    public Container findContainerById(Integer containerId);

    public List<Container> findContainerByCriteria(String column, String value);
}
