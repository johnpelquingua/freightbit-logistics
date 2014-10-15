package com.sr.apps.freightbit.documentation.action;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 8/8/14
 * Time: 10:19 AM
 * To change this template use File | Settings | File Templates.
 */

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.documentation.formbean.DocumentsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.DocumentAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.BookingRequestReportService;
import com.sr.biz.freightbit.documentation.service.HouseBillofLadingReportService;
import com.sr.biz.freightbit.documentation.service.HouseWayBillService;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.documentation.service.ReleaseOrderReportService;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
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
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private AddressBean address = new AddressBean();
    private DocumentsBean document = new DocumentsBean();

    private DocumentsService documentsService;
    private ReleaseOrderReportService releaseOrderReportService;
    private BookingRequestReportService bookingRequestReportService;
    private HouseBillofLadingReportService houseBillofLadingReportService;
    private HouseWayBillService houseWayBillService;
    private CustomerService customerService;
    private OrderService orderService;
    private ClientService clientService;

    private Integer orderIdParam;
    private Integer documentIdParam;
    private InputStream inputStream;
    private long contentLength;
    private String fileName;
    private String orderId;
    private String bookingNumber;

    private List<Documents> outboundEntityList = new ArrayList<Documents>();
    private List<Documents> inboundEntityList = new ArrayList<Documents>();
    private List<Documents> finalOutboundEntityList = new ArrayList<Documents>();
    private List<Documents> finalInboundEntityList = new ArrayList<Documents>();
    private List<Documents> archiveEntityList = new ArrayList<Documents>();
    private List<Documents> billingEntityList = new ArrayList<Documents>();

    
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

        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        /*List<Documents> documentsEntityList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*OUTBOUND DOCUMENTS*/
        outboundEntityList = documentsService.findDocumentByStageAndID("OUTBOUND", orderIdParam);

        for (Documents documentElem : outboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*INBOUND DOCUMENTS*/
        inboundEntityList = documentsService.findDocumentByStageAndID("INBOUND", orderIdParam);

        for (Documents documentElem : inboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*FINAL OUTBOUND DOCUMENTS*/
        finalOutboundEntityList = documentsService.findDocumentByStageAndID("FINAL OUTBOUND", orderIdParam);

        for (Documents documentElem : finalOutboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*FINAL INBOUND DOCUMENTS*/
        finalInboundEntityList = documentsService.findDocumentByStageAndID("FINAL INBOUND", orderIdParam);

        for (Documents documentElem : finalInboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*ARCHIVE DOCUMENTS*/
        archiveEntityList = documentsService.findDocumentByStageAndID("ARCHIVE", orderIdParam);

        for (Documents documentElem : archiveEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*BILLING DOCUMENTS*/
        billingEntityList = documentsService.findDocumentByStageAndID("BILLING", orderIdParam);

        for (Documents documentElem : billingEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        return SUCCESS;
    }

    public String editDocumentInfo() {

        try{
            Documents documentEntity = transformToDocumentEntityBean(document);

            documentsService.updateDocument(documentEntity);

        }catch(DocumentAlreadyExistsException e){
            addFieldError("document.documentName", getText("err.documentName.already.exists"));
            return INPUT;
        }


        return SUCCESS;
    }

    public String checkDocument(){

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        documentEntity.setDocumentType("INBOUND");
        documentEntity.setDocumentStatus("FROM OUTBOUND");
        documentEntity.setDocumentProcessed(1);
        documentsService.updateDocument(documentEntity);


        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

       /* clearErrorsAndMessages();
        addActionMessage("Booking successfully Approved!");*/
        return SUCCESS;

    }

    public String unCheckDocument(){

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        documentEntity.setDocumentProcessed(0);
        documentsService.updateDocument(documentEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

       /* clearErrorsAndMessages();
        addActionMessage("Booking successfully Approved!");*/
        return SUCCESS;

    }

    private Documents transformToDocumentEntityBean(DocumentsBean formBean) {

        Documents entity = new Documents();

        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        entity.setReferenceNumber(formBean.getReferenceNumber());

        return entity;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public OrderBean transformToOrderFormBean(Orders entity) {

        OrderBean formBean = new OrderBean();
        formBean.setOrderNumber(entity.getOrderNumber());
        //get shipper's name
        Contacts shipperContactName = customerService.findContactById(entity.getShipperContactId());
        Customer customerName = customerService.findCustomerById(shipperContactName.getReferenceId());
        formBean.setCustomerName((customerName.getCustomerName()));
        //formBean.setCustomerName(entity.getShipperCode());
        formBean.setServiceRequirement(entity.getServiceRequirement());
        formBean.setModeOfService(entity.getServiceMode());
        //get consignee name
        Contacts consigneeName = customerService.findContactById(entity.getConsigneeContactId());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));
        //formBean.setConsigneeCode(entity.getConsigneeCode());
        formBean.setOrderId(entity.getOrderId());
        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());
        formBean.setOriginationPort(entity.getOriginationPort());
        formBean.setModeOfPayment(entity.getPaymentMode());
        formBean.setNotifyBy(entity.getNotificationType());
        formBean.setBookingDate(entity.getOrderDate());
        formBean.setDestinationPort(entity.getDestinationPort());
        formBean.setRates(entity.getRates());
        formBean.setComments(entity.getComments());
        formBean.setPickupDate(entity.getPickupDate());
        formBean.setDeliveryDate(entity.getDeliveryDate());

        Contacts contactShipperName = customerService.findContactById(entity.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());

        if (shipperName!=null) {
            formBean.setCustomerId(shipperName.getCustomerId());
            formBean.setCustomerName(shipperName.getCustomerName());
        }

        //shipper contact info
        Contacts contacts = customerService.findContactById(entity.getShipperContactId());
        contact = new ContactBean();
        contact.setName(getFullName(contacts.getLastName(), contacts.getFirstName(), contacts.getMiddleName()));
        contact.setPhone(contacts.getPhone());
        contact.setEmail(contacts.getEmail());
        contact.setFax(contacts.getFax());
        contact.setMobile(contacts.getMobile());
        formBean.setShipperInfoContact(contact);

        //get shipper address
        if (order.getShipperAddressId()!=null) {
            Address addresses = customerService.findAddressById(entity.getShipperAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(addresses));
            formBean.setShipperInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            formBean.setShipperInfoAddress(address);
        }

        //consignee Info
        Contacts consigneeContact = customerService.findContactById(entity.getConsigneeContactId());

        contact = new ContactBean();
        contact.setName(getFullName(consigneeContact.getLastName(), consigneeContact.getFirstName(), consigneeContact.getMiddleName()));
        contact.setPhone(consigneeContact.getPhone());
        contact.setEmail(consigneeContact.getEmail());
        contact.setFax(consigneeContact.getFax());
        contact.setMobile(consigneeContact.getMobile());
        formBean.setConsigneeInfoContact(contact);

        // consignee address
        if (order.getConsigneeAddressId()!=null) {
            Address consigneeAddress = customerService.findAddressById(entity.getConsigneeAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(consigneeAddress));
            formBean.setConsigneeInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            formBean.setConsigneeInfoAddress(address);
        }

        return formBean;
    }

    private String getAddress(Address address) {
        StringBuilder fullAddress = new StringBuilder("");
        if (StringUtils.isNotBlank(address.getAddressLine1()))
            fullAddress.append(address.getAddressLine1() + " ");
        if (StringUtils.isNotBlank(address.getAddressLine2()))
            fullAddress.append(address.getAddressLine2() + " ");
        if (StringUtils.isNotBlank(address.getCity()))
            fullAddress.append(address.getCity() + " ");
        if (StringUtils.isNotBlank(address.getState()))
            fullAddress.append(address.getState() + " ");
        if (StringUtils.isNotBlank(address.getZip()))
            fullAddress.append(address.getZip());
        return fullAddress.toString();
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

    public String generateBillofLadingReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try {
            // Create an output filename
            final File outputFile = new File("Bill of Lading.pdf");
            // Generate the report
            MasterReport report = houseBillofLadingReportService.generateReport(params);

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

    public String generateHouseWayBillReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try {
            // Create an output filename
            final File outputFile = new File("Way Bill.pdf");
            // Generate the report
            MasterReport report = houseWayBillService.generateReport(params);

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
        formBean.setOrderDate(entity.getOrderDate());
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
        formBean.setDocumentProcessed(entity.getDocumentProcessed());
        formBean.setReferenceNumber(entity.getReferenceNumber());

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

    public void setHouseBillofLadingReportService(HouseBillofLadingReportService houseBillofLadingReportService) {
        this.houseBillofLadingReportService = houseBillofLadingReportService;
    }

    public void setHouseWayBillService(HouseWayBillService houseWayBillService) {
        this.houseWayBillService = houseWayBillService;
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

    public String getBookingNumber() {
        return bookingNumber;
    }

    public void setBookingNumber(String bookingNumber) {
        this.bookingNumber = bookingNumber;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
    }

    public AddressBean getAddress() {
        return address;
    }

    public void setAddress(AddressBean address) {
        this.address = address;
    }

    public DocumentsBean getDocument() {
        return document;
    }

    public void setDocument(DocumentsBean document) {
        this.document = document;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public List<Documents> getBillingEntityList() {
        return billingEntityList;
    }

    public void setBillingEntityList(List<Documents> billingEntityList) {
        this.billingEntityList = billingEntityList;
    }

    public List<Documents> getArchiveEntityList() {
        return archiveEntityList;
    }

    public void setArchiveEntityList(List<Documents> archiveEntityList) {
        this.archiveEntityList = archiveEntityList;
    }

    public List<Documents> getFinalInboundEntityList() {
        return finalInboundEntityList;
    }

    public void setFinalInboundEntityList(List<Documents> finalInboundEntityList) {
        this.finalInboundEntityList = finalInboundEntityList;
    }

    public List<Documents> getFinalOutboundEntityList() {
        return finalOutboundEntityList;
    }

    public void setFinalOutboundEntityList(List<Documents> finalOutboundEntityList) {
        this.finalOutboundEntityList = finalOutboundEntityList;
    }

    public List<Documents> getInboundEntityList() {
        return inboundEntityList;
    }

    public void setInboundEntityList(List<Documents> inboundEntityList) {
        this.inboundEntityList = inboundEntityList;
    }

    public List<Documents> getOutboundEntityList() {
        return outboundEntityList;
    }

    public void setOutboundEntityList(List<Documents> outboundEntityList) {
        this.outboundEntityList = outboundEntityList;
    }


}
