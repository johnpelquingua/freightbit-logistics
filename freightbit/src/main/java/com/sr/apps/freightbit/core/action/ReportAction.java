package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.service.*;
import org.apache.struts2.ServletActionContext;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.modules.output.pageable.pdf.PdfReportUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReportAction extends ActionSupport implements Preparable {

    private ParameterService parameterService;
    private TotalBookingsService totalBookingsService;
    private TotalBookingsConsigneeService totalBookingsConsigneeService;
    private TotalBookingsAccomplishedService totalBookingsAccomplishedService;
    private TotalBookingsCancelledService totalBookingsCancelledService;
    private TotalBookingsShipperService totalBookingsShipperService;
    private TotalBookingsShipperDesService totalBookingsShipperDesService;
    private TotalBookingsConsigneeDesService totalBookingsConsigneeDesService;
    private List<Parameters> statisticsList = new ArrayList<Parameters>();
    private List<Parameters> reportsList = new ArrayList<Parameters>();
    private String dataParam;
    private Date dateFromParam;
    private Date dateToParam;

    public String viewStatistics(){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        Map<String, String> params = new HashMap();
        params.put("dateFrom", formatter.format(dateFromParam));
        params.put("dateTo", formatter.format(dateToParam));

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        if(dataParam.equals("TOTAL NUMBER OF BOOKINGS")) {
            try {
                // Create an output filename
                final File outputFile = new File("Total Number Of Bookings.pdf");
                // Generate the report
                MasterReport report = totalBookingsService.generateReport(params);

                HttpServletResponse response = ServletActionContext.getResponse();
                responseOut = new BufferedOutputStream(response.getOutputStream());
                byteArray = new ByteArrayOutputStream();

                boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
                byteArray.writeTo(responseOut);

                byteArray.close();
                responseOut.close();

            } catch (Exception re) {
                re.printStackTrace();
            }
        }
        else if(dataParam.equals("TOTAL NUMBER OF BOOKINGS PER CONSIGNEE")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Number of Bookings per Consignee.pdf");
                // Generate the report
                MasterReport report = totalBookingsConsigneeService.generateReport(params);

                HttpServletResponse response = ServletActionContext.getResponse();
                responseOut = new BufferedOutputStream(response.getOutputStream());
                byteArray = new ByteArrayOutputStream();

                boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
                byteArray.writeTo(responseOut);

                byteArray.close();
                responseOut.close();

            } catch (Exception re) {
                re.printStackTrace();
            }
        }
        else if(dataParam.equals("TOTAL NUMBER OF ACCOMPLISHED (ARCHIVED) BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Number of Accomplished (Archived) Bookings.pdf");
                // Generate the report
                MasterReport report = totalBookingsAccomplishedService.generateReport(params);

                HttpServletResponse response = ServletActionContext.getResponse();
                responseOut = new BufferedOutputStream(response.getOutputStream());
                byteArray = new ByteArrayOutputStream();

                boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
                byteArray.writeTo(responseOut);

                byteArray.close();
                responseOut.close();

            } catch (Exception re) {
                re.printStackTrace();
            }
        }
        else if(dataParam.equals("TOTAL NUMBER OF CANCELLED BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Number of Cancelled Bookings.pdf");
                // Generate the report
                MasterReport report = totalBookingsCancelledService.generateReport(params);

                HttpServletResponse response = ServletActionContext.getResponse();
                responseOut = new BufferedOutputStream(response.getOutputStream());
                byteArray = new ByteArrayOutputStream();

                boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
                byteArray.writeTo(responseOut);

                byteArray.close();
                responseOut.close();

            } catch (Exception re) {
                re.printStackTrace();
            }
        }
        else if(dataParam.equals("TOTAL NUMBER OF BOOKINGS PER SHIPPER")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Number of Bookings per Shipper.pdf");
                // Generate the report
                MasterReport report = totalBookingsShipperService.generateReport(params);

                HttpServletResponse response = ServletActionContext.getResponse();
                responseOut = new BufferedOutputStream(response.getOutputStream());
                byteArray = new ByteArrayOutputStream();

                boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
                byteArray.writeTo(responseOut);

                byteArray.close();
                responseOut.close();

            } catch (Exception re) {
                re.printStackTrace();
            }
        }
        else if(dataParam.equals("TOTAL NUMBER OF BOOKINGS PER SHIPPER PER PORT OF DESTINATION")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Number of Bookings per Shipper Per Port of Destination.pdf");
                // Generate the report
                MasterReport report = totalBookingsShipperDesService.generateReport(params);

                HttpServletResponse response = ServletActionContext.getResponse();
                responseOut = new BufferedOutputStream(response.getOutputStream());
                byteArray = new ByteArrayOutputStream();

                boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
                byteArray.writeTo(responseOut);

                byteArray.close();
                responseOut.close();

            } catch (Exception re) {
                re.printStackTrace();
            }
        }
        else if(dataParam.equals("TOTAL NUMBER OF BOOKINGS PER CONSIGNEE PER PORT OF DESTINATION")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Number of Bookings per Consignee Per Port of Destination.pdf");
                // Generate the report
                MasterReport report = totalBookingsConsigneeDesService.generateReport(params);

                HttpServletResponse response = ServletActionContext.getResponse();
                responseOut = new BufferedOutputStream(response.getOutputStream());
                byteArray = new ByteArrayOutputStream();

                boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
                byteArray.writeTo(responseOut);

                byteArray.close();
                responseOut.close();

            } catch (Exception re) {
                re.printStackTrace();
            }
        }
        return null;
    }

    public String viewReports(){
        //Filename creation codes here are same in viewStatistics method
        return SUCCESS;
    }

    public String customerRelations() {

        return SUCCESS;
    }

    public String fclOperations() { return SUCCESS; }

    public String lclOperations() { return SUCCESS; }

    public String rcOperations() { return SUCCESS; }

    public String lcOperations() { return SUCCESS; }

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

    public String getDataParam() {
        return dataParam;
    }

    public void setDataParam(String dataParam) {
        this.dataParam = dataParam;
    }

    public Date getDateFromParam() {
        return dateFromParam;
    }

    public void setDateFromParam(Date dateFromParam) {
        this.dateFromParam = dateFromParam;
    }

    public Date getDateToParam() {
        return dateToParam;
    }

    public void setDateToParam(Date dateToParam) {
        this.dateToParam = dateToParam;
    }

    public TotalBookingsService getTotalBookingsService() {
        return totalBookingsService;
    }

    public void setTotalBookingsService(TotalBookingsService totalBookingsService) {
        this.totalBookingsService = totalBookingsService;
    }

    public TotalBookingsConsigneeService getTotalBookingsConsigneeService() {
        return totalBookingsConsigneeService;
    }

    public void setTotalBookingsConsigneeService(TotalBookingsConsigneeService totalBookingsConsigneeService) {
        this.totalBookingsConsigneeService = totalBookingsConsigneeService;
    }

    public TotalBookingsAccomplishedService getTotalBookingsAccomplishedService() {
        return totalBookingsAccomplishedService;
    }

    public void setTotalBookingsAccomplishedService(TotalBookingsAccomplishedService totalBookingsAccomplishedService) {
        this.totalBookingsAccomplishedService = totalBookingsAccomplishedService;
    }

    public TotalBookingsCancelledService getTotalBookingsCancelledService() {
        return totalBookingsCancelledService;
    }

    public void setTotalBookingsCancelledService(TotalBookingsCancelledService totalBookingsCancelledService) {
        this.totalBookingsCancelledService = totalBookingsCancelledService;
    }

    public TotalBookingsShipperService getTotalBookingsShipperService() {
        return totalBookingsShipperService;
    }

    public void setTotalBookingsShipperService(TotalBookingsShipperService totalBookingsShipperService) {
        this.totalBookingsShipperService = totalBookingsShipperService;
    }

    public TotalBookingsShipperDesService getTotalBookingsShipperDesService() {
        return totalBookingsShipperDesService;
    }

    public void setTotalBookingsShipperDesService(TotalBookingsShipperDesService totalBookingsShipperDesService) {
        this.totalBookingsShipperDesService = totalBookingsShipperDesService;
    }

    public TotalBookingsConsigneeDesService getTotalBookingsConsigneeDesService() {
        return totalBookingsConsigneeDesService;
    }

    public void setTotalBookingsConsigneeDesService(TotalBookingsConsigneeDesService totalBookingsConsigneeDesService) {
        this.totalBookingsConsigneeDesService = totalBookingsConsigneeDesService;
    }
}