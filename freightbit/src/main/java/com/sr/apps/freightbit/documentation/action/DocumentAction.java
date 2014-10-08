package com.sr.apps.freightbit.documentation.action;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 8/8/14
 * Time: 10:19 AM
 * To change this template use File | Settings | File Templates.
 */

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.documentation.formbean.DocumentsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.BookingRequestReportService;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.documentation.service.ReleaseOrderReportService;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.order.entity.Orders;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.modules.output.pageable.pdf.PdfReportUtil;

import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DocumentAction extends ActionSupport implements Preparable{

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(DocumentAction.class);

    private List<Documents> documentsList = new ArrayList<Documents>();
    private List<DocumentsBean> documents = new ArrayList<DocumentsBean>();
    private List<OrderBean> orders = new ArrayList<OrderBean>();

    private DocumentsService documentsService;
    private ReleaseOrderReportService releaseOrderReportService;
    private BookingRequestReportService bookingRequestReportService;
    private CustomerService customerService;
    private OrderService orderService;

    private Integer orderIdParam;
    private Integer documentIdParam;
    private InputStream inputStream;
    private long contentLength;
    private String fileName;
    private String orderId;
    
    @Override
    public void prepare() {

    }

    public String viewArchivedDocuments() {
        return SUCCESS;
    }

    public String viewPendingDocuments() {

        List<Orders> orderEntityList = new ArrayList<Orders>();

        orderEntityList = documentsService.findAllOrdersDocumentation();

        for (Orders orderElem : orderEntityList) {
            orders.add(transformOrdersToFormBean(orderElem));
        }

        return SUCCESS;
    }

    public String viewOrderDocuments() {

        List<Documents> documentsEntityList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        return SUCCESS;
    }

    public String viewPlainDocuments() {
        return SUCCESS;
    }

    public String viewAcceptanceReceipt() {
        return SUCCESS;
    }

    public String viewBillOfLading() {
        return SUCCESS;
    }

    public String viewWayBillOrigin() {
        return SUCCESS;
    }

    public String viewWayBillDestination() {
        return SUCCESS;
    }

    public String viewReleaseOrder() {
        return SUCCESS;
    }

    public String generateBookingRequestReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try {
            // Create an output filename
            final File outputFile = new File("Booking Request Form.pdf");
            // Generate the report
            MasterReport report = bookingRequestReportService.generateReport(params);

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

        return null;
    }
    
    public String generateReleaseOrderReport() throws IOException {
        	String orderId = "26";
        	String orderItemId = "1";
        	Map<String, String> params = new HashMap();
        	params.put("orderId", orderId);
        	params.put("orderItemId", orderItemId);
        	
        	ByteArrayOutputStream byteArray = null;
        	BufferedOutputStream responseOut = null;
        	
        	try {
    	       // Create an output filename
    	        final File outputFile = new File("Release Order.pdf");
    	        // Generate the report
        		MasterReport report = releaseOrderReportService.generateReport(params);
        		
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
    		
    	return null;
    }

    public OrderBean transformOrdersToFormBean(Orders entity) {
        OrderBean formBean = new OrderBean();
        formBean.setOrderId(entity.getOrderId());
        formBean.setOrderNumber(entity.getOrderNumber());
        /*formBean.setCustomerName(entity.getShipperCode());*/
        //get shipper's name
        Contacts shipperContactName = customerService.findContactById(entity.getShipperContactId());
        Customer customerName = customerService.findCustomerById(shipperContactName.getReferenceId());
        formBean.setCustomerName((customerName.getCustomerName()));
        //get consignee name
        Contacts consigneeName = customerService.findContactById(entity.getConsigneeContactId());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));

        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());
        formBean.setModeOfService(entity.getServiceMode());
        formBean.setServiceRequirement(entity.getServiceRequirement());

        return formBean;
    }

    public DocumentsBean transformDocumentsToFormBean(Documents entity) {
        DocumentsBean formBean = new DocumentsBean();

        formBean.setDocumentId(entity.getDocumentId());
        formBean.setDocumentName(entity.getDocumentName());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setDocumentStatus(entity.getDocumentStatus());

        return formBean;
    }

    private String getFullName(String lastName, String firstName, String middleName) {
        StringBuilder fullName = new StringBuilder("");
        if (StringUtils.isNotBlank(lastName)) {
            fullName.append(lastName + ", ");
        }
        if (StringUtils.isNotBlank(firstName)) {
            fullName.append(firstName + " ");
        }
        if (StringUtils.isNotBlank(middleName)) {
            fullName.append(middleName);
        }
        return fullName.toString();
    }

//<---------------------------Getters and Setters--------------------------->

    public List<Documents> getDocumentsList() {
        return documentsList;
    }

    public void setDocumentsList(List<Documents> documentsList) {
        this.documentsList = documentsList;
    }

    public DocumentsService getDocumentsService() {
        return documentsService;
    }

    public void setDocumentsService(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }

    public void setBookingRequestReportService(BookingRequestReportService bookingRequestReportService) {
        this.bookingRequestReportService = bookingRequestReportService;
    }

    public void setReleaseOrderReportService(ReleaseOrderReportService releaseOrderReportService) {
		this.releaseOrderReportService = releaseOrderReportService;
	}

	public List<DocumentsBean> getDocuments() {
        return documents;
    }

    public void setDocuments(List<DocumentsBean> documents) {
        this.documents = documents;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }
    
    public InputStream getInputStream() {
        return inputStream;
    } 
    
    public long getContentLength() {
        return contentLength;
    }
 
    public String getFileName() {
        return fileName;
    }

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

    public CustomerService getCustomerService() {
        return customerService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }

    public Integer getDocumentIdParam() {
        return documentIdParam;
    }

    public void setDocumentIdParam(Integer documentIdParam) {
        this.documentIdParam = documentIdParam;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
}
