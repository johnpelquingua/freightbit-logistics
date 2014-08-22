package com.sr.apps.freightbit.core.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;

public class GeneralSettingsAction extends ActionSupport implements Preparable {
	
	private ParameterService parameterService;
	private CommonUtils commonUtils;
	private List <Parameters> vendorClassParamList = new ArrayList<Parameters>();
	private List <Parameters> customerTypeParamList = new ArrayList<Parameters>();
	private List <Parameters> portsParamsList = new ArrayList<Parameters>();
	private String vendorClassAdded;
	private String customerTypeAdded;
	private String portsAdded;
	
	public String loadGeneralSettings() {
		return SUCCESS;
	}
	
	public String editGeneralSettings() {
		List <Parameters> newVendorClassParamList = transformToParameterEntityBean(vendorClassAdded, ParameterConstants.VENDORS, ParameterConstants.VENDOR_CLASS);
		List <Parameters> newCustomerTypeParamList = transformToParameterEntityBean(customerTypeAdded, ParameterConstants.CUSTOMERS, ParameterConstants.CUSTOMER_TYPE);
		List <Parameters> newPortParamList = transformToParameterEntityBean(portsAdded, ParameterConstants.ORDER, ParameterConstants.PORTS);
		parameterService.updateParameters(newVendorClassParamList, "VENDORS", "VENDOR_CLASS");
		parameterService.updateParameters(newCustomerTypeParamList, "CUSTOMERS", "CUSTOMER_TYPE");
		parameterService.updateParameters(newPortParamList, "ORDER", "PORTS");
		return SUCCESS;
	}
	
	private List <Parameters> transformToParameterEntityBean(String parameterString, String referenceTable, String referenceColumn) {
		String[] parameterArray = parameterString.split(",");
		List <Parameters> parameterList = new ArrayList<Parameters>();
		for (int i=0; i<parameterArray.length; i++) {
			String currStr = parameterArray[i].trim();
			if (StringUtils.isNotBlank(currStr)) {
				Parameters paramEntity = new Parameters();
				paramEntity.setClientId(commonUtils.getClientId());
				paramEntity.setCreatedBy(commonUtils.getUserNameFromSession());
				paramEntity.setKey(currStr.toUpperCase());
				paramEntity.setLabel(currStr);
				paramEntity.setModifiedBy(commonUtils.getUserNameFromSession());
				paramEntity.setReferenceColumn(referenceColumn);
				paramEntity.setReferenceTable(referenceTable);
				paramEntity.setValue(currStr);
				parameterList.add(paramEntity);
			}
		}
		return parameterList;
	}
	
    @Override
    public void prepare() {
        vendorClassParamList = parameterService.getParameterMap(ParameterConstants.VENDORS, ParameterConstants.VENDOR_CLASS);
        customerTypeParamList = parameterService.getParameterMap(ParameterConstants.CUSTOMERS, ParameterConstants.CUSTOMER_TYPE);
        portsParamsList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.PORTS);
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

	public void setParameterService(ParameterService parameterService) {
		this.parameterService = parameterService;
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


}