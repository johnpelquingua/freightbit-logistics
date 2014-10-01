package com.sr.apps.freightbit.order.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.sr.biz.freightbit.common.entity.Notification;
import com.sr.biz.freightbit.common.service.NotificationService;
//import com.sr.biz.freightbit.order.entity.Counter;
import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.customer.formbean.ConsigneeBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.customer.formbean.ItemBean;
import com.sr.apps.freightbit.documentation.formbean.DocumentsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.DocumentsConstants;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.core.exceptions.OrderAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;

public class OrderAction extends ActionSupport implements Preparable {

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private OrderItemsBean orderItem = new OrderItemsBean();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();
    private ItemBean item = new ItemBean();
    private DocumentsBean document = new DocumentsBean();
    private ConsigneeBean consigneeBean = new ConsigneeBean();
    private List<Customer> customerList = new ArrayList<Customer>();
    private List<Parameters> serviceRequirementList = new ArrayList<Parameters>();
    private List<Parameters> freightTypeList = new ArrayList<Parameters>();
    private List<Parameters> modeOfServiceList = new ArrayList<Parameters>();
    private List<Parameters> modeOfPaymentList = new ArrayList<Parameters>();
    private List<Parameters> orderSearchList = new ArrayList<Parameters>();
    private List<Parameters> notifyByList = new ArrayList<Parameters>();
    private List<Contacts> shipperList = new ArrayList<Contacts>();
    private List<Contacts> consigneeList = new ArrayList<Contacts>();
    private List<CustomerBean> customerBean = new ArrayList<CustomerBean>();
    private List<Integer> containerQuantity;
    private List<Parameters> containerList = new ArrayList<Parameters>();
    private List<Integer> itemQuantity;
    private List<Contacts> contactsList = new ArrayList<Contacts>();
    private List<Address> addressList = new ArrayList<Address>();
    private List<Address> consigneeAddressList = new ArrayList<Address>();
    private List<Parameters> portsList = new ArrayList<Parameters>();
    private CommonUtils commonUtils = new CommonUtils();
    private List<Items> customerItems = new ArrayList<Items>();
    private List<Parameters> contactTypeList = new ArrayList<Parameters>();
    private List<Parameters> addressTypeList = new ArrayList<Parameters>();
    private String[] notificationList;

    private Integer orderIdParam;
    private Integer orderItemIdParam;
    private OrderService orderService;
    private CustomerService customerService;
    private ParameterService parameterService;
    private DocumentsService documentsService;
    private NotificationService notificationService;

    private ClientService clientService;
    private ConsigneeBean consignee = new ConsigneeBean();

    private String custName; // get the customer name from ID
    private String custCode; // get customer code from ID
    private String orderNum; // get the order number
    private Integer orderIdPass;

    private Integer orderItemQuantityParam;
    private String orderItemNameSizeParam;
    private Double orderItemWeightParam;
    private Float orderItemVolumeParam;
    private String orderItemClassificationParam;
    private String orderItemDescriptionParam;
    private Float orderItemRateParam;
    private Double orderItemDeclaredValueParam;
    private String orderItemRemarksParam;

    private Map<Integer, String> customerContactsMap = new LinkedHashMap<Integer, String>();
    private String dummyMsg;
    private Integer customerID;
    // map customer addresses on dropdown
    private Map<Integer, String> customerAddressMap = new HashMap<Integer, String>();
    // map customer consignee on dropdown
    private Map<Integer, String> customerConsigneeMap = new HashMap<Integer, String>();
    // map customer cosignee address on dropdown
    private Map<Integer, String> consigneeAddressMap = new HashMap<Integer, String>();
    private Integer consigneeId;
    private Integer addressId;

    private Map<Double, Double> shipperItemVolumeMap = new HashMap<Double, Double>();
    private Map<String, String> shipperItemCommodityMap = new HashMap<String, String>();
    private Map<Float, Float> shipperItemValueMap = new HashMap<Float, Float>();
    private Integer itemId;
    Integer ctr = 0;

    public String itemAction() {

        Items shipperItem = customerService.findItemByCustomerItemsId(itemId);

            shipperItemVolumeMap.put(shipperItem.getLength() * shipperItem.getWidth() * shipperItem.getHeight(), shipperItem.getLength() * shipperItem.getWidth() * shipperItem.getHeight());

            shipperItemCommodityMap.put(shipperItem.getDescription(), shipperItem.getDescription());

            shipperItemValueMap.put(shipperItem.getWeight(), shipperItem.getWeight());

        return SUCCESS;
    }

    public String customerAction() {

        List <Contacts> shipperContacts = customerService.findContactByRefIdAndType("shipper",customerID );

        for(int i = 0; i < shipperContacts.size(); i++ ) {
            customerContactsMap.put(shipperContacts.get(i).getContactId(), shipperContacts.get(i).getFirstName() + ' ' + shipperContacts.get(i).getMiddleName() + ' ' + shipperContacts.get(i).getLastName()  );
        }

        List <Address> shipperAddresses = customerService.findAddressByShipper("CONSIGNEE",customerID );

        for(int i = 0; i < shipperAddresses.size(); i++ ) {
            customerAddressMap.put(shipperAddresses.get(i).getAddressId(), shipperAddresses.get(i).getAddressLine1() + ' ' + shipperAddresses.get(i).getCity()  );
        }

        List <Contacts> shipperConsignee = customerService.findContactByRefIdAndType("CONSIGNEE",customerID);

        for(int i = 0; i < shipperConsignee.size(); i++ ) {
            customerConsigneeMap.put(shipperConsignee.get(i).getContactId(), shipperConsignee.get(i).getFirstName() + ' ' + shipperConsignee.get(i).getMiddleName() + ' ' + shipperConsignee.get(i).getLastName()  );
        }

        List <Address> consigneeAddresses = customerService.findAddressByCriteria("CONSIGNEE",customerID );

        for(int i = 0; i < consigneeAddresses.size(); i++ ) {
            consigneeAddressMap.put(consigneeAddresses.get(i).getAddressId(), consigneeAddresses.get(i).getAddressLine1() + ' ' + consigneeAddresses.get(i).getAddressLine2() + ' ' + consigneeAddresses.get(i).getCity()  );
        }

        return SUCCESS;
    }

