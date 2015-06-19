package com.sr.apps.freightbit.order.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.customer.formbean.ConsigneeBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.customer.formbean.ItemBean;
import com.sr.apps.freightbit.documentation.formbean.DocumentsBean;
import com.sr.apps.freightbit.operations.formbean.OrderStatusLogsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.DocumentsConstants;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.entity.Notification;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.exceptions.AddressAlreadyExistsException;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.operations.service.OperationsService;
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
import com.sr.biz.freightbit.operations.service.OrderStatusLogsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.commons.lang3.StringUtils;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//import com.sr.biz.freightbit.order.entity.Counter;

public class OrderAction extends ActionSupport implements Preparable {

    BigInteger Booking;
    Integer ctr = 0;
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private OrderItemsBean orderItem = new OrderItemsBean();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();
    private Items items = new Items();
    private ItemBean item = new ItemBean();
    private DocumentsBean document = new DocumentsBean();
    private ConsigneeBean consigneeBean = new ConsigneeBean();
    private List<Customer> customerList = new ArrayList<Customer>();
    private List<Parameters> serviceRequirementList = new ArrayList<Parameters>();
    private List<Parameters> freightTypeList = new ArrayList<Parameters>();
    private List<Parameters> modeOfServiceList = new ArrayList<Parameters>();
    private List<Parameters> modeOfPaymentList = new ArrayList<Parameters>();
    private List<Parameters> orderSearchList = new ArrayList<Parameters>();
    private List<Parameters> bookingNumSearchList = new ArrayList<Parameters>();
    private List<Parameters> notifyByList = new ArrayList<Parameters>();
    private List<Contacts> shipperList = new ArrayList<Contacts>();
    private List<Contacts> consigneeList = new ArrayList<Contacts>();
    private List<CustomerBean> customerBean = new ArrayList<CustomerBean>();
    private List<Integer> containerQuantity;
    private List<Integer> itemQuantity;
    private List<Contacts> contactsList = new ArrayList<Contacts>();
    private List<Contacts> consigneeContactsList = new ArrayList<Contacts>();
    private List<Address> addressList = new ArrayList<Address>();
    private List<Address> consigneeAddressList = new ArrayList<Address>();
    private List<Parameters> portsList = new ArrayList<Parameters>();
    private CommonUtils commonUtils = new CommonUtils();
    private List<Items> customerItems = new ArrayList<Items>();
    private List<Parameters> contactTypeList = new ArrayList<Parameters>();
    private List<Parameters> addressTypeList = new ArrayList<Parameters>();
    private List<Parameters> containerList = new ArrayList<Parameters>();
    private String[] notificationList;
    private CustomerBean customer = new CustomerBean();
    private List<Documents> outboundEntityList = new ArrayList<Documents>();
    private Integer orderIdParam;
    private Integer orderItemIdParam;
    private String userType;
    private OperationsService operationsService;
    private OrderStatusLogsService orderStatusLogsService;
    private OrderService orderService;
    private CustomerService customerService;
    private ParameterService parameterService;
    private DocumentsService documentsService;
    private NotificationService notificationService;
    private ClientService clientService;
    private UserService userService;
    private ConsigneeBean consignee = new ConsigneeBean();
    private String custName; // get the customer name from ID
    private String custCode; // get customer code from ID
    private String orderNum; // get the order number
    private Integer orderIdPass;
    private String itemName; //for testing
    private String customerPhone;
    private String customerMobile;
    private String customerEmail;
    private String customerFax;
    private Integer orderItemQuantityParam;
    private String orderItemNameSizeParam;
    private Double orderItemWeightParam;
    private Float orderItemVolumeParam;
    private String orderItemClassificationParam;
    private String orderItemDescriptionParam;
    private Float orderItemRateParam;
    private Double orderItemDeclaredValueParam;
    private String orderItemRemarksParam;
    private String orderPage;
    private Map<Integer, String> customerContactsMap = new LinkedHashMap<Integer, String>();
    private String dummyMsg;
    private Integer customerID;
    // map customer addresses on dropdown
    private Map<Integer, String> customerAddressMap = new HashMap<Integer, String>();
    // map customer consignee on dropdown
    private Map<Integer, String> customerConsigneeMap = new HashMap<Integer, String>();
    // map customer consignee address on dropdown
    private Map<Integer, String> consigneeAddressMap = new HashMap<Integer, String>();
    private Integer consigneeId;
    private Integer addressId;
    // map customer contact details
    private Map<String, String> customerPhoneMap = new HashMap<String, String>();
    private Map<String, String> customerMobileMap = new HashMap<String, String>();
    private Map<String, String> customerEmailMap = new HashMap<String, String>();
    private Map<String, String> customerFaxMap = new HashMap<String, String>();
    // map consignee contact person
    private Map<Integer, String> consigneeContactMap = new HashMap<Integer, String>();
    private Map<Double, Double> shipperItemVolumeMap = new HashMap<Double, Double>();
    private Map<String, String> shipperItemCommodityMap = new HashMap<String, String>();
    private Map<Double, Double> shipperItemValueMap = new HashMap<Double, Double>();
    private Map<Double, Double> shipperItemWeightMap = new HashMap<Double, Double>();
    private Map<Double, Double> shipperItemLengthMap = new HashMap<Double, Double>();
    private Map<Double, Double> shipperItemWidthMap = new HashMap<Double, Double>();
    private Map<Double, Double> shipperItemHeightMap = new HashMap<Double, Double>();
    private Map<String, String> shipperItemCodeMap = new HashMap<String, String>();
    private Map<String, String> shipperItemCommentsMap = new HashMap<String, String>();

    private Integer itemId;

    public String itemAction() {

        if(itemId != null){

            Items shipperItem = customerService.findItemByCustomerItemsId(itemId);
            shipperItemVolumeMap.put(shipperItem.getLength() * shipperItem.getWidth() * shipperItem.getHeight(), shipperItem.getLength() * shipperItem.getWidth() * shipperItem.getHeight());

            shipperItemCommodityMap.put(shipperItem.getDescription(), shipperItem.getDescription());

            shipperItemValueMap.put(shipperItem.getSrp(), shipperItem.getSrp());

            shipperItemWeightMap.put(shipperItem.getWeight(), shipperItem.getWeight());

            shipperItemCodeMap.put(shipperItem.getItemCode(), shipperItem.getItemCode());

            shipperItemLengthMap.put(shipperItem.getLength(), shipperItem.getLength());

            shipperItemWidthMap.put(shipperItem.getWidth(), shipperItem.getWidth());

            shipperItemHeightMap.put(shipperItem.getHeight(), shipperItem.getHeight());

            shipperItemCommentsMap.put(shipperItem.getNote(), shipperItem.getNote());

        }

        return SUCCESS;
    }

    public String customerAction() {

        if(customerID != null) {
            List<Contacts> shipperContacts = customerService.findContactsByCustomer(customerID);

            for (int i = 0; i < shipperContacts.size(); i++) {
                customerContactsMap.put(shipperContacts.get(i).getContactId(), shipperContacts.get(i).getFirstName() + ' ' + shipperContacts.get(i).getMiddleName() + ' ' + shipperContacts.get(i).getLastName());
            }

            List<Address> shipperAddresses = customerService.findAddressByShipper("CONSIGNEE", customerID);

            for (int i = 0; i < shipperAddresses.size(); i++) {
                customerAddressMap.put(shipperAddresses.get(i).getAddressId(), shipperAddresses.get(i).getAddressLine1() + ' ' + shipperAddresses.get(i).getCity());
            }

            List<Contacts> shipperConsignee = customerService.findContactByRefIdAndType("CONSIGNEE", customerID);

            for (int i = 0; i < shipperConsignee.size(); i++) {
                customerConsigneeMap.put(shipperConsignee.get(i).getContactId(), shipperConsignee.get(i).getCompanyName() + " / " + shipperConsignee.get(i).getFirstName() + ' ' + shipperConsignee.get(i).getMiddleName() + ' ' + shipperConsignee.get(i).getLastName());
            }

            List<Address> consigneeAddresses = customerService.findAddressByCriteria("CONSIGNEE", customerID);

            for (int i = 0; i < consigneeAddresses.size(); i++) {
                consigneeAddressMap.put(consigneeAddresses.get(i).getAddressId(), consigneeAddresses.get(i).getAddressLine1() + ' ' + consigneeAddresses.get(i).getAddressLine2() + ' ' + consigneeAddresses.get(i).getCity());
            }

            Customer customerContactInfo = customerService.findCustomerById(customerID);

            customerPhoneMap.put(customerContactInfo.getPhone(), customerContactInfo.getPhone());
            customerMobileMap.put(customerContactInfo.getMobile(), customerContactInfo.getMobile());
            customerEmailMap.put(customerContactInfo.getEmail(), customerContactInfo.getEmail());
            customerFaxMap.put(customerContactInfo.getFax(), customerContactInfo.getFax());

            List<Contacts> consigneeContacts = customerService.findConsigneeContactByRefIdAndType("C_CONTACT", customerID);

            for (int i = 0; i < consigneeContacts.size(); i++) {
                consigneeContactMap.put(consigneeContacts.get(i).getContactId(), consigneeContacts.get(i).getFirstName() + ' ' + consigneeContacts.get(i).getMiddleName() + ' ' + consigneeContacts.get(i).getLastName());
            }
        }

        return SUCCESS;
    }

