package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;

import java.util.ArrayList;
import java.util.List;

public class ReportAction extends ActionSupport implements Preparable {

    private ParameterService parameterService;
    private List<Parameters> statisticsList = new ArrayList<Parameters>();
    private List<Parameters> reportsList = new ArrayList<Parameters>();

    public String customerRelations() {

        return SUCCESS;
    }

    public String fclOperations() { return SUCCESS; }

    public String lclOperations() { return SUCCESS; }

    public String rcOperations() { return SUCCESS; }

    public String lcOperations() { return SUCCESS; }

    public String inlandFreightOperations() { return SUCCESS; }

    @Override
    public void prepare() throws Exception {
        statisticsList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_RELATIONS, ParameterConstants.STATISTICS);
        reportsList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_RELATIONS, ParameterConstants.REPORTS);
    }

    public List<Parameters> getStatisticsList() {
        return statisticsList;
    }

    public void setStatisticsList(List<Parameters> statisticsList) {
        this.statisticsList = statisticsList;
    }

    public List<Parameters> getReportsList() {
        return reportsList;
    }

    public void setReportsList(List<Parameters> reportsList) {
        this.reportsList = reportsList;
    }

    public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }
}