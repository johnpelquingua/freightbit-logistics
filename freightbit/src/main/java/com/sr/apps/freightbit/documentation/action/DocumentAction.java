package com.sr.apps.freightbit.documentation.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.documentation.formbean.DocumentsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.DocumentsConstants;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.*;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.common.service.ParameterService;
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
    private List<DocumentsBean> completeDocuments = new ArrayList<DocumentsBean>();
    private List<DocumentsBean> archiveDocuments = new ArrayList<DocumentsBean>();
    private List<DocumentsBean> billingDocuments = new ArrayList<DocumentsBean>();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private AddressBean address = new AddressBean();
    private DocumentsBean document = new DocumentsBean();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<Integer> documentQuantity = new ArrayList<Integer>();
    private List<Parameters> documentNames = new ArrayList<Parameters>();
//    private List<String> documentNameList = new ArrayList<String>();

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
    private ProformaBillOfLadingReportService proformaBillOfLadingReportService;
    private EquipmentInterchangeReceipt1ReportService equipmentInterchangeReceipt1ReportService;
    private EquipmentInterchangeReceipt2ReportService equipmentInterchangeReceipt2ReportService;
    private CustomerService customerService;
    private OrderService orderService;
    private ClientService clientService;
    private OperationsService operationsService;
    private ParameterService parameterService;
    private CommonUtils commonUtils = new CommonUtils();

    private Integer orderIdParam;
    private Integer documentIdParam;
    public String documentStageParam;
    public String vendorCodeParam;
    private InputStream inputStream;
    private long contentLength;
    private String fileName;
    private String orderId;
    private String containerId;
    private String bookingNumber;
    private Integer outboundCount;
    private Integer inboundCount;
    private Integer finalOutboundCount;
    private Integer finalInboundCount;
    private Integer completeCount;
    private Integer archiveCount;
    private Integer billingCount;

    private List<Documents> outboundEntityList = new ArrayList<Documents>();
    private List<Documents> inboundEntityList = new ArrayList<Documents>();
    private List<Documents> finalOutboundEntityList = new ArrayList<Documents>();
    private List<Documents> finalInboundEntityList = new ArrayList<Documents>();
    private List<Documents> completeEntityList = new ArrayList<Documents>();
    private List<Documents> archiveEntityList = new ArrayList<Documents>();
    private List<Documents> billingEntityList = new ArrayList<Documents>();

    private Integer documentflag;
    private String documentTab;
    private String documentTabInbound;
    private String documentTabFinalOutbound;
    private String documentTabFinalInbound;
    private String documentTabComplete;
    private String documentTabArchive;
    private String documentTabBilling;
    private String documentItem;
    private String[] check;
    private Date dateReturnedInbound; // variable to capture return date of inbound documents
    private Integer quantitySI_DR; // variable to capture quantity of sales invoice and delivery receipt documents
    private Date dateSentFinalOutbound; // variable to capture sent date of final outbound
    private String finalOutboundTrackingNumber; // variable to store tracking number of final outbound documents
    private Date dateReturnedFinalInbound; // variable to save date of documents returned for final inbound

    @Override
    public void prepare() throws Exception{
        documentQuantity = new ArrayList<Integer>();
        for (int i=1; i <=10; i++) {
            documentQuantity.add(i);
        }
    }

    public String viewArchivedDocuments() {

        List<Orders> orderEntityList = new ArrayList<Orders>();

        orderEntityList = documentsService.findAllOrdersDocumentation();

        for(Orders orderElem : orderEntityList){
            List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

            Integer checkDocs = 0; // loop will count for documents with complete status
            for (Documents documentElem : allDocs){

                if (documentElem.getDocumentStatus().equals("COMPLETED")){
                    checkDocs = checkDocs + 1;
                }

            }

            if(allDocs.size() == checkDocs && allDocs.size() > 1){ // documents that is equal to all completed documents will be added to the list
                orders.add(transformOrdersToFormBean(orderElem));
            }

        }

        return SUCCESS;
    }

    public String viewPendingDocuments() {

        List<Orders> orderEntityList = new ArrayList<Orders>();

        orderEntityList = documentsService.findAllOrdersDocumentation();

//        List<Orders> orderEntityDocumentCompleteList = new ArrayList<Orders>();

        for(Orders orderElem : orderEntityList){
            List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

            Integer checkDocs = 0; // loop will count for documents with complete status
            for (Documents documentElem : allDocs){

                if (documentElem.getDocumentStatus().equals("COMPLETED")){
                    checkDocs = checkDocs + 1;
                }

            }

            if(allDocs.size() != checkDocs ){ // documents that is not equal to all completed documents will be added to the list
                orders.add(transformOrdersToFormBean(orderElem));
            }

        }

//        for (Orders orderElem : orderEntityList) {
//            if(!orderElem.getOrderStatus().equals("SERVICE ACCOMPLISHED")){
//                orders.add(transformOrdersToFormBean(orderElem));
//            }
//        }

        return SUCCESS;
    }

    public String documentFlag(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        /*Document flag determines message */
        documentflag = (Integer) sessionAttributes.get("documentflag");
        if (documentflag == null) {
            clearErrorsAndMessages();
        } else if (documentflag == 1) {
            clearErrorsAndMessages();
            addActionMessage("Series Number must be entered");
        } else if (documentflag == 2) {
            clearErrorsAndMessages();
            addActionMessage("Entered series number successfully!");
        } else if (documentflag == 3) {
            clearErrorsAndMessages();
            addActionMessage("Document successfully updated!");
        } else if (documentflag == 4) {
            clearErrorsAndMessages();
            addActionMessage("Document(s) must be checked before processing");
        } else if(documentflag == 5) {
            clearErrorsAndMessages();
            addActionMessage("Document(s) checked!");
        } else if(documentflag == 6){
            clearErrorsAndMessages();
            addActionMessage("All Documents processed!");
        }else if(documentflag == 7){
            clearErrorsAndMessages();
            addActionMessage("No Documents checked");
        }else{
            clearErrorsAndMessages();
        }

        return SUCCESS;
    }

    /*OUTBOUND DOCUMENTS VIEW*/
    public String viewOrderDocuments() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        // Order ID param pass value
        if (orderIdParam == null) {
            orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber(); // for booking number information on breadcrumb
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
        /*COMPLETE DOCUMENTS LIST*/
        completeEntityList = documentsService.findDocumentByCompleteStageAndID(1, orderIdParam);
        /*COMPLETE DOCUMENTS LIST COUNT*/
        completeCount = completeEntityList.size();
        /*ARCHIVE DOCUMENTS LIST*/
        archiveEntityList = documentsService.findDocumentByArchiveStageAndID(1, orderIdParam);
        /*ARCHIVE DOCUMENTS LIST COUNT*/
        archiveCount = archiveEntityList.size();
        /*BILLING DOCUMENTS LIST*/
        billingEntityList = documentsService.findDocumentByBillingStageAndID(1, orderIdParam);
        /*BILLING DOCUMENTS LIST COUNT*/
        billingCount = billingEntityList.size();
        /*ALL DOCUMENTS LIST*/
        documentsList = documentsService.findDocumentsByOrderId(orderIdParam);

        List<String> documentListString = new ArrayList<String>();

        for (Documents documentAdd : documentsList ){
            documentListString.add(documentAdd.getDocumentName());
        }

        // checker for documents missing

        if(orderEntity.getServiceMode().equals("DOOR TO DOOR")){
            if(!documentListString.contains("BOOKING REQUEST FORM")){
                clearErrorsAndMessages();
                addActionMessage("BOOKING REQUEST FORM(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("PROFORMA BILL OF LADING")){
                clearErrorsAndMessages();
                addActionMessage("PROFORMA BILL OF LADING(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("HOUSE WAYBILL ORIGIN")){
                clearErrorsAndMessages();
                addActionMessage("HOUSE WAYBILL ORIGIN(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("HOUSE WAYBILL DESTINATION")){
                clearErrorsAndMessages();
                addActionMessage("HOUSE WAYBILL DESTINATION(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";
            }

        }else if(orderEntity.getServiceMode().equals("PIER TO DOOR")){
            if(!documentListString.contains("BOOKING REQUEST FORM")){
                clearErrorsAndMessages();
                addActionMessage("BOOKING REQUEST FORM(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("PROFORMA BILL OF LADING")){
                clearErrorsAndMessages();
                addActionMessage("PROFORMA BILL OF LADING(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("HOUSE WAYBILL DESTINATION")){
                clearErrorsAndMessages();
                addActionMessage("HOUSE WAYBILL DESTINATION(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";
            }

        }else if(orderEntity.getServiceMode().equals("DOOR TO PIER")){
            if(!documentListString.contains("BOOKING REQUEST FORM")){
                clearErrorsAndMessages();
                addActionMessage("BOOKING REQUEST FORM(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("PROFORMA BILL OF LADING")){
                clearErrorsAndMessages();
                addActionMessage("PROFORMA BILL OF LADING(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("HOUSE WAYBILL ORIGIN")){
                clearErrorsAndMessages();
                addActionMessage("HOUSE WAYBILL ORIGIN(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";
            }

        }else if(orderEntity.getServiceMode().equals("PIER TO PIER")){
            if(!documentListString.contains("BOOKING REQUEST FORM")){
                clearErrorsAndMessages();
                addActionMessage("BOOKING REQUEST FORM(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";

            }else if(!documentListString.contains("PROFORMA BILL OF LADING")){
                clearErrorsAndMessages();
                addActionMessage("PROFORMA BILL OF LADING(S) MISSING!");
                documentTab = "OUTBOUND_MISSING";
            }
        }

        // checker for documents missing
        // System will check if service type required document is created
        if(orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("SHIPPING")) {

            for (OrderItems orderItemCheck : orderItemEntityList) { // check order items under the booking number

                /*for (Documents documentCheck : documentsList) { // will check all documents inside outbound stage

                    if (documentCheck.getVendorCode() != null && !documentCheck.getDocumentName().equals("BOOKING REQUEST FORM") || documentCheck.getVendorCode() != null && !documentCheck.getDocumentName().equals("HOUSE BILL OF LADING")) { // will check if there are vendor codes
                        // Will check if any documents assigned to the shipping vendor
                        if (documentCheck.getDocumentName().equals("PROFORMA BILL OF LADING")) {
                            if (!documentCheck.getVendorCode().equals(orderItemCheck.getVendorSea())) {
                                clearErrorsAndMessages();
                                addActionMessage("PROFORMA BILL OF LADING(S) MISSING!");
                                documentTab = "OUTBOUND_MISSING";
                            }
                            if (documentCheck.getVendorCode() != null) {
                                if (!documentCheck.getVendorCode().equals(orderItemCheck.getVendorSea())) {
                                    clearErrorsAndMessages();
                                    addActionMessage("PROFORMA BILL OF LADING NOT YET CREATED!");
                                    documentTab = "OUTBOUND_MISSING";
                                    break;
                                }
                            }
                        } else if (orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER")) {
                            // will check if any documents assigned to the origin vendor

                            if (documentCheck.getDocumentName().equals("HOUSE WAYBILL ORIGIN")) {

                                if (documentCheck.getVendorCode() != null) {
                                    if (!documentCheck.getVendorCode().equals(orderItemCheck.getVendorOrigin())) {
                                        clearErrorsAndMessages();
                                        addActionMessage("HOUSE WAYBILL(S) ORIGIN MISSING!");
                                        documentTab = "OUTBOUND_MISSING";
                                        break;
                                    }
                                }

                            }

                        } else if (orderEntity.getServiceMode().equals("PIER TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO DOOR")) {
                            // will check if any documents assigned to the destination vendor
                            if (documentCheck.getDocumentName().equals("HOUSE WAYBILL DESTINATION")) {

                                if (documentCheck.getVendorCode() != null) {
                                    if (!documentCheck.getVendorCode().equals(orderItemCheck.getVendorDestination())) {
                                        clearErrorsAndMessages();
                                        addActionMessage("HOUSE WAYBILL(S) DESTINATION MISSING!");
                                        documentTab = "OUTBOUND_MISSING";
                                        break;
                                    }
                                }

                            }

                        }

                    }

                }*/

            }

            List<String> vendorSea = new ArrayList<String>();
            List<String> vendorOrigin = new ArrayList<String>();
            List<String> vendorDestination = new ArrayList<String>();
            Integer vendorSeaCount = 0;
            Integer vendorOriginCount = 0;
            Integer vendorDestinationCount = 0;
            List<Documents> documentProformaEntity = documentsService.findDocumentNameAndId("PROFORMA BILL OF LADING",orderEntity.getOrderId());
            List<Documents> documentWaybillOriginEntity = documentsService.findDocumentNameAndId("HOUSE WAYBILL ORIGIN",orderEntity.getOrderId());
            List<Documents> documentWaybillDestinationEntity = documentsService.findDocumentNameAndId("HOUSE WAYBILL DESTINATION",orderEntity.getOrderId());

            // Shipping vendors set will be stored in VendorSea variable
            for (OrderItems everyItem : orderItemEntityList) {
                if (vendorSea.isEmpty()) {
                    vendorSea.add(everyItem.getVendorSea());
                    vendorSeaCount = vendorSeaCount + 1;
                } else {
                    if (!vendorSea.contains(everyItem.getVendorSea())) {
                        vendorSea.add(everyItem.getVendorSea());
                        vendorSeaCount = vendorSeaCount + 1;
                    }
                }
            }

            // Origin vendors set will be stored in VendorOrigin Variable
            for (OrderItems everyItem : orderItemEntityList) {
                if (vendorOrigin.isEmpty()) {
                    vendorOrigin.add(everyItem.getVendorOrigin());
                    vendorOriginCount = vendorOriginCount + 1;
                } else {
                    if (!vendorOrigin.contains(everyItem.getVendorOrigin())) {
                        vendorOrigin.add(everyItem.getVendorOrigin());
                        vendorOriginCount = vendorOriginCount + 1;
                    }
                }
            }

            // Destination vendors set will be stored in VendorDestination Variable
            for (OrderItems everyItem : orderItemEntityList) {
                if (vendorDestination.isEmpty()) {
                    vendorDestination.add(everyItem.getVendorDestination());
                    vendorDestinationCount = vendorDestinationCount + 1;
                } else {
                    if (!vendorDestination.contains(everyItem.getVendorDestination())) {
                        vendorDestination.add(everyItem.getVendorDestination());
                        vendorDestinationCount = vendorDestinationCount + 1;
                    }
                }
            }

            // To count for shipping vendors and proforma bill of lading equivalent
            if(vendorSeaCount != documentProformaEntity.size()) {
                clearErrorsAndMessages();
                addActionMessage("PROFORMA BILL OF LADING NOT YET CREATED!");
                documentTab = "OUTBOUND_MISSING";
            }
            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER")) {
                // To count for origin vendors and house waybill origin equivalent
                if(vendorOriginCount != documentWaybillOriginEntity.size()){
                    clearErrorsAndMessages();
                    addActionMessage("HOUSE WAYBILL(S) ORIGIN MISSING!");
                    documentTab = "OUTBOUND_MISSING";
                }
            }
            if(orderEntity.getServiceMode().equals("PIER TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO DOOR")) {
                // To count for origin vendors and house waybill origin equivalent
                if (vendorDestinationCount != documentWaybillDestinationEntity.size()) {
                    clearErrorsAndMessages();
                    addActionMessage("HOUSE WAYBILL(S) DESTINATION MISSING!");
                    documentTab = "OUTBOUND_MISSING";
                }
            }
        }

        /*OUTBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : outboundEntityList) {
                outboundDocuments.add(transformDocumentsToFormBean(documentElem));
            }
        /*INBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : inboundEntityList) {
                inboundDocuments.add(transformDocumentsToFormBean(documentElem));

//                dateReturnedInbound = documentElem.getInboundReturned(); // to show the date on form when the inbound documents returned
            }
        /*FINAL OUTBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : finalOutboundEntityList) {
                finalOutboundDocuments.add(transformDocumentsToFormBean(documentElem));

//                dateSentFinalOutbound = documentElem.getFinalOutboundSent(); // to show when was the date sent for final outbound
//                finalOutboundTrackingNumber = documentElem.getFinalOutboundLbc(); // to show the tracking number of the
            }
        /*FINAL INBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : finalInboundEntityList) {
                finalInboundDocuments.add(transformDocumentsToFormBean(documentElem));

//                dateReturnedFinalInbound = documentElem.getFinalInboundReturned();
            }
        /*COMPLETE DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : completeEntityList) {
                completeDocuments.add(transformDocumentsToFormBean(documentElem));
            }
        /*ARCHIVE DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : archiveEntityList) {
                archiveDocuments.add(transformDocumentsToFormBean(documentElem));
            }
        /*BILLING DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : finalInboundEntityList) {
                billingDocuments.add(transformDocumentsToFormBean(documentElem));
            }

            //DOCUMENT TAB OUTBOUND VALUE BEGIN================================================================================================================

            if (sessionAttributes.get("documentTab") == null || "".equals(sessionAttributes.get("documentTab"))) {
                // Loop will count for documents already processed
                Integer checkDocs = 0;

                for (Documents documentElem : outboundEntityList) {

                    if (documentElem.getDocumentProcessed() >= 1 && documentElem.getOutboundStage() == 1) {
                        checkDocs = checkDocs + 1; // function will count checkDocs for document processed value greater than or equal to 1
                    }
                }

                // Loop will count for document type outbound
                /*Integer checkTypeOutbound = 0;

                for (Documents documentElem : outboundEntityList) {

                    if (documentElem.getDocumentProcessed() >= 1 && documentElem.getOutboundStage() == 1 ) {
                        checkTypeOutbound = checkTypeOutbound + 1; // function will count checkDocs for document processed value greater than or equal to 1
                    }

                }*/
                    // Checked documents must be equal to total documents before being processed
                if (documentTab == null || "".equals(documentTab)) {
//                    if (outboundCount == 0) {
//                        documentTab = "NO_OUTBOUND_DOCUMENTS";
//                    } else if (outboundCount != checkDocs) {
//                        documentTab = "OUTBOUND_STAGE";
//                    } /*else if (checkDocs != checkTypeOutbound) { // total outbound documents versus processed outbound documents
//                        documentTab = "OUTBOUND_STAGE_PENDING"; // not equals will yield incomplete outbound stage
//                    }*/ else {
//                        documentTab = "OUTBOUND_COMPLETE"; // equal mean completed outbound stage
//                    }
                    if (outboundCount > 0){
                        documentTab = "OUTBOUND_READY";
                    }else{
                        documentTab = "OUTBOUND_PENDING";
                    }
                }
            } else {
                documentTab = sessionAttributes.get("documentTab").toString(); // will get a difference document tab value from another method
            }

            //DOCUMENT TAB OUTBOUND VALUE END================================================================================================================

            //DOCUMENT TAB INBOUND VALUE BEGIN================================================================================================================

            if (sessionAttributes.get("documentTabInbound") == null) {
                // Loop will count for documents already processed for outbound stage
                Integer checkDocs = 0;

                for (Documents documentElem : outboundEntityList) {

                    if (documentElem.getDocumentProcessed() >= 1) { // function will count checkDocs for document processed value greater than or equal to 1
                        checkDocs = checkDocs + 1;
                    }
                }

                // check for documents that has values for inbound returned date
                Integer checkReturnedInboundDateDocs = 0;

                for (Documents documentElem : inboundEntityList) {
                    if (documentElem.getInboundReturned() != null) {
                        checkReturnedInboundDateDocs = checkReturnedInboundDateDocs + 1; // checkReturnedInboundDateDocs will increment for documents that has inbound returned date.
                    }
                }

                Integer checkDocsInbound = 0;

                for (Documents documentElem : inboundEntityList) {

                    if (documentElem.getDocumentProcessed() >= 2) {
                        checkDocsInbound = checkDocsInbound + 1; // loop will count for total inbound documents under the same booking
                    }
                }

//                System.out.println("OUTBOUND DOCUMENTS COUNT " + outboundCount);
//                System.out.println("PROCESSED DOCUMENTS IN OUTBOUND STAGE " + checkDocs);
//                System.out.println("INBOUND DOCUMENT COUNT " + inboundCount);
//                System.out.println("INBOUND DOCUMENTS WITH RETURNED DATES " + checkReturnedInboundDateDocs);
//                System.out.println("PROCESSED DOCUMENTS IN INBOUND STAGE " + checkDocsInbound);

                // Checked documents must be equal to total documents before being processed for outbound stage
//                if (outboundCount != checkDocs) {
//                    documentTabInbound = "OUTBOUND_DOCUMENTS_INCOMPLETE";
//                } else if (inboundCount != checkReturnedInboundDateDocs) {
//                    documentTabInbound = "NO_INBOUND_DATE";
//                } else if (inboundCount != checkDocsInbound) {
//                    documentTabInbound = "INBOUND_STAGE";
//                } else if (inboundCount == 0) {
//                    documentTabInbound = "NO_INBOUND_DOCUMENTS";
//                } else if (inboundCount == checkReturnedInboundDateDocs && inboundCount == checkDocsInbound) {
//                    documentTabInbound = "INBOUND_COMPLETE";
//                }
                if(inboundCount > 0){
                    documentTabInbound = "INBOUND_READY";
                }else{
                    documentTabInbound = "INBOUND_PENDING";
                }

            } else {
                documentTabInbound = sessionAttributes.get("documentTabInbound").toString();
            }

            //DOCUMENT TAB INBOUND VALUE END================================================================================================================

            //DOCUMENT TAB FINAL OUTBOUND VALUE BEGIN================================================================================================================

            if (sessionAttributes.get("documentTabFinalOutbound") == null) {
                // Loop will count for documents already processed for inbound stage
                Integer checkDocsInbound = 0;

                for (Documents documentElem : finalOutboundEntityList) {

                    if (documentElem.getDocumentProcessed() >= 2) {
                        checkDocsInbound = checkDocsInbound + 1;
                    }
                }

                // Loop will count for documents already processed for final outbound stage
                Integer checkDocsFinalOut = 0;

                for (Documents documentElem : finalOutboundEntityList) {
                    if (documentElem.getDocumentProcessed() >= 3) {
                        checkDocsFinalOut = checkDocsFinalOut + 1;
                    }
                }
                // count final inbound documents with zero values
                List<Documents> finalInboundCheck = documentsService.findDocumentByFinalInboundStageAndID(0, orderIdParam);

                // Loop will count for documents with both date sent and tracking number
                Integer checkDocsFinalOutSent = 0;

                for (Documents documentElem : finalOutboundEntityList) {
                    if (documentElem.getFinalOutboundSent() != null && documentElem.getFinalOutboundLbc() != null) {
                        checkDocsFinalOutSent = checkDocsFinalOutSent + 1;
                    }
                }

//                System.out.println("PROCESSED DOCUMENTS IN INBOUND STAGE " + checkDocsInbound);
//                System.out.println("FINAL OUTBOUND DOCUMENTS COUNT " + finalOutboundCount);
//                System.out.println("PROCESSED DOCUMENTS IN FINAL OUTBOUND STAGE " + checkDocsFinalOut);
//                System.out.println("FINAL OUTBOUND STAGE SENT " + checkDocsFinalOutSent);

//                if (finalOutboundCount == 0) {
//                    documentTabFinalOutbound = "NO_FINAL_OUTBOUND_DOCUMENTS";
//                } /*else if (finalInboundCheck.size() != checkDocsFinalOut) {
//                    documentTabFinalOutbound = "FINAL_OUTBOUND_PENDING";
//                }*/ else if (checkDocsFinalOut == checkDocsFinalOutSent && checkDocsFinalOut != 0) {
//                    documentTabFinalOutbound = "FINAL_OUTBOUND_SENT";
//                } else if (finalOutboundCount == checkDocsFinalOut) {
//                    documentTabFinalOutbound = "FINAL_OUTBOUND_COMPLETE";
//                } else {
//                    documentTabFinalOutbound = "FINAL_OUTBOUND_STAGE";
//                }
                if(finalOutboundCount > 0){
                    documentTabFinalOutbound = "FINAL_OUTBOUND_READY";
                }else{
                    documentTabFinalOutbound = "FINAL_OUTBOUND_PENDING";
                }

            } else {
                documentTabFinalOutbound = sessionAttributes.get("documentTabFinalOutbound").toString();
            }

            //DOCUMENT TAB FINAL OUTBOUND VALUE END================================================================================================================

            //DOCUMENT TAB FINAL INBOUND VALUE BEGIN================================================================================================================

            Integer checkDocsFinalIn = 0; // Loop will count for final inbound documents with returned date and status of 4

            for (Documents documentElem : finalInboundEntityList) {
                if (documentElem.getDocumentProcessed() >= 4 && documentElem.getFinalInboundReturned() != null) {
                    checkDocsFinalIn = checkDocsFinalIn + 1;
                }
            }

            if (sessionAttributes.get("documentTabFinalInbound") == null) {

//                if (finalInboundCount == 0) {
//                    documentTabFinalInbound = "NO_FINAL_INBOUND_DOCUMENTS";
//                } else if (finalInboundCount == checkDocsFinalIn) {
//                    documentTabFinalInbound = "FINAL_INBOUND_COMPLETE";
//                } else {
//                    documentTabFinalInbound = "FINAL_INBOUND_STAGE";
//                }

                if(finalInboundCount > 0){
                    documentTabFinalInbound = "FINAL_INBOUND_READY";
                }else{
                    documentTabFinalInbound = "FINAL_INBOUND_PENDING";
                }

            } else {
                documentTabFinalInbound = sessionAttributes.get("documentTabFinalInbound").toString();
            }

//            System.out.println("FINAL INBOUND DOCUMENTS COUNT " + finalInboundCount);
//            System.out.println("PROCESSED DOCUMENTS IN FINAL INBOUND STAGE " + checkDocsFinalIn);

            //DOCUMENT TAB FINAL INBOUND VALUE END================================================================================================================

            //DOCUMENT TAB COMPLETE VALUE BEGIN====================================================================================================================

            Integer checkDocsComplete = 0;

            for (Documents documentElem : completeEntityList) {
                if (documentElem.getDocumentProcessed() >= 5) {
                    checkDocsComplete = checkDocsComplete + 1;
                }
            }

            if (sessionAttributes.get("documentTabComplete") == null) {

                /*if (completeCount == 0) {
                    documentTabComplete = "NO_COMPLETE_DOCUMENTS";
                } else if (documentsList.size() == completeEntityList.size() && documentsList.size() != checkDocsComplete) {
                    documentTabComplete = "COMPLETE_STAGE";
                } else if (documentsList.size() == checkDocsComplete) {
                    documentTabComplete = "ALL_DOCUMENTS_COMPLETE";
                } else {
                    documentTabComplete = "COMPLETE_STAGE_INACTIVE";
                }*/
                if(documentsList.size() == checkDocsComplete && completeCount > 0) {
                    documentTabComplete = "ARCHIVE_PENDING";
                } else if(completeCount > 0){
                    documentTabComplete = "COMPLETE_READY";
                }else{
                    documentTabComplete = "COMPLETE_PENDING";
                }

            } else {
                documentTabComplete = sessionAttributes.get("documentTabComplete").toString();
            }

//            System.out.println("COMPLETE DOCUMENTS COUNT " + completeCount);
//            System.out.println("PROCESSED DOCUMENTS IN COMPLETE STAGE " + checkDocsComplete);
//            System.out.println("ALL DOCUMENTS COUNT " + documentsList.size());

            //DOCUMENT TAB COMPLETE VALUE END======================================================================================================================

            //DOCUMENT TAB ARCHIVE VALUE BEGIN====================================================================================================================

//            Integer checkDocsArchive = 0; // Loop will count for archive documents with returned date and status of 5
//
//            for (Documents documentElem : archiveEntityList) {
//                if (documentElem.getDocumentProcessed() >= 5) {
//                    checkDocsArchive = checkDocsArchive + 1;
//                }
//            }
//
//            if (sessionAttributes.get("documentTabArchive") == null) {
//
//                if (archiveCount == 0) {
//                    documentTabArchive = "NO_ARCHIVE_DOCUMENTS";
//                } else if (archiveCount == checkDocsArchive) {
//                    documentTabArchive = "ARCHIVE_COMPLETE";
//                } else {
//                    documentTabArchive = "ARCHIVE";
//                }
//
//            } else {
//                documentTabArchive = sessionAttributes.get("documentTabArchive").toString();
//            }

            //DOCUMENT TAB ARCHIVE VALUE END======================================================================================================================

        System.out.println(">>>>>>>>>>>>>>>>>>>>>> OUTBOUND " + documentTab);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>> INBOUND " + documentTabInbound);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>> FINAL OUTBOUND " + documentTabFinalOutbound);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>> FINAL INBOUND " + documentTabFinalInbound);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>> COMPLETE " + documentTabComplete);

            sessionAttributes.put("orderIdParam", orderIdParam);

            if (sessionAttributes.get("documentflag") != null) {
                sessionAttributes.put("documentflag", sessionAttributes.get("documentflag")); // get session document flag
                documentFlag(); // document flag method
            }

            documentflag = 0; // resets document flagORDER

            return SUCCESS;
    }

    public String viewOrderDocumentsArchived(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        // Order ID param pass value
        if (orderIdParam == null) {
            orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber(); // for booking number information on breadcrumb
        order = transformToOrderFormBean(orderEntity);

        // Display Order items under documents view page
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        /*ARCHIVE DOCUMENTS LIST*/
        archiveEntityList = documentsService.findDocumentByArchiveStageAndID(1, orderIdParam);
        /*ARCHIVE DOCUMENTS LIST COUNT*/
        archiveCount = archiveEntityList.size();

        /*ARCHIVE DOCUMENTS TABLE VIEW*/
        for (Documents documentElem : archiveEntityList) {
            archiveDocuments.add(transformDocumentsToFormBean(documentElem));
        }

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
        if(orderItem.getVendorSea() != null && !"".equals(orderItem.getVendorSea()) && !orderItem.getVendorSea().equals("NONE")){
            Vendor seaVendor = vendorService.findVendorByVendorCode(orderItem.getVendorSea());
            orderItemBean.setVendorSea(seaVendor.getVendorName());
        }else{
            orderItemBean.setVendorSea("NONE");
        }

        // To fetch origin vendor name from vendor ID
        if(orderItem.getVendorOrigin() != null && !"".equals(orderItem.getVendorOrigin()) && !orderItem.getVendorOrigin().equals("NONE")){
            Vendor originVendor = vendorService.findVendorByVendorCode(orderItem.getVendorOrigin());
            orderItemBean.setVendorOrigin(originVendor.getVendorName());
        }else{
            orderItemBean.setVendorOrigin("NONE");
        }

        // To fetch destination vendor name from vendor ID
        if(orderItem.getVendorDestination() != null && !"".equals(orderItem.getVendorDestination()) && !orderItem.getVendorDestination().equals("NONE")){
            Vendor destinationVendor = vendorService.findVendorByVendorCode(orderItem.getVendorDestination());
            orderItemBean.setVendorDestination(destinationVendor.getVendorName());
        }else{
            orderItemBean.setVendorDestination("NONE");
        }

        return orderItemBean;
    }

    // Process Documents on Outbound Stage
    public String processDocuments(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println(".............................CHECK WORD PASS " + check);

        System.out.println(".............................DOCUMENT ITEM " + document.getDocumentItem());

        System.out.println(".............................ORDER ID PARAM " + orderIdParam);

        System.out.println(".............................ORDER ID SESSION " + (Integer)sessionAttributes.get("orderIdParam"));

        if (check != null) { // Check has value

            if(document.getDocumentItem().equals("check")) { // if word passed is equals to check

                for (int i = 0; i < check.length; i++) { // loop of how many values in check

                    if(check[i].equals("false") || check[i].equals(null)|| "".equals(check[i])){ // catches error when no values inside check
                        sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }
                    // will execute if document item is equals to check
                    Integer documentId = Integer.parseInt(check[i]);

                    Documents documentIdEntity = documentsService.findDocumentById(documentId);
                    // Will trigger if Proforma Bill of Lading does not have a Reference Number
                    if (documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && documentIdEntity.getReferenceNumber() == null || "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getReferenceNumber() == null ) {
                        documentIdEntity.setDocumentStatus("NO SERIES NUMBER");
                        /*documentIdEntity.setDocumentProcessed(0);*/
                        /*Pass flag to view order documents*/
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    // Will trigger if Proforma Bill of Lading has a Reference Number
                    } else if (documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && documentIdEntity.getReferenceNumber() != null) {
                        documentIdEntity.setDocumentStatus("ENTERED SERIES NUMBER");
                        documentIdEntity.setDocumentProcessed(4);
                        documentIdEntity.setCompleteStage(1);
                        /*documentIdEntity.setArchiveStage(0);*/
                        /*Pass flag to view order documents*/
                        documentflag = 2; // shows reference number entered successfully
                        sessionAttributes.put("documentflag", documentflag);
                    } else {
                        documentIdEntity.setDocumentStatus("INBOUND");
                        documentIdEntity.setInboundStage(1);
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
                documentflag = 4; // all documents must be checked before processing
                sessionAttributes.put("documentflag", documentflag);
                return INPUT;
        }

        return SUCCESS;
    }

    public String processDocumentsInbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("CHECK WORD PASS " + check);

        System.out.println("DOCUMENT ITEM " + document.getDocumentItem());

        System.out.println("ORDER ID " + orderIdParam);

        if (check != null) {

            if(document.getDocumentItem().equals("check")) {

                for (int i = 0; i < check.length; i++) {
                    // if no checkbox are selected
                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){
                        sessionAttributes.put("orderIdParam", orderIdParam );
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentId = Integer.parseInt(check[i]);

                    Documents documentIdEntity = documentsService.findDocumentById(documentId);

                    Orders orderEntity = orderService.findOrdersById(orderIdParam);

                    if (documentIdEntity.getDocumentName().equals("BOOKING REQUEST FORM") || documentIdEntity.getDocumentName().equals("HOUSE WAYBILL ORIGIN") || documentIdEntity.getDocumentName().equals("ACCEPTANCE RECEIPT")){
                        documentIdEntity.setDocumentProcessed(4);
                        documentIdEntity.setCompleteStage(1);
                        documentIdEntity.setDocumentStatus("RECEIVED WITH SIGNATURE");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("HOUSE BILL OF LADING")){
                        if(orderEntity.getServiceMode().equals("PIER TO PIER")){
                            documentIdEntity.setDocumentProcessed(4);
                            documentIdEntity.setCompleteStage(1);
                        }else{
                            documentIdEntity.setDocumentProcessed(2);
                            documentIdEntity.setFinalOutboundStage(1);
                        }
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") && documentIdEntity.getReferenceNumber() == null){
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN")){
                        documentIdEntity.setDocumentProcessed(4);
                        documentIdEntity.setCompleteStage(1);
                        documentIdEntity.setDocumentStatus("RECEIVED");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING") && documentIdEntity.getReferenceNumber() == null){
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING")){
                        if(orderEntity.getServiceMode().equals("PIER TO PIER")){
                            documentIdEntity.setDocumentProcessed(4);
                            documentIdEntity.setCompleteStage(1);
                        }else{
                            documentIdEntity.setDocumentProcessed(2);
                            documentIdEntity.setFinalOutboundStage(1);
                        }
                        documentIdEntity.setDocumentStatus("RECEIVED");
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("SALES INVOICE") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("SALES INVOICE") && documentIdEntity.getReferenceNumber() == null || documentIdEntity.getDocumentName().equals("DELIVERY RECEIPT") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("DELIVERY RECEIPT") && documentIdEntity.getReferenceNumber() == null){
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else {
                        if(orderEntity.getServiceMode().equals("PIER TO PIER") || orderEntity.getServiceType().equals("TRUCKING")){
                            documentIdEntity.setDocumentProcessed(4);
                            documentIdEntity.setCompleteStage(1);
                        }else{
                            documentIdEntity.setDocumentProcessed(2);
                            documentIdEntity.setFinalOutboundStage(1);
                        }
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
            sessionAttributes.put("orderIdParam", orderIdParam);
            documentflag = 4; // all documents must be checked before processing
            sessionAttributes.put("documentflag", documentflag);
            return INPUT;
        }

        return SUCCESS;
    }

    public String processDocumentsFinalOutbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("CHECK WORD PASS " + check);

        System.out.println("DOCUMENT ITEM " + document.getDocumentItem());

        System.out.println("ORDER ID " + orderIdParam);

        if (check != null) {

            if(document.getDocumentItem().equals("check")) {

                for (int i = 0; i < check.length; i++) {
                    // if no checkbox are selected
                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentId = Integer.parseInt(check[i]);

                    Documents documentIdEntity = documentsService.findDocumentById(documentId);

                    if(documentIdEntity.getDocumentName().equals("HOUSE BILL OF LADING") || documentIdEntity.getDocumentName().equals("ACCEPTANCE RECEIPT") || documentIdEntity.getDocumentName().equals("RELEASE ORDER") ){
                        documentIdEntity.setDocumentProcessed(3);
                        documentIdEntity.setFinalInboundStage(1);
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING") && documentIdEntity.getReferenceNumber() == null || documentIdEntity.getDocumentName().equals("HOUSE WAYBILL DESTINATION") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("HOUSE WAYBILL DESTINATION") && documentIdEntity.getReferenceNumber() == null){
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("MASTER BILL OF LADING")){
                        documentIdEntity.setDocumentProcessed(3);
                        documentIdEntity.setFinalInboundStage(1);
                        /*Pass flag to view order documents*/
                        documentflag = 5; // shows document check message
                        sessionAttributes.put("documentflag", documentflag);
                    }else if(documentIdEntity.getDocumentName().equals("SALES INVOICE") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("SALES INVOICE") && documentIdEntity.getReferenceNumber() == null || documentIdEntity.getDocumentName().equals("DELIVERY RECEIPT") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("DELIVERY RECEIPT") && documentIdEntity.getReferenceNumber() == null){
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else {
                        documentIdEntity.setDocumentProcessed(3);
                        documentIdEntity.setFinalInboundStage(1);
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
            sessionAttributes.put("orderIdParam", orderIdParam);
            documentflag = 4; // all documents must be checked before processing
            sessionAttributes.put("documentflag", documentflag);
            return INPUT;
        }

        return SUCCESS;
    }

    public String processDocumentsFinalInbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiCHECK WORD PASS " + check);

        System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiDOCUMENT ITEM " + document.getDocumentItem());

        System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiORDER ID " + orderIdParam);

        if (check != null) {

            if(document.getDocumentItem().equals("check")) {

                for (int i = 0; i < check.length; i++) {
                    // if no checkbox are selected
                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentId = Integer.parseInt(check[i]);

                    Documents documentIdEntity = documentsService.findDocumentById(documentId);

                    if("".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getReferenceNumber() == null ){
                        documentIdEntity.setDocumentStatus("INPUT SERIES NUMBER");
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    }else{
                        documentIdEntity.setDocumentProcessed(4);
                        documentIdEntity.setCompleteStage(1);
                        documentIdEntity.setDocumentStatus("Checked!");
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
            sessionAttributes.put("orderIdParam", orderIdParam);
            documentflag = 4; // all documents must be checked before processing
            sessionAttributes.put("documentflag", documentflag);
            return INPUT;
        }

        return SUCCESS;
    }

    public String processDocumentsComplete() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiCHECK WORD PASS " + check);

        System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiDOCUMENT ITEM " + document.getDocumentItem());

        System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiORDER ID " + orderIdParam);

        if (check != null) {

            if(document.getDocumentItem().equals("check")) {

                for (int i = 0; i < check.length; i++) {
                    // if no checkbox are selected
                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentId = Integer.parseInt(check[i]);

                    Documents documentIdEntity = documentsService.findDocumentById(documentId);

                    documentIdEntity.setDocumentProcessed(5);
                    /*Pass flag to view order documents*/
                    documentflag = 5; // shows document check message
                    sessionAttributes.put("documentflag", documentflag);

                    // update each document
                    documentsService.updateDocument(documentIdEntity);
                    // session pass order id
                    sessionAttributes.put("orderIdParam", documentIdEntity.getReferenceId());

                }
            }

        }else{
            sessionAttributes.put("orderIdParam", orderIdParam);
            documentflag = 4; // all documents must be checked before processing
            sessionAttributes.put("documentflag", documentflag);
            return INPUT;
        }

        return SUCCESS;
    }

    public String checkDocument() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if ("".equals(documentEntity.getReferenceNumber()) || documentEntity.getReferenceNumber() == null) {
            /*documentEntity.setDocumentStatus("INPUT SERIES NUMBER");*/
            documentflag = 1; // Series number must be entered error
            sessionAttributes.put("documentflag", documentflag);
        }else {
            documentEntity.setInboundStage(1);
            documentEntity.setDocumentProcessed(1);
            documentEntity.setDocumentStatus("INBOUND");
            documentflag = 5; // document checked
            sessionAttributes.put("documentflag", documentflag);
        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String checkDocumentInbound() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if ("".equals(documentEntity.getReferenceNumber()) || documentEntity.getReferenceNumber() == null ) {
            /*documentEntity.setDocumentStatus("INPUT SERIES NUMBER");*/
            documentflag = 1; // Series number must be entered error
            sessionAttributes.put("documentflag", documentflag);
        }else {
            documentEntity.setFinalOutboundStage(1);
            documentEntity.setDocumentProcessed(2);
            documentEntity.setDocumentStatus("FINAL OUTBOUND");
            documentflag = 5; // document checked
            sessionAttributes.put("documentflag", documentflag);
        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String checkDocumentFinalOutbound() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if ("".equals(documentEntity.getReferenceNumber()) || documentEntity.getReferenceNumber() == null ) {
//            documentEntity.setDocumentStatus("INPUT SERIES NUMBER");
            documentflag = 1; // Series number must be entered error
            sessionAttributes.put("documentflag", documentflag);
        }else {
            documentEntity.setFinalInboundStage(1);
            documentEntity.setDocumentProcessed(3);
            documentEntity.setDocumentStatus("FINAL INBOUND");
            documentflag = 5; // document checked
            sessionAttributes.put("documentflag", documentflag);
        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String checkDocumentFinalInbound() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if ("".equals(documentEntity.getReferenceNumber()) || documentEntity.getReferenceNumber() == null ) {
//            documentEntity.setDocumentStatus("INPUT SERIES NUMBER");
            documentflag = 1; // Series number must be entered error
            sessionAttributes.put("documentflag", documentflag);
        }else {
            documentEntity.setCompleteStage(1);
            documentEntity.setDocumentProcessed(4);
            documentEntity.setDocumentStatus("RECEIVED");
            documentflag = 5; // document checked
            sessionAttributes.put("documentflag", documentflag);
        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String checkDocumentComplete() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);

        if ("".equals(documentEntity.getReferenceNumber()) || documentEntity.getReferenceNumber() == null ) {
//            documentEntity.setDocumentStatus("INPUT SERIES NUMBER");
            documentflag = 1; // Series number must be entered error
            sessionAttributes.put("documentflag", documentflag);
        }else {
            documentEntity.setCompleteStage(1);
            documentEntity.setDocumentProcessed(5);
            documentEntity.setDocumentStatus("COMPLETED");
            documentflag = 5; // document checked
            sessionAttributes.put("documentflag", documentflag);
        }

        documentsService.updateDocument(documentEntity);

        sessionAttributes.put("orderIdParam", documentEntity.getReferenceId());

        return SUCCESS;
    }

    public String completeDocuments() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        List <Documents> outboundDocumentsList = documentsService.findDocumentByOutboundStageAndID(1, orderIdParam);

        for(Documents documentElem : outboundDocumentsList) {
            if(documentElem.getDocumentProcessed() > 0) {
                if (documentElem.getDocumentName().equals("BOOKING REQUEST FORM") || documentElem.getDocumentName().equals("HOUSE WAYBILL ORIGIN") || documentElem.getDocumentName().equals("HOUSE BILL OF LADING")) {
                    documentElem.setDocumentStatus("OUTBOUND COMPLETE");
                    documentElem.setInboundStage(0);
                } else {
                    documentElem.setDocumentStatus("FROM OUTBOUND");
                    documentElem.setCompleteStage(1);
                }
            }else{
                documentElem.setDocumentStatus("FROM OUTBOUND");
                documentElem.setOutboundStage(0);
                documentElem.setCompleteStage(1);
            }

            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String completeDocumentsInbound() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        List <Documents> inboundDocumentsList = documentsService.findDocumentByInboundStageAndID(1, orderIdParam);

        for(Documents documentElem : inboundDocumentsList) {
            if(documentElem.getDocumentProcessed() > 1) {
                if (documentElem.getDocumentName().equals("SALES INVOICE") || documentElem.getDocumentName().equals("MASTER BILL OF LADING") ) {
                    documentElem.setDocumentStatus("INBOUND COMPLETE");
                    documentElem.setFinalOutboundStage(0);
                } else {
                    documentElem.setDocumentStatus("FROM INBOUND");
                    documentElem.setCompleteStage(1);
                }
            }else{
                documentElem.setDocumentStatus("FROM INBOUND");
                documentElem.setInboundStage(0);
                documentElem.setCompleteStage(1);
            }

            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String completeDocumentsFinalOutbound() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        List <Documents> finalOutboundDocumentsList = documentsService.findDocumentByFinalOutboundStageAndID(1, orderIdParam);

        for(Documents documentElem : finalOutboundDocumentsList) {
            if(documentElem.getDocumentProcessed() > 2) {

                    documentElem.setDocumentStatus("FINAL OUTBOUND COMPLETE");
                    documentElem.setFinalInboundStage(0);

            }else{
                    documentElem.setDocumentStatus("FROM FINAL OUTBOUND");
                    documentElem.setFinalOutboundStage(0);
                    documentElem.setCompleteStage(1);
            }
            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String completeDocumentsFinalInbound() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        List <Documents> finalInboundDocumentsList = documentsService.findDocumentByFinalInboundStageAndID(1, orderIdParam);

        for(Documents documentElem : finalInboundDocumentsList) {

            if(documentElem.getDocumentProcessed() > 3){
                documentElem.setDocumentStatus("FINAL INBOUND COMPLETE");
                documentElem.setCompleteStage(0);
            }else{
                documentElem.setDocumentStatus("FROM FINAL INBOUND");
                documentElem.setFinalInboundStage(0);
                documentElem.setCompleteStage(1);
            }
            documentsService.updateDocument(documentElem);
        }


        sessionAttributes.put("orderIdParam", orderIdParam);

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
            documentflag = 2; // entered series number successfully
            sessionAttributes.put("documentflag", documentflag);
        }

        return SUCCESS;
    }

    public String activateOutbound() {
        // for outbound pending documents
        List <Documents> outboundDocumentsList = documentsService.findDocumentByOutboundStageAndID(0, orderIdParam);

        for(Documents documentElem : outboundDocumentsList){
            documentElem.setOutboundStage(1);
            if(documentElem.getDocumentName().equals("BOOKING REQUEST FORM")){
                documentElem.setDocumentStatus("FROM BOOKING");
            }else if(documentElem.getDocumentName().equals("HOUSE WAYBILL ORIGIN") || documentElem.getDocumentName().equals("PROFORMA BILL OF LADING") ){
                documentElem.setDocumentStatus("FROM PLANNING");
            }

            documentsService.updateDocument(documentElem);
        }

        // for other stages pending documents
        List <Documents> finalOutboundDocuments = documentsService.findDocumentByFinalOutboundStageAndID(0, orderIdParam);

        for(Documents documentElem : finalOutboundDocuments){
            documentElem.setFinalOutboundStage(1);
            documentsService.updateDocument(documentElem);
        }

        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        Documents documentAcceptance = new Documents();

        Documents documentRelease = new Documents();

        if(orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("SHIPPING") ){

            // Add House Bill of Lading begin
            Documents documentEntity = new Documents();
            Client client = clientService.findClientById(getClientId().toString());
            documentEntity.setClient(client);
            documentEntity.setDocumentName(DocumentsConstants.HOUSE_BILL_OF_LADING);
            documentEntity.setReferenceId(orderIdParam);
            documentEntity.setReferenceTable("ORDERS");
            documentEntity.setOrderNumber(orderService.findOrdersById(orderIdParam).getOrderNumber());
            documentEntity.setCreatedDate(new Date());
            documentEntity.setDocumentStatus("FOR REFERENCE");
            documentEntity.setDocumentProcessed(0);
            documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            documentEntity.setOutboundStage(1);
            documentEntity.setVendorCode("ELC");
            documentsService.addDocuments(documentEntity);
            // Add House Bill of Lading end

            if(orderEntity.getServiceMode().equals("PIER TO PIER")){

                /*CREATE ACCEPTANCE RECEIPT BEGIN*/
                documentAcceptance.setClient(client);
                documentAcceptance.setDocumentName(DocumentsConstants.ACCEPTANCE_RECEIPT);
                documentAcceptance.setReferenceId(orderIdParam);
                documentAcceptance.setReferenceTable("ORDERS");
                documentAcceptance.setOrderNumber(orderService.findOrdersById(orderIdParam).getOrderNumber());
                documentAcceptance.setCreatedDate(new Date());
                documentAcceptance.setDocumentStatus("FOR PRINTING");
                documentAcceptance.setDocumentProcessed(0);
                documentAcceptance.setCreatedBy(commonUtils.getUserNameFromSession());
                documentAcceptance.setOutboundStage(1);
                documentAcceptance.setVendorCode("ELC");
                documentsService.addDocuments(documentAcceptance);
                /*CREATE ACCEPTANCE RECEIPT END*/

                /*CREATE RELEASE ORDER BEGIN*/
                documentRelease.setClient(client);
                documentRelease.setDocumentName(DocumentsConstants.RELEASE_ORDER);
                documentRelease.setReferenceId(orderIdParam);
                documentRelease.setReferenceTable("ORDERS");
                documentRelease.setOrderNumber(orderService.findOrdersById(orderIdParam).getOrderNumber());
                documentRelease.setCreatedDate(new Date());
                documentRelease.setDocumentStatus("FOR PRINTING");
                documentRelease.setDocumentProcessed(2);
                documentRelease.setCreatedBy(commonUtils.getUserNameFromSession());
                documentRelease.setFinalOutboundStage(0);
                documentRelease.setVendorCode("ELC");
                documentsService.addDocuments(documentRelease);
                /*CREATE RELEASE ORDER END*/

            }else if(orderEntity.getServiceMode().equals("DOOR TO PIER")){

                /*CREATE RELEASE ORDER BEGIN*/
                documentRelease.setClient(client);
                documentRelease.setDocumentName(DocumentsConstants.RELEASE_ORDER);
                documentRelease.setReferenceId(orderIdParam);
                documentRelease.setReferenceTable("ORDERS");
                documentRelease.setOrderNumber(orderService.findOrdersById(orderIdParam).getOrderNumber());
                documentRelease.setCreatedDate(new Date());
                documentRelease.setDocumentStatus("FOR PRINTING");
                documentRelease.setDocumentProcessed(2);
                documentRelease.setCreatedBy(commonUtils.getUserNameFromSession());
                documentRelease.setFinalOutboundStage(0);
                documentRelease.setVendorCode("ELC");
                documentsService.addDocuments(documentRelease);
                /*CREATE RELEASE ORDER END*/

            }else if(orderEntity.getServiceMode().equals("PIER TO DOOR")) {

                /*CREATE ACCEPTANCE RECEIPT BEGIN*/
                documentAcceptance.setClient(client);
                documentAcceptance.setDocumentName(DocumentsConstants.ACCEPTANCE_RECEIPT);
                documentAcceptance.setReferenceId(orderIdParam);
                documentAcceptance.setReferenceTable("ORDERS");
                documentAcceptance.setOrderNumber(orderService.findOrdersById(orderIdParam).getOrderNumber());
                documentAcceptance.setCreatedDate(new Date());
                documentAcceptance.setDocumentStatus("FOR PRINTING");
                documentAcceptance.setDocumentProcessed(0);
                documentAcceptance.setCreatedBy(commonUtils.getUserNameFromSession());
                documentAcceptance.setOutboundStage(1);
                documentAcceptance.setVendorCode("ELC");
                documentsService.addDocuments(documentAcceptance);
                /*CREATE ACCEPTANCE RECEIPT END*/

            }
        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String addDocumentsInput(){

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + orderIdParam);
        System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" + documentStageParam);

//        OrderBean orderBean = new OrderBean();
//
//        orderBean.setServiceType(orderService.findOrdersById(orderIdParam).getServiceType());
//        orderBean.setModeOfService(orderService.findOrdersById(orderIdParam).getServiceMode());

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);

        documentNames = parameterService.getParameterMap(ParameterConstants.DOCUMENT, ParameterConstants.DOCUMENT_NAME);

//        documentNameList.add("HOUSE BILL OF LADING");
//        documentNameList.add("afdad");

//        for (int i=0; i == documentNames.size(); i++){
//            System.out.println(">>>>>>>" + documentNames.get(i).getReferenceColumn());
//
//        }

//        if(documentStageParam.equals("OUTBOUND")){
//            documentNames.add("HOUSE BILL OF LADING");
//            documentNames.add("HOUSE BILL OF LADING2");
//        }

        return SUCCESS;
    }

    public String addDocument() {

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + document.getDocumentName());
        System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" + document.getReferenceNumber());
        System.out.println("dddddddddddddddddddddddddddddd" + document.getReferenceId());
        System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee" + documentStageParam);

        List<String> vendorSea = new ArrayList<String>();
        List<String> vendorOrigin = new ArrayList<String>();
        List<String> vendorDestination = new ArrayList<String>();
        List <Documents> bookingDocuments = documentsService.findDocumentsByOrderId(document.getReferenceId());

        Orders orderEntity = orderService.findOrdersById(document.getReferenceId());
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(document.getReferenceId());

        // Shipping vendors set will be stored in VendorSea variable
        Integer vendorSeaCount = 0;
        for (OrderItems everyItem : orderItemsList) {
            if (vendorSea.isEmpty()) {
                vendorSea.add(everyItem.getVendorSea());
                vendorSeaCount = vendorSeaCount + 1;
            } else {
                if (!vendorSea.contains(everyItem.getVendorSea())) {
                    vendorSea.add(everyItem.getVendorSea());
                    vendorSeaCount = vendorSeaCount + 1;
                }
            }
        }

        // Origin vendors set will be stored in VendorOrigin Variable
        Integer vendorOriginCount = 0;
        for (OrderItems everyItem : orderItemsList) {
            if (vendorOrigin.isEmpty()) {
                vendorOrigin.add(everyItem.getVendorOrigin());
                vendorOriginCount = vendorOriginCount + 1;
            } else {
                if (!vendorOrigin.contains(everyItem.getVendorOrigin())) {
                    vendorOrigin.add(everyItem.getVendorOrigin());
                    vendorOriginCount = vendorOriginCount + 1;
                }
            }
        }

        // Destination vendors set will be stored in VendorDestination Variable
        Integer vendorDestinationCount = 0;
        for (OrderItems everyItem : orderItemsList) {
            if (vendorDestination.isEmpty()) {
                vendorDestination.add(everyItem.getVendorDestination());
                vendorDestinationCount = vendorDestinationCount + 1;
            } else {
                if (!vendorDestination.contains(everyItem.getVendorDestination())) {
                    vendorDestination.add(everyItem.getVendorDestination());
                    vendorDestinationCount = vendorDestinationCount + 1;
                }
            }
        }

        // Count Proforma Bill of Lading documents
        Integer countProforma = 0;
        for(Documents ProformaDocs : bookingDocuments){
            if(ProformaDocs.getDocumentName().equals("PROFORMA BILL OF LADING")){
                countProforma = countProforma + 1;
            }
        }

        // Count House Waybill Origin documents
        Integer countWaybillOrigin = 0;
        for(Documents waybillOriginDocs : bookingDocuments) {
            if(waybillOriginDocs.getDocumentName().equals("HOUSE WAYBILL ORIGIN")){
                countWaybillOrigin = countWaybillOrigin + 1;
            }
        }

        String documentName = document.getDocumentName().toUpperCase();

        if(documentName.equals("BOOKING REQUEST FORM") || documentName.equals("HOUSE WAYBILL ORIGIN") || documentName.equals("PROFORMA BILL OF LADING") || documentName.equals("HOUSE WAYBILL DESTINATION") || documentName.equals("AUTHORIZATION TO WITHDRAW") || documentName.equals("ACCEPTANCE RECEIPT") || documentName.equals("RELEASE ORDER")){
            clearErrorsAndMessages();
            addActionError("Document cannot be created!");

            return INPUT;

        }else if(documentName.equals("HOUSE BILL OF LADING")) {

            // will delete all existing House Bill of Lading document
            for (Documents freightDocumentElem : bookingDocuments){
                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                if(docName.equals("HOUSE BILL OF LADING")){
                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                    documentsService.deleteDocument(documentEntity);
                }
            }

            // Add House Bill of Lading based on number for Proforma Bill of Lading

                for(String seaVendor : vendorSea){
                    if(seaVendor != null){

                        Documents documentEntity = new Documents();
                        Client client = clientService.findClientById(getClientId().toString());

                        documentEntity.setClient(client);
                        documentEntity.setDocumentName(documentName);
                        documentEntity.setReferenceId(document.getReferenceId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderService.findOrdersById(document.getReferenceId()).getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setVendorCode(seaVendor);

                        if (documentStageParam.equals("OUTBOUND")) {
                            documentEntity.setOutboundStage(1);
                            documentEntity.setDocumentProcessed(0);
                            documentEntity.setDocumentStatus("OUTBOUND");
                        } else if (documentStageParam.equals("INBOUND")) {
                            documentEntity.setInboundStage(1);
                            documentEntity.setDocumentProcessed(1);
                            documentEntity.setDocumentStatus("INBOUND");
                        } else if (documentStageParam.equals("FINAL OUTBOUND")) {
                            documentEntity.setDocumentProcessed(2);
                            documentEntity.setFinalOutboundStage(1);
                            documentEntity.setDocumentStatus("FINAL OUTBOUND");
                        } else {
                            documentEntity.setFinalInboundStage(1);
                            documentEntity.setDocumentProcessed(3);
                            documentEntity.setDocumentStatus("FINAL INBOUND");
                        }

                        documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                        documentEntity.setReferenceNumber(document.getReferenceNumber());
                        documentEntity.setDocumentComments(document.getDocumentComments());

                        documentsService.addDocuments(documentEntity);


                    }else{
                        clearErrorsAndMessages();
                        addActionError("No Shipping vendor set!");

                        return INPUT;
                    }
                }

        }else if(documentName.equals("MASTER BILL OF LADING")){

            // will delete all existing Master Bill of Lading document
            for (Documents freightDocumentElem : bookingDocuments){
                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                if(docName.equals("MASTER BILL OF LADING")){
                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                    documentsService.deleteDocument(documentEntity);
                }
            }

            // Add Master Bill of Lading based on number for Proforma Bill of Lading
            for(String seaVendor : vendorSea){
                if(seaVendor != null){

                    Documents documentEntity = new Documents();
                    Client client = clientService.findClientById(getClientId().toString());

                    documentEntity.setClient(client);
                    documentEntity.setDocumentName(documentName);
                    documentEntity.setReferenceId(document.getReferenceId());
                    documentEntity.setReferenceTable("ORDERS");
                    documentEntity.setOrderNumber(orderService.findOrdersById(document.getReferenceId()).getOrderNumber());
                    documentEntity.setCreatedDate(new Date());
                    documentEntity.setVendorCode(seaVendor);

                    if (documentStageParam.equals("OUTBOUND")) {
                        documentEntity.setOutboundStage(1);
                        documentEntity.setDocumentProcessed(0);
                        documentEntity.setDocumentStatus("OUTBOUND");
                    } else if (documentStageParam.equals("INBOUND")) {
                        documentEntity.setInboundStage(1);
                        documentEntity.setDocumentProcessed(1);
                        documentEntity.setDocumentStatus("INBOUND");
                    } else if (documentStageParam.equals("FINAL OUTBOUND")) {
                        documentEntity.setDocumentProcessed(2);
                        documentEntity.setFinalOutboundStage(1);
                        documentEntity.setDocumentStatus("FINAL OUTBOUND");
                    } else {
                        documentEntity.setFinalInboundStage(1);
                        documentEntity.setDocumentProcessed(3);
                        documentEntity.setDocumentStatus("FINAL INBOUND");
                    }

                    documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                    documentEntity.setReferenceNumber(document.getReferenceNumber());
                    documentEntity.setDocumentComments(document.getDocumentComments());

                    documentsService.addDocuments(documentEntity);

                }else{
                    clearErrorsAndMessages();
                    addActionError("No Shipping vendor set!");

                    return INPUT;
                }
            }

        }else if(documentName.equals("MASTER WAYBILL ORIGIN")){

            // will delete all existing House Waybill Origin documents
            for (Documents freightDocumentElem : bookingDocuments){
                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                if(docName.equals("MASTER WAYBILL ORIGIN")){
                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                    documentsService.deleteDocument(documentEntity);
                }
            }

            // Add Master Waybill Origin based on number for House Waybill Origin
            for(String originVendor : vendorOrigin){
                if(originVendor != null){

                    Documents documentEntity = new Documents();
                    Client client = clientService.findClientById(getClientId().toString());

                    documentEntity.setClient(client);
                    documentEntity.setDocumentName(documentName);
                    documentEntity.setReferenceId(document.getReferenceId());
                    documentEntity.setReferenceTable("ORDERS");
                    documentEntity.setOrderNumber(orderService.findOrdersById(document.getReferenceId()).getOrderNumber());
                    documentEntity.setCreatedDate(new Date());
                    documentEntity.setVendorCode(originVendor);

                    if (documentStageParam.equals("OUTBOUND")) {
                        documentEntity.setOutboundStage(1);
                        documentEntity.setDocumentProcessed(0);
                        documentEntity.setDocumentStatus("OUTBOUND");
                    } else if (documentStageParam.equals("INBOUND")) {
                        documentEntity.setInboundStage(1);
                        documentEntity.setDocumentProcessed(1);
                        documentEntity.setDocumentStatus("INBOUND");
                    } else if (documentStageParam.equals("FINAL OUTBOUND")) {
                        documentEntity.setDocumentProcessed(2);
                        documentEntity.setFinalOutboundStage(1);
                        documentEntity.setDocumentStatus("FINAL OUTBOUND");
                    } else {
                        documentEntity.setFinalInboundStage(1);
                        documentEntity.setDocumentProcessed(3);
                        documentEntity.setDocumentStatus("FINAL INBOUND");
                    }

                    documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                    documentEntity.setReferenceNumber(document.getReferenceNumber());
                    documentEntity.setDocumentComments(document.getDocumentComments());

                    documentsService.addDocuments(documentEntity);

                }else{
                    clearErrorsAndMessages();
                    addActionError("No Origin vendor set!");

                    return INPUT;
                }
            }

        }else if(documentName.equals("MASTER WAYBILL DESTINATION")) {

            // will delete all existing House Waybill Destination documents
            for (Documents freightDocumentElem : bookingDocuments){
                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                if(docName.equals("MASTER WAYBILL DESTINATION")){
                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                    documentsService.deleteDocument(documentEntity);
                }
            }

            // Add Master Waybill Destination based on number for House Waybill Destination
            for(String destinationVendor : vendorDestination){
                if(destinationVendor != null){

                    Documents documentEntity = new Documents();
                    Client client = clientService.findClientById(getClientId().toString());

                    documentEntity.setClient(client);
                    documentEntity.setDocumentName(documentName);
                    documentEntity.setReferenceId(document.getReferenceId());
                    documentEntity.setReferenceTable("ORDERS");
                    documentEntity.setOrderNumber(orderService.findOrdersById(document.getReferenceId()).getOrderNumber());
                    documentEntity.setCreatedDate(new Date());
                    documentEntity.setVendorCode(destinationVendor);

                    if (documentStageParam.equals("OUTBOUND")) {
                        documentEntity.setOutboundStage(1);
                        documentEntity.setDocumentProcessed(0);
                        documentEntity.setDocumentStatus("OUTBOUND");
                    } else if (documentStageParam.equals("INBOUND")) {
                        documentEntity.setInboundStage(1);
                        documentEntity.setDocumentProcessed(1);
                        documentEntity.setDocumentStatus("INBOUND");
                    } else if (documentStageParam.equals("FINAL OUTBOUND")) {
                        documentEntity.setDocumentProcessed(2);
                        documentEntity.setFinalOutboundStage(1);
                        documentEntity.setDocumentStatus("FINAL OUTBOUND");
                    } else {
                        documentEntity.setFinalInboundStage(1);
                        documentEntity.setDocumentProcessed(3);
                        documentEntity.setDocumentStatus("FINAL INBOUND");
                    }

                    documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                    documentEntity.setReferenceNumber(document.getReferenceNumber());
                    documentEntity.setDocumentComments(document.getDocumentComments());

                    documentsService.addDocuments(documentEntity);

                }else{
                    clearErrorsAndMessages();
                    addActionError("No Origin vendor set!");

                    return INPUT;
                }
            }

        }else{

            Documents documentEntity = new Documents();
            Client client = clientService.findClientById(getClientId().toString());

            documentEntity.setClient(client);
            documentEntity.setDocumentName(documentName);
            documentEntity.setReferenceId(document.getReferenceId());
            documentEntity.setReferenceTable("ORDERS");
            documentEntity.setOrderNumber(orderService.findOrdersById(document.getReferenceId()).getOrderNumber());
            documentEntity.setCreatedDate(new Date());

            if (documentStageParam.equals("OUTBOUND")) {
                documentEntity.setOutboundStage(1);
                documentEntity.setDocumentProcessed(0);
                documentEntity.setDocumentStatus("OUTBOUND");
            } else if (documentStageParam.equals("INBOUND")) {
                documentEntity.setInboundStage(1);
                documentEntity.setDocumentProcessed(1);
                documentEntity.setDocumentStatus("INBOUND");
            } else if (documentStageParam.equals("FINAL OUTBOUND")) {
                documentEntity.setDocumentProcessed(2);
                documentEntity.setFinalOutboundStage(1);
                documentEntity.setDocumentStatus("FINAL OUTBOUND");
            } else {
                documentEntity.setFinalInboundStage(1);
                documentEntity.setDocumentProcessed(3);
                documentEntity.setDocumentStatus("FINAL INBOUND");
            }

            documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            documentEntity.setReferenceNumber(document.getReferenceNumber());
            documentEntity.setDocumentComments(document.getDocumentComments());

            documentsService.addDocuments(documentEntity);

        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam",  document.getReferenceId());

        return SUCCESS;
    }

    public String activateFinalOutbound() {
        List<String> vendorSeaCodeList = new ArrayList<String>(); // placeholder for sea vendor codes
        List<String> vendorDestinationCodeList = new ArrayList<String>(); // placeholder for destination vendor codes
        List<OrderItems> orderItemList = new ArrayList<OrderItems>();
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        // order item list under order id
        orderItemList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        // sea vendor codes will be stored in vendorSeaCodeList
        for(OrderItems orderItem : orderItemList){
            if(vendorSeaCodeList.isEmpty()){
                vendorSeaCodeList.add(orderItem.getVendorSea());
            }else{
                if(!vendorSeaCodeList.contains(orderItem.getVendorSea())) {
                    vendorSeaCodeList.add(orderItem.getVendorSea());
                }
            }
        }

        // destination vendor codes will be stored in vendorDestinationCodeList
        for(OrderItems orderItem : orderItemList){
            if(vendorDestinationCodeList.isEmpty()){
                vendorDestinationCodeList.add(orderItem.getVendorDestination());
            }else{
                if(!vendorDestinationCodeList.contains(orderItem.getVendorDestination())){
                    vendorDestinationCodeList.add(orderItem.getVendorDestination());
                }
            }
        }

        List<Documents> authorizationWithdraw = documentsService.findDocumentNameAndId("AUTHORIZATION TO WITHDRAW", orderIdParam);
        /*List<Documents> houseWaybillDestination = documentsService.findDocumentNameAndId("HOUSE WAYBILL DESTINATION", orderIdParam);*/

        // Authorization to withdraw will be created based on every order item and should have shipping in freight type
        Orders orderCheck = orderService.findOrdersById(orderIdParam);

        if(orderCheck.getServiceType().equals("SHIPPING AND TRUCKING") || orderCheck.getServiceType().equals("SHIPPING")){
            for (String seaVendor : vendorSeaCodeList) {
                if (authorizationWithdraw.size() == 0) { // will create authorization to withdraw if nothing was created yet

                        Documents documentEntity = new Documents();

                        Client client = clientService.findClientById(getClientId().toString());
                        documentEntity.setClient(client);

                        documentEntity.setDocumentName(DocumentsConstants.AUTHORIZATION_TO_WITHDRAW);
                        documentEntity.setReferenceId(orderEntity.getOrderId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setDocumentStatus("FOR PRINTING");
                        documentEntity.setVendorCode(seaVendor);
                        documentEntity.setFinalOutboundStage(1);
                        documentEntity.setDocumentProcessed(2);
                        documentEntity.setReferenceNumber(orderEntity.getOrderNumber());

                        documentsService.addDocuments(documentEntity);

                }else{
                    documentflag = 6; // Document already exist
                    sessionAttributes.put("documentflag", documentflag);
                    sessionAttributes.put("orderIdParam", orderIdParam);
                    /*return INPUT;*/
                    break;
                }
            }
        }

        inboundEntityList = documentsService.findDocumentByInboundStageAndID(1, orderIdParam);
        finalOutboundEntityList = documentsService.findDocumentByFinalOutboundStageAndID(0, orderIdParam);

        for (Documents documentElem : inboundEntityList){ // Will update all completed inbound stage documents to final outbound
            if(documentElem.getDocumentName().equals("BOOKING REQUEST FORM") || documentElem.getDocumentName().equals("HOUSE WAYBILL ORIGIN") || documentElem.getDocumentName().equals("MASTER WAYBILL ORIGIN")){
                /*documentElem.setArchiveStage(0);*/
                documentElem.setCompleteStage(1);
            }else {
                documentElem.setFinalOutboundStage(1);
            }
            documentsService.updateDocument(documentElem);
        }

        for (Documents documentElem : finalOutboundEntityList){ // will update all final outbound documents with 0 flag
            documentElem.setDocumentStatus("FROM INBOUND");
            documentElem.setFinalOutboundStage(1);
            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String activateCompleteStage() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        List<Documents> finalInboundDocuments = documentsService.findDocumentByFinalInboundStageAndID(1, orderIdParam);

        for (Documents documentElem : finalInboundDocuments) {
            documentElem.setDocumentStatus("FROM FINAL INBOUND");
            documentElem.setCompleteStage(1);
            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;

    }

    public String activateArchive() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        /*Orders orderEntity = orderService.findOrdersById(orderIdParam);

        orderEntity.setOrderStatus("SERVICE ACCOMPLISHED");

        orderService.updateOrder(orderEntity);*/

        List<Documents> allDocuments = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : allDocuments) {
            documentElem.setDocumentStatus("COMPLETED");
            documentElem.setArchiveStage(1);
            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String deleteDocument() {
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        documentsService.deleteDocument(documentEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String finalOutboundSent(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("------------------ORDER ID" + orderIdParam);

        System.out.println("------------------DATE SENT" + dateSentFinalOutbound);

        System.out.println("------------------TRACKING NUMBER" + finalOutboundTrackingNumber);
        // count all documents in final outbound stage
        finalOutboundEntityList = documentsService.findDocumentByFinalOutboundStageAndID(1, orderIdParam);
        // saves date sent for final outbound and tracking number for all documents
        for(Documents documentElem : finalOutboundEntityList){
            documentElem.setFinalOutboundSent(dateSentFinalOutbound);
            documentElem.setFinalOutboundLbc(finalOutboundTrackingNumber);
            documentElem.setDocumentStatus("DOCUMENT SENT!");

            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String addReferenceNumberFinalOutbound(){

        Documents documentsEntity = transformToDocumentEntityBean(document);

        documentsService.updateDocument(documentsEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", documentsEntity.getReferenceId());

        /*Pass flag to view order documents*/
        if (documentsEntity.getDocumentName().equals("AUTHORIZATION TO WITHDRAW") || documentsEntity.getDocumentName().equals("HOUSE BILL OF LADING") || documentsEntity.getDocumentName().equals("HOUSE WAYBILL DESTINATION") ){
            documentflag = 3; // document successfully updated
            sessionAttributes.put("documentflag", documentflag);
        }else {
            documentflag = 2; // entered reference number successfully
            sessionAttributes.put("documentflag", documentflag);
        }

        return SUCCESS;
    }

    public String dateReceivedInbound(){

        System.out.println("----------------------------------------date" + dateReturnedInbound);

        System.out.println("----------------------------------------quantity" + quantitySI_DR );

        System.out.println("---------------------------------------=====" + orderIdParam);

        outboundEntityList = documentsService.findDocumentByOutboundStageAndID(1, orderIdParam);

        outboundCount = outboundEntityList.size();

        inboundEntityList = documentsService.findDocumentByInboundStageAndID(0, orderIdParam); // count inbound documents with 0 value

        inboundCount = inboundEntityList.size();

        // updates all existing inbound documents at this point and adds return date to them
        for (Documents documentInboundElem : inboundEntityList) {
            documentInboundElem.setInboundStage(1);
            documentInboundElem.setInboundReturned(dateReturnedInbound);
            documentInboundElem.setDocumentStatus("PENDING");

            documentsService.updateDocument(documentInboundElem);
        }

        Map sessionAttributes = ActionContext.getContext().getSession();

        List<String> vendorSeaCodeList = new ArrayList<String>(); // placeholder for sea vendor codes
        List<String> vendorOriginCodeList = new ArrayList<String>(); // placeholder for origin vendor codes

        List<OrderItems> orderItemList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        // order item list under order id
        orderItemList = operationsService.findAllOrderItemsByOrderId(orderIdParam);
        // sea vendor codes will be stored in vendorSeaCodeList
        for(OrderItems orderItem : orderItemList){
            if(vendorSeaCodeList.isEmpty()){
                vendorSeaCodeList.add(orderItem.getVendorSea());
            }else{
                if(!vendorSeaCodeList.contains(orderItem.getVendorSea())) {
                    vendorSeaCodeList.add(orderItem.getVendorSea());
                }
            }

        }
        // origin vendor codes will be stored in vendorOriginCodeList
        for(OrderItems orderItem : orderItemList) {
            if(vendorOriginCodeList.isEmpty()){
                vendorOriginCodeList.add(orderItem.getVendorOrigin());
            }else{
                if(!vendorOriginCodeList.contains(orderItem.getVendorOrigin())){
                    vendorOriginCodeList.add(orderItem.getVendorOrigin());
                }
            }
        }

        List<Documents> proformaBillOfLading = documentsService.findDocumentNameAndId("PROFORMA BILL OF LADING", orderIdParam);
        List<Documents> houseWaybillOrigin = documentsService.findDocumentNameAndId("HOUSE WAYBILL ORIGIN", orderIdParam);

        // Master Bill of Lading will be created based on Proforma Bill of Lading quantity
        for (String seaVendor : vendorSeaCodeList) {
            if (proformaBillOfLading.size() != 0) {
                // will check if there is already and existing master bill of lading under the same vendor
                List<Documents> documentMBL = documentsService.findDocumentNameAndId("MASTER BILL OF LADING",orderIdParam);

                if(documentMBL.size() == 0) { // will create master bill of lading if there are no master bill of lading created yet.

                    for (Documents documentElem : proformaBillOfLading) {
                        Documents documentEntity = new Documents();

                        Client client = clientService.findClientById(getClientId().toString());
                        documentEntity.setClient(client);

                        documentEntity.setDocumentName(DocumentsConstants.MASTER_BILL_OF_LADING);
                        documentEntity.setReferenceId(orderEntity.getOrderId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setDocumentStatus("PENDING");
                        documentEntity.setVendorCode(seaVendor);
                        documentEntity.setInboundStage(1);
                        documentEntity.setDocumentProcessed(1);
                        documentEntity.setInboundReturned(dateReturnedInbound);
                        documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                        // orderitem id should be set in orderitemid column WIP

                        documentsService.addDocuments(documentEntity);
                    }

                } // else will not do anything

            } else {
                documentflag = 6; // Proforma Bill of Lading does not exist
                sessionAttributes.put("documentflag", documentflag);
                sessionAttributes.put("orderIdParam", orderIdParam);

                /*return INPUT;*/
                break;
            }
        }

        for (String originVendor : vendorOriginCodeList) {
            if(houseWaybillOrigin.size() != 0){

                // will check if there is already and existing master waybill origin under the same vendor
                List<Documents> documentMWO = documentsService.findDocumentNameAndId("MASTER WAYBILL ORIGIN",orderIdParam);

                if(documentMWO.size() == 0) { // will create master waybill origin if there are no master waybill origin created yet.

                    for (Documents documentElem : houseWaybillOrigin) {
                        Documents documentEntity = new Documents();

                        Client client = clientService.findClientById(getClientId().toString());
                        documentEntity.setClient(client);

                        documentEntity.setDocumentName(DocumentsConstants.MASTER_WAYBILL_ORIGIN);
                        documentEntity.setReferenceId(orderEntity.getOrderId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setDocumentStatus("PENDING");
                        documentEntity.setVendorCode(originVendor);
                        documentEntity.setInboundStage(1);
                        documentEntity.setDocumentProcessed(1);
                        documentEntity.setInboundReturned(dateReturnedInbound);
                        documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                        // orderitem id should be set in orderitemid column WIP

                        documentsService.addDocuments(documentEntity);
                    }

                }// else will not create a document

            }else{
                documentflag = 10; // One or more House WayBill Origin does not exist
                sessionAttributes.put("documentflag", documentflag);
                sessionAttributes.put("orderIdParam", orderIdParam);

                /*return INPUT;*/
                break;
            }
        }

        //will check if there is already an existing sales invoice / delivery receipt created under the booking
        List <Documents> documentSI_DR = documentsService.findDocumentNameAndId("SALES INVOICE",orderIdParam);

        if(documentSI_DR != null){
            // delete documents before creating
            for(Documents documentDelete : documentSI_DR){
                documentsService.deleteDocument(documentDelete);
            }

            // To create Sales Invoice / Delivery Receipt by quantity specified
            for (int i=0; i < quantitySI_DR; i++) {
                Documents documentEntity = new Documents();

                Client client = clientService.findClientById(getClientId().toString());
                documentEntity.setClient(client);

                documentEntity.setDocumentName(DocumentsConstants.SALES_INVOICE);
                documentEntity.setReferenceId(orderEntity.getOrderId());
                documentEntity.setReferenceTable("ORDERS");
                documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                documentEntity.setCreatedDate(new Date());
                documentEntity.setDocumentStatus("PENDING");
                documentEntity.setInboundStage(1);
                documentEntity.setDocumentProcessed(1);
                documentEntity.setInboundReturned(dateReturnedInbound);

                documentsService.addDocuments(documentEntity);
            }

        }else{
            // create documents right away
            // To create Sales Invoice / Delivery Receipt by quantity specified
            for (int i=0; i <= quantitySI_DR; i++) {
                Documents documentEntity = new Documents();

                Client client = clientService.findClientById(getClientId().toString());
                documentEntity.setClient(client);

                documentEntity.setDocumentName(DocumentsConstants.SALES_INVOICE);
                documentEntity.setReferenceId(orderEntity.getOrderId());
                documentEntity.setReferenceTable("ORDERS");
                documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                documentEntity.setCreatedDate(new Date());
                documentEntity.setDocumentStatus("PENDING");
                documentEntity.setInboundStage(1);
                documentEntity.setDocumentProcessed(1);
                documentEntity.setInboundReturned(dateReturnedInbound);

                documentsService.addDocuments(documentEntity);
            }
        }

        documentflag = 9; // Return Date of Inbound documents saved
        sessionAttributes.put("documentflag", documentflag);
        sessionAttributes.put("orderIdParam", orderIdParam);

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

    public String dateReceivedFinalInbound(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("ORDER ID----------------------------------" + orderIdParam);

        System.out.println("Date Returned final inbound----------------------------------" + dateReturnedFinalInbound);

        List<Documents> allDocuments = documentsService.findDocumentsByOrderId(orderIdParam);

        List<Documents> finalInboundDocuments = documentsService.findDocumentByFinalInboundStageAndID(0, orderIdParam);

        for (Documents documentElem : finalInboundDocuments){
            if(documentElem.getDocumentName().equals("HOUSE BILL OF LADING") || documentElem.getDocumentName().equals("MASTER BILL OF LADING") || documentElem.getDocumentName().equals("SALES INVOICE") || documentElem.getDocumentName().equals("AUTHORIZATION TO WITHDRAW") || documentElem.getDocumentName().equals("ACCEPTANCE RECEIPT") || documentElem.getDocumentName().equals("RELEASE ORDER")){
                documentElem.setFinalInboundStage(1);
                documentElem.setFinalInboundReturned(dateReturnedFinalInbound);
                documentElem.setFinalInboundReceivedBy(commonUtils.getUserNameFromSession());
                documentsService.updateDocument(documentElem);
            }else if(documentElem.getDocumentName().equals("HOUSE WAYBILL DESTINATION")){
                documentElem.setDocumentStatus("FROM FINAL OUTBOUND");
                documentElem.setFinalInboundStage(1);
                documentElem.setFinalInboundReturned(dateReturnedFinalInbound);
                documentElem.setFinalInboundReceivedBy(commonUtils.getUserNameFromSession());
                documentsService.updateDocument(documentElem);

                List<String> vendorDestinationCodeList = new ArrayList<String>(); // placeholder for destination vendor codes
                List<OrderItems> orderItemList = new ArrayList<OrderItems>();

                // order item list under order id
                orderItemList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

                // destination vendor codes will be stored in vendorDestinationCodeList
                for(OrderItems orderItem : orderItemList){
                    if(vendorDestinationCodeList.isEmpty()){
                        vendorDestinationCodeList.add(orderItem.getVendorDestination());
                    }else{
                        if(!vendorDestinationCodeList.contains(orderItem.getVendorDestination())){
                            vendorDestinationCodeList.add(orderItem.getVendorDestination());
                        }
                    }
                }
                // List all master waybill already in the documents
                List<Documents> masterWaybillDestination = documentsService.findDocumentNameAndId("MASTER WAYBILL DESTINATION", orderIdParam);

                for (String destinationVendor : vendorDestinationCodeList) {
                    if(masterWaybillDestination.size() == 0) {
                        // Create Master Waybill Destination Start
                        Orders orderEntity = orderService.findOrdersById(orderIdParam);
                        Documents documentEntity = new Documents();

                        Client client = clientService.findClientById(getClientId().toString());
                        documentEntity.setClient(client);

                        documentEntity.setDocumentName(DocumentsConstants.MASTER_WAYBILL_DESTINATION);
                        documentEntity.setReferenceId(orderEntity.getOrderId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setVendorCode(destinationVendor);
                        documentEntity.setDocumentStatus("PENDING");
                        documentEntity.setFinalInboundStage(1);
                        documentEntity.setDocumentProcessed(3);
                        documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                        documentEntity.setFinalInboundReturned(dateReturnedFinalInbound);
                        // orderitem id should be set in orderitemid column WIP

                        documentsService.addDocuments(documentEntity);
                    }
                }

                // Create Master Waybill Destination End
            }

        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    private Documents transformToDocumentEntityBean(DocumentsBean formBean) {

        Documents entity = new Documents();

        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if(formBean.getDocumentId() != null) {
            entity.setDocumentId(new Integer(formBean.getDocumentId()));
        }

        /*Documents subEntity = documentsService.findDocumentById(formBean.getDocumentId());*/

        entity.setDocumentName(formBean.getDocumentName());
        entity.setReferenceId(formBean.getReferenceId());
        entity.setReferenceTable(formBean.getReferenceTable());
        entity.setOrderNumber(formBean.getOrderNumber());
        entity.setCreatedDate(formBean.getCreatedDate());
        entity.setDocumentStatus("DOCUMENT UPDATED");
        entity.setDocumentProcessed(formBean.getDocumentProcessed());
        entity.setReferenceNumber(formBean.getReferenceNumber());
        entity.setDocumentType(formBean.getDocumentType());
        entity.setOutboundStage(formBean.getOutboundStage());
        entity.setInboundStage(formBean.getInboundStage());
        entity.setFinalOutboundStage(formBean.getFinalOutboundStage());
        entity.setFinalInboundStage(formBean.getFinalInboundStage());
        entity.setCompleteStage(formBean.getCompleteStage());
        entity.setInboundReturned(formBean.getInboundReturned());
        entity.setFinalOutboundSent(formBean.getFinalOutboundSent());
        entity.setFinalOutboundLbc(formBean.getFinalOutboundLbc());
        entity.setFinalInboundReturned(formBean.getFinalInboundReturned());
        entity.setFinalInboundReceivedBy(formBean.getFinalInboundReceivedBy());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setDocumentComments(formBean.getDocumentComments());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setAging(formBean.getAging());
        entity.setVendorCode(documentsService.findDocumentById(formBean.getDocumentId()).getVendorCode());

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
        formBean.setAging(entity.getAging());

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
        if (order.getShipperAddressId() != null && !"".equals(order.getShipperAddressId())) {
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
        if (order.getConsigneeAddressId() != null && !"".equals(order.getConsigneeAddressId())) {
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
    // Booking Request Form
    public String generateBookingRequestReport() {

        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>documentIdParam " + documentIdParam);

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

    // House Bill of Lading
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
    // House Waybill Origin
    public String generateHouseWayBillReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();
        String documentId = (documentEntity.getDocumentId().toString());

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);
        params.put("documentId", documentId);

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
    // House Waybill Destination
    public String generateHouseWayBillDestinationReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();
        String documentId = (documentEntity.getDocumentId().toString());

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);
        params.put("documentId", documentId);

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
    // Acceptance Receipt
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
    // Release Order
    public String generateReleaseOrderReport() {
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();
//        	String orderId = "26";
//          String orderItemId = "1";
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
    // Authorization to Withdraw
    public String generateAuthorizationToWithdrawReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();
        String documentId = (documentEntity.getDocumentId()).toString();

        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);
        params.put("documentId", documentId);

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

    /*2GO Proforma Bill of Lading*/
    public String generateProformaReport(){
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>orderIdParam " + orderIdParam);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>documentIdParam " + documentIdParam);

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String orderId = (documentEntity.getReferenceId()).toString();
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>orderId " + orderId);
        Map<String, String> params = new HashMap();
        params.put("orderId", orderId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try{
            final File outputFile = new File("Proforma Bill of Lading - 2GO.pdf");

            MasterReport report = proformaBillOfLadingReportService.generateReport(params);

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

    // Equipment Interchange Receipt 1
    public String generateEIR1RequestReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String containerId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("containerId", containerId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try{
            // Create an output filename
            final File outputFile = new File("Equipment Interchange Receipt 1.pdf");
            // Generate the report
            MasterReport report = equipmentInterchangeReceipt1ReportService.generateReport(params);

            HttpServletResponse response = ServletActionContext.getResponse();
            responseOut = new BufferedOutputStream(response.getOutputStream());
            byteArray = new ByteArrayOutputStream();

            boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
            byteArray.writeTo(responseOut);

            byteArray.close();
            responseOut.close();

        }catch(Exception re){
            re.printStackTrace();
        }
        return null;

    }

    // Equipment Interchange Receipt 2
    public String generateEIR2RequestReport() {

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String containerId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("containerId", containerId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try{
            // Create an output filename
            final File outputFile = new File("Equipment Interchange Receipt 2.pdf");
            // Generate the report
            MasterReport report = equipmentInterchangeReceipt2ReportService.generateReport(params);

            HttpServletResponse response = ServletActionContext.getResponse();
            responseOut = new BufferedOutputStream(response.getOutputStream());
            byteArray = new ByteArrayOutputStream();

            boolean isRendered = PdfReportUtil.createPDF(report, byteArray);
            byteArray.writeTo(responseOut);

            byteArray.close();
            responseOut.close();

        }catch(Exception re){
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
        System.out.println(" agadgashasdhasfhasfhasdh " + orderService.findOrdersById(entity.getOrderId()).getServiceType() );
        if(orderService.findOrdersById(entity.getOrderId()).getServiceType().equals("TRUCKING")){
            formBean.setOriginationPort("N/A");
            formBean.setDestinationPort("N/A");
        }else{
            formBean.setOriginationPort(entity.getOriginationPort());
            formBean.setDestinationPort(entity.getDestinationPort());
        }
        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());
        formBean.setModeOfService(entity.getServiceMode());
        formBean.setServiceRequirement(entity.getServiceRequirement());
        formBean.setAging(0);

        List <Documents> documentsList = documentsService.findDocumentsByOrderId(entity.getOrderId());
        List <Documents> documentsComplete = documentsService.findDocumentByArchiveStageAndID(1,entity.getOrderId());

        if(documentsList == documentsComplete){
            formBean.setDocumentCheck("ARCHIVED");
        }else{
            formBean.setDocumentCheck("ON-GOING");
        }


        return formBean;
    }

    public DocumentsBean transformDocumentsToFormBean(Documents entity) {
        DocumentsBean formBean = new DocumentsBean();

        formBean.setDocumentId(entity.getDocumentId());
        formBean.setDocumentName(entity.getDocumentName());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setCreatedDate(entity.getCreatedDate());
        formBean.setDocumentStatus(entity.getDocumentStatus());
        formBean.setDocumentProcessed(entity.getDocumentProcessed());
        formBean.setReferenceNumber(entity.getReferenceNumber());
        formBean.setDocumentType(entity.getDocumentType());
        formBean.setOutboundStage(entity.getOutboundStage());
        formBean.setInboundStage(entity.getInboundStage());
        formBean.setFinalOutboundStage(entity.getFinalOutboundStage());
        formBean.setFinalInboundStage(entity.getFinalInboundStage());
        formBean.setCompleteStage(entity.getCompleteStage());
        formBean.setInboundReturned(entity.getInboundReturned());
        formBean.setFinalOutboundSent(entity.getFinalOutboundSent());
        formBean.setFinalOutboundLbc(entity.getFinalOutboundLbc());
        formBean.setFinalInboundReturned(entity.getFinalInboundReturned());
        formBean.setFinalInboundReceivedBy(entity.getFinalInboundReceivedBy());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setDocumentComments(entity.getDocumentComments());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setAging(entity.getAging());

        /*Integer orderItemIdPass; // Variable to store Order Item ID
        // Condition if order item id if null or not
        if(entity.getOrderItemId() != null){
            orderItemIdPass = entity.getOrderItemId();
        }else{
            orderItemIdPass = 0;
        }*/

        /*OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemIdPass);*/

        // Per document the table will show appropriate data based on document name.
        if(entity.getDocumentName().equals("PROFORMA BILL OF LADING") || entity.getDocumentName().equals("MASTER BILL OF LADING")){
            // Vendor Code for Vessel Company will show based from voyage number information

            // Search all order Items with the same order id
            /*List <OrderItems> orderItemsEntity = orderService.findAllItemByOrderId(entity.getReferenceId());

            for (OrderItems orderItemElem : orderItemsEntity) {
                // ---------------------------------------- NULL ERROR --------------------------------------
                String vendorHolder = orderItemElem.getVendorSea();
                if(vendorHolder != null){
                System.out.println(">>>>>>>>>>>>>>>>>>> " + orderItemElem.getVendorSea());
                    Vendor vendorEntity = vendorService.findVendorByVendorCode(orderItemElem.getVendorSea());
                    formBean.setVendorCode(vendorEntity.getVendorName());
                }else{
                    formBean.setVendorCode("NONE");

                }
            }*/

            Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorCode());
            formBean.setVendorCode(vendorEntity.getVendorName());

        }else if (entity.getDocumentName().equals("MASTER WAYBILL ORIGIN")) {
            /*List<OrderItems> orderItemsEntity = orderService.findAllItemByOrderId(entity.getReferenceId());

            for (OrderItems orderItemElem : orderItemsEntity) {
                // ---------------------------------------- NULL ERROR --------------------------------------
                if (orderItemElem.getVendorOrigin() != null || orderItemElem.getVendorOrigin() != "NONE") {
                    Vendor vendorEntity = vendorService.findVendorByVendorCode(orderItemElem.getVendorOrigin());
                    formBean.setVendorCode(vendorEntity.getVendorName());
                } else {
                    formBean.setVendorCode("NONE");
                }
            }*/

            Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorCode());
            formBean.setVendorCode(vendorEntity.getVendorName());

        }else if(entity.getDocumentName().equals("MASTER WAYBILL DESTINATION")){

            /*List<OrderItems> orderItemsEntity = orderService.findAllItemByOrderId(entity.getReferenceId());

            for (OrderItems orderItemElem : orderItemsEntity) {
                // ---------------------------------------- NULL ERROR --------------------------------------
                if (orderItemElem.getVendorDestination() != null || orderItemElem.getVendorDestination() != "NONE") {
                    Vendor vendorEntity = vendorService.findVendorByVendorCode(orderItemElem.getVendorDestination());
                    formBean.setVendorCode(vendorEntity.getVendorName());
                } else {
                    formBean.setVendorCode("NONE");
                }

            }*/

            Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorCode());
            formBean.setVendorCode(vendorEntity.getVendorName());

        }else if (entity.getDocumentName().equals("SALES INVOICE") || entity.getDocumentName().equals("DELIVERY RECEIPT")){

            Orders orderEntity = orderService.findOrdersById(entity.getReferenceId());
            Customer customerEntity = customerService.findCustomerById(orderEntity.getCustomerId());
            formBean.setVendorCode("CUSTOMER: " + customerEntity.getCustomerName());

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

    /*FOR TESTING PURPOSES*/
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
    /*FOR TESTING PURPOSES*/

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

    public Integer getQuantitySI_DR() {
        return quantitySI_DR;
    }

    public void setQuantitySI_DR(Integer quantitySI_DR) {
        this.quantitySI_DR = quantitySI_DR;
    }

    public Date getDateReturnedInbound() {
        return dateReturnedInbound;
    }

    public void setDateReturnedInbound(Date dateReturnedInbound) {
        this.dateReturnedInbound = dateReturnedInbound;
    }

    public List<Integer> getDocumentQuantity() {
        return documentQuantity;
    }

    public void setDocumentQuantity(List<Integer> documentQuantity) {
        this.documentQuantity = documentQuantity;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }

    public String getDocumentTabFinalOutbound() {
        return documentTabFinalOutbound;
    }

    public void setDocumentTabFinalOutbound(String documentTabFinalOutbound) {
        this.documentTabFinalOutbound = documentTabFinalOutbound;
    }

    public String getFinalOutboundTrackingNumber() {
        return finalOutboundTrackingNumber;
    }

    public void setFinalOutboundTrackingNumber(String finalOutboundTrackingNumber) {
        this.finalOutboundTrackingNumber = finalOutboundTrackingNumber;
    }

    public Date getDateSentFinalOutbound() {
        return dateSentFinalOutbound;
    }

    public void setDateSentFinalOutbound(Date dateSentFinalOutbound) {
        this.dateSentFinalOutbound = dateSentFinalOutbound;
    }

    public String getDocumentTabFinalInbound() {
        return documentTabFinalInbound;
    }

    public void setDocumentTabFinalInbound(String documentTabFinalInbound) {
        this.documentTabFinalInbound = documentTabFinalInbound;
    }

    public Date getDateReturnedFinalInbound() {
        return dateReturnedFinalInbound;
    }

    public void setDateReturnedFinalInbound(Date dateReturnedFinalInbound) {
        this.dateReturnedFinalInbound = dateReturnedFinalInbound;
    }

    public String getDocumentItem() {
        return documentItem;
    }

    public void setDocumentItem(String documentItem) {
        this.documentItem = documentItem;
    }

    public void setEquipmentInterchangeReceipt1ReportService(EquipmentInterchangeReceipt1ReportService equipmentInterchangeReceipt1ReportService) {
        this.equipmentInterchangeReceipt1ReportService = equipmentInterchangeReceipt1ReportService;
    }

    public EquipmentInterchangeReceipt2ReportService getEquipmentInterchangeReceipt2ReportService() {
        return equipmentInterchangeReceipt2ReportService;
    }

    public void setEquipmentInterchangeReceipt2ReportService(EquipmentInterchangeReceipt2ReportService equipmentInterchangeReceipt2ReportService) {
        this.equipmentInterchangeReceipt2ReportService = equipmentInterchangeReceipt2ReportService;
    }

    public String getContainerId() {
        return containerId;
    }

    public void setContainerId(String containerId) {
        this.containerId = containerId;
    }

    public String getDocumentTabBilling() {
        return documentTabBilling;
    }

    public void setDocumentTabBilling(String documentTabBilling) {
        this.documentTabBilling = documentTabBilling;
    }

    public String getDocumentTabArchive() {
        return documentTabArchive;
    }

    public void setDocumentTabArchive(String documentTabArchive) {
        this.documentTabArchive = documentTabArchive;
    }

    public Integer getArchiveCount() {
        return archiveCount;
    }

    public void setArchiveCount(Integer archiveCount) {
        this.archiveCount = archiveCount;
    }

    public Integer getBillingCount() {
        return billingCount;
    }

    public void setBillingCount(Integer billingCount) {
        this.billingCount = billingCount;
    }

    public List<DocumentsBean> getArchiveDocuments() {
        return archiveDocuments;
    }

    public void setArchiveDocuments(List<DocumentsBean> archiveDocuments) {
        this.archiveDocuments = archiveDocuments;
    }

    public List<DocumentsBean> getBillingDocuments() {
        return billingDocuments;
    }

    public void setBillingDocuments(List<DocumentsBean> billingDocuments) {
        this.billingDocuments = billingDocuments;
    }

    public Integer getCompleteCount() {
        return completeCount;
    }

    public void setCompleteCount(Integer completeCount) {
        this.completeCount = completeCount;
    }

    public List<Documents> getCompleteEntityList() {
        return completeEntityList;
    }

    public void setCompleteEntityList(List<Documents> completeEntityList) {
        this.completeEntityList = completeEntityList;
    }

    public List<DocumentsBean> getCompleteDocuments() {
        return completeDocuments;
    }

    public void setCompleteDocuments(List<DocumentsBean> completeDocuments) {
        this.completeDocuments = completeDocuments;
    }

    public String getDocumentTabComplete() {
        return documentTabComplete;
    }

    public void setDocumentTabComplete(String documentTabComplete) {
        this.documentTabComplete = documentTabComplete;
    }

    public String getDocumentStageParam() {
        return documentStageParam;
    }

    public void setDocumentStageParam(String documentStageParam) {
        this.documentStageParam = documentStageParam;
    }

    public List<Parameters> getDocumentNames() {
        return documentNames;
    }

    public void setDocumentNames(List<Parameters> documentNames) {
        this.documentNames = documentNames;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public String getVendorCodeParam() {
        return vendorCodeParam;
    }

    public void setVendorCodeParam(String vendorCodeParam) {
        this.vendorCodeParam = vendorCodeParam;
    }

    public void setProformaBillOfLadingReportService(ProformaBillOfLadingReportService proformaBillOfLadingReportService) {
        this.proformaBillOfLadingReportService = proformaBillOfLadingReportService;
    }
}
