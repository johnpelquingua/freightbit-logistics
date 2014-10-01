package com.sr.apps.freightbit.core.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.exceptions.ParameterInUseException;
import com.sr.biz.freightbit.common.service.NotificationService;

public class GeneralSettingsAction extends ActionSupport implements Preparable {
	
	private ParameterService parameterService;
	private NotificationService notificationService;
	private CommonUtils commonUtils;
	private List <Parameters> vendorClassParamList = new ArrayList<Parameters>();
	private List <Parameters> customerTypeParamList = new ArrayList<Parameters>();
	private List <Parameters> portsParamsList = new ArrayList<Parameters>();
	private List <Parameters> vendorTypeParamList = new ArrayList<Parameters>();
	private List <Parameters> contactTypeParamList = new ArrayList<Parameters>();
	private List <Parameters> addressTypeParamList = new ArrayList<Parameters>();
	private String vendorClassAdded;
	private String customerTypeAdded;
	private String portsAdded;
	private String vendorTypeAdded;
	private String contactTypeAdded;
	private String addressTypeAdded;
	private Map<String, String> vendorClassMap = new HashMap<String, String>();
	
	public String loadGeneralSettings() {
		//notificationService.sendEmailNotification("admin", "Test Subject", "Test");
		return SUCCESS;
	}
	
	public String editGeneralSettings() throws Exception {
		List <Parameters> newVendorClassParamList = transformToParameterEntityBean(vendorClassAdded, ParameterConstants.VENDORS, ParameterConstants.VENDOR_CLASS);
		List <Parameters> newCustomerTypeParamList = transformToParameterEntityBean(customerTypeAdded, ParameterConstants.CUSTOMERS, ParameterConstants.CUSTOMER_TYPE);
		List <Parameters> newPortParamList = transformToParameterEntityBean(portsAdded, ParameterConstants.ORDER, ParameterConstants.PORTS);
		List <Parameters> newVendorTypeParamList = transformToParameterEntityBean(vendorTypeAdded, ParameterConstants.VENDORS, ParameterConstants.VENDOR_TYPE);
		List <Parameters> newContactTypeParamList = transformToParameterEntityBean(contactTypeAdded, ParameterConstants.CONTACTS, ParameterConstants.CONTACT_TYPE);
		List <Parameters> newAddressTypeParamList = transformToParameterEntityBean(addressTypeAdded, ParameterConstants.ADDRESS, ParameterConstants.ADDRESS_TYPE);
		try {
			parameterService.updateParameters(newVendorClassParamList, ParameterConstants.VENDORS, ParameterConstants.VENDOR_CLASS);
			parameterService.updateParameters(newCustomerTypeParamList, ParameterConstants.CUSTOMERS, ParameterConstants.CUSTOMER_TYPE);
			parameterService.updateParameters(newPortParamList, ParameterConstants.ORDER, ParameterConstants.PORTS);
			parameterService.updateParameters(newVendorTypeParamList, ParameterConstants.VENDORS, ParameterConstants.VENDOR_TYPE);
			parameterService.updateParameters(newContactTypeParamList, ParameterConstants.CONTACTS, ParameterConstants.CONTACT_TYPE);
			parameterService.updateParameters(newAddressTypeParamList, ParameterConstants.ADDRESS, ParameterConstants.ADDRESS_TYPE);
		} catch (ParameterInUseException e) {
			addActionError(e.getName());
			addActionMessage(e.getName());
			return INPUT;
		} catch (Exception e) {
			addActionError("Error updating fields");
			return INPUT;
		}
		clearErrorsAndMessages();
	    addActionMessage("Success! Parameters have been updated.");
		return SUCCESS;
	}
	
	private List <Parameters> transformToParameterEntityBean(String parameterString, String referenceTable, String referenceColumn) {
		String[] parameterArray = parameterString.split(","); //{key:value}
		List <Parameters> parameterList = new ArrayList<Parameters>();
		for (int i=0; i<parameterArray.length; i++) {
			String currMap = parameterArray[i].trim();
			if (StringUtils.isNotBlank(currMap)) {
				String key = currMap.substring(1,currMap.indexOf(":"));
				String value = currMap.substring(currMap.indexOf(":")+1, currMap.indexOf("}"));
				Parameters paramEntity = new Parameters();
				if (!key.startsWith("NEW_")) {
					paramEntity.setParameterId(Integer.parseInt(key));
					paramEntity.setValue(value);		
					parameterList.add(paramEntity);
				} else {
					if (StringUtils.isNotBlank(value)) {
						paramEntity.setClientId(commonUtils.getClientId());
						paramEntity.setCreatedBy(commonUtils.getUserNameFromSession());
						paramEntity.setLabel(value);
						paramEntity.setModifiedBy(commonUtils.getUserNameFromSession());
						paramEntity.setReferenceColumn(referenceColumn);
						paramEntity.setReferenceTable(referenceTable);
						paramEntity.setValue(value);
						paramEntity.setKey(value.toUpperCase());
						parameterList.add(paramEntity);
					}
				}
			}
		}
		return parameterList;
	}
	
