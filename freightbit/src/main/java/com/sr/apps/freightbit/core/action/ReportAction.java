package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.reports.service.*;
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

    private UserService userService;
    private ParameterService parameterService;
    private TotalBookingsService totalBookingsService;
    private TotalBookingsConsigneeService totalBookingsConsigneeService;
    private TotalBookingsAccomplishedService totalBookingsAccomplishedService;
    private TotalBookingsCancelledService totalBookingsCancelledService;
    private TotalBookingsShipperService totalBookingsShipperService;
    private TotalBookingsShipperDesService totalBookingsShipperDesService;
    private TotalBookingsConsigneeDesService totalBookingsConsigneeDesService;
    private TotalBookingsArchiveService totalBookingsArchiveService;
    private TotalFCLBookingsService totalFCLBookingsService;
    private TotalFCLVansService totalFCLVansService;
    private TotalFCLVansConsigneeService totalFCLVansConsigneeService;
    private TotalFCLVansShipperPortService totalFCLVansShipperPortService;
    private TotalFCLVansConsigneePortService totalFCLVansConsigneePortService;
    private TotalCancelledFCLBookingsService totalCancelledFCLBookingsService;
    private TotalOnTimeFCLBookingsService totalOnTimeFCLBookingsService;
    private TotalCancelledLCLBookingsService totalCancelledLCLBookingsService;
    private TotalItemsAndCBMPerLCLBookingsService totalItemsAndCBMPerLCLBookingsService;
    /*private TotalCubicMetrePerLCLBookingsService totalCubicMetrePerLCLBookingsService;*/
    private AvgItemsPerLCLBookingsService avgItemsPerLCLBookingsService;
    private TotalSchedulePerVendorPerDestinationService totalSchedulePerVendorPerDestinationService;
    private TotalCancelledLCBookingsService totalCancelledLCBookingsService;
    private TotalCancelledRCUBookingsService totalCancelledRCUBookingsService;
    private TotalCancelledTKGBookingsService totalCancelledTKGBookingsService;
    private TotalCancelledTKGBookingsConsigneeService totalCancelledTKGBookingsConsigneeService;
    private TotalLCLBookingsService totalLCLBookingsService;
    private TotalRCUBookingsService totalRCUBookingsService;
    private TotalLCBookingsService totalLCBookingsService;
    private TotalInlandFreightBookingService totalInlandFreightBookingService;
    private TotalInlandFreightBookingConsigneeService totalInlandFreightBookingConsigneeService;
    private TotalInlandFreightBookingVansService totalInlandFreightBookingVansService;
    private List<Parameters> statisticsList = new ArrayList<Parameters>();
    private List<Parameters> FCL_statisticsList = new ArrayList<Parameters>();
    private List<Parameters> LCL_statisticsList = new ArrayList<Parameters>();
    private List<Parameters> RC_statisticsList = new ArrayList<Parameters>();
    private List<Parameters> LC_statisticsList = new ArrayList<Parameters>();
    private List<Parameters> IFO_statisticsList = new ArrayList<Parameters>();
    private List<Parameters> reportsList = new ArrayList<Parameters>();
    private List<Parameters> reportsDept = new ArrayList<Parameters>();
    private List<Parameters> reportsType = new ArrayList<Parameters>();
    private List<Parameters> reportsStatisticsList = new ArrayList<Parameters>();
    private Map<String, String> statReportMap = new HashMap<String, String>();
    private String dataParam;
    private Date dateFromParam;
    private Date dateToParam;
    private String deptNameParam;
    private String typeNameParam;
    private String reportGenerator;
    private String reportGeneratorParam;
    private CommonUtils commonUtils = new CommonUtils();

    public String deptTypeDataList() {

        System.out.println(deptNameParam);
        System.out.println(typeNameParam);

        if(deptNameParam.equals("CUSTOMER RELATIONS")){
            if(typeNameParam.equals("STATISTICS")){
                for(int i=0; i < statisticsList.size(); i++ ){
                    System.out.println(statisticsList.get(i).getValue());
                    statReportMap.put(statisticsList.get(i).getKey(), statisticsList.get(i).getValue() );

                }
            }else{
                // FOR REPORTS CONDITION
            }
        }
        else if(deptNameParam.equals("FCL OPERATIONS")){
            if(typeNameParam.equals("STATISTICS")){
                for(int i=0; i < FCL_statisticsList.size(); i++ ){
                    System.out.println(FCL_statisticsList.get(i).getValue());
                    statReportMap.put(FCL_statisticsList.get(i).getKey(), FCL_statisticsList.get(i).getValue() );

                }
            }else{
                // FOR REPORTS CONDITION
            }
        }
        else if(deptNameParam.equals("LCL OPERATIONS")){
            if(typeNameParam.equals("STATISTICS")){
                for(int i=0; i < LCL_statisticsList.size(); i++ ){
                    System.out.println(LCL_statisticsList.get(i).getValue());
                    statReportMap.put(LCL_statisticsList.get(i).getKey(), LCL_statisticsList.get(i).getValue() );

                }
            }else{
                // FOR REPORTS CONDITION
            }
        }
        else if(deptNameParam.equals("ROLLING CARGO OPERATIONS")){
            if(typeNameParam.equals("STATISTICS")){
                for(int i=0; i < RC_statisticsList.size(); i++ ){
                    System.out.println(RC_statisticsList.get(i).getValue());
                    statReportMap.put(RC_statisticsList.get(i).getKey(), RC_statisticsList.get(i).getValue() );

                }
            }else{
                // FOR REPORTS CONDITION
            }
        }
        else if(deptNameParam.equals("LOOSE CARGO OPERATIONS")){
            if(typeNameParam.equals("STATISTICS")){
                for(int i=0; i < LC_statisticsList.size(); i++ ){
                    System.out.println(LC_statisticsList.get(i).getValue());
                    statReportMap.put(LC_statisticsList.get(i).getKey(), LC_statisticsList.get(i).getValue() );

                }
            }else{
                // FOR REPORTS CONDITION
            }
        }
        else if(deptNameParam.equals("INLAND FREIGHT")){
            if(typeNameParam.equals("STATISTICS")){
                for(int i=0; i < IFO_statisticsList.size(); i++ ){
                    System.out.println(IFO_statisticsList.get(i).getValue());
                    statReportMap.put(IFO_statisticsList.get(i).getKey(), IFO_statisticsList.get(i).getValue() );

                }
            }else{
                // FOR REPORTS CONDITION
            }
        }

        return SUCCESS;
    }

    public String viewStatsReports() {

        User userEntity = userService.findUserByUserName(commonUtils.getUserNameFromSession());

        reportGenerator = userEntity.getFirstName() + " " + userEntity.getLastName();

        return SUCCESS;
    }

    /*public String getReportAction() {

        System.out.println("REPORT ACTION" +dateFromParam);
        System.out.println(dateToParam);
        System.out.println(dataParam);

        return SUCCESS;
    }*/

    public String viewStatistics(){

        System.out.println(dateFromParam);
        System.out.println(dateToParam);
        System.out.println(dataParam);
        System.out.println(reportGeneratorParam);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        Map<String, String> params = new HashMap();
        params.put("dateFrom", formatter.format(dateFromParam));
        params.put("dateTo", formatter.format(dateToParam));
        params.put("reportGenerator", reportGeneratorParam);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

/*-------------------------------- CUSTOMER RELATIONS REPORT BEGIN -------------------------------------------------------------------------*/
        if(dataParam.equals("TOTAL BOOKINGS")) {
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
        else if(dataParam.equals("TOTAL BOOKINGS PER CONSIGNEE")){
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
        else if(dataParam.equals("TOTAL ACCOMPLISHED (ARCHIVED) BOOKINGS")){
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
        else if(dataParam.equals("TOTAL CANCELLED BOOKINGS")){
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
        else if(dataParam.equals("TOTAL BOOKINGS PER SHIPPER")){
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
        else if(dataParam.equals("TOTAL BOOKINGS PER SHIPPER PER PORT OF DESTINATION")){
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
        else if(dataParam.equals("TOTAL BOOKINGS PER CONSIGNEE PER PORT OF DESTINATION")){
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
        else if(dataParam.equals("ARCHIVE BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Archive Bookings.pdf");
                // Generate the report
                MasterReport report = totalBookingsArchiveService.generateReport(params);

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
/*-------------------------------- CUSTOMER RELATIONS REPORT END -------------------------------------------------------------------------*/

/*-------------------------------- FCL OPERATIONS REPORT BEGIN -------------------------------------------------------------------------*/
        else if(dataParam.equals("TOTAL FCL BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total FCL Bookings.pdf");
                // Generate the report
                MasterReport report = totalFCLBookingsService.generateReport(params);

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

        else if(dataParam.equals("TOTAL CONTAINER VANS PER SHIPPER")){
            try {
                // Create an output filename
                final File outputFile = new File("Total FCL Container Vans.pdf");
                // Generate the report
                MasterReport report = totalFCLVansService.generateReport(params);

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

        else if(dataParam.equals("TOTAL CONTAINER VANS PER CONSIGNEE")){
            try {
                // Create an output filename
                final File outputFile = new File("Total FCL Container Vans Per Consignee.pdf");
                // Generate the report
                MasterReport report = totalFCLVansConsigneeService.generateReport(params);

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

        else if(dataParam.equals("TOTAL CONTAINER VANS PER SHIPPER PER PORT OF DESTINATION")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Container Vans Per Shiper Per Port of Destination.pdf");
                // Generate the report
                MasterReport report = totalFCLVansShipperPortService.generateReport(params);

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

        else if(dataParam.equals("TOTAL CONTAINER VANS PER CONSIGNEE PER PORT OF DESTINATION")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Container Vans Per Consignee Per Port of Destination.pdf");
                // Generate the report
                MasterReport report = totalFCLVansConsigneePortService.generateReport(params);

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

        else if(dataParam.equals("TOTAL CANCELLED FCL BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Cancelled FCL Bookings.pdf");
                // Generate the report
                MasterReport report = totalCancelledFCLBookingsService.generateReport(params);

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

        else if(dataParam.equals("TOTAL ON-TIME CONTAINER VANS PER VENDOR / SUB-CONTRACTOR")){
            try {
                // Create an output filename
                final File outputFile = new File("Total On-Time Container Vans per Vendor / Sub-Contractor.pdf");
                // Generate the report
                MasterReport report = totalOnTimeFCLBookingsService.generateReport(params);

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
/*-------------------------------- FCL OPERATIONS REPORT END -------------------------------------------------------------------------*/

/*-------------------------------- LCL OPERATIONS REPORT BEGIN -------------------------------------------------------------------------*/
        else if(dataParam.equals("TOTAL LCL BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total LCL Bookings.pdf");
                // Generate the report
                MasterReport report = totalLCLBookingsService.generateReport(params);

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
        else if(dataParam.equals("TOTAL CANCELLED LCL BOOKING")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Cancelled LCL Bookings.pdf");
                // Generate the report
                MasterReport report = totalCancelledLCLBookingsService.generateReport(params);

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
        else if(dataParam.equals("TOTAL ITEMS AND CBM PER LCL BOOKING")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Items And CBM Per LCL Bookings.pdf");
                // Generate the report
                MasterReport report = totalItemsAndCBMPerLCLBookingsService.generateReport(params);

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
        /*else if(dataParam.equals("TOTAL CUBIC METER PER LCL BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Cubic Metre Per LCL Bookings.pdf");
                // Generate the report
                MasterReport report = totalCubicMetrePerLCLBookingsService.generateReport(params);

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
        }*/
        else if(dataParam.equals("TOTAL ITEMS PER SHIPPER PER PORT OF DESTINATION")){
            try {
                // Create an output filename
                final File outputFile = new File("Average Number Of Items Per Shipper Per Destination .pdf");
                // Generate the report
                MasterReport report = avgItemsPerLCLBookingsService.generateReport(params);

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
        else if(dataParam.equals("TOTAL SCHEDULE PER VENDOR PER PORT OF DESTINATION")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Schedule Per Vendor Per Destination.pdf");
                // Generate the report
                MasterReport report = totalSchedulePerVendorPerDestinationService.generateReport(params);

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
/*-------------------------------- LCL OPERATIONS REPORT END -------------------------------------------------------------------------*/

/*-------------------------------- RCU OPERATIONS REPORT BEGIN -------------------------------------------------------------------------*/
        else if(dataParam.equals("TOTAL RCU BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total RCU Bookings.pdf");
                // Generate the report
                MasterReport report = totalRCUBookingsService.generateReport(params);

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
        else if(dataParam.equals("TOTAL CANCELLED RCU BOOKING")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Cancelled RCU Bookings.pdf");
                // Generate the report
                MasterReport report = totalCancelledRCUBookingsService.generateReport(params);

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
/*-------------------------------- RCU OPERATIONS REPORT END -------------------------------------------------------------------------*/

/*-------------------------------- LC OPERATIONS REPORT BEGIN -------------------------------------------------------------------------*/
        else if(dataParam.equals("TOTAL LC BOOKINGS")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Number of LC Bookings.pdf");
                // Generate the report
                MasterReport report = totalLCBookingsService.generateReport(params);

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
        else if(dataParam.equals("TOTAL CANCELLED LC BOOKING")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Cancelled LC Bookings.pdf");
                // Generate the report
                MasterReport report = totalCancelledLCBookingsService.generateReport(params);

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
/*-------------------------------- LC OPERATIONS REPORT END -------------------------------------------------------------------------*/

/*-------------------------------- INLAND FREIGHT REPORT BEGIN -------------------------------------------------------------------------*/
        else if(dataParam.equals("TOTAL INLAND FREIGHT BOOKING")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Inland Freight Booking.pdf");
                // Generate the report
                MasterReport report = totalInlandFreightBookingService.generateReport(params);

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

        else if(dataParam.equals("TOTAL INLAND FREIGHT BOOKING PER CONSIGNEE")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Inland Freight Booking Per Consignee.pdf");
                // Generate the report
                MasterReport report = totalInlandFreightBookingConsigneeService.generateReport(params);

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

        else if(dataParam.equals("TOTAL CONTAINER VANS PER INLAND FREIGHT BOOKING")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Container Vans per Inland Freight Booking.pdf");
                // Generate the report
                MasterReport report = totalInlandFreightBookingVansService.generateReport(params);

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

        /*else if(dataParam.equals("TOTAL CONTAINER VANS PER INLAND FREIGHT BOOKING PER SHIPPER")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Container Vans per Inland Freight Booking.pdf");
                // Generate the report
                MasterReport report = totalInlandFreightBookingVansService.generateReport(params);

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
        }*/

        else if(dataParam.equals("TOTAL CANCELLED INLAND FREIGHT BOOKING")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Cancelled Inland Freight Bookings.pdf");
                // Generate the report
                MasterReport report = totalCancelledTKGBookingsService.generateReport(params);

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

        else if(dataParam.equals("TOTAL CANCELLED INLAND FREIGHT BOOKING PER CONSIGNEE")){
            try {
                // Create an output filename
                final File outputFile = new File("Total Cancelled Inland Freight Bookings Per Consignee.pdf");
                // Generate the report
                MasterReport report = totalCancelledTKGBookingsConsigneeService.generateReport(params);

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
/*-------------------------------- INLAND FREIGHT REPORT END -------------------------------------------------------------------------*/
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

    public String inlandFreightOperations() { return SUCCESS; }

    @Override
    public void prepare() throws Exception {
        statisticsList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_RELATIONS, ParameterConstants.STATISTICS);
        FCL_statisticsList = parameterService.getParameterMap(ParameterConstants.FCL_OPERATIONS, ParameterConstants.STATISTICS);
        LCL_statisticsList = parameterService.getParameterMap(ParameterConstants.LCL_OPERATIONS, ParameterConstants.STATISTICS);
        RC_statisticsList = parameterService.getParameterMap(ParameterConstants.RC_OPERATIONS, ParameterConstants.STATISTICS);
        LC_statisticsList = parameterService.getParameterMap(ParameterConstants.LC_OPERATIONS, ParameterConstants.STATISTICS);
        IFO_statisticsList = parameterService.getParameterMap(ParameterConstants.INLAND_FREIGHT, ParameterConstants.STATISTICS);
        reportsList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_RELATIONS, ParameterConstants.REPORTS);
        reportsDept = parameterService.getParameterMap(ParameterConstants.REPORTS, ParameterConstants.DEPARTMENT);
        reportsType = parameterService.getParameterMap(ParameterConstants.REPORTS, ParameterConstants.TYPE);
    }

    public String getReportGenerator() {
        return reportGenerator;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setReportGenerator(String reportGenerator) {
        this.reportGenerator = reportGenerator;
    }

    public String getReportGeneratorParam() {
        return reportGeneratorParam;
    }

    public void setReportGeneratorParam(String reportGeneratorParam) {
        this.reportGeneratorParam = reportGeneratorParam;
    }

    public List<Parameters> getStatisticsList() {
        return statisticsList;
    }

    public void setStatisticsList(List<Parameters> statisticsList) {
        this.statisticsList = statisticsList;
    }

    public List<Parameters> getFCL_statisticsList() {
        return FCL_statisticsList;
    }

    public void setFCL_statisticsList(List<Parameters> FCL_statisticsList) {
        this.FCL_statisticsList = FCL_statisticsList;
    }

    public List<Parameters> getLCL_statisticsList() {
        return LCL_statisticsList;
    }

    public void setLCL_statisticsList(List<Parameters> LCL_statisticsList) {
        this.LCL_statisticsList = LCL_statisticsList;
    }

    public List<Parameters> getLC_statisticsList() {
        return LC_statisticsList;
    }

    public void setLC_statisticsList(List<Parameters> LC_statisticsList) {
        this.LC_statisticsList = LC_statisticsList;
    }

    public List<Parameters> getRC_statisticsList() {
        return RC_statisticsList;
    }

    public void setRC_statisticsList(List<Parameters> RC_statisticsList) {
        this.RC_statisticsList = RC_statisticsList;
    }

    public List<Parameters> getIFO_statisticsList() {
        return IFO_statisticsList;
    }

    public void setIFO_statisticsList(List<Parameters> IFO_statisticsList) {
        this.IFO_statisticsList = IFO_statisticsList;
    }

    public List<Parameters> getReportsList() {
        return reportsList;
    }

    public void setReportsList(List<Parameters> reportsList) {
        this.reportsList = reportsList;
    }

    /*public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }*/

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

/*    public TotalBookingsService getTotalBookingsService() {
        return totalBookingsService;
    }*/

    public void setTotalBookingsService(TotalBookingsService totalBookingsService) {
        this.totalBookingsService = totalBookingsService;
    }

/*    public TotalBookingsConsigneeService getTotalBookingsConsigneeService() {
        return totalBookingsConsigneeService;
    }*/

    public void setTotalBookingsConsigneeService(TotalBookingsConsigneeService totalBookingsConsigneeService) {
        this.totalBookingsConsigneeService = totalBookingsConsigneeService;
    }

    /*public TotalBookingsAccomplishedService getTotalBookingsAccomplishedService() {
        return totalBookingsAccomplishedService;
    }*/

    public void setTotalBookingsAccomplishedService(TotalBookingsAccomplishedService totalBookingsAccomplishedService) {
        this.totalBookingsAccomplishedService = totalBookingsAccomplishedService;
    }

/*    public TotalBookingsCancelledService getTotalBookingsCancelledService() {
        return totalBookingsCancelledService;
    }*/

    public void setTotalBookingsCancelledService(TotalBookingsCancelledService totalBookingsCancelledService) {
        this.totalBookingsCancelledService = totalBookingsCancelledService;
    }

/*    public TotalBookingsShipperService getTotalBookingsShipperService() {
        return totalBookingsShipperService;
    }*/

    public void setTotalBookingsShipperService(TotalBookingsShipperService totalBookingsShipperService) {
        this.totalBookingsShipperService = totalBookingsShipperService;
    }

/*    public TotalBookingsShipperDesService getTotalBookingsShipperDesService() {
        return totalBookingsShipperDesService;
    }*/

    public void setTotalBookingsShipperDesService(TotalBookingsShipperDesService totalBookingsShipperDesService) {
        this.totalBookingsShipperDesService = totalBookingsShipperDesService;
      }

    /*public TotalBookingsConsigneeDesService getTotalBookingsConsigneeDesService() {
        return totalBookingsConsigneeDesService;
    }*/

    public void setTotalBookingsConsigneeDesService(TotalBookingsConsigneeDesService totalBookingsConsigneeDesService) {
        this.totalBookingsConsigneeDesService = totalBookingsConsigneeDesService;
    }

    public List<Parameters> getReportsDept() {
        return reportsDept;
    }

    public void setReportsDept(List<Parameters> reportsDept) {
        this.reportsDept = reportsDept;
    }

    public List<Parameters> getReportsType() {
        return reportsType;
    }

    public void setReportsType(List<Parameters> reportsType) {
        this.reportsType = reportsType;
    }

    public List<Parameters> getReportsStatisticsList() {
        return reportsStatisticsList;
    }

    public void setReportsStatisticsList(List<Parameters> reportsStatisticsList) {
        this.reportsStatisticsList = reportsStatisticsList;
    }

    public String getDeptNameParam() {
        return deptNameParam;
    }

    public void setDeptNameParam(String deptNameParam) {
        this.deptNameParam = deptNameParam;
    }

    public String getTypeNameParam() {
        return typeNameParam;
    }

    public void setTypeNameParam(String typeNameParam) {
        this.typeNameParam = typeNameParam;
    }

    public Map<String, String> getStatReportMap() {
        return statReportMap;
    }

    public void setStatReportMap(Map<String, String> statReportMap) {
        this.statReportMap = statReportMap;
    }

    public void setTotalBookingsArchiveService(TotalBookingsArchiveService totalBookingsArchiveService) {
        this.totalBookingsArchiveService = totalBookingsArchiveService;
    }

    public void setTotalFCLBookingsService(TotalFCLBookingsService totalFCLBookingsService) {
        this.totalFCLBookingsService = totalFCLBookingsService;
    }

    public void setTotalFCLVansService(TotalFCLVansService totalFCLVansService) {
        this.totalFCLVansService = totalFCLVansService;
    }

    public void setTotalFCLVansConsigneeService(TotalFCLVansConsigneeService totalFCLVansConsigneeService) {
        this.totalFCLVansConsigneeService = totalFCLVansConsigneeService;
    }

    public void setTotalFCLVansShipperPortService(TotalFCLVansShipperPortService totalFCLVansShipperPortService) {
        this.totalFCLVansShipperPortService = totalFCLVansShipperPortService;
    }

    public void setTotalFCLVansConsigneePortService(TotalFCLVansConsigneePortService totalFCLVansConsigneePortService) {
        this.totalFCLVansConsigneePortService = totalFCLVansConsigneePortService;
    }

    public void setTotalOnTimeFCLBookingsService(TotalOnTimeFCLBookingsService totalOnTimeFCLBookingsService) {
        this.totalOnTimeFCLBookingsService = totalOnTimeFCLBookingsService;
    }

    public void setTotalLCLBookingsService(TotalLCLBookingsService totalLCLBookingsService) {
        this.totalLCLBookingsService = totalLCLBookingsService;
    }

    public void setTotalRCUBookingsService(TotalRCUBookingsService totalRCUBookingsService) {
        this.totalRCUBookingsService = totalRCUBookingsService;
    }

    public void setTotalLCBookingsService(TotalLCBookingsService totalLCBookingsService) {
        this.totalLCBookingsService = totalLCBookingsService;
    }

    public void setTotalInlandFreightBookingService(TotalInlandFreightBookingService totalInlandFreightBookingService) {
        this.totalInlandFreightBookingService = totalInlandFreightBookingService;
    }

    public void setTotalInlandFreightBookingConsigneeService(TotalInlandFreightBookingConsigneeService totalInlandFreightBookingConsigneeService) {
        this.totalInlandFreightBookingConsigneeService = totalInlandFreightBookingConsigneeService;
    }

    public void setTotalCancelledFCLBookingsService(TotalCancelledFCLBookingsService totalCancelledFCLBookingsService) {
        this.totalCancelledFCLBookingsService = totalCancelledFCLBookingsService;
    }

    public void setTotalCancelledLCLBookingsService(TotalCancelledLCLBookingsService totalCancelledLCLBookingsService) {
        this.totalCancelledLCLBookingsService = totalCancelledLCLBookingsService;
    }

    public void setTotalCancelledLCBookingsService(TotalCancelledLCBookingsService totalCancelledLCBookingsService) {
        this.totalCancelledLCBookingsService = totalCancelledLCBookingsService;
    }

    public void setTotalCancelledRCUBookingsService(TotalCancelledRCUBookingsService totalCancelledRCUBookingsService) {
        this.totalCancelledRCUBookingsService = totalCancelledRCUBookingsService;
    }

    public void setTotalCancelledTKGBookingsService(TotalCancelledTKGBookingsService totalCancelledTKGBookingsService) {
        this.totalCancelledTKGBookingsService = totalCancelledTKGBookingsService;
    }

    public void setTotalCancelledTKGBookingsConsigneeService(TotalCancelledTKGBookingsConsigneeService totalCancelledTKGBookingsConsigneeService) {
        this.totalCancelledTKGBookingsConsigneeService = totalCancelledTKGBookingsConsigneeService;
    }

    public void setTotalInlandFreightBookingVansService(TotalInlandFreightBookingVansService totalInlandFreightBookingVansService) {
        this.totalInlandFreightBookingVansService = totalInlandFreightBookingVansService;
    }

    public void setTotalItemsAndCBMPerLCLBookingsService(TotalItemsAndCBMPerLCLBookingsService totalItemsAndCBMPerLCLBookingsService) {
        this.totalItemsAndCBMPerLCLBookingsService = totalItemsAndCBMPerLCLBookingsService;
    }

    /*public void setTotalCubicMetrePerLCLBookingsService(TotalCubicMetrePerLCLBookingsService totalCubicMetrePerLCLBookingsService) {
        this.totalCubicMetrePerLCLBookingsService = totalCubicMetrePerLCLBookingsService;
    }*/

    public void setAvgItemsPerLCLBookingsService(AvgItemsPerLCLBookingsService avgItemsPerLCLBookingsService) {
        this.avgItemsPerLCLBookingsService = avgItemsPerLCLBookingsService;
    }

    public void setTotalSchedulePerVendorPerDestinationService(TotalSchedulePerVendorPerDestinationService totalSchedulePerVendorPerDestinationService) {
        this.totalSchedulePerVendorPerDestinationService = totalSchedulePerVendorPerDestinationService;
    }


}