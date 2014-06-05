package com.sr.apps.freightbit.vendor.formbean;

import java.util.ArrayList;
import java.util.List;

import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class VendorBean {

    private String vendorId;
    private Integer clientId;
    private String vendorCode;
    private String vendorName;
    private String vendorClass;
    private String vendorType;
    private String status;
    private List <VesselBean> vesselBeanList;
    private List <TruckBean> truckBeanList;
    private List <DriverBean> driverBeanList;
    private List <AddressBean> addressBeanList;
    private List <ContactBean> contactBeanList;
    private OtherInformationBean otherInformationBean;

	public VendorBean() {

    }

    public VendorBean(String vendorId, Integer clientId, String vendorCode,
                      String vendorName, String vendorClass, String vendorType, String status) {
        this.vendorId = vendorId;
        this.clientId = clientId;
        this.vendorCode = vendorCode;
        this.vendorName = vendorName;
        this.vendorClass = vendorClass;
        this.vendorType = vendorType;
        this.status = status;
    }

    public String getVendorId() {
        return vendorId;
    }

    public void setVendorId(String vendorId) {
        this.vendorId = vendorId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getVendorClass() {
        return vendorClass;
    }

    public void setVendorClass(String vendorClass) {
        this.vendorClass = vendorClass;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getVendorType() {
        return vendorType;
    }

    public void setVendorType(String vendorType) {
        this.vendorType = vendorType;
    }
    

    public List<VesselBean> getVesselBeanList() {
		return vesselBeanList;
	}

	public void setVesselBeanList(List<VesselBean> vesselBeanList) {
		this.vesselBeanList = vesselBeanList;
	}

	public List<TruckBean> getTruckBeanList() {
		return truckBeanList;
	}

	public void setTruckBeanList(List<TruckBean> truckBeanList) {
		this.truckBeanList = truckBeanList;
	}

	public List<DriverBean> getDriverBeanList() {
		return driverBeanList;
	}

	public void setDriverBeanList(List<DriverBean> driverBeanList) {
		this.driverBeanList = driverBeanList;
	}

	public List<AddressBean> getAddressBeanList() {
		return addressBeanList;
	}

	public void setAddressBeanList(List<AddressBean> addressBeanList) {
		this.addressBeanList = addressBeanList;
	}

	public List<ContactBean> getContactBeanList() {
		return contactBeanList;
	}

	public void setContactBeanList(List<ContactBean> contactBeanList) {
		this.contactBeanList = contactBeanList;
	}

	public OtherInformationBean getOtherInformationBean() {
		return otherInformationBean;
	}

	public void setOtherInformationBean(OtherInformationBean otherInformationBean) {
		this.otherInformationBean = otherInformationBean;
	}

}
