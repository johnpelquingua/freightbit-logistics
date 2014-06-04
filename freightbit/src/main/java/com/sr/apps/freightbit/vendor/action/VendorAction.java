package com.sr.apps.freightbit.vendor.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.vendor.formbean.VendorBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.vendor.service.VendorService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class VendorAction extends ActionSupport implements Preparable {

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(VendorAction.class);

    private List<VendorBean> vendors = new ArrayList<VendorBean>();
    private List<Parameters> vendorTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorSearchList = new ArrayList<Parameters>();
    private List<Parameters> statusList = new ArrayList<Parameters>();
    private List<Parameters> truckTypeList = new ArrayList<Parameters>();
    private VendorBean vendor = new VendorBean();
    private String vendorCodeParam;
    private String truckCodeParam;

    private VendorService vendorService;
    private ClientService clientService;
    private ParameterService parameterService;
    private UserService userService;

    public String viewVendorsByClientId() {
        List<Vendor> vendorEntityList = vendorService.findAllVendorByClientId(getClientId());
        for (Vendor vendorElem : vendorEntityList) {
            vendors.add(transformToFormBean(vendorElem));
        }
        return SUCCESS;
    }

    public String viewVendors() {
        List<Vendor> vendorEntityList = vendorService.findAllVendors();
        for (Vendor vendorElem : vendorEntityList) {
            vendors.add(transformToFormBean(vendorElem));
        }
        return SUCCESS;
    }

    public String loadAddVendorPage() {
        return SUCCESS;
    }

    public String loadSearchVendorPage() {
        return SUCCESS;
    }

    public String addVendor() throws Exception {
        validateOnSubmit(vendor);
        if(hasFieldErrors()) {
            return INPUT;
        }
        vendorService.addVendor(transformToEntityBean(vendor));
        return SUCCESS;
    }

    public String loadEditVendorPage() {
        Vendor vendorEntity = vendorService.findVendorByVendorCode(vendorCodeParam);
        vendor = transformToFormBean(vendorEntity);
        return SUCCESS;
    }

    public String editVendor() {
        validateOnSubmit(vendor);
        if(hasFieldErrors()) {
            return INPUT;
        }
        vendorService.updateVendor(transformToEntityBean(vendor));
        return SUCCESS;
    }

    public String deleteVendor(){
        Vendor vendorEntity = vendorService.findVendorByVendorCode(vendorCodeParam);
        vendorService.deleteVendor(vendorEntity);
        return SUCCESS;
    }

    public void validateOnSubmit(VendorBean vendorBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(vendorBean.getVendorName())){
            addFieldError("vendor.vendorName", getText("err.vendorName.required"));
        }
        if (StringUtils.isBlank(vendorBean.getVendorCode())) {
            addFieldError("vendor.vendorCode", getText("err.vendorCode.required"));
        }

    }

    private Vendor transformToEntityBean(VendorBean vendorBean) {
        Vendor entity = new Vendor();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (vendorBean.getVendorId() != null) {
            entity.setVendorId(new Integer(vendorBean.getVendorId()));
        }

        entity.setVendorCode(vendorBean.getVendorCode());
        entity.setVendorClass(vendorBean.getVendorClass());
        entity.setVendorName(vendorBean.getVendorName());
        entity.setVendorStatus(vendorBean.getStatus());
        entity.setVendorType(vendorBean.getVendorType());

        return entity;
    }

    private VendorBean transformToFormBean(Vendor entity) {
        VendorBean formBean = new VendorBean();
        formBean.setVendorId(Long.toString(entity.getVendorId()));
        formBean.setVendorName(entity.getVendorName());
        formBean.setClientId(entity.getClient().getClientId());
        formBean.setVendorClass(entity.getVendorClass());
        formBean.setVendorCode(entity.getVendorCode());
        formBean.setVendorType(entity.getVendorType());
        formBean.setStatus(entity.getVendorStatus());
        return formBean;

    }

    //trucks
    public String loadAddTrucksPage() {
        return SUCCESS;
    }

    public String viewTrucks() {

        return SUCCESS;
    }

    public String addTrucks() {

        return SUCCESS;
    }

    public String editTrucks() {

        return SUCCESS;
    }

    public String deleteTrucks() {
        return SUCCESS;
    }


    //utils
    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    @Override
    public void prepare(){
        vendorTypeList = parameterService.getParameterMap(ParameterConstants.VENDOR_TYPE);
        vendorSearchList = parameterService.getParameterMap(ParameterConstants.VENDOR_SEARCH);
        statusList = parameterService.getParameterMap(ParameterConstants.STATUS);
        truckTypeList = parameterService.getParameterMap(ParameterConstants.TRUCK_TYPE);
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public List<VendorBean> getVendors() {
        return vendors;
    }

    public void setVendors(List<VendorBean> vendors) {
        this.vendors = vendors;
    }

    public List<Parameters> getVendorTypeList() {
        return vendorTypeList;
    }

    public void setVendorTypeList(List<Parameters> vendorTypeList) {
        this.vendorTypeList = vendorTypeList;
    }

    public List<Parameters> getStatusList() {
        return statusList;
    }

    public void setStatusList(List<Parameters> statusList) {
        this.statusList = statusList;
    }

    public VendorBean getVendor() {
        return vendor;
    }

    public void setVendor(VendorBean vendor) {
        this.vendor = vendor;
    }

    public String getVendorCodeParam() {
        return vendorCodeParam;
    }

    public void setVendorCodeParam(String vendorCodeParam) {
        this.vendorCodeParam = vendorCodeParam;
    }

    public List<Parameters> getVendorSearchList() {
        return vendorSearchList;
    }

    public void setVendorSearchList(List<Parameters> vendorSearchList) {
        this.vendorSearchList = vendorSearchList;
    }

    public List<Parameters> getTruckTypeList() {
        return truckTypeList;
    }

    public void setTruckTypeList(List<Parameters> truckTypeList) {
        this.truckTypeList = truckTypeList;
    }

    public String getTruckCodeParam() {
        return truckCodeParam;
    }

    public void setTruckCodeParam(String truckCodeParam) {
        this.truckCodeParam = truckCodeParam;
    }
}