    public String consigneeAction() {

        if (consigneeId != null) {
            Address consigneeAddress = customerService.findAddressByParameterMap(customerID, "CONSIGNEE", getClientId(), consigneeId);

            consigneeAddressMap.put(consigneeAddress.getAddressId(), consigneeAddress.getAddressLine1() + ' ' + consigneeAddress.getAddressLine2() + ' ' + consigneeAddress.getCity());

            List<Contacts> consigneeContacts = customerService.findContactByConsignee(consigneeId, "C_CONTACT", getClientId());

            for (int i = 0; i < consigneeContacts.size(); i++) {
                consigneeContactMap.put(consigneeContacts.get(i).getContactId(), consigneeContacts.get(i).getFirstName() + ' ' + consigneeContacts.get(i).getMiddleName() + ' ' + consigneeContacts.get(i).getLastName());
            }

        } else {
            List<Address> consigneeAddresses = customerService.findAddressByCriteria("CONSIGNEE", customerID);

            for (int i = 0; i < consigneeAddresses.size(); i++) {
                consigneeAddressMap.put(consigneeAddresses.get(i).getAddressId(), consigneeAddresses.get(i).getAddressLine1() + ' ' + consigneeAddresses.get(i).getAddressLine2() + ' ' + consigneeAddresses.get(i).getCity());
            }

        }

        return SUCCESS;
    }

    public String addressAction() {

        if (addressId != null) {
            Address consigneeAddress = customerService.findAddressById(addressId);

            Contacts customerConsignee = customerService.findContactById(consigneeAddress.getContactReferenceId());

            /*customerConsigneeMap.put(customerConsignee.getContactId(), customerConsignee.getFirstName() + ' ' + customerConsignee.getMiddleName() + ' ' + customerConsignee.getLastName());*/
            customerConsigneeMap.put(customerConsignee.getContactId(), customerConsignee.getCompanyName() + " / " + customerConsignee.getFirstName() + ' ' + customerConsignee.getMiddleName() + ' ' + customerConsignee.getLastName());

        } else {

            List<Contacts> customerConsignee = customerService.findContactByRefIdAndType("CONSIGNEE", customerID);

            for (int i = 0; i < customerConsignee.size(); i++) {
                /*customerConsigneeMap.put(customerConsignee.get(i).getContactId(), customerConsignee.get(i).getFirstName() + ' ' + customerConsignee.get(i).getMiddleName() + ' ' + customerConsignee.get(i).getLastName());*/
                customerConsigneeMap.put(customerConsignee.get(i).getContactId(), customerConsignee.get(i).getCompanyName() + " / " + customerConsignee.get(i).getFirstName() + ' ' + customerConsignee.get(i).getMiddleName() + ' ' + customerConsignee.get(i).getLastName());
            }
        }
        return SUCCESS;
    }

    public String viewOrders() {
        notificationService.clearNewBooking();
        int customerId = 0;
        if( commonUtils.getCustomerIdFromSession()!= null ){
            customerId = commonUtils.getCustomerIdFromSession();
        }else{
            customerId = getClientId();
        }

        String column = getColumnFilter();
        List<Orders> orderEntityList = new ArrayList<Orders>();
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        // This will check for the filter used by user to search for bookings
        if (StringUtils.isNotBlank(column)) {
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> column " + column);
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> keyword " + order.getOrderKeyword());

            if(column.equals("shipperCode")){
                List<Customer> customerEntityList = customerService.findCustomersByCriteria("customerName", order.getOrderKeyword(),getClientId());
                List <Orders> allOrderEntityList = orderService.findAllOrders();
                // To search for customer in booking
                for(Customer customerElem : customerEntityList){
                    for(Orders orderElem : allOrderEntityList){
                        if(customerElem.getCustomerId().equals(orderElem.getCustomerId())){
                            String strOrig = orderElem.getOrderStatus();
                            int intIndex = strOrig.indexOf("ARCHIVED");

                            if(intIndex == -1){
                                orders.add(transformToOrderFormBean(orderElem));
                            }

                        }
                    }
                }

            }else if(column.equals("consigneeCode")){
                List<Contacts> consigneeEntityList = customerService.findConsigneeByCriteria("companyName", order.getOrderKeyword(), getClientId());
                List <Orders> allOrderEntityList = orderService.findAllOrders();
                // To search for consignee in booking
                for(Contacts consigneeElem : consigneeEntityList){
                    for(Orders orderElem : allOrderEntityList){
                        if(consigneeElem.getContactId().equals(orderElem.getConsigneeContactId())){
                            String strOrig = orderElem.getOrderStatus();
                            int intIndex = strOrig.indexOf("ARCHIVED");

                            if(intIndex == -1){
                                orders.add(transformToOrderFormBean(orderElem));
                            }

                        }
                    }
                }

            }else{
                orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());

                for (Orders orderElem : orderEntityList) {
                    String strOrig = orderElem.getOrderStatus();
                    int intIndex = strOrig.indexOf("ARCHIVED");

                    if(intIndex == -1){
                        orders.add(transformToOrderFormBean(orderElem));
                    }

                }
            }
        } else {
            // check if the user is not a regular customer
            orderEntityList = orderService.findAllOrders();

            for (Orders orderElem : orderEntityList) {
                if(orderElem.getCustomerId() != customerId && customerId != getClientId()) {
                    continue;
                }
                // will input Aging on Service Accomplished status only
                if(orderElem.getOrderStatus().equals("SERVICE ACCOMPLISHED")) {
                    //TO CHECK FOR AGING AND MOVING TO ARCHIVE
                    String todayDate = (formatter.format(new Date()));
                    String accomplishedDate = (formatter.format(orderElem.getModifiedTimestamp()));

                    Date d1 = null;
                    Date d2 = null;

                    try {
                        d1 = formatter.parse(todayDate);
                        d2 = formatter.parse(accomplishedDate);
                        System.out.println(d1 + " Date Today");
                        System.out.println(d2 + " Accomplished Date");

                        long diff = d1.getTime() - d2.getTime();

                        long diffSeconds = diff / 1000 % 60;
                        long diffMinutes = diff / (60 * 1000) % 60;
                        long diffHours = diff / (60 * 60 * 1000) % 24;
                        long diffDays = diff / (24 * 60 * 60 * 1000);

                        System.out.println(diffDays + " days");
                        System.out.println(diffHours + " hours");
                        System.out.println(diffMinutes + " minutes");
                        System.out.println(diffSeconds + " seconds");

                        orderElem.setAging(Integer.parseInt(String.valueOf(diffDays)));
                        orderService.updateOrder(orderElem);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                // will change the order status if aging days are 30 or over
                if(orderElem.getAging() != null){
                    if(orderElem.getAging() >= 30){
                        orderElem.setOrderStatus("SERVICE ACCOMPLISHED - ARCHIVED");
                        orderService.updateOrder(orderElem);
                    }
                }
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    orders.add(transformToOrderFormBean(orderElem));
                }

            }

        }
        Booking = notificationService.countAll();
        System.out.println("The number of new booking is " + Booking);

        return SUCCESS;
    }

