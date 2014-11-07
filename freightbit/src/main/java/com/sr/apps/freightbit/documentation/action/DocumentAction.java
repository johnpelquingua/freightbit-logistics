package com.sr.apps.freightbit.documentation.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.documentation.formbean.DocumentsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.DocumentAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.*;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.service.VesselSchedulesService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.modules.output.pageable.pdf.PdfReportUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

public class DocumentAction extends ActionSupport implements Preparable{

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(DocumentAction.class);

    private List<Documents> documentsList = new ArrayList<Documents>();
    private List<DocumentsBean> documents = new ArrayList<DocumentsBean>();
    private List<DocumentsBean> outboundDocuments = new ArrayList<DocumentsBean>();
    private List<DocumentsBean> inboundDocuments = new ArrayList<DocumentsBean>();
    private List<DocumentsBean> finalOutboundDocuments = new ArrayList<DocumentsBean>();
    private List<DocumentsBean> finalInboundDocuments = new ArrayList<DocumentsBean>();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private AddressBean address = new AddressBean();
    private DocumentsBean document = new DocumentsBean();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();

    private VesselSchedulesService vesselSchedulesService;
    private VendorService vendorService;
    private DocumentsService documentsService;
    private ReleaseOrderReportService releaseOrderReportService;
    private BookingRequestReportService bookingRequestReportService;
    private HouseBillofLadingReportService houseBillofLadingReportService;
    private HouseWayBillService houseWayBillService;
    private AcceptanceReceiptReportService acceptanceReceiptReportService;
    private HouseWayBillDestinationReportService houseWayBillDestinationReportService;
    private AuthorizationToWithdrawReportService authorizationToWithdrawReportService;
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
    private Integer outboundCount;
    private Integer inboundCount;
    private Integer finalOutboundCount;
    private Integer finalInboundCount;

    private List<Documents> outboundEntityList = new ArrayList<Documents>();
    private List<Documents> inboundEntityList = new ArrayList<Documents>();
    private List<Documents> finalOutboundEntityList = new ArrayList<Documents>();
    private List<Documents> finalInboundEntityList = new ArrayList<Documents>();
    private List<Documents> archiveEntityList = new ArrayList<Documents>();
    private List<Documents> billingEntityList = new ArrayList<Documents>();

    private Integer documentflag;
    private String documentTab;
    private String documentTabInbound;
    private String[] check;
    
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
    /*OUTBOUND DOCUMENTS VIEW*/
    public String viewOrderDocuments() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        if (orderIdParam == null) {
            orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        // Display Order items under documents view page
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        /*OUTBOUND DOCUMENTS LIST*/
        outboundEntityList = documentsService.findDocumentByOutboundStageAndID(1, orderIdParam);
        /*OUTBOUND DOCUMENTS LIST COUNT*/
        outboundCount = outboundEntityList.size();
        /*INBOUND DOCUMENTS LIST*/
        inboundEntityList = documentsService.findDocumentByInboundStageAndID(1, orderIdParam);
        /*INBOUND DOCUMENTS LIST COUNT*/
        inboundCount = inboundEntityList.size();
        /*FINAL OUTBOUND DOCUMENTS LIST*/
        finalOutboundEntityList = documentsService.findDocumentByFinalOutboundStageAndID(1, orderIdParam);
        /*FINAL OUTBOUND DOCUMENTS LIST COUNT*/
        finalOutboundCount = finalOutboundEntityList.size();
         /*FINAL INBOUND DOCUMENTS LIST*/
        finalInboundEntityList = documentsService.findDocumentByFinalInboundStageAndID(1, orderIdParam);
        /*FINAL INBOUND DOCUMENTS LIST COUNT*/
        finalInboundCount = finalInboundEntityList.size();

        sessionAttributes.put("outboundCount", outboundCount); // Puts outbound count in session before forwarding to transformDocumentsToFormBean

        for (Documents documentElem : outboundEntityList) {
            outboundDocuments.add(transformDocumentsToFormBean(documentElem));
        }

        /*ARCHIVE DOCUMENTS*/
        /*archiveEntityList = documentsService.findDocumentByStageAndID("ARCHIVE", orderIdParam);

        for (Documents documentElem : archiveEntityList) {
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*BILLING DOCUMENTS*/
        /*billingEntityList = documentsService.findDocumentByStageAndID("BILLING", orderIdParam);

        for (Documents documentElem : billingEntityList) {
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*Document flag determines message */
        documentflag = (Integer) sessionAttributes.get("documentflag");
        if (documentflag == null) {
            clearErrorsAndMessages();
        } else if (documentflag == 1) {
            clearErrorsAndMessages();
            addActionMessage("You must enter a reference number");
        } else if (documentflag == 2) {
            clearErrorsAndMessages();
            addActionMessage("Entered reference number successfully!");
        } else if (documentflag == 3) {
            clearErrorsAndMessages();
            addActionMessage("Document(s) successfully updated!");
        } else if (documentflag == 4) {
            clearErrorsAndMessages();
            addActionMessage("Check all documents first before moving to next stage");
        } else if(documentflag == 5) {
            clearErrorsAndMessages();
            addActionMessage("Document(s) checked!");
        } else if(documentflag == 6){
            clearErrorsAndMessages();
            addActionMessage("Notified Destination office of faxed document");
        } else if(documentflag == 7){
            clearErrorsAndMessages();
            addActionMessage("Document(s) must be checked before processing");
        }else if(documentflag == 8){
            clearErrorsAndMessages();
            addActionMessage("All Documents processed!");
        }else if(documentflag == 9){
            clearErrorsAndMessages();
            addActionMessage("No Documents checked");
        }else{
            clearErrorsAndMessages();
        }
        //resets document flag
        documentflag = 0;
        sessionAttributes.put("documentflag", documentflag);
        sessionAttributes.put("orderIdParam", orderIdParam);
        //set document tab to anchor page on load
        if (sessionAttributes.get("documentTab") == null) {

            // Loop will count for documents already processed
            Integer checkDocs = 0;

            for (Documents documentElem : outboundEntityList) {

                if(documentElem.getDocumentProcessed() >= 1){
                    checkDocs = checkDocs + 1; // function will count checkDocs for document processed value greater than or equal to 1
                }
            }

            // Checked documents must be equal to total documents before being processed
            if(outboundCount != checkDocs){ // total outbound documents versus processed outbound documents
                documentTab = "OUTBOUND"; // not equals will yield incomplete outbound stage
            }else{
                documentTab = "OUTBOUND_COMPLETE"; // equels mean completed outbound stage
            }
        }else{
            documentTab = sessionAttributes.get("documentTab").toString(); // will get a difference document tab value from another method
        }

        // Document Tab Inbound Value
        if(sessionAttributes.get("documentTabInbound") == null){
            // Loop will count for documents already processed for outbound stage
            Integer checkDocs = 0;

            for (Documents documentElem : outboundEntityList) {

                if(documentElem.getDocumentProcessed() >= 1){ // function will count checkDocs for document processed value greater than or equal to 1
                    checkDocs = checkDocs + 1;
                }
            }
            // Loop will count for documents already processed for inbound stage
            // check for documents that has values for inbound returned date
            Integer checkReturnedInboundDateDocs = 0;

            for (Documents documentElem : inboundEntityList) {
                if(documentElem.getInboundReturned() != null){
                    checkReturnedInboundDateDocs = checkReturnedInboundDateDocs + 1; // checkReturnedInboundDateDocs will increment for documents that has inbound returned date.
                }
            }

            Integer checkDocsInbound = 0;

            for (Documents documentElem : inboundEntityList) {

                if(documentElem.getDocumentProcessed() == 2){
                    checkDocsInbound = checkDocsInbound + 1; // loop will count for total inbound documents under the same booking
                }
            }

            System.out.println("OUTBOUND DOCUMENTS COUNT "+ outboundCount);
            System.out.println("PROCESSED DOCUMENTS IN OUTBOUND STAGE "+ checkDocs);
            System.out.println("INBOUND DOCUMENT COUNT "+ inboundCount);
            System.out.println("INBOUND DOCUMENTS WITH RETURNED DATES " + checkReturnedInboundDateDocs);
            System.out.println("PROCESSED DOCUMENTS IN INBOUND STAGE " + checkDocsInbound);

            // Checked documents must be equal to total documents before being processed for outbound stage
            if(outboundCount != checkDocs) {
                documentTabInbound = "OUTBOUND_DOCUMENTS_INCOMPLETE";
            }else if(inboundCount != checkReturnedInboundDateDocs){
                documentTabInbound = "NO_INBOUND_DATE";
            }else if(inboundCount != checkDocsInbound){
                documentTabInbound = "INBOUND";
            }else if(inboundCount == 0){
                documentTabInbound = "NO_INBOUND_DOCUMENTS";
            }else if (inboundCount == checkReturnedInboundDateDocs && inboundCount == checkDocsInbound ){
                documentTabInbound = "INBOUND_COMPLETE";
            }

        }else{
            documentTabInbound = sessionAttributes.get("documentTabInbound").toString();
        }

        return SUCCESS;
    }

