package com.sr.apps.freightbit.customer.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.customer.formbean.ConsigneeBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.customer.formbean.ItemBean;
import com.sr.apps.freightbit.customer.formbean.RatesBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.DocumentsConstants;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Notification;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.exceptions.AddressAlreadyExistsException;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.entity.Rates;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.customer.service.ItemService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import javax.persistence.criteria.Order;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomerAction extends ActionSupport implements Preparable {

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(CustomerAction.class);
    
    private Map sessionAttributes = ActionContext.getContext().getSession();

    private List<CustomerBean> customers = new ArrayList<CustomerBean>();
    private List<AddressBean> addresss = new ArrayList<AddressBean>();
    private List<ItemBean> items = new ArrayList<ItemBean>();
    private List<RatesBean> rates = new ArrayList<RatesBean>();
    private List<ContactBean> contacts = new ArrayList<ContactBean>();
    private List<ConsigneeBean> consignees = new ArrayList<ConsigneeBean>();

    private List<Parameters> customerTypeList = new ArrayList<Parameters>();
    private List<Parameters> customerSearchList = new ArrayList<Parameters>();
    private List<Parameters> addressTypeList = new ArrayList<Parameters>();
    private List<Parameters> rateTypeList = new ArrayList<Parameters>();
    private List<Parameters> contactTypeList = new ArrayList<Parameters>();
    private List<Parameters> portsList = new ArrayList<Parameters>();

    private Integer customersItemIdParam;
    private String customerCodeParam;
    private Integer addressIdParam;
    private String keyword; //search keyword for customer
    private String searchType; // get the search type
    private String customerKeyword;
    private Integer ratesIdParam;
    private Integer contactCodeParam;
    private Integer customerIdParam;
    private Integer consigneeContactCodeParam;

    private CustomerBean customer = new CustomerBean();
    private ItemBean item = new ItemBean();
    private AddressBean address = new AddressBean();
    private RatesBean rate = new RatesBean();
    private ContactBean contact = new ContactBean();
    private ConsigneeBean consignee = new ConsigneeBean();
    private ContactBean consigneeContact = new ContactBean();

    private CustomerService itemService;
//    private ItemService itemServices;
    private CustomerService customerService;
    private ClientService clientService;
    private ParameterService parameterService;
    private NotificationService notificationService;
    private CommonUtils commonUtils;
    private DocumentsService documentsService;
    private OrderService orderService;

    // customer module checkboxes values
    private boolean customer_dti;
    private boolean customer_mayorsPermit;
    private boolean customer_aaf;
    private boolean customer_signatureCard;


    ////// START OF ITEMS ///////////////

    public String addItem() throws Exception {
        validateOnSubmitItem(item);
        if (hasFieldErrors()) {
            return INPUT;
        }

        Items itemEntity = transformToEntityBeanItem(item);
        itemEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        itemEntity.setCreatedBy(commonUtils.getUserNameFromSession());
        itemEntity.setCreatedTimeStamp(new Date());
        customerService.addItem(itemEntity);

        return SUCCESS;
    }

    public String editItem() {
        validateOnSubmitItem(item);
        if (hasFieldErrors()) {
            return INPUT;
        }

        Items itemEntity = transformToEntityBeanItem(item);

        List<OrderItems> orderItemsInBooking = orderService.findOrderItemByName(itemEntity.getItemCode());

        if(orderItemsInBooking.size() > 0){

            Integer customerId = getCustomerSessionId();
            List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
            for (Items itemsElem : itemEntityList) {
                items.add(transformToFormBeanItem(itemsElem));
            }

            clearErrorsAndMessages();
            addActionError("You cannot edit a Customer item associated with a Booking");
            return INPUT;
        }

        itemEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        itemEntity.setModifiedTimeStamp(new Date());
        customerService.updateItems(itemEntity);

        return SUCCESS;
    }

    public String loadAddItem() {
        return SUCCESS;
    }

    public String loadEditItem() {
        Items itemEntity = customerService.findItemByCustomerItemsId(customersItemIdParam);
        item = transformToFormBeanItem(itemEntity);
        return SUCCESS;
    }

    public String loadSaveCompleteItem() {
        Integer customerId = getCustomerSessionId();
        List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
        for (Items itemsElem : itemEntityList) {
            items.add(transformToFormBeanItem(itemsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Items has been updated.");

        return SUCCESS;
    }

    public void validateOnSubmitItem(ItemBean itemBean) {
        clearErrorsAndMessages();

        String PATTERN = "[A-Za-z]+";
        String PATTERN2 = "[0-9^.]+";
        String PATTERN3 = "[A-Z]{3}+";
        String PATTERN4 = "[A-Za-z0-9 ]+";
        Pattern pattern1 = Pattern.compile(PATTERN);
        Pattern pattern2 = Pattern.compile(PATTERN2);
        Pattern pattern3 = Pattern.compile(PATTERN3);
        Pattern pattern4 = Pattern.compile(PATTERN4);

        Matcher matcher = pattern3.matcher(itemBean.getItemCode());
        //Matcher matcher1 = pattern2.matcher(itemBean.getSrp());
        /*if (!matcher.matches()) {
            addFieldError("item.itemCode", getText("err.regex.validation.itemcode"));
        }*/

        Matcher matcher1 = pattern4.matcher(itemBean.getItemName());
        if(!matcher1.matches()){
            addFieldError("item.itemName", getText("Special Characters in item name is not valid"));
        }

        Matcher matcher2 = pattern2.matcher(itemBean.getWeight().toString());
        if(!matcher2.matches()){
            addFieldError("item.basePrice", getText("Special Characters in base price is not valid"));
        }

//        Matcher matcher3 = pattern2.matcher(itemBean.getCriticalQuality().toString());
//        if(!matcher3.matches()){
//            addFieldError("item.criticalQuality", getText("Special Characters in Quality is not valid"));
//        }

        Matcher matcher4 = pattern2.matcher(itemBean.getWidth().toString());
        if(!matcher4.matches()){
            addFieldError("item.width", getText("Special Characters in width is not valid"));
        }

        Matcher matcher5 = pattern2.matcher(itemBean.getSrp().toString());
        if(!matcher5.matches()){
            addFieldError("item.srp", getText("Special Characters in SRP is not valid"));
        }

        Matcher matcher6 = pattern2.matcher(itemBean.getLength().toString());
        if(!matcher6.matches()){
            addFieldError("item.length", getText("Special Characters in length is not valid"));
        }

        Matcher matcher7 = pattern2.matcher(itemBean.getHeight().toString());
        if(!matcher7.matches()){
            addFieldError("item.height", getText("Special Characters in height is not valid"));
        }

        if (StringUtils.isBlank(itemBean.getItemCode())) {
            addFieldError("item.itemCode", getText("err.itemCode.required"));
        }

        if (StringUtils.isBlank(itemBean.getItemName())) {
            addFieldError("item.itemName", getText("err.itemName.required"));
        }

        if (itemBean.getSrp() == null) {
            addFieldError("item.srp", getText("err.srp.required"));
        }

        if (itemBean.getLength() == null) {
            addFieldError("item.length", getText("err.length.required"));
        }
        if (itemBean.getWidth() == null) {
            addFieldError("item.width", getText("err.width.required"));
        }
        /*if (itemBean.getCriticalQuality() == null) {
            addFieldError("item.criticalQuality", getText("err.criticalQuality.required"));
        }*/
        if (itemBean.getWeight() == null) {
            addFieldError("item.basePrice", getText("err.basePrice.required"));
        }
//        if (StringUtils.isBlank(itemBean.getDescription())) {
//            addFieldError("item.description", getText("err.description.required"));
//        }
    }

    public String deleteItem() {
        Items itemEntity = customerService.findItemByCustomerItemsId(customersItemIdParam);

        /*List<OrderItems> orderItemsInBooking = orderService.findOrderItemByName(itemEntity.getItemName());*/

        List<OrderItems> orderItemsInBooking = orderService.findOrderItemByName(itemEntity.getItemCode());

        if(orderItemsInBooking.size() > 0){

            Integer customerId = getCustomerSessionId();
            List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
            for (Items itemsElem : itemEntityList) {
                items.add(transformToFormBeanItem(itemsElem));
            }

            clearErrorsAndMessages();
            addActionError("You cannot delete a Customer item associated with a Booking");
            return INPUT;
        }

        /*for(OrderItems orderItemElem : orderItemsInBooking){
            Orders orderEntity = orderService.findOrdersById(orderItemElem.getOrderId());
            if(orderEntity.getCustomerId().equals(itemEntity.getCustomerId())){

                Integer customerId = getCustomerSessionId();
                List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
                for (Items itemsElem : itemEntityList) {
                    items.add(transformToFormBeanItem(itemsElem));
                }


            }
        }*/

        customerService.deleteItem(itemEntity);
        return SUCCESS;
    }

    public String loadSuccessItemDelete() {
        Integer customerId = getCustomerSessionId();
        List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
        for (Items itemsElem : itemEntityList) {
            items.add(transformToFormBeanItem(itemsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Items has been deleted.");

        return SUCCESS;
    }

    public String viewItems() {
        Integer customerId = getCustomerSessionId();
        List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
        for (Items itemsElem : itemEntityList) {
            items.add(transformToFormBeanItem(itemsElem));
        }
        return SUCCESS;
    }

    public ItemBean transformToFormBeanItem(Items entity) {

        ItemBean formBean = new ItemBean();
        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerItemsId(entity.getCustomerItemsId());
        formBean.setCriticalQuality(entity.getCriticalQuality());
        formBean.setItemCode(entity.getItemCode());
        formBean.setItemName(entity.getItemName());
        formBean.setSrp(entity.getSrp());
        formBean.setLength(entity.getLength());
        formBean.setWidth(entity.getWidth());
        formBean.setHeight(entity.getHeight());
        formBean.setWeight(entity.getWeight());
        formBean.setNote(entity.getNote());
        formBean.setDescription(entity.getDescription());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimeStamp());

        return formBean;
    }

    public Items transformToEntityBeanItem(ItemBean formBean) {

        Items entity = new Items();
        entity.setClientId(commonUtils.getClientId());

        if (formBean.getCustomerItemsId() != null)
            entity.setCustomerItemsId(new Integer(formBean.getCustomerItemsId()));

        entity.setItemName(formBean.getItemName());
        entity.setItemCode(formBean.getItemCode());
        entity.setCustomerId(getCustomerSessionId());
        entity.setSrp(formBean.getSrp());
        entity.setLength(formBean.getLength());
        entity.setWidth(formBean.getWidth());
        entity.setHeight(formBean.getHeight());
        entity.setCriticalQuality(formBean.getCriticalQuality());
        entity.setWeight(formBean.getWeight());
        entity.setNote(formBean.getNote());
        entity.setDescription(formBean.getDescription());
        System.out.println("----------------------" + formBean.getCreatedBy() + "-----------------------------");
        entity.setCreatedBy(formBean.getCreatedBy());
        System.out.println("----------------------" + formBean.getCreatedTimeStamp() + "-----------------------------");
        entity.setCreatedTimeStamp(formBean.getCreatedTimeStamp());

        return entity;
    }

    //////////// END OF ITEMS //////////////
    // DONE WITH MODIFY and CREATE BY

    public String loadSearchCustomerPage() {
        return SUCCESS;
    }

    public String customerInfo() {
        Customer customerEntity = new Customer();
        if (!StringUtils.isBlank(customerCodeParam))
            customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        else
            customerEntity = customerService.findCustomerById(getCustomerSessionId());
        customer = transformToFormBean(customerEntity);
        sessionAttributes.put("customerId", customer.getCustomerId());
        return SUCCESS;
    }

    public String loadAddCustomerPage() {
        return SUCCESS;
    }

    public String loadEditCustomerPage() {
        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customer = transformToFormBean(customerEntity);
        sessionAttributes.put("customerId", customer.getCustomerId());
        return SUCCESS;
    }

    public String searchCustomers() {
        String column = getColumnFilter();
        List<Customer> customerEntityList = new ArrayList<Customer>();

        if (StringUtils.isNotBlank(column)) {
            customerEntityList = customerService.findCustomersByCriteria(column, customer.getCustomerKeyword(), getClientId());

        } else {
            customerEntityList = customerService.findAllCustomer();
        }

        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }

        return SUCCESS;
    }

    public String getColumnFilter() {
        String column = "";
        if ("customerName".equals(customer.getCustomerSearchCriteria())) {
            column = "customerName";
        } else if ("customerCode".equals(customer.getCustomerSearchCriteria())) {
            column = "customerCode";
        } else if ("customerType".equals(customer.getCustomerSearchCriteria())) {
            column = "customerType";
        } else if ("email".equals(customer.getCustomerSearchCriteria())) {
            column = "email";
        }
        return column;
    }

    public String deleteCustomer() {
        List<Orders> orderEntityList = orderService.findCustomerWithBooking(customerIdParam);

        if(orderEntityList.size()>0){
            clearErrorsAndMessages();
            addActionError("You cannot delete a Customer associated with a Booking");
            return INPUT;
        }

        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customerService.deleteCustomer(customerEntity);

        clearErrorsAndMessages();
        addActionMessage("Success! Customer has been deleted.");
        return SUCCESS;
    }

    public String loadSuccessDeleteCustomer() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        clearErrorsAndMessages();
        addActionMessage("Success! Customer has been deleted.");
        return SUCCESS;
    }

    public String loadFailedDeleteCustomer() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        clearErrorsAndMessages();
        addActionError("You cannot delete a Customer with an on-going booking");
        return SUCCESS;
    }

    public String loadFailedDeleteConsignee() {
        /*List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }*/

        Integer customerId = getCustomerSessionId();
        List<Contacts> contactsList = customerService.findContactByParameterMap(customerId, "CONSIGNEE", getClientId());

        if (contactsList != null) {
            for (int i = 0; i < contactsList.size(); i++) {
                Contacts contactConsignee = contactsList.get(i);
                Address addressConsignee = customerService.findAddressByParameterMap(customerId, "CONSIGNEE", getClientId(), contactConsignee.getContactId());
                consignees.add(transformToFormBeanConsignee(addressConsignee, contactConsignee));
            }
        }

        clearErrorsAndMessages();
        addActionError("You cannot delete a Consignee with an on-going booking");

        return SUCCESS;
    }

    public String loadEditCustomer() {
        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customer = transformToFormBean(customerEntity);
        return SUCCESS;
    }

    public String editCustomer() {
        validateOnSubmit(customer);
        if (hasActionErrors()) {
            return INPUT;
        }

        try {
            // to get the old customer code
            Customer CustomerOldEntity = customerService.findCustomerById(customer.getCustomerId());
            String oldCode = CustomerOldEntity.getCustomerCode();
            // customer to save
            Customer customerEntity = transformToEntityBean(customer);
            customerEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            customerEntity.setModifiedTimestamp(new Date());
            customerService.updateCustomer(customerEntity);
            // loop to change all order number to the new code begin
            if(oldCode != customerEntity.getCustomerCode()){
                List <Orders> orderEntityList = orderService.findCustomerWithBooking(customerEntity.getCustomerId());
                // All booking number will be changed to the new code
                for(Orders orderParam : orderEntityList){

                    /*--------------------- BOOKING ------------------------------*/

                    String bookingNumber = orderParam.getOrderNumber();
                    String changeCode = bookingNumber.replace(oldCode, customerEntity.getCustomerCode());
                    Orders insideOrderEntity = orderService.findOrdersById(orderParam.getOrderId());

                    Orders entity = new Orders();

                    Client client = clientService.findClientById(getClientId().toString());
                    entity.setClient(client);
                    entity.setOrderNumber(changeCode);

                    if(insideOrderEntity.getOrderId() != null){
                        entity.setOrderId(new Integer((insideOrderEntity.getOrderId())));
                    }

                    entity.setServiceRequirement(insideOrderEntity.getServiceRequirement());
                    entity.setServiceType(insideOrderEntity.getServiceType());
                    entity.setOrderDate(insideOrderEntity.getOrderDate());
                    entity.setServiceMode(insideOrderEntity.getServiceMode());
                    entity.setNotificationType(insideOrderEntity.getNotificationType());
                    entity.setPaymentMode(insideOrderEntity.getPaymentMode());
                    entity.setOriginationPort(insideOrderEntity.getOriginationPort());
                    entity.setDestinationPort(insideOrderEntity.getDestinationPort());
                    entity.setComments(insideOrderEntity.getComments());

                    if (insideOrderEntity.getOrderStatus() != null) {
                        entity.setOrderStatus(insideOrderEntity.getOrderStatus());
                    } else {
                        entity.setOrderStatus("INCOMPLETE");
                    }

                    entity.setRates(00.00); // still to be updated
                    entity.setCreatedBy(commonUtils.getUserNameFromSession());
                    entity.setAccountRep(commonUtils.getUserNameFromSession());
                    entity.setModifiedBy(commonUtils.getUserNameFromSession());
                    entity.setCreatedTimestamp(insideOrderEntity.getCreatedTimestamp());
                    entity.setModifiedTimestamp(new Date());
                    entity.setShipperAddressId(insideOrderEntity.getShipperAddressId());
                    entity.setShipperContactId(insideOrderEntity.getShipperContactId());
                    entity.setConsigneeAddressId(insideOrderEntity.getConsigneeAddressId());
                    entity.setConsigneeContactId(insideOrderEntity.getConsigneeContactId());
                    entity.setDeliveryDate(insideOrderEntity.getDeliveryDate());
                    entity.setPickupDate(insideOrderEntity.getPickupDate());
                    entity.setConsigneeContactPersonId(insideOrderEntity.getConsigneeContactPersonId());
                    entity.setCustomerId(insideOrderEntity.getCustomerId());

                    orderService.updateOrder(entity);

                    /*--------------------- BOOKING ------------------------------*/

                    /*--------------------- DOCUMENTS ------------------------------*/

                    List<Documents> documentsEntityList = documentsService.findDocumentsByOrderNumber(bookingNumber);

                    for(Documents documentsElem : documentsEntityList){

                        Documents insideDocumentEntity = documentsService.findDocumentById(documentsElem.getDocumentId());

                        Documents documentEntity = new Documents();

                        if(insideDocumentEntity.getDocumentId() != null){
                            documentEntity.setDocumentId(new Integer(insideDocumentEntity.getDocumentId()));
                        }

                        documentEntity.setClient(client);
                        documentEntity.setDocumentName(insideDocumentEntity.getDocumentName());
                        documentEntity.setDocumentType(insideDocumentEntity.getDocumentType());
                        documentEntity.setReferenceId(insideDocumentEntity.getReferenceId());
                        documentEntity.setReferenceTable(insideDocumentEntity.getReferenceTable());
                        documentEntity.setOrderNumber(changeCode);
                        documentEntity.setCreatedDate(insideDocumentEntity.getCreatedDate());
                        documentEntity.setDocumentStatus(insideDocumentEntity.getDocumentStatus());
                        documentEntity.setDocumentProcessed(insideDocumentEntity.getDocumentProcessed());
                        documentEntity.setReferenceNumber(insideDocumentEntity.getReferenceNumber());
                        documentEntity.setOutboundStage(insideDocumentEntity.getOutboundStage());
                        documentEntity.setInboundStage(insideDocumentEntity.getInboundStage());
                        documentEntity.setFinalOutboundStage(insideDocumentEntity.getFinalOutboundStage());
                        documentEntity.setFinalInboundStage(insideDocumentEntity.getFinalInboundStage());
                        documentEntity.setCompleteStage(insideDocumentEntity.getCompleteStage());
                        documentEntity.setArchiveStage(insideDocumentEntity.getArchiveStage());
                        documentEntity.setBillingStage(insideDocumentEntity.getBillingStage());
                        documentEntity.setInboundReturned(insideDocumentEntity.getInboundReturned());
                        documentEntity.setFinalOutboundSent(insideDocumentEntity.getFinalOutboundSent());
                        documentEntity.setFinalInboundReturned(insideDocumentEntity.getFinalInboundReturned());
                        documentEntity.setFinalOutboundLbc(insideDocumentEntity.getFinalOutboundLbc());
                        documentEntity.setFinalInboundReceivedBy(insideDocumentEntity.getFinalInboundReceivedBy());
                        documentEntity.setCreatedBy(insideDocumentEntity.getCreatedBy());
                        documentEntity.setDocumentComments(insideDocumentEntity.getDocumentComments());
                        documentEntity.setVendorCode(insideDocumentEntity.getVendorCode());
                        documentEntity.setOrderItemId(insideDocumentEntity.getOrderItemId());
                        documentEntity.setAging(insideDocumentEntity.getAging());

                        documentsService.updateDocument(documentEntity);
                        documentsService.updateDocument(documentEntity);
                        }
                    /*--------------------- DOCUMENTS ------------------------------*/
                }
            }
            // loop to change all order number to the new code end

        } catch (CustomerAlreadyExistsException e) {
            addFieldError("customer.customerCode", getText("Company Code Already Exists"));
            return INPUT;
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Customer has been updated.");
        return SUCCESS;
    }

    public String addCustomer() throws Exception {
        validateOnSubmit(customer);
        if (hasFieldErrors())
            return INPUT;

        try {
            Customer customerEntity = transformToEntityBean(customer);
            customerEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            customerEntity.setCreatedTimestamp(new Date());
            customerEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            customerService.addCustomer(customerEntity);

            Notification notificationEntity = new Notification();
            notificationEntity.setDescription("CUSTOMER");
            notificationEntity.setNotificationId(1);
            notificationEntity.setNotificationType("Email");
            notificationEntity.setReferenceId(1);
            notificationEntity.setReferenceTable("Customer");
            notificationEntity.setUserId(1);

            notificationService.addNotification(notificationEntity);

        }catch(CustomerAlreadyExistsException e) {
            addFieldError("customer.customerCode", getText("Company Code Already Exists"));
            return INPUT;
        }

        clearErrorsAndMessages();
        addActionMessage("Success! New Customer has been added.");
        return SUCCESS;
    }


    public String customerList() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        return SUCCESS;
    }
    // used to display the list Deleting the Notification on dashboard
    public String customerListNew() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        notificationService.clearNewCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));

        }
        return SUCCESS;
    }
    // used to display the list with ActionMessage
    public String loadAddCustomerList() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        clearErrorsAndMessages();
        addActionMessage("Success! New Customer has been added.");
        return SUCCESS;
    }

    public void validateOnSubmit(CustomerBean customerBean) {
        clearErrorsAndMessages();
//
//        String alpha = "^[a-zA-Z][a-zA-Z ]+$";
//        Pattern namePattern = Pattern.compile(alpha);

//        Matcher matcher = namePattern.matcher(customerBean.getCustomerName());
//        if (!matcher.matches()){
//            addFieldError("customer.customerName", "(Must be three (3) CAPITAL LETTERS only)");
//        }

        if (StringUtils.isBlank(customerBean.getCustomerName())) {
            addFieldError("customer.customerName", getText("err.customerName.required"));
        }
        if (StringUtils.isBlank(customerBean.getPhone())) {
            addFieldError("customer.phone", getText("err.phone.required"));
        }
        if (StringUtils.isBlank(customerBean.getMobile())) {
            addFieldError("customer.mobile", getText("err.mobile.required"));
        }
        if (StringUtils.isBlank(customerBean.getEmail())) {
            addFieldError("customer.email", getText("err.email.required"));
        }
    }
    
    private CustomerBean transformToFormBean(Customer entity) {

        CustomerBean formBean = new CustomerBean();
        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerCode(entity.getCustomerCode());
        formBean.setCustomerName(entity.getCustomerName());
        formBean.setCustomerType(entity.getCustomerType());
        formBean.setPhone(entity.getPhone());
        formBean.setEmail(entity.getEmail());
        formBean.setWebsite(entity.getWebsite());
        formBean.setFax(entity.getFax());
        formBean.setMobile(entity.getMobile());
        formBean.setDti(entity.getDti());
        formBean.setMayorsPermit(entity.getMayorsPermit());
        formBean.setAaf(entity.getAaf());
        formBean.setSignatureCard(entity.getSignatureCard());

//        /*Dti Checkbox*/
//        if (entity.getDti() == 1 ){
//            formBean.setDti(1);
//        }else {
//            formBean.setDti(0);
//        }
//
//        /*Mayor's Permit Checkbox*/
//        if (entity.getMayorsPermit() == 1 ){
//            formBean.setMayorsPermit(1);
//        }else {
//            formBean.setMayorsPermit(0);
//        }
//
//        /*Account Application Form Checkbox*/
//        if (entity.getAaf() == 1 ){
//            formBean.setAaf(1);
//        }else {
//            formBean.setAaf(0);
//        }
//
//        /*Signature Card Checkbox*/
//        if (entity.getSignatureCard() == 1 ){
//            formBean.setSignatureCard(1);
//        }else {
//            formBean.setSignatureCard(0);
//        }

        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setServiceArea(entity.getServiceArea());

        return formBean;
    }

    /*Dti Checkbox*/
    public boolean isCheckDti() {
        return customer_dti;
    }

    /*Mayor's Permit Checkbox*/
    public boolean isCheckMayorsPermit() {
        return customer_mayorsPermit;
    }

    /*Account Application Form Checkbox*/
    public boolean isCheckAaf() {
        return customer_aaf;
    }

    /*Signature Card Checkbox*/
    public boolean isCheckSignatureCard() {
        return customer_signatureCard;
    }

    private Customer transformToEntityBean(CustomerBean formBean) {
        Customer entity = new Customer();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        if (formBean.getCustomerId() != null)
            entity.setCustomerId(new Integer(formBean.getCustomerId()));
        entity.setCustomerName(formBean.getCustomerName());
        entity.setCustomerCode(formBean.getCustomerCode());
        entity.setCustomerType(formBean.getCustomerType());
        entity.setWebsite(formBean.getWebsite());
        entity.setPhone(formBean.getPhone());
        entity.setMobile(formBean.getMobile());
        entity.setFax(formBean.getFax());
        entity.setEmail(formBean.getEmail());
        entity.setDti(formBean.getDti());
        entity.setMayorsPermit(formBean.getMayorsPermit());
        entity.setAaf(formBean.getAaf());
        entity.setSignatureCard(formBean.getSignatureCard());

//        /*Dti Checkbox*/
//        System.out.println("----------------------------------dti " + customer_dti + "" + formBean.getDti() + "-------------------------------------------");
//
//        if (customer_dti){
//            formBean.setDti(1);
//            entity.setDti(1);
//        }else {
//            formBean.setDti(0);
//            entity.setDti(0);
//        }
//
//        System.out.println("----------------------------------permit " + customer_mayorsPermit + "" + formBean.getMayorsPermit() + "-------------------------------------------");
//
//        /*Mayor's Permit Checkbox*/
//        if (customer_mayorsPermit ){
//            formBean.setMayorsPermit(1);
//            entity.setMayorsPermit(1);
//        }else {
//            formBean.setMayorsPermit(0);
//            entity.setMayorsPermit(0);
//        }
//
//        System.out.println("----------------------------------aaf " + customer_aaf + "" + formBean.getAaf() +"-------------------------------------------");
//
//        /*Account Application Form Checkbox*/
//        if (customer_aaf ){
//            formBean.setAaf(1);
//            entity.setAaf(1);
//        }else {
//            formBean.setAaf(0);
//            entity.setAaf(0);
//        }
//
//        System.out.println("----------------------------------card " + customer_signatureCard + "" + formBean.getSignatureCard() +"-------------------------------------------");
//
//        /*Signature Card Checkbox*/
//        if (customer_signatureCard){
//            formBean.setSignatureCard(1);
//            entity.setSignatureCard(1);
//        }else {
//            formBean.setSignatureCard(0);
//            entity.setSignatureCard(0);
//        }

        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        entity.setServiceArea(formBean.getServiceArea());

        return entity;
    }

    ////// END OF ITEMS ///////////////

    //address
    public String addAddress() throws Exception {
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }

        try{
            Address addressEntity = transformToEntityBeanAddress(address);
            addressEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            addressEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            addressEntity.setCreatedTimestamp(new Date());
            customerService.addAddress(addressEntity);
        }catch (AddressAlreadyExistsException e) {
            addFieldError("address.addressLine1", getText("err.addressLine1.already.exists"));
            return INPUT;
        }

        return SUCCESS;
    }

    public String editAddress() {
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }

        Address addressEntity = transformToEntityBeanAddress(address);
        addressEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        addressEntity.setModifiedTimestamp(new Date());
        customerService.updateAddress(addressEntity);

        return SUCCESS;
    }

    public String deleteAddress() {
        Address addressEntity = customerService.findAddressById(addressIdParam);

        List<Orders> addressInBookingList = orderService.findAddressInBooking(addressIdParam);

        if(addressInBookingList.size() > 0){

            Integer customerId = getCustomerSessionId();

            List<Address> addressEntityList = customerService.findAddressByShipper("CONSIGNEE", customerId);

            for (Address addressElem : addressEntityList) {
                addresss.add(transformToFormBeanAddress(addressElem));
            }

            clearErrorsAndMessages();
            addActionError("You cannot delete an address of a Customer associated with a Booking");
            return INPUT;
        }

        customerService.deleteAddress(addressEntity);
        return SUCCESS;
    }

    public String loadSuccessDeleteAddress() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressEntityList = new ArrayList<Address>();
