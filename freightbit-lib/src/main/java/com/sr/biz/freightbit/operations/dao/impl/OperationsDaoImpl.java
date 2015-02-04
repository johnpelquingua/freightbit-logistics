package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.OperationsDao;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
public class OperationsDaoImpl extends HibernateDaoSupport implements OperationsDao {

    private static final Logger log = Logger.getLogger(OrderStatusLogsDaoImpl.class);

    @Override
    public List<Orders> findAllOrders() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders order by createdTimestamp desc");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderIdSea(Integer orderId) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId and o.status='PLANNING 1'");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderIdLand(Integer orderId) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId and (o.status = 'PLANNING 2' or o.status = 'PLANNING 3')");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<OrderItems> findAllOrderItemsByVoyageNumber(String vesselScheduleId) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.vesselScheduleId = :vesselScheduleId");
            query.setParameter("vesselScheduleId", vesselScheduleId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }    }

    @Override
    public List<Orders> findOrdersByFCL() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL CONTAINER LOAD' order by createdTimestamp desc ");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByFCLTrucks(){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL CONTAINER LOAD' and o.serviceType in (:typeList) order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByFCLTrucksOrigin(String originationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL CONTAINER LOAD' and o.serviceType in (:typeList) and o.originationPort = :originationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByFCLTrucksDestination(String destinationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL CONTAINER LOAD' and o.serviceType in (:typeList) and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationFCL(String originationPort, String destinationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL CONTAINER LOAD' and o.originationPort = :originationPort and o.destinationPort = :destinationPort order by createdTimestamp desc");
            query.setParameter("originationPort", originationPort);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLCL() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS CONTAINER LOAD' order by createdTimestamp desc ");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLCLTrucks(){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS CONTAINER LOAD' and o.serviceType in (:typeList) order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLCLTrucksOrigin(String originationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS CONTAINER LOAD' and o.serviceType in (:typeList) and o.originationPort = :originationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLCLTrucksDestination(String destinationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS CONTAINER LOAD' and o.serviceType in (:typeList) and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationLCL(String originationPort, String destinationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS CONTAINER LOAD' and o.originationPort = :originationPort and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameter("originationPort", originationPort);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationStatusTypeLCL(String originationPort, String destinationPort) {

        List<String> statusList = new ArrayList<>();
        List<String> typeList = new ArrayList<>();

        statusList.add("PENDING");
        statusList.add("ON GOING");

        typeList.add("SHIPPING");
        typeList.add("SHIPPING AND TRUCKING");

        log.debug("Finding orders with filter");
        try {
            log.debug("Finding orders succeeded");

            /*----------------------------------------------------TO BE REFACTORED-----------------------------------------------------------------*/

            Query query = getSessionFactory().getCurrentSession().createQuery(" from Orders o where o.orderStatus in (:statusList) and o.serviceRequirement = 'LESS CONTAINER LOAD' and o.serviceType in (:typeList) and o.originationPort = :originationPort and o.destinationPort = :destinationPort ");

            /*String sql = "select o.destinationPort, sum(oi.weight) , sum(oi.volume) from Orders o left outer join OrderItems oi on o.orderId = oi.orderId group by o.destinationPort";*/
            /*String sql = "select o.destinationPort, sum(oi.weight), sum(oi.volume) from Orders o inner join Orderitems oi where o.orderId = oi.orderId group by o.destinationPort" ;*/
            /*Query query = getSessionFactory().getCurrentSession().createSQLQuery( sql );*/

            query.setParameterList("statusList", statusList);
            query.setParameterList("typeList", typeList);
            query.setParameter("originationPort", originationPort);
            query.setParameter("destinationPort", destinationPort);

            List<Orders> results = (List<Orders>) query.list();
            return results;

        } catch (Exception e) {
            log.error("Finding orders failed");
            throw e;
        }

    }

    @Override
    public List<Orders> findOrdersByLCU() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LOOSE CARGO LOAD' order by createdTimestamp desc ");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLCUTrucks(){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LOOSE CARGO LOAD' and o.serviceType in (:typeList) order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLCUTrucksOrigin(String originationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LOOSE CARGO LOAD' and o.serviceType in (:typeList) and o.originationPort = :originationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLCUTrucksDestination(String destinationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LOOSE CARGO LOAD' and o.serviceType in (:typeList) and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationLCU(String originationPort, String destinationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LOOSE CARGO LOAD' and o.originationPort = :originationPort and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameter("originationPort", originationPort);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByRCU() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'ROLLING CARGO LOAD' order by createdTimestamp desc ");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByRCUTrucks(){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'ROLLING CARGO LOAD' and o.serviceType in (:typeList) order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByRCUTrucksOrigin(String originationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'ROLLING CARGO LOAD' and o.serviceType in (:typeList) and o.originationPort = :originationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByRCUTrucksDestination(String destinationPort){
        List<String> typeList = new ArrayList<>();
        typeList.add("TRUCKING");
        typeList.add("SHIPPING AND TRUCKING");
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'ROLLING CARGO LOAD' and o.serviceType in (:typeList) and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameterList("typeList", typeList);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationRCU(String originationPort, String destinationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'ROLLING CARGO LOAD' and o.originationPort = :originationPort and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameter("originationPort", originationPort);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByFTL() {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL TRUCK LOAD' order by createdTimestamp desc ");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        }catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationFTL(String originationPort, String destinationPort) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL TRUCK LOAD' and o.originationPort = :originationPort and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameter("originationPort", originationPort);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        }catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginFTL(String originationPort) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL TRUCK LOAD' and o.originationPort = :originationPort order by createdTimestamp desc ");
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        }catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByLTL() {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS TRUCK LOAD' order by createdTimestamp desc ");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        }catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationLTL(String originationPort, String destinationPort) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS TRUCK LOAD' and o.originationPort = :originationPort and o.destinationPort = :destinationPort order by createdTimestamp desc ");
            query.setParameter("originationPort", originationPort);
            query.setParameter("destinationPort", destinationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        }catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByOriginLTL(String originationPort) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS TRUCK LOAD' and o.originationPort = :originationPort order by createdTimestamp desc ");
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        }catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public OrderItems findOrderItemById(Integer orderItemId) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded");
            OrderItems instance = (OrderItems) getSessionFactory().getCurrentSession().get(OrderItems.class, orderItemId);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;
        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId){
        log.debug("Find initiated");
        try {
            log.debug("Find succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.vendorId = :vendorId");
            query.setParameter("vendorId", vendorId);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVendorIdOriDesClass(Integer vendorId, String originPort, String destinationPort ) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.vendorId = :vendorId and v.originPort = :originPort and v.destinationPort = :destinationPort");
            query.setParameter("vendorId", vendorId);
            query.setParameter("originPort", originPort);
            query.setParameter("destinationPort", destinationPort);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            return results;

        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByOriDesClass(String originPort, String destinationPort ) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.originPort = :originPort and v.destinationPort = :destinationPort");
            query.setParameter("originPort", originPort);
            query.setParameter("destinationPort", destinationPort);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            return results;

        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findAllVesselSchedule() {
        log.debug("Find initiated");
        try {
             log.debug("Find succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules");
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public void updateOrderItem(OrderItems orderItems) {
        log.debug("Updating orderItems thru Planning Module");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(orderItems);
            log.debug("Update Successful");
        } catch (Exception e) {
            log.error("Update failed", e);
            throw e;
        }
    }
}