    public String consigneeAction() {

        if (consigneeId != null) {
            Address consigneeAddress = customerService.findAddressByParameterMap(getClientId(), "CONSIGNEE", getClientId(), consigneeId);
            consigneeAddressMap.put(consigneeAddress.getAddressId(), consigneeAddress.getAddressLine1() + ' ' + consigneeAddress.getAddressLine2() + ' ' + consigneeAddress.getCity()  );

        }else{
            List <Address> consigneeAddresses = customerService.findAddressByCriteria("CONSIGNEE",customerID );

            for(int i = 0; i < consigneeAddresses.size(); i++ ) {
                consigneeAddressMap.put(consigneeAddresses.get(i).getAddressId(), consigneeAddresses.get(i).getAddressLine1() + ' ' + consigneeAddresses.get(i).getAddressLine2() + ' ' + consigneeAddresses.get(i).getCity()  );
            }
        }

        return SUCCESS;
    }

    public String addressAction() {

        if (addressId != null) {
            Address consigneeAddress = customerService.findAddressById(addressId);

            Contacts customerConsignee = customerService.findContactById(consigneeAddress.getContactReferenceId());

            customerConsigneeMap.put(customerConsignee.getContactId(), customerConsignee.getFirstName() + ' ' + customerConsignee.getMiddleName() + ' ' + customerConsignee.getLastName()  );

        }else{

            List <Contacts> customerConsignee = customerService.findContactByRefIdAndType("CONSIGNEE",customerID);

            for(int i = 0; i < customerConsignee.size(); i++ ) {
                customerConsigneeMap.put(customerConsignee.get(i).getContactId(), customerConsignee.get(i).getFirstName() + ' ' + customerConsignee.get(i).getMiddleName() + ' ' + customerConsignee.get(i).getLastName());
            }
        }
        return SUCCESS;
    }

    public String viewOrders() {

        String column = getColumnFilter();
        List<Orders> orderEntityList = new ArrayList<Orders>();

        if (StringUtils.isNotBlank(column)) {
            orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());
        } else {
            orderEntityList = orderService.findAllOrders();
        }

        for (Orders orderElem : orderEntityList) {
            orders.add(transformToOrderFormBean(orderElem));
        }