    public String viewArchivedOrders() {
        int customerId = 0;
        if( commonUtils.getCustomerIdFromSession()!= null ){
            customerId = commonUtils.getCustomerIdFromSession();
        }else{
            customerId = getClientId();
        }

        String column = getColumnFilter();
        List<Orders> orderEntityList = new ArrayList<Orders>();

        if (StringUtils.isNotBlank(column)) {

            if(column.equals("shipperCode")){
                List<Customer> customerEntityList = customerService.findCustomersByCriteria("customerName", order.getOrderKeyword(), getClientId());
                List <Orders> allOrderEntityList = orderService.findAllOrders();
                // To search for customer in booking
                for(Customer customerElem : customerEntityList){
                    for(Orders orderElem : allOrderEntityList){
                        if(customerElem.getCustomerId().equals(orderElem.getCustomerId())){
                            String strOrig = orderElem.getOrderStatus();
                            int intIndex = strOrig.indexOf("ARCHIVED");

                            if(intIndex != -1){
                                orders.add(transformToOrderFormBean(orderElem));
                            }

                        }
                    }
                }

            }else if(column.equals("consigneeCode")){
                List<Contacts> consigneeEntityList = customerService.findConsigneeByCriteria("companyName", order.getOrderKeyword(), getClientId());
                List <Orders> allOrderEntityList = orderService.findAllOrders();
                // To search for consignee in booking
                for(Contacts consigneeElem : consigneeEntityList){
                    for(Orders orderElem : allOrderEntityList){
                        if(consigneeElem.getContactId().equals(orderElem.getConsigneeContactId())){
                            String strOrig = orderElem.getOrderStatus();
                            int intIndex = strOrig.indexOf("ARCHIVED");

                            if(intIndex != -1){
                                orders.add(transformToOrderFormBean(orderElem));
                            }

                        }
                    }
                }

            }else{
                orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());

                for (Orders orderElem : orderEntityList) {
                    String strOrig = orderElem.getOrderStatus();
                    int intIndex = strOrig.indexOf("ARCHIVED");

                    if(intIndex != -1){
                        orders.add(transformToOrderFormBean(orderElem));
                    }

                }
            }
        } else {
            orderEntityList = orderService.findAllOrders();

            for (Orders orderElem : orderEntityList) {
                if(orderElem.getCustomerId() != customerId && customerId != getClientId()) {
                    continue;
                }

                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex != -1){
                    orders.add(transformToOrderFormBean(orderElem));
                }

            }

        }

        return SUCCESS;
    }

    public String viewOrdersBookingList() {

        //get columns filter
        String column = getColumnFilter();
        // list orderentitylist via arraylist
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

    public String loadSearchBookingPage(){ return SUCCESS; }

    public String bookingNumSearch(){ return SUCCESS; }

    public String loadAddOrderPage() {

        System.out.println("USERNAME " + commonUtils.getUserNameFromSession());

        User userEntity = userService.findUserByUserName(commonUtils.getUserNameFromSession());

        userType = userEntity.getUserType();

        if(userEntity.getUserType().equals("REGULAR CUSTOMER")){
            if(userEntity.getCustomerId() != null){
                Customer customerEntity = customerService.findCustomerById(userEntity.getCustomerId());
                customerList.add(customerEntity);
            }else{
                customerList = customerService.findAllCustomer();
            }
        }else{
            customerList = customerService.findAllCustomer();
        }

        return SUCCESS;
    }

   /* private CustomerBean transformToFormBean(Customer entity) {

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
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setServiceArea(entity.getServiceArea());

        return formBean;
    }*/

    public String editCustomerContactInfo() {

        Customer customerEntity = customerService.findCustomerById(customer.getCustomerId());

        Customer entity = new Customer();
        entity.setCustomerId(customerEntity.getCustomerId());
        entity.setClient(customerEntity.getClient());
        entity.setCustomerCode(customerEntity.getCustomerCode());
        entity.setCustomerName(customerEntity.getCustomerName());
        entity.setCustomerType(customerEntity.getCustomerType());
        entity.setWebsite(customerEntity.getWebsite());
        entity.setPhone(customer.getPhone());
        entity.setMobile(customer.getMobile());
        entity.setEmail(customer.getEmail());
        entity.setFax(customer.getFax());
        entity.setDti(customerEntity.getDti());
        entity.setMayorsPermit(customerEntity.getMayorsPermit());
        entity.setAaf(customerEntity.getAaf());
        entity.setSignatureCard(customerEntity.getSignatureCard());
        entity.setCreatedBy(customerEntity.getCreatedBy());
        entity.setCreatedTimestamp(customerEntity.getCreatedTimestamp());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedTimestamp(new Date());

        customerService.updateCustomer(entity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String addConsigneeContact() {

        try {
            Contacts contactEntity = transformToEntityBeanContacts(contact);
            contactEntity.setReferenceTable("CONTACTS");
            contactEntity.setContactType("C_CONTACT");
            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            contactEntity.setCreatedTimestamp(new Date());
            customerService.addContact(contactEntity);
        } catch (ContactAlreadyExistsException e) {
            /*addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;*/
        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String reloadAddOrderPage() {
        return SUCCESS;
    }

    public String addItemsInTable() {
        if (hasFieldErrors()) {
            return INPUT;
        }

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));
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

        // Get Service Requirement
        String orderLimit = orderEntityForm.getServiceRequirement();
        // Get Order Item List
        List<OrderItems> orderItemNumberList = orderService.findAllItemByOrderId((Integer) sessionAttributes.get("orderIdPass"));
        Integer checkItems = 0;
        Integer bookingItems = 0;
        for (OrderItems orderItemsElem : orderItemNumberList) {
            if(orderItemsElem.getNameSize().equals(item.getItemCode())){
                bookingItems += 1 ;
            }
            List<OrderStatusLogs> statusLogsEntity = orderStatusLogsService.findAllShipmentLogs(orderItemsElem.getOrderItemId());
            for(OrderStatusLogs statusLogsElem: statusLogsEntity){
                if (statusLogsElem.getStatus().equals("ARRIVED") || statusLogsElem.getStatus().equals("DELIVERED")){
                    checkItems += 1;
                }
            }
        }

        if(checkItems >= 1){
            clearErrorsAndMessages();
            addActionError("You can no longer add an item/container(s) for this booking because one or more existing item/container(s) had been arrived/delivered.");
            return "ERROR_ADD";
        }

        if(orderEntityForm.getServiceRequirement().equals("LESS CONTAINER LOAD") ||
           orderEntityForm.getServiceRequirement().equals("LOOSE CARGO LOAD") ||
           orderEntityForm.getServiceRequirement().equals("ROLLING CARGO LOAD") ||
           orderEntityForm.getServiceRequirement().equals("LESS TRUCK LOAD")) {

            // Check if Item Code exists in Customers Items Table
            /*List<Items> customerOldItems = customerService.findItemByCustomerId(item.getCustomerId());*/
            List<Items> allItemsList = customerService.findAllItemsInTable();
            Integer itemCheck = 0;
            for (Items itemsElem : allItemsList) {
                if (itemsElem.getItemCode().equals(item.getItemCode())) {
                    itemCheck = itemCheck + 1;
                }
            }

            if(itemCheck == 0){
                Items itemEntity = transformToEntityBeanItem(item);
                itemEntity.setModifiedBy(commonUtils.getUserNameFromSession());
                itemEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                itemEntity.setCreatedTimeStamp(new Date());
                customerService.addItem(itemEntity);
            }

        }

        // get total quantity from database
        Integer orderItemQuantityTotal = 0;

        for (int i = 0; i < orderItemNumberList.size(); i++) {

            orderItemQuantityTotal = orderItemQuantityTotal + orderItemNumberList.get(i).getQuantity();
        }

        OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);

        //Changes the order Status to pending
        if (orderEntityForm.getOrderStatus().equals("PENDING") || orderEntityForm.getOrderStatus().equals("INCOMPLETE")) {
            orderEntityForm.setOrderStatus("PENDING");
        } else {
            orderEntityForm.setOrderStatus(orderEntityForm.getOrderStatus());
        }

        orderService.updateOrder(orderEntityForm);

        //get quantity of item from form
        Integer orderItemEntityQuantity = orderItem.getQuantity();
        //count quantity of item from form and from database
        Integer orderItemQuantityGrandTotal = orderItemQuantityTotal + orderItemEntityQuantity;

        // Condition where it will only allow to add 5 containers and 10 items only
        if (orderLimit.equals("FULL CONTAINER LOAD") || orderLimit.equals("FULL TRUCK LOAD") ) {
            if (orderItemQuantityGrandTotal > 5) {
                String messageFlag = "FCL_LIMIT";
                sessionAttributes.put("messageFlag", messageFlag);

            } else {
                // Add order items to database
                if(orderItem.getQuantity() == 1){
                    orderItemEntity.setQuantity(1);
                    orderItemEntity.setNameSize(orderItem.getNameSize());
                    orderService.addItem(orderItemEntity);
                }else{
                    Integer saveLoop = orderItem.getQuantity();
                    for(int i = 0; i < saveLoop; i++ ){
                        orderItemEntity.setQuantity(1);
                        orderItemEntity.setNameSize(orderItem.getNameSize());
                        orderService.addItem(orderItemEntity);
                    }
                }

                String messageFlag = "FCL_OK";
                sessionAttributes.put("messageFlag", messageFlag);
            }

        } else {
            if (orderItemQuantityGrandTotal > 250) {
                String messageFlag = "OTHERS_LIMIT";
                sessionAttributes.put("messageFlag", messageFlag);
            } else {

                System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>booking items " + bookingItems);

                if(bookingItems == 0){
                    // Add order items to database
                    orderItemEntity.setQuantity(orderItem.getQuantity());

                    Items itemEntity = customerService.findItemByCode(item.getItemCode());
                    Double dblVolume = (orderItem.getQuantity() * (itemEntity.getLength() * itemEntity.getWidth() * itemEntity.getHeight()));
                    String strVolume = dblVolume.toString();

                    orderItemEntity.setVolume(Float.parseFloat(strVolume));
                    orderItemEntity.setNameSize(item.getItemCode());
                    orderService.addItem(orderItemEntity);
                }else{
                    for (OrderItems orderItemsElem : orderItemNumberList) {
                        if(orderItemsElem.getNameSize().equals(item.getItemCode())){

                            //Get orderItem Item Code
                            OrderItems oldOrderItemEntity = orderService.findOrderItemByOrderItemId(orderItemsElem.getOrderItemId());

                            //delete the existing item under the same order Items
                            orderService.deleteItem(oldOrderItemEntity);

                            Items itemEntity = customerService.findItemByCode(item.getItemCode());
                            Double dblVolume = oldOrderItemEntity.getVolume() + (orderItem.getQuantity() * (itemEntity.getLength() * itemEntity.getWidth() * itemEntity.getHeight()));
                            String strVolume = dblVolume.toString();

                            orderItemEntity.setQuantity(oldOrderItemEntity.getQuantity() + orderItem.getQuantity());
                            orderItemEntity.setWeight(oldOrderItemEntity.getWeight() + orderItem.getWeight());
                            orderItemEntity.setVolume(Float.parseFloat(strVolume));
                            orderItemEntity.setDeclaredValue(oldOrderItemEntity.getDeclaredValue() + orderItem.getDeclaredValue());
                            orderItemEntity.setNameSize(item.getItemCode());
                            orderService.addItem(orderItemEntity);

                        }
                    }
                }

                String messageFlag = "OTHERS_OK";
                sessionAttributes.put("messageFlag", messageFlag);
            }

        }

        // repopulate customer items
        sessionAttributes.put("customerItems", customerItems);
        // Get Order Id
        Integer idOrder = orderItemEntity.getOrderId();
        // Put Order Id in session
        sessionAttributes.put("idOrder", idOrder);

        return SUCCESS;
    }

    public String editItemsInTable() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        List<OrderItems> orderItemNumberList = orderService.findAllItemByOrderId(operationsService.findOrderItemById(orderItem.getOrderItemId()).getOrderId());

        Orders orderEntity = orderService.findOrdersById(operationsService.findOrderItemById(orderItem.getOrderItemId()).getOrderId());

        // get total quantity from database
        Integer orderItemQuantityTotal = 0;

        for (int i = 0; i < orderItemNumberList.size(); i++) {
            orderItemQuantityTotal = orderItemQuantityTotal + orderItemNumberList.get(i).getQuantity();
        }

        OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);

        //count quantity of item from form and from database
        Integer orderItemQuantityGrandTotal = orderItemQuantityTotal + orderItem.getQuantity();

        if(orderEntity.getServiceRequirement().equals("FULL CONTAINER LOAD") || orderEntity.getServiceRequirement().equals("FULL TRUCK LOAD")){
            if (orderItemQuantityGrandTotal > 5) {
                String messageFlag = "FCL_LIMIT";
                sessionAttributes.put("messageFlag", messageFlag);

            }else {
                // Add order items to database
                if(orderItem.getQuantity() == 1){
                    orderItemEntity.setQuantity(1);
                    orderItemEntity.setNameSize(orderItem.getNameSize());
                    orderService.updateItemListing(orderItemEntity);
                }else {
                    Integer saveLoop = orderItem.getQuantity();
                    for(int i = 0; i < saveLoop; i++ ){
                        orderItemEntity.setQuantity(1);
                        orderItemEntity.setNameSize(orderItem.getNameSize());
                        orderService.updateItemListing(orderItemEntity);
                    }
                }

                String messageFlag = "FCL_OK";
                sessionAttributes.put("messageFlag", messageFlag);
            }
        }else{
            if (orderItemQuantityGrandTotal > 250) {
                String messageFlag = "OTHERS_LIMIT";
                sessionAttributes.put("messageFlag", messageFlag);
            } else{
                // Add order items to database
                orderItemEntity.setQuantity(orderItem.getQuantity());

                /*Items itemEntity = customerService.findItemByCode(orderItem.getNameSize());*/
                Items itemEntity = customerService.findItemByCode(item.getItemCode());
                Double dblVolume = (orderItem.getQuantity() * (itemEntity.getLength() * itemEntity.getWidth() * itemEntity.getHeight()));
                String strVolume = dblVolume.toString();

                orderItemEntity.setVolume(Float.parseFloat(strVolume));
                orderItemEntity.setNameSize(item.getItemCode());
                orderService.updateItemListing(orderItemEntity);

                String messageFlag = "OTHERS_OK";
                sessionAttributes.put("messageFlag", messageFlag);
            }
        }
        // Get Order Id
        Integer idOrder = orderItemEntity.getOrderId();
        // Put Order Id in session
        sessionAttributes.put("orderIdPass", idOrder);

        return SUCCESS;
    }


    public String addedItemsInTable() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));

        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);
        // repopulate customer items
        Integer contactIdParam = orderEntityForm.getShipperContactId();
        Contacts contactEntity = customerService.findContactById(contactIdParam);
        Customer customerEntity = customerService.findCustomerById(contactEntity.getReferenceId());
        customerItems = customerService.findItemByCustomerId(customerEntity.getCustomerId());

        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId((Integer) sessionAttributes.get("idOrder"));

        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {

            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }
        // get message flag from session
        String messageFlagPass = sessionAttributes.get("messageFlag").toString();

        if (messageFlagPass == "FCL_LIMIT") {
            //error add container
            clearErrorsAndMessages();
			addActionError("Sorry you can not exceed 5 containers.");
        } else if (messageFlagPass == "OTHERS_LIMIT") {
            //error add item
            clearErrorsAndMessages();
			addActionError("Sorry you can not exceed 250 items.");
        } else {
            // Success Add item
            clearErrorsAndMessages();
			addActionMessage("Success! Booking Item has been added.");
        }

        sessionAttributes.put("customerItems", customerItems);
        return SUCCESS;
    }

    public String addItemsAlreadyExists() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));
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
        addFieldError("item.itemCode", getText("err.itemCode.already.exists"));
        return SUCCESS;
    }

    public String deleteItem() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        // Get Order Item Entity
        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemIdParam);
        List<OrderStatusLogs> statusLogsEntity = orderStatusLogsService.findAllShipmentLogs(orderItemIdParam);
        for(OrderStatusLogs statusLogsElem: statusLogsEntity){
            if (statusLogsElem.getStatus().equals("ARRIVED") || statusLogsElem.getStatus().equals("DELIVERED")){
                // repopulate booking details on first form
                Orders orderEntityForm = orderService.findOrdersById(orderItemEntity.getOrderId());
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

                clearErrorsAndMessages();
                addActionError("You can no longer delete an item/container(s) for this booking because one or more existing item/container(s) had been arrived/delivered.");
                return "ERROR_DELETE";
            }
        }

        orderService.deleteItem(orderItemEntity);
        // repopulate booking details on first form
        Orders orderEntityForm = orderService.findOrdersById(orderItemEntity.getOrderId());
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);
        // repopulate customer items after order item delete
        customerItems = (List) sessionAttributes.get("customerItems");

        // Display order items in table
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderItemEntity.getOrderId());

        for (OrderItems orderItemElem : orderItemEntityList) {

            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }

        if(orderItemEntityList.size() == 0) {
            orderEntityForm.setOrderStatus("INCOMPLETE");
            orderService.updateOrder(orderEntityForm);
        }
        clearErrorsAndMessages();
        addActionMessage("Success! Booking Item has been deleted.");

        sessionAttributes.put("orderIdPass", orderEntityForm.getOrderId());

        return SUCCESS;
    }

    public String bookingSearch() {
        return SUCCESS;
    }

    public String createReport() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        // Booking Request Form will be created under pending documents start
        Documents documentEntity = new Documents();
        Client client = clientService.findClientById(getClientId().toString());
        documentEntity.setClient(client);
        documentEntity.setDocumentName(DocumentsConstants.BOOKING_REQUEST_FORM);
        documentEntity.setReferenceId(orderIdParam);
        documentEntity.setReferenceTable("ORDERS");
        documentEntity.setOrderNumber(orderService.findOrdersById(orderIdParam).getOrderNumber());
        documentEntity.setCreatedDate(new Date());
        documentEntity.setDocumentStatus("FROM BOOKING");
        documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
        documentEntity.setOutboundStage(1);

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        if(orderEntity.getServiceType().equals("SHIPPING")){
            documentEntity.setDocumentProcessed(2);
            documentEntity.setFinalOutboundStage(1);
        }else{
            documentEntity.setDocumentProcessed(0);
            documentEntity.setOutboundStage(1);
        }

        documentEntity.setVendorCode("ELC");
        /*documentEntity.setDocumentType("MASTER");*/
        String documentCode = documentsService.findNextControlNo(getClientId(), "BRF"); // BRF for Booking Request Form Document Code
        documentEntity.setControlNumber(documentCode);

        documentEntity.setReferenceNumber(documentCode.replace("BRF-",""));

        documentsService.addDocuments(documentEntity);
        // Booking Request Form will be created under pending documents end

        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String addOrder() {
        /*validateOnSubmit(order);
        if (hasFieldErrors()) {
            return INPUT;
        }*/

        Orders orderEntity = transformToOrderEntityBean(order);

        orderService.addOrder(orderEntity);

        // Add Notification for user that booking was created
        Notification notificationEntity = new Notification();
        notificationEntity.setDescription("BOOKING");
        notificationEntity.setNotificationId(1);
        notificationEntity.setNotificationType("Email");
        notificationEntity.setReferenceId(1);
        notificationEntity.setReferenceTable("Order");
        notificationEntity.setUserId(1);

        notificationService.addNotification(notificationEntity);
        // End of Add Notification

        // To get generated Order Id
        orderIdPass = orderEntity.getOrderId();

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdPass", orderIdPass);

        // Booking Request Form will be created under pending documents start
        Documents documentEntity = new Documents();
        Client client = clientService.findClientById(getClientId().toString());
        documentEntity.setClient(client);
        documentEntity.setDocumentName(DocumentsConstants.BOOKING_REQUEST_FORM);
        documentEntity.setReferenceId(orderEntity.getOrderId());
        documentEntity.setReferenceTable("ORDERS");
        documentEntity.setOrderNumber(orderService.findOrdersById(orderEntity.getOrderId()).getOrderNumber());
        documentEntity.setCreatedDate(new Date());
        documentEntity.setDocumentStatus("FROM BOOKING");
        documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());

        if(orderEntity.getServiceType().equals("SHIPPING")){
            documentEntity.setDocumentProcessed(2);
            documentEntity.setFinalOutboundStage(1);
        }else{
            documentEntity.setDocumentProcessed(0);
            documentEntity.setOutboundStage(1);
        }

        documentEntity.setVendorCode("ELC");
        // To get the document control number
        String documentCode = documentsService.findNextControlNo(getClientId(), "BRF"); // BRF for Booking Request Form Document Code
        documentEntity.setControlNumber(documentCode);

        documentEntity.setReferenceNumber(documentCode.replace("BRF-",""));

        documentsService.addDocuments(documentEntity);
        // Booking Request Form will be created under pending documents end

        return SUCCESS;
    }

    public String addOrderInfo() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));
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

    public String loadEditItemListing() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        if (orderItemIdParam == null) {
            orderItemIdParam = (Integer) sessionAttributes.get("orderItemIdParam");
        }
        // Display Order Data to form
        Orders orderEntityForm = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));
        order = transformToOrderFormBean(orderEntityForm);

        OrderItems orderItemListingEntity = orderService.findOrderItemByOrderItemId(orderItemIdParam);
        orderItem = transformToOrderItemsFormBean(orderItemListingEntity);
        sessionAttributes.put("orderItemIdParam", orderItem.getOrderItemId());
        return SUCCESS;
    }

    public String loadEditOrderItem() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        // Display Order Data to form
        Orders orderEntityForm = orderService.findOrdersById((operationsService.findOrderItemById(orderItemIdParam)).getOrderId());
        order = transformToOrderFormBean(orderEntityForm);

        OrderItems orderItemListingEntity = orderService.findOrderItemByOrderItemId(orderItemIdParam);
        orderItem = transformToOrderItemsFormBean(orderItemListingEntity);

        // get contact id from shipper
        Integer contactIdParam = orderEntityForm.getShipperContactId();

        // shipper id from contact
        Contacts contactEntity = customerService.findContactById(contactIdParam);
        Customer customerEntity = customerService.findCustomerById(contactEntity.getReferenceId());

        customerItems = customerService.findItemByCustomerId(customerEntity.getCustomerId());

        items = customerService.findItemByCode(orderItemListingEntity.getNameSize());

        // get order items on order edit module
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId((operationsService.findOrderItemById(orderItemIdParam)).getOrderId());

        // display item listing in table
        /*for (OrderItems orderItemElem : orderItemEntityList) {
            if(orderItemListingEntity.getOrderItemId() != orderItemElem.getOrderItemId()){
                orderItems.add(transformToOrderItemsFormBean(orderItemElem));
            }
        }*/

        sessionAttributes.put("orderIdPass", orderEntityForm.getOrderId());

        return SUCCESS;
    }

    public String editItemListing() {
        OrderItems orderItemEntity = transformToOrderItemsEntityBean(orderItem);
        orderItemEntity.setQuantity(orderItem.getQuantity());
        orderService.updateItemListing(orderItemEntity);

        return SUCCESS;
    }

    public String loadSuccessEditItemListing() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));
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

        clearErrorsAndMessages();
        addActionMessage("Success! Container/Item listing has been updated.");
        return SUCCESS;
    }

    public String loadEditOrder() {

        //orderIdParam is Order ID passed from form
        Map sessionAttributes = ActionContext.getContext().getSession();

        User userEntity = userService.findUserByUserName(commonUtils.getUserNameFromSession());

        if(userEntity.getUserType().equals("REGULAR CUSTOMER")){
            if(userEntity.getCustomerId() != null){
                Customer customerEntity = customerService.findCustomerById(userEntity.getCustomerId());
                customerList.add(customerEntity);
            }else{
                customerList = customerService.findAllCustomer();
            }
        }else{
            customerList = customerService.findAllCustomer();
        }

        // If orderIdParam is null, value is only null when added via add contacts, address and consignee
        if (orderIdParam == null) {
            orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        }

        Orders orderEntityForm = orderService.findOrdersById(orderIdParam);
        //notification to correctly populate checkboxlist
        if (orderEntityForm.getNotificationType() != null) {
            notificationList = (orderEntityForm.getNotificationType().split("\\s*[,]\\s*"));
        }
        // Display Order Data to form
        order = transformToOrderFormBean(orderEntityForm);

        Contacts contactShipperName = customerService.findContactById(orderEntityForm.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());
        // displays customer contacts list
        contactsList = customerService.findContactByRefIdAndType("shipper", shipperName.getCustomerId());
        // display customer address list
        addressList = customerService.findAddressByShipper("CONSIGNEE", shipperName.getCustomerId());
        // displays customer consignee list
        consigneeList = customerService.findContactByRefIdAndType("CONSIGNEE", shipperName.getCustomerId());
        // displays customer consignee address list
        consigneeAddressList = customerService.findAddressByCriteria("CONSIGNEE", shipperName.getCustomerId());
        // displays contacts list under consignee
        consigneeContactsList = customerService.findContactByConsignee(orderEntityForm.getConsigneeContactId(), "C_CONTACT", getClientId());

        customerPhone = shipperName.getPhone();
        customerEmail = shipperName.getEmail();
        customerMobile = shipperName.getMobile();
        customerFax = shipperName.getFax();

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

        } catch (OrderAlreadyExistsException e) {
            addFieldError("order.orderNumber", getText("err.orderNumber.already.exists"));
            return INPUT;
        }

        return SUCCESS;

    }

    public String deleteOrder() {

        // If orderIdParam is null, value is only null when added via add contacts, address and consignee
        if (orderIdParam == null) {
            return SUCCESS;
        }

        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        if (orderEntity.getOrderStatus().equals("PENDING") || orderEntity.getOrderStatus().equals("CANCELLED") || orderEntity.getOrderStatus().equals("INCOMPLETE")) {
            orderService.deleteOrder(orderEntity);

            List<OrderItems> orderItemsEntity = orderService.findAllItemByOrderId(orderIdParam);
            // delete Order Items that are under OrderId
            for (OrderItems orderItemElem : orderItemsEntity) {
                orderService.deleteItem(orderItemElem);
            }

            List<Documents> orderDocumentsEntity = documentsService.findDocumentsByOrderId(orderIdParam);
            // delete all documents that are under Order Id
            for (Documents documentElem : orderDocumentsEntity){
                documentsService.deleteDocument(documentElem);
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
			addActionError("You can only delete booking with status of PENDING and CANCELLED.");
            return INPUT;
        }
    }

    public String approveOrder() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        List<OrderItems> orderItemsEntity = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        if(orderItemsEntity.size() == 0){
            List<Orders> orderEntityList = orderService.findAllOrders();

            for (Orders orderElem : orderEntityList) {
                orders.add(transformToOrderFormBean(orderElem));
            }

            sessionAttributes.put("orderIdParam", orderIdParam);

            clearErrorsAndMessages();
            addActionError("Booking must have at least 1 container/item");

            return INPUT;
        }

        Booking = notificationService.countAll();
        System.out.println("The number of new booking is " + Booking);

        orderEntity.setOrderStatus("APPROVED");
        orderService.updateOrder(orderEntity);

        for(int i=0; i < orderItemsEntity.size(); i++) {
            if(orderEntity.getServiceMode().equals("DELIVERY")){
                orderItemsEntity.get(i).setStatus("PLANNING 3");
            }else if(orderEntity.getServiceMode().equals("PICKUP") || orderEntity.getServiceMode().equals("INTER-WAREHOUSE")){
                orderItemsEntity.get(i).setStatus("PLANNING 2");
            }else{
                orderItemsEntity.get(i).setStatus("PLANNING 1");
            }
            orderService.updateItemListing(orderItemsEntity.get(i));
        }

        sessionAttributes.put("orderIdParam", orderIdParam);

        clearErrorsAndMessages();
        addActionMessage("Booking successfully Approved!");

        return SUCCESS;
    }

    public String archiveOrder(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        String str = orderEntity.getOrderStatus();

        orderEntity.setOrderStatus(str + " - ARCHIVED");
        orderService.updateOrder(orderEntity);

        sessionAttributes.put("orderIdParam", orderIdParam);

        clearErrorsAndMessages();
        addActionMessage("Booking successfully Archived!");

        return SUCCESS;
    }

    public String cancelOrder() {
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

        List<OrderItems> orderItemListing = operationsService.findAllOrderItemsByOrderId(orderIdParam);
        Integer checkItems = 0;
        for (OrderItems orderItemsElem : orderItemListing) {
            List<OrderStatusLogs> statusLogsEntity = orderStatusLogsService.findAllShipmentLogs(orderItemsElem.getOrderItemId());
            for(OrderStatusLogs statusLogsElem: statusLogsEntity){
                if (statusLogsElem.getStatus().equals("ARRIVED") || statusLogsElem.getStatus().equals("DELIVERED")){
                    checkItems = checkItems + 1;
                }
            }
        }

        if(checkItems >= 1){
            clearErrorsAndMessages();
            addActionError("You can't cancel booking with item status of ARRIVED or DELIVERED.");
            return INPUT;
        }

        else {
            Orders orderEntity = orderService.findOrdersById(orderIdParam);
            orderEntity.setOrderStatus("CANCELLED");
            orderService.updateOrder(orderEntity);

            for (int i = 0; i < orderItemListing.size(); i++) {
                orderItemListing.get(i).setVendorSea(null);
                orderItemListing.get(i).setVendorOrigin(null);
                orderItemListing.get(i).setVendorDestination(null);
                orderItemListing.get(i).setVesselScheduleId(null);
                orderItemListing.get(i).setDriverOrigin(null);
                orderItemListing.get(i).setDriverDestination(null);
                orderItemListing.get(i).setTruckOrigin(null);
                orderItemListing.get(i).setTruckDestination(null);
                orderItemListing.get(i).setFinalPickupDate(null);
                orderItemListing.get(i).setFinalDeliveryDate(null);
                orderItemListing.get(i).setContainerId(null);
                orderItemListing.get(i).setServiceRequirement(null);
                orderItemListing.get(i).setStatus("CANCELLED");
                orderService.updateItemListing(orderItemListing.get(i));
            }


            List<Documents> documentEntityListing = documentsService.findDocumentsByOrderId(orderIdParam);
            for (int j = 0; j < documentEntityListing.size(); j++) {
                documentsService.deleteDocument(documentEntityListing.get(j));
            }

            clearErrorsAndMessages();
            addActionMessage("Booking cancelled.");
            return SUCCESS;
        }
    }

    public String viewInfoOrder() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        }

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
        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.put("orderIdParam", orderIdParam);

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
            if(orderPage.equals("EDIT")){
                loadEditOrder();
            }
            User userEntity = userService.findUserByUserName(commonUtils.getUserNameFromSession());

            if(userEntity.getUserType().equals("REGULAR CUSTOMER")){
                if(userEntity.getCustomerId() != null){
                    Customer customerEntity = customerService.findCustomerById(userEntity.getCustomerId());
                    customerList.add(customerEntity);
                }else{
                    customerList = customerService.findAllCustomer();
                }
            }else{
                customerList = customerService.findAllCustomer();
            }
            return INPUT;
        }

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
        entity.setCompanyName(formBean.getCompanyName());

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
//
        if (customer != null) {
            orderBean.setCustomerName(customer.get(0).getCustomerName());
        } else {
            customer.get(0).setCustomerCode(orderBean.getConsigneeCode());
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
        orderBean.setShipperAddressId(order.getShipperAddressId());
        orderBean.setShipperContactId(order.getShipperContactId());

        // get Customer name
        Contacts shipperContactName = customerService.findContactById(order.getShipperContactId());

        orderBean.setShipperContactName(getFullName(shipperContactName));
        orderBean.setConsigneeAddressId(order.getConsigneeAddressId());
        orderBean.setConsigneeContactId(order.getConsigneeContactId());

        Contacts consigneeContactName = customerService.findContactById(order.getConsigneeContactId());

        /*orderBean.setConsigneeName(getFullName(consigneeContactName));*/
        orderBean.setConsigneeName(consigneeContactName.getCompanyName());
        orderBean.setAccountRep(order.getAccountRep());
        orderBean.setCreatedTimestamp(order.getCreatedTimestamp());

        User userEntity = userService.findUserByUserName(order.getCreatedBy());
        if(userEntity != null){
            orderBean.setCreatedBy(userEntity.getFirstName() + " " + userEntity.getLastName());
        }else{
            orderBean.setCreatedBy(order.getCreatedBy());
        }

        orderBean.setModifiedTimestamp(order.getModifiedTimestamp());
        orderBean.setModifiedBy(order.getModifiedBy());
        orderBean.setPickupDate(order.getPickupDate());

        if(order.getOriginationPort() != null){
            orderBean.setOriginationPort(order.getOriginationPort());
        }else if(order.getServiceMode().equals("DELIVERY")){
            orderBean.setOriginationPort("NOT APPLICABLE");
        }else{
            orderBean.setOriginationPort("NONE");
        }

        orderBean.setDeliveryDate(order.getDeliveryDate());

        if(order.getDestinationPort() != null){
            orderBean.setDestinationPort(order.getDestinationPort());
        }else if(order.getServiceMode().equals("PICKUP")){
            orderBean.setDestinationPort("NOT APPLICABLE");
        }else{
            orderBean.setDestinationPort("NONE");
        }

        orderBean.setRates(order.getRates());

        orderBean.setServiceRequirement(order.getServiceRequirement());

        Contacts contactShipperName = customerService.findContactById(order.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());

        if (shipperName != null) {
            orderBean.setCustomerId(shipperName.getCustomerId());
            orderBean.setCustomerName(shipperName.getCustomerName());
        }

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

        if(order.getPickupDate() != null){
            orderBean.setStrPickupDate(formatter.format(order.getPickupDate()));
        }else if(order.getServiceMode().equals("DELIVERY")){
            orderBean.setStrPickupDate("NOT APPLICABLE");
        }else{
            orderBean.setStrPickupDate("NONE");
        }

        if(order.getDeliveryDate() != null){
            orderBean.setStrDeliveryDate(formatter.format(order.getDeliveryDate()));
        }else if(order.getServiceMode().equals("PICKUP")){
            orderBean.setStrDeliveryDate("NOT APPLICABLE");
        }else{
            orderBean.setStrDeliveryDate("NONE");
        }

        orderBean.setOrderCompleted(formatter.format(order.getModifiedTimestamp()));

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
        if (order.getShipperAddressId() != null) {
            Address addresses = customerService.findAddressById(order.getShipperAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(addresses));
            orderBean.setShipperInfoAddress(address);
        } else {
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
        if (order.getConsigneeAddressId() != null) {
            Address consigneeAddress = customerService.findAddressById(order.getConsigneeAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(consigneeAddress));
            orderBean.setConsigneeInfoAddress(address);
        } else {
            address = new AddressBean();
            address.setAddress("NONE");
            orderBean.setConsigneeInfoAddress(address);
        }

        // for consignee contact person
        orderBean.setConsigneeContactPersonId(order.getConsigneeContactPersonId());
        if (order.getConsigneeContactPersonId() != null) {
            Contacts contactElem = customerService.findContactById(order.getConsigneeContactPersonId());
            orderBean.setConsigneeContactName(contactElem.getFirstName() + " " + contactElem.getMiddleName() + " " + contactElem.getLastName());
        }

        /*OUTBOUND DOCUMENTS*/
        outboundEntityList = documentsService.findDocumentsByOrderId(order.getOrderId());

        for (Documents documentElem : outboundEntityList) {
            if (documentElem.getDocumentName().equals("BOOKING REQUEST FORM")) {
                orderBean.setDocumentCheck("AVAILABLE");
                orderBean.setDocumentId(documentElem.getDocumentId());
            }
        }

        if(order.getAging() != null){
            orderBean.setAging(order.getAging());
        }else{
            orderBean.setAging(0);
        }


        /*//Will only compute for aging if status is service accomplished
        if(order.getOrderStatus().equals("SERVICE ACCOMPLISHED")){
            //TO CHECK FOR AGING AND MOVING TO ARCHIVE
            String todayDate = (formatter.format(new Date()));
            String accomplishedDate = (formatter.format(order.getModifiedTimestamp()));
            System.out.println(order.getModifiedTimestamp() + " Modified Timestamp");

            Date d1 = null;
            Date d2 = null;

            try{
                d1 = formatter.parse(todayDate);
                d2 = formatter.parse(accomplishedDate);
                System.out.println(d1 + " Date Today");
                System.out.println(d2 + " Accomplished Date");

                long diff = d1.getTime() - d2.getTime();

                long diffSeconds = diff / 1000 % 60;
                long diffMinutes = diff / (60 * 1000) % 60;
                long diffHours = diff / (60 * 60 * 1000) % 24;
                long diffDays = diff / (24 * 60 * 60 * 1000);

                System.out.println(diffDays + " days");
                System.out.println(diffHours + " hours");
                System.out.println(diffMinutes + " minutes");
                System.out.println(diffSeconds + " seconds");

                orderBean.setStrAging(diffDays + " day(s)");
                orderBean.setAging(Integer.parseInt(String.valueOf(diffDays)));

            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            orderBean.setStrAging("0 day(s)");
            orderBean.setAging(0);
        }*/

        return orderBean;
    }

    private OrderItemsBean transformToOrderItemsFormBean(OrderItems orderItem) {

        Map sessionAttributes = ActionContext.getContext().getSession();
        // Put Order Id to Order Id session
        sessionAttributes.get("orderIdPass");

        OrderItemsBean orderItemBean = new OrderItemsBean();

        orderItemBean.setOrderItemId(orderItem.getOrderItemId());
        orderItemBean.setVesselScheduleId(orderItem.getVesselScheduleId());
        orderItemBean.setDriverOrigin(orderItem.getDriverOrigin());
        orderItemBean.setDriverDestination(orderItem.getDriverDestination());
        orderItemBean.setTruckOrigin(orderItem.getTruckOrigin());
        orderItemBean.setTruckDestination(orderItem.getTruckDestination());
        orderItemBean.setFinalPickupDate(orderItem.getFinalPickupDate());
        orderItemBean.setFinalDeliveryDate(orderItem.getFinalDeliveryDate());
        orderItemBean.setVendorOrigin(orderItem.getVendorOrigin());
        orderItemBean.setVendorDestination(orderItem.getVendorDestination());
        orderItemBean.setVendorSea(orderItem.getVendorSea());
        orderItemBean.setServiceRequirement(orderItem.getServiceRequirement());
        orderItemBean.setQuantity(orderItem.getQuantity());

        Orders orderEntity = orderService.findOrdersById(operationsService.findOrderItemById(orderItem.getOrderItemId()).getOrderId());

        if(orderEntity.getServiceRequirement().equals("FULL CONTAINER LOAD") || orderEntity.getServiceRequirement().equals("FULL TRUCK LOAD")){
            orderItemBean.setNameSize(orderItem.getNameSize());
            orderItemBean.setItemName(orderItem.getNameSize());
        }else{
            Items itemEntity = customerService.findItemByCode(orderItem.getNameSize());
            orderItemBean.setNameSize(itemEntity.getItemCode());
            orderItemBean.setItemName(itemEntity.getItemName());
        }

        orderItemBean.setWeight(orderItem.getWeight());
        orderItemBean.setVolume(orderItem.getVolume());
        orderItemBean.setClassification(orderItem.getClassification());
        orderItemBean.setDescription(orderItem.getCommodity());
        orderItemBean.setRate(orderItem.getRate());
        orderItemBean.setDeclaredValue(orderItem.getDeclaredValue());
        orderItemBean.setRemarks(orderItem.getComments());
        orderItemBean.setContainerId(orderItem.getContainerId());

        return orderItemBean;
    }

    public OrderStatusLogsBean transformToOrderStatusLogsFormBean (OrderStatusLogs entity) {

        OrderStatusLogsBean formBean = new OrderStatusLogsBean();
        formBean.setStatusId(entity.getStatusId());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setActualDate(entity.getActualDate());
        formBean.setStatus(entity.getStatus());
        User userEntity = userService.findUserByUserName(entity.getCreatedBy());
        formBean.setCreatedBy(userEntity.getFirstName() + " " + userEntity.getLastName());
        formBean.setNameSize(orderService.findOrderItemByOrderItemId(entity.getOrderItemId()).getNameSize());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setOrderId(operationsService.findOrderItemById(entity.getOrderItemId()).getOrderId());

//        formBean.setContainerNumber(entity.getContainerNumber());
        /*if(entity.getActualDate() == null || (entity.getActualDate().equals("")){
            formBean.setActualDate("NONE");
        }*/
        return formBean;

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
        if (formBean.getOrderNumber() != null) {
            entity.setOrderNumber(new String(formBean.getOrderNumber()));
        } else {
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

        if(formBean.getFreightType().equals("TRUCKING")){
            entity.setDestinationPort("N/A");
        }else{
            entity.setDestinationPort(formBean.getDestinationPort());
        }

        entity.setComments(formBean.getComments());
        /*entity.setOrderStatus(formBean.getOrderStatus());*/  // still to be updated
        if (formBean.getOrderStatus() != null) {
            entity.setOrderStatus(formBean.getOrderStatus());
        } else {
            entity.setOrderStatus("INCOMPLETE");
        }
        entity.setRates(00.00); // still to be updated
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
        entity.setConsigneeContactPersonId(formBean.getConsigneeContactPersonId());

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

        if(formBean.getOrderItemId() != null) {
            entity.setOrderItemId(new Integer(formBean.getOrderItemId()));
        }
        Map sessionAttributes = ActionContext.getContext().getSession();
        entity.setOrderId((Integer) sessionAttributes.get("orderIdPass"));
        entity.setCommodity(formBean.getDescription());
        entity.setClassification(formBean.getClassification());
        entity.setDeclaredValue(formBean.getDeclaredValue());

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));

        if(orderEntity.getServiceRequirement().equals("FULL CONTAINER LOAD") || orderEntity.getServiceRequirement().equals("FULL TRUCK LOAD")){
            if (formBean.getNameSize().equals("10 FOOTER")){
                entity.setWeight(9000.00);
                entity.setVolume(14.0F);
            }else if(formBean.getNameSize().equals("20 FOOTER")){
                entity.setWeight(18000.00);
                entity.setVolume(28.0F);
            }else if(formBean.getNameSize().equals("40 STD FOOTER")){
                entity.setWeight(20000.00);
                entity.setVolume(56.0F);
            }else{
                entity.setWeight(22000.00);
                entity.setVolume(78.0F);
            }
        }else{
            entity.setWeight(formBean.getWeight());
            entity.setVolume(formBean.getVolume());
        }

        /*entity.setNameSize(formBean.getNameSize());*/
        entity.setServiceRequirement(orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass")).getServiceRequirement());
        entity.setRate(formBean.getRate());
        entity.setComments(formBean.getRemarks());

        // Trucking Freight Types will proceed to inland freight operations
        if(sessionAttributes.get("service_Mode").equals("DELIVERY")){
            entity.setStatus("PLANNING 3");
        }else if(sessionAttributes.get("service_Mode").equals("PICKUP") || sessionAttributes.get("service_Mode").equals("INTER-WAREHOUSE")){
            entity.setStatus("PLANNING 2");
        }else{
            entity.setStatus("PLANNING 1");
        }

        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedTimestamp(new Date());
        entity.setVesselScheduleId(formBean.getVesselScheduleId());
        entity.setFinalPickupDate(formBean.getFinalPickupDate());
        entity.setFinalDeliveryDate(formBean.getFinalDeliveryDate());
        entity.setDriverOrigin(formBean.getDriverOrigin());
        entity.setDriverDestination(formBean.getDriverDestination());
        entity.setTruckOrigin(formBean.getTruckOrigin());
        entity.setTruckDestination(formBean.getTruckDestination());
        entity.setVendorOrigin(formBean.getVendorOrigin());
        entity.setVendorDestination(formBean.getVendorDestination());
        entity.setVendorSea(formBean.getVendorSea());
        entity.setContainerId(formBean.getContainerId());
        entity.setServiceRequirement(formBean.getServiceRequirement());

        return entity;
    }

    /*Add Item inside Booking*/
    public String addItemInBooking() {
        validateOnSubmitItem(item);
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

        // repopulate customer items
        customerItems = customerService.findItemByCustomerId(itemEntity.getCustomerId());
        sessionAttributes.put("customerItems", customerItems);

        return SUCCESS;
    }

    /*public String addedItemInBooking() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntityForm = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdPass"));
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
    }*/

    public Items transformToEntityBeanItem(ItemBean formBean) {

        Items entity = new Items();
        entity.setClientId(commonUtils.getClientId());

        if (formBean.getCustomerItemsId() != null)
            entity.setCustomerItemsId(new Integer(formBean.getCustomerItemsId()));

        entity.setItemName(orderItem.getNameSize());
        entity.setItemCode(formBean.getItemCode());
        entity.setCustomerId(formBean.getCustomerId());
        entity.setSrp(orderItem.getDeclaredValue());
        entity.setLength(formBean.getLength());
        entity.setWidth(formBean.getWidth());
        entity.setHeight(formBean.getHeight());
        entity.setCriticalQuality(formBean.getCriticalQuality());
        entity.setWeight(orderItem.getWeight());
        entity.setNote(orderItem.getRemarks());
        entity.setDescription(orderItem.getDescription());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setCreatedTimeStamp(formBean.getCreatedTimeStamp());

        return entity;
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

        if (!matcher.matches()) {
            addFieldError("item.itemCode", getText("err.regex.validation.itemcode"));
        }

        Matcher matcher1 = pattern4.matcher(itemBean.getItemName());
        if (!matcher1.matches()) {
            addFieldError("item.itemName", getText("Special Characters in item name is not valid"));
        }

        Matcher matcher2 = pattern2.matcher(itemBean.getWeight().toString());
        if (!matcher2.matches()) {
            addFieldError("item.basePrice", getText("Special Characters in base price is not valid"));
        }

        Matcher matcher4 = pattern2.matcher(itemBean.getWidth().toString());
        if (!matcher4.matches()) {
            addFieldError("item.width", getText("Special Characters in width is not valid"));
        }

        Matcher matcher5 = pattern2.matcher(itemBean.getSrp().toString());
        if (!matcher5.matches()) {
            addFieldError("item.srp", getText("Special Characters in SRP is not valid"));
        }

        Matcher matcher6 = pattern2.matcher(itemBean.getLength().toString());
        if (!matcher6.matches()) {
            addFieldError("item.length", getText("Special Characters in length is not valid"));
        }

        Matcher matcher7 = pattern2.matcher(itemBean.getHeight().toString());
        if (!matcher7.matches()) {
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
        /*customerList = customerService.findAllCustomer();*/
        serviceRequirementList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.SERVICE_REQUIREMENT);
        freightTypeList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.FREIGHT_TYPE);
        modeOfPaymentList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_PAYMENT);
        modeOfServiceList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_SERVICE);
        notifyByList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.NOTIFY_BY);
        orderSearchList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.ORDER_SEARCH);
        bookingNumSearchList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.BOOKING_SEARCH);
        portsList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.PORTS);
        contactTypeList = parameterService.getParameterMap(ParameterConstants.CONTACT_TYPE);
        addressTypeList = parameterService.getParameterMap(ParameterConstants.ADDRESS_TYPE);
        containerList = parameterService.getParameterMap(ParameterConstants.CONTAINER_SIZE);

        containerQuantity = new ArrayList<Integer>();
        for (int i = 1; i <= 5; i++) {
            containerQuantity.add(i);
        }

        itemQuantity = new ArrayList<Integer>();
        for (int i = 1; i <= 250; i++) {
            itemQuantity.add(i);
        }

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

    public List<Parameters> getBookingNumSearchList() {
        return bookingNumSearchList;
    }

    public void setBookingNumSearchList(List<Parameters> bookingNumSearchList) {
        this.bookingNumSearchList = bookingNumSearchList;
    }

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
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

    public Map<Double, Double> getShipperItemValueMap() {
        return shipperItemValueMap;
    }

    public void setShipperItemValueMap(Map<Double, Double> shipperItemValueMap) {
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

    public Map<Double, Double> getShipperItemWeightMap() {
        return shipperItemWeightMap;
    }

    public void setShipperItemWeightMap(Map<Double, Double> shipperItemWeightMap) {
        this.shipperItemWeightMap = shipperItemWeightMap;
    }

    public Integer getOrderItemIdParam() {
        return orderItemIdParam;
    }

    public void setOrderItemIdParam(Integer orderItemIdParam) {
        this.orderItemIdParam = orderItemIdParam;
    }

    public List<Parameters> getContactTypeList() {
        return contactTypeList;
    }

    public void setContactTypeList(List<Parameters> contactTypeList) {
        this.contactTypeList = contactTypeList;
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

//    public DocumentsService getDocumentsService() {
//        return documentsService;
//    }

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

    public BigInteger getBooking() {
        return Booking;
    }

    public void setBooking(BigInteger booking) {
        Booking = booking;
    }

    public Map<String, String> getCustomerFaxMap() {
        return customerFaxMap;
    }

    public void setCustomerFaxMap(Map<String, String> customerFaxMap) {
        this.customerFaxMap = customerFaxMap;
    }

    public Map<String, String> getCustomerEmailMap() {
        return customerEmailMap;
    }

    public void setCustomerEmailMap(Map<String, String> customerEmailMap) {
        this.customerEmailMap = customerEmailMap;
    }

    public Map<String, String> getCustomerMobileMap() {
        return customerMobileMap;
    }

    public void setCustomerMobileMap(Map<String, String> customerMobileMap) {
        this.customerMobileMap = customerMobileMap;
    }

    public Map<String, String> getCustomerPhoneMap() {
        return customerPhoneMap;
    }

    public void setCustomerPhoneMap(Map<String, String> customerPhoneMap) {
        this.customerPhoneMap = customerPhoneMap;
    }

    public Map<Integer, String> getConsigneeContactMap() {
        return consigneeContactMap;
    }

    public void setConsigneeContactMap(Map<Integer, String> consigneeContactMap) {
        this.consigneeContactMap = consigneeContactMap;
    }

    public CustomerBean getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerBean customer) {
        this.customer = customer;
    }

    public List<Contacts> getConsigneeContactsList() {
        return consigneeContactsList;
    }

    public void setConsigneeContactsList(List<Contacts> consigneeContactsList) {
        this.consigneeContactsList = consigneeContactsList;
    }

    public String getCustomerFax() {
        return customerFax;
    }

    public void setCustomerFax(String customerFax) {
        this.customerFax = customerFax;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerMobile() {
        return customerMobile;
    }

    public void setCustomerMobile(String customerMobile) {
        this.customerMobile = customerMobile;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public List<Documents> getOutboundEntityList() {
        return outboundEntityList;
    }

    public void setOutboundEntityList(List<Documents> outboundEntityList) {
        this.outboundEntityList = outboundEntityList;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public List<Parameters> getContainerList() {
        return containerList;
    }

    public void setContainerList(List<Parameters> containerList) {
        this.containerList = containerList;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }

    public Map<Double, Double> getShipperItemLengthMap() {
        return shipperItemLengthMap;
    }

    public void setShipperItemLengthMap(Map<Double, Double> shipperItemLengthMap) {
        this.shipperItemLengthMap = shipperItemLengthMap;
    }

    public Map<Double, Double> getShipperItemWidthMap() {
        return shipperItemWidthMap;
    }

    public void setShipperItemWidthMap(Map<Double, Double> shipperItemWidthMap) {
        this.shipperItemWidthMap = shipperItemWidthMap;
    }

    public Map<Double, Double> getShipperItemHeightMap() {
        return shipperItemHeightMap;
    }

    public void setShipperItemHeightMap(Map<Double, Double> shipperItemHeightMap) {
        this.shipperItemHeightMap = shipperItemHeightMap;
    }

    public Map<String, String> getShipperItemCodeMap() {
        return shipperItemCodeMap;
    }

    public void setShipperItemCodeMap(Map<String, String> shipperItemCodeMap) {
        this.shipperItemCodeMap = shipperItemCodeMap;
    }

    public Map<String, String> getShipperItemCommentsMap() {
        return shipperItemCommentsMap;
    }

    public void setShipperItemCommentsMap(Map<String, String> shipperItemCommentsMap) {
        this.shipperItemCommentsMap = shipperItemCommentsMap;
    }

    public Items getItems() {
        return items;
    }

    public void setItems(Items items) {
        this.items = items;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String getOrderPage() {
        return orderPage;
    }

    public void setOrderPage(String orderPage) {
        this.orderPage = orderPage;
    }

    public OrderStatusLogsService getOrderStatusLogsService() {
        return orderStatusLogsService;
    }

    public void setOrderStatusLogsService(OrderStatusLogsService orderStatusLogsService) {
        this.orderStatusLogsService = orderStatusLogsService;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}

