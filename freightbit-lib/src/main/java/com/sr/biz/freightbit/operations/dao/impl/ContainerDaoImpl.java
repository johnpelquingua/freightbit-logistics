package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.ContainerDao;
import com.sr.biz.freightbit.operations.entity.Container;

import com.sr.biz.freightbit.vendor.entity.Vendor;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */

@Transactional
public class ContainerDaoImpl extends HibernateDaoSupport implements ContainerDao{

    private static final Logger Log = Logger.getLogger(ContainerDaoImpl.class);

    @Override
    public void addContainer(Container container) {
        Log.debug("Adding new Container");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(container);
            Log.debug("Successfully added new Container");
        }catch (Exception e) {
            Log.error("Adding of new Container failed");
            throw e;
        }
    }

    @Override
    public void updateContainer(Container container) {
        Log.debug("Editing a Container");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(container);
            Log.debug("Successfully edited a container");
        } catch (Exception e) {
            Log.error("Editing of a Container failed");
            throw e;
        }
    }

    @Override
    public void deleteContainer(Container container){
        Log.debug("Deleting a Container");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(container);
            Log.debug("Successfully delete a Container");
        } catch (Exception e){
            Log.error("Deleting of Container Failed");
            throw e;
        }
    }

    @Override
    public List<Container>  findAllContainer() {
        Log.debug("Finding all Containers");
        try {
            return getSessionFactory().getCurrentSession().createQuery("from Container").list();
        } catch (Exception e) {
            Log.error("Finding Container failed");
            throw e;
        }
    }

    @Override
    public List<Container> findContainerByOrderNumber(String orderNumber) {
        Log.debug("Finding Container via orderNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where orderNumber = :orderNumber");
            query.setParameter("orderNumber", orderNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by orderNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by orderNumber failed", e);
            throw e;
        }
    }

    @Override
    public List<Container> findContainerByEIRNumber(String eirNumber) {
        Log.debug("Finding Container via eirNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where eirNumber = :eirNumber");
            query.setParameter("eirNumber", eirNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by eirNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Contatiner by eirNnumber failed", e);
            throw e;
        }
    }

    @Override
    public List<Container> findContainerByPortCode(String portCode) {
        Log.debug("Finding Container via portCode");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where portCode = :portCode");
            query.setParameter("portCode", portCode);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by orderNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by orderNumber failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByReceiptNumber(String receiptNumber) {
        Log.debug("Finding Container via receiptNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where receiptNumber = :receiptNumber");
            query.setParameter("receiptNumber", receiptNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by receiptNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by receiptNumber failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByShipping(String shipping) {
        Log.debug("Finding Container via shipping");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where shipping = :shipping");
            query.setParameter("shipping", shipping);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by shipping successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by shipping failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByVanNumber(String vanNumber) {
        Log.debug("Finding Container via vanNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where vanNumber = :vanNumber");
            query.setParameter("vanNumber", vanNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by vanNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by vanNumber failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByVanLocation(String vanLocation) {
        Log.debug("Finding Container via vanLocation");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where vanLocation = :vanLocation");
            query.setParameter("vanLocation", vanLocation);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by vanLocation successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Contatine by vanLocation failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByTrucking(String trucking) {
        Log.debug("Finding Container via trucking");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where trucking = :trucking");
            query.setParameter("trucking", trucking);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by trucking successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by trucking failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByPlateNumber(String plateNumber) {
        Log.debug("Finding Container via plateNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where plateNumber = :plateNumber");
            query.setParameter("plateNumber", plateNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by plateNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by plateNumber failed", e);
            throw e;
        }
    }

    @Override
    public List<Container> findContainerByDriver(String driver) {
        Log.debug("Finding Container via driver");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where driver = :driver");
            query.setParameter("driver", driver);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by driver successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by driver failed", e);
            throw e;

        }
    }

    public List<Container> findContainerBySealNumber(String sealNumber) {
        Log.debug("Finding Container via eirNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where sealNumber = :sealNumber");
            query.setParameter("sealNumber", sealNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by sealNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by sealNumber failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByRemarks(String remarks) {
        Log.debug("Finding Container via eirNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where remarks = :remarks");
            query.setParameter("remarks", remarks);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by remarks successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by remarks failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByLadenEmpty(String ladenEmpty) {
        Log.debug("Finding Container via ladenEmpty");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where ladenEmpty = :ladenEmpty");
            query.setParameter("ladenEmpty", ladenEmpty);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by ladenEmpty successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by ladenEmpty failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByVanTo(String vanTo) {
        Log.debug("Finding Container via vanTo");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where vanTo = :vanTo");
            query.setParameter("vanTo", vanTo);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by vanTo successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by vanTo failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByVanFrom(String vanFrom) {
        Log.debug("Finding Container via vanFrom");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where vanFrom = :vanFrom");
            query.setParameter("vanFrom", vanFrom);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by vanFrom successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by vanFrom failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByForkliftOperator(String forkliftOperator) {
        Log.debug("Finding Container via forkliftOperator");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where forkliftOperator = :forkliftOperator");
            query.setParameter("forkliftOperator", forkliftOperator);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by forkliftOperator successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by forkliftOperator failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByOperationsDept(String operationsDept) {
        Log.debug("Finding Container via operationsDept");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where operationsDept = :operationsDept");
            query.setParameter("operationsDept", operationsDept);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by operationsDept successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by operationsDept failed", e);
            throw e;
        }
    }

    public List<Container> findContainerByContainerStatus(String containerStatus) {
        Log.debug("Finding Container via containerStatus");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where containerStatus = :containerStatus");
            query.setParameter("containerStatus", containerStatus);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by containerStatus successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by containerStatus failed", e);
            throw e;
        }
    }

    public List<Vendor> findVendorsByShippingType(String vendorType) {
        Log.debug("Finding Vendor via vendorType");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from vendors where vendorType = :vendorType");
            query.setParameter("vendorType", vendorType);
            List<Vendor> results = (List<Vendor>) query.list();
            Log.debug("Find Vendor by vendorType successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Vendor by vendorType failed", e);
            throw e;
        }
    }

    @Override
    public Container findContainerById(Integer containerId) {
        Log.debug("Finding Container By Id");
        try {
            Container instance = (Container) getSessionFactory().getCurrentSession().get(Container.class, containerId);
            if (instance == null) {
                Log.debug("Container Found!");
            } else {
                Log.debug("Container Not Found!");
            }
            return instance;
        }  catch (Exception e) {
            Log.error("Get Failed", e);
            throw e;
        }
    }

    @Override
    public List<Container> findContainerByCriteria(String column, String value) {
        Log.debug("Find vendor by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<Container> vendors = session.createCriteria(Container.class)
                .add(Restrictions.like(column, value, MatchMode.ANYWHERE))
                .list();
        return vendors;
    }

}
