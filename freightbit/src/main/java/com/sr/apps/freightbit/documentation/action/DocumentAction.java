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
import com.sr.apps.freightbit.vendor.formbean.DriverBean;
import com.sr.apps.freightbit.vendor.formbean.VendorBean;
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
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.service.VesselSchedulesService;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.modules.output.pageable.pdf.PdfReportUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
    private List<DocumentsBean> confirmDocuments = new ArrayList<DocumentsBean>();
    private List<Parameters> orderSearchList = new ArrayList<Parameters>();
    private OrderBean order = new OrderBean();
    private DriverBean driver = new DriverBean();
    private ContactBean contact = new ContactBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private AddressBean address = new AddressBean();
    private DocumentsBean document = new DocumentsBean();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<Integer> documentQuantity = new ArrayList<Integer>();
    private List<Parameters> documentNames = new ArrayList<Parameters>();
    private List<String> recipientList = new ArrayList<String>();
    private List<Contacts> representativeList = new ArrayList<Contacts>();
    private Contacts repContact = new Contacts();
    private List<DriverBean> repContactsList = new ArrayList<DriverBean>();
    private List<Contacts> shipperContacts = new ArrayList<Contacts>();
    private List<Contacts> consigneeContacts = new ArrayList<Contacts>();

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
    private ConsolidationManifestReportService consolidationManifestReportService;
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
    private String vendorLocationFlag;
    private String authorizedRecipient;
    private String authorizedRepresentative;

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
    private String checkString;
    private String[] check;
    private String strReturnedInbound;
    private Date dateReturnedInbound; // variable to capture return date of inbound documents
    private Integer quantitySI_DR; // variable to capture quantity of sales invoice and delivery receipt documents
    private String strSentFinalOutbound;
    private Date dateSentFinalOutbound; // variable to capture sent date of final outbound
    private String finalOutboundTrackingNumber; // variable to store tracking number of final outbound documents
    private String finalInboundTrackingNumber;
    private String strReturnedFinalInbound;
    private Date dateReturnedFinalInbound; // variable to save date of documents returned for final inbound

    private Map<Integer, String> representativeMap = new HashMap<Integer, String>();
    private Map<Integer, String> repContactMap = new HashMap<Integer, String>();
    private Integer representativeIdParam;
    private Integer repContactIdParam;
    private Integer shipperContactIdParam;
    private Integer consigneeContactIdParam;

    @Override
    public void prepare() throws Exception{
        orderSearchList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.ORDER_SEARCH);
        documentQuantity = new ArrayList<Integer>();
        for (int i=1; i <=10; i++) {
            documentQuantity.add(i);
        }
    }

    public String viewArchivedDocuments() {
        int customerId = 0;
        if( commonUtils.getCustomerIdFromSession()!= null ){
            customerId = commonUtils.getCustomerIdFromSession();
        }else{
            customerId = getClientId();
        }

        String column = getColumnFilter();
        List<Documents> documentEntityList = new ArrayList<Documents>();
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

        if(StringUtils.isNotBlank(column)){
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> column " + column);
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> keyword " + order.getOrderKeyword());

            if(column.equals("shipperCode")){
                List<Customer> customerEntityList = customerService.findCustomersByCriteria("customerName", order.getOrderKeyword(),getClientId());
                List<Orders> orderEntityList = documentsService.findAllOrdersDocumentationArchived();
                // To search for customer in booking
                for(Customer customerElem : customerEntityList){
                    for(Orders orderElem : orderEntityList){
                        if(customerElem.getCustomerId().equals(orderElem.getCustomerId())){
                            List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                            Integer checkDocs = 0; // loop will count for documents with complete status
                            for (Documents documentElem : allDocs){

                                if (documentElem.getDocumentStatus().equals("COMPLETED")){
                                    checkDocs += 1;
                                }

                            }

                            if(allDocs.size() == checkDocs && allDocs.size() > 1){ // documents that is not equal to all completed documents will be added to the list
                                orders.add(transformToOrderFormBean(orderElem));
                            }
                        }
                    }
                }
            }else if(column.equals("consigneeCode")){
                List<Contacts> consigneeEntityList = customerService.findConsigneeByCriteria("companyName", order.getOrderKeyword(), getClientId());
                List<Orders> orderEntityList = documentsService.findAllOrdersDocumentationArchived();
                // To search for consignee in booking
                for(Contacts consigneeElem : consigneeEntityList){
                    for(Orders orderElem : orderEntityList){
                        if(consigneeElem.getContactId().equals(orderElem.getConsigneeContactId())){
                            List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                            Integer checkDocs = 0; // loop will count for documents with complete status
                            for (Documents documentElem : allDocs){

                                if (documentElem.getDocumentStatus().equals("COMPLETED")){
                                    checkDocs += 1;
                                }

                            }

                            if(allDocs.size() == checkDocs && allDocs.size() > 1){ // documents that is not equal to all completed documents will be added to the list
                                orders.add(transformToOrderFormBean(orderElem));
                            }
                        }
                    }
                }
            }else{
                List<Orders> orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());

                for (Orders orderElem : orderEntityList) {
                    if(orderElem.getOrderStatus().equals("ON GOING") || orderElem.getOrderStatus().equals("SERVICE ACCOMPLISHED") || orderElem.getOrderStatus().equals("SERVICE ACCOMPLISHED - ARCHIVED")){
                        List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                        Integer checkDocs = 0; // loop will count for documents with complete status
                        for (Documents documentElem : allDocs){

                            if (documentElem.getDocumentStatus().equals("COMPLETED")){
                                checkDocs += 1;
                            }

                        }

                        if(allDocs.size() == checkDocs && allDocs.size() > 1){ // documents that is not equal to all completed documents will be added to the list
                            orders.add(transformToOrderFormBean(orderElem));
                        }
                    }
                }
            }
        }else{

            List<Orders> orderEntityList = documentsService.findAllOrdersDocumentationArchived();

            for(Orders orderElem : orderEntityList){
                List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                Integer checkDocs = 0; // loop will count for documents with complete status
                for (Documents documentElem : allDocs){

                    if (documentElem.getDocumentStatus().equals("COMPLETED")){
                        checkDocs = checkDocs + 1;
                    }

                }

                if(allDocs.size() == checkDocs && allDocs.size() > 1){ // documents that is equal to all completed documents will be added to the list
                    orders.add(transformToOrderFormBean(orderElem));
                }

            }

        }

        return SUCCESS;
    }

    public String viewPendingDocuments() {
        int customerId = 0;
        if( commonUtils.getCustomerIdFromSession()!= null ){
            customerId = commonUtils.getCustomerIdFromSession();
        }else{
            customerId = getClientId();
        }

        String column = getColumnFilter();
        List<Documents> documentEntityList = new ArrayList<Documents>();
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

        if(StringUtils.isNotBlank(column)){
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> column " + column);
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> keyword " + order.getOrderKeyword());

            if(column.equals("shipperCode")){
                List<Customer> customerEntityList = customerService.findCustomersByCriteria("customerName", order.getOrderKeyword(),getClientId());
                List<Orders> orderEntityList = documentsService.findAllOrdersDocumentation();
                // To search for customer in booking
                for(Customer customerElem : customerEntityList){
                    for(Orders orderElem : orderEntityList){
                        if(customerElem.getCustomerId().equals(orderElem.getCustomerId())){
                            /*String strOrig = orderElem.getOrderStatus();
                            int intIndex = strOrig.indexOf("ARCHIVED");

                            if(intIndex == -1){
                                orders.add(transformToOrderFormBean(orderElem));
                            }*/
                            List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                            Integer checkDocs = 0; // loop will count for documents with complete status
                            for (Documents documentElem : allDocs){

                                if (documentElem.getDocumentStatus().equals("COMPLETED")){
                                    checkDocs += 1;
                                }

                            }

                            if(allDocs.size() != checkDocs ){ // documents that is not equal to all completed documents will be added to the list
                                orders.add(transformToOrderFormBean(orderElem));
                            }
                        }
                    }
                }
            }else if(column.equals("consigneeCode")){
                List<Contacts> consigneeEntityList = customerService.findConsigneeByCriteria("companyName", order.getOrderKeyword(), getClientId());
                List<Orders> orderEntityList = documentsService.findAllOrdersDocumentation();
                // To search for consignee in booking
                for(Contacts consigneeElem : consigneeEntityList){
                    for(Orders orderElem : orderEntityList){
                        if(consigneeElem.getContactId().equals(orderElem.getConsigneeContactId())){
                            /*String strOrig = orderElem.getOrderStatus();
                            int intIndex = strOrig.indexOf("ARCHIVED");

                            if(intIndex == -1){
                                orders.add(transformToOrderFormBean(orderElem));
                            }*/
                            List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                            Integer checkDocs = 0; // loop will count for documents with complete status
                            for (Documents documentElem : allDocs){

                                if (documentElem.getDocumentStatus().equals("COMPLETED")){
                                    checkDocs += 1;
                                }

                            }

                            if(allDocs.size() != checkDocs ){ // documents that is not equal to all completed documents will be added to the list
                                orders.add(transformToOrderFormBean(orderElem));
                            }
                        }
                    }
                }
            }else{
                List<Orders> orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());

                for (Orders orderElem : orderEntityList) {
                    if(orderElem.getOrderStatus().equals("ON GOING")){
                        List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                        Integer checkDocs = 0; // loop will count for documents with complete status
                        for (Documents documentElem : allDocs){

                            if (documentElem.getDocumentStatus().equals("COMPLETED")){
                                checkDocs += 1;
                            }

                        }

                        if(allDocs.size() != checkDocs ){ // documents that is not equal to all completed documents will be added to the list
                            orders.add(transformToOrderFormBean(orderElem));
                        }
                    }
                }
            }
        }else{
            List<Orders> orderEntityList = documentsService.findAllOrdersDocumentation();

            for(Orders orderElem : orderEntityList){
                List <Documents> allDocs = documentsService.findDocumentsByOrderId(orderElem.getOrderId()); // will look for all documents under order ID

                Integer checkDocs = 0; // loop will count for documents with complete status
                for (Documents documentElem : allDocs){

                    if (documentElem.getDocumentStatus().equals("COMPLETED")){
                        checkDocs += 1;
                    }

                }

                if(allDocs.size() != checkDocs ){ // documents that is not equal to all completed documents will be added to the list
                    orders.add(transformToOrderFormBean(orderElem));
                }
            }
        }

        return SUCCESS;
    }

    public String getColumnFilter() {

        String column = "";
        if (order == null) {
            System.out.println("ok");
            return column;
        } else {
            if ("BOOKING NUMBER".equals(order.getOrderSearchCriteria())) {
                column = "orderNumber";
            } else if ("CUSTOMER".equals(order.getOrderSearchCriteria())) {
                column = "shipperCode";
            } else if ("CONSIGNEE".equals(order.getOrderSearchCriteria())) {
                column = "consigneeCode";
            } else if ("SERVICE TYPE".equals(order.getOrderSearchCriteria())) {
                column = "serviceType";
            } else if ("SERVICE REQUIREMENT".equals(order.getOrderSearchCriteria())) {
                column = "serviceRequirement";
            } else if ("SERVICE MODE".equals(order.getOrderSearchCriteria())) {
                column = "serviceMode";
            }
            return column;
        }
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
        }else if(documentflag == 8){
            clearErrorsAndMessages();
            addActionMessage("Missing Authorized Agent / Ernest Shipper Contact / Ernest Consignee Contact");
        }else{
            clearErrorsAndMessages();
        }

        return SUCCESS;
    }

    /*OUTBOUND DOCUMENTS VIEW*/
    public String viewOrderDocuments() {
        clearErrorsAndMessages();
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
        /*if(orderEntity.getServiceMode().equals("DOOR TO DOOR")){
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
        }*/

        // checker for documents missing
        // System will check if service type required document is created
        if(orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("SHIPPING")) {

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
            /*if(vendorSeaCount != documentProformaEntity.size()) {
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
            }*/
        }

        /*OUTBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : outboundEntityList) {
                outboundDocuments.add(transformDocumentsToFormBean(documentElem));
            }
        /*INBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : inboundEntityList) {
                inboundDocuments.add(transformDocumentsToFormBean(documentElem));
            }
        /*FINAL OUTBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : finalOutboundEntityList) {
                finalOutboundDocuments.add(transformDocumentsToFormBean(documentElem));
            }
        /*FINAL INBOUND DOCUMENTS TABLE VIEW*/
            for (Documents documentElem : finalInboundEntityList) {
                finalInboundDocuments.add(transformDocumentsToFormBean(documentElem));
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

        /*Booking Request Form data view*/

        Documents brfDocument = documentsService.findDocumentNameAndOrderId("BOOKING REQUEST FORM",orderIdParam);

        Date returnedInbound = brfDocument.getInboundReturned();
        Date sentFinalOutbound = brfDocument.getFinalOutboundSent();
        Date returnedFinalInbound = brfDocument.getFinalInboundReturned();

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

        if(returnedInbound != null){
            strReturnedInbound = formatter.format(returnedInbound);
        }
        if(sentFinalOutbound != null){
            strSentFinalOutbound = formatter.format(sentFinalOutbound);
        }
        if(returnedFinalInbound != null){
            strReturnedFinalInbound = formatter.format(returnedFinalInbound);
        }
        finalOutboundTrackingNumber = brfDocument.getFinalOutboundLbc();
        finalInboundTrackingNumber = brfDocument.getFinalInboundLbc();

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

    public String bookingSearch() {
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

        Orders orderEntity = orderService.findOrdersById(orderItem.getOrderId());

        // To fetch sea vendor name from vendor ID
        if(orderItem.getVendorSea() != null && !"".equals(orderItem.getVendorSea()) && !orderItem.getVendorSea().equals("NONE")){
            Vendor seaVendor = vendorService.findVendorByVendorCode(orderItem.getVendorSea());
            orderItemBean.setVendorSea(seaVendor.getVendorName());
        }else{
            if(orderEntity.getServiceType().equals("TRUCKING")){
                orderItemBean.setVendorSea("NOT APPLICABLE");
            }else{
                orderItemBean.setVendorSea("NONE");
            }
        }

        // To fetch origin vendor name from vendor ID
        if(orderItem.getVendorOrigin() != null && !"".equals(orderItem.getVendorOrigin()) && !orderItem.getVendorOrigin().equals("NONE")){
            Vendor originVendor = vendorService.findVendorByVendorCode(orderItem.getVendorOrigin());
            orderItemBean.setVendorOrigin(originVendor.getVendorName());
        }else{
            if(orderEntity.getServiceMode().equals("PIER TO PIER") || orderEntity.getServiceMode().equals("PIER TO DOOR") || orderEntity.getServiceMode().equals("DELIVERY")){
                orderItemBean.setVendorOrigin("NOT APPLICABLE");
            }else{
                orderItemBean.setVendorOrigin("NONE");
            }
        }

        // To fetch destination vendor name from vendor ID
        if(orderItem.getVendorDestination() != null && !"".equals(orderItem.getVendorDestination()) && !orderItem.getVendorDestination().equals("NONE")){
            Vendor destinationVendor = vendorService.findVendorByVendorCode(orderItem.getVendorDestination());
            orderItemBean.setVendorDestination(destinationVendor.getVendorName());
        }else{
            if(orderEntity.getServiceMode().equals("PIER TO PIER") || orderEntity.getServiceMode().equals("DOOR TO PIER") || orderEntity.getServiceMode().equals("PICKUP")){
                orderItemBean.setVendorDestination("NOT APPLICABLE");
            }else{
                orderItemBean.setVendorDestination("NONE");
            }
        }

        return orderItemBean;
    }

    // Process Documents on Outbound Stage
    public String processDocuments(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        checkString = sessionAttributes.get("checkString").toString();

        documentItem = sessionAttributes.get("documentItem").toString();

        orderIdParam = (Integer) sessionAttributes.get("orderIdParam");

        documentStageParam = sessionAttributes.get("documentStageParam").toString();

        if (checkString != null) { // Check has value

            if(documentItem.equals("check")) { // if word passed is equals to check

                String str = checkString;

                ArrayList outList = new ArrayList(Arrays.asList(str.split(",")));

                for (int i = 0; i < outList.size(); i++) { // loop of how many values in check

                    if(outList.get(i).equals("false") || outList.get(i).equals(null)|| "".equals(outList.get(i))){ // catches error when no values inside check
                        sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }
                    // will execute if document item is equals to check
                    /*Integer documentId = Integer.parseInt(check[i]);*/

                    Integer documentIdHolder = Integer.parseInt(outList.get(i).toString());

                    Documents documentIdEntity = documentsService.findDocumentById(documentIdHolder);
                    // Will trigger if Proforma Bill of Lading does not have a Reference Number
                    if (documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && documentIdEntity.getReferenceNumber() == null || "".equals(documentIdEntity.getReferenceNumber()) || documentIdEntity.getReferenceNumber() == null ) {
                        documentIdEntity.setDocumentStatus("NO SERIES NUMBER");
                        /*Pass flag to view order documents*/
                        documentflag = 1; // Shows must enter reference number error
                        sessionAttributes.put("documentflag", documentflag);
                    // Will trigger if Proforma Bill of Lading has a Reference Number
                    } else if (documentIdEntity.getDocumentName().equals("PROFORMA BILL OF LADING") && documentIdEntity.getReferenceNumber() != null) {
                        documentIdEntity.setDocumentStatus("ENTERED SERIES NUMBER");
                        documentIdEntity.setDocumentProcessed(4);
                        documentIdEntity.setCompleteStage(1);
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

        checkString = sessionAttributes.get("checkString").toString();

        documentItem = sessionAttributes.get("documentItem").toString();

        orderIdParam = (Integer) sessionAttributes.get("orderIdParam");

        documentStageParam = sessionAttributes.get("documentStageParam").toString();

        if (checkString != null) {

            if(documentItem.equals("check")) {

                String str = checkString;

                ArrayList inList = new ArrayList(Arrays.asList(str.split(",")));

                for (int i = 0; i < inList.size(); i++) {
                    // if no checkbox are selected
                    if(inList.get(i).equals("false") || inList.get(i).equals("null")|| "".equals(inList.get(i))){
                        sessionAttributes.put("orderIdParam", orderIdParam );
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentIdHolder = Integer.parseInt(inList.get(i).toString());

                    Documents documentIdEntity = documentsService.findDocumentById(documentIdHolder);

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
                    }else if(documentIdEntity.getDocumentName().equals("MASTER WAYBILL ORIGIN") || documentIdEntity.getDocumentName().equals("AUTHORIZATION TO WITHDRAW")){
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

        checkString = sessionAttributes.get("checkString").toString();

        documentItem = sessionAttributes.get("documentItem").toString();

        orderIdParam = (Integer) sessionAttributes.get("orderIdParam");

        documentStageParam = sessionAttributes.get("documentStageParam").toString();

        if (checkString != null) {

            if(documentItem.equals("check")) {

                String str = checkString;

                ArrayList fiOutList = new ArrayList(Arrays.asList(str.split(",")));

                for (int i = 0; i < fiOutList.size(); i++) {
                    // if no checkbox are selected
                    if(fiOutList.get(i).equals("false") || fiOutList.get(i).equals("null")|| "".equals(fiOutList.get(i))){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentIdHolder = Integer.parseInt(fiOutList.get(i).toString());

                    Documents documentIdEntity = documentsService.findDocumentById(documentIdHolder);

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

        checkString = sessionAttributes.get("checkString").toString();

        documentItem = sessionAttributes.get("documentItem").toString();

        orderIdParam = (Integer) sessionAttributes.get("orderIdParam");

        documentStageParam = sessionAttributes.get("documentStageParam").toString();

        if (checkString != null) {

            if(documentItem.equals("check")) {

                String str = checkString;

                ArrayList fiInList = new ArrayList(Arrays.asList(str.split(",")));

                for (int i = 0; i < fiInList.size(); i++) {
                    // if no checkbox are selected
                    if(fiInList.get(i).equals("false") || fiInList.get(i).equals("null")|| "".equals(fiInList.get(i))){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentIdHolder = Integer.parseInt(fiInList.get(i).toString());

                    Documents documentIdEntity = documentsService.findDocumentById(documentIdHolder);

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

        checkString = sessionAttributes.get("checkString").toString();

        documentItem = sessionAttributes.get("documentItem").toString();

        orderIdParam = (Integer) sessionAttributes.get("orderIdParam");

        documentStageParam = sessionAttributes.get("documentStageParam").toString();

        if (checkString != null) {

            if(documentItem.equals("check")) {

                String str = checkString;

                ArrayList completeList = new ArrayList(Arrays.asList(str.split(",")));

                for (int i = 0; i < completeList.size(); i++) {
                    // if no checkbox are selected
                    if(completeList.get(i).equals("false") || completeList.get(i).equals("null")|| "".equals(completeList.get(i))){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        documentflag = 7; // Shows error that no document was checked
                        sessionAttributes.put("documentflag", documentflag);
                        return INPUT;
                    }

                    // will execute if document item is equals to check
                    Integer documentIdHolder = Integer.parseInt(completeList.get(i).toString());

                    Documents documentIdEntity = documentsService.findDocumentById(documentIdHolder);

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

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(orderEntity.getOrderId());

        List<String> vendorOrigin = new ArrayList<String>();
        List<String> vendor3rdPartyOrigin = new ArrayList<String>();
        List<String> vendorDestination = new ArrayList<String>();
        List<String> vendor3rdPartyDestination = new ArrayList<String>();

        // Origin vendors set will be stored in VendorOrigin Variable
        Integer vendorOriginCount = 0;
        for (OrderItems everyItem : orderItemsList) {
            if (vendorOrigin.isEmpty()) {
                vendorOrigin.add(everyItem.getVendorOrigin());
                vendorOriginCount = vendorOriginCount + 1;
            }else{
                if (!vendorOrigin.contains(everyItem.getVendorOrigin())) {
                    vendorOrigin.add(everyItem.getVendorOrigin());
                    vendorOriginCount = vendorOriginCount + 1;
                }
            }
        }

        // Origin vendors set will be stored in Vendor3rdPartyOrigin Variable
        Integer vendor3rdPartyOriginCount = 0;
        for (OrderItems everyItem : orderItemsList) {
            if(everyItem.getVendorOrigin() != null) {
                if(!everyItem.getVendorOrigin().equals("ELC")) {
                    if (vendor3rdPartyOrigin.isEmpty()) {
                        vendor3rdPartyOrigin.add(everyItem.getVendorOrigin());
                        vendor3rdPartyOriginCount = vendor3rdPartyOriginCount + 1;
                    } else {
                        if (!vendor3rdPartyOrigin.contains(everyItem.getVendorOrigin())) {
                            vendor3rdPartyOrigin.add(everyItem.getVendorOrigin());
                            vendor3rdPartyOriginCount = vendor3rdPartyOriginCount + 1;
                        }
                    }
                }
            }
        }

        // Destination vendors set will be stored in VendorDestination Variable
        Integer vendorDestinationCount = 0;
        for (OrderItems everyItem : orderItemsList) {
            if (vendorDestination.isEmpty()) {
                vendorDestination.add(everyItem.getVendorDestination());
                vendorDestinationCount = vendorDestinationCount + 1;
            }else{
                if (!vendorDestination.contains(everyItem.getVendorDestination())) {
                    vendorDestination.add(everyItem.getVendorDestination());
                    vendorDestinationCount = vendorDestinationCount + 1;
                }
            }
        }

        // Destination vendors set will be stored in Vendor3rdPartyDestination Variable
        Integer vendor3rdPartyDestinationCount = 0;
        for (OrderItems everyItem : orderItemsList) {
            if(everyItem.getVendorDestination() != null) {
               if(!everyItem.getVendorDestination().equals("ELC")) {
                   if (vendor3rdPartyDestination.isEmpty()) {
                       vendor3rdPartyDestination.add(everyItem.getVendorDestination());
                       vendor3rdPartyDestinationCount = vendor3rdPartyDestinationCount + 1;
                   } else {
                       if (!vendor3rdPartyDestination.contains(everyItem.getVendorDestination())) {
                           vendor3rdPartyDestination.add(everyItem.getVendorDestination());
                           vendor3rdPartyDestinationCount = vendor3rdPartyDestinationCount + 1;
                       }
                   }
               }
            }
        }
        documentNames = parameterService.getParameterMap(ParameterConstants.DOCUMENT, ParameterConstants.DOCUMENT_NAME);

        List <Driver> allDriverList = vendorService.findAllDrivers();
        List <Contacts> allContactsList = vendorService.findAllContacts();

        // Will filter authorized agent and Ernest based on Origin and Destination
        if(documentStageParam.equals("OUTBOUND")){
            Vendor ernestRecipientOri = vendorService.findErnestRecipient("ELC", orderEntity.getOriginationPort());
            Vendor ernestRecipientDes = vendorService.findErnestRecipient("ELC", orderEntity.getDestinationPort());

            vendorLocationFlag = "ORIGIN";

            if(ernestRecipientOri != null){

                for (Driver driverElem : allDriverList){
                    if(driverElem.getVendorId() == ernestRecipientOri.getVendorId()){

                        DriverBean formBean = new DriverBean();
                        formBean.setDriverId(driverElem.getDriverId());
                        formBean.setLastName(driverElem.getLastName());
                        formBean.setFirstName(driverElem.getFirstName());
                        formBean.setAuthorizedAgent(ernestRecipientOri.getVendorName() + " - " + driverElem.getFirstName() + " " + driverElem.getLastName() + " (Driver) ");

                        repContactsList.add(formBean);
                    }
                }

                for (Contacts contactElem : allContactsList ) {
                    if(contactElem.getReferenceId() == ernestRecipientOri.getVendorId()){

                        DriverBean formBean = new DriverBean();
                        formBean.setDriverId(contactElem.getContactId());
                        formBean.setLastName(contactElem.getLastName());
                        formBean.setFirstName(contactElem.getFirstName());
                        formBean.setAuthorizedAgent(ernestRecipientOri.getVendorName() + " - " + contactElem.getFirstName() + " " + contactElem.getLastName() + " (Contact Person) ");

                        repContactsList.add(formBean);

                    }
                }

            }

            if(vendor3rdPartyOriginCount > 0) {

                for (String driverOrigin : vendorOrigin) {

                    Vendor vendorEntity = vendorService.findVendorByVendorCode(driverOrigin);

                    if (vendorEntity != null) {
                        // for drivers to add to authorized agent to withdraw
                        for (Driver driverElem : allDriverList) {

                            if (driverElem.getVendorId() == vendorEntity.getVendorId()) {

                                DriverBean formBean = new DriverBean();
                                formBean.setDriverId(driverElem.getDriverId());
                                formBean.setLastName(driverElem.getLastName());
                                formBean.setFirstName(driverElem.getFirstName());
                                Vendor insideEntity = vendorService.findVendorById(driverElem.getVendorId());
                                formBean.setAuthorizedAgent(insideEntity.getVendorName() + " - " + driverElem.getFirstName() + " " + driverElem.getLastName() + " (Driver) ");

                                repContactsList.add(formBean);

                            }

                        }
                        // for vendor contact persons to add to authorized agent to withdraw
                        for (Contacts contactElem : allContactsList) {

                            if(contactElem.getReferenceId() == vendorEntity.getVendorId() && contactElem.getReferenceTable().equals("VENDOR")){

                                DriverBean formBean = new DriverBean();
                                formBean.setDriverId(contactElem.getContactId());
                                formBean.setLastName(contactElem.getLastName());
                                formBean.setFirstName(contactElem.getFirstName());
                                Vendor insideEntity = vendorService.findVendorById(contactElem.getReferenceId());
                                formBean.setAuthorizedAgent(insideEntity.getVendorName() + " - " + contactElem.getFirstName() + " " + contactElem.getLastName() + " (Contact Person) ");

                                repContactsList.add(formBean);

                            }

                        }

                    }

                }

            }

            if(ernestRecipientOri != null){
                shipperContacts = vendorService.findContactByReferenceId(ernestRecipientOri.getVendorId());
            }

            if(ernestRecipientDes != null){
                consigneeContacts = vendorService.findContactByReferenceId(ernestRecipientDes.getVendorId());
            }

        }else if(documentStageParam.equals("FINAL OUTBOUND")){
            Vendor ernestRecipientOri = vendorService.findErnestRecipient("ELC", orderEntity.getOriginationPort());
            Vendor ernestRecipientDes = vendorService.findErnestRecipient("ELC", orderEntity.getDestinationPort());

            vendorLocationFlag = "DESTINATION";

            if(ernestRecipientOri != null){

                if(orderEntity.getServiceType().equals("SHIPPING")){

                    for (Driver driverElem : allDriverList){
                        if(driverElem.getVendorId() == ernestRecipientOri.getVendorId()){

                            DriverBean formBean = new DriverBean();
                            formBean.setDriverId(driverElem.getDriverId());
                            formBean.setLastName(driverElem.getLastName());
                            formBean.setFirstName(driverElem.getFirstName());
                            formBean.setAuthorizedAgent(ernestRecipientOri.getVendorName() + " - " + driverElem.getFirstName() + " " + driverElem.getLastName() + " (Driver) ");

                            repContactsList.add(formBean);
                        }
                    }

                    for(Contacts contactElem : allContactsList){

                        if(contactElem.getReferenceId() == ernestRecipientOri.getVendorId()){

                            DriverBean formBean = new DriverBean();
                            formBean.setDriverId(contactElem.getContactId());
                            formBean.setLastName(contactElem.getLastName());
                            formBean.setFirstName(contactElem.getFirstName());
                            formBean.setAuthorizedAgent(ernestRecipientOri.getVendorName() + " - " + contactElem.getFirstName() + " " + contactElem.getLastName() + " (Contact Person) ");

                            repContactsList.add(formBean);

                        }

                    }

                }

            }

            if(ernestRecipientDes != null){

                for (Driver driverElem : allDriverList){
                    if(driverElem.getVendorId() == ernestRecipientDes.getVendorId()){

                        DriverBean formBean = new DriverBean();
                        formBean.setDriverId(driverElem.getDriverId());
                        formBean.setLastName(driverElem.getLastName());
                        formBean.setFirstName(driverElem.getFirstName());
                        formBean.setAuthorizedAgent(ernestRecipientDes.getVendorName() + " - " + driverElem.getFirstName() + " " + driverElem.getLastName() + " (Driver) ");

                        repContactsList.add(formBean);
                    }
                }

                for(Contacts contactElem : allContactsList){

                    if(contactElem.getReferenceId() == ernestRecipientDes.getVendorId()){

                        DriverBean formBean = new DriverBean();
                        formBean.setDriverId(contactElem.getContactId());
                        formBean.setLastName(contactElem.getLastName());
                        formBean.setFirstName(contactElem.getFirstName());
                        formBean.setAuthorizedAgent(ernestRecipientDes.getVendorName() + " - " + contactElem.getFirstName() + " " + contactElem.getLastName() + " (Contact Person) ");

                        repContactsList.add(formBean);

                    }

                }

            }

            if(vendor3rdPartyDestinationCount > 0){

                for(String driverDestination : vendorDestination) {

                    Vendor vendorEntity = vendorService.findVendorByVendorCode(driverDestination);

                    if(vendorEntity != null){

                        for (Driver driverElem : allDriverList) {

                            if (driverElem.getVendorId() == vendorEntity.getVendorId()) {
                                DriverBean formBean = new DriverBean();

                                formBean.setDriverId(driverElem.getDriverId());
                                formBean.setDriverCode(driverElem.getDriverCode());
                                formBean.setLicenseNumber(driverElem.getLicenseNumber());
                                formBean.setLastName(driverElem.getLastName());
                                formBean.setFirstName(driverElem.getFirstName());
                                formBean.setMiddleName(driverElem.getMiddleName());
                                formBean.setTitle(driverElem.getTitle());
                                formBean.setStatus(driverElem.getStatus());
                                formBean.setCreatedBy(driverElem.getCreatedBy());
                                formBean.setCreatedTimeStamp(driverElem.getCreatedTimestamp());
                                Vendor insideEntity = vendorService.findVendorById(driverElem.getVendorId());
                                formBean.setAuthorizedAgent(insideEntity.getVendorName() + " - " + driverElem.getFirstName() + " " + driverElem.getLastName() + " (Driver) ");

                                repContactsList.add(formBean);

                            }

                        }

                        // for vendor contact persons to add to authorized agent to withdraw
                        for (Contacts contactElem : allContactsList) {

                            if(contactElem.getReferenceId() == vendorEntity.getVendorId() && contactElem.getReferenceTable().equals("VENDOR")){

                                DriverBean formBean = new DriverBean();
                                formBean.setDriverId(contactElem.getContactId());
                                formBean.setLastName(contactElem.getLastName());
                                formBean.setFirstName(contactElem.getFirstName());
                                Vendor insideEntity = vendorService.findVendorById(contactElem.getReferenceId());
                                formBean.setAuthorizedAgent(insideEntity.getVendorName() + " - " + contactElem.getFirstName() + " " + contactElem.getLastName() + " (Contact Person) ");

                                repContactsList.add(formBean);

                            }

                        }

                    }

                }

            }

            if(ernestRecipientOri != null){
                shipperContacts = vendorService.findContactByReferenceId(ernestRecipientOri.getVendorId());
            }

            if(ernestRecipientDes != null){
                consigneeContacts = vendorService.findContactByReferenceId(ernestRecipientDes.getVendorId());
            }

        }

        return SUCCESS;
    }

    public String addDocument() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + document.getDocumentName());
        System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" + document.getReferenceNumber());
        System.out.println("dddddddddddddddddddddddddddddd" + document.getReferenceId());
        System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee" + documentStageParam);
        System.out.println("fffffffffffffffffffffffffffffff" + authorizedRecipient);
        System.out.println("gggggggggggggggggggggggggggggg" + repContactIdParam);
        System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh" + shipperContactIdParam);
        System.out.println("iiiiiiiiiiiiiiiiiiiiiiiiiiiiii" + consigneeContactIdParam);

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

        if(documentName.equals("BOOKING REQUEST FORM") || documentName.equals("HOUSE WAYBILL ORIGIN") || documentName.equals("PROFORMA BILL OF LADING") || documentName.equals("HOUSE WAYBILL DESTINATION")){
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
                        String documentCode = documentsService.findNextControlNo(getClientId(), "HBL"); // HBL for House Bill of Lading Form Document Code
                        documentEntity.setControlNumber(documentCode);

                        documentEntity.setReferenceNumber(documentCode.replace("HBL-",""));

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
                    String documentCode = documentsService.findNextControlNo(getClientId(), "MBL"); // MBL for Master Bill of Lading Form Document Code
                    documentEntity.setControlNumber(documentCode);

                    /*documentEntity.setReferenceNumber(documentCode.replace("MBL-",""));*/

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
                    String documentCode = documentsService.findNextControlNo(getClientId(), "MWO"); // MWO for Master Waybill Origin Form Document Code
                    documentEntity.setControlNumber(documentCode);

                    /*documentEntity.setReferenceNumber(documentCode.replace("MWO-",""));*/

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
                    String documentCode = documentsService.findNextControlNo(getClientId(), "MWD"); // MWD for Master Waybill Destination Form Document Code
                    documentEntity.setControlNumber(documentCode);

                    /*documentEntity.setReferenceNumber(documentCode.replace("MWD-",""));*/

                    documentsService.addDocuments(documentEntity);

                }else{
                    clearErrorsAndMessages();
                    addActionError("No Destination vendor set!");

                    return INPUT;
                }
            }

        }else if(documentName.equals("AUTHORIZATION TO WITHDRAW")){

            if(repContactIdParam == null || shipperContactIdParam == null || consigneeContactIdParam == null){
                documentflag = 8; // Shows error that no document was checked
                sessionAttributes.put("documentflag", documentflag);
                return INPUT;
            }

            Integer vendorIdHolder = 0;
            Driver contactEntity = vendorService.findDriverById(repContactIdParam);

            if(contactEntity != null){
                vendorIdHolder = contactEntity.getVendorId();
            }else{
                Contacts contactElem = vendorService.findContactById(repContactIdParam);
                vendorIdHolder = contactElem.getReferenceId();
            }

            Vendor vendorEntity = vendorService.findVendorById(vendorIdHolder);

            for(OrderItems orderItemElem : orderItemsList){

                if(documentStageParam.equals("OUTBOUND")){

                    try{
                        if(orderItemElem.getVendorOrigin().equals(vendorEntity.getVendorCode()) || vendorEntity.getVendorCode().equals("ELC")){

                            // will delete ATW document if it exists
                            for (Documents freightDocumentElem : bookingDocuments){
                                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                                if(docName.equals("AUTHORIZATION TO WITHDRAW")){
                                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());

                                    if(documentEntity != null) {

                                        if (vendorEntity.getVendorCode().equals("ELC")) {

                                            for (OrderItems orderItemInsideElem : orderItemsList) {
                                                if (documentEntity.getVendorCode().equals("ELC") && documentEntity.getOrderItemId().equals(orderItemInsideElem.getOrderItemId()) && documentEntity.getDocumentStatus().equals("OUTBOUND")) {
                                                    documentsService.deleteDocument(documentEntity);
                                                }
                                            }

                                        } else {

                                            if (documentEntity.getVendorCode().equals(orderItemElem.getVendorOrigin()) && documentEntity.getOrderItemId().equals(orderItemElem.getOrderItemId())) {
                                                documentsService.deleteDocument(documentEntity);
                                            }

                                        }
                                    }
                                }
                            }

                        }

                    }catch(NullPointerException npe){

                        System.out.println("vendor origin is null");
                        npe.printStackTrace();

                    }finally{

                        // will delete ATW document if it exists
                        for (Documents freightDocumentElem : bookingDocuments){
                            String docName = freightDocumentElem.getDocumentName().toUpperCase();
                            if(docName.equals("AUTHORIZATION TO WITHDRAW")){
                                Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());

                                if(documentEntity != null) {

                                    for (OrderItems orderItemInsideElem : orderItemsList) {
                                        if (documentEntity.getVendorCode().equals("ELC") && documentEntity.getDocumentStatus().equals("OUTBOUND")) {
                                            documentsService.deleteDocument(documentEntity);
                                        }
                                    }

                                }
                            }
                        }

                        Documents documentEntity = new Documents();
                        Client client = clientService.findClientById(getClientId().toString());

                        documentEntity.setClient(client);
                        documentEntity.setDocumentName(documentName);
                        documentEntity.setReferenceId(document.getReferenceId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderService.findOrdersById(document.getReferenceId()).getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setOrderItemId(orderItemElem.getOrderItemId());
                        documentEntity.setVendorCode(vendorEntity.getVendorCode());

                        documentEntity.setRepContact(repContactIdParam);
                        documentEntity.setOriContact(shipperContactIdParam);
                        documentEntity.setDesContact(consigneeContactIdParam);

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
                        String documentCode = documentsService.findNextControlNo(getClientId(), "ATW"); // ATW for Authorization to Withdraw Form Document Code
                        documentEntity.setControlNumber(documentCode);

                        documentEntity.setReferenceNumber(documentCode.replace("ATW-", ""));
                        documentEntity.setDocumentType("EMPTY");

                        documentsService.addDocuments(documentEntity);
                    }

                }else if(documentStageParam.equals("FINAL OUTBOUND")){

                    try{
                        if(orderItemElem.getVendorDestination().equals(vendorEntity.getVendorCode()) || vendorEntity.getVendorCode().equals("ELC")){

                            // will delete ATW document if it exists
                            for (Documents freightDocumentElem : bookingDocuments){
                                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                                if(docName.equals("AUTHORIZATION TO WITHDRAW")){
                                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());

                                    if(documentEntity != null) {

                                        if (vendorEntity.getVendorCode().equals("ELC")) {

                                            for (OrderItems orderItemInsideElem : orderItemsList) {
                                                if (documentEntity.getVendorCode().equals("ELC") && documentEntity.getOrderItemId().equals(orderItemInsideElem.getOrderItemId()) && documentEntity.getDocumentStatus().equals("FINAL OUTBOUND")) {
                                                    documentsService.deleteDocument(documentEntity);
                                                }
                                            }

                                        }else{

                                            if (documentEntity.getVendorCode().equals(orderItemElem.getVendorDestination()) && documentEntity.getOrderItemId().equals(orderItemElem.getOrderItemId())) {
                                                documentsService.deleteDocument(documentEntity);
                                            }
                                        }
                                    }
                                }
                            }

                        }

                    }catch(NullPointerException npe){

                        System.out.println("vendor destination is null");
                        npe.printStackTrace();

                    }finally{

                        if(!orderEntity.getServiceType().equals("SHIPPING")){
                            // will delete ATW document if it exists
                            for (Documents freightDocumentElem : bookingDocuments){
                                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                                if(docName.equals("AUTHORIZATION TO WITHDRAW")){
                                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());

                                    if(documentEntity != null) {

                                        for (OrderItems orderItemInsideElem : orderItemsList) {
                                            if (documentEntity.getVendorCode().equals("ELC") && documentEntity.getDocumentStatus().equals("FINAL OUTBOUND")) {
                                                documentsService.deleteDocument(documentEntity);
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Documents documentEntity = new Documents();
                        Client client = clientService.findClientById(getClientId().toString());

                        documentEntity.setClient(client);
                        documentEntity.setDocumentName(documentName);
                        documentEntity.setReferenceId(document.getReferenceId());
                        documentEntity.setReferenceTable("ORDERS");
                        documentEntity.setOrderNumber(orderService.findOrdersById(document.getReferenceId()).getOrderNumber());
                        documentEntity.setCreatedDate(new Date());
                        documentEntity.setOrderItemId(orderItemElem.getOrderItemId());
                        documentEntity.setVendorCode(vendorEntity.getVendorCode());

                        documentEntity.setRepContact(repContactIdParam);
                        documentEntity.setOriContact(shipperContactIdParam);
                        documentEntity.setDesContact(consigneeContactIdParam);

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
                        String documentCode = documentsService.findNextControlNo(getClientId(), "ATW"); // ATW for Authorization to Withdraw Form Document Code
                        documentEntity.setControlNumber(documentCode);

                        documentEntity.setReferenceNumber(documentCode.replace("ATW-", ""));
                        documentEntity.setDocumentType("LADEN");

                        documentsService.addDocuments(documentEntity);

                    }
                }
            }

        }else if(documentName.equals("ACCEPTANCE RECEIPT")){

            // will delete all existing Acceptance Receipt documents
            for (Documents freightDocumentElem : bookingDocuments){
                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                if(docName.equals("ACCEPTANCE RECEIPT")){
                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                    documentsService.deleteDocument(documentEntity);
                }
            }

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
                    String documentCode = documentsService.findNextControlNo(getClientId(), "ARF"); // ARF for Acceptance Receipt Form Document Code
                    documentEntity.setControlNumber(documentCode);

                    documentEntity.setReferenceNumber(documentCode.replace("ARF-",""));

                    documentsService.addDocuments(documentEntity);

                }else{
                    clearErrorsAndMessages();
                    addActionError("No Shipping vendor set!");

                    return INPUT;
                }
            }

        }else if(documentName.equals("RELEASE ORDER")){

            // will delete all existing Release Order documents
            for (Documents freightDocumentElem : bookingDocuments){
                String docName = freightDocumentElem.getDocumentName().toUpperCase();
                if(docName.equals("RELEASE ORDER")){
                    Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                    documentsService.deleteDocument(documentEntity);
                }
            }

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
                    String documentCode = documentsService.findNextControlNo(getClientId(), "ROF"); // ROF for Release Order Form Document Code
                    documentEntity.setControlNumber(documentCode);

                    documentEntity.setReferenceNumber(documentCode.replace("ROF-",""));

                    documentsService.addDocuments(documentEntity);

                }else{
                    clearErrorsAndMessages();
                    addActionError("No Shipping vendor set!");

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

        List<Documents> allDocuments = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : allDocuments) {
            documentElem.setDocumentStatus("COMPLETED");
            documentElem.setArchiveStage(1);
            documentsService.updateDocument(documentElem);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String processDocumentsDecision() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println(".............................CHECK WORD PASS " + checkString);
        System.out.println(".............................DOCUMENT ITEM " + documentItem);
        System.out.println(".............................ORDER ID PARAM " + orderIdParam);
        System.out.println(".............................STAGE PARAM " + documentStageParam);

        if(checkString != null){
            if(documentStageParam.equals("OUTBOUND")){
                sessionAttributes.put("checkString", checkString);
                sessionAttributes.put("documentItem", documentItem);
                sessionAttributes.put("orderIdParam", orderIdParam);
                sessionAttributes.put("documentStageParam", documentStageParam);
                return "OUTBOUND";
            }else if(documentStageParam.equals("INBOUND")){
                sessionAttributes.put("checkString", checkString);
                sessionAttributes.put("documentItem", documentItem);
                sessionAttributes.put("orderIdParam", orderIdParam);
                sessionAttributes.put("documentStageParam", documentStageParam);
                return "INBOUND";
            }else if(documentStageParam.equals("FINAL OUTBOUND")){
                sessionAttributes.put("checkString", checkString);
                sessionAttributes.put("documentItem", documentItem);
                sessionAttributes.put("orderIdParam", orderIdParam);
                sessionAttributes.put("documentStageParam", documentStageParam);
                return "FINAL OUTBOUND";
            }else if(documentStageParam.equals("FINAL INBOUND")){
                sessionAttributes.put("checkString", checkString);
                sessionAttributes.put("documentItem", documentItem);
                sessionAttributes.put("orderIdParam", orderIdParam);
                sessionAttributes.put("documentStageParam", documentStageParam);
                return "FINAL INBOUND";
            }else{
                sessionAttributes.put("checkString", checkString);
                sessionAttributes.put("documentItem", documentItem);
                sessionAttributes.put("orderIdParam", orderIdParam);
                sessionAttributes.put("documentStageParam", documentStageParam);
                return "COMPLETE";
            }
        }else{
            sessionAttributes.put("orderIdParam", orderIdParam);
            documentflag = 7; // Shows error that no document was checked
            sessionAttributes.put("documentflag", documentflag);

            return "INPUT";
        }
    }

    public String deleteDocument() {
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        documentsService.deleteDocument(documentEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String confirmDocumentModal(){

        System.out.println(".............................CHECK WORD PASS " + checkString);
        System.out.println(".............................DOCUMENT ITEM " + documentItem);
        System.out.println(".............................ORDER ID PARAM " + orderIdParam);
        System.out.println(".............................STAGE PARAM " + documentStageParam);

        if(checkString != null){
            String str = checkString;

            ArrayList docsList = new ArrayList(Arrays.asList(str.split(",")));

            for(int i=0; i<docsList.size(); i++){

                System.out.println(" ---------------------------> " + docsList.get(i));

                Integer documentIdHolder = Integer.parseInt(docsList.get(i).toString());

                Documents documentEntity = documentsService.findDocumentById(documentIdHolder);

                confirmDocuments.add(transformDocumentsToFormBean(documentEntity));
            }
        }
        return SUCCESS;
    }

    public String finalOutboundSent(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("------------------ORDER ID" + orderIdParam);
        System.out.println("------------------DATE SENT" + dateSentFinalOutbound);
        System.out.println("------------------TRACKING NUMBER" + finalOutboundTrackingNumber);

        Documents brfDocument = documentsService.findDocumentNameAndOrderId("BOOKING REQUEST FORM",orderIdParam);

        brfDocument.setFinalOutboundSent(dateSentFinalOutbound);
        brfDocument.setFinalOutboundLbc(finalOutboundTrackingNumber);

        documentsService.updateDocument(brfDocument);

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
        System.out.println("---------------------------------------=====" + orderIdParam);

        Map sessionAttributes = ActionContext.getContext().getSession();

        Documents brfDocument = documentsService.findDocumentNameAndOrderId("BOOKING REQUEST FORM",orderIdParam);

        brfDocument.setInboundReturned(dateReturnedInbound);

        documentsService.updateDocument(brfDocument);

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

        Documents brfDocument = documentsService.findDocumentNameAndOrderId("BOOKING REQUEST FORM",orderIdParam);

        brfDocument.setFinalInboundReturned(dateReturnedFinalInbound);
        brfDocument.setFinalInboundLbc(finalInboundTrackingNumber);

        documentsService.updateDocument(brfDocument);

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
        entity.setRepContact(formBean.getRepContact());
        entity.setOriContact(formBean.getOriContact());
        entity.setDesContact(formBean.getDesContact());

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
        formBean.setOrderDate(entity.getOrderDate());

        //get shipper's name
        Contacts shipperContactName = customerService.findContactById(entity.getShipperContactId());
        Customer customerName = customerService.findCustomerById(shipperContactName.getReferenceId());
        formBean.setCustomerName((customerName.getCustomerName()));
        formBean.setServiceRequirement(entity.getServiceRequirement());
        formBean.setModeOfService(entity.getServiceMode());

        //get consignee name
        Contacts consigneeName = customerService.findContactById(entity.getConsigneeContactId());
        formBean.setConsigneeName(consigneeName.getCompanyName());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));
        formBean.setOrderId(entity.getOrderId());
        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());
        formBean.setModeOfPayment(entity.getPaymentMode());
        formBean.setNotifyBy(entity.getNotificationType());
        formBean.setBookingDate(entity.getOrderDate());
        formBean.setRates(entity.getRates());
        formBean.setComments(entity.getComments());
        formBean.setAging(entity.getAging());

        if(entity.getOriginationPort() != null){
            formBean.setOriginationPort(entity.getOriginationPort());
        }else if(entity.getServiceMode().equals("DELIVERY")){
            formBean.setOriginationPort("NOT APPLICABLE");
        }else{
            formBean.setOriginationPort("NONE");
        }

        if(entity.getDestinationPort() != null){
            formBean.setDestinationPort(entity.getDestinationPort());
        }else if(entity.getServiceMode().equals("PICKUP")){
            formBean.setDestinationPort("NOT APPLICABLE");
        }else{
            formBean.setDestinationPort("NONE");
        }

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

        if(entity.getPickupDate() != null){
            formBean.setStrPickupDate(formatter.format(entity.getPickupDate()));
        }else if(entity.getServiceMode().equals("DELIVERY")){
            formBean.setStrPickupDate("NOT APPLICABLE");
        }else{
            formBean.setStrPickupDate("NONE");
        }

        if(entity.getDeliveryDate() != null){
            formBean.setStrDeliveryDate(formatter.format(entity.getDeliveryDate()));
        }else if(entity.getServiceMode().equals("PICKUP")){
            formBean.setStrDeliveryDate("NOT APPLICABLE");
        }else{
            formBean.setStrDeliveryDate("NONE");
        }

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
        if (entity.getShipperAddressId() != null && !"".equals(entity.getShipperAddressId())) {
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
        if (entity.getConsigneeAddressId() != null && !"".equals(entity.getConsigneeAddressId())) {
            Address consigneeAddress = customerService.findAddressById(entity.getConsigneeAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(consigneeAddress));
            formBean.setConsigneeInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            formBean.setConsigneeInfoAddress(address);
        }

        List <Documents> documentsList = documentsService.findDocumentsByOrderId(entity.getOrderId());
        List <Documents> documentsComplete = documentsService.findDocumentByArchiveStageAndID(1,entity.getOrderId());

        if(documentsList == documentsComplete){
            formBean.setDocumentCheck("ARCHIVED");
        }else{
            formBean.setDocumentCheck("ON-GOING");
        }

        Documents brfDocument = documentsService.findDocumentNameAndOrderId("BOOKING REQUEST FORM", entity.getOrderId());

        if(brfDocument.getFinalOutboundSent() != null){
            String todayDate = (formatter.format(new Date()));
            String finalOutboundDate = (formatter.format(brfDocument.getFinalOutboundSent()));

            Date d1 = null;
            Date d2 = null;

            try {
                d1 = formatter.parse(todayDate);
                d2 = formatter.parse(finalOutboundDate);
                System.out.println(d1 + " Date Today");
                System.out.println(d2 + " Final Outbound Date");

                long diff = d1.getTime() - d2.getTime();

                long diffSeconds = diff / 1000 % 60;
                long diffMinutes = diff / (60 * 1000) % 60;
                long diffHours = diff / (60 * 60 * 1000) % 24;
                long diffDays = diff / (24 * 60 * 60 * 1000);

                System.out.println(diffDays + " days");
                System.out.println(diffHours + " hours");
                System.out.println(diffMinutes + " minutes");
                System.out.println(diffSeconds + " seconds");

                //formBean.setAging(Integer.parseInt(String.valueOf(diffDays)));

                int dateDiff = Integer.parseInt(String.valueOf(diffDays));

                if(dateDiff > 0){
                    formBean.setAging(Integer.parseInt(String.valueOf(diffDays)));
                }else{
                    formBean.setAging(0);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }else{
            formBean.setAging(0);
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
            final File outputFile = new File("Proforma Bill of Lading.pdf");

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

    // Equipment Consolidation Manifest
    public String generateConsolidationManifestReport(){

        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        String containerId = (documentEntity.getReferenceId()).toString();

        Map<String, String> params = new HashMap();
        params.put("documentId", documentIdParam.toString());
        params.put("containerId", containerId);

        ByteArrayOutputStream byteArray = null;
        BufferedOutputStream responseOut = null;

        try{
            // Create an output filename
            final File outputFile = new File("Consolidation Manifest.pdf");
            // Generate the report
            MasterReport report = consolidationManifestReportService.generateReport(params);

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

    /*public OrderBean transformOrdersToFormBean(Orders entity) {
        OrderBean formBean = new OrderBean();
        formBean.setOrderId(entity.getOrderId());
        formBean.setOrderDate(entity.getOrderDate());
        formBean.setOrderNumber(entity.getOrderNumber());
        *//*formBean.setCustomerName(entity.getShipperCode());*//*
        //get shipper's name
        Contacts shipperContactName = customerService.findContactById(entity.getShipperContactId());
        Customer customerName = customerService.findCustomerById(shipperContactName.getReferenceId());
        formBean.setCustomerName((customerName.getCustomerName()));
        //get consignee name
        Contacts consigneeName = customerService.findContactById(entity.getConsigneeContactId());
        formBean.setConsigneeName(consigneeName.getCompanyName());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));
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
    }*/

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
        formBean.setFinalInboundLbc(entity.getFinalInboundLbc());
        formBean.setFinalInboundReturned(entity.getFinalInboundReturned());
        formBean.setFinalInboundReceivedBy(entity.getFinalInboundReceivedBy());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setDocumentComments(entity.getDocumentComments());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setAging(entity.getAging());
        formBean.setRepContact(entity.getRepContact());
        formBean.setOriContact(entity.getOriContact());
        formBean.setDesContact(entity.getDesContact());

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

            Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorCode());
            formBean.setVendorCode(vendorEntity.getVendorName());

        }else if(entity.getDocumentName().equals("MASTER WAYBILL DESTINATION")){

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

    /*public void setVesselSchedulesService(VesselSchedulesService vesselSchedulesService) {
        this.vesselSchedulesService = vesselSchedulesService;
    }*/

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

    public Date getDateReturnedFinalInbound() {
        return dateReturnedFinalInbound;
    }

    public void setDateReturnedFinalInbound(Date dateReturnedFinalInbound) {
        this.dateReturnedFinalInbound = dateReturnedFinalInbound;
    }

    public String getStrReturnedFinalInbound() {
        return strReturnedFinalInbound;
    }

    public void setStrReturnedFinalInbound(String strReturnedFinalInbound) {
        this.strReturnedFinalInbound = strReturnedFinalInbound;
    }

    public Date getDateSentFinalOutbound() {
        return dateSentFinalOutbound;
    }

    public void setDateSentFinalOutbound(Date dateSentFinalOutbound) {
        this.dateSentFinalOutbound = dateSentFinalOutbound;
    }

    public String getStrSentFinalOutbound() {
        return strSentFinalOutbound;
    }

    public void setStrSentFinalOutbound(String strSentFinalOutbound) {
        this.strSentFinalOutbound = strSentFinalOutbound;
    }

    public Date getDateReturnedInbound() {
        return dateReturnedInbound;
    }

    public void setDateReturnedInbound(Date dateReturnedInbound) {
        this.dateReturnedInbound = dateReturnedInbound;
    }

    public String getStrReturnedInbound() {
        return strReturnedInbound;
    }

    public void setStrReturnedInbound(String strReturnedInbound) {
        this.strReturnedInbound = strReturnedInbound;
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

    public String getDocumentTabFinalInbound() {
        return documentTabFinalInbound;
    }

    public void setDocumentTabFinalInbound(String documentTabFinalInbound) {
        this.documentTabFinalInbound = documentTabFinalInbound;
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

    public String getCheckString() {
        return checkString;
    }

    public void setCheckString(String checkString) {
        this.checkString = checkString;
    }

    public List<DocumentsBean> getConfirmDocuments() {
        return confirmDocuments;
    }

    public void setConfirmDocuments(List<DocumentsBean> confirmDocuments) {
        this.confirmDocuments = confirmDocuments;
    }

    public String getFinalInboundTrackingNumber() {
        return finalInboundTrackingNumber;
    }

    public void setFinalInboundTrackingNumber(String finalInboundTrackingNumber) {
        this.finalInboundTrackingNumber = finalInboundTrackingNumber;
    }

    public void setConsolidationManifestReportService(ConsolidationManifestReportService consolidationManifestReportService) {
        this.consolidationManifestReportService = consolidationManifestReportService;
    }

    public List<String> getRecipientList() {
        return recipientList;
    }

    public void setRecipientList(List<String> recipientList) {
        this.recipientList = recipientList;
    }

    public String getAuthorizedRecipient() {
        return authorizedRecipient;
    }

    public void setAuthorizedRecipient(String authorizedRecipient) {
        this.authorizedRecipient = authorizedRecipient;
    }

    public String getAuthorizedRepresentative() {
        return authorizedRepresentative;
    }

    public void setAuthorizedRepresentative(String authorizedRepresentative) {
        this.authorizedRepresentative = authorizedRepresentative;
    }

    public List<Contacts> getRepresentativeList() {
        return representativeList;
    }

    public void setRepresentativeList(List<Contacts> representativeList) {
        this.representativeList = representativeList;
    }

    public Contacts getRepContact() {
        return repContact;
    }

    public void setRepContact(Contacts repContact) {
        this.repContact = repContact;
    }

    public List<DriverBean> getRepContactsList() {
        return repContactsList;
    }

    public void setRepContactsList(List<DriverBean> repContactsList) {
        this.repContactsList = repContactsList;
    }

    public Map<Integer, String> getRepContactMap() {
        return repContactMap;
    }

    public void setRepContactMap(Map<Integer, String> repContactMap) {
        this.repContactMap = repContactMap;
    }

    public Map<Integer, String> getRepresentativeMap() {
        return representativeMap;
    }

    public void setRepresentativeMap(Map<Integer, String> representativeMap) {
        this.representativeMap = representativeMap;
    }

    public Integer getRepresentativeIdParam() {
        return representativeIdParam;
    }

    public void setRepresentativeIdParam(Integer representativeIdParam) {
        this.representativeIdParam = representativeIdParam;
    }

    public Integer getRepContactIdParam() {
        return repContactIdParam;
    }

    public void setRepContactIdParam(Integer repContactIdParam) {
        this.repContactIdParam = repContactIdParam;
    }

    public List<Contacts> getShipperContacts() {
        return shipperContacts;
    }

    public void setShipperContacts(List<Contacts> shipperContacts) {
        this.shipperContacts = shipperContacts;
    }

    public List<Contacts> getConsigneeContacts() {
        return consigneeContacts;
    }

    public void setConsigneeContacts(List<Contacts> consigneeContacts) {
        this.consigneeContacts = consigneeContacts;
    }

    public Integer getShipperContactIdParam() {
        return shipperContactIdParam;
    }

    public void setShipperContactIdParam(Integer shipperContactIdParam) {
        this.shipperContactIdParam = shipperContactIdParam;
    }

    public Integer getConsigneeContactIdParam() {
        return consigneeContactIdParam;
    }

    public void setConsigneeContactIdParam(Integer consigneeContactIdParam) {
        this.consigneeContactIdParam = consigneeContactIdParam;
    }

    public String getVendorLocationFlag() {
        return vendorLocationFlag;
    }

    public void setVendorLocationFlag(String vendorLocationFlag) {
        this.vendorLocationFlag = vendorLocationFlag;
    }

    public DriverBean getDriver() {
        return driver;
    }

    public void setDriver(DriverBean driver) {
        this.driver = driver;
    }

    public List<Parameters> getOrderSearchList() {
        return orderSearchList;
    }

    public void setOrderSearchList(List<Parameters> orderSearchList) {
        this.orderSearchList = orderSearchList;
    }
}
