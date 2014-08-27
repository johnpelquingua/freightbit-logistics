package com.sr.apps.freightbit.vendor.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.apps.freightbit.vendor.formbean.DriverBean;
import com.sr.apps.freightbit.vendor.formbean.TruckBean;
import com.sr.apps.freightbit.vendor.formbean.VendorBean;
import com.sr.apps.freightbit.vendor.formbean.VesselBean;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.entity.Vessel;
import com.sr.biz.freightbit.vendor.exceptions.DriverAlreadyExistsException;
import com.sr.biz.freightbit.vendor.exceptions.TrucksAlreadyExistsException;
import com.sr.biz.freightbit.vendor.exceptions.VendorAlreadyExistsException;
import com.sr.biz.freightbit.vendor.exceptions.VesselAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.DriverService;
import com.sr.biz.freightbit.vendor.service.VendorService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
    private List<AddressBean> addresss = new ArrayList<AddressBean>();

    private List<Parameters> vendorTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorSearchList = new ArrayList<Parameters>();
    private List<Parameters> statusList = new ArrayList<Parameters>();
    private List<Parameters> truckTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorClassList = new ArrayList<Parameters>();
    private List<Parameters> contactTypeList = new ArrayList<Parameters>();
    private List<Parameters> addressTypeList = new ArrayList<Parameters>();

    private VendorBean vendor = new VendorBean();
    private TruckBean truck = new TruckBean();
    private DriverBean driver = new DriverBean();
    private ContactBean contact = new ContactBean();
    private VesselBean vessel = new VesselBean();
    private AddressBean address = new AddressBean();

    private String vendorCodeParam;
    private Integer vendorIdParam;
    private String truckCodeParam;
    private String driverCodeParam;
    private Integer contactCodeParam;
    private String searchType;
    private String vendorKeyword;
    private String vesselNameParam;
    private Integer addressIdParam;

    private VendorService vendorService;
    private ClientService clientService;
    private ParameterService parameterService;
    private UserService userService;
    private VendorService trucksService;
    private DriverService driverService;
    private CommonUtils commonUtils;


    public String loadSearchVendorPage() {
        return SUCCESS;
    }


    public String viewVendors() {
        String column = getColumnFilter();
        List<Vendor> vendorEntityList = new ArrayList<Vendor>();

        if (StringUtils.isNotBlank(column)) {
            vendorEntityList = vendorService.findVendorsByCriteria(column, vendor.getVendorKeyword(), getClientId());
        } else {
            vendorEntityList = vendorService.findAllVendorByClientId(getClientId());
        }

        for (Vendor vendorElem : vendorEntityList) {
            vendors.add(transformToFormBean(vendorElem));
        }
        return SUCCESS;
    }


    public String loadAddVendorPage() {
        return SUCCESS;
    }


    public String addVendor() throws Exception {
        validateOnSubmit(vendor);
        if (hasFieldErrors())
            return INPUT;

        try {
            /*vendorService.addVendor(transformToEntityBean(vendor));*/

            Vendor vendorEntity = transformToEntityBean(vendor);
            vendorEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            vendorEntity.setCreatedTimeStamp(new Date());
            vendorEntity.setModifiedBY(commonUtils.getUserNameFromSession());
            vendorService.addVendor(vendorEntity);
        } catch (VendorAlreadyExistsException e) {
            addFieldError("vendor.vendorCode", getText("err.vendorCode.already.exists"));
            return INPUT;
        }

        clearErrorsAndMessages();
        addActionMessage("Success! New Vendor has been added.");

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



    public String editVendor() {
        validateOnSubmit(vendor);
        if (hasFieldErrors()) {
            return INPUT;
        }
        try {
            Vendor vendorEntity = transformToEntityBean(vendor);
            vendorEntity.setModifiedBY(commonUtils.getUserNameFromSession());
            vendorEntity.setModifiedTimeStamp(new Date());
            vendorService.updateVendor(vendorEntity);
        } catch (VendorAlreadyExistsException e) {
            addFieldError("vendor.vendorCode", getText("err.vendorCode.already.exists"));
            return INPUT;
        }
        /*return SUCCESS;*/
        clearErrorsAndMessages();
        addActionMessage("Success! Vendor has been updated.");
        if ("TRUCKING".equals(vendor.getVendorType())) {
            return "TRUCKING";
        } else {
            return "SHIPPING";
        }
    }

    public String loadVendorInfo() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("vendorId", vendor.getVendorId());
        sessionAttributes.put("vendorCode", vendor.getVendorCode());
        return SUCCESS;
    }


    public String viewInfoVendor() {
        Vendor vendorEntity = new Vendor();
        if (!StringUtils.isBlank(vendorCodeParam))
            vendorEntity = vendorService.findVendorByVendorCode(vendorCodeParam);
        else
            vendorEntity = vendorService.findVendorById(getSessionVendorId());
        vendor = transformToFormBean(vendorEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("vendorId", vendor.getVendorId());

        if ("TRUCKING".equals(vendor.getVendorType())) {
            return "TRUCKING";
        } else {
            return "SHIPPING";
        }

    }

    public String deleteVendor() {
        Vendor vendorEntity = vendorService.findVendorByVendorCode(vendorCodeParam);
        vendorService.deleteVendor(vendorEntity);

        clearErrorsAndMessages();
        addActionMessage("Success! Vendor has been deleted.");

        return SUCCESS;
    }

    public String loadSaveCompletePage() {
        List<Vendor> vendorEntityList = vendorService.findAllVendors();
        for (Vendor vendorElem : vendorEntityList) {
            vendors.add(transformToFormBean(vendorElem));
        }
        return SUCCESS;
    }

    public String loadEditVendorTrucksPage() {
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


    public String getColumnFilter() {
        String column = "";
        if ("COMPANY CODE".equals(vendor.getVendorSearchCriteria())) {
            column = "vendorCode";
        } else if ("COMPANY NAME".equals(vendor.getVendorSearchCriteria())) {
            column = "vendorName";
        } else if ("VENDOR TYPE".equals(vendor.getVendorSearchCriteria())) {
            column = "vendorType";
        }
        return column;
    }

    public void validateOnSubmit(VendorBean vendorBean) {
        clearErrorsAndMessages();

        String name = "^[a-zA-Z][a-zA-Z ]+$";
        String code = "[A-Z]+";


        Pattern namePattern = Pattern.compile(name);
        Pattern codePattern = Pattern.compile(code);


        Matcher matcher = namePattern.matcher(vendorBean.getVendorName());
        if (!matcher.matches()){
            addFieldError("vendor.vendorName", "Name must be letters only.");
        }

        matcher = codePattern.matcher(vendorBean.getVendorCode());
        if (!matcher.matches()){
            addFieldError("vendor.vendorCode", "Code must be capital letters only.");
        }

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
        entity.setCreatedBy(vendorBean.getCreatedBy());
        entity.setCreatedTimeStamp(vendorBean.getCreatedTimeStamp());

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

        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimeStamp());

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
        /*vendorService.addTrucks(transformToEntityBeanTrucks(truck));*/

        try {
            Trucks truckEntity = transformToEntityBeanTrucks(truck);
            truckEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            truckEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            truckEntity.setCreatedTimestamp(new Date());
            vendorService.addTrucks(truckEntity);
        }catch (TrucksAlreadyExistsException e) {
            addFieldError("truck.truckCode", getText("err.truck.already.exists"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String editTrucks() {
        validateOnSubmitTrucks(truck);
        if (hasFieldErrors()) {
            return INPUT;
        }
        /*vendorService.updateTrucks(transformToEntityBeanTrucks(truck));*/

        try {
            Trucks truckEntity = transformToEntityBeanTrucks(truck);
            truckEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            truckEntity.setModifiedTimestamp(new Date());
            vendorService.updateTrucks(truckEntity);
        }catch (TrucksAlreadyExistsException e){
            addFieldError("truck.truckCode", getText("err.truck.already.exists"));
            return INPUT;
        }
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
        clearErrorsAndMessages();
        addActionMessage("Success! Trucks has been updated.");
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
        entity.setCreatedBy(truckBean.getCreatedBy());
        entity.setCreatedTimestamp(truckBean.getCreatedTimeStamp());

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
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());

        return formBean;
    }

    public void validateOnSubmitTrucks(TruckBean truckBean) {
        clearErrorsAndMessages();

        String alpha = "[A-Z]+";
        String plate = "[A-Z][A-Z][A-Z]+[-]\\d\\d\\d";
        String alphaNumeric = "[A-Za-z0-9]+";
        String year = "[0-9]{4}";
        String weight = "[0-9]+";

        Pattern codePattern = Pattern.compile(alpha);
        Pattern plateNumberPattern = Pattern.compile(plate);
        Pattern alphaNumericPattern = Pattern.compile(alphaNumeric);
        Pattern yearPattern = Pattern.compile(year);
        Pattern weightPattern = Pattern.compile(weight);

        Matcher matcher = codePattern.matcher(truckBean.getTruckCode());
        if (!matcher.matches()) {
            addFieldError("truck.truckCode", "Code must be capital letters only.");
        }

        matcher = plateNumberPattern.matcher(truckBean.getPlateNumber());
        if (!matcher.matches()) {
            addFieldError("truck.plateNumber", "Plate Number must be in this format: ABC-123");
        }

        matcher = alphaNumericPattern.matcher(truckBean.getModelNumber());
        if (!matcher.matches()) {
            addFieldError("truck.modelNumber", "Model number must not contain special characters");
        }

        matcher = yearPattern.matcher(truckBean.getModelYear().toString());
        if (!matcher.matches()) {
            addFieldError("truck.modelYear", "Year must be numbers only");
        }

        matcher = weightPattern.matcher(truckBean.getGrossWeight().toString());
        if (!matcher.matches()) {
            addFieldError("truck.grossWeight", "Weight must be number only");
        }

        matcher = alphaNumericPattern.matcher(truckBean.getEngineNumber());
        if (!matcher.matches()) {
            addFieldError("truck.engineNumber", "Engine number must not contact special character");
        }

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

        clearErrorsAndMessages();
        addActionMessage("Success! Drivers has been updated.");

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

        try {
            Driver driverEntity = transformToEntityBeanDriver(driver);
            driverEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            driverEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            driverEntity.setCreatedTimestamp(new Date());
            vendorService.addDriver(driverEntity);
        }catch (DriverAlreadyExistsException e) {
            addFieldError("driver.driverCode", getText("err.driver.already.exists"));
            return INPUT;
        }
        /*vendorService.addDriver(transformToEntityBeanDriver(driver));*/
        return SUCCESS;
    }

    public String editDriver() {
        validateOnSubmitDriver(driver);
        if (hasFieldErrors()) {
            return INPUT;
        }
       /* vendorService.updateDriver(transformToEntityBeanDriver(driver));*/
        try{
            Driver driverEntity = transformToEntityBeanDriver(driver);
            driverEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            driverEntity.setModifiedTimestamp(new Date());
            vendorService.updateDriver(driverEntity);
        }catch (DriverAlreadyExistsException e){
            addFieldError("driver.driverCode", getText("err.driver.already.exists"));
            return INPUT;
        }

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
        entity.setCreatedBy(driverBean.getCreatedBy());
        entity.setCreatedTimestamp(driverBean.getCreatedTimeStamp());

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
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());

        return formBean;
    }

    public void validateOnSubmitDriver(DriverBean driverBean) {
        clearErrorsAndMessages();

        String alpha = "^[a-zA-Z][a-zA-Z ]+$";
        String alphaNumeric = "[A-Za-z0-9]+";

        Pattern namePattern = Pattern.compile(alpha);
        Pattern alphaNumericPattern = Pattern.compile(alphaNumeric);

        Matcher matcher = namePattern.matcher(driverBean.getLastName());
        if (!matcher.matches()) {
            addFieldError("driver.lastName", "Last Name must be letters only.");
        }

        matcher = namePattern.matcher(driverBean.getFirstName());
        if (!matcher.matches()) {
            addFieldError("driver.firstName", "First Name must be letters only.");
        }

        matcher = namePattern.matcher(driverBean.getTitle());
        if (!matcher.matches()) {
            addFieldError("driver.title", "Title must be letters only.");
        }

        matcher = alphaNumericPattern.matcher(driverBean.getLicenseNumber());
        if (!matcher.matches()) {
            addFieldError("driver.licenseNumber", "License Number must be in valid format.");
        }

        matcher= alphaNumericPattern.matcher(driverBean.getDriverCode());
        if (!matcher.matches()){
            addFieldError("driver.driverCode"," (Must be three (3) CAPITAL LETTERS only)");
        }


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
        /*vendorService.addVessel(transformToEntityBeanVessels(vessel));*/
        try {
            Vessel vesselEntity = transformToEntityBeanVessels(vessel);
            vesselEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            vesselEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            vesselEntity.setCreatedTimestamp(new Date());
            vendorService.addVessel(vesselEntity);
        } catch(VesselAlreadyExistsException e) {
            addFieldError("vessel.vesselNumber", getText("err.vessel.already.exists"));
            return INPUT;
        }

        return SUCCESS;
    }

    public String editVessels() {
        validateOnSubmitVessels(vessel);
        if (hasFieldErrors()) {
            return INPUT;
        }
        /*vendorService.updateVessel(transformToEntityBeanVessels(vessel));*/

        try{
            Vessel vesselEntity = transformToEntityBeanVessels(vessel);
            vesselEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            vesselEntity.setModifiedTimestamp(new Date());
            vendorService.updateVessel(vesselEntity);
        }catch (VesselAlreadyExistsException e){
            addFieldError("vessel.vesselNumber", getText("err.vessel.already.exists"));
            return INPUT;
        }

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

        clearErrorsAndMessages();
        addActionMessage("Success! Vessels has been updated.");

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
        entity.setCreatedBy(vesselBean.getCreatedBy());
        entity.setCreatedTimestamp(vesselBean.getCreatedTimeStamp());

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
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());

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

    public String loadSaveCompleteContacts() {
        Integer vendorId = getSessionVendorId();
        List<Contacts> contactEntityList = new ArrayList<Contacts>();
        contactEntityList = vendorService.findContactByReferenceId(vendorId);
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Contact Persons has been updated.");

        return SUCCESS;
    }

    public String loadAddContact() {
        return SUCCESS;
    }

    public String loadEditContact() {
        Contacts contactEntity = vendorService.findContactById(contactCodeParam);
        contact = transformToFormBeanContacts(contactEntity);
        return SUCCESS;
    }

    public String addContacts() throws Exception {
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        /*vendorService.addContact(transformToEntityBeanContacts(contact));*/
        try {
            Contacts contactEntity = transformToEntityBeanContacts(contact);

            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedTimestamp(new Date());
            vendorService.addContact(contactEntity);
        }catch (ContactAlreadyExistsException e) {
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }

        return SUCCESS;
    }

    public String editContacts() {
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        /*vendorService.updateContact(transformToEntityBeanContacts(contact));*/
        try {
            Contacts contactEntity = transformToEntityBeanContacts(contact);
            contactEntity.setModifiedTimestamp(new Date());
            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            vendorService.updateContact(contactEntity);
        }catch (ContactAlreadyExistsException e){
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String deleteContacts() {

        Contacts contactEntity = vendorService.findContactById(contactCodeParam);
        vendorService.deleteContact(contactEntity);

        return SUCCESS;
    }

    private Contacts transformToEntityBeanContacts(ContactBean contactBean) {
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
        entity.setCreatedBy(contactBean.getCreatedBy());
        entity.setCreatedTimestamp(contactBean.getCreatedTimestamp());
        entity.setPosition(contactBean.getPosition());
        return entity;
    }

    private ContactBean transformToFormBeanContacts(Contacts entity) {
        ContactBean formBean = new ContactBean();

        formBean.setContactId(entity.getContactId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setContactType(entity.getContactType());
        formBean.setFirstName(entity.getFirstName());
        formBean.setMiddleName(entity.getMiddleName());
        formBean.setLastName(entity.getLastName());
        formBean.setPhone(entity.getPhone());
        formBean.setMobile(entity.getMobile());
        formBean.setFax(entity.getFax());
        formBean.setEmail(entity.getEmail());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setPosition(entity.getPosition());
        return formBean;
    }


    public void validateOnSubmitContact(ContactBean contactBean) {
        clearErrorsAndMessages();

        if (StringUtils.isBlank(contactBean.getLastName())) {
            addFieldError("contact.lastName", getText("err.lastNameContact.required"));
        }
        if (StringUtils.isBlank(contactBean.getFirstName())) {
            addFieldError("contact.firstName", getText("err.firstNameContact.required"));
        }

        if (StringUtils.isBlank(contactBean.getPhone())) {
            addFieldError("contact.phone", getText("err.phoneContact.required"));
        }
        if (StringUtils.isBlank(contactBean.getEmail())) {
            addFieldError("contact.email", getText("err.email.required"));
        }
    }

    //address

    public String addAddress() throws Exception {
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }
        /*vendorService.addAddress(transformToEntityBeanAddress(address));*/
        Address addressEntity = transformToEntityBeanAddress(address);
        addressEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        addressEntity.setCreatedBy(commonUtils.getUserNameFromSession());
        addressEntity.setCreatedTimestamp(new Date());
        vendorService.addAddress(addressEntity);

        return SUCCESS;
    }

    public String editAddress() {
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }
        /*vendorService.updateAddress(transformToEntityBeanAddress(address));*/

        Address addressEntity = transformToEntityBeanAddress(address);
        addressEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        addressEntity.setModifiedTimestamp(new Date());
        vendorService.updateAddress(addressEntity);
        return SUCCESS;
    }

    public String deleteAddress() {
        Address addressEntity = vendorService.findAddressById(addressIdParam);
        vendorService.deleteAddress(addressEntity);
        return SUCCESS;
    }

    public String loadAddAddress() {
        return SUCCESS;
    }

    public String loadEditAddress() {
        Address addressEntity = vendorService.findAddressById(addressIdParam);
        address = transformToFormBeanAddress(addressEntity);
        return SUCCESS;
    }

    public String viewAddress() {
        Integer vendorId = getSessionVendorId();
        List<Address> addressEntityList = new ArrayList<Address>();
        addressEntityList = vendorService.findAllAddressByRefId(vendorId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }
        return SUCCESS;
    }

    public String loadSaveCompleteAddress() {
        Integer vendorId = getSessionVendorId();
        List<Address> addressEntityList = new ArrayList<Address>();
        addressEntityList = vendorService.findAllAddressByRefId(vendorId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Address has been updated.");

        return SUCCESS;
    }

    public void validateOnSubmitAddress(AddressBean addressBean) {
        clearErrorsAndMessages();

        String PATTERN = "[0-9]{4}";

        Pattern pattern = Pattern.compile(PATTERN);
        Matcher matcher1 = pattern.matcher(addressBean.getZip());

        if (!matcher1.matches()) {
            addFieldError("address.zip", getText("err.regex.validation.zip"));
        }

        if (StringUtils.isBlank(addressBean.getAddressLine1())) {
            addFieldError("address.addressLine1", getText("err.addressLine1.required"));
        }
        if (StringUtils.isBlank(addressBean.getCity())) {
            addFieldError("address.city", getText("err.city.required"));
        }
        if (StringUtils.isBlank(addressBean.getState())) {
            addFieldError("address.state", getText("err.state.required"));
        }

    }

    private Address transformToEntityBeanAddress(AddressBean addressBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (addressBean.getAddressId() != null) {
            entity.setAddressId(addressBean.getAddressId());
        }

        Integer vendorId = getSessionVendorId();

        entity.setReferenceTable("VENDOR");
        entity.setReferenceId(vendorId);
        entity.setAddressLine1(addressBean.getAddressLine1());
        entity.setAddressLine2(addressBean.getAddressLine2());
        entity.setAddressType(addressBean.getAddressType());
        entity.setCity(addressBean.getCity());
        entity.setState(addressBean.getState());
        entity.setZip(addressBean.getZip());
        entity.setCreatedTimestamp(addressBean.getCreatedTimeStamp());
        entity.setCreatedBy(addressBean.getCreatedBy());

        return entity;
    }

    private AddressBean transformToFormBeanAddress(Address entity) {
        AddressBean formBean = new AddressBean();

        formBean.setAddressId(entity.getAddressId());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setAddressLine1(entity.getAddressLine1());
        formBean.setAddressLine2(entity.getAddressLine2());
        formBean.setAddressType(entity.getAddressType());
        formBean.setCity(entity.getCity());
        formBean.setState(entity.getState());
        formBean.setZip(entity.getZip());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());
        return formBean;
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
    public void prepare() {
        vendorTypeList = parameterService.getParameterMap(ParameterConstants.VENDOR_TYPE);
        vendorSearchList = parameterService.getParameterMap(ParameterConstants.VENDOR_SEARCH);
        statusList = parameterService.getParameterMap(ParameterConstants.STATUS);
        truckTypeList = parameterService.getParameterMap(ParameterConstants.TRUCK_TYPE);
        vendorClassList = parameterService.getParameterMap(ParameterConstants.VENDOR_CLASS);
        contactTypeList = parameterService.getParameterMap(ParameterConstants.CONTACT_TYPE);
        addressTypeList = parameterService.getParameterMap(ParameterConstants.ADDRESS_TYPE);
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

    public List<AddressBean> getAddresss() {
        return addresss;
    }

    public void setAddresss(List<AddressBean> addresss) {
        this.addresss = addresss;
    }

    public AddressBean getAddress() {
        return address;
    }

    public void setAddress(AddressBean address) {
        this.address = address;
    }

    public Integer getAddressIdParam() {
        return addressIdParam;
    }

    public void setAddressIdParam(Integer addressIdParam) {
        this.addressIdParam = addressIdParam;
    }

    public List<Parameters> getAddressTypeList() {
        return addressTypeList;
    }

    public void setAddressTypeList(List<Parameters> addressTypeList) {
        this.addressTypeList = addressTypeList;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }
}