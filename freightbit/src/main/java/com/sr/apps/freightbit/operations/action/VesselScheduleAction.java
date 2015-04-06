package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.VesselScheduleBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.entity.Vessel;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import com.sr.biz.freightbit.vesselSchedule.service.VesselSchedulesService;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.*;

public class VesselScheduleAction extends ActionSupport implements Preparable{
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(VesselScheduleAction.class);

    private VesselScheduleBean vesselSchedule = new VesselScheduleBean();
    private List<VesselScheduleBean> vesselSchedules = new ArrayList<VesselScheduleBean>();
    private VesselSchedulesService vesselSchedulesService;
    private OperationsService operationsService;
    private Integer vendorId;
    private List<Parameters> vesselScheduleSearch = new ArrayList<Parameters>();
    private List<Parameters> portsList = new ArrayList<Parameters>();
    private List<Vendor> vendorList = new ArrayList<Vendor>();
    private List<Vessel> listVessel = new ArrayList<Vessel>();
    private ParameterService parameterService;
    private ClientService clientService;
    private VendorService vendorService;
    private CommonUtils commonUtils;

    private Map<String, String> vesselMap = new LinkedHashMap<String, String>();

    private Integer vesselScheduleIdParam;

    @Override
    public void prepare() {
        vesselScheduleSearch = parameterService.getParameterMap(ParameterConstants.VESSEL_SCHEDULE_SEARCH );
        portsList = parameterService.getParameterMap(ParameterConstants.PORTS);
        vendorList = vendorService.findAllShippingVendor();
    }

    public String listVesselName() {
        List<Vessel> vesselList = vendorService.findVesselByVendorId(vendorId);

        for (int i = 0; i < vesselList.size(); i++) {
            vesselMap.put(vesselList.get(i).getVesselName(), vesselList.get(i).getVesselName());
        }

        return SUCCESS;
    }

    public String addVesselSchedule(){
        validateOnSubmit(vesselSchedule);
        if (hasFieldErrors()) {
            return INPUT;
        }

        try {
            VesselSchedules entity = transformToEntityBean(vesselSchedule);
            entity.setCreatedBy(commonUtils.getUserNameFromSession());
            entity.setCreatedTimestamp(new Date());
            entity.setModifiedBy(commonUtils.getUserNameFromSession());
            entity.setModifiedTimestamp(new Date());
            vesselSchedulesService.addVesselSchedule(entity);
        } catch (Exception e) {
            addFieldError("vesselSchedule.voyageNumber", "Voyage Number already exists");
            return INPUT;
        }

        return SUCCESS;
    }

    public String loadSaveComplete() {
        List <VesselSchedules> vesselSchedulesEntityList = new ArrayList<VesselSchedules>();
        vesselSchedulesEntityList = vesselSchedulesService.findAllVesselSchedules();

        for (VesselSchedules vesselScheduleElem : vesselSchedulesEntityList) {
            vesselSchedules.add(transformToFormBean(vesselScheduleElem));

        }
        clearErrorsAndMessages();
        addActionMessage("Success! Vessel Schedule has been added.");
        return SUCCESS;
    }

    public String loadDeleteComplete() {
        List <VesselSchedules> vesselSchedulesEntityList = new ArrayList<VesselSchedules>();
        vesselSchedulesEntityList = vesselSchedulesService.findAllVesselSchedules();

        for (VesselSchedules vesselScheduleElem : vesselSchedulesEntityList) {
            vesselSchedules.add(transformToFormBean(vesselScheduleElem));

        }
        clearErrorsAndMessages();
        addActionMessage("Success! Vessel Schedule has been deleted.");
        return SUCCESS;
    }

    public String editVesselSchedule() {
        validateOnSubmit(vesselSchedule);
        if (hasFieldErrors()) {
            return INPUT;
        }
//        try {
            VesselSchedules entity = transformToEntityBean(vesselSchedule);
            entity.setModifiedBy(commonUtils.getUserNameFromSession());
            entity.setModifiedTimestamp(new Date());
            vesselSchedulesService.updateVesselSchedule(entity);
//        } catch (Exception e) {
//            addFieldError("vesselSchedule.voyageNumber", "Voyage Number already exists");
//            return INPUT;
//        }

        return SUCCESS;
    }

