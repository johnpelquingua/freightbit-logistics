package com.sr.apps.freightbit.order.action;

import java.util.*;

import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.biz.freightbit.core.entity.Client;
import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.core.service.ClientService;

public class OrderAction extends ActionSupport implements Preparable {

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private OrderItemsBean orderItem = new OrderItemsBean();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();
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

    private Integer orderIdParam;
    private OrderService orderService;
    private CustomerService customerService;
    private ParameterService parameterService;
    private ClientService clientService;

    private Integer ID;
    private String REQ;
    private String MODE;
    private String TYPE;
    private String PAY;
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
    private Map<Integer, String> customerAddressMap = new HashMap<Integer, String>();

    private Map<Integer, String> customerConsigneeMap = new HashMap<Integer, String>();

    private Map<Integer, String> consigneeAddressMap = new HashMap<Integer, String>();
    private Integer consigneeId;
    private Integer addressId;

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

        dummyMsg = "Ajax action Triggered";

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

    public String loadAddOrderPage() { return SUCCESS; }

    public String addItemsInTable() {

        OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);

        orderService.addItem(orderItemEntity);

        /*Map sessionAttributes = ActionContext.getContext().getSession();

        orderIdPass = orderItemEntity.getOrderId();

        sessionAttributes.put("orderIdPass", orderIdPass);

        System.out.println("-------------------------------------Added items in table Order ID Add" + sessionAttributes.get("orderIdPass") + "-------------------------------------");
*/
        /*OrderItems entity = new OrderItems();

        entity.setQuantity(orderItemQuantityParam);
        entity.setNameSize(orderItemNameSizeParam);
        entity.setWeight(orderItemWeightParam);
        entity.setVolume(orderItemVolumeParam);
        entity.setClassification(orderItemClassificationParam);
        entity.setCommodity(orderItemDescriptionParam);
        entity.setRate(orderItemRateParam);
        entity.setDeclaredValue(orderItemDeclaredValueParam);
        entity.setComments(orderItemRemarksParam);

        OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);*/

        /*Map sessionAttributes = ActionContext.getContext().getSession();

        List<OrderItems> orderItemsFromSession = (List) sessionAttributes.get("orderItemsFromSession");

        if (orderItemsFromSession == null) {
            //create a list orderitems
            List <OrderItems> orderItemsList = new ArrayList();

            OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);

            orderItemEntity.setQuantity(orderItemQuantityParam);
            orderItemEntity.setNameSize(orderItemNameSizeParam);
            orderItemEntity.setWeight(orderItemWeightParam);
            orderItemEntity.setVolume(orderItemVolumeParam);
            orderItemEntity.setClassification(orderItemClassificationParam);
            orderItemEntity.setCommodity(orderItemDescriptionParam);
            orderItemEntity.setRate(orderItemRateParam);
            orderItemEntity.setDeclaredValue(orderItemDeclaredValueParam);
            orderItemEntity.setComments(orderItemRemarksParam);

            orderItemsList.add(orderItemEntity); //orderItem is galing sa form

            sessionAttributes.put("orderItemsFromSession", orderItemsList);

        } else {

            OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);

            orderItemEntity.setQuantity(orderItemQuantityParam);
            orderItemEntity.setNameSize(orderItemNameSizeParam);
            orderItemEntity.setWeight(orderItemWeightParam);
            orderItemEntity.setVolume(orderItemVolumeParam);
            orderItemEntity.setClassification(orderItemClassificationParam);
            orderItemEntity.setCommodity(orderItemDescriptionParam);
            orderItemEntity.setRate(orderItemRateParam);
            orderItemEntity.setDeclaredValue(orderItemDeclaredValueParam);
            orderItemEntity.setComments(orderItemRemarksParam);
            orderItemsFromSession.add(orderItemEntity);

            sessionAttributes.put("orderItemsFromSession", orderItemsFromSession);
        }

        List<OrderItems> orderItemsFromSessionTable = (List) sessionAttributes.get("orderItemsFromSession");

        for (OrderItems orderItemElem : orderItemsFromSessionTable) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }*/
        Integer idOrder = orderItemEntity.getOrderId();