    /*INBOUND DOCUMENTS VIEW*/
    public String viewOrderDocumentsInbound() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        // Display Order items under documents view page
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        /*OUTBOUND DOCUMENTS*/
        /*outboundEntityList = documentsService.findDocumentByStageAndID("OUTBOUND", orderIdParam);*/

        /*for (Documents documentElem : outboundEntityList){
            outboundDocuments.add(transformDocumentsToFormBean(documentElem));
        }*/
        outboundEntityList = documentsService.findDocumentByOutboundStageAndID(1, orderIdParam);

        outboundCount = outboundEntityList.size();

        /*INBOUND DOCUMENTS*/
        //inboundEntityList = documentsService.findDocumentByStageAndID("INBOUND", orderIdParam);

        /*for (Documents documentElem : inboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        inboundEntityList = documentsService.findDocumentByInboundStageAndID(1, orderIdParam);

        inboundCount = inboundEntityList.size();

        // check for documents that has values for inbound returned
        Integer checkReturnedInboundDateDocs = 0;

        for (Documents documentElem : inboundEntityList) {
            if(documentElem.getInboundReturned() != null){
                checkReturnedInboundDateDocs = checkReturnedInboundDateDocs + 1;
            }
        }
        //List all inbound stage documents in table
        for (Documents documentElem : inboundEntityList) {
            inboundDocuments.add(transformDocumentsToFormBean(documentElem));
            // show date and comments on page
            Documents documentEntity = documentsService.findDocumentById(documentElem.getDocumentId());
            document = transformDocumentsToFormBean(documentEntity);
        }

        /*FINAL OUTBOUND DOCUMENTS*/
        //finalOutboundEntityList = documentsService.findDocumentByStageAndID("FINAL OUTBOUND", orderIdParam);

        /*for (Documents documentElem : finalOutboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        finalOutboundCount = finalOutboundEntityList.size();
        System.out.println(" Final Outbound count here ! " + finalOutboundCount );

        /*FINAL INBOUND DOCUMENTS*/
        //finalInboundEntityList = documentsService.findDocumentByStageAndID("FINAL INBOUND", orderIdParam);

        /*for (Documents documentElem : finalInboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        finalInboundCount = finalInboundEntityList.size();
        System.out.println(" Final Inbound count here ! " + finalInboundCount );

        /*ARCHIVE DOCUMENTS*/
        //archiveEntityList = documentsService.findDocumentByStageAndID("ARCHIVE", orderIdParam);

        /*for (Documents documentElem : archiveEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*BILLING DOCUMENTS*/
        //billingEntityList = documentsService.findDocumentByStageAndID("BILLING", orderIdParam);

        /*for (Documents documentElem : billingEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*Document flag determines message */
        documentflag = (Integer) sessionAttributes.get("documentflag");
        if (documentflag == null) {
            clearErrorsAndMessages();
        } else if (documentflag == 1) {
            clearErrorsAndMessages();
            addActionMessage("You must enter a reference number");
        } else if (documentflag == 2) {
            clearErrorsAndMessages();
            addActionMessage("Entered reference number successfully!");
        } else if (documentflag == 3) {
            clearErrorsAndMessages();
            addActionMessage("Document successfully moved!");
        } else if (documentflag == 4) {
            clearErrorsAndMessages();
            addActionMessage("Check all documents first before moving to next stage");
        }else if(documentflag == 5) {
            clearErrorsAndMessages();
            addActionMessage("Document checked!");
        }else if(documentflag == 6){
            clearErrorsAndMessages();
            addActionMessage("Notified Destination office of faxed document");
        }else if(documentflag == 7){
            clearErrorsAndMessages();
            addActionMessage("All Documents must be checked before processing");
        }else if(documentflag == 8){
            clearErrorsAndMessages();
            addActionMessage("All Documents processed!");
        }else if(documentflag == 9){
            clearErrorsAndMessages();
            addActionMessage("Return Date of Inbound documents saved");
        }else{
            clearErrorsAndMessages();
        }
        //reset document flag
        documentflag = 0;
        sessionAttributes.put("documentflag", documentflag);

        //set document tab to anchor page on load and document Tab value
        if (sessionAttributes.get("documentTab") == null) {

            // Loop will count for documents already processed for outbound stage
            Integer checkDocs = 0;

            for (Documents documentElem : outboundEntityList) {

                if(documentElem.getDocumentProcessed() >= 1){
                    checkDocs = checkDocs + 1;
                }
            }

            // Checked documents must be equal to total documents before being processed for outbound stage
            if(outboundCount != checkDocs){
                documentTab = "OUTBOUND";
            }else{
                documentTab = "OUTBOUND_COMPLETE";
            }

        }else{
            documentTab = sessionAttributes.get("documentTab").toString();

        }
        // Document Tab Inbound Value
        if(sessionAttributes.get("documentTabInbound") == null){
            // Loop will count for documents already processed for outbound stage
            Integer checkDocs = 0;

            for (Documents documentElem : outboundEntityList) {

                if(documentElem.getDocumentProcessed() >= 1){
                    checkDocs = checkDocs + 1;
                }
            }
            // Loop will count for documents already processed for inbound stage
            Integer checkDocsInbound = 0;

            for (Documents documentElem : inboundEntityList) {

                if(documentElem.getDocumentProcessed() == 2){
                    checkDocsInbound = checkDocsInbound + 1;
                }
            }
            System.out.println("OUTBOUND DOCUMENTS COUNT "+ outboundCount);
            System.out.println("PROCESSED DOCUMENTS IN OUTBOUND STAGE "+ checkDocs);
            System.out.println("INBOUND DOCUMENT COUNT "+ inboundCount);
            System.out.println("INBOUND DOCUMENTS WITH RETURNED DATES " + checkReturnedInboundDateDocs);
            System.out.println("PROCESSED DOCUMENTS IN INBOUND STAGE " + checkDocsInbound);
            // Checked documents must be equal to total documents before being processed for outbound stage
            if(outboundCount != checkDocs) {
                documentTabInbound = "OUTBOUND_DOCUMENTS_INCOMPLETE";
            }else if(inboundCount != checkReturnedInboundDateDocs){
                documentTabInbound = "NO_INBOUND_DATE";
            }else if(inboundCount != checkDocsInbound){
                documentTabInbound = "INBOUND";
            }else if(inboundCount == 0){
                documentTabInbound = "NO_INBOUND_DOCUMENTS";
            }else if (inboundCount == checkReturnedInboundDateDocs && inboundCount == checkDocsInbound ){
                documentTabInbound = "INBOUND_COMPLETE";
            }

        }else{
            documentTabInbound = sessionAttributes.get("documentTabInbound").toString();
        }

