package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.VesselScheduleBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import com.sr.biz.freightbit.vesselSchedule.service.VesselSchedulesService;
import com.sr.biz.freightbit.vesselSchedule.service.impl.VesselSchedulesServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Clarence C. Victoria on 7/23/14.
 */
public class VesselScheduleAction extends ActionSupport implements Preparable{
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(VesselScheduleAction.class);

    private VesselScheduleBean vesselSchedule = new VesselScheduleBean();
    private List<VesselScheduleBean> vesselSchedules = new ArrayList<VesselScheduleBean>();
    private VesselSchedulesService vesselSchedulesService;

    private List<Parameters> vesselScheduleSearch = new ArrayList<Parameters>();


    private ParameterService parameterService;

    @Override
    public void prepare() {
        vesselScheduleSearch = parameterService.getParameterMap(ParameterConstants.VESSEL_SCHEDULE_SEARCH );
    }

    public String addVesselSchedule(){

        return SUCCESS;
    }

    public String viewVesselSchedules() {
        String column = getColumnFilter();
        List <VesselSchedules> vesselSchedulesEntityList = new ArrayList<VesselSchedules>();

        if (StringUtils.isNotBlank(column)) {
            vesselSchedulesEntityList = vesselSchedulesService.findVesselSchedulesByCriteria(column, vesselSchedule.getVesselScheduleKeyword(), getClientId());
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
        formBean.setClientId(entity.getClientId());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setVoyageNumber(entity.getVoyageNumber());
        return formBean;

    }

    public String getColumnFilter() {
        String column = "";
        if ("ESTIMATED DATE OF DEPARTURE".equals(vesselSchedule.getVesselScheduleCriteria())) {
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

    public void validateOnSubmit() {

    }

    public String loadVesselScheduleSearch() {
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
}
