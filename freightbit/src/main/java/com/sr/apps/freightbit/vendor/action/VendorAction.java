package com.sr.apps.freightbit.vendor.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.vendor.formbean.DriverBean;
import com.sr.apps.freightbit.vendor.formbean.TruckBean;
import com.sr.apps.freightbit.vendor.formbean.VendorBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.apps.freightbit.vendor.formbean.VesselBean;
import com.sr.biz.freightbit.common.entity.Contacts;

import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.vendor.entity.Vessel;
import com.sr.biz.freightbit.vendor.service.DriverService;
import com.sr.biz.freightbit.vendor.service.TrucksService;
import com.sr.biz.freightbit.vendor.service.VendorService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Date;
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
    private List<ContactBean> contacts = new ArrayList<ContactBean>();
    private List<VesselBean> vessels = new ArrayList<VesselBean>();

    private List<Parameters> vendorTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorSearchList = new ArrayList<Parameters>();
    private List<Parameters> statusList = new ArrayList<Parameters>();
    private List<Parameters> truckTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorClassList = new ArrayList<Parameters>();
    private List<Parameters> contactTypeList = new ArrayList<Parameters>();

    private VendorBean vendor = new VendorBean();
    private TruckBean truck = new TruckBean();
    private DriverBean driver = new DriverBean();
    private ContactBean contact = new ContactBean();
    private VesselBean vessel = new VesselBean();

    private String vendorCodeParam;
    private Integer vendorIdParam;
    private String truckCodeParam;
    private String driverCodeParam;
    private Integer contactCodeParam;
    private String searchType;
    private String vendorKeyword;
    private String vesselNameParam;

    private VendorService vendorService;
    private ClientService clientService;
    private ParameterService parameterService;
    private UserService userService;
    private VendorService trucksService;
    private DriverService driverService;

    public String viewVendors() {
        String column = getColumnFilter();
        List<Vendor> vendorEntityList = new ArrayList<Vendor>();

        if (StringUtils.isNotBlank(column)) {
            vendorEntityList = vendorService.findVendorsByCriteria(column, vendor.getVendorKeyword(), getClientId());
        } else {
            vendorEntityList = vendorService.findAllVendors();
        }

        for (Vendor vendorElem : vendorEntityList) {
            vendors.add(transformToFormBean(vendorElem));
        }
        return SUCCESS;
    }

    public String getColumnFilter() {
        String column = "";
        if ("companyCode".equals(vendor.getVendorSearchCriteria())) {
            column = "vendorCode";
        } else if ("companyName".equals(vendor.getVendorSearchCriteria())) {
            column = "vendorName";
        } else if ("vendorType".equals(vendor.getVendorSearchCriteria())) {
            column = "vendorType";
        }
        return column;
    }


    public String loadAddVendorPage() {
        return SUCCESS;
    }

    public String loadSearchVendorPage() {
        return SUCCESS;
    }



    public String addVendor() throws Exception {
        validateOnSubmit(vendor);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.addVendor(transformToEntityBean(vendor));

        if ("TRUCKING".equals(vendor.getVendorType())) {
            return "TRUCKING";
        } else {
            return "SHIPPING";
        }
    }

    public String loadEditVendorPage() {
        Vendor vendorEntity = vendorService.findVendorByVendorCode(vendorCodeParam);
        vendor = transformToFormBean(vendorEntity);
        return SUCCESS;
    }

    public String loadEditVendorTrucksPage() {
        //load all trucks

        Integer vendorId = getSessionVendorId();

        List<Trucks> truckEntityList = vendorService.findTrucksByVendorId(vendorId);
        for (Trucks truckElem : truckEntityList) {
            trucks.add(transformToFormBeanTrucks(truckElem));
        }

        //load to form
        Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);
        truck = transformToFormBeanTrucks(truckEntity);
        return SUCCESS;
    }

    public String loadVendorInfo() {
        return SUCCESS;
    }

    public String loadSaveCompletePage() {
        List<Vendor> vendorEntityList = vendorService.findAllVendors();
        for (Vendor vendorElem : vendorEntityList) {
            vendors.add(transformToFormBean(vendorElem));
        }
        return SUCCESS;
    }

    public String editVendor() {
        validateOnSubmitEdit(vendor);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.updateVendor(transformToEntityBean(vendor));
        return SUCCESS;
    }

    public String deleteVendor() {
        Vendor vendorEntity = vendorService.findVendorByVendorCode(vendorCodeParam);
        vendorService.deleteVendor(vendorEntity);
        return SUCCESS;
    }

    public String viewInfoVendor() {
        Vendor vendorEntity = vendorService.findVendorByVendorCode(vendorCodeParam);
        vendor = transformToFormBean(vendorEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("vendorId", vendor.getVendorId());

        if ("TRUCKING".equals(vendor.getVendorType())) {
            return "TRUCKING";
        } else {
            return "SHIPPING";
        }
    }

    public void validateOnSubmit(VendorBean vendorBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(vendorBean.getVendorName())) {
            addFieldError("vendor.vendorName", getText("err.vendorName.required"));
        }
        if (StringUtils.isBlank(vendorBean.getVendorCode())) {
            addFieldError("vendor.vendorCode", getText("err.vendorCode.required"));
        }
    }

    public void validateOnSubmitEdit(VendorBean vendorBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(vendorBean.getVendorName())) {
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
        entity.setVendorStatus(vendorBean.getVendorStatus());
        entity.setVendorType(vendorBean.getVendorType());

        return entity;
    }

    private VendorBean transformToFormBean(Vendor entity) {
        VendorBean formBean = new VendorBean();
        formBean.setVendorId((entity.getVendorId()));
        formBean.setVendorName(entity.getVendorName());
        formBean.setClientId(entity.getClient().getClientId());
        formBean.setVendorClass(entity.getVendorClass());
        formBean.setVendorCode(entity.getVendorCode());
        formBean.setVendorType(entity.getVendorType());
        formBean.setVendorStatus(entity.getVendorStatus());
        return formBean;

    }

    //trucks
    public String loadAddTrucksPage() {
        return SUCCESS;
    }

    public String loadEditTrucksPage() {
        //load to form
        Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);
        truck = transformToFormBeanTrucks(truckEntity);
        return SUCCESS;
    }

    public String addTrucks() throws Exception {
        validateOnSubmitTrucks(truck);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.addTrucks(transformToEntityBeanTrucks(truck));
        return SUCCESS;
    }

    public String editTrucks() {
        validateOnSubmitTrucks(truck);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.updateTrucks(transformToEntityBeanTrucks(truck));
        return SUCCESS;
    }

    public String deleteTrucks() {
        Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);
        vendorService.deleteTrucks(truckEntity);
        return SUCCESS;
    }

    public String loadSaveCompleteTrucks() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer vendorId = (Integer) sessionAttributes.get("vendorId");
        List<Trucks> truckEntityList = vendorService.findTrucksByVendorId(vendorId);
        for (Trucks truckElem : truckEntityList) {
            trucks.add(transformToFormBeanTrucks(truckElem));
        }
        return SUCCESS;
    }

    public String viewTrucks() {
        Integer vendorId = getSessionVendorId();
        List<Trucks> truckEntityList = vendorService.findTrucksByVendorId(vendorId);
        for (Trucks truckElem : truckEntityList) {
            trucks.add(transformToFormBeanTrucks(truckElem));
        }
        return SUCCESS;
    }

    private Trucks transformToEntityBeanTrucks(TruckBean truckBean) {
        Trucks entity = new Trucks();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (truckBean.getTruckId() != null) {
            entity.setTruckId(truckBean.getTruckId());
        }

        Integer vendorId = getSessionVendorId();

        entity.setVendorId(vendorId);
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
        formBean.setVendorId(entity.getVendorId());

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

    public String loadSaveCompleteDrivers() {
        List<Driver> driverEntityList = new ArrayList<Driver>();

        Integer vendorId = getSessionVendorId();
        driverEntityList = vendorService.findDriverByVendorId(vendorId);

        for (Driver driverElem : driverEntityList) {
            drivers.add(transformToFormBeanDriver(driverElem));
        }
        return SUCCESS;
    }
    public String viewDrivers() {
        List<Driver> driverEntityList = new ArrayList<Driver>();

        Integer vendorId = getSessionVendorId();
        driverEntityList = vendorService.findDriverByVendorId(vendorId);

        for (Driver driverElem : driverEntityList) {
            drivers.add(transformToFormBeanDriver(driverElem));
        }
        return SUCCESS;
    }

    public String loadAddDriverPage() {

        Integer vendorId = getSessionVendorId();

        List<Driver> driverEntityList = vendorService.findDriverByVendorId(vendorId);
        for (Driver driverE1em : driverEntityList) {
            drivers.add(transformToFormBeanDriver(driverE1em));
        }

        return SUCCESS;
    }

    public String loadEditDriverPage() {

        Integer vendorId = getSessionVendorId();

        List<Driver> driverEntityList = vendorService.findDriverByVendorId(vendorId);
        for (Driver driverE1em : driverEntityList) {
            drivers.add(transformToFormBeanDriver(driverE1em));
        }

        Driver driverEntity = vendorService.findDriverByDriverCode(driverCodeParam);
        driver = transformToFormBeanDriver(driverEntity);

        return SUCCESS;
    }

    public String addDriver() throws Exception {
        validateOnSubmitDriver(driver);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.addDriver(transformToEntityBeanDriver(driver));
        return SUCCESS;
    }

    public String editDriver() {
        validateOnSubmitDriver(driver);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.updateDriver(transformToEntityBeanDriver(driver));
        return SUCCESS;
    }

    public String deleteDriver() {
        Driver driverEntity = vendorService.findDriverByDriverCode(driverCodeParam);
        vendorService.deleteDriver(driverEntity);
        return SUCCESS;
    }

    public Driver transformToEntityBeanDriver(DriverBean driverBean) {
        Driver entity = new Driver();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (driverBean.getDriverId() != null) {
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

    //vessels
    public String loadAddVesselsPage() {
        return SUCCESS;
    }

    public String loadEditVesselsPage() {
        Vessel vesselEntity = vendorService.findVesselByName(vesselNameParam);
        vessel = transformToFormBeanVessel(vesselEntity);
        return SUCCESS;
    }

    public String addVessels() throws Exception {
        validateOnSubmitVessels(vessel);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.addVessel(transformToEntityBeanVessels(vessel));
        return SUCCESS;
    }

    public String editVessels() {
        validateOnSubmitVessels(vessel);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.updateVessel(transformToEntityBeanVessels(vessel));
        return SUCCESS;
    }

    public String deleteVessels() {
        Vessel vesselEntity = vendorService.findVesselByName(vesselNameParam);
        vendorService.deleteVessel(vesselEntity);
        return SUCCESS;
    }

    public String viewVessels() {
        Integer vendorId = getSessionVendorId();
        List<Vessel> vesselEntityList = vendorService.findVesselByVendorId(vendorId);
        for (Vessel vesselElem : vesselEntityList) {
            vessels.add(transformToFormBeanVessel(vesselElem));
        }
        return SUCCESS;
    }

    public String loadSaveCompleteVessels() {
        Integer vendorId = getSessionVendorId();
        List<Vessel> vesselEntityList = vendorService.findVesselByVendorId(vendorId);
        for (Vessel vesselElem : vesselEntityList) {
            vessels.add(transformToFormBeanVessel(vesselElem));
        }
        return SUCCESS;
    }

    private Vessel transformToEntityBeanVessels(VesselBean vesselBean) {
        Vessel entity = new Vessel();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (vesselBean.getVesselId() != null) {
            entity.setVesselId(vesselBean.getVesselId());
        }

        Integer vendorId = getSessionVendorId();

        entity.setVendorId(vendorId);
        entity.setVesselNumber(vesselBean.getVesselNumber());
        entity.setVesselName(vesselBean.getVesselName());
        entity.setModelNumber(vesselBean.getModelNumber());
        entity.setModelYear(vesselBean.getModelYear());
        entity.setCreatedBy("admin");
        entity.setModifiedBy("admin");

        return entity;
    }

    private VesselBean transformToFormBeanVessel(Vessel entity) {
        VesselBean formBean = new VesselBean();

        formBean.setModelNumber(entity.getModelNumber());
        formBean.setVesselName(entity.getVesselName());
        formBean.setVesselNumber(entity.getVesselNumber());
        formBean.setModelYear(entity.getModelYear());
        formBean.setVendorId(entity.getVendorId());
        formBean.setVesselId(entity.getVesselId());

        return formBean;
    }

    public void validateOnSubmitVessels(VesselBean vesselBean) {
        clearErrorsAndMessages();

        if (StringUtils.isBlank(vesselBean.getVesselNumber())) {
            addFieldError("vessel.vesselNumber", getText("err.vesselNumber.required"));
        }
        if (StringUtils.isBlank(vesselBean.getModelNumber())) {
            addFieldError("vessel.modelNumber", getText("err.modelNumber.required"));
        }
        if (vesselBean.getModelYear() == null) {
            addFieldError("vessel.modelYear", getText("err.modelYear.required"));
        }
        if (StringUtils.isBlank(vesselBean.getVesselName())) {
            addFieldError("vessel.vesselName", getText("err.vesselName.required"));
        }

    }

    //contacts

    public String viewContacts() {
        Integer vendorId = getSessionVendorId();
        List<Contacts> contactEntityList = new ArrayList<Contacts>();
        contactEntityList = vendorService.findContactByReferenceId(vendorId);
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }
        return SUCCESS;
    }

    public String loadAddTruckingContact() {
        return SUCCESS;
    }

    public String loadEditTruckingContact() {
        Contacts contactEntity = vendorService.findContactById(contactCodeParam);
        contact = transformToFormBeanContacts(contactEntity);
        return SUCCESS;
    }

    public String loadAddShippingContact(){
        return SUCCESS;
    }

    public String loadEditShippingContact(){
        Contacts contactEntity = vendorService.findContactById(contactCodeParam);
        contact = transformToFormBeanContacts(contactEntity);
        return SUCCESS;
    }

    public String addContacts()  throws Exception{
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.addContact(transformToEntityBeanContacts(contact));
        return SUCCESS;
    }

    public String editContacts() {
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        vendorService.updateContact(transformToEntityBeanContacts(contact));
        return SUCCESS;
    }

    public String deleteContacts() {

        Contacts contactEntity = vendorService.findContactById(contactCodeParam);
        vendorService.deleteContact(contactEntity);
        return SUCCESS;
    }

    private Contacts transformToEntityBeanContacts (ContactBean contactBean) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        if (contactBean.getContactId() != null) {
            entity.setContactId(contactBean.getContactId());
        }
        Integer vendorId = getSessionVendorId();
        entity.setReferenceId(vendorId);
        entity.setReferenceTable("VENDOR");
        entity.setContactType(contactBean.getContactType());
        entity.setFirstName(contactBean.getFirstName());
        entity.setMiddleName(contactBean.getMiddleName());
        entity.setLastName(contactBean.getLastName());
        entity.setPhone(contactBean.getPhone());
        entity.setMobile(contactBean.getMobile());
        entity.setFax(contactBean.getFax());
        entity.setEmail(contactBean.getEmail());
        entity.setCreatedTimestamp(new Date());
        entity.setCreatedBy("Admin");
        entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy("Admin");
        return entity;
    }

    private ContactBean transformToFormBeanContacts (Contacts entity) {
        ContactBean formBean = new ContactBean();
        Integer vendorId = getSessionVendorId();
        formBean.setContactId (entity.getContactId());
        formBean.setReferenceTable("VENDOR");
        formBean.setReferenceId(vendorId);
        formBean.setContactType(entity.getContactType());
        formBean.setFirstName(entity.getFirstName());
        formBean.setMiddleName(entity.getMiddleName());
        formBean.setLastName(entity.getLastName());
        formBean.setPhone(entity.getPhone());
        formBean.setMobile(entity.getMobile());
        formBean.setFax(entity.getFax());
        formBean.setEmail(entity.getEmail());
        return formBean;
    }


    public void validateOnSubmitContact (ContactBean contactBean) {
        clearErrorsAndMessages();

        if (StringUtils.isBlank(contactBean.getLastName())) {
            addFieldError("contact.lastName", getText("err.lastNameContact.required"));
        }
        if (StringUtils.isBlank(contactBean.getFirstName())) {
            addFieldError("contact.firstName", getText("err.firstNameContact.required"));
        }
        if (StringUtils.isBlank(contactBean.getMiddleName())) {
            addFieldError("contact.middleName", getText("err.middleNameContact.required"));
        }
        if (StringUtils.isBlank(contactBean.getPhone())) {
            addFieldError("contact.phone", getText("err.phoneContact.required"));
        }
    }

    //utils
    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }


    private Integer getSessionVendorId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer vendorId = (Integer) sessionAttributes.get("vendorId");

        return vendorId;
    }

    @Override
    public void prepare(){
        vendorTypeList = parameterService.getParameterMap(ParameterConstants.VENDOR_TYPE);
        vendorSearchList = parameterService.getParameterMap(ParameterConstants.VENDOR_SEARCH);
        statusList = parameterService.getParameterMap(ParameterConstants.STATUS);
        truckTypeList = parameterService.getParameterMap(ParameterConstants.TRUCK_TYPE);
        vendorClassList = parameterService.getParameterMap(ParameterConstants.VENDOR_CLASS);
        contactTypeList = parameterService.getParameterMap(ParameterConstants.CONTACT_TYPE);
    }

    public String getVendorKeyword() {
        return vendorKeyword;
    }

    public void setVendorKeyword(String vendorKeyword) {
        this.vendorKeyword = vendorKeyword;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
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

    public void setTrucksService(VendorService trucksService) {
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

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
    }

    public List<Parameters> getContactTypeList() {
        return contactTypeList;
    }

    public void setContactTypeList(List<Parameters> contactTypeList) {
        this.contactTypeList = contactTypeList;
    }

    public Integer getContactCodeParam() {
        return contactCodeParam;
    }

    public void setContactCodeParam(Integer contactCodeParam) {
        this.contactCodeParam = contactCodeParam;
    }

    public List<ContactBean> getContacts() {
        return contacts;
    }

    public void setContacts(List<ContactBean> contacts) {
        this.contacts = contacts;
    }

    public Integer getVendorIdParam() {
        return vendorIdParam;
    }

    public void setVendorIdParam(Integer vendorIdParam) {
        this.vendorIdParam = vendorIdParam;
    }



    public List<VesselBean> getVessels() {
        return vessels;
    }

    public void setVessels(List<VesselBean> vessels) {
        this.vessels = vessels;
    }

    public VesselBean getVessel() {
        return vessel;
    }

    public void setVessel(VesselBean vessel) {
        this.vessel = vessel;
    }

    public String getVesselNameParam() {
        return vesselNameParam;
    }

    public void setVesselNameParam(String vesselNameParam) {
        this.vesselNameParam = vesselNameParam;
    }
}