        return SUCCESS;
    }

    /*FINAL OUTBOUND DOCUMENTS VIEW*/
    public String viewOrderDocumentsFinalOutbound() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        /*OUTBOUND DOCUMENTS*/
        //outboundEntityList = documentsService.findDocumentByStageAndID("OUTBOUND", orderIdParam);

        for (Documents documentElem : outboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }
        outboundCount = outboundEntityList.size();
        System.out.println("Outbound count here ! " + outboundCount );

        /*INBOUND DOCUMENTS*/
        //inboundEntityList = documentsService.findDocumentByStageAndID("INBOUND", orderIdParam);

        for (Documents documentElem : inboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }
        inboundCount = inboundEntityList.size();
        System.out.println("Inbound count here ! " + inboundCount );

        /*FINAL OUTBOUND DOCUMENTS*/
        //finalOutboundEntityList = documentsService.findDocumentByStageAndID("FINAL OUTBOUND", orderIdParam);

        for (Documents documentElem : finalOutboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        finalOutboundCount = finalOutboundEntityList.size();
        System.out.println(" Final Outbound count here ! " + finalOutboundCount );

        /*FINAL INBOUND DOCUMENTS*/
        //finalInboundEntityList = documentsService.findDocumentByStageAndID("FINAL INBOUND", orderIdParam);

        for (Documents documentElem : finalInboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }
        finalInboundCount = finalInboundEntityList.size();
        System.out.println(" Final Inbound count here ! " + finalInboundCount );
        /*ARCHIVE DOCUMENTS*/
        //archiveEntityList = documentsService.findDocumentByStageAndID("ARCHIVE", orderIdParam);

        for (Documents documentElem : archiveEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*BILLING DOCUMENTS*/
        //billingEntityList = documentsService.findDocumentByStageAndID("BILLING", orderIdParam);

        for (Documents documentElem : billingEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*Document flag determines message */
        documentflag = (Integer)sessionAttributes.get("documentflag");
        if(documentflag == null){
            clearErrorsAndMessages();
        }else if(documentflag == 1){
            clearErrorsAndMessages();
            addActionMessage("You must enter a reference number");
        }else if(documentflag == 2){
            clearErrorsAndMessages();
            addActionMessage("Entered reference number successfully!");
        }else if(documentflag == 3){
            clearErrorsAndMessages();
            addActionMessage("Document successfully moved!");
        }else if(documentflag == 4) {
            clearErrorsAndMessages();
            addActionMessage("Check document first before moving to next stage");
        }else if(documentflag == 5) {
            clearErrorsAndMessages();
            addActionMessage("Document checked!");
        }else if(documentflag == 6){
            clearErrorsAndMessages();
            addActionMessage("Notified Destination office of faxed document");
        }else{
            clearErrorsAndMessages();
        }

        //reset document flag
        documentflag = 0;
        sessionAttributes.put("documentflag", documentflag);

        //set document tab to anchor page on load
        documentTab = "FINAL OUTBOUND";

        return SUCCESS;
    }
    /*FINAL INBOUND DOCUMENTS VIEW*/
    public String viewOrderDocumentsFinalInbound() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        /*OUTBOUND DOCUMENTS*/
        //outboundEntityList = documentsService.findDocumentByStageAndID("OUTBOUND", orderIdParam);

        for (Documents documentElem : outboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }
        outboundCount = outboundEntityList.size();
        System.out.println("Outbound count here ! " + outboundCount );
        /*INBOUND DOCUMENTS*/
        //inboundEntityList = documentsService.findDocumentByStageAndID("INBOUND", orderIdParam);

        for (Documents documentElem : inboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }
        inboundCount = inboundEntityList.size();
        System.out.println("Inbound count here ! " + inboundCount );
        /*FINAL OUTBOUND DOCUMENTS*/
        //finalOutboundEntityList = documentsService.findDocumentByStageAndID("FINAL OUTBOUND", orderIdParam);

        for (Documents documentElem : finalOutboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }
        finalOutboundCount = finalOutboundEntityList.size();
        System.out.println(" Final Outbound count here ! " + finalOutboundCount );

        /*FINAL INBOUND DOCUMENTS*/
        //finalInboundEntityList = documentsService.findDocumentByStageAndID("FINAL INBOUND", orderIdParam);

        for (Documents documentElem : finalInboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }
        finalInboundCount = finalInboundEntityList.size();
        System.out.println(" Final Inbound count here ! " + finalInboundCount );
        /*ARCHIVE DOCUMENTS*/
        //archiveEntityList = documentsService.findDocumentByStageAndID("ARCHIVE", orderIdParam);

        for (Documents documentElem : archiveEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*BILLING DOCUMENTS*/
        //billingEntityList = documentsService.findDocumentByStageAndID("BILLING", orderIdParam);

        for (Documents documentElem : billingEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }

        /*Document flag determines message */
        documentflag = (Integer)sessionAttributes.get("documentflag");
        if(documentflag == null){
            clearErrorsAndMessages();
        }else if(documentflag == 1){
            clearErrorsAndMessages();
            addActionMessage("You must enter a reference number");
        }else if(documentflag == 2){
            clearErrorsAndMessages();
            addActionMessage("Entered reference number successfully!");
        }else if(documentflag == 3){
            clearErrorsAndMessages();
            addActionMessage("Document successfully moved!");
        }else if(documentflag == 4) {
            clearErrorsAndMessages();
            addActionMessage("Check document first before moving to next stage");
        }else if(documentflag == 5) {
            clearErrorsAndMessages();
            addActionMessage("Document checked!");
        }else if(documentflag == 6){
            clearErrorsAndMessages();
            addActionMessage("Notified Destination office of faxed document");
        }else{
            clearErrorsAndMessages();
        }

        //reset document flag
        documentflag = 0;
        sessionAttributes.put("documentflag", documentflag);

        //set document tab to anchor page on load
        documentTab = "FINAL INBOUND";

        return SUCCESS;
    }

    private OrderItemsBean transformToOrderItemsFormBean(OrderItems orderItem) {

        OrderItemsBean orderItemBean = new OrderItemsBean();

        orderItemBean.setOrderItemId(orderItem.getOrderItemId());
        orderItemBean.setQuantity(orderItem.getQuantity());
        orderItemBean.setNameSize(orderItem.getNameSize());
        orderItemBean.setWeight(orderItem.getWeight());
        orderItemBean.setVolume(orderItem.getVolume());
        orderItemBean.setClassification(orderItem.getClassification());
        orderItemBean.setDescription(orderItem.getCommodity());
        orderItemBean.setRate(orderItem.getRate());
        orderItemBean.setDeclaredValue(orderItem.getDeclaredValue());
        orderItemBean.setRemarks(orderItem.getComments());

        // To fetch sea vendor name from vendor ID

        if(orderItem.getVendorSea() != null){
            Vendor seaVendor = vendorService.findVendorByVendorCode(orderItem.getVendorSea());
            orderItemBean.setVendorSea(seaVendor.getVendorName());
        }else{
            orderItemBean.setVendorSea("NONE");
        }

        // To fetch origin vendor name from vendor ID
        if(orderItem.getVendorOrigin() != null){
            Vendor originVendor = vendorService.findVendorByVendorCode(orderItem.getVendorOrigin());
            orderItemBean.setVendorOrigin(originVendor.getVendorName());
        }else{
            orderItemBean.setVendorOrigin("NONE");
        }

        // To fetch destination vendor name from vendor ID
        if(orderItem.getVendorDestination() != null){
            Vendor destinationVendor = vendorService.findVendorByVendorCode(orderItem.getVendorDestination());
            orderItemBean.setVendorDestination(destinationVendor.getVendorName());
        }else{
            orderItemBean.setVendorDestination("NONE");
        }

        return orderItemBean;
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

    public String moveDocumentInbound(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if(documentEntity.getDocumentProcessed().equals(1)){
            /*documentEntity.setDocumentType("FINAL OUTBOUND");*/
            documentEntity.setDocumentStatus("FROM INBOUND");

            if (documentEntity.getDocumentName().equals("BOOKING REQUEST FORM WITH SIGNATURE")) {
                documentEntity.setDocumentProcessed(0);
                /*documentEntity.setDocumentType("ARCHIVE");*/
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            }
            if (documentEntity.getDocumentName().equals("MASTER BILL OF LADING")) {
                if ("".equals(documentEntity.getReferenceNumber())) {
                    /*Pass flag to view order documents*/
                    documentflag = 1;
                    sessionAttributes.put("documentflag", documentflag);
                    /*documentEntity.setDocumentType("INBOUND");*/
                    documentEntity.setDocumentName("MASTER BILL OF LADING");
                    documentEntity.setDocumentProcessed(0);
                } else {
                    documentEntity.setDocumentName("MASTER BILL OF LADING");
                    documentEntity.setDocumentStatus("FROM INBOUND");
                    documentEntity.setDocumentProcessed(0);
                    /*Pass flag to view order documents*/
                    documentflag = 3;
                    sessionAttributes.put("documentflag", documentflag);
                }
            }
            if (documentEntity.getDocumentName().equals("HOUSE WAYBILL ORIGIN WITH SIGNATURE")) {
                documentEntity.setDocumentProcessed(0);
                /*documentEntity.setDocumentType("ARCHIVE");*/
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            }
            if(documentEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN")){
                documentEntity.setDocumentProcessed(0);
                /*documentEntity.setDocumentType("ARCHIVE");*/

                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            }
            else {
                documentEntity.setDocumentProcessed(0);
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            }

            documentsService.updateDocument(documentEntity);
        }else{
            documentflag = 4;
            sessionAttributes.put("documentflag", documentflag);
        }

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String moveDocumentFinalOutbound(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if(documentEntity.getDocumentProcessed().equals(1)){

            if(documentEntity.getDocumentName().equals("MASTER BILL OF LADING")) {
                /*documentEntity.setDocumentType("ARCHIVE");*/
                documentEntity.setDocumentStatus("FROM FINAL OUTBOUND");
                documentEntity.setDocumentProcessed(0);
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);

            } else if (documentEntity.getDocumentName().equals("HOUSE WAYBILL DESTINATION")) {
                documentEntity.setDocumentProcessed(0);
                /*documentEntity.setDocumentType("FINAL INBOUND");*/
                documentEntity.setDocumentStatus("FROM FINAL OUTBOUND");
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            }else if(documentEntity.getDocumentName().equals("SALES INVOICE / DELIVERY RECEIPT")) {
                documentEntity.setDocumentProcessed(0);
                /*documentEntity.setDocumentType("FINAL INBOUND");*/
                documentEntity.setDocumentStatus("FROM FINAL OUTBOUND");
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            }else if(documentEntity.getDocumentName().equals("AUTHORIZATION TO WITHDRAW")) {
                documentEntity.setDocumentProcessed(0);
                /*documentEntity.setDocumentType("ARCHIVE");*/
                documentEntity.setDocumentStatus("FROM FINAL OUTBOUND");
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            } else {
                /*documentEntity.setDocumentType("FINAL INBOUND");*/
                documentEntity.setDocumentStatus("FROM FINAL OUTBOUND");
                documentEntity.setDocumentProcessed(0);
                /*Pass flag to view order documents*/
                documentflag = 3;
                sessionAttributes.put("documentflag", documentflag);
            }
            documentsService.updateDocument(documentEntity);
        }else{
            documentflag = 4;
            sessionAttributes.put("documentflag", documentflag);
        }

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }
    // Process Documents on Outbound Stage
    public String processDocuments(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        /*Documents documentEntity = documentsService.findDocumentById(documentIdParam);*/
        System.out.println("CHECK WORD PASS" + check);

        System.out.println("DOCUMENT ITEM" + document.getDocumentItem());

        // Check has value
        if (check != null) {

            if(document.getDocumentItem().equals("check")) { // if word passed is equals to check

                for (int i = 0; i < check.length; i++) { // loop of how many values in check

                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){ // catches error when no values inside check
                        documentflag = 9; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }
                    // will execute if document item is equals to check
                    Integer documentId = Integer.parseInt(check[i]);

                    Documents documentIdEntity = documentsService.findDocumentById(documentId);
                    // Will trigger if Proforma Bill of Lading does not have a Reference Number
                    if (documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && documentIdEntity.getReferenceNumber() == null) {

                        documentIdEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
                        documentIdEntity.setDocumentProcessed(0);
                        /*Pass flag to view order documents*/
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    // Will trigger if Proforma Bill of Lading has a Reference Number
                    } else if (documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && documentIdEntity.getReferenceNumber() != null) {
                        documentIdEntity.setDocumentStatus("ENTERED REFERENCE NUMBER");
                        documentIdEntity.setDocumentProcessed(1);
                        documentIdEntity.setArchiveStage(1);
                        /*Pass flag to view order documents*/
                        documentflag = 2; // shows reference number entered successfully
                        sessionAttributes.put("documentflag", documentflag);

                        /*-------------------------------------------------------------------------------------------------------------------------*/
                        // Master Bill of Lading will be created under pending documents begin
                        /*Orders orderEntity = orderService.findOrdersById(documentIdEntity.getReferenceId());

                        Documents documentEntity = new Documents();

                        Client client = clientService.findClientById(getClientId().toString());
                        documentEntity.setClient(client);

                        documentEntity.setDocumentName(DocumentsConstants.MASTER_BILL_OF_LADING);
                        documentEntity.setReferenceId(orderEntity.getOrderId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setDocumentStatus("PENDING");
                        documentEntity.setInboundStage(1);
                        documentEntity.setDocumentProcessed(1);

                        documentsService.addDocuments(documentEntity);
*/
                        // Master Bill of Lading will be created under pending documents end
                        /*-------------------------------------------------------------------------------------------------------------------------*/

                    // Triggers if Document is House Bill of Lading
                    } else if (documentIdEntity.getDocumentName().equals("HOUSE BILL OF LADING")) {
                        documentIdEntity.setDocumentProcessed(1);
                        documentIdEntity.setInboundStage(1);
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    } else if(documentIdEntity.getDocumentName().equals("BOOKING REQUEST FORM")){ // Triggers if Document is Booking Request Form
                        documentIdEntity.setInboundStage(1);
                        documentIdEntity.setDocumentProcessed(1);
                        documentIdEntity.setDocumentStatus("PRINTED");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                    } else if(documentIdEntity.getDocumentName().equals("HOUSE WAYBILL ORIGIN")){ // Triggers if Document is HOUSE WAYBILL ORIGIN
                        documentIdEntity.setInboundStage(1);
                        documentIdEntity.setDocumentProcessed(1);
                        documentIdEntity.setDocumentStatus("PRINTED");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message

                        // Master Way Bill Origin will be created under pending documents begin

                        /*Orders orderEntity = orderService.findOrdersById(documentIdEntity.getReferenceId());

                        Documents documentEntity = new Documents();

                        Client client = clientService.findClientById(getClientId().toString());
                        documentEntity.setClient(client);

                        documentEntity.setDocumentName(DocumentsConstants.MASTER_WAYBILL_ORIGIN);
                        documentEntity.setReferenceId(orderEntity.getOrderId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setDocumentStatus("PENDING");
                        documentEntity.setInboundStage(1);
                        documentEntity.setDocumentProcessed(1);
                        documentEntity.setOrderItemId(documentIdEntity.getOrderItemId());

                        documentsService.addDocuments(documentEntity);*/

                        // Master Way Bill Origin will be created under pending documents end

                    } else {
                        documentIdEntity.setDocumentStatus("PRINTED");
                        documentIdEntity.setDocumentProcessed(1);
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }

                    documentsService.updateDocument(documentIdEntity);

                    sessionAttributes.put("orderIdParam", documentIdEntity.getReferenceId());

                }

            }
        }else {

                sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
                documentflag = 7; // all documents must be checked before processing
                sessionAttributes.put("documentflag", documentflag);
                return INPUT;
        }

        return SUCCESS;

    }

    public String processDocumentsInbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("-----------------------------------------------" + check);

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + document.getDocumentItem());

        if (check != null) {

            if(document.getDocumentItem().equals("check")) {

                for (int i = 0; i < check.length; i++) {
                    // if no checkbox are selected
                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){
                        documentflag = 9; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentId = Integer.parseInt(check[i]);

                    Documents documentIdEntity = documentsService.findDocumentById(documentId);

                    if (documentIdEntity.getDocumentName().equals("BOOKING REQUEST FORM WITH SIGNATURE")){
                        documentIdEntity.setDocumentProcessed(2);
                        documentIdEntity.setArchiveStage(1);
                        documentIdEntity.setDocumentStatus("RECEIVED WITH SIGNATURE");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                    }else if(documentIdEntity.getDocumentName().equals("HOUSE BILL OF LADING")){
                        documentIdEntity.setDocumentProcessed(2);
                        documentIdEntity.setFinalOutboundStage(1);
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("HOUSE WAYBILL ORIGIN WITH SIGNATURE")){
                        documentIdEntity.setOutboundStage(1);
                        documentIdEntity.setArchiveStage(1);
                        documentIdEntity.setDocumentProcessed(2);
                        documentIdEntity.setDocumentStatus("RECEIVED WITH SIGNATURE");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);

                        // House Way Bill Destination will be created under pending documents begin

                        /*Orders orderEntity = orderService.findOrdersById(documentIdEntity.getReferenceId());

                        if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("PIER TO DOOR")) {

                            Documents documentEntity = new Documents();

                            Client client = clientService.findClientById(getClientId().toString());
                            documentEntity.setClient(client);

                            documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_DESTINATION);
                            documentEntity.setReferenceId(orderEntity.getOrderId());
                            documentEntity.setReferenceTable("ORDERS");
                            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                            documentEntity.setCreatedDate(new Date());
                            documentEntity.setDocumentStatus("PENDING");
                            documentEntity.setFinalOutboundStage(1);
                            documentEntity.setDocumentProcessed(2);
                            documentEntity.setOrderItemId(documentIdEntity.getOrderItemId());

                            documentsService.addDocuments(documentEntity);
                        }
*/
                        // House Way Bill Destination will be created under pending documents end

                    }else if(documentIdEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") && documentIdEntity.getReferenceNumber() == null){

                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN")){

                        documentIdEntity.setArchiveStage(1);
                        documentIdEntity.setDocumentProcessed(2);
                        documentIdEntity.setDocumentStatus("RECEIVED");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);

                    }else if(documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING") && documentIdEntity.getReferenceNumber() == null){
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING")){
                        documentIdEntity.setFinalOutboundStage(1);
                        documentIdEntity.setDocumentProcessed(2);
                        documentIdEntity.setDocumentStatus("RECEIVED");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }
                    // update each document
                    documentsService.updateDocument(documentIdEntity);
                    // session pass order id
                    sessionAttributes.put("orderIdParam", documentIdEntity.getReferenceId());
                }

            }

        }else{
            sessionAttributes.put("orderIdParam", (Integer) sessionAttributes.get("orderIdParam"));
            documentflag = 7; // all documents must be checked before processing
            sessionAttributes.put("documentflag", documentflag);
            return INPUT;
        }

        return SUCCESS;
    }

    public String checkDocumentInbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if (documentEntity.getDocumentName().equals("MASTER BILL OF LADING") && "".equals(documentEntity.getReferenceNumber()) || documentEntity.getDocumentName().equals("MASTER BILL OF LADING") && documentEntity.getReferenceNumber() == null ) {

            documentEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
            documentEntity.setDocumentProcessed(0);
            /*Pass flag to view order documents*/
            documentflag = 1;
            sessionAttributes.put("documentflag", documentflag);

        }else if(documentEntity.getDocumentName().equals("SALES INVOICE / DELIVERY RECEIPT") && "".equals(documentEntity.getReferenceNumber()) || documentEntity.getDocumentName().equals("SALES INVOICE / DELIVERY RECEIPT") && documentEntity.getReferenceNumber() == null ) {

            documentEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
            documentEntity.setDocumentProcessed(0);
            /*Pass flag to view order documents*/
            documentflag = 1;
            sessionAttributes.put("documentflag", documentflag);

        }else if(documentEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") && "".equals(documentEntity.getReferenceNumber()) || documentEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") && documentEntity.getReferenceNumber() == null) {

            documentEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
            documentEntity.setDocumentProcessed(0);
            /*Pass flag to view order documents*/
            documentflag = 1;
            sessionAttributes.put("documentflag", documentflag);

        }else if( documentEntity.getDocumentName().equals("MASTER BILL OF LADING") && documentEntity.getReferenceNumber() != null ) {

            documentEntity.setDocumentStatus("FAXED / COPIED");
            documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
            documentflag = 5;
            sessionAttributes.put("documentflag", documentflag);

        }else if(( documentEntity.getDocumentName().equals("SALES INVOICE / DELIVERY RECEIPT") && documentEntity.getReferenceNumber() != null) || ( documentEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") && documentEntity.getReferenceNumber() != null )) {

            documentEntity.setDocumentStatus("ENTERED REFERENCE NUMBER");
            documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
            documentflag = 5;
            sessionAttributes.put("documentflag", documentflag);

        }else if(documentEntity.getDocumentName().equals("HOUSE BILL OF LADING")){

            documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
            documentflag = 5;
            sessionAttributes.put("documentflag", documentflag);

        }else{

            documentEntity.setDocumentStatus("SIGNED");
            documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
            documentflag = 5;
            sessionAttributes.put("documentflag", documentflag);

        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String checkDocumentFinalOutbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        /*Change Document Status to faxed or copied*/
        documentEntity.setDocumentStatus("FAXED / COPIED");
        documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
        documentflag = 5;
        sessionAttributes.put("documentflag", documentflag);

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String checkDocumentFinalInbound() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if(documentEntity.getDocumentName().equals("HOUSE BILL OF LADING")){
            documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
            documentflag = 5;
            sessionAttributes.put("documentflag", documentflag);
        }else if(documentEntity.getDocumentName().equals("HOUSE WAYBILL DESTINATION WITH SIGNATURE") || documentEntity.getDocumentName().equals("SALES INVOICE / DELIVERY RECEIPT WITH SIGNATURE")){
            documentEntity.setDocumentStatus("SIGNED");
            documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
            documentflag = 5;
            sessionAttributes.put("documentflag", documentflag);
        }else if(documentEntity.getDocumentName().equals("MASTER WAYBILL DESTINATION") ){
            if(("".equals(documentEntity.getReferenceNumber()) || documentEntity.getReferenceNumber() == null)){
                /*Pass flag to view order documents*/
                documentflag = 1;
                sessionAttributes.put("documentflag", documentflag);
            }else{
                documentEntity.setDocumentStatus("ENTERED REFERENCE NUMBER");
                documentEntity.setDocumentProcessed(1);
                /*Pass flag to view order documents*/
                documentflag = 5;
                sessionAttributes.put("documentflag", documentflag);
            }
        }else{
            documentEntity.setDocumentStatus("PRINTED");
            documentEntity.setDocumentProcessed(1);
            /*Pass flag to view order documents*/
            documentflag = 5;
            sessionAttributes.put("documentflag", documentflag);
        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }


    public String orderDocumentsInput() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        // Reference number will be added to this document ID
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        document = transformDocumentsToFormBean(documentEntity);

        // Display Order items under documents view page
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        /*OUTBOUND DOCUMENTS*/
        outboundEntityList = documentsService.findDocumentByOutboundStageAndID(1, orderIdParam);

        outboundCount = outboundEntityList.size();
        System.out.println("Outbound count here ! " + outboundCount );

        sessionAttributes.put("outboundCount", outboundCount); // Puts outbound count in session before forwarding to transformDocumentsToFormBean

        for (Documents documentElem : outboundEntityList) {
            outboundDocuments.add(transformDocumentsToFormBean(documentElem));
        }

        return SUCCESS;
    }

    public String orderDocumentsInboundInput() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        // Reference number will be added to this document ID
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        document = transformDocumentsToFormBean(documentEntity);

        // Display Order items under documents view page
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        /*OUTBOUND DOCUMENTS*/
        outboundEntityList = documentsService.findDocumentByOutboundStageAndID(1, orderIdParam);

        outboundCount = outboundEntityList.size();

        inboundEntityList = documentsService.findDocumentByInboundStageAndID(1, orderIdParam);

        inboundCount = inboundEntityList.size();

        // check for documents that has values for inbound returned
        Integer checkReturnedInboundDateDocs = 0;

        for (Documents documentElem : inboundEntityList) {
            if(documentElem.getInboundReturned() != null){
                checkReturnedInboundDateDocs = checkReturnedInboundDateDocs + 1;
            }
        }
        //List all inbound stage documents in table
        for (Documents documentElem : inboundEntityList) {
            inboundDocuments.add(transformDocumentsToFormBean(documentElem));
            // show date and comments on page
            Documents documentEntityElem = documentsService.findDocumentById(documentElem.getDocumentId());
            // commented out because of conflict with table
            //document = transformDocumentsToFormBean(documentEntityElem);
        }

        /*List<Documents> documentsEntityList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*OUTBOUND DOCUMENTS*/
        //outboundEntityList = documentsService.findDocumentByStageAndID("OUTBOUND", orderIdParam);

        /*for (Documents documentElem : outboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*INBOUND DOCUMENTS*/
        //inboundEntityList = documentsService.findDocumentByStageAndID("INBOUND", orderIdParam);

        /*for (Documents documentElem : inboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*FINAL OUTBOUND DOCUMENTS*/
        //finalOutboundEntityList = documentsService.findDocumentByStageAndID("FINAL OUTBOUND", orderIdParam);

        /*for (Documents documentElem : finalOutboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*FINAL INBOUND DOCUMENTS*/
        //finalInboundEntityList = documentsService.findDocumentByStageAndID("FINAL INBOUND", orderIdParam);

        /*for (Documents documentElem : finalInboundEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*ARCHIVE DOCUMENTS*/
        //archiveEntityList = documentsService.findDocumentByStageAndID("ARCHIVE", orderIdParam);

        /*for (Documents documentElem : archiveEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*BILLING DOCUMENTS*/
        //billingEntityList = documentsService.findDocumentByStageAndID("BILLING", orderIdParam);

        /*for (Documents documentElem : billingEntityList){
            documents.add(transformDocumentsToFormBean(documentElem));
        }*/

        /*Document flag determines message */

        documentflag = (Integer) sessionAttributes.get("documentflag");
        if (documentflag == null) {
            clearErrorsAndMessages();
        } else if (documentflag == 1) {
            clearErrorsAndMessages();
            addActionMessage("You must enter a reference number");
        } else if (documentflag == 2) {
            clearErrorsAndMessages();
            addActionMessage("Entered reference number successfully!");
        } else if (documentflag == 3) {
            clearErrorsAndMessages();
            addActionMessage("Document successfully moved!");
        } else if (documentflag == 4) {
            clearErrorsAndMessages();
            addActionMessage("Check all documents first before moving to next stage");
        }else if(documentflag == 5) {
            clearErrorsAndMessages();
            addActionMessage("Document checked!");
        }else if(documentflag == 6){
            clearErrorsAndMessages();
            addActionMessage("Notified Destination office of faxed document");
        }else if(documentflag == 7){
            clearErrorsAndMessages();
            addActionMessage("Document(s) must be checked before processing");
        }else if(documentflag == 8){
            clearErrorsAndMessages();
            addActionMessage("All Documents processed!");
        }else if(documentflag == 9){
            clearErrorsAndMessages();
            addActionMessage("Return Date of Inbound documents saved");
        }else{
            clearErrorsAndMessages();
        }
        //reset document flag
        documentflag = 0;
        sessionAttributes.put("documentflag", documentflag);

        //set document tab to anchor page on load and document Tab value
        if (sessionAttributes.get("documentTab") == null) {

            // Loop will count for documents already processed for outbound stage
            Integer checkDocs = 0;

            for (Documents documentElem : outboundEntityList) {

                if(documentElem.getDocumentProcessed() >= 1){
                    checkDocs = checkDocs + 1;
                }
            }

            // Checked documents must be equal to total documents before being processed for outbound stage
            if(outboundCount != checkDocs){
                documentTab = "OUTBOUND";
            }else{
                documentTab = "OUTBOUND_COMPLETE";
            }

        }else{
            documentTab = sessionAttributes.get("documentTab").toString();

        }

        // Document Tab Inbound Value
        if(sessionAttributes.get("documentTabInbound") == null){
            // Loop will count for documents already processed for outbound stage
            Integer checkDocs = 0;

            for (Documents documentElem : outboundEntityList) {

                if(documentElem.getDocumentProcessed() >= 1){
                    checkDocs = checkDocs + 1;
                }
            }
            // Loop will count for documents already processed for inbound stage
            Integer checkDocsInbound = 0;

            for (Documents documentElem : inboundEntityList) {

                if(documentElem.getDocumentProcessed() == 2){
                    checkDocsInbound = checkDocsInbound + 1;
                }
            }
            System.out.println("gggggggggggggggggggggggggggggggggggggggggggggggggggggggggg"+outboundCount);
            System.out.println("gggggggggggggggggggggggggggggggggggggggggggggggggggggggggg"+checkDocs);
            System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"+inboundCount);
            System.out.println("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"+checkReturnedInboundDateDocs);
            System.out.println("cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"+checkDocsInbound);
            // Checked documents must be equal to total documents before being processed for outbound stage
            if(outboundCount != checkDocs) {
                documentTabInbound = "OUTBOUND_DOCUMENTS_INCOMPLETE";
            }else if(inboundCount != checkReturnedInboundDateDocs){
                documentTabInbound = "NO_INBOUND_DATE";
            }else if(inboundCount != checkDocsInbound){
                documentTabInbound = "INBOUND";
            }else if(inboundCount == 0){
                documentTabInbound = "NO_INBOUND_DOCUMENTS";
            }else if (inboundCount == checkReturnedInboundDateDocs && inboundCount == checkDocsInbound ){
                documentTabInbound = "INBOUND_COMPLETE";
            }

        }else{
            documentTabInbound = sessionAttributes.get("documentTabInbound").toString();
        }

        return SUCCESS;
    }

    public String addReferenceNumber() {

        Documents documentsEntity = transformToDocumentEntityBean(document);

        documentsService.updateDocument(documentsEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", documentsEntity.getReferenceId());

        /*Pass flag to view order documents*/

        if (documentsEntity.getDocumentName().equals("BOOKING REQUEST FORM") || documentsEntity.getDocumentName().equals("HOUSE BILL OF LADING") || documentsEntity.getDocumentName().equals("HOUSE WAYBILL ORIGIN") ){
            documentflag = 3; // document successfully updated
            sessionAttributes.put("documentflag", documentflag);
        }else {
            documentflag = 2; // entered reference number successfully
            sessionAttributes.put("documentflag", documentflag);
        }

        return SUCCESS;
    }

    public String addReferenceNumberInbound() {

        Documents documentsEntity = transformToDocumentEntityBean(document);

        documentsService.updateDocument(documentsEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", documentsEntity.getReferenceId());

        /*Pass flag to view order documents*/
        documentflag = 2; // entered reference number successfully
        sessionAttributes.put("documentflag", documentflag);

        return SUCCESS;
    }

    public String notifyByFaxFinalOutbound() {

        /*-------------------- BEGIN NOTIFY FREIGHT OPERATION DEPARTMENT IN DESTINATION SOURCE CODE !!!! -------------------------*/

        /*-------------------- END NOTIFY FREIGHT OPERATION DEPARTMENT IN DESTINATION SOURCE CODE !!!! -------------------------*/

        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if (documentEntity.getDocumentName().equals("MASTER BILL OF LADING") || documentEntity.getDocumentName().equals("SALES INVOICE / DELIVERY RECEIPT") ) {
            documentEntity.setDocumentStatus("DOCUMENT FAXED TO DESTINATION OFFICE");
            documentEntity.setDocumentProcessed(0);
            /*Pass flag to view order documents*/
            documentflag = 6;
            sessionAttributes.put("documentflag", documentflag);
        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String moveDocuments() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        /*OUTBOUND DOCUMENTS*/
        outboundEntityList = documentsService.findDocumentByOutboundStageAndID(1, orderIdParam);

        outboundCount = outboundEntityList.size();
        // Loop will count for documents already processed
        Integer checkDocs = 0;

        for (Documents documentElem : outboundEntityList) {
            if(documentElem.getDocumentProcessed() == 1){
                checkDocs = checkDocs + 1;
            }
        }
        // Checked documents must be equal to total documents before being processed
        if(outboundCount != checkDocs){
            documentflag = 7; // All Documents must be checked before processing
            sessionAttributes.put("documentflag", documentflag);
            sessionAttributes.put("orderIdParam", orderIdParam);
            documentTab = "OUTBOUND";
            sessionAttributes.put("documentTab", documentTab);
            return INPUT;
        }else {
            //Activates documents stage number depending on document name

            for (Documents documentElem : outboundEntityList) {
                documentElem.setDocumentStatus("FROM OUTBOUND");
                if(documentElem.getDocumentName().equals("BOOKING REQUEST FORM")){
                    documentElem.setInboundStage(1);
                }else if(documentElem.getDocumentName().equals("PROFORMA BILL OF LADING")){
                    documentElem.setArchiveStage(1);
                }else if(documentElem.getDocumentName().equals("HOUSE WAYBILL ORIGIN")){
                    documentElem.setInboundStage(1);
                }else{
                    documentElem.setInboundStage(1);
                }

                documentsService.updateDocument(documentElem);
            }

            documentflag = 8; // All documents processed
            sessionAttributes.put("documentflag", documentflag);
            sessionAttributes.put("orderIdParam", orderIdParam);
            documentTab = "OUTBOUND_COMPLETE";
            sessionAttributes.put("documentTab", documentTab);

        }

        return SUCCESS;
    }

    public String dateReceivedInbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa " + document.getReferenceId());
        System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb " + document.getInboundReturned());
        System.out.println("cccccccccccccccccccccccccccccccccccccccccccc " + document.getDocumentComments());
        System.out.println("dddddddddddddddddddddddddddddddddddddddddddd " + document.getDocumentItem());

        /*if(document.getDocumentItem() == "save"){
            for (Documents documentElem : inboundEntityList) {
            documentElem.setInboundReturned(document.getInboundReturned());
            documentElem.setDocumentComments(document.getDocumentComments());
            // data will be saved per document
            documentsService.updateDocument(documentElem);
            }
            System.out.println("77777777777777777777777777777777777777777777777777777777777");
        }*/

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(document.getReferenceId());
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        // Display Order items under documents view page
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(document.getReferenceId());
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        outboundEntityList = documentsService.findDocumentByOutboundStageAndID(1, document.getReferenceId());

        outboundCount = outboundEntityList.size();

        inboundEntityList = documentsService.findDocumentByInboundStageAndID(1, document.getReferenceId());
        //List all inbound stage documents in table
        for (Documents documentElem : inboundEntityList) {
            inboundDocuments.add(transformDocumentsToFormBean(documentElem));
            // show date and comments on page
            Documents documentEntity = documentsService.findDocumentById(documentElem.getDocumentId());
            document = transformDocumentsToFormBean(documentEntity);
        }
        // Count the number of inbound stage documents
        inboundCount = inboundEntityList.size();
        // Loop will save inbound date and document comments to all inbound staged documents

        //Loop will count if all documents have inbound returned date
        Integer docsReturnedInbound = 0;
        for (Documents documentElem : inboundEntityList) {
            if(documentElem.getInboundReturned() != null){
                docsReturnedInbound = docsReturnedInbound + 1;
            }
        }
        // number of returned date documents must match all inbound staged documents to throw inbound message flag
        if(inboundCount == docsReturnedInbound){
            documentflag = 9; // Return Date of Inbound documents saved
            sessionAttributes.put("documentflag", documentflag);
            documentTabInbound = "INBOUND"; // Set document flag to pass
            //sessionAttributes.put("documentTabInbound", documentTabInbound);
        }else{
            documentTabInbound = "NO_INBOUND_DATE"; // Set document flag to pass
            //sessionAttributes.put("documentTabInbound", documentTabInbound);
        }

        documentTab = "OUTBOUND_COMPLETE";
        //sessionAttributes.put("documentTab", documentTab); // document tab outbound complete pass

        sessionAttributes.put("orderIdParam", document.getReferenceId()); // Order ID pass

        return SUCCESS;
    }

    public String dateReceivedInboundInput(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        inboundEntityList = documentsService.findDocumentByInboundStageAndID(1, document.getReferenceId());

        for (Documents documentElem : inboundEntityList) {
            documentElem.setInboundReturned(document.getInboundReturned());
            documentElem.setDocumentComments(document.getDocumentComments());
            // data will be saved per document
            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", document.getReferenceId()); // Order ID pass

        return SUCCESS;
    }

    private Documents transformToDocumentEntityBean(DocumentsBean formBean) {

        Documents entity = new Documents();

        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if(formBean.getDocumentId() != null) {
            entity.setDocumentId(new Integer(formBean.getDocumentId()));
        }

        Documents subEntity = documentsService.findDocumentById(formBean.getDocumentId());

        if(subEntity.getDocumentName().equals("BOOKING REQUEST FORM") || subEntity.getDocumentName().equals("HOUSE BILL OF LADING") || subEntity.getDocumentName().equals("HOUSE WAYBILL ORIGIN")){
            entity.setReferenceNumber(subEntity.getReferenceNumber());
        }else{
            entity.setReferenceNumber(formBean.getReferenceNumber());
        }

        entity.setCreatedDate(new Date());
        entity.setDocumentName(formBean.getDocumentName());
        entity.setOutboundStage(formBean.getOutboundStage());
        entity.setInboundStage(formBean.getInboundStage());
        /*entity.setDocumentType(formBean.getDocumentType());*/
        entity.setReferenceId(formBean.getReferenceId());
        entity.setReferenceTable(formBean.getReferenceTable());
        entity.setOrderNumber(formBean.getOrderNumber());
        entity.setDocumentStatus("ENTERED REFERENCE NUMBER");
        entity.setDocumentProcessed(0);
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setInboundReturned(formBean.getInboundReturned());
        entity.setDocumentComments(formBean.getDocumentComments());

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

    public String generateHouseWayBillDestinationReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try {
            // Create an output filename
            final File outputFile = new File("Way Bill Destination.pdf");
            // Generate the report
            MasterReport report = houseWayBillDestinationReportService.generateReport(params);

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

    public String generateAcceptanceReceiptReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try {
            // Create an output filename
            final File outputFile = new File("Acceptance Receipt.pdf");
            // Generate the report
            MasterReport report = acceptanceReceiptReportService.generateReport(params);

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
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();
//        	String orderId = "26";
//            String orderItemId = "1";
        	Map<String, String> params = new HashMap();
        	params.put("orderId", orderId);
//        	params.put("orderItemId", orderItemId);
        	
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

    public String generateAuthorizationToWithdrawReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try{
            // Create an output filename
            final File outputFile = new File("Authorization to Withdraw.pdf");
            // Generate the report
            MasterReport report = authorizationToWithdrawReportService.generateReport(params);

            HttpServletResponse response = ServletActionContext.getResponse();
            responseOut = new BufferedOutputStream(response.getOutputStream());
            byteArray = new ByteArrayOutputStream();

            boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
            byteArray.writeTo(responseOut);

            byteArray.close();
            responseOut.close();

        }catch (Exception re) {
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
        formBean.setOriginationPort(entity.getOriginationPort());
        formBean.setDestinationPort(entity.getDestinationPort());
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
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setDocumentStatus(entity.getDocumentStatus());
        formBean.setDocumentProcessed(entity.getDocumentProcessed());
        formBean.setReferenceNumber(entity.getReferenceNumber());
        formBean.setOutboundStage(entity.getOutboundStage());
        formBean.setInboundStage(entity.getInboundStage());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setInboundReturned(entity.getInboundReturned());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setDocumentComments(entity.getDocumentComments());
        formBean.setInboundReturned(entity.getInboundReturned());
        formBean.setDocumentComments(entity.getDocumentComments());
        formBean.setOrderItemId(entity.getOrderItemId());
        Integer orderItemIdPass; // Variable to store Order Item ID
        // Condition if order item id if null or not
        if(entity.getOrderItemId() != null){
            orderItemIdPass = entity.getOrderItemId();
        }else{
            orderItemIdPass = 0;
        }

        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemIdPass);

        // Per document the table will show appropriate data based on document name.
        if(entity.getDocumentName().equals("PROFORMA BILL OF LADING") || entity.getDocumentName().equals("MASTER BILL OF LADING")){
            // Vendor Code for Vessel Company will show based from voyage number information
            /*VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItemEntity.getVesselScheduleId());
            formBean.setVendorCode(vesselScheduleEntity.getVendorCode());*/
            // Search all order Items with the same order id
            List <OrderItems> orderItemsEntity = orderService.findAllItemByOrderId(entity.getReferenceId());

            for (OrderItems orderItemElem : orderItemsEntity) {

                Vendor vendorEntity = vendorService.findVendorByVendorCode(orderItemElem.getVendorSea());
                /*Vendor vendorEntity = vendorService.findVendorById(Integer.parseInt(orderItemElem.getVendorSea()));*/

                formBean.setVendorCode(vendorEntity.getVendorName());
            }

        }else if (entity.getDocumentName().equals("MASTER WAYBILL ORIGIN")){
            Vendor vendorEntity = vendorService.findVendorByVendorCode(orderItemEntity.getVendorOrigin());
            formBean.setVendorCode(vendorEntity.getVendorName());
        }else{
            formBean.setVendorCode("Ernest Logistics Corp.");
        }

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

    public String passDocuments(){

        System.out.println("-----------------------------------------------" + check);

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + document.getDocumentItem());

        for (int i =0; i<check.length; i++) {
            System.out.println("--------------------------------------" + check[i]);
        }


        return SUCCESS;
    }

    public String getResultAction(){
        return SUCCESS;
    }

    private String name;
    private String age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
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

    public void setAcceptanceReceiptReportService(AcceptanceReceiptReportService acceptanceReceiptReportService) {
        this.acceptanceReceiptReportService = acceptanceReceiptReportService;
    }

    public void setHouseWayBillDestinationReportService(HouseWayBillDestinationReportService houseWayBillDestinationReportService) {
        this.houseWayBillDestinationReportService = houseWayBillDestinationReportService;
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

    public void setAuthorizationToWithdrawReportService(AuthorizationToWithdrawReportService authorizationToWithdrawReportService) {
        this.authorizationToWithdrawReportService = authorizationToWithdrawReportService;
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

    public Integer getDocumentflag() {
        return documentflag;
    }

    public void setDocumentflag(Integer documentflag) {
        this.documentflag = documentflag;
    }

    public String getDocumentTab() {
        return documentTab;
    }

    public void setDocumentTab(String documentTab) {
        this.documentTab = documentTab;
    }

    public Integer getOutboundCount() {
        return outboundCount;
    }

    public void setOutboundCount(Integer outboundCount) {
        this.outboundCount = outboundCount;
    }

    public Integer getInboundCount() {
        return inboundCount;
    }

    public void setInboundCount(Integer inboundCount) {
        this.inboundCount = inboundCount;
    }

    public static Logger getLog() {
        return log;
    }

    public Integer getFinalOutboundCount() {
        return finalOutboundCount;
    }

    public void setFinalOutboundCount(Integer finalOutboundCount) {
        this.finalOutboundCount = finalOutboundCount;
    }

    public Integer getFinalInboundCount() {
        return finalInboundCount;
    }

    public void setFinalInboundCount(Integer finalInboundCount) {
        this.finalInboundCount = finalInboundCount;
    }

    public String[] getCheck() {
        return check;
    }

    public void setCheck(String[] check) {
        this.check = check;
    }

    public void setVesselSchedulesService(VesselSchedulesService vesselSchedulesService) {
        this.vesselSchedulesService = vesselSchedulesService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public List<DocumentsBean> getOutboundDocuments() {
        return outboundDocuments;
    }

    public void setOutboundDocuments(List<DocumentsBean> outboundDocuments) {
        this.outboundDocuments = outboundDocuments;
    }

    public List<OrderItemsBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItemsBean> orderItems) {
        this.orderItems = orderItems;
    }

    public List<DocumentsBean> getInboundDocuments() {
        return inboundDocuments;
    }

    public void setInboundDocuments(List<DocumentsBean> inboundDocuments) {
        this.inboundDocuments = inboundDocuments;
    }

    public List<DocumentsBean> getFinalOutboundDocuments() {
        return finalOutboundDocuments;
    }

    public void setFinalOutboundDocuments(List<DocumentsBean> finalOutboundDocuments) {
        this.finalOutboundDocuments = finalOutboundDocuments;
    }

    public List<DocumentsBean> getFinalInboundDocuments() {
        return finalInboundDocuments;
    }

    public void setFinalInboundDocuments(List<DocumentsBean> finalInboundDocuments) {
        this.finalInboundDocuments = finalInboundDocuments;
    }

    public String getDocumentTabInbound() {
        return documentTabInbound;
    }

    public void setDocumentTabInbound(String documentTabInbound) {
        this.documentTabInbound = documentTabInbound;
    }
}