        return SUCCESS;
    }

    public String viewOrdersInbooking() {

        String column = getColumnFilter();
        List<Orders> orderEntityList = new ArrayList<Orders>();
        notificationService.clearNewBooking();
        if (StringUtils.isNotBlank(column)) {
            orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());
        } else {
            orderEntityList = orderService.findAllOrders();
        }

        for (Orders orderElem : orderEntityList) {
            orders.add(transformToOrderFormBean(orderElem));
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
            } else if ("SHIPPER NAME".equals(order.getOrderSearchCriteria())) {
                column = "shipperCode";
            } else if ("CONSIGNEE NAME".equals(order.getOrderSearchCriteria())) {
                column = "consigneeCode";
            } else if ("SERVICE MODE".equals(order.getOrderSearchCriteria())) {
                column = "serviceMode";
            } else if ("SERVICE TYPE".equals(order.getOrderSearchCriteria())) {
                column = "serviceType";
            } else if ("STATUS".equals(order.getOrderSearchCriteria())) {
                column = "orderStatus";
            }
            return column;
        }

    }

    public String loadAddOrderPage() {return SUCCESS; }

    public String reloadAddOrderPage(){return SUCCESS; }

    public String addItemsInTable() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer)sessionAttributes.get("orderIdPass"));
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);

        // Get Service Requirement
        String orderLimit = orderEntityForm.getServiceRequirement();
        // Get Order Item List
        List <OrderItems> orderItemNumberList = orderService.findAllItemByOrderId((Integer)sessionAttributes.get("orderIdPass"));

        // get total quantity from database
        Integer orderItemQuantityTotal = 0;

        for(int i = 0; i < orderItemNumberList.size(); i++ ) {

            orderItemQuantityTotal = orderItemQuantityTotal + orderItemNumberList.get(i).getQuantity();
        }

        OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);
        //get quantity of item from form
        Integer orderItemEntityQuantity = orderItemEntity.getQuantity();
        //count quantity of item from form and from database
        Integer orderItemQuantityGrandTotal = orderItemQuantityTotal + orderItemEntityQuantity;

        // Condition where it will only allow to add 5 containers and 10 items only
        if(orderLimit.equals("FULL CARGO LOAD")){
            if(orderItemQuantityGrandTotal > 5){
                String messageFlag = "FCL_LIMIT";
                sessionAttributes.put("messageFlag", messageFlag);

            }else{
                // Add order items to database
                orderService.addItem(orderItemEntity);
                String messageFlag = "FCL_OK";
                sessionAttributes.put("messageFlag", messageFlag);
            }

        }else{
            if(orderItemQuantityGrandTotal > 10){
                String messageFlag = "OTHERS_LIMIT";
                sessionAttributes.put("messageFlag", messageFlag);
            }else{
                // Add order items to database
                orderService.addItem(orderItemEntity);
                String messageFlag = "OTHERS_OK";
                sessionAttributes.put("messageFlag", messageFlag);
            }

        }
        // Get Order Id
        Integer idOrder = orderItemEntity.getOrderId();
        // Put Order Id in session
        sessionAttributes.put("idOrder", idOrder);

        return SUCCESS;
    }

    public String addedItemsInTable() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer)sessionAttributes.get("orderIdPass"));

        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);
        // repopulate customer items
        customerItems = (List)sessionAttributes.get("customerItems");

        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId((Integer) sessionAttributes.get("idOrder"));

        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {

            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }
        // get message flag from session
        String messageFlagPass = sessionAttributes.get("messageFlag").toString();

        if(messageFlagPass == "FCL_LIMIT") {
            //error add container
            clearErrorsAndMessages();
            addActionMessage("Sorry you can not exceed 5 containers.");
        }else if(messageFlagPass == "OTHERS_LIMIT") {
            //error add item
            clearErrorsAndMessages();
            addActionMessage("Sorry you can not exceed 10 items.");
        }else{
            // Success Add item
            clearErrorsAndMessages();
            addActionMessage("Success! Booking Item has been added.");
        }

        return SUCCESS;
    }

    public String deleteItem() {

        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemIdParam);
        orderService.deleteItem(orderItemEntity);

        // repopulate booking details on first form
        Orders orderEntityForm = orderService.findOrdersById(orderItemEntity.getOrderId());
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);

        // repopulate customer items after order item delete
        Map sessionAttributes = ActionContext.getContext().getSession();
        customerItems = (List)sessionAttributes.get("customerItems");

        // Display order items in table
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderItemEntity.getOrderId());

        for (OrderItems orderItemElem : orderItemEntityList) {

            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Booking Item has been deleted.");

        return SUCCESS;
    }

    public String bookingSearch() {
        return SUCCESS;
    }

    public String addOrder() {
        /*validateOnSubmit(order);
        if (hasFieldErrors()) {
            return INPUT;
        }*/
        Orders orderEntity = transformToOrderEntityBean(order);

        orderService.addOrder(orderEntity);


        //        fill the addedtype column in counterTable
//        Counter counterEntity = new Counter();
//        counterEntity.setAddedType("BOOKING");
//        orderService.addCounterType(counterEntity);




        Notification notificationEntity = new Notification();
        notificationEntity.setDescription("BOOKING");
        notificationEntity.setNotificationId(1);
        notificationEntity.setNotificationType("Email");
        notificationEntity.setReferenceId(1);
        notificationEntity.setReferenceTable("Order");
        notificationEntity.setUserId(1);

        notificationService.addNotification(notificationEntity);



        Documents documentEntity = new Documents();

        documentEntity.setClientId(commonUtils.getClientId());
        documentEntity.setDocumentType(DocumentsConstants.OUTBOUND);
        documentEntity.setDocumentName(DocumentsConstants.BOOKING_REQUEST_FORM);
        documentEntity.setReferenceId(orderEntity.getOrderId());
        documentEntity.setReferenceTable("ORDERS");
        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
        documentEntity.setCreatedDate(new Date());
        documentsService.addDocuments(documentEntity);
        // To get generated Order Id
        orderIdPass = orderEntity.getOrderId();

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdPass", orderIdPass);


        return SUCCESS;
    }

    public String addOrderInfo() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer)sessionAttributes.get("orderIdPass"));
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);
        // get contact id from shipper
        Integer contactIdParam = orderEntityForm.getShipperContactId();
        // shipper id from contact
        Contacts contactEntity = customerService.findContactById(contactIdParam);
        Customer customerEntity = customerService.findCustomerById(contactEntity.getReferenceId());
        // get customer items
        customerItems = customerService.findItemByCustomerId(customerEntity.getCustomerId());
        // get order items on order edit module
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId((Integer) sessionAttributes.get("orderIdPass"));

        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {

            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        sessionAttributes.put("customerItems", customerItems);

        return SUCCESS;
    }


    public String loadEditOrder() {

        //orderIdParam is Order ID passed from form
        Map sessionAttributes = ActionContext.getContext().getSession();
        // If orderIdParam is null, value is only null when added via add contacts, address and consignee
        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        Orders orderEntityForm = orderService.findOrdersById(orderIdParam);
        //notification to correctly populate checkboxlist
        if (orderEntityForm.getNotificationType() != null){
            notificationList = (orderEntityForm.getNotificationType().split("\\s*[,]\\s*"));
        }
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);

        Contacts contactShipperName = customerService.findContactById(orderEntityForm.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());
        // displays customer contacts list
        contactsList = customerService.findContactByRefIdAndType("shipper",shipperName.getCustomerId());
        // display customer address list
        addressList = customerService.findAddressByShipper("CONSIGNEE",shipperName.getCustomerId());
        // displays customer consignee list
        consigneeList = customerService.findContactByRefIdAndType("CONSIGNEE",shipperName.getCustomerId());
        // displays customer consignee address list
        consigneeAddressList = customerService.findAddressByCriteria("CONSIGNEE",shipperName.getCustomerId());

        // put value of orderIdPass into session
        sessionAttributes.put("orderIdPass", orderIdParam);

        return SUCCESS;
    }

    public String editOrder() {
        /*validateOnSubmit(order);
        if (hasFieldErrors()) {
            return INPUT;
        }*/
        try {
            Orders orderEntity = transformToOrderEntityBean(order);
            orderEntity.setModifiedTimestamp(new Date());
            orderEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            orderService.updateOrder(orderEntity);

            // To get generated Order Id
            orderIdPass = orderEntity.getOrderId();
            Map sessionAttributes = ActionContext.getContext().getSession();
            sessionAttributes.put("orderIdPass", orderIdPass);

        } catch(OrderAlreadyExistsException e) {
            addFieldError("order.orderNumber", getText("err.orderNumber.already.exists"));
            return INPUT;
        }

        return SUCCESS;

    }

    public String deleteOrder() {

        // If orderIdParam is null, value is only null when added via add contacts, address and consignee
        if(orderIdParam == null){
            return SUCCESS;
        }

        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        if (orderEntity.getOrderStatus().equals("PENDING") || orderEntity.getOrderStatus().equals("CANCELLED")) {
            orderService.deleteOrder(orderEntity);

            List <OrderItems> orderItemsEntity = orderService.findAllItemByOrderId(orderIdParam);
            // delete Order Items that are under OrderId
            for (OrderItems orderItemElem : orderItemsEntity) {

                orderService.deleteItem(orderItemElem);
            }
            return SUCCESS;

        } else {
            String column = getColumnFilter();
            List<Orders> orderEntityList = new ArrayList<Orders>();
            if (StringUtils.isNotBlank(column)) {
                orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());
            } else {
                orderEntityList = orderService.findAllOrders();
            }
            for (Orders orderElem : orderEntityList) {
                orders.add(transformToOrderFormBean(orderElem));
            }
            clearErrorsAndMessages();
            addActionMessage("You can only delete booking with status of PENDING and CANCELLED.");
            return INPUT;
        }
    }

    public String approveOrder(){

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        orderEntity.setOrderStatus("APPROVED");
        orderService.updateOrder(orderEntity);
        clearErrorsAndMessages();
        addActionMessage("Booking successfully Approved!");
        return SUCCESS;

    }

    public String cancelOrder(){

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        orderEntity.setOrderStatus("CANCELLED");
        orderService.updateOrder(orderEntity);
        clearErrorsAndMessages();
        addActionMessage("Booking cancelled.");
        return SUCCESS;

    }

    public String viewInfoOrder() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }
        return SUCCESS;
    }