        System.out.println("-------------------------------------IN ORDER" + idOrder + "-------------------------------------");

        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(idOrder);

        for(int i = 0; i < orderItemEntityList.size(); i++ ) {

            System.out.println("-------------------------------------Order Item " + orderItemEntityList.get(i).getNameSize() + "-------------------------------------");
        }

        for (OrderItems orderItemElem : orderItemEntityList) {
            System.out.println("-------------------------------------orderItemElem " + orderItemElem.getNameSize() + "-------------------------------------");
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        return SUCCESS;
    }

    public String addedItemsInTable() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("-------------------------------------Added items in table Order ID Added" + sessionAttributes.get("orderIdPass") + "-------------------------------------");

        Integer idOrder = (Integer) sessionAttributes.get("orderIdPass");

        System.out.println("-------------------------------------IN ORDER" + idOrder + "-------------------------------------");

        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(idOrder);

        for(int i = 0; i < orderItemEntityList.size(); i++ ) {

            System.out.println("-------------------------------------Order Item " + orderItemEntityList.get(i).getNameSize() + "-------------------------------------");
        }

        for (OrderItems orderItemElem : orderItemEntityList) {
            System.out.println("-------------------------------------orderItemElem " + orderItemElem.getNameSize() + "-------------------------------------");
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }



        //sessionAttributes.put("orderItem", orderItemEntityList);

