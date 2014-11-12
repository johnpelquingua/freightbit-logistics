package com.sr.biz.freightbit.operations.service.impl;

import com.sr.biz.freightbit.operations.dao.ConsolidationDao;
import com.sr.biz.freightbit.operations.exceptions.ContainerAlreadyExistsException;
import com.sr.biz.freightbit.operations.service.ConsolidationService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class ConsolidationServiceImpl implements ConsolidationService {

	private ConsolidationDao consolidationDao;

	public void setConsolidationDao(ConsolidationDao consolidationDao){
		this.consolidationDao = consolidationDao;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addContainer(OrderItems orderItems){
		if(consolidationDao.findContainerByOrderItemId(orderItems.getOrderItemId()).size() > 0){
			throw new ContainerAlreadyExistsException(orderItems.getOrderItemId());
		}else{
			consolidationDao.addContainer(orderItems);
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateContainer(OrderItems orderItems){
		if(consolidationDao.findContainerByOrderItemId(orderItems.getOrderItemId()).size() > 0){
			throw new ContainerAlreadyExistsException(orderItems.getOrderItemId());
		}else{
			consolidationDao.updateContainer(orderItems);
		}
	}

	@Override
	public List<OrderItems> findContainerByOrderItemId(Integer orderItemId){
		List<OrderItems> orderItems = consolidationDao.findContainerByOrderItemId(orderItemId);
		return orderItems;
	}
}