//        addressEntityList = customerService.findAllAddressByRefId(customerId);
        addressEntityList = customerService.findAddressByShipper("CONSIGNEE", customerId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Address has been deleted.");

        return SUCCESS;
    }

    public String loadAddAddress() {
        return SUCCESS;
    }

    public String loadSaveCompleteAddress() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressEntityList = new ArrayList<Address>();
        /*addressEntityList = customerService.findAllAddressByRefId(customerId);*/
        addressEntityList = customerService.findAddressByShipper("CONSIGNEE",customerId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Address has been updated.");

        return SUCCESS;
    }

    public String loadEditAddress() {
        Address addressEntity = customerService.findAddressById(addressIdParam);
        address = transformToFormBeanAddress(addressEntity);
        return SUCCESS;
    }

    public String viewAddress() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressEntityList = new ArrayList<Address>();
        addressEntityList = customerService.findAddressByShipper("CONSIGNEE", customerId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }
        return SUCCESS;
    }

    public void validateOnSubmitAddress(AddressBean addressBean) {
        clearErrorsAndMessages();

        String PATTERN = "[0-9]{4}";

        Pattern pattern = Pattern.compile(PATTERN);
        Matcher matcher1 = pattern.matcher(addressBean.getZip());

        if (!matcher1.matches()) {
            addFieldError("address.zip", getText("err.regex.validation.zip"));
        }

        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getAddressLine1())) {
            addFieldError("address.addressLine1", getText("err.addressLine1.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getCity())) {
            addFieldError("address.city", getText("err.city.required"));
        }
//        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getState())) {
//            addFieldError("address.state", getText("err.state.required"));
//        }
      /*  if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getZip())) {
            addFieldError("address.zip", getText("err.zip.required"));
        }*/
    }

    public AddressBean transformToFormBeanAddress(Address entity) {
        AddressBean formBean = new AddressBean();

        formBean.setAddressId(entity.getAddressId());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setAddressLine1(entity.getAddressLine1());
        formBean.setAddressLine2(entity.getAddressLine2());
        formBean.setAddressType(entity.getAddressType());
        formBean.setCity(entity.getCity());
        formBean.setState(entity.getState());
        formBean.setZip(entity.getZip());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());
        return formBean;
    }

    public Address transformToEntityBeanAddress(AddressBean formBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getAddressId() != null) {
            entity.setAddressId(formBean.getAddressId());
        }

        Integer customerId = getCustomerSessionId();

        entity.setReferenceTable("CUSTOMERS");
        entity.setReferenceId(customerId);
        entity.setAddressLine1(formBean.getAddressLine1());
        entity.setAddressLine2(formBean.getAddressLine2());
        entity.setAddressType(formBean.getAddressType());
        entity.setCity(formBean.getCity());
        entity.setState(formBean.getState());
        entity.setZip(formBean.getZip());
        entity.setCreatedTimestamp(formBean.getCreatedTimeStamp());
        entity.setCreatedBy(formBean.getCreatedBy());
        /*entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy(getClientId().toString());*/

        return entity;
    }

    //rates

    public String addRates() throws Exception {
        validateOnSubmitRates(rate);
        if (hasFieldErrors()) {
            return INPUT;
        }

        Rates rateEntity = transformToEntityBeanRates(rate);
        rateEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        rateEntity.setCreatedBy(commonUtils.getUserNameFromSession());
        rateEntity.setCreatedTimestamp(new Date());
        customerService.addRate(rateEntity);
        return SUCCESS;
    }

    public String editRates() {
        validateOnSubmitRates(rate);
        if (hasFieldErrors()) {
            return INPUT;
        }

        Rates rateEntity = transformToEntityBeanRates(rate);
        rateEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        rateEntity.setModifiedTimestamp(new Date());
        customerService.updateRate(rateEntity);
        return SUCCESS;
    }

    public String deleteRates() {
        Rates rateEntity = customerService.findRateById(ratesIdParam);
        customerService.deleteRate(rateEntity);
        return SUCCESS;
    }

    public String viewRates() {
        Integer customerId = getCustomerSessionId();
        List<Rates> ratesEntityList = new ArrayList<Rates>();
        ratesEntityList = customerService.findAllRatesByCustomerId(customerId);
        for (Rates ratesElem : ratesEntityList) {
            rates.add(transformToFormBeanRates(ratesElem));
        }
        return SUCCESS;
    }

    public String loadAddRates() {
        return SUCCESS;
    }

    public String loadEditRates() {
        Rates ratesEntity = customerService.findRateById(ratesIdParam);
        rate = transformToFormBeanRates(ratesEntity);
        return SUCCESS;
    }

    public String loadSaveCompleteRates() {
        Integer customerId = getCustomerSessionId();
        List<Rates> ratesEntityList = new ArrayList<Rates>();
        ratesEntityList = customerService.findAllRatesByCustomerId(customerId);
        for (Rates ratesElem : ratesEntityList) {
            rates.add(transformToFormBeanRates(ratesElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Rates has been updated.");

        return SUCCESS;
    }

    public void validateOnSubmitRates(RatesBean ratesBean) {
        clearErrorsAndMessages();

        String PATTERN = "[0-9A-Za-z]+";
//        String PATTERN2 = "[0.0-9.9]*";
        /*String PATTERN = "[0-9A-Za-z]+";*/
//        float amount=ratesBean.getRate();
//        String strAmount = String.valueOf(amount);

        Pattern pattern = Pattern.compile(PATTERN);
//        Pattern pattern2 = Pattern.compile(PATTERN2);

        Matcher matcher1 = pattern.matcher(ratesBean.getOrigin());
        Matcher matcher2 = pattern.matcher(ratesBean.getDestination());
//        Matcher matcher3 = pattern2.matcher(strAmount);

        if (!matcher1.matches()) {
            addFieldError("rates.origin", getText("err.regex.validation.rates"));
        }
        if (!matcher2.matches()) {
            addFieldError("rates.destination", getText("err.regex.validation.rates"));
        }

        if (ratesBean.getRate() == null) {
            addFieldError("rates.rate", getText("err.rate.required"));
        }

//        if(!matcher3.matches()){
//            addFieldError("rates.rate", getText("err.regex.validation.rates.float"));
//        }

       /* if (StringUtils.isBlank(ratesBean.getOrigin())) {
            addFieldError("rates.origin", getText("err.origin.required"));
        }
        if (StringUtils.isBlank(ratesBean.getDestination())) {
            addFieldError("rates.destination", getText("err.destination.required"));
        }
        if (ratesBean.getRate() == null) {
            addFieldError("rates.rate", getText("err.rate.required"));
        }*/
    }

    public RatesBean transformToFormBeanRates(Rates entity) {
        RatesBean formBean = new RatesBean();

        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerRateId(entity.getCustomerRateId());
        formBean.setOrigin(entity.getOrigin());
        formBean.setDestination(entity.getDestination());
        formBean.setRate(entity.getRate());
        formBean.setRateType(entity.getRateType());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());

        return formBean;
    }

    public Rates transformToEntityBeanRates(RatesBean formBean) {
        Rates entity = new Rates();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getCustomerRateId() != null) {
            entity.setCustomerRateId(formBean.getCustomerRateId());
        }

        Integer customerId = getCustomerSessionId();

        entity.setCustomerId(customerId);
        entity.setOrigin(formBean.getOrigin());
        entity.setDestination(formBean.getDestination());
        entity.setRate(formBean.getRate());
        entity.setRateType(formBean.getRateType());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimeStamp());


        return entity;
    }

    ////// BEGIN OF CONTACTS ///////////////
    // DONE WITH MODIFY and CREATE BY

    public String loadAddContact() {
        return SUCCESS;
    }

    public String loadEditContact() {
        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        contact = transformToFormBeanContacts(contactEntity);
        return SUCCESS;
    }

    public String addContact() throws Exception {
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        try {
            Contacts contactEntity = transformToEntityBeanContacts(contact);
            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedTimestamp(new Date());
            customerService.addContact(contactEntity);
        } catch (ContactAlreadyExistsException e) {
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String editContact() {
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        try {
            Contacts contactEntity = transformToEntityBeanContacts(contact);
            contactEntity.setModifiedTimestamp(new Date());
            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            customerService.updateContact(contactEntity);
        } catch (ContactAlreadyExistsException e) {
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String deleteContact() {

        Contacts contactEntity = customerService.findContactById(contactCodeParam);

        List<Orders> contactInBookingList = orderService.findContactInBooking(contactCodeParam);

        if(contactInBookingList.size() > 0){
            Integer customerId = getCustomerSessionId();

            List<Contacts> contactEntityList = customerService.findContactByReferenceId(customerId);

            for (Contacts contactElem : contactEntityList) {
                contacts.add(transformToFormBeanContacts(contactElem));
            }

            clearErrorsAndMessages();
            addActionError("You cannot delete an Customer Contact Person that is associated with a Booking");
            return INPUT;
        }
        customerService.deleteContact(contactEntity);
        return SUCCESS;
    }

    public String deleteConsigneeContact(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        Contacts consigneeContactEntity = customerService.findContactById(consigneeContactCodeParam);
        List<Orders> consigneeContactInBookingList = orderService.findConsigneeContactInBooking(consigneeContactCodeParam);

        if(consigneeContactInBookingList.size() > 0){

            Contacts contactEntity = customerService.findContactById(contactCodeParam);
            Address addressEntity = customerService.findAddressById(addressIdParam);
            consignee = transformToFormBeanConsignee(addressEntity, contactEntity);

            List<Contacts> contactEntityList = customerService.findContactByConsignee(contactEntity.getContactId(), "C_CONTACT", getClientId());
            for (Contacts contactElem : contactEntityList) {
                contacts.add(transformToFormBeanContacts(contactElem));
            }

            clearErrorsAndMessages();
            addActionError("You cannot delete a Consignee Contact Person that is associated with a Booking");
            return INPUT;
        }

        customerService.deleteContact(consigneeContactEntity);

        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity);

        List<Contacts> contactEntityList = customerService.findContactByConsignee(contactEntity.getContactId(), "C_CONTACT", getClientId());
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }

        return SUCCESS;
    }

    public String loadSuccessContactsDelete() {
        Integer customerId = getCustomerSessionId();
        List<Contacts> contactEntityList = new ArrayList<Contacts>();
        contactEntityList = customerService.findContactByReferenceId(customerId);
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Contact Persons has been deleted.");

        return SUCCESS;
    }

    public String viewContacts() {
        Integer customerId = getCustomerSessionId();
        List<Contacts> contactEntityList = new ArrayList<Contacts>();
        contactEntityList = customerService.findContactByReferenceId(customerId);
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }
        return SUCCESS;
    }

    public String loadSaveCompleteContacts() {
        Integer customerId = getCustomerSessionId();
        List<Contacts> contactEntityList = new ArrayList<Contacts>();
        contactEntityList = customerService.findContactByReferenceId(customerId);
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Contact Persons has been updated.");

        return SUCCESS;
    }

    public String loadConsigneeAddContact() {

        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity);

        sessionAttributes.put("contactCodeParam", contactCodeParam);
        sessionAttributes.put("addressIdParam", addressIdParam);

        return SUCCESS;
    }

    public String addConsigneeContact() throws Exception{
        Map sessionAttributes = ActionContext.getContext().getSession();
        validateOnSubmitContact(consigneeContact);
        if (hasFieldErrors()) {
            return INPUT;
        }

        List <Contacts> contactConsignee = customerService.findContactByConsignee(contactCodeParam, "C_CONTACT", getClientId());

        if(contactConsignee.size() >= 1){
            clearErrorsAndMessages();
            addActionMessage("Cannot add an additional Contact Person for this Consignee");

            sessionAttributes.put("contactCodeParam", contactCodeParam);
            sessionAttributes.put("addressIdParam", addressIdParam);

            Contacts contactEntity = customerService.findContactById(contactCodeParam);
            Address addressEntity = customerService.findAddressById(addressIdParam);
            consignee = transformToFormBeanConsignee(addressEntity, contactEntity);

            List<Contacts> contactEntityList = customerService.findContactByConsignee(contactEntity.getContactId(), "C_CONTACT", getClientId());
            for (Contacts contactElem : contactEntityList) {
                contacts.add(transformToFormBeanContacts(contactElem));
            }

            return "contact_limit";
        }

//        try {
            Contacts contactEntity = transformToEntityBeanConsigneeContacts(consigneeContact);
            contactEntity.setReferenceId(contactCodeParam);
            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedTimestamp(new Date());
            customerService.addContact(contactEntity);
        /*} catch (ContactAlreadyExistsException e) {
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }*/

        sessionAttributes.put("contactCodeParam", contactCodeParam);
        sessionAttributes.put("addressIdParam", addressIdParam);

        clearErrorsAndMessages();
        addActionMessage("Success! New Contact Person for Consignee has been created.");

        Contacts contactEntity2 = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity2);

        List<Contacts> contactEntityList = customerService.findContactByConsignee(contactEntity2.getContactId(), "C_CONTACT", getClientId());
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }

        return SUCCESS;
    }

    public String loadEditConsigneeContact() {

        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity);

        Contacts consigneeContactEntity = customerService.findContactById(consigneeContactCodeParam);
        consigneeContact = transformToFormBeanContacts(consigneeContactEntity);

        sessionAttributes.put("contactCodeParam", contactCodeParam);
        sessionAttributes.put("addressIdParam", addressIdParam);

        return SUCCESS;
    }

    public String editConsigneeContact(){
        validateOnSubmitContact(consigneeContact);
        if (hasFieldErrors()) {
            return INPUT;
        }

//        try {
            Contacts contactEntity = transformToEntityBeanConsigneeContacts(consigneeContact);
            contactEntity.setReferenceId((Integer) sessionAttributes.get("contactCodeParam"));
            contactEntity.setModifiedTimestamp(new Date());
            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            customerService.updateContact(contactEntity);
        /*} catch (ContactAlreadyExistsException e) {
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }*/

        clearErrorsAndMessages();
        addActionMessage("Contact Person for Consignee has been successfully edited.");

        return SUCCESS;
    }

    private Contacts transformToEntityBeanConsigneeContacts(ContactBean consigneeContact) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        if (consigneeContact.getContactId() != null) {
            entity.setContactId(consigneeContact.getContactId());
        }
        System.out.println(commonUtils.getUserNameFromSession());
        Integer customerId = getCustomerSessionId();
        entity.setReferenceTable("CONTACTS");
        entity.setContactType("C_CONTACT");
        entity.setFirstName(consigneeContact.getFirstName());
        entity.setMiddleName(consigneeContact.getMiddleName());
        entity.setLastName(consigneeContact.getLastName());
        entity.setPhone(consigneeContact.getPhone());
        entity.setMobile(consigneeContact.getMobile());
        entity.setFax(consigneeContact.getFax());
        entity.setEmail(consigneeContact.getEmail());
        entity.setCreatedBy(consigneeContact.getCreatedBy());
        entity.setCreatedTimestamp(consigneeContact.getCreatedTimestamp());
        entity.setPosition(consigneeContact.getPosition());
        entity.setCompanyName(consigneeContact.getCompanyName());
        return entity;
    }

    private Contacts transformToEntityBeanContacts(ContactBean contactBean) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        if (contactBean.getContactId() != null) {
            entity.setContactId(contactBean.getContactId());
        }
        System.out.println(commonUtils.getUserNameFromSession());
        Integer customerId = getCustomerSessionId();
        entity.setReferenceId(customerId);
        entity.setReferenceTable("CUSTOMERS");
        entity.setContactType(contactBean.getContactType());
        entity.setFirstName(contactBean.getFirstName());
        entity.setMiddleName(contactBean.getMiddleName());
        entity.setLastName(contactBean.getLastName());
        entity.setPhone(contactBean.getPhone());
        entity.setMobile(contactBean.getMobile());
        entity.setFax(contactBean.getFax());
        entity.setEmail(contactBean.getEmail());
        entity.setCreatedBy(contactBean.getCreatedBy());
        entity.setCreatedTimestamp(contactBean.getCreatedTimestamp());
        entity.setPosition(contactBean.getPosition());
        return entity;
    }

    private ContactBean transformToFormBeanContacts(Contacts entity) {
        ContactBean formBean = new ContactBean();

        formBean.setContactId(entity.getContactId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setContactType(entity.getContactType());
        formBean.setFirstName(entity.getFirstName());
        formBean.setMiddleName(entity.getMiddleName());
        formBean.setLastName(entity.getLastName());
        formBean.setPhone(entity.getPhone());
        formBean.setMobile(entity.getMobile());
        formBean.setFax(entity.getFax());
        formBean.setEmail(entity.getEmail());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setPosition(entity.getPosition());
        return formBean;
    }

    public void validateOnSubmitContact(ContactBean contactBean) {
        clearErrorsAndMessages();

        if (org.apache.commons.lang.StringUtils.isBlank(contactBean.getLastName())) {
            addFieldError("contact.lastName", getText("err.lastNameContact.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(contactBean.getFirstName())) {
            addFieldError("contact.firstName", getText("err.firstNameContact.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(contactBean.getPhone())) {
            addFieldError("contact.phone", getText("err.phoneContact.required"));
        }
    }

    ////// END OF CONTACTS ///////////////

    //consignee

    public String addConsignee() {
        validateOnSubmitConsignee(consignee);
        if (hasFieldErrors()) {
            return INPUT;
        }

        Contacts consigneeEntity1 = transformContactToEntityBean(consignee);
        consigneeEntity1.setModifiedBy(commonUtils.getUserNameFromSession());
        consigneeEntity1.setCreatedBy(commonUtils.getUserNameFromSession());
        consigneeEntity1.setCreatedTimestamp(new Date());

        Address consigneeEntity2 = transformAddressToEntityBean(consignee);
        consigneeEntity2.setModifiedBy(commonUtils.getUserNameFromSession());
        consigneeEntity2.setCreatedBy(commonUtils.getUserNameFromSession());
        consigneeEntity2.setCreatedTimestamp(new Date());

        customerService.addConsignee(consigneeEntity1, consigneeEntity2);

        return SUCCESS;
    }

    public String editConsignee() {
        validateOnSubmitConsignee(consignee);
        if (hasFieldErrors()) {
            return INPUT;
        }

        Contacts consigneeEntity1 = transformContactToEntityBean(consignee);
        consigneeEntity1.setModifiedBy(commonUtils.getUserNameFromSession());
        consigneeEntity1.setModifiedTimestamp(new Date());

        Address consigneeEntity2 = transformAddressToEntityBean(consignee);
        consigneeEntity2.setModifiedBy(commonUtils.getUserNameFromSession());
        consigneeEntity2.setModifiedTimestamp(new Date());

        customerService.updateConsignee(consigneeEntity1, consigneeEntity2);

        return SUCCESS;
    }

    public String deleteConsignee() {
        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);

        List <Orders> orderEntityList = orderService.findConsigneeInBooking(contactEntity.getContactId());

        if(orderEntityList.size() > 0 ){
            clearErrorsAndMessages();
            addActionError("You cannot delete a Consignee associated with a Booking");
            return INPUT;
        }

        customerService.deleteConsignee(contactEntity, addressEntity);
        return SUCCESS;
    }

    public String loadSuccessDeleteConsignee() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressList = new ArrayList<Address>();
        List<Contacts> contactsList = new ArrayList<Contacts>();
        addressList = customerService.findAddressByParameterMap(customerId, "CONSIGNEE", getClientId());
        contactsList = customerService.findContactByParameterMap(customerId, "CONSIGNEE", getClientId());
        if (contactsList != null && addressList != null) {
            for (Integer i = 0; i < addressList.size() && i < contactsList.size(); i++) {
                consignees.add(transformToFormBeanConsignee(addressList.get(i), contactsList.get(i)));
            }
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Consignee List has been deleted.");

        return SUCCESS;
    }

    public String loadAddConsignee() {
        return SUCCESS;
    }

    public String loadEditConsignee() {
        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity);
        return SUCCESS;
    }

    public String loadSaveCompleteConsignee() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressList = new ArrayList<Address>();
        List<Contacts> contactsList = new ArrayList<Contacts>();
        addressList = customerService.findAddressByParameterMap(customerId, "CONSIGNEE", getClientId());
        contactsList = customerService.findContactByParameterMap(customerId, "CONSIGNEE", getClientId());
        if (contactsList != null && addressList != null) {
            for (Integer i = 0; i < addressList.size() && i < contactsList.size(); i++) {
                consignees.add(transformToFormBeanConsignee(addressList.get(i), contactsList.get(i)));
            }
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Consignee List has been updated.");

        return SUCCESS;
    }

    public String viewConsignees() {
        Integer customerId = getCustomerSessionId();
        List<Contacts> contactsList = new ArrayList<Contacts>();
        contactsList = customerService.findContactByParameterMap(customerId, "CONSIGNEE", getClientId());
        if (contactsList != null) {
            for (int i = 0; i < contactsList.size(); i++) {
                Contacts contactConsignee = contactsList.get(i);
                Address addressConsignee = customerService.findAddressByParameterMap(customerId, "CONSIGNEE", getClientId(), contactConsignee.getContactId());
                consignees.add(transformToFormBeanConsignee(addressConsignee, contactConsignee));
            }
        }
        return SUCCESS;
    }

    public String consigneeInfo() {
        if(contactCodeParam == null && addressIdParam == null){
            contactCodeParam = (Integer) sessionAttributes.get("contactCodeParam");
            addressIdParam = (Integer) sessionAttributes.get("addressIdParam");
        }

        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity);

        sessionAttributes.put("customerId", contactEntity.getReferenceId());
        // Shows contacts table under consignee
        List<Contacts> contactEntityList = customerService.findContactByConsignee(contactEntity.getContactId(), "C_CONTACT", getClientId());
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }

        return SUCCESS;
    }

    public void validateOnSubmitConsignee(ConsigneeBean consigneeBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(consigneeBean.getLastName())) {
            addFieldError("consignee.lastName", getText("err.lastNameContact.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getFirstName())) {
            addFieldError("consignee.firstName", getText("err.firstNameContact.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getPhone())) {
            addFieldError("consignee.phone", getText("err.phoneContact.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getAddressLine1())) {
            addFieldError("consignee.addressLine1", getText("err.addressLine1.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getCity())) {
            addFieldError("consignee.city", getText("err.city.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getZip())) {
            addFieldError("consignee.zip", getText("err.zip.required"));
        }
    }

    public Address transformAddressToEntityBean(ConsigneeBean formBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getAddressId() != null) {
            entity.setAddressId(formBean.getAddressId());
        }

        Integer customerId = getCustomerSessionId();
        entity.setReferenceTable("CUSTOMERS");
        entity.setReferenceId(customerId);
        entity.setAddressLine1(formBean.getAddressLine1());
        entity.setAddressLine2(formBean.getAddressLine2());
        entity.setAddressType("CONSIGNEE");
        entity.setCity(formBean.getCity());
        entity.setState(formBean.getState());
        entity.setZip(formBean.getZip());
        entity.setCreatedTimestamp(formBean.getCreatedTimeStamp2());
        entity.setCreatedBy(formBean.getCreatedBy2());
        entity.setContactReferenceId(formBean.getContactReferenceId());
        /*entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());*/

        return entity;
    }

    public Contacts transformContactToEntityBean(ConsigneeBean formBean) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (formBean.getContactId() != null) {
            entity.setContactId(formBean.getContactId());
        }

        Integer customerId = getCustomerSessionId();
        entity.setReferenceTable("CUSTOMERS");
        entity.setContactType("CONSIGNEE");
        entity.setReferenceId(customerId);
        entity.setFirstName(formBean.getFirstName());
        entity.setMiddleName(formBean.getMiddleName());
        entity.setLastName(formBean.getLastName());
        entity.setPhone(formBean.getPhone());
        entity.setMobile(formBean.getMobile());
        entity.setEmail(formBean.getEmail());
        entity.setFax(formBean.getFax());
        entity.setCreatedTimestamp(formBean.getCreatedTimeStamp1());
        entity.setCreatedBy(formBean.getCreatedBy1());
        entity.setCompanyName(formBean.getCompanyName());
        /*entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy("admin");*/

        return entity;
    }

    public ConsigneeBean transformToFormBeanConsignee(Address address, Contacts contact) {
        ConsigneeBean formBean = new ConsigneeBean();

        formBean.setFirstName(contact.getFirstName());
        formBean.setMiddleName(contact.getMiddleName());
        formBean.setLastName(contact.getLastName());
        formBean.setPhone(contact.getPhone());
        formBean.setMobile(contact.getMobile());
        formBean.setEmail(contact.getEmail());
        formBean.setContactId(contact.getContactId());
        formBean.setFax(contact.getFax());
        formBean.setCreatedBy1(contact.getCreatedBy());
        formBean.setCreatedTimeStamp1(contact.getCreatedTimestamp());
        formBean.setReferenceId1(contact.getReferenceId());
        formBean.setAddressLine1(address.getAddressLine1());
        formBean.setAddressLine2(address.getAddressLine2());
        formBean.setCity(address.getCity());
        formBean.setState(address.getState());
        formBean.setZip(address.getZip());
        formBean.setAddressId(address.getAddressId());
        formBean.setCreatedBy2(address.getCreatedBy());
        formBean.setCreatedTimeStamp2(address.getCreatedTimestamp());
        formBean.setReferenceId2(address.getReferenceId());
        formBean.setContactReferenceId(address.getContactReferenceId());
        formBean.setCompanyName(contact.getCompanyName());

        return formBean;
    }

    //utils
    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }
    
    @Override
    public void prepare() {
        addressTypeList = parameterService.getParameterMap(ParameterConstants.ADDRESS_TYPE);
        customerTypeList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_TYPE);
        customerSearchList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_SEARCH);
        rateTypeList = parameterService.getParameterMap(ParameterConstants.RATES_TYPE);
        contactTypeList = parameterService.getParameterMap(ParameterConstants.CONTACT_TYPE);
        portsList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.PORTS);
    }

    private Integer getCustomerSessionId() {
        Integer customerId = (Integer) sessionAttributes.get("customerId");
        return customerId;
    }

    public Integer getCustomersItemIdParam() {
        return customersItemIdParam;
    }

    public void setCustomersItemIdParam(Integer customersItemIdParam) {
        this.customersItemIdParam = customersItemIdParam;
    }

    public void setItemService(CustomerService itemService) {
        this.itemService = itemService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public List<CustomerBean> getCustomers() {
        return customers;
    }

    public void setCustomers(List<CustomerBean> customers) {
        this.customers = customers;
    }

    public List<ItemBean> getItems() {
        return items;
    }

    public void setItems(List<ItemBean> items) {
        this.items = items;
    }

    public List<Parameters> getCustomerTypeList() {
        return customerTypeList;
    }

    public void setCustomerTypeList(List<Parameters> customerTypeList) {
        this.customerTypeList = customerTypeList;
    }

    public List<Parameters> getCustomerSearchList() {
        return customerSearchList;
    }

    public void setCustomerSearchList(List<Parameters> customerSearchList) {
        this.customerSearchList = customerSearchList;
    }

    public String getCustomerCodeParam() {
        return customerCodeParam;
    }

    public void setCustomerCodeParam(String customerCodeParam) {
        this.customerCodeParam = customerCodeParam;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public CustomerBean getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerBean customer) {
        this.customer = customer;
    }

    public ItemBean getItem() {
        return item;
    }

    public void setItem(ItemBean item) {
        this.item = item;
    }

    public String getCustomerKeyword() {
        return customerKeyword;
    }

    public void setCustomerKeyword(String customerKeyword) {
        this.customerKeyword = customerKeyword;
    }

    public AddressBean getAddress() {
        return address;
    }

    public void setAddress(AddressBean address) {
        this.address = address;
    }

    public List<AddressBean> getAddresss() {
        return addresss;
    }

    public void setAddresss(List<AddressBean> addresss) {
        this.addresss = addresss;
    }

    public Integer getAddressIdParam() {
        return addressIdParam;
    }

    public void setAddressIdParam(Integer addressIdParam) {
        this.addressIdParam = addressIdParam;
    }

    public List<Parameters> getAddressTypeList() {
        return addressTypeList;
    }

    public void setAddressTypeList(List<Parameters> addressTypeList) {
        this.addressTypeList = addressTypeList;
    }

    public List<Parameters> getRateTypeList() {
        return rateTypeList;
    }

    public void setRateTypeList(List<Parameters> rateTypeList) {
        this.rateTypeList = rateTypeList;
    }

    public List<RatesBean> getRates() {
        return rates;
    }

    public void setRates(List<RatesBean> rates) {
        this.rates = rates;
    }

    public Integer getRatesIdParam() {
        return ratesIdParam;
    }

    public void setRatesIdParam(Integer ratesIdParam) {
        this.ratesIdParam = ratesIdParam;
    }

    public RatesBean getRate() {
        return rate;
    }

    public void setRate(RatesBean rate) {
        this.rate = rate;
    }

    public List<ContactBean> getContacts() {
        return contacts;
    }

    public void setContacts(List<ContactBean> contacts) {
        this.contacts = contacts;
    }

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
    }

    public List<ConsigneeBean> getConsignees() {
        return consignees;
    }

    public void setConsignees(List<ConsigneeBean> consignees) {
        this.consignees = consignees;
    }

    public ConsigneeBean getConsignee() {
        return consignee;
    }

    public void setConsignee(ConsigneeBean consignee) {
        this.consignee = consignee;
    }

    public Integer getContactCodeParam() {
        return contactCodeParam;
    }

    public void setContactCodeParam(Integer contactCodeParam) {
        this.contactCodeParam = contactCodeParam;
    }

    public List<Parameters> getContactTypeList() {
        return contactTypeList;
    }

    public void setContactTypeList(List<Parameters> contactTypeList) {
        this.contactTypeList = contactTypeList;
    }

    public CommonUtils getCommonUtils() {
        return commonUtils;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }

    public void setCustomer_dti(boolean customer_dti) {
        this.customer_dti = customer_dti;
    }

    public void setCustomer_mayorsPermit(boolean customer_mayorsPermit) {
        this.customer_mayorsPermit = customer_mayorsPermit;
    }

    public void setCustomer_aaf(boolean customer_aaf) {
        this.customer_aaf = customer_aaf;
    }

    public void setCustomer_signatureCard(boolean customer_signatureCard) {
        this.customer_signatureCard = customer_signatureCard;
    }

    public List<Parameters> getPortsList() {
        return portsList;
    }

    public void setPortsList(List<Parameters> portsList) {
        this.portsList = portsList;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public Integer getCustomerIdParam() {
        return customerIdParam;
    }

    public void setCustomerIdParam(Integer customerIdParam) {
        this.customerIdParam = customerIdParam;
    }

    public Integer getConsigneeContactCodeParam() {
        return consigneeContactCodeParam;
    }

    public void setConsigneeContactCodeParam(Integer consigneeContactCodeParam) {
        this.consigneeContactCodeParam = consigneeContactCodeParam;
    }

    public ContactBean getConsigneeContact() {
        return consigneeContact;
    }

    public void setConsigneeContact(ContactBean consigneeContact) {
        this.consigneeContact = consigneeContact;
    }

    public void setDocumentsService(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }
}