        return SUCCESS;
    }

    public String addOrderItemsInDB() {

        /*Map sessionAttributes = ActionContext.getContext().getSession();

        sessionAttributes.get("orderIdPass");

        List<OrderItems> orderItemEntityList = (List) sessionAttributes.get("orderItem");

        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItemElem.setOrderId((Integer)sessionAttributes.get("orderIdPass"));
            orderService.addItem(orderItemElem);

        }*/
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

        //orderService.addOrder(transformToOrderEntityBean(order));

        Orders orderEntity = transformToOrderEntityBean(order);

        orderService.addOrder(orderEntity);
        // To get generated Order Id
        orderIdPass = orderEntity.getOrderId();

        Map sessionAttributes = ActionContext.getContext().getSession();

        sessionAttributes.put("orderIdPass", orderIdPass);

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA Add Order"+ sessionAttributes.get("orderIdPass"));

        return SUCCESS;
    }

    public String addOrderInfo() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY Add Order Info"+ sessionAttributes.get("orderIdPass"));



        Orders orderEntityForm = orderService.findOrdersById((Integer)sessionAttributes.get("orderIdPass"));
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);

        return SUCCESS;
    }


    public String loadEditOrder() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToFormBeanOrder(orderEntity);
        return SUCCESS;
    }

    public String editOrder() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        validateOnSubmit(order);
        if (hasFieldErrors()) {
            return INPUT;
        }
        orderService.updateOrder(orderEntity);
        return SUCCESS;
    }

    public String deleteOrder() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        if (orderEntity.getOrderStatus().equals("PENDING") || orderEntity.getOrderStatus().equals("CANCELLED") || orderEntity.getOrderStatus().equals("DISAPPROVED")) {
            orderService.deleteOrder(orderEntity);
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
            addActionMessage("You can not delete a booking with status rather than PENDING and CANCELLED.");
            return INPUT;
        }
    }

    public String viewInfoOrder() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        return SUCCESS;
    }

    public String loadContactInfoList() {

        System.out.println( "---------------ID 1: " + ID + "-------------------------------------" );
        System.out.println( "---------------REQ 1: " + REQ + "-------------------------------------" );
        System.out.println( "---------------MODE 1: " + MODE + "-------------------------------------" );
        System.out.println( "---------------TYPE 1: " + TYPE + "-------------------------------------" );
        System.out.println( "---------------PAY 1: " + PAY + "-------------------------------------" );

        Map sessionAttributes = ActionContext.getContext().getSession();

        Customer customerEntity = customerService.findCustomerById(ID);
        // To get Customer Name from Customer ID
        custName = customerEntity.getCustomerName();
        // Put Customer Name in session
        sessionAttributes.put("custName", custName );
        // To get Customer Code from Customer ID
        custCode = customerEntity.getCustomerCode();
        // To get Order Number and show it to form
        orderNum = orderService.findNextBookingNo(getClientId(), custCode);
        // Put Order Number in session
        sessionAttributes.put("orderNum", orderNum );
        // To show Customer's contacts list
        contactsList = customerService.findContactByParameterMap(ID, "shipper", getClientId());
        // To show Customer's Pick-up Address list
        addressList = customerService.findAddressByShipper("CONSIGNEE", ID);
        // To show Customer's Consignee List
        consigneeList = customerService.findContactByRefIdAndType("CONSIGNEE", ID);
        // To show Customer's Consignee's Addresses list
        consigneeAddressList = customerService.findAddressByParameterMap(ID, "CONSIGNEE", getClientId() );

        return SUCCESS;
    }


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
        contact.setName(getFullName(contacts.getLastName(), contacts.getFirstName(), contacts.getMiddleName()));
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
        contact.setName(getFullName(consigneeContact.getLastName(), consigneeContact.getFirstName(), consigneeContact.getMiddleName()));
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
        orderBean.setServiceType(order.getServiceType());
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
        orderBean.setShipperCode(order.getShipperCode());
        orderBean.setShipperAddressId(order.getShipperAddressId());
        orderBean.setShipperContactId(order.getShipperContactId());
        orderBean.setConsigneeCode(order.getConsigneeCode());
        orderBean.setConsigneeAddressId(order.getConsigneeAddressId());
        orderBean.setConsigneeContactId(order.getConsigneeContactId());
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
        //shipper name
        /*Contacts shipperContact = customerService.findContactById(order.getShipperContactId());
        orderBean.setCustomerId(shipperContact.getReferenceId());
        orderBean.setCustomerName(shipperContact.getFirstName()+" "+shipperContact.getMiddleName()+" "+shipperContact.getLastName());
        */

        Contacts contactShipperName = customerService.findContactById(order.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());

        orderBean.setCustomerName(shipperName.getCustomerName());

        orderBean.setPickupDate(order.getPickupDate());
        System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+order.getPickupDate());
        orderBean.setDeliveryDate(order.getDeliveryDate());
        System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+order.getDeliveryDate());

        //shipper contact info
        Contacts contacts = customerService.findContactById(order.getShipperContactId());
        contact = new ContactBean();
        contact.setName(getFullName(contacts.getLastName(), contacts.getFirstName(), contacts.getMiddleName()));
        contact.setPhone(contacts.getPhone());
        contact.setEmail(contacts.getEmail());
        contact.setFax(contacts.getFax());
        contact.setMobile(contacts.getMobile());
        orderBean.setShipperInfoContact(contact);
        //get shipper address
        Address addresss = customerService.findAddressById(order.getShipperAddressId());
        address = new AddressBean();
        address.setAddress(getAddress(addresss));
        orderBean.setShipperInfoAddress(address);
        //consignee Info
        Contacts consigneeContact = customerService.findContactById(order.getConsigneeContactId());
        contact = new ContactBean();
        contact.setName(getFullName(consigneeContact.getLastName(), consigneeContact.getFirstName(), consigneeContact.getMiddleName()));
        contact.setPhone(consigneeContact.getPhone());
        contact.setEmail(consigneeContact.getEmail());
        contact.setFax(consigneeContact.getFax());
        contact.setMobile(consigneeContact.getMobile());
        orderBean.setConsigneeInfoContact(contact);
        // consignee address
        Address consigneeAddress = customerService.findAddressById(order.getConsigneeAddressId());
        address = new AddressBean();
        address.setAddress(getAddress(consigneeAddress));
        System.out.println(address);
        orderBean.setConsigneeInfoAddress(address);

        return orderBean;
    }

    private CustomerBean transformToCustomerFormBean(Customer customer) {

        CustomerBean formBean = new CustomerBean();
        formBean.setCustomerName(customer.getCustomerName());
        return formBean;
    }

    private OrderItemsBean transformToOrderItemsFormBean(OrderItems orderItem) {

        OrderItemsBean orderItemBean = new OrderItemsBean();

        orderItemBean.setQuantity(orderItem.getQuantity());
        System.out.println( "---------------NAMESIZE " + orderItem.getNameSize() + "-------------------------------------" );
        orderItemBean.setNameSize(orderItem.getNameSize());
        orderItemBean.setWeight(orderItem.getWeight());
        orderItemBean.setVolume(orderItem.getVolume());
        orderItemBean.setClassification(orderItem.getClassification());
        orderItemBean.setDescription(orderItem.getCommodity());
        orderItemBean.setRate(orderItem.getRate());
        orderItemBean.setDeclaredValue(orderItem.getDeclaredValue());
        orderItemBean.setRemarks(orderItem.getComments());
        /*orderItemBean.setHeight(orderItem.getHeight());
        orderItemBean.setWidth(orderItem.getWidth());
        orderItemBean.setLength(orderItem.getLength());*/

        return orderItemBean;
    }

    private Orders transformToOrderEntityBean(OrderBean formBean) {

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

        entity.setOrderNumber(orderNum);
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

        return entity;
    }

    private OrderItems transformToOrderItemsEntityBean(OrderItemsBean formBean) {

        OrderItems entity = new OrderItems();
        //TO DO: To included OrderItems entity in Order Entity
/*		if (orderItem.getOrderItemId() != null && !("").equals(orderItem.getOrderItemId()))
            orderItem.setOrderItemId(orderItemBean.getOrderItemId());
		
		orderItem.setOrderId(orderItemBean.getOrderId());*/
        Client client = clientService.findClientById(getClientId().toString());

        entity.setClientId(client.getClientId());

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"+ sessionAttributes.get("orderIdPass"));

        entity.setOrderId((Integer)sessionAttributes.get("orderIdPass"));
        entity.setCommodity(formBean.getDescription());
        entity.setQuantity(formBean.getQuantity());
        entity.setClassification(formBean.getClassification());
        entity.setDeclaredValue(formBean.getDeclaredValue());

       /* orderItem.setHeight(orderItemBean.getHeight());
        orderItem.setWidth(orderItemBean.getWidth());
        orderItem.setLength(orderItemBean.getLength());*/

        entity.setWeight(formBean.getWeight());
        entity.setNameSize(formBean.getNameSize());
        entity.setRate(formBean.getRate());
        entity.setComments(formBean.getRemarks());
        entity.setStatus("PENDING");
        entity.setVolume(formBean.getVolume());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedTimestamp(new Date());

        return entity;
    }

    public void validateOnSubmit(OrderBean orderBean) {
        clearErrorsAndMessages();
        //validate notification type

        if (org.apache.commons.lang.StringUtils.isBlank(orderBean.getCustomerName())) {
            addFieldError("order.customerId", getText("err.addressLine1.required"));
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

  /*  public List<Items> getCustomerItemsList() {
        return customerItemsList;
    }

    public void setCustomerItemsList(List<Items> customerItemsList) {
        this.customerItemsList = customerItemsList;
    }*/

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

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getREQ() {
        return REQ;
    }

    public void setREQ(String REQ) {
        this.REQ = REQ;
    }

    public String getMODE() {
        return MODE;
    }

    public void setMODE(String MODE) {
        this.MODE = MODE;
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE;
    }

    public String getPAY() {
        return PAY;
    }

    public void setPAY(String PAY) {
        this.PAY = PAY;
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


}
