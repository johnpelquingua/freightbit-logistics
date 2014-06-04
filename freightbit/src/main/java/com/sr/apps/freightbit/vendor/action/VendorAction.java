package com.sr.apps.freightbit.vendor.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.vendor.formbean.DriverBean;
import com.sr.apps.freightbit.vendor.formbean.TruckBean;
import com.sr.apps.freightbit.vendor.formbean.VendorBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.vendor.service.DriverService;
import com.sr.biz.freightbit.vendor.service.TrucksService;
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
    private List<TruckBean> trucks = new ArrayList<TruckBean>();
    private List<DriverBean> drivers = new ArrayList<DriverBean>();

    private List<Parameters> vendorTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorSearchList = new ArrayList<Parameters>();
    private List<Parameters> statusList = new ArrayList<Parameters>();
    private List<Parameters> truckTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorClassList = new ArrayList<Parameters>();

    private VendorBean vendor = new VendorBean();
    private TruckBean truck = new TruckBean();
    private DriverBean driver = new DriverBean();

    private String vendorCodeParam;
    private String truckCodeParam;
    private String driverCodeParam;

    private VendorService vendorService;
    private ClientService clientService;
    private ParameterService parameterService;
    private UserService userService;
    private TrucksService trucksService;
    private DriverService driverService;

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
        Integer vendorId = vendorService.addVendor(transformToEntityBean(vendor));
        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("vendorId", vendorId);
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
        //load all trucks

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer vendorId = (Integer) sessionAttributes.get("vendorId");

        List<Trucks> truckEntityList = trucksService.findTrucksByVendorId(vendorId);
        for (Trucks truckElem : truckEntityList) {
            trucks.add(transformToFormBeanTrucks(truckElem));
        }
        return SUCCESS;
    }

    public String loadEditTrucksPage() {
        //load all trucks

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer vendorId = (Integer) sessionAttributes.get("vendorId");

        List<Trucks> truckEntityList = trucksService.findTrucksByVendorId(vendorId);
        for (Trucks truckElem : truckEntityList) {
            trucks.add(transformToFormBeanTrucks(truckElem));
        }

        //load to form
        Trucks truckEntity = trucksService.findTrucksByTruckCode(truckCodeParam);
        truck = transformToFormBeanTrucks(truckEntity);
        return SUCCESS;
    }

    public String addTrucks() throws Exception{
        validateOnSubmitTrucks(truck);
        if(hasFieldErrors()) {
            return INPUT;
        }
        trucksService.addTrucks(transformToEntityBeanTrucks(truck));
        return SUCCESS;
    }

    public String editTrucks() {
        validateOnSubmitTrucks(truck);
        if(hasFieldErrors()){
            return INPUT;
        }
        trucksService.updateTrucks(transformToEntityBeanTrucks(truck));
        return SUCCESS;
    }

    public String deleteTrucks() {
        Trucks truckEntity = trucksService.findTrucksByTruckCode(truckCodeParam);
        trucksService.deleteTrucks(truckEntity);
        return SUCCESS;
    }

    private Trucks transformToEntityBeanTrucks(TruckBean truckBean) {
        Trucks entity = new Trucks();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (truckBean.getTruckId() != null) {
            entity.setTruckId(truckBean.getTruckId());
        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        entity.setVendorId((Integer) sessionAttributes.get("vendorId"));
        entity.setTruckType(truckBean.getTruckType());
        entity.setPlateNumber(truckBean.getPlateNumber());
        entity.setModelNumber(truckBean.getModelNumber());
        entity.setModelYear(truckBean.getModelYear());
        entity.setEngineNumber(truckBean.getEngineNumber());
        entity.setTruckCode(truckBean.getTruckCode());
        entity.setGrossWeight(truckBean.getGrossWeight());

        return entity;
    }

    private TruckBean transformToFormBeanTrucks(Trucks entity) {
        TruckBean formBean = new TruckBean();
        formBean.setTruckId(entity.getTruckId());
        formBean.setTruckType(entity.getTruckType());
        formBean.setModelNumber(entity.getModelNumber());
        formBean.setModelYear(entity.getModelYear());
        formBean.setEngineNumber(entity.getEngineNumber());
        formBean.setTruckCode(entity.getTruckCode());
        formBean.setGrossWeight(entity.getGrossWeight());
        formBean.setPlateNumber(entity.getPlateNumber());

        return formBean;
    }

    public void validateOnSubmitTrucks(TruckBean truckBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(truckBean.getPlateNumber())) {
            addFieldError("truck.plateNumber", getText("err.plateNumber.required"));
        }
        if (StringUtils.isBlank(truckBean.getModelNumber())) {
            addFieldError("truck.modelNumber", getText("err.modelNumber.required"));
        }
        if (truckBean.getModelYear() == null) {
            addFieldError("truck.modelYear", getText("err.modelYear.required"));
        }
        if (StringUtils.isBlank(truckBean.getEngineNumber())) {
            addFieldError("truck.engineNumber", getText("err.engineNumber.required"));
        }
        if (StringUtils.isBlank(truckBean.getTruckCode())) {
            addFieldError("truck.truckCode", getText("err.truckCode.required"));
        }
        if (truckBean.getGrossWeight() == null) {
            addFieldError("truck.grossWeight", getText("err.grossWeight.required"));
        }
    }

    //drivers

    public String loadAddDriverPage() {

        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer vendorId = (Integer) sessionAttributes.get("vendorId");

        List<Driver> driverEntityList = driverService.findDriverByVendorId(vendorId);
        for (Driver driverE1em : driverEntityList) {
            drivers.add(transformToFormBeanDriver(driverE1em));
        }

        return SUCCESS;
    }

    public String addDriver() throws Exception{
        validateOnSubmitDriver(driver);
        if(hasFieldErrors()) {
            return INPUT;
        }
        driverService.addDriver(transformToEntityBeanDriver(driver));
        return SUCCESS;
    }

    public String editDriver() {

        return SUCCESS;
    }

    public String deleteDriver() {
        Driver driverEntity = driverService.findDriverByDriverCode(driverCodeParam);
        driverService.deleteDriver(driverEntity);
        return SUCCESS;
    }

    public Driver transformToEntityBeanDriver(DriverBean driverBean) {
        Driver entity = new Driver();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if(driverBean.getDriverId() != null) {
            entity.setDriverId(driverBean.getDriverId());
        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        entity.setVendorId((Integer) sessionAttributes.get("vendorId"));
        entity.setDriverCode(driverBean.getDriverCode());
        entity.setLicenseNumber(driverBean.getLicenseNumber());
        entity.setLastName(driverBean.getLastName());
        entity.setFirstName(driverBean.getFirstName());
        entity.setMiddleName(driverBean.getMiddleName());
        entity.setTitle(driverBean.getTitle());
        entity.setStatus(driverBean.getStatus());

        return entity;

    }

    public DriverBean transformToFormBeanDriver(Driver entity) {
        DriverBean formBean = new DriverBean();

        formBean.setDriverId(entity.getDriverId());
        formBean.setDriverCode(entity.getDriverCode());
        formBean.setLicenseNumber(entity.getLicenseNumber());
        formBean.setLastName(entity.getLastName());
        formBean.setFirstName(entity.getFirstName());
        formBean.setMiddleName(entity.getMiddleName());
        formBean.setTitle(entity.getTitle());
        formBean.setStatus(entity.getStatus());

        return formBean;
    }

    public void validateOnSubmitDriver(DriverBean driverBean) {
        clearErrorsAndMessages();

        if (StringUtils.isBlank(driverBean.getDriverCode())) {
            addFieldError("driver.driverCode", getText("err.driverCode.required"));
        }
        if (StringUtils.isBlank(driverBean.getLicenseNumber())) {
            addFieldError("driver.licenseNumber", getText("err.licenseNumber.required"));
        }
        if (StringUtils.isBlank(driverBean.getLastName())) {
            addFieldError("driver.lastName", getText("err.lastName.required"));
        }
        if (StringUtils.isBlank(driverBean.getFirstName())) {
            addFieldError("driver.firstName", getText("err.firstName.required"));
        }
        if (StringUtils.isBlank(driverBean.getMiddleName())) {
            addFieldError("driver.middleName", getText("err.middleName.required"));
        }
        if (StringUtils.isBlank(driverBean.getTitle())) {
            addFieldError("driver.title", getText("err.title.required"));
        }
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
        vendorClassList = parameterService.getParameterMap(ParameterConstants.VENDOR_CLASS);
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

    public void setTrucksService(TrucksService trucksService) {
        this.trucksService = trucksService;
    }

    public void setDriverService(DriverService driverService) {
        this.driverService = driverService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public List<VendorBean> getVendors() {
        return vendors;
    }

    public void setVendors(List<VendorBean> vendors) {
        this.vendors = vendors;
    }

    public List<TruckBean> getTrucks() {
        return trucks;
    }

    public void setTrucks(List<TruckBean> trucks) {
        this.trucks = trucks;
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

    public List<Parameters> getVendorClassList() {
        return vendorClassList;
    }

    public void setVendorClassList(List<Parameters> vendorClassList) {
        this.vendorClassList = vendorClassList;
    }

    public TruckBean getTruck() {
        return truck;
    }

    public void setTruck(TruckBean truck) {
        this.truck = truck;
    }

    public List<DriverBean> getDrivers() {
        return drivers;
    }

    public void setDrivers(List<DriverBean> drivers) {
        this.drivers = drivers;
    }

    public DriverBean getDriver() {
        return driver;
    }

    public void setDriver(DriverBean driver) {
        this.driver = driver;
    }

    public String getDriverCodeParam() {
        return driverCodeParam;
    }

    public void setDriverCodeParam(String driverCodeParam) {
        this.driverCodeParam = driverCodeParam;
    }
}