    public String loadEditVesselScheduleSuccess() {
        List <VesselSchedules> vesselSchedulesEntityList = new ArrayList<VesselSchedules>();
        vesselSchedulesEntityList = vesselSchedulesService.findAllVesselSchedules();

        for (VesselSchedules vesselScheduleElem : vesselSchedulesEntityList) {
            vesselSchedules.add(transformToFormBean(vesselScheduleElem));
        }
        clearErrorsAndMessages();
        addActionMessage("Success! Vessel Schedule has been updated.");
        return SUCCESS;
    }

    public String deleteVesselSchedule() {
        VesselSchedules entity = vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam);

        List<OrderItems> onGoingOrderItems = operationsService.findAllOrderItemsByVoyageNumber(entity.getVoyageNumber());
        if(onGoingOrderItems.size() > 0){
            return "errorInput";
        }
        else {
            vesselSchedulesService.deleteVesselSchedule(entity);
        }
        return SUCCESS;
    }

    public String loadDeleteVesselScheduleError() {
        List <VesselSchedules> vesselSchedulesEntityList = new ArrayList<VesselSchedules>();
        vesselSchedulesEntityList = vesselSchedulesService.findAllVesselSchedules();

        for (VesselSchedules vesselScheduleElem : vesselSchedulesEntityList) {
            vesselSchedules.add(transformToFormBean(vesselScheduleElem));
        }
        clearErrorsAndMessages();
        addActionMessage("Vessel schedule cannot be deleted. A voyage number is associated.");
        return SUCCESS;
    }

    public String viewVesselSchedules() {
        String column = getColumnFilter();
        List <VesselSchedules> vesselSchedulesEntityList = new ArrayList<VesselSchedules>();

        if (StringUtils.isNotBlank(column)) {
            vesselSchedulesEntityList = vesselSchedulesService.findVesselSchedulesByCriteria(column, vesselSchedule.getVesselScheduleKeyword());
        } else {
            vesselSchedulesEntityList = vesselSchedulesService.findAllVesselSchedules();
        }

        for (VesselSchedules vesselScheduleElem : vesselSchedulesEntityList) {
            vesselSchedules.add(transformToFormBean(vesselScheduleElem));
        }

        return SUCCESS;
    }

    public VesselScheduleBean transformToFormBean(VesselSchedules entity) {
        VesselScheduleBean formBean = new VesselScheduleBean();
        formBean.setVesselScheduleId(entity.getVesselScheduleId());
        formBean.setVendorId(entity.getVendorId());
        formBean.setOriginPort(entity.getOriginPort());
        formBean.setDestinationPort(entity.getDestinationPort());
        formBean.setArrivalDate(entity.getArrivalDate());
        formBean.setArrivalTime(entity.getArrivalTime());
        formBean.setDepartureDate(entity.getDepartureDate());
        formBean.setDepartureTime(entity.getDepartureTime());
        formBean.setClientId(entity.getClientId());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setVoyageNumber(entity.getVoyageNumber());
        formBean.setVesselName(entity.getVesselName());
        // get Vendor Name
        Vendor vendorName = vendorService.findVendorById(entity.getVendorId());
        if (vendorName!=null){
            formBean.setVendorCode(vendorName.getVendorName());
        }else{
            formBean.setVendorCode("NONE");
        }

        return formBean;

    }

    public VesselSchedules transformToEntityBean(VesselScheduleBean formBean) {
        VesselSchedules entity = new VesselSchedules();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client.getClientId());

        if (formBean.getVesselScheduleId() != null) {
            entity.setVesselScheduleId(new Integer(formBean.getVesselScheduleId()));
        }

        entity.setVoyageNumber(formBean.getVoyageNumber());
        entity.setVendorId(formBean.getVendorId());
        entity.setOriginPort(formBean.getOriginPort());
        entity.setDestinationPort(formBean.getDestinationPort());
        entity.setArrivalDate(formBean.getArrivalDate());
        entity.setArrivalTime(formBean.getArrivalTime());
        entity.setDepartureTime(formBean.getDepartureTime());
        entity.setDepartureDate(formBean.getDepartureDate());
        entity.setVendorCode(vendorService.findVendorById(formBean.getVendorId()).getVendorCode());
        entity.setVesselName(formBean.getVesselName());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        entity.setVendorName(vendorService.findVendorById(formBean.getVendorId()).getVendorName());

        return entity;
    }

    public String getColumnFilter() {
        String column = "";
        if ("SHIPPING COMPANY".equals(vesselSchedule.getVesselScheduleCriteria())) {
            column = "vendorName";
        } else if ("ESTIMATED DATE OF DEPARTURE".equals(vesselSchedule.getVesselScheduleCriteria())) {
            column = "departureDate";
        } else if ("PIER ORIGIN".equals(vesselSchedule.getVesselScheduleCriteria())) {
            column = "originPort";
        } else if ("VOYAGE NUMBER".equals(vesselSchedule.getVesselScheduleCriteria())) {
            column = "voyageNumber";
        } else if ("ESTIMATED DATE OF ARRIVAL".equals(vesselSchedule.getVesselScheduleCriteria())) {
            column = "arrivalDate";
        } else if ("PIER DESTINATION".equals(vesselSchedule.getVesselScheduleCriteria())) {
            column = "destinationPort";
        }
        return column;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public void validateOnSubmit(VesselScheduleBean vesselSchedule) {
        clearErrorsAndMessages();

        if (StringUtils.isBlank(vesselSchedule.getVoyageNumber())) {
            addFieldError("vesselSchedule.voyageNumber", "Voyage Number is required");
        }

    }

    public String loadVesselScheduleSearch() {
        return SUCCESS;
    }

    public String loadAddVesselSchedule() {
        return SUCCESS;
    }

    public String loadEditVesselSchedule() {
        VesselSchedules entity = vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam);
        vesselSchedule = transformToFormBean(entity);
        clearErrorsAndMessages();
        addActionMessage("Success! Vessel Schedule has been updated.");
        return SUCCESS;
    }

    public VesselScheduleBean getVesselSchedule() {
        return vesselSchedule;
    }

    public void setVesselSchedule(VesselScheduleBean vesselSchedule) {
        this.vesselSchedule = vesselSchedule;
    }

    public List<VesselScheduleBean> getVesselSchedules() {
        return vesselSchedules;
    }

    public void setVesselSchedules(List<VesselScheduleBean> vesselSchedules) {
        this.vesselSchedules = vesselSchedules;
    }

    public List<Parameters> getVesselScheduleSearch() {
        return vesselScheduleSearch;
    }

    public void setVesselScheduleSearch(List<Parameters> vesselScheduleSearch) {
        this.vesselScheduleSearch = vesselScheduleSearch;
    }

    public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public void setVesselSchedulesService(VesselSchedulesService vesselSchedulesService) {
        this.vesselSchedulesService = vesselSchedulesService;
    }

    public VesselSchedulesService getVesselSchedulesService() {
        return vesselSchedulesService;
    }

    public ClientService getClientService() {
        return clientService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public List<Vendor> getVendorList() {
        return vendorList;
    }

    public void setVendorList(List<Vendor> vendorList) {
        this.vendorList = vendorList;
    }

    public VendorService getVendorService() {
        return vendorService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public List<Parameters> getPortsList() {
        return portsList;
    }

    public void setPortsList(List<Parameters> portsList) {
        this.portsList = portsList;
    }

    public CommonUtils getCommonUtils() {
        return commonUtils;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }

    public Integer getVesselScheduleIdParam() {
        return vesselScheduleIdParam;
    }

    public void setVesselScheduleIdParam(Integer vesselScheduleIdParam) {
        this.vesselScheduleIdParam = vesselScheduleIdParam;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public Map<String, String> getVesselMap() {
        return vesselMap;
    }

    public void setVesselMap(Map<String, String> vesselMap) {
        this.vesselMap = vesselMap;
    }

    public List<Vessel> getListVessel() {
        return listVessel;
    }

    public void setListVessel(List<Vessel> listVessel) {
        this.listVessel = listVessel;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }
}
