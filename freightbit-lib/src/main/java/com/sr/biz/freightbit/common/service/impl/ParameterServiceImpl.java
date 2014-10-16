package com.sr.biz.freightbit.common.service.impl;

import com.sr.biz.freightbit.common.dao.AddressDao;
import com.sr.biz.freightbit.common.dao.ContactsDao;
import com.sr.biz.freightbit.common.dao.ParameterDao;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.exceptions.ParameterInUseException;
import com.sr.biz.freightbit.customer.dao.CustomerDao;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.order.dao.OrderDao;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vendor.dao.VendorDao;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional
public class ParameterServiceImpl implements ParameterService {

    private ParameterDao parameterDao;
    private VendorDao vendorDao;
    private OrderDao orderDao;
    private CustomerDao customerDao;
    private ContactsDao contactsDao;
    private AddressDao addressDao;

    public void setParameterDao(ParameterDao parameterDao) {
        this.parameterDao = parameterDao;
    }

    
    public void setVendorDao(VendorDao vendorDao) {
		this.vendorDao = vendorDao;
	}


	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}


	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}


	public void setContactsDao(ContactsDao contactsDao) {
		this.contactsDao = contactsDao;
	}


	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}


	@Override
    public List<Parameters> getParameterMap(String referenceColumn) {
        List<Parameters> parameterMap = parameterDao.findParameterMapByRefColumn(referenceColumn);
        return parameterMap;
    }

    @Override
    public List<Parameters> getParameterMap(String referenceTable, String referenceColumn) {
        List<Parameters> parameterMap = parameterDao.findParameterMapByRefColumn(referenceTable, referenceColumn);
        return parameterMap;
    }

    @Override
    public List<Parameters> findParametersByProperty(Map<String, Object> params) {
        return parameterDao.findParametersByProperty(params);
    }

    @Override
    public void addParameter(Parameters param) {
         parameterDao.addParameter(param);
    }
    
    @Override
    public void deleteParameter(Parameters param) {
    	 parameterDao.deleteParameter(param);
    }
    
    @Override
    public String updateParameters(List <Parameters> paramList, String referenceTable, String referenceColumn)
    	throws Exception {
    	//try {
    		for (Parameters param:paramList) {
				if (param.getParameterId()==null)
					parameterDao.addParameter(param);
				else {
					Parameters parameterFromDb = parameterDao.findParameterById(param.getParameterId());
					if (parameterFromDb != null) {
						String key = parameterFromDb.getKey();
						Integer clientId = parameterFromDb.getClientId();
						String value = parameterFromDb.getValue();
						if (value != null && !param.getValue().equals(value)) { //Check if any record use these parameters. If so, throw a ParameterInUseException
    						if ("VENDORS".equals(referenceTable) && "VENDOR_CLASS".equals(referenceColumn)) {
    							List <Vendor> vendorList = vendorDao.findVendorsByCriteria("vendorClass", key, clientId);
    							if (vendorList != null && vendorList.size() > 0) {
    								throw new ParameterInUseException("Cannot update Vendor Class. A vendor with Vendor Class '" + value + "' exists.");
    							}
    						} else if ("VENDORS".equals(referenceTable) && "VENDOR_TYPE".equals(referenceColumn)) {
    							List <Vendor> vendorList = vendorDao.findVendorsByCriteria("vendorType", key, clientId);
    							if (vendorList != null && vendorList.size() > 0) {
    								throw new ParameterInUseException("Cannot update Vendor Type. A vendor with Vendor Type '" + value + "' exists.");
    							}
    						} else if ("CUSTOMERS".equals(referenceTable) && "CUSTOMER_TYPE".equals(referenceColumn)) {
    							List <Customer> customerList = customerDao.findCustomersByCriteria("customerType", key, clientId);
    							if (customerList != null && customerList.size() > 0) {
    								throw new ParameterInUseException("Cannot update Customer Type. A customer with Customer Type '" + value + "' exists.");
    							}
    						} else if ("CONTACTS".equals(referenceTable) && "CONTACT_TYPE".equals(referenceColumn)) {
    					        Map<String, Object> paramMap = new HashMap<String, Object>();
    					        paramMap.put("contactType", key);
    					        paramMap.put("clientId", clientId);
    							List <Contacts> contactList = contactsDao.findContactsByParameterMap(paramMap, "Contacts");
    							if (contactList != null && contactList.size() > 0) {
    								throw new ParameterInUseException("Cannot update Contact Type. A contact with Contact Type '" + value + "' exists.");
    							}
    						} else if ("ADDRESS".equals(referenceTable) && "ADDRESS_TYPE".equals(referenceColumn)) {
    					        Map<String, Object> paramMap = new HashMap<String, Object>();
    					        paramMap.put("addressType", key);
    					        paramMap.put("clientId", clientId);
    							List <Address> addressList = addressDao.findAddressesByParameterMap(paramMap, "Address");
    							if (addressList != null && addressList.size() > 0) {
    								throw new ParameterInUseException("Cannot update Address Type. An address with Address Type '" + value + "' exists.");
    							}
    						} else if ("ORDER".equals(referenceTable) && "PORTS".equals(referenceColumn)) {
    							List <Orders> orderList = orderDao.findOrdersByCriteria("destinationPort", key, clientId);
    							if (orderList != null && orderList.size() > 0) {
    								throw new ParameterInUseException("Cannot update Ports. A booking with Origin Port or Destination Port '" + value + "' exists.");
    							}
    							orderList = orderDao.findOrdersByCriteria("originationPort", key, clientId);
    							if (orderList != null && orderList.size() > 0) {
    								throw new ParameterInUseException("Cannot update Ports. A booking with Origin Port or Destination Port '" + value + "' exists.");
    							}
    						}
						}
		    			if ("".equals(param.getValue())) {
		    				parameterDao.deleteParameter(param);
		    			} else if (!value.equals(param.getValue())) { //Only update if the values entered in the UI are not the same with those in the db 
		    				parameterDao.updateParameter(param);   	
		    			}
					}
				}
    		}
    		return "";
/*    	} catch (Exception e) {
    		if (paramList != null && paramList.size() > 0)
    			return paramList.get(0).getReferenceColumn();
    		else
    			return "ERROR";
    	}*/
    }
    
    /**
     * @param currentStatus is the current shipment monitoring activity/status
     */
    @Override
    public List<Parameters> findShipmentActivityParameters(String freightType,
			String serviceMode, String serviceReq, String currentStatus) {

    	List <Parameters>  parameterList = parameterDao.findParametersByCriteria("key", currentStatus);
    	Integer currentParameterId = null;
    	if (parameterList != null && parameterList.size() > 0) 
    		currentParameterId = parameterList.get(0).getParameterId();
    	
    	return parameterDao.findShipmentActivityParameters(freightType, serviceMode, serviceReq, currentParameterId);
    }

}
