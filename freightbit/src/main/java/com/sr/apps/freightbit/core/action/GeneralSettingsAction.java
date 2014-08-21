package com.sr.apps.freightbit.core.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;

public class GeneralSettingsAction extends ActionSupport implements Preparable {
	
	private ParameterService parameterService;
	private List <Parameters> vendorClassParamList = new ArrayList<Parameters>();
	private List <Parameters> customerTypeParamList = new ArrayList<Parameters>();
	private List <Parameters> portsParamsList = new ArrayList<Parameters>();

	public String loadGeneralSettings() {
		return SUCCESS;
	}
	
	public String editGeneralSettings() {
		parameterService.updateParameters(vendorClassParamList, "VENDORS", "VENDOR_CLASS");
		parameterService.updateParameters(customerTypeParamList, "CUSTOMERS", "CUSTOMER_TYPE");
		parameterService.updateParameters(portsParamsList, "ORDER", "PORTS");
		return SUCCESS;
	}
	
    @Override
    public void prepare() {
        vendorClassParamList = parameterService.getParameterMap(ParameterConstants.VENDORS, ParameterConstants.VENDOR_CLASS);
        customerTypeParamList = parameterService.getParameterMap(ParameterConstants.CUSTOMERS, ParameterConstants.CUSTOMER_TYPE);
        portsParamsList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.STATUS);
    }

	public ParameterService getParameterService() {
		return parameterService;
	}

	public void setParameterService(ParameterService parameterService) {
		this.parameterService = parameterService;
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