    @Override
    public void prepare() {
        vendorClassParamList = parameterService.getParameterMap(ParameterConstants.VENDORS, ParameterConstants.VENDOR_CLASS);
        customerTypeParamList = parameterService.getParameterMap(ParameterConstants.CUSTOMERS, ParameterConstants.CUSTOMER_TYPE);
        portsParamsList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.PORTS);
        vendorTypeParamList = parameterService.getParameterMap(ParameterConstants.VENDORS, ParameterConstants.VENDOR_TYPE);
        contactTypeParamList = parameterService.getParameterMap(ParameterConstants.CONTACTS, ParameterConstants.CONTACT_TYPE);
        addressTypeParamList = parameterService.getParameterMap(ParameterConstants.ADDRESS, ParameterConstants.ADDRESS_TYPE);
    }
    

	public String getVendorClassAdded() {
		return vendorClassAdded;
	}

	public void setVendorClassAdded(String vendorClassAdded) {
		this.vendorClassAdded = vendorClassAdded;
	}

	public String getCustomerTypeAdded() {
		return customerTypeAdded;
	}

	public void setCustomerTypeAdded(String customerTypeAdded) {
		this.customerTypeAdded = customerTypeAdded;
	}

	public String getPortsAdded() {
		return portsAdded;
	}

	public void setPortsAdded(String portsAdded) {
		this.portsAdded = portsAdded;
	}

	public List<Parameters> getVendorTypeParamList() {
		return vendorTypeParamList;
	}

	public void setVendorTypeParamList(List<Parameters> vendorTypeParamList) {
		this.vendorTypeParamList = vendorTypeParamList;
	}

	public String getVendorTypeAdded() {
		return vendorTypeAdded;
	}

	public void setVendorTypeAdded(String vendorTypeAdded) {
		this.vendorTypeAdded = vendorTypeAdded;
	}

	public void setParameterService(ParameterService parameterService) {
		this.parameterService = parameterService;
	}

	
	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}

	public void setCommonUtils(CommonUtils commonUtils) {
		this.commonUtils = commonUtils;
	}

	public List<Parameters> getVendorClassParamList() {
		return vendorClassParamList;
	}

	public void setVendorClassParamList(List<Parameters> vendorClassParamList) {
		this.vendorClassParamList = vendorClassParamList;
	}

	public List<Parameters> getCustomerTypeParamList() {
		return customerTypeParamList;
	}

	public void setCustomerTypeParamList(List<Parameters> customerTypeParamList) {
		this.customerTypeParamList = customerTypeParamList;
	}

	public List<Parameters> getPortsParamsList() {
		return portsParamsList;
	}

	public void setPortsParamsList(List<Parameters> portsParamsList) {
		this.portsParamsList = portsParamsList;
	}

	public List<Parameters> getContactTypeParamList() {
		return contactTypeParamList;
	}

	public void setContactTypeParamList(List<Parameters> contactTypeParamList) {
		this.contactTypeParamList = contactTypeParamList;
	}

	public List<Parameters> getAddressTypeParamList() {
		return addressTypeParamList;
	}

	public void setAddressTypeParamList(List<Parameters> addressTypeParamList) {
		this.addressTypeParamList = addressTypeParamList;
	}

	public String getContactTypeAdded() {
		return contactTypeAdded;
	}

	public void setContactTypeAdded(String contactTypeAdded) {
		this.contactTypeAdded = contactTypeAdded;
	}

	public String getAddressTypeAdded() {
		return addressTypeAdded;
	}

	public void setAddressTypeAdded(String addressTypeAdded) {
		this.addressTypeAdded = addressTypeAdded;
	}

	public Map<String, String> getVendorClassMap() {
		return vendorClassMap;
	}

	public void setVendorClassMap(Map<String, String> vendorClassMap) {
		this.vendorClassMap = vendorClassMap;
	}

	
	

}