//    when adding customer contacts inside booking

    public String addCustomerContact() {

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

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    private Contacts transformToEntityBeanContacts(ContactBean contactBean) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (contactBean.getContactId() != null) {
            entity.setContactId(contactBean.getContactId());
        }

        entity.setReferenceId(contactBean.getReferenceId());
        entity.setReferenceTable("CUSTOMERS");
        entity.setContactType("shipper");
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

    //adding customer address in booking
    public String addAddress() throws Exception {
        if (hasFieldErrors()) {
            return INPUT;
        }
        Address addressEntity = transformToEntityBeanAddress(address);
        addressEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        addressEntity.setCreatedBy(commonUtils.getUserNameFromSession());
        addressEntity.setCreatedTimestamp(new Date());
        customerService.addAddress(addressEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public Address transformToEntityBeanAddress(AddressBean formBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getAddressId() != null) {
            entity.setAddressId(formBean.getAddressId());
        }

        entity.setReferenceTable("CUSTOMERS");
        entity.setReferenceId(formBean.getReferenceId());
        entity.setAddressLine1(formBean.getAddressLine1());
        entity.setAddressLine2(formBean.getAddressLine2());
        entity.setAddressType(formBean.getAddressType());
        entity.setCity(formBean.getCity());
        entity.setState(formBean.getState());
        entity.setZip(formBean.getZip());
        entity.setCreatedTimestamp(formBean.getCreatedTimeStamp());
        entity.setCreatedBy(formBean.getCreatedBy());

        return entity;
    }

    //add consignee in the booking
    public String addConsignee() {

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

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public Contacts transformContactToEntityBean(ConsigneeBean formBean) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        entity.setReferenceTable("CUSTOMERS");
        entity.setContactType("CONSIGNEE");
        entity.setReferenceId(formBean.getReferenceId1());
        entity.setFirstName(formBean.getFirstName());
        entity.setMiddleName(formBean.getMiddleName());
        entity.setLastName(formBean.getLastName());
        entity.setPhone(formBean.getPhone());
        entity.setMobile(formBean.getMobile());
        entity.setEmail(formBean.getEmail());
        entity.setFax(formBean.getFax());
        entity.setCreatedTimestamp(formBean.getCreatedTimeStamp1());
        entity.setCreatedBy(formBean.getCreatedBy1());

        return entity;
    }

    public Address transformAddressToEntityBean(ConsigneeBean formBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getAddressId() != null) {
            entity.setAddressId(formBean.getAddressId());
        }

        entity.setReferenceTable("CUSTOMERS");
        entity.setReferenceId(formBean.getReferenceId1());
        entity.setAddressLine1(formBean.getAddressLine1());
        entity.setAddressLine2(formBean.getAddressLine2());
        entity.setAddressType("CONSIGNEE");
        entity.setCity(formBean.getCity());
        entity.setState(formBean.getState());
        entity.setZip(formBean.getZip());
        entity.setCreatedTimestamp(formBean.getCreatedTimeStamp2());
        entity.setCreatedBy(formBean.getCreatedBy2());

        return entity;
    }
    //end

    private OrderBean transformToFormBeanOrder(Orders order) {

        OrderBean orderBean = new OrderBean();
        orderBean.setOrderNo(order.getOrderNumber());
        orderBean.setBookedBy(order.getCreatedBy());
        orderBean.setFreightType(order.getServiceType());
        orderBean.setModeOfService(order.getServiceMode());
        orderBean.setServiceRequirement(order.getServiceRequirement());
        orderBean.setNotifyBy(order.getNotificationType());

        orderBean.setModeOfPayment(order.getPaymentMode());
        orderBean.setBookingDate(order.getOrderDate());
        orderBean.setOrderStatus(order.getOrderStatus());
        orderBean.setOriginationPort(order.getOriginationPort());
        orderBean.setDestinationPort(order.getDestinationPort());
        orderBean.setPickupDate(order.getPickupDate());
        orderBean.setDeliveryDate(order.getDeliveryDate());
        orderBean.setBookingDate(order.getOrderDate());
        orderBean.setComments(order.getComments());
        orderBean.setRates(order.getRates());
        orderBean.setOrderStatus(order.getOrderStatus());

        //customer info
        List<Customer> customer = customerService.findCustomersByCriteria("customerCode", order.getShipperCode(), getClientId());
        if (customer != null) {
            orderBean.setCustomerName(customer.get(0).getCustomerName());
        } else {
            orderBean.setConsigneeCode(customer.get(0).getCustomerCode());
        }

        //shipper contact info
        Contacts contacts = customerService.findContactById(order.getShipperContactId());
        contact = new ContactBean();
        contact.setName(getFullName(contacts));
        contact.setPhone(contacts.getPhone());
        contact.setEmail(contacts.getEmail());
        contact.setFax(contacts.getFax());
        contact.setMobile(contacts.getMobile());
        orderBean.setShipperInfoContact(contact);

        Address addresss = customerService.findAddressById(order.getShipperAddressId());
        address = new AddressBean();
        address.setAddress(getAddress(addresss));
        orderBean.setShipperInfoAddress(address);

        //consignee Info
        Contacts consigneeContact = customerService.findContactById(order.getConsigneeContactId());
        contact = new ContactBean();
        contact.setName(getFullName(consigneeContact));
        contact.setPhone(consigneeContact.getPhone());
        contact.setEmail(consigneeContact.getEmail());
        contact.setFax(consigneeContact.getFax());
        contact.setMobile(consigneeContact.getMobile());
        orderBean.setConsigneeInfoContact(contact);

        Address consigneeAddress = customerService.findAddressById(order.getConsigneeAddressId());
        address = new AddressBean();
        address.setAddress(getAddress(consigneeAddress));
        System.out.println(address);
        orderBean.setConsigneeInfoAddress(address);

        //Order Items Bean
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(order.getOrderId());

        for (OrderItems orderItemElem : orderItemEntityList) {
            System.out.println(orderItemElem);
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }
        orderBean.setOrderItemsBean(orderItems);

        return orderBean;
    }

    private OrderBean transformToOrderFormBean(Orders order) {

        OrderBean orderBean = new OrderBean();

        orderBean.setOrderId(order.getOrderId());
        orderBean.setOrderNumber(order.getOrderNumber());
        orderBean.setFreightType(order.getServiceType());
        orderBean.setModeOfService(order.getServiceMode());
        orderBean.setNotifyBy(order.getNotificationType());
        orderBean.setOrderDate(order.getOrderDate());
        orderBean.setModeOfPayment(order.getPaymentMode());
        orderBean.setComments(order.getComments());
        orderBean.setOrderStatus(order.getOrderStatus());
        orderBean.setShipperCode(order.getVendorCode());
        orderBean.setTruckCode(order.getTruckCode());
        orderBean.setTrailerCode(order.getTrailerCode());
        orderBean.setDriverCode(order.getDriverCode());
        orderBean.setVesselNumber(order.getVesselNumber());
        /*orderBean.setShipperCode(order.getShipperCode());*/
        orderBean.setShipperAddressId(order.getShipperAddressId());
        orderBean.setShipperContactId(order.getShipperContactId());
        // get Customer name
        Contacts shipperContactName = customerService.findContactById(order.getShipperContactId());
        orderBean.setShipperContactName(getFullName(shipperContactName));
        /*orderBean.setConsigneeCode(order.getConsigneeCode());*/
        orderBean.setConsigneeAddressId(order.getConsigneeAddressId());
        orderBean.setConsigneeContactId(order.getConsigneeContactId());
        Contacts consigneeContactName = customerService.findContactById(order.getConsigneeContactId());
        orderBean.setConsigneeName(getFullName(consigneeContactName));
        orderBean.setAccountRep(order.getAccountRep());
        orderBean.setCreatedTimestamp(order.getCreatedTimestamp());
        orderBean.setCreatedBy(order.getCreatedBy());
        orderBean.setModifiedTimestamp(order.getModifiedTimestamp());
        orderBean.setModifiedBy(order.getModifiedBy());
        orderBean.setPickupDate(order.getPickupDate());
        orderBean.setOriginationPort(order.getOriginationPort());
        orderBean.setDeliveryDate(order.getDeliveryDate());
        orderBean.setDestinationPort(order.getDestinationPort());
        orderBean.setRates(order.getRates());
        orderBean.setServiceRequirement(order.getServiceRequirement());
        orderBean.setModeOfService(order.getServiceMode());

        Contacts contactShipperName = customerService.findContactById(order.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());

        if (shipperName!=null) {
            orderBean.setCustomerId(shipperName.getCustomerId());
            orderBean.setCustomerName(shipperName.getCustomerName());
        }

        orderBean.setPickupDate(order.getPickupDate());
        orderBean.setDeliveryDate(order.getDeliveryDate());

        //shipper contact info
        Contacts contacts = customerService.findContactById(order.getShipperContactId());
            contact = new ContactBean();
            contact.setName(getFullName(contacts));
            contact.setPhone(contacts.getPhone());
            contact.setEmail(contacts.getEmail());
            contact.setFax(contacts.getFax());
            contact.setMobile(contacts.getMobile());
            orderBean.setShipperInfoContact(contact);

        //get shipper address
        if (order.getShipperAddressId()!=null) {
            Address addresses = customerService.findAddressById(order.getShipperAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(addresses));
            orderBean.setShipperInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            orderBean.setShipperInfoAddress(address);
        }

        //consignee Info
        Contacts consigneeContact = customerService.findContactById(order.getConsigneeContactId());

            contact = new ContactBean();
            contact.setName(getFullName(consigneeContact));
            contact.setPhone(consigneeContact.getPhone());
            contact.setEmail(consigneeContact.getEmail());
            contact.setFax(consigneeContact.getFax());
            contact.setMobile(consigneeContact.getMobile());
            orderBean.setConsigneeInfoContact(contact);

        // consignee address
        if (order.getConsigneeAddressId()!=null) {
            Address consigneeAddress = customerService.findAddressById(order.getConsigneeAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(consigneeAddress));
            orderBean.setConsigneeInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            orderBean.setConsigneeInfoAddress(address);
        }

        return orderBean;
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

        return orderItemBean;
    }

    private Orders transformToOrderEntityBean(OrderBean formBean) {

        /*Contacts test = customerService.fin*/

        /*Orders order = new Orders();
        order.setOrderNumber(orderBean.getOrderNo());
        order.setServiceType(orderBean.getFreightType());
        order.setServiceMode(orderBean.getModeOfService());
        order.setNotificationType(orderBean.getNotifyBy());
        order.setOrderDate(orderBean.getBookingDate());
        order.setPaymentMode(orderBean.getModeOfPayment());
        order.setOrderStatus(orderBean.getOrderStatus());
        order.setOriginationPort(orderBean.getOriginationPort());
        order.setDestinationPort(orderBean.getDestinationPort());

        User loggedInUser = getUser();
        if (StringUtils.isBlank(orderBean.getBookedBy())) { //A NULL Booked By field means, the Order is NEW and not an edit
            order.setCreatedBy(loggedInUser.getUsername());
            order.setAccountRep(loggedInUser.getUsername());
        } else {
            order.setCreatedBy(orderBean.getBookedBy());
            order.setAccountRep(orderBean.getBookedBy());
        }
        order.setModifiedBy(loggedInUser.getUsername());

        //Shipper Details
        order.setShipperCode(orderBean.getShipperCode());
        order.setShipperAddressId(orderBean.getShipperInfoAddress().getAddressId());
        order.setShipperContactId(orderBean.getShipperInfoContact().getContactId());

        //Consignee Details
        order.setConsigneeCode(orderBean.getConsigneeCode());
        order.setConsigneeAddressId(orderBean.getConsigneeInfoAddress().getAddressId());
        order.setConsigneeContactId(orderBean.getConsigneeInfoContact().getContactId());

        //Order Item Details
        List<OrderItems> orderItems = new ArrayList<OrderItems>();
        for (OrderItemsBean orderItemBean : orderBean.getOrderItemsBean()) {
            orderItems.add(transformToOrderItemsEntityBean(orderItemBean));
        }
        order.setOrderItems(orderItems);*/

        Orders entity = new Orders();

        Client client = clientService.findClientById(getClientId().toString());

        entity.setClient(client);
        entity.setOrderDate(new Date()); // Booking Date
        entity.setServiceRequirement(formBean.getServiceRequirement());
        Customer customerEntity = customerService.findCustomerById(formBean.getCustomerId());
        // To get Customer Name from Customer ID
        custName = customerEntity.getCustomerName();
        // To get Customer Code from Customer ID
        custCode = customerEntity.getCustomerCode();
        // To get Order Number and show it to form
        orderNum = orderService.findNextBookingNo(getClientId(), custCode);
        // Order Number will get information on Order edit
        if (formBean.getOrderNumber() != null){
            entity.setOrderNumber(new String(formBean.getOrderNumber()));
        }else{
            entity.setOrderNumber(orderNum);
        }
        // Order Id will get data on order edit
        if (formBean.getOrderId() != null) {
            entity.setOrderId(new Integer(formBean.getOrderId()));
        }

        entity.setServiceType(formBean.getFreightType());
        entity.setServiceMode(formBean.getModeOfService());
        entity.setNotificationType(formBean.getNotifyBy());
        entity.setPaymentMode(formBean.getModeOfPayment());
        entity.setOriginationPort(formBean.getOriginationPort());
        entity.setDestinationPort(formBean.getDestinationPort());
        entity.setComments(formBean.getComments());
        entity.setOrderStatus("PENDING");  // still to be updated
        entity.setRates(99.99); // still to be updated
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setAccountRep(commonUtils.getUserNameFromSession());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedTimestamp(new Date());
        entity.setShipperAddressId(formBean.getShipperAddressId());
        entity.setShipperContactId(formBean.getShipperContactId());
        entity.setConsigneeAddressId(formBean.getConsigneeAddressId());
        entity.setConsigneeContactId(formBean.getConsigneeContactId());
        entity.setDeliveryDate(formBean.getDeliveryDate());
        entity.setPickupDate(formBean.getPickupDate());

        Contacts contactShipperName = customerService.findContactById(order.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());

        entity.setCustomerId(shipperName.getCustomerId());

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("f_Type", formBean.getFreightType());
        sessionAttributes.put("service_Req", formBean.getServiceRequirement());
        sessionAttributes.put("service_Mode", formBean.getModeOfService());

        return entity;
    }

    private OrderItems transformToOrderItemsEntityBean(OrderItemsBean formBean) {

        OrderItems entity = new OrderItems();

        Client client = clientService.findClientById(getClientId().toString());

        entity.setClientId(client.getClientId());

        Map sessionAttributes = ActionContext.getContext().getSession();
        entity.setOrderId((Integer)sessionAttributes.get("orderIdPass"));
        entity.setCommodity(formBean.getDescription());
        entity.setQuantity(formBean.getQuantity());
        entity.setClassification(formBean.getClassification());
        entity.setDeclaredValue(formBean.getDeclaredValue());
        entity.setWeight(formBean.getWeight());
        // Condition in FCL and LCL
        if(sessionAttributes.get("service_Req").equals("FULL CARGO LOAD")){
            entity.setNameSize(formBean.getNameSize());
        }else{
            Integer nameId = Integer.parseInt(formBean.getNameSize());
            Items itemEntity = customerService.findItemByCustomerItemsId(nameId);
            entity.setNameSize(itemEntity.getItemName());
        }

        entity.setRate(formBean.getRate());
        entity.setComments(formBean.getRemarks());
        // Trucking Freight Types will proceed to inland freight operations
        if(sessionAttributes.get("f_Type").equals("TRUCKING") && sessionAttributes.get("service_Mode").equals("PICKUP")){
            entity.setStatus("PLANNING 2");
        }else if(sessionAttributes.get("f_Type").equals("TRUCKING") && sessionAttributes.get("service_Mode").equals("DELIVERY")){
            entity.setStatus("PLANNING 3");
        }else{
            entity.setStatus("PLANNING 1");
        }

        entity.setVolume(formBean.getVolume());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedTimestamp(new Date());

        return entity;
    }

    /*Add Item inside Booking*/
    public String addItemInBooking() {
        /*validateOnSubmitItem(item);*/
        if (hasFieldErrors()) {
            return INPUT;
        }

        Items itemEntity = transformToEntityBeanItem(item);
        itemEntity.setModifiedBy(commonUtils.getUserNameFromSession());
        itemEntity.setCreatedBy(commonUtils.getUserNameFromSession());
        itemEntity.setCreatedTimeStamp(new Date());
        customerService.addItem(itemEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();

        sessionAttributes.get("orderIdPass");

        return SUCCESS;
    }

    public String addedItemInBooking() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer)sessionAttributes.get("orderIdPass"));
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);
        // repopulate customer items
        customerItems = customerService.findItemByCustomerId(orderEntityForm.getCustomerId());

        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId((Integer) sessionAttributes.get("orderIdPass"));

        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {

            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Item has been added to the customer.");

        return SUCCESS;
    }

    public Items transformToEntityBeanItem(ItemBean formBean) {

        Items entity = new Items();
        entity.setClientId(commonUtils.getClientId());

        if (formBean.getCustomerItemsId() != null)
            entity.setCustomerItemsId(new Integer(formBean.getCustomerItemsId()));

        entity.setItemName(formBean.getItemName());
        entity.setItemCode(formBean.getItemCode());
        entity.setCustomerId(formBean.getCustomerId());
        entity.setSrp(formBean.getSrp());
        entity.setLength(formBean.getLength());
        entity.setWidth(formBean.getWidth());
        entity.setHeight(formBean.getHeight());
        entity.setCriticalQuality(formBean.getCriticalQuality());
        entity.setWeight(formBean.getWeight());
        entity.setNote(formBean.getNote());
        entity.setDescription(formBean.getDescription());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setCreatedTimeStamp(formBean.getCreatedTimeStamp());

        return entity;
    }

    /*public Documents transformToDocumentEntityBean (DocumentsBean formBean) {

        Documents entity = new Documents();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(commonUtils.getClientId());
        entity.setDocumentName("BOOKING REQUEST FORM");
        entity.setDocumentType("OUTBOUND");
        entity.setReferenceId();
        entity.setReferenceTable("ORDERS");
        entity.setCreatedDate(new Date());
        entity.setOrderNumber();

        return entity;
    }*/

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

        if (!matcher.matches()) {
            addFieldError("item.itemCode", getText("err.regex.validation.itemcode"));
        }

        Matcher matcher1 = pattern4.matcher(itemBean.getItemName());
        if(!matcher1.matches()){
            addFieldError("item.itemName", getText("Special Characters in item name is not valid"));
        }

        Matcher matcher2 = pattern2.matcher(itemBean.getWeight().toString());
        if(!matcher2.matches()){
            addFieldError("item.basePrice", getText("Special Characters in base price is not valid"));
        }

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

        //null
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
        if (itemBean.getWeight() == null) {
            addFieldError("item.basePrice", getText("err.basePrice.required"));
        }
        if (StringUtils.isBlank(itemBean.getDescription())) {
            addFieldError("item.description", getText("err.description.required"));
        }
    }

    public List<Contacts> getShipperList() {
        return shipperList;
    }

    public void setShipperList(List<Contacts> shipperList) {
        this.shipperList = shipperList;
    }

    public List<Contacts> getConsigneeList() {
        return consigneeList;
    }

    public void setConsigneeList(List<Contacts> consigneeList) {
        this.consigneeList = consigneeList;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    private User getUser() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        return (User) sessionAttributes.get("clientId");
    }

    private String getFullName(Contacts contactName) {
    	if (contactName != null) {
    		String lastName = contactName.getLastName();
    		String firstName = contactName.getFirstName();
    		String middleName = contactName.getMiddleName();
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
    	return "";
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

    @Override
    public void prepare() throws Exception {
        customerList = customerService.findAllCustomer();
        serviceRequirementList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.SERVICE_REQUIREMENT);
        freightTypeList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.FREIGHT_TYPE);
        modeOfPaymentList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_PAYMENT);
        modeOfServiceList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_SERVICE);
        notifyByList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.NOTIFY_BY);
        orderSearchList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.ORDER_SEARCH);
        portsList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.PORTS);
        containerList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.CONTAINER_SIZE);
        contactTypeList = parameterService.getParameterMap(ParameterConstants.CONTACT_TYPE);
        addressTypeList = parameterService.getParameterMap(ParameterConstants.ADDRESS_TYPE);

        containerQuantity = new ArrayList<Integer>();
        containerQuantity.add(1);
        containerQuantity.add(2);
        containerQuantity.add(3);
        containerQuantity.add(4);
        containerQuantity.add(5);

        itemQuantity = new ArrayList<Integer>();
        itemQuantity.add(1);
        itemQuantity.add(2);
        itemQuantity.add(3);
        itemQuantity.add(4);
        itemQuantity.add(5);
        itemQuantity.add(6);
        itemQuantity.add(7);
        itemQuantity.add(8);
        itemQuantity.add(9);
        itemQuantity.add(10);

    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public List<Customer> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<Customer> customerList) {
        this.customerList = customerList;
    }

    public List<Parameters> getServiceRequirementList() {
        return serviceRequirementList;
    }

    public void setServiceRequirementList(List<Parameters> serviceRequirementList) {
        this.serviceRequirementList = serviceRequirementList;
    }

    public List<Parameters> getFreightTypeList() {
        return freightTypeList;
    }

    public void setFreightTypeList(List<Parameters> freightTypeList) {
        this.freightTypeList = freightTypeList;
    }

    public List<Parameters> getModeOfServiceList() {
        return modeOfServiceList;
    }

    public void setModeOfServiceList(List<Parameters> modeOfServiceList) {
        this.modeOfServiceList = modeOfServiceList;
    }

    public List<Parameters> getModeOfPaymentList() {
        return modeOfPaymentList;
    }

    public void setModeOfPaymentList(List<Parameters> modeOfPaymentList) {
        this.modeOfPaymentList = modeOfPaymentList;
    }

    public List<Parameters> getNotifyByList() {
        return notifyByList;
    }

    public void setNotifyByList(List<Parameters> notifyByList) {
        this.notifyByList = notifyByList;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public List<CustomerBean> getCustomerBean() {
        return customerBean;
    }

    public void setCustomerBean(List<CustomerBean> customerBean) {
        this.customerBean = customerBean;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }

    public List<Parameters> getOrderSearchList() {
        return orderSearchList;
    }

    public void setOrderSearchList(List<Parameters> orderSearchList) {
        this.orderSearchList = orderSearchList;
    }

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
    }

    public List<Parameters> getContainerList() {
        return containerList;
    }

    public void setContainerList(List<Parameters> containerList) {
        this.containerList = containerList;
    }

    public List<Integer> getContainerQuantity() {
        return containerQuantity;
    }

    public void setContainerQuantity(List<Integer> containerQuantity) {
        this.containerQuantity = containerQuantity;
    }

    public List<Integer> getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(List<Integer> itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public List<Contacts> getContactsList() {
        return contactsList;
    }

    public void setContactsList(List<Contacts> contactsList) {
        this.contactsList = contactsList;
    }

    public List<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(List<Address> addressList) {
        this.addressList = addressList;
    }

    public List<Address> getConsigneeAddressList() {
        return consigneeAddressList;
    }

    public void setConsigneeAddressList(List<Address> consigneeAddressList) {
        this.consigneeAddressList = consigneeAddressList;
    }

    public List<Parameters> getPortsList() {
        return portsList;
    }

    public void setPortsList(List<Parameters> portsList) {
        this.portsList = portsList;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getCustCode() {
        return custCode;
    }

    public void setCustCode(String custCode) {
        this.custCode = custCode;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public Integer getOrderIdPass() {
        return orderIdPass;
    }

    public void setOrderIdPass(Integer orderIdPass) {
        this.orderIdPass = orderIdPass;
    }

    public OrderItemsBean getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItemsBean orderItem) {
        this.orderItem = orderItem;
    }

    public List<OrderItemsBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItemsBean> orderItems) {
        this.orderItems = orderItems;
    }

    public Integer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Integer customerID) {
        this.customerID = customerID;
    }

    public String getDummyMsg() {
        return dummyMsg;
    }

    public void setDummyMsg(String dummyMsg) {
        this.dummyMsg = dummyMsg;
    }

    public Map<Integer, String> getCustomerAddressMap() {
        return customerAddressMap;
    }

    public void setCustomerAddressMap(Map<Integer, String> customerAddressMap) {
        this.customerAddressMap = customerAddressMap;
    }

    public Map<Integer, String> getCustomerConsigneeMap() {
        return customerConsigneeMap;
    }

    public void setCustomerConsigneeMap(Map<Integer, String> customerConsigneeMap) {
        this.customerConsigneeMap = customerConsigneeMap;
    }

    public Map<Integer, String> getCustomerContactsMap() {
        return customerContactsMap;
    }

    public void setCustomerContactsMap(Map<Integer, String> customerContactsMap) {
        this.customerContactsMap = customerContactsMap;
    }

    public Map<Integer, String> getConsigneeAddressMap() {
        return consigneeAddressMap;
    }

    public void setConsigneeAddressMap(Map<Integer, String> consigneeAddressMap) {
        this.consigneeAddressMap = consigneeAddressMap;
    }

    public Integer getConsigneeId() {
        return consigneeId;
    }

    public void setConsigneeId(Integer consigneeId) {
        this.consigneeId = consigneeId;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getOrderItemRemarksParam() {
        return orderItemRemarksParam;
    }

    public void setOrderItemRemarksParam(String orderItemRemarksParam) {
        this.orderItemRemarksParam = orderItemRemarksParam;
    }

    public Double getOrderItemDeclaredValueParam() {
        return orderItemDeclaredValueParam;
    }

    public void setOrderItemDeclaredValueParam(Double orderItemDeclaredValueParam) {
        this.orderItemDeclaredValueParam = orderItemDeclaredValueParam;
    }

    public Float getOrderItemRateParam() {
        return orderItemRateParam;
    }

    public void setOrderItemRateParam(Float orderItemRateParam) {
        this.orderItemRateParam = orderItemRateParam;
    }

    public String getOrderItemDescriptionParam() {
        return orderItemDescriptionParam;
    }

    public void setOrderItemDescriptionParam(String orderItemDescriptionParam) {
        this.orderItemDescriptionParam = orderItemDescriptionParam;
    }

    public String getOrderItemClassificationParam() {
        return orderItemClassificationParam;
    }

    public void setOrderItemClassificationParam(String orderItemClassificationParam) {
        this.orderItemClassificationParam = orderItemClassificationParam;
    }

    public Float getOrderItemVolumeParam() {
        return orderItemVolumeParam;
    }

    public void setOrderItemVolumeParam(Float orderItemVolumeParam) {
        this.orderItemVolumeParam = orderItemVolumeParam;
    }

    public Double getOrderItemWeightParam() {
        return orderItemWeightParam;
    }

    public void setOrderItemWeightParam(Double orderItemWeightParam) {
        this.orderItemWeightParam = orderItemWeightParam;
    }

    public String getOrderItemNameSizeParam() {
        return orderItemNameSizeParam;
    }

    public void setOrderItemNameSizeParam(String orderItemNameSizeParam) {
        this.orderItemNameSizeParam = orderItemNameSizeParam;
    }

    public Integer getOrderItemQuantityParam() {
        return orderItemQuantityParam;
    }

    public void setOrderItemQuantityParam(Integer orderItemQuantityParam) {
        this.orderItemQuantityParam = orderItemQuantityParam;
    }

    public List<Items> getCustomerItems() {
        return customerItems;
    }

    public void setCustomerItems(List<Items> customerItems) {
        this.customerItems = customerItems;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Map<Float, Float> getShipperItemValueMap() {
        return shipperItemValueMap;
    }

    public void setShipperItemValueMap(Map<Float, Float> shipperItemValueMap) {
        this.shipperItemValueMap = shipperItemValueMap;
    }

    public Map<String, String> getShipperItemCommodityMap() {
        return shipperItemCommodityMap;
    }

    public void setShipperItemCommodityMap(Map<String, String> shipperItemCommodityMap) {
        this.shipperItemCommodityMap = shipperItemCommodityMap;
    }

    public Map<Double, Double> getShipperItemVolumeMap() {
        return shipperItemVolumeMap;
    }

    public void setShipperItemVolumeMap(Map<Double, Double> shipperItemVolumeMap) {
        this.shipperItemVolumeMap = shipperItemVolumeMap;
    }

    public Integer getOrderItemIdParam() {
        return orderItemIdParam;
    }

    public void setOrderItemIdParam(Integer orderItemIdParam) {
        this.orderItemIdParam = orderItemIdParam;
    }

    public void setContactTypeList(List<Parameters> contactTypeList) {
        this.contactTypeList = contactTypeList;
    }

    public List<Parameters> getContactTypeList() {
        return contactTypeList;
    }

    public List<Parameters> getAddressTypeList() {
        return addressTypeList;
    }

    public void setAddressTypeList(List<Parameters> addressTypeList) {
        this.addressTypeList = addressTypeList;
    }

    public AddressBean getAddress() {
        return address;
    }

    public void setAddress(AddressBean address) {
        this.address = address;
    }

    public ConsigneeBean getConsignee() {
        return consignee;
    }

    public void setConsignee(ConsigneeBean consignee) {
        this.consignee = consignee;
    }

    public String[] getNotificationList() {
        return notificationList;
    }

    public void setNotificationList(String[] notificationList) {
        this.notificationList = notificationList;
    }

    public ItemBean getItem() {
        return item;
    }

    public void setItem(ItemBean item) {
        this.item = item;
    }

    public Integer getCtr() {
        return ctr;
    }

    public void setCtr(Integer ctr) {
        this.ctr = ctr;
    }

    public DocumentsService getDocumentsService() {
        return documentsService;
    }

    public void setDocumentsService(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }

    public DocumentsBean getDocument() {
        return document;
    }

    public void setDocument(DocumentsBean document) {
        this.document = document;
    }


    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }
}
