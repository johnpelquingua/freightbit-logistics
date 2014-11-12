package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.ConsolidationDao;
import com.sr.biz.freightbit.order.entity.OrderItems;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class ConsolidationDaoImpl extends HibernateDaoSupport implements ConsolidationDao {

	private static final Logger Log = Logger.getLogger(ConsolidationDaoImpl.class);

	@Override
	public void addContainer(OrderItems orderItems){
		Log.debug("Adding new Container");
		try{
			Session session = getSessionFactory().getCurrentSession();
			session.save(orderItems);
			Log.debug("Successfully added new Container to OrderItem Table");
		}catch (Exception e){
			Log.error("Adding failed");
			throw e;
		}
	}

	public void updateContainer(OrderItems orderItems){
		Log.debug("Updating Container");
		try{
			Session session = getSessionFactory().getCurrentSession();
			session.saveOrUpdate(orderItems);
			Log.debug("Successfully updated new Container to OrderItem Table");

		}catch(Exception e){
			Log.error("Updating failed");
			throw e;
		}
	}

	@Override
	public List<OrderItems> findContainerByOrderItemId(Integer orderItemId) {
		Log.debug("Finding OrderItems via orderItemId");
		try {
			Query query = getSessionFactory().getCurrentSession().createQuery("from Container where orderItemId = :orderItemId");
			query.setParameter("orderItemId", orderItemId);
			List<OrderItems> results = (List<OrderItems>) query.list();
			Log.debug("Find OrderItems by orderItemId successful, result size: " + results.size());
			return results;
		} catch (Exception e) {
			Log.error("Find OrderItems by orderItemId failed", e);
			throw e;
		}
	}
}