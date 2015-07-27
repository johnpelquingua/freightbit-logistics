package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.documentation.formbean.DocumentsBean;
import com.sr.apps.freightbit.operations.formbean.ContainerBean;
import com.sr.apps.freightbit.operations.formbean.OperationsBean;
import com.sr.apps.freightbit.operations.formbean.VesselScheduleBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.DocumentsConstants;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.apps.freightbit.vendor.formbean.DriverBean;
import com.sr.apps.freightbit.vendor.formbean.TruckBean;
import com.sr.apps.freightbit.vendor.formbean.VendorBean;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.operations.entity.Container;
import com.sr.biz.freightbit.operations.exceptions.ContainerAlreadyExistsException;
import com.sr.biz.freightbit.operations.service.ContainerService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.entity.Vessel;
import com.sr.biz.freightbit.vendor.exceptions.DriverAlreadyExistsException;
import com.sr.biz.freightbit.vendor.exceptions.TrucksAlreadyExistsException;
import com.sr.biz.freightbit.vendor.exceptions.VendorAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import com.sr.biz.freightbit.vesselSchedule.exception.VesselSchedulesAlreadyExistsException;
import com.sr.biz.freightbit.vesselSchedule.service.VesselSchedulesService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class OperationsAction extends ActionSupport implements Preparable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(OperationsAction.class);

    private Integer orderIdParam;
    private Integer orderItemIdParam;
    private Integer nameSizeParam;
    private Integer vendorId;
    private String vendorCode;
    private String orderNoParam;
    private Integer vesselScheduleIdParam;
    private Integer vendorIdParam;
    private String editParam;
    private Integer documentIdParam;
    private Integer containerIdParam;
    private String driverCodeParam;
    private String truckCodeParam;
    private String finalPickupParam;
    private String finalDeliveryParam;
    private String scheduleExists;
    private String originConfirmFlag;
    private String destinationConfirmFlag;
    private String containerNumberPlaceHolder;

    private List<Parameters> truckTypeList = new ArrayList<Parameters>();
    private List<Parameters> bookingNumSearchList = new ArrayList<Parameters>();
    private List<Parameters> containerSearchList = new ArrayList<Parameters>();

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderBean> fclTable = new ArrayList<OrderBean>();
    private List<OrderBean> fclTruckTable = new ArrayList<OrderBean>();
    private List<OrderBean> fclTruckTableDes = new ArrayList<OrderBean>();
    private List<OrderBean> lclTable = new ArrayList<OrderBean>();
    private List<OrderBean> lclTruckTable = new ArrayList<OrderBean>();
    private List<OrderBean> lclTruckTableDes = new ArrayList<OrderBean>();
    private List<OrderBean> lcuTable = new ArrayList<OrderBean>();
    private List<OrderBean> lcuTruckTable = new ArrayList<OrderBean>();
    private List<OrderBean> lcuTruckTableDes = new ArrayList<OrderBean>();
    private List<OrderBean> rcuTable = new ArrayList<OrderBean>();
    private List<OrderBean> rcuTruckTable = new ArrayList<OrderBean>();
    private List<OrderBean> rcuTruckTableDes = new ArrayList<OrderBean>();
    private List<OrderBean> ftlTable = new ArrayList<OrderBean>();
    private List<OrderBean> ltlTable = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<OrderItemsBean> currentVesselSchedule = new ArrayList<OrderItemsBean>();
    private VesselScheduleBean vesselSchedule = new VesselScheduleBean();
    private List<VesselScheduleBean> vesselSchedules = new ArrayList<VesselScheduleBean>();
//    private List<VesselScheduleBean> currentVesselSchedules = new ArrayList<VesselScheduleBean>();
    private List<ContainerBean> containers = new ArrayList<ContainerBean>();
    private List<DocumentsBean> documents = new ArrayList<DocumentsBean>();
    private List<VesselScheduleBean> vesselScheduleList = new ArrayList<VesselScheduleBean>();

    private List<Vendor> vendorShippingList = new ArrayList<Vendor>();
    private List<Vendor> vendorShippingListClass = new ArrayList<Vendor>();
    private List<Vendor> vendorTruckingList = new ArrayList<Vendor>();
    private List<Vendor> vendorTruckingOriginList = new ArrayList<Vendor>();
    private List<Vendor> vendorTruckingDestinationList = new ArrayList<Vendor>();
    private List<Parameters> vendorTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorClassList = new ArrayList<Parameters>();
    private List<Parameters> statusList = new ArrayList<Parameters>();
    private List<Parameters> updateStatusList = new ArrayList<Parameters>();
    private List<Driver> listDrivers = new ArrayList<Driver>();
    private List<VendorBean> vendors = new ArrayList<VendorBean>();
    private List<Parameters> portsList = new ArrayList<Parameters>();
    private List<Parameters> containerSizeList = new ArrayList<Parameters>();
    private List<Parameters> containerEirTypeList = new ArrayList<Parameters>();
    private List<Parameters> containerStatusList = new ArrayList<Parameters>();
    private List<Vessel> listVessel = new ArrayList<Vessel>();
    private List<Vendor> vendorList = new ArrayList<Vendor>();

    private OrderItemsBean orderItem = new OrderItemsBean();
    private List<OrderItemsBean> orderItemFreightPlan = new ArrayList<OrderItemsBean>();
    private List<OrderItemsBean> orderItemVesselSchedule = new ArrayList<OrderItemsBean>();
    private List<OrderItemsBean> orderItemOriginVendor = new ArrayList<OrderItemsBean>();
    private List<OrderItemsBean> orderItemDestinationVendor = new ArrayList<OrderItemsBean>();
    private OperationsBean operationsBean = new OperationsBean();
    private DocumentsBean document = new DocumentsBean();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();
    private VendorBean vendor = new VendorBean();
    private DriverBean driver = new DriverBean();
    private TruckBean truck = new TruckBean();
    private TruckBean truckDestination = new TruckBean();
    private ContainerBean container = new ContainerBean();
    private CustomerBean customer = new CustomerBean();

    private OperationsService operationsService;
    private VendorService vendorService;
    private VesselSchedulesService vesselSchedulesService;
    private OrderService orderService;
    private CustomerService customerService;
    private ParameterService parameterService;
    private NotificationService notificationService;
    private ClientService clientService;
    private CommonUtils commonUtils;
    private DocumentsService documentsService;
    private ContainerService containerService;

    private Map<String, String> driverMap = new LinkedHashMap<String, String>();
    private Map<String, String> trucksMap = new HashMap<String, String>();
    private Map<String, String> bodyTypeMap = new HashMap<String, String>();
    private Map<String, String> plateNumberMap = new HashMap<String, String>();
    private Map<Integer, Integer> grossWeightMap = new HashMap<Integer, Integer>();
    private Map<String, String> vesselMap = new HashMap<String, String>();

    Date filterPickup;
    Date filterDelivery;
    private String[] check;
    private String[] checkInland;
    private String checkLCL;
    private String originCity; // load table based on origin city
    private String destinationCity; // load table based on destination city
    private String originCityTruck; // load table based on origin city trucking
    private String destinationCityTruck; // load table based on destination city trucking
    private List<String> nameSizeList; // variable for storing one or more containers or item list
    Map paramMap = new HashMap();

    @Override
    public void prepare() {
        vendorShippingList = vendorService.findVendorsByCriteria("vendorType", "SHIPPING", 1);
        vendorTruckingList = vendorService.findVendorsByCriteria("vendorType", "TRUCKING", 1);
        vendorTypeList = parameterService.getParameterMap(ParameterConstants.VENDOR_TYPE);
        vendorClassList = parameterService.getParameterMap(ParameterConstants.VENDOR_CLASS);
        statusList = parameterService.getParameterMap(ParameterConstants.STATUS);
        portsList = parameterService.getParameterMap(ParameterConstants.PORTS);
        truckTypeList = parameterService.getParameterMap(ParameterConstants.TRUCK_TYPE);
        bookingNumSearchList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.BOOKING_SEARCH);
        containerSearchList = parameterService.getParameterMap(ParameterConstants.CONTAINER_SEARCH);
        containerSizeList = parameterService.getParameterMap(ParameterConstants.CONTAINERS, ParameterConstants.CONTAINER_SIZE);
        containerEirTypeList = parameterService.getParameterMap(ParameterConstants.CONTAINERS, ParameterConstants.EIR_TYPE);
        containerStatusList = parameterService.getParameterMap(ParameterConstants.CONTAINERS, ParameterConstants.CONTAINER_STATUS);
        vendorList = vendorService.findAllShippingVendor();
    }

    public String updateCompleteInlandPlanning() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        // Display basic order data
        Orders orderEntity = orderService.findOrdersById(orderId);
        //change order status to on going
        orderEntity.setOrderStatus("ON GOING");
        orderService.updateOrder(orderEntity);

        order = transformToOrderFormBean(orderEntity);

        List<OrderItems> orderItemsList =  operationsService.findAllOrderItemsByOrderId(orderId);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Items has been updated.");

        return SUCCESS;
    }

    public String reloadInlandPlanning(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        // Display basic order data
        Orders orderEntity = orderService.findOrdersById(orderId);

        order = transformToOrderFormBean(orderEntity);

        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(orderId);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Items has been updated.");

        return SUCCESS;
    }

    public String updateCompleteSeaPlanning() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        // Display basic order data
        Orders orderEntity = orderService.findOrdersById(orderId);
        //change order status to on going
        orderEntity.setOrderStatus("ON GOING");
        orderService.updateOrder(orderEntity);

        order = transformToOrderFormBean(orderEntity);
        // displays order items under orders
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderId);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String addDriver() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        try {
            Driver driverEntity = transformToEntityBeanDriver(driver);
            driverEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            driverEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            driverEntity.setCreatedTimestamp(new Date());
            driverEntity.setModifiedTimestamp(new Date());
            vendorService.addDriver(driverEntity);
        }catch (DriverAlreadyExistsException e) {
            addFieldError("driver.licenseNumber", getText("err.driver.already.exists"));
            sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
            return INPUT;
        }
        sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
        return SUCCESS;
    }

    public String addTrucks() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        try {
            Trucks truckEntity = transformToEntityBeanTrucks(truck);
            truckEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            truckEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            truckEntity.setCreatedTimestamp(new Date());
            truckEntity.setModifiedTimestamp(new Date());
            vendorService.addTrucks(truckEntity);
        }catch (TrucksAlreadyExistsException e) {
            addFieldError("truck.truckCode", getText("err.truck.already.exists"));
            sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
            return INPUT;
        }
        sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
        return SUCCESS;
    }

    public String addVendor(){
        Map sessionAttributes = ActionContext.getContext().getSession();
        try {
            Vendor vendorEntity = transformVendorToEntityBean(vendor);
            vendorEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            vendorEntity.setCreatedTimeStamp(new Date());
            vendorEntity.setModifiedTimeStamp(new Date());
            vendorEntity.setModifiedBY(commonUtils.getUserNameFromSession());
            vendorService.addVendor(vendorEntity);

        } catch (VendorAlreadyExistsException e) {
            sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
            addFieldError("vendor.vendorCode", getText("err.vendorCode.already.exists"));
            return INPUT;
        }
        sessionAttributes.put("orderIdParam", sessionAttributes.get("orderIdParam"));
        sessionAttributes.put("orderItemIdParam", sessionAttributes.get("orderItemIdParam"));
        sessionAttributes.put("nameSizeParam", sessionAttributes.get("nameSizeParam"));
        return SUCCESS;
    }

    private Vendor transformVendorToEntityBean(VendorBean vendorBean) {
        Vendor entity = new Vendor();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (vendorBean.getVendorId() != null) {
            entity.setVendorId(new Integer(vendorBean.getVendorId()));
        }

        entity.setVendorCode(vendorBean.getVendorCode());
        entity.setVendorClass(vendorBean.getVendorClass());
        entity.setVendorName(vendorBean.getVendorName());
        entity.setVendorType(vendorBean.getVendorType());
        entity.setServiceArea(vendorBean.getServiceArea());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimeStamp(new Date());
        entity.setModifiedTimeStamp(new Date());
        entity.setVendorStatus("ACTIVE");

        return entity;
    }

    public Driver transformToEntityBeanDriver(DriverBean driverBean) {
        Driver entity = new Driver();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (driverBean.getDriverId() != null) {
            entity.setDriverId(driverBean.getDriverId());
        }

        entity.setVendorId(driverBean.getVendorId());
        entity.setLicenseNumber(driverBean.getLicenseNumber());
        entity.setLastName(driverBean.getLastName());
        entity.setFirstName(driverBean.getFirstName());
        entity.setMiddleName(driverBean.getMiddleName());
        entity.setTitle(driverBean.getTitle());
        entity.setStatus(driverBean.getStatus());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(driverBean.getCreatedTimeStamp());
        entity.setModifiedTimestamp(new Date());
        return entity;

    }

    private Trucks transformToEntityBeanTrucks(TruckBean truckBean) {
        Trucks entity = new Trucks();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (truckBean.getTruckId() != null) {
            entity.setTruckId(truckBean.getTruckId());
        }

        entity.setVendorId(truckBean.getVendorId());
        entity.setTruckType(truckBean.getTruckType());
        entity.setPlateNumber(truckBean.getPlateNumber());
        entity.setModelNumber(truckBean.getModelNumber());
        entity.setModelYear(truckBean.getModelYear());
        entity.setEngineNumber(truckBean.getEngineNumber());
        entity.setTruckCode(truckBean.getTruckCode());
        entity.setGrossWeight(truckBean.getGrossWeight());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedTimestamp(new Date());
        entity.setMotorVehicleNumber(truckBean.getMotorVehicleNumber());
        entity.setIssueDate(truckBean.getIssueDate());
        entity.setNetWeight(truckBean.getNetWeight());
        entity.setNetCapacity(truckBean.getNetCapacity());
        entity.setOwnerName(truckBean.getOwnerName());
        entity.setOwnerAddress(truckBean.getOwnerAddress());
        entity.setOfficialReceipt(truckBean.getOfficialReceipt());

        return entity;
    }

    //utils
    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public void validateOnSubmit(VesselScheduleBean vesselSchedule) {
        clearErrorsAndMessages();

        if (StringUtils.isBlank(vesselSchedule.getVoyageNumber())) {
            addFieldError("vesselSchedule.voyageNumber", "Voyage Number is required");
        }

    }

    // method for bulk setting and editing of vendors
    public String checkItemStatus() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        List<Integer> planning1 = new ArrayList();
        List<Integer> planning2 = new ArrayList();
        List<Integer> planning3 = new ArrayList();
        List<Integer> onGoing = new ArrayList();

        System.out.println("CHECK WORD PASS " + check);
        System.out.println("ORDER ID " + orderItemIdParam);

        if ("".equals(orderItem.getEditItem())) {

            if (check == null) {
                return "NULL_INPUT";

            } else {
                for (int i =0; i<check.length; i++) {
                    System.out.println("CHECK PER ONE " + check[i]);
                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){ // catches error when no values inside check
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "NULL_INPUT";
                    }

                    Integer orderItemId = Integer.parseInt(check[i]);
                    OrderItems entity = orderService.findOrderItemByOrderItemId(orderItemId);
                    if(entity == null){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "id_deleted";
                    }
                    if ("PLANNING 1".equals(entity.getStatus())) {
                        planning1.add(orderItemId);
                        if (planning2.size() > 0 || planning3.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if ("PLANNING 2".equals(entity.getStatus())) {
                        planning2.add(orderItemId);
                        if (planning1.size() > 0 || planning3.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if  ("PLANNING 3".equals(entity.getStatus())) {
                        planning3.add(orderItemId);
                        if (planning1.size() > 0 || planning2.size() > 0) {
                            return INPUT;
                        }
                    }else if ("ON GOING".equals(entity.getStatus())) {
                        onGoing.add(orderItemId);
                        if (planning1.size() > 0 || planning2.size() > 0 || planning3.size() > 0) {
                            return INPUT;
                        }
                    }
                }
            }

            Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
            sessionAttributes.put("checkedItemsInSession", check);
            order = transformToOrderFormBean(orderEntity);

            /*if (planning1.size() > 0) {*/
            nameSizeList = new ArrayList<String>();

            Integer planSize;
            List<Integer> planningList = new ArrayList();

            if(planning1.size() == 0){
                if(planning2.size() == 0){
                    planSize = planning3.size();
                    planningList = planning3;
                }else{
                    planSize = planning2.size();
                    planningList = planning2;
                }
            }else if(planning1.size() > 0) {
                planSize = planning1.size();
                planningList = planning1;
            }else{
                planSize = onGoing.size();
                planningList = onGoing;
            }

            for(int i = 0; i < planSize; i++){

                OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planningList.get(i));

                nameSizeList.add(orderItemEntity.getNameSize());
                orderItemFreightPlan.add(transformToOrderItemFormBean(orderItemEntity));

            }

            List<OrderItems> orderItemsListing = orderService.findAllItemByOrderId(orderEntity.getOrderId());

            for(OrderItems orderItemElem : orderItemsListing){
                orderItemVesselSchedule.add(transformToOrderItemFormBean(orderItemElem));
            }

            vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

            // Vessel schedules filtered by origin and destination
            List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

            for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
                vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
            }

            sessionAttributes.put("nameSizeList", nameSizeList);
            sessionAttributes.put("orderItemFreightPlan", orderItemFreightPlan);

            if(planning1.size()> 0) {
                return SUCCESS;
            }
            else{
                return "errorInput";
            }

        } else {

            orderItem.setEditItem("");

            if (check == null) {
                return "NULL_INPUT";
            } else {
                for (int i =0; i<check.length; i++) {

                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){ // catches error when no values inside check
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "NULL_INPUT";
                    }

                    Integer orderItemId = Integer.parseInt(check[i]);
                    OrderItems entity = orderService.findOrderItemByOrderItemId(orderItemId);
                    if(entity == null){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "id_deleted";
                    }
                    if ("PLANNING 1".equals(entity.getStatus())) {
                        planning1.add(orderItemId);
                        if (planning2.size() > 0 || planning3.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if ("PLANNING 2".equals(entity.getStatus())) {
                        planning2.add(orderItemId);
                        if (planning1.size() > 0 || planning3.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if  ("PLANNING 3".equals(entity.getStatus())) {
                        planning3.add(orderItemId);
                        if (planning1.size() > 0 || planning2.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if ("ON GOING".equals(entity.getStatus())) {
                        onGoing.add(orderItemId);
                    }

                }

                Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
                sessionAttributes.put("checkedItemsInSession", check);
                order = transformToOrderFormBean(orderEntity);

                if (planning1.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < planning1.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planning1.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItemFreightPlan.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } else if (planning2.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < planning2.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planning2.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItemFreightPlan.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } else if (planning3.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < planning3.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planning3.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItemFreightPlan.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } else if (onGoing.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < onGoing.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(onGoing.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItemFreightPlan.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                }

                for(int x = 0; x < check.length; x++) {
                    OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(Integer.parseInt(check[x]));
                    orderItemVesselSchedule.add(transformToOrderItemFormBean(orderItemsListing));
                }

                vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

                // Vessel schedules filtered by origin and destination
                List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

                for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
                    vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
                }

                sessionAttributes.put("nameSizeList", nameSizeList);

                if(planning1.size() > 0 || planning2.size() > 0 || planning3.size() > 0 || onGoing.size() > 0) {
                    return "EDIT";
                }
                else{
                    return "errorEditInput";
                }
            }
        }
    }

    public String checkItemStatusInland() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        List<Integer> planning1 = new ArrayList();
        List<Integer> planning2 = new ArrayList();
        List<Integer> planning3 = new ArrayList();
        List<Integer> onGoing = new ArrayList();

        if ("".equals(orderItem.getEditItem())) {

            if (check == null) {
                return "NULL_INPUT";

            } else {
                for (int i =0; i<check.length; i++) {

                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){ // catches error when no values inside check
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "NULL_INPUT";
                    }

                    Integer orderItemId = Integer.parseInt(check[i]);
                    OrderItems entity = orderService.findOrderItemByOrderItemId(orderItemId);
                    if(entity == null){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "id_deleted";
                    }
                    if ("PLANNING 1".equals(entity.getStatus())) {
                        planning1.add(orderItemId);
                        if (planning2.size() > 0 || planning3.size() > 0 || onGoing.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if ("PLANNING 2".equals(entity.getStatus())) {
                        planning2.add(orderItemId);
                        if (planning1.size() > 0 || planning3.size() > 0 || onGoing.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if  ("PLANNING 3".equals(entity.getStatus())) {
                        planning3.add(orderItemId);
                        if (planning1.size() > 0 || planning2.size() > 0 || onGoing.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if ("ON GOING".equals(entity.getStatus())) {
                        onGoing.add(orderItemId);
                        if (planning1.size() > 0 || planning2.size() > 0 || planning3.size() > 0) {
                            return INPUT;
                        }
                    }
                }
            }

            Orders orderEntity = orderService.findOrdersById(orderIdParam);
            sessionAttributes.put("checkedItemsInSession", check);
            order = transformToOrderFormBean(orderEntity);

            nameSizeList = new ArrayList<String>();

            Integer planSize;
            List<Integer> planningList = new ArrayList();

            if(planning1.size() == 0){
                if(planning2.size() == 0){
                    planSize = planning3.size();
                    planningList = planning3;
                }else{
                    planSize = planning2.size();
                    planningList = planning2;
                }

            }else {
                planSize = planning1.size();
                planningList = planning1;
            }

            for(int i = 0; i < planSize; i++){
                OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planningList.get(i));
                nameSizeList.add(orderItemEntity.getNameSize());
                orderItems.add(transformToOrderItemFormBean(orderItemEntity));
            }

            for(int x = 0; x < check.length; x++) {
                OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(Integer.parseInt(check[x]));
                orderItemOriginVendor.add(transformToOrderItemFormBean(orderItemsListing));
                orderItemDestinationVendor.add(transformToOrderItemFormBean(orderItemsListing));
            }

            vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

            vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location
            sessionAttributes.put("nameSizeList", nameSizeList);
            sessionAttributes.put("orderItems", orderItems);
            sessionAttributes.put("orderIdParam", orderIdParam);
            sessionAttributes.put("orderItemIdParam", orderItemIdParam);

            if (planning2.size() > 0) {
                return "PLANNING 2";
            }
            else if (planning3.size() > 0) {
                if(onGoing.size() > 0){
                    return "errorInput";

                }
                return "PLANNING 3";
            }
            else{
                return "errorInput";
            }

        } else {

            orderItem.setEditItem("");

            if (check == null) {
                return "NULL_INPUT";
            } else {
                for (int i =0; i<check.length; i++) {

                    if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){ // catches error when no values inside check
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "NULL_INPUT";
                    }

                    Integer orderItemId = Integer.parseInt(check[i]);
                    OrderItems entity = orderService.findOrderItemByOrderItemId(orderItemId);

                    if(entity == null){
                        sessionAttributes.put("orderIdParam", orderIdParam);
                        return "id_deleted";
                    }

                    Orders orderEntity = orderService.findOrdersById(entity.getOrderId());

                    if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER") || orderEntity.getServiceMode().equals("PICKUP") || orderEntity.getServiceMode().equals("INTER-WAREHOUSE")){
                        if(entity.getVendorOrigin() == null){
                            return "noVendorInput";
                        }
                    }

                    else if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("PIER TO DOOR") || orderEntity.getServiceMode().equals("DELIVERY")){
                        if(entity.getVendorDestination() == null){
                            return "noVendorInput";
                        }
                    }

                    if ("PLANNING 2".equals(entity.getStatus())) {
                        planning2.add(orderItemId);
                        if (planning1.size() > 0 || planning3.size() > 0 || onGoing.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if  ("PLANNING 3".equals(entity.getStatus())) {
                        planning3.add(orderItemId);
                        if (planning1.size() > 0 || planning2.size() > 0 || onGoing.size() > 0) {
                            return INPUT;
                        }
                    }
                    else if ("ON GOING".equals(entity.getStatus())) {
                        onGoing.add(orderItemId);
                    }
                    /*else if ("QUEUE FOR PICKUP".equals(entity.getStatus())) {
                        queuePickup.add(orderItemId);
                    }
                    else if ("QUEUE FOR DELIVERY".equals(entity.getStatus())) {
                        queueDelivery.add(orderItemId);
                    }*/
                }

                Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
                sessionAttributes.put("checkedItemsInSession", check);
                order = transformToOrderFormBean(orderEntity);

                if (planning1.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < planning1.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planning1.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItems.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } else if (planning2.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < planning2.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planning2.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItems.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } else if (planning3.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < planning3.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(planning3.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItems.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } else if (onGoing.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < onGoing.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(onGoing.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItems.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } /*else if (queuePickup.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < queuePickup.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(queuePickup.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItems.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                } else if (queueDelivery.size() > 0) {

                    nameSizeList = new ArrayList<String>();

                    for(int i = 0; i < queueDelivery.size(); i++){
                        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(queueDelivery.get(i));
                        nameSizeList.add(orderItemEntity.getNameSize());
                        orderItems.add(transformToOrderItemFormBean(orderItemEntity));
                    }

                }*/

                for(int x = 0; x < check.length; x++) {
                    OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(Integer.parseInt(check[x]));
                    orderItemOriginVendor.add(transformToOrderItemFormBean(orderItemsListing));
                    orderItemDestinationVendor.add(transformToOrderItemFormBean(orderItemsListing));
                }

                vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

                vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location

                sessionAttributes.put("nameSizeList", nameSizeList);
                sessionAttributes.put("orderItems", orderItems);
                sessionAttributes.put("orderIdParam", orderIdParam);
                sessionAttributes.put("orderItemIdParam", orderItemIdParam);

                    if (planning2.size() > 0 || planning3.size() > 0 || onGoing.size() > 0) {
                        return "EDIT";
                    } else if (planning1.size() > 0) {
                        return "errorEditInput";
                    } else {
                        return "errorInput";
                    }
            }
        }
    }

    public String reloadEditPage() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        // for the order items to appear again
        nameSizeList = (List) sessionAttributes.get("nameSizeList") ;
        sessionAttributes.put("nameSizeList", nameSizeList);

        check = (String[]) sessionAttributes.get("checkedItemsInSession");

        for(int x = 0; x < check.length; x++) {
            OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(Integer.parseInt(check[x]));
            orderItemVesselSchedule.add(transformToOrderItemFormBean(orderItemsListing));
        }

        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        orderItemFreightPlan = (List) sessionAttributes.get("orderItemFreightPlan");

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        return SUCCESS;
    }

    public String addVesselScheduleInPlanningBulkEditAlreadyExists() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        // for the order items to appear again
        nameSizeList = (List) sessionAttributes.get("nameSizeList");
        sessionAttributes.put("nameSizeList", nameSizeList);
        orderItemFreightPlan = (List) sessionAttributes.get("orderItemFreightPlan");
        sessionAttributes.put("orderItemFreightPlan", orderItemFreightPlan);

        check = (String[]) sessionAttributes.get("checkedItemsInSession");

        for(int x = 0; x < check.length; x++) {
            OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(Integer.parseInt(check[x]));
            orderItemVesselSchedule.add(transformToOrderItemFormBean(orderItemsListing));
        }

        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Voyage Number entered already exists!");

        return SUCCESS;
    }

    public String editBulkItems() {

        Map sessionAttributes = ActionContext.getContext().getSession();
        try {

            String[] checkedItemsInSession = (String[]) sessionAttributes.get("checkedItemsInSession");

            for (String value : checkedItemsInSession) {

                String modeOfService = sessionAttributes.get("modeOfService").toString();
                String freightType = sessionAttributes.get("freightType").toString();

                Integer orderItemId = Integer.parseInt(value);
                OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemId);
                orderItemEntity.setOrderItemId(orderItemId);
                orderItemEntity.setVendorSea(vendorService.findVendorById(vendorIdParam).getVendorCode());
                orderItemEntity.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVoyageNumber());

                if("SHIPPING AND TRUCKING".equals(freightType)) {
                    if ("DOOR TO DOOR".equals(modeOfService)) {
                        if ("ON GOING".equals(orderItemEntity.getStatus())) {
                            orderItemEntity.setStatus("ON GOING");
                        } else {
                            orderItemEntity.setStatus("PLANNING 2");
                        }
                    } else if ("DOOR TO PIER".equals(modeOfService)) {
                        if ("ON GOING".equals(orderItemEntity.getStatus())) {
                            orderItemEntity.setStatus("ON GOING");
                        } else {
                            orderItemEntity.setStatus("PLANNING 2");
                        }
                    } else {
                        if ("ON GOING".equals(orderItemEntity.getStatus())) {
                            orderItemEntity.setStatus("ON GOING");
                        } else {
                            orderItemEntity.setStatus("PLANNING 3");
                        }
                    }
                }

                if ("SHIPPING".equals(freightType)) {
                    orderItemEntity.setStatus("ON GOING");
                }

                operationsService.updateOrderItem(orderItemEntity);
            }

        } catch (Exception e) {
            log.error("Update Orderitem failed", e);
            return INPUT;
        }

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location
        sessionAttributes.put("vendorIdParam", vendorIdParam);

        /*Integer orderId = (Integer) sessionAttributes.get("orderIdParam");*/

        return SUCCESS;
    }

    public String editBulkItemsInlandOrigin() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        try {

            String[] checkedItemsInSession = (String[]) sessionAttributes.get("checkedItemsInSession");

            for (String value : checkedItemsInSession) {

                String modeOfService = sessionAttributes.get("modeOfService").toString();
                String freightType = sessionAttributes.get("freightType").toString();

                Integer orderItemId = Integer.parseInt(value);
                if(orderItemId == null){
                    return INPUT;
                }
                OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemId);
                orderItemEntity.setOrderItemId(orderItemId);
                orderItemEntity.setVendorOrigin(vendorService.findVendorById(operationsBean.getVendorListOrigin()).getVendorCode());
                orderItemEntity.setDriverOrigin(operationsBean.getDriverOrigin());
                orderItemEntity.setTruckOrigin(operationsBean.getTruckOrigin());
                if(operationsBean.getPickupDate().equals("NaN-NaN-NaN")){
                    orderItemEntity.setFinalPickupDate("Invalid Pickup Date Selected");
                }else{
                    orderItemEntity.setFinalPickupDate(operationsBean.getPickupDate());
                }
                orderItemEntity.setClientId(1);

                if("SHIPPING AND TRUCKING".equals(freightType)) {
                    if ("DOOR TO DOOR".equals(modeOfService)) {
                        if ("ON GOING".equals(orderItemEntity.getStatus())) {
                            orderItemEntity.setStatus("ON GOING");
                        } else {
                            orderItemEntity.setStatus("PLANNING 3");
                        } /*else{
                            orderItemEntity.setStatus(orderItemEntity.getStatus());
                        }*/
                    } else {
                        orderItemEntity.setStatus("ON GOING");
                    }
                }

                if ("TRUCKING".equals(freightType)) {
                    orderItemEntity.setStatus("ON GOING");
                }

                operationsService.updateOrderItem(orderItemEntity);
            }

        } catch (Exception e) {
            log.error("Update OrderItem failed", e);
            return INPUT;
        }

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location
        sessionAttributes.put("vendorIdParam", vendorIdParam);

        return SUCCESS;
    }

    public String editBulkItemsInlandDestination() {

        Map sessionAttributes = ActionContext.getContext().getSession();
        try {

            String[] checkedItemsInSession = (String[]) sessionAttributes.get("checkedItemsInSession");

            for (String value : checkedItemsInSession) {

                String modeOfService = sessionAttributes.get("modeOfService").toString();
                String freightType = sessionAttributes.get("freightType").toString();

                Integer orderItemId = Integer.parseInt(value);
                if(orderItemId == null){
                    return INPUT;
                }
                OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemId);
                orderItemEntity.setOrderItemId(orderItemId);
                orderItemEntity.setVendorDestination(vendorService.findVendorById(operationsBean.getVendorListDestination()).getVendorCode());
                orderItemEntity.setDriverDestination(operationsBean.getDriverDestination());
                orderItemEntity.setTruckDestination(operationsBean.getTruckDestination());
                if(operationsBean.getDeliveryDate().equals("NaN-NaN-NaN")){
                    orderItemEntity.setFinalDeliveryDate("Invalid Delivery Date Selected");
                }else{
                    orderItemEntity.setFinalDeliveryDate(operationsBean.getDeliveryDate());
                }
                orderItemEntity.setClientId(1);

                if("SHIPPING AND TRUCKING".equals(freightType)) {
                    if ("DOOR TO DOOR".equals(modeOfService)) {
                        orderItemEntity.setStatus("ON GOING");
                    } else {
                        orderItemEntity.setStatus("ON GOING");
                    }
                }

                if ("TRUCKING".equals(freightType)) {
                    orderItemEntity.setStatus("ON GOING");
                }

                operationsService.updateOrderItem(orderItemEntity);

            }

        } catch (Exception e) {
            log.error("Update Orderitem failed", e);
            return INPUT;
        }

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location
        sessionAttributes.put("vendorIdParam", vendorIdParam);

        return SUCCESS;
    }

    public String editOrderItemsSeaConfirm() {

        System.out.println("OrderItemId " + orderItemIdParam);
        System.out.println("VesselScheduleId " + vesselScheduleIdParam);
        System.out.println("vendorId " + vendorIdParam);

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById(entity.getOrderId());
        order = transformToOrderFormBean(orderEntity);

        List <OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(entity.getOrderId());

        for(OrderItems orderItemsElem : orderItemsList){
            if(orderItemIdParam.equals(orderItemsElem.getOrderItemId())){
                orderItems.add(transformToOrderItemFormBean(orderItemsElem));
            }
        }

        VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam);
        vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);

        return SUCCESS;
    }

    public String editBulkOrderItemsSeaConfirm() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        check = (String[]) sessionAttributes.get("checkedItemsInSession");

        for (int i=0; i<check.length; i++) {
            System.out.println("CHECK ITEMS >>>>>>>>>>>>>>>>>" + check[i]);

            Integer orderItemId = Integer.parseInt(check[i]);
            OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemId);

            orderItems.add(transformToOrderItemFormBean(orderItemEntity));
        }

        System.out.println("VesselScheduleId " + vesselScheduleIdParam);

        VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam);
        vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);

        return SUCCESS;
    }

    public String editBulkOrderItemsOriginConfirm() {

        System.out.println("Vendor  >>>>>>>>>>>>>>>>>> " + vendorId);
        System.out.println("Driver  >>>>>>>>>>>>>>>>>> " + driverCodeParam);
        System.out.println("Truck  >>>>>>>>>>>>>>>>>> " + truckCodeParam);
        System.out.println("Pickup Date  >>>>>>>>>>>>>>>>>> " + finalPickupParam);

        Map sessionAttributes = ActionContext.getContext().getSession();

        check = (String[]) sessionAttributes.get("checkedItemsInSession");

        for (int i=0; i<check.length; i++) {
            System.out.println("CHECK ITEMS >>>>>>>>>>>>>>>>>" + check[i]);

            Integer orderItemId = Integer.parseInt(check[i]);
            OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemId);

            orderItems.add(transformToOrderItemFormBean(orderItemEntity));
        }

        Vendor vendorEntity = vendorService.findVendorById(vendorId);
        vendor.setVendorId(vendorEntity.getVendorId());
        vendor.setVendorName(vendorEntity.getVendorName());

        Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);
        truck = transformToFormBeanTrucks(truckEntity);

        originConfirmFlag = "MULTI";

        if(finalPickupParam.equals("NaN-NaN-NaN")){
            finalPickupParam = "Invalid Pickup Date Selected";
        }

        return SUCCESS;
    }

    public String editBulkOrderItemsDestinationConfirm() {

        System.out.println("Vendor  >>>>>>>>>>>>>>>>>> " + vendorId);
        System.out.println("Driver  >>>>>>>>>>>>>>>>>> " + driverCodeParam);
        System.out.println("Truck  >>>>>>>>>>>>>>>>>> " + truckCodeParam);
        System.out.println("Pickup Date  >>>>>>>>>>>>>>>>>> " + finalDeliveryParam);

        Map sessionAttributes = ActionContext.getContext().getSession();

        check = (String[]) sessionAttributes.get("checkedItemsInSession");

        for (int i=0; i<check.length; i++) {
            System.out.println("CHECK ITEMS >>>>>>>>>>>>>>>>>" + check[i]);

            Integer orderItemId = Integer.parseInt(check[i]);
            OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemId);

            orderItems.add(transformToOrderItemFormBean(orderItemEntity));
        }

        if(vendorId != null){
            Vendor vendorEntity = vendorService.findVendorById(vendorId);
            vendor.setVendorId(vendorEntity.getVendorId());
            vendor.setVendorName(vendorEntity.getVendorName());
        }

        if(truckCodeParam != null){
            Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);
            truck = transformToFormBeanTrucks(truckEntity);
        }

        destinationConfirmFlag = "MULTI";

        if(finalDeliveryParam.equals("NaN-NaN-NaN")){
            finalDeliveryParam = "Invalid Delivery Date Selected";
        }

        return SUCCESS;
    }

    public String editOrderItemsSea() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        if(orderItemIdParam != null){

            OrderItems entity = transformOrderItemToEntityBeanSea(operationsBean);
            Orders orderEntity = orderService.findOrdersById(entity.getOrderId());
            if(orderEntity.getOrderStatus().equals("CANCELLED")) {
                clearErrorsAndMessages();
                addActionError("Status must be Planning 1 only.");
                order = transformToOrderFormBean(orderEntity);

                for (OrderItems orderItemsElem : orderItemsList) {
                    orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                    return "errorStat";
                }
            }

            entity.setVendorSea(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVendorCode());
            entity.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVoyageNumber());
            operationsService.updateOrderItem(entity);

            // will set all remaining order items under the same shipping vendor
            List<OrderItems> OrderItemsPlanning = operationsService.findAllOrderItemsByOrderId(entity.getOrderId());

            for(OrderItems orderItemElem : OrderItemsPlanning ){

                OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemElem.getOrderItemId());

                OrderItems newEntity = new OrderItems();

                Client client = clientService.findClientById(getClientId().toString());

                newEntity.setOrderItemId(orderItemEntity.getOrderItemId());
                newEntity.setClientId(client.getClientId());
                newEntity.setNameSize(orderItemEntity.getNameSize());
                newEntity.setOrderId(orderItemEntity.getOrderId());
                newEntity.setQuantity(orderItemEntity.getQuantity());
                newEntity.setClassification(orderItemEntity.getClassification());
                newEntity.setDeclaredValue(orderItemEntity.getDeclaredValue());
                newEntity.setRate(orderItemEntity.getRate());
                newEntity.setCreatedBy(orderItemEntity.getCreatedBy());
                newEntity.setModifiedBy(orderItemEntity.getModifiedBy());
                newEntity.setComments(orderItemEntity.getComments());
                newEntity.setCommodity(orderItemEntity.getCommodity());
                newEntity.setCreatedTimestamp(orderItemEntity.getCreatedTimestamp());
                newEntity.setModifiedTimestamp(orderItemEntity.getModifiedTimestamp());
                newEntity.setWeight(orderItemEntity.getWeight());
                newEntity.setVolume(orderItemEntity.getVolume());
                newEntity.setServiceRequirement(orderItemEntity.getServiceRequirement());

                newEntity.setVendorSea(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVendorCode());
                newEntity.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVoyageNumber());

                if("SHIPPING AND TRUCKING".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemEntity.getOrderItemId()).getOrderId()).getServiceType())) {
                    if ("DOOR TO DOOR".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemEntity.getOrderItemId()).getOrderId()).getServiceMode())) {
                        newEntity.setStatus("PLANNING 2");
                    } else if ("DOOR TO PIER".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemEntity.getOrderItemId()).getOrderId()).getServiceMode())) {
                        newEntity.setStatus("PLANNING 2");
                    } else {
                        newEntity.setStatus("PLANNING 3");
                    }
                }else{
                    newEntity.setStatus("ON GOING");
                }

                operationsService.updateOrderItem(newEntity);
            }

        }else{

            check = (String[]) sessionAttributes.get("checkedItemsInSession");

            for (int i=0; i<check.length; i++) {

                Integer orderItemId = Integer.parseInt(check[i]);
                OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemId);
                Orders orderEntity = orderService.findOrdersById(orderItemEntity.getOrderId());
                if(orderEntity.getOrderStatus().equals("CANCELLED")){
                    order = transformToOrderFormBean(orderEntity);

                    for(OrderItems orderItemsElem : orderItemsList) {
                        orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                    }
                    clearErrorsAndMessages();
                    addActionError("Status must be Planning 1 only.");
                    return "errorStat";
                }
                OrderItems newEntity = new OrderItems();

                Client client = clientService.findClientById(getClientId().toString());

                newEntity.setOrderItemId(orderItemEntity.getOrderItemId());
                newEntity.setClientId(client.getClientId());
                newEntity.setNameSize(orderItemEntity.getNameSize());
                newEntity.setOrderId(orderItemEntity.getOrderId());
                newEntity.setQuantity(orderItemEntity.getQuantity());
                newEntity.setClassification(orderItemEntity.getClassification());
                newEntity.setDeclaredValue(orderItemEntity.getDeclaredValue());
                newEntity.setRate(orderItemEntity.getRate());
                newEntity.setCreatedBy(orderItemEntity.getCreatedBy());
                newEntity.setModifiedBy(orderItemEntity.getModifiedBy());
                newEntity.setComments(orderItemEntity.getComments());
                newEntity.setCommodity(orderItemEntity.getCommodity());
                newEntity.setCreatedTimestamp(orderItemEntity.getCreatedTimestamp());
                newEntity.setModifiedTimestamp(orderItemEntity.getModifiedTimestamp());
                newEntity.setWeight(orderItemEntity.getWeight());
                newEntity.setVolume(orderItemEntity.getVolume());
                newEntity.setServiceRequirement(orderItemEntity.getServiceRequirement());

                newEntity.setVendorSea(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVendorCode());
                newEntity.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVoyageNumber());

                if("SHIPPING AND TRUCKING".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemEntity.getOrderItemId()).getOrderId()).getServiceType())) {
                    if ("DOOR TO DOOR".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemEntity.getOrderItemId()).getOrderId()).getServiceMode())) {
                        newEntity.setStatus("PLANNING 2");
                    } else if ("DOOR TO PIER".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemEntity.getOrderItemId()).getOrderId()).getServiceMode())) {
                        newEntity.setStatus("PLANNING 2");
                    } else {
                        newEntity.setStatus("PLANNING 3");
                    }
                }else{
                    newEntity.setStatus("ON GOING");
                }

                operationsService.updateOrderItem(newEntity);

            }

        }

        sessionAttributes.put("vendorIdParam", vendorIdParam);

        return SUCCESS;
    }

    public String editOrderItemsOriginConfirm() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("Vendor  >>>>>>>>>>>>>>>>>> " + vendorId);
        System.out.println("Driver  >>>>>>>>>>>>>>>>>> " + driverCodeParam);
        System.out.println("Truck  >>>>>>>>>>>>>>>>>> " + truckCodeParam);
        System.out.println("Pickup Date  >>>>>>>>>>>>>>>>>> " + finalPickupParam);

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById(entity.getOrderId());
        order = transformToOrderFormBean(orderEntity);

        List <OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(entity.getOrderId());

        for(OrderItems orderItemsElem : orderItemsList){
            if(entity.getOrderItemId().equals(orderItemsElem.getOrderItemId())){
                orderItems.add(transformToOrderItemFormBean(orderItemsElem));
            }
        }

        Vendor vendorEntity = vendorService.findVendorById(vendorId);
        vendor.setVendorId(vendorEntity.getVendorId());
        vendor.setVendorName(vendorEntity.getVendorName());

        Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);
        truck = transformToFormBeanTrucks(truckEntity);

        originConfirmFlag = "SINGLE";

        if(finalPickupParam.equals("NaN-NaN-NaN")){
            finalPickupParam = "Invalid Pickup Date Selected";
        }

        return SUCCESS;
    }

    public String editOrderItemsDestinationConfirm() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("Vendor  >>>>>>>>>>>>>>>>>> " + vendorId);
        System.out.println("Driver  >>>>>>>>>>>>>>>>>> " + driverCodeParam);
        System.out.println("Truck  >>>>>>>>>>>>>>>>>> " + truckCodeParam);
        System.out.println("Delivery Date  >>>>>>>>>>>>>>>>>> " + finalDeliveryParam);

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById(entity.getOrderId());
        order = transformToOrderFormBean(orderEntity);

        List <OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(entity.getOrderId());

        for(OrderItems orderItemsElem : orderItemsList){
            if(entity.getOrderItemId().equals(orderItemsElem.getOrderItemId())){
                orderItems.add(transformToOrderItemFormBean(orderItemsElem));
            }
        }

        Vendor vendorEntity = vendorService.findVendorById(vendorId);
        vendor.setVendorId(vendorEntity.getVendorId());
        vendor.setVendorName(vendorEntity.getVendorName());

        Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);
        truck = transformToFormBeanTrucks(truckEntity);

        destinationConfirmFlag = "SINGLE";

        if(finalDeliveryParam.equals("NaN-NaN-NaN")){
            finalDeliveryParam = "Invalid Delivery Date Selected";
        }

        return SUCCESS;
    }

    public String editOrderItemsOrigin() {
        if(operationsBean.getOrderItemId() == null){
            return INPUT;
        }

        try {
            OrderItems entity = transformOrderItemToEntityBeanOrigin(operationsBean);
            operationsService.updateOrderItem(entity);
        } catch (Exception e) {
            log.error( "update failed", e);
            return INPUT;
        }
        return SUCCESS;
    }

    public String editOrderItemsOriginModal() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("OrderID  >>>>>>>>>>>>>>>>>> " + sessionAttributes.get("orderIdParam"));
        System.out.println("OrderItemID  >>>>>>>>>>>>>>>>>> " + sessionAttributes.get("orderItemIdParam"));
        System.out.println("Vendor  >>>>>>>>>>>>>>>>>> " + vendorId);
        System.out.println("Driver  >>>>>>>>>>>>>>>>>> " + driverCodeParam);
        System.out.println("Truck  >>>>>>>>>>>>>>>>>> " + truckCodeParam);
        System.out.println("Pickup Date  >>>>>>>>>>>>>>>>>> " + finalPickupParam);
        System.out.println("Origin Flag  >>>>>>>>>>>>>>>>>> " + originConfirmFlag);

        Integer orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        Integer orderItemId = (Integer) sessionAttributes.get("orderItemIdParam");
        check = (String[]) sessionAttributes.get("checkedItemsInSession");

        if(originConfirmFlag.equals("MULTI") ) {

            for (int i=0; i<check.length; i++) {
                System.out.println("CHECK ITEMS >>>>>>>>>>>>>>>>>" + check[i]);

                Integer orderItemIdCheck = Integer.parseInt(check[i]);
                /*OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemIdCheck);*/
                /*orderItems.add(transformToOrderItemFormBean(orderItemEntity));*/

                OrderItems entity = operationsService.findOrderItemById(orderItemIdCheck);
                OrderItems saveEntity = operationsService.findOrderItemById(orderItemIdCheck);

                entity.setVendorOrigin(vendorService.findVendorById(vendorId).getVendorCode());
                entity.setVendorDestination(saveEntity.getVendorDestination());
                entity.setFinalPickupDate(finalPickupParam);
                entity.setFinalDeliveryDate(saveEntity.getFinalDeliveryDate());
                entity.setOrderItemId(orderItemIdCheck);
                entity.setClientId(saveEntity.getClientId());
                entity.setNameSize(saveEntity.getNameSize());
                entity.setOrderId(saveEntity.getOrderId());
                entity.setQuantity(saveEntity.getQuantity());
                entity.setClassification(saveEntity.getClassification());
                entity.setCommodity(saveEntity.getCommodity());
                entity.setDeclaredValue(saveEntity.getDeclaredValue());
                entity.setComments(saveEntity.getComments());
                entity.setRate(saveEntity.getRate());
                entity.setCreatedBy(saveEntity.getCreatedBy());
                entity.setModifiedBy(saveEntity.getModifiedBy());
                entity.setCreatedTimestamp(saveEntity.getCreatedTimestamp());
                entity.setModifiedTimestamp(saveEntity.getModifiedTimestamp());
                entity.setWeight(saveEntity.getWeight());
                entity.setDriverOrigin(driverCodeParam);
                entity.setDriverDestination(saveEntity.getDriverDestination());
                entity.setTruckOrigin(truckCodeParam);
                entity.setTruckDestination(saveEntity.getTruckDestination());
                entity.setVendorSea(saveEntity.getVendorSea());
                entity.setVesselScheduleId(saveEntity.getVesselScheduleId());
                entity.setCommodity(saveEntity.getCommodity());
                entity.setComments(saveEntity.getComments());
                entity.setWeight(saveEntity.getWeight());
                entity.setVolume(saveEntity.getVolume());
                entity.setServiceRequirement(saveEntity.getServiceRequirement());

                Orders orderEntity = orderService.findOrdersById(saveEntity.getOrderId());

                /*if ("SHIPPING AND TRUCKING".equals(orderEntity.getServiceType())) {
                    if ("DOOR TO PIER".equals(orderEntity.getServiceMode())) {
                        if(entity.getStatus().equals("PLANNING 2")){
                            entity.setStatus("ON GOING");
                        }else{
                            entity.setStatus(saveEntity.getStatus());
                        }
                    } else {
                        entity.setStatus(saveEntity.getStatus());
                    }
                }else {
                    entity.setStatus(saveEntity.getStatus());
                }*/

                if ("SHIPPING AND TRUCKING".equals(orderEntity.getServiceType())) {
                    if ("DOOR TO PIER".equals(orderEntity.getServiceMode())) {
                        entity.setStatus("ON GOING");
                    } else {
                        entity.setStatus("PLANNING 3");
                    }
                } else {
                    entity.setStatus("ON GOING");
                }
                operationsService.updateOrderItem(entity);
            }

        }else{

            OrderItems entity = operationsService.findOrderItemById(orderItemId);
            OrderItems saveEntity = operationsService.findOrderItemById(orderItemId);

            entity.setVendorOrigin(vendorService.findVendorById(vendorId).getVendorCode());
            entity.setVendorDestination(saveEntity.getVendorDestination());
            entity.setFinalPickupDate(finalPickupParam);
            entity.setFinalDeliveryDate(saveEntity.getFinalDeliveryDate());
            entity.setOrderItemId(orderItemId);
            entity.setClientId(saveEntity.getClientId());
            entity.setNameSize(saveEntity.getNameSize());
            entity.setOrderId(saveEntity.getOrderId());
            entity.setQuantity(saveEntity.getQuantity());
            entity.setClassification(saveEntity.getClassification());
            entity.setCommodity(saveEntity.getCommodity());
            entity.setDeclaredValue(saveEntity.getDeclaredValue());
            entity.setComments(saveEntity.getComments());
            entity.setRate(saveEntity.getRate());
            entity.setCreatedBy(saveEntity.getCreatedBy());
            entity.setModifiedBy(saveEntity.getModifiedBy());
            entity.setCreatedTimestamp(saveEntity.getCreatedTimestamp());
            entity.setModifiedTimestamp(saveEntity.getModifiedTimestamp());
            entity.setWeight(saveEntity.getWeight());
            entity.setDriverOrigin(driverCodeParam);
            entity.setDriverDestination(saveEntity.getDriverDestination());
            entity.setTruckOrigin(truckCodeParam);
            entity.setTruckDestination(saveEntity.getTruckDestination());
            entity.setVendorSea(saveEntity.getVendorSea());
            entity.setVesselScheduleId(saveEntity.getVesselScheduleId());
            entity.setCommodity(saveEntity.getCommodity());
            entity.setComments(saveEntity.getComments());
            entity.setWeight(saveEntity.getWeight());
            entity.setVolume(saveEntity.getVolume());
            entity.setServiceRequirement(saveEntity.getServiceRequirement());

            Orders orderEntity = orderService.findOrdersById(saveEntity.getOrderId());

            /*if ("SHIPPING AND TRUCKING".equals(orderEntity.getServiceType())) {
                if ("DOOR TO PIER".equals(orderEntity.getServiceMode())) {
                    if(entity.getStatus().equals("PLANNING 2")){
                        entity.setStatus("ON GOING");
                    }else{
                        entity.setStatus(saveEntity.getStatus());
                    }
                } else {
                    entity.setStatus(saveEntity.getStatus());
                }
            }else {
                entity.setStatus(saveEntity.getStatus());
            }*/

            if ("SHIPPING AND TRUCKING".equals(orderEntity.getServiceType())) {
                if ("DOOR TO PIER".equals(orderEntity.getServiceMode())) {
                    entity.setStatus("ON GOING");
                } else {
                    entity.setStatus("PLANNING 3");
                }
            } else {
                entity.setStatus("ON GOING");
            }
            operationsService.updateOrderItem(entity);
        }

        sessionAttributes.put("orderIdParam", orderIdParam);
        sessionAttributes.put("orderItemIdParam", orderItemId);

        return SUCCESS;
    }

    public String editOrderItemsDestinationModal() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        System.out.println("OrderID  >>>>>>>>>>>>>>>>>> " + (Integer) sessionAttributes.get("orderIdParam"));
        System.out.println("OrderItemID  >>>>>>>>>>>>>>>>>> " + (Integer) sessionAttributes.get("orderItemIdParam"));
        System.out.println("Vendor  >>>>>>>>>>>>>>>>>> " + vendorId);
        System.out.println("Driver  >>>>>>>>>>>>>>>>>> " + driverCodeParam);
        System.out.println("Truck  >>>>>>>>>>>>>>>>>> " + truckCodeParam);
        System.out.println("Delivery Date  >>>>>>>>>>>>>>>>>> " + finalDeliveryParam);
        System.out.println("Destination Flag  >>>>>>>>>>>>>>>>>> " + destinationConfirmFlag);

        Integer orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        Integer orderItemId = (Integer) sessionAttributes.get("orderItemIdParam");
        check = (String[]) sessionAttributes.get("checkedItemsInSession");

        if(destinationConfirmFlag.equals("MULTI")) {

            for (int i=0; i<check.length; i++) {
                System.out.println("CHECK ITEMS >>>>>>>>>>>>>>>>>" + check[i]);

                Integer orderItemIdCheck = Integer.parseInt(check[i]);

                OrderItems entity = operationsService.findOrderItemById(orderItemIdCheck);
                OrderItems saveEntity = operationsService.findOrderItemById(orderItemIdCheck);

                entity.setVendorOrigin(saveEntity.getVendorOrigin());
                entity.setVendorDestination(vendorService.findVendorById(vendorId).getVendorCode());
                entity.setFinalPickupDate(saveEntity.getFinalPickupDate());
                entity.setFinalDeliveryDate(finalDeliveryParam);
                entity.setOrderItemId(orderItemIdCheck);
                entity.setClientId(saveEntity.getClientId());
                entity.setNameSize(saveEntity.getNameSize());
                entity.setOrderId(saveEntity.getOrderId());
                entity.setQuantity(saveEntity.getQuantity());
                entity.setClassification(saveEntity.getClassification());
                entity.setCommodity(saveEntity.getCommodity());
                entity.setDeclaredValue(saveEntity.getDeclaredValue());
                entity.setComments(saveEntity.getComments());
                entity.setRate(saveEntity.getRate());
                entity.setCreatedBy(saveEntity.getCreatedBy());
                entity.setModifiedBy(saveEntity.getModifiedBy());
                entity.setCreatedTimestamp(saveEntity.getCreatedTimestamp());
                entity.setModifiedTimestamp(saveEntity.getModifiedTimestamp());
                entity.setWeight(saveEntity.getWeight());
                entity.setDriverOrigin(saveEntity.getDriverOrigin());
                entity.setDriverDestination(driverCodeParam);
                entity.setTruckOrigin(saveEntity.getTruckOrigin());
                entity.setTruckDestination(truckCodeParam);
                entity.setVendorSea(saveEntity.getVendorSea());
                entity.setVesselScheduleId(saveEntity.getVesselScheduleId());
                entity.setCommodity(saveEntity.getCommodity());
                entity.setComments(saveEntity.getComments());
                entity.setWeight(saveEntity.getWeight());
                entity.setVolume(saveEntity.getVolume());
                entity.setServiceRequirement(saveEntity.getServiceRequirement());

                Orders orderEntity = orderService.findOrdersById(saveEntity.getOrderId());

                /*if ("SHIPPING AND TRUCKING".equals(orderEntity.getServiceType())) {
                    if ("DOOR TO PIER".equals(orderEntity.getServiceMode())) {
                        entity.setStatus("ON GOING");
                    } else {
                        entity.setStatus("PLANNING 3");
                    }
                } else {
                    entity.setStatus("ON GOING");
                }*/
                /*if(entity.getStatus().equals("PLANNING 3")) {
                    entity.setStatus("ON GOING");
                }
                else{
                    entity.setStatus(saveEntity.getStatus());
                }*/
                entity.setStatus("ON GOING");
                operationsService.updateOrderItem(entity);
            }

        } else {

            OrderItems entity = operationsService.findOrderItemById(orderItemId);
            OrderItems saveEntity = operationsService.findOrderItemById(orderItemId);

            entity.setVendorOrigin(saveEntity.getVendorOrigin());
            entity.setVendorDestination(vendorService.findVendorById(vendorId).getVendorCode());
            entity.setFinalPickupDate(saveEntity.getFinalPickupDate());
            entity.setFinalDeliveryDate(finalDeliveryParam);
            entity.setOrderItemId(orderItemId);
            entity.setClientId(saveEntity.getClientId());
            entity.setNameSize(saveEntity.getNameSize());
            entity.setOrderId(saveEntity.getOrderId());
            entity.setQuantity(saveEntity.getQuantity());
            entity.setClassification(saveEntity.getClassification());
            entity.setCommodity(saveEntity.getCommodity());
            entity.setDeclaredValue(saveEntity.getDeclaredValue());
            entity.setComments(saveEntity.getComments());
            entity.setRate(saveEntity.getRate());
            entity.setCreatedBy(saveEntity.getCreatedBy());
            entity.setModifiedBy(saveEntity.getModifiedBy());
            entity.setCreatedTimestamp(saveEntity.getCreatedTimestamp());
            entity.setModifiedTimestamp(saveEntity.getModifiedTimestamp());
            entity.setWeight(saveEntity.getWeight());
            entity.setDriverOrigin(saveEntity.getDriverOrigin());
            entity.setDriverDestination(driverCodeParam);
            entity.setTruckOrigin(saveEntity.getTruckOrigin());
            entity.setTruckDestination(truckCodeParam);
            entity.setVendorSea(saveEntity.getVendorSea());
            entity.setVesselScheduleId(saveEntity.getVesselScheduleId());
            entity.setCommodity(saveEntity.getCommodity());
            entity.setComments(saveEntity.getComments());
            entity.setWeight(saveEntity.getWeight());
            entity.setVolume(saveEntity.getVolume());
            entity.setServiceRequirement(saveEntity.getServiceRequirement());

            Orders orderEntity = orderService.findOrdersById(saveEntity.getOrderId());

            /*if ("SHIPPING AND TRUCKING".equals(orderEntity.getServiceType())) {
                if ("DOOR TO PIER".equals(orderEntity.getServiceMode())) {
                    entity.setStatus("ON GOING");
                } else {
                    entity.setStatus("PLANNING 3");
                }
            } else {
                entity.setStatus("ON GOING");
            }*/
            /*if(entity.getStatus().equals("PLANNING 3")) {
                entity.setStatus("ON GOING");
            }
            else{
                entity.setStatus(saveEntity.getStatus());
            }*/
            entity.setStatus("ON GOING");
            operationsService.updateOrderItem(entity);

        }

        sessionAttributes.put("orderIdParam", orderIdParam);
        sessionAttributes.put("orderItemIdParam", orderItemId);

        return SUCCESS;
    }

    public String editOrderItemsDestination() {
        if(operationsBean.getOrderItemId() == null){
            return INPUT;
        }

        try {
            OrderItems entity = transformOrderItemToEntityBeanDestination(operationsBean);
            operationsService.updateOrderItem(entity);
        } catch (Exception e) {
            log.error("Update failed", e);
            return INPUT;
        }
        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location
        return SUCCESS;
    }

    public String addVesselSchedule() throws Exception{
        validateOnSubmit(vesselSchedule);
        if (hasFieldErrors()) {
            return INPUT;
        }
        try {
            VesselSchedules entity = transformToVesselScheduleEntityBean(vesselSchedule);
            entity.setCreatedBy(commonUtils.getUserNameFromSession());
            entity.setCreatedTimestamp(new Date());
            entity.setModifiedBy(commonUtils.getUserNameFromSession());
            entity.setModifiedTimestamp(new Date());
            vesselSchedulesService.addVesselSchedule(entity);
        }  catch (VesselSchedulesAlreadyExistsException e) {
            addFieldError("vesselSchedule.voyageNumber", getText("err.voyageNumber.already.exists"));
            return INPUT;
        }

        Integer vendorIdPass = (transformToVesselScheduleEntityBean(vesselSchedule).getVendorId());

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("vendorIdPass", vendorIdPass);
        sessionAttributes.put("nameSizeParam", sessionAttributes.get("nameSizeParam"));
        sessionAttributes.put("orderItemIdParam", sessionAttributes.get("orderItemIdParam"));

        return SUCCESS;
    }

    public String addVesselScheduleInPlanningAlreadyExists(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));
        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById(entity.getOrderId());
        order = transformToOrderFormBean(orderEntity);

        Customer customerEntity = customerService.findCustomerById(orderEntity.getCustomerId());
        customer = new CustomerBean();
        customer.setCustomerType(customerEntity.getCustomerType());

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        /*addFieldError("vesselSchedule.vesselScheduleId", getText("err.voyageNumber.already.exists"));*/

        clearErrorsAndMessages();
        addActionMessage("Voyage Number entered already exists!");

        return SUCCESS;
    }

    public VesselSchedules transformToVesselScheduleEntityBean(VesselScheduleBean formBean) {
        VesselSchedules entity = new VesselSchedules();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client.getClientId());

        if (formBean.getVesselScheduleId() != null) {
            entity.setVesselScheduleId(new Integer(formBean.getVesselScheduleId()));
        }

        entity.setVoyageNumber(formBean.getVoyageNumber());
        entity.setVesselName(formBean.getVesselName());
        entity.setVendorId(formBean.getVendorId());
        entity.setOriginPort(formBean.getOriginPort());
        entity.setDestinationPort(formBean.getDestinationPort());
        entity.setArrivalDate(formBean.getArrivalDate());
        entity.setArrivalTime(formBean.getArrivalTime());
        entity.setDepartureTime(formBean.getDepartureTime());
        entity.setDepartureDate(formBean.getDepartureDate());
        entity.setVendorCode(vendorService.findVendorById(formBean.getVendorId()).getVendorCode());

        return entity;
    }

    public String findVesselScheduleBulk() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemId", operationsBean.getOrderItemId());
        sessionAttributes.put("nameSize", operationsBean.getNameSize());
        sessionAttributes.put("quantity", operationsBean.getQuantity());
        sessionAttributes.put("classification", operationsBean.getClassification());
        sessionAttributes.put("commodity", operationsBean.getCommodity());
        sessionAttributes.put("declaredValue", operationsBean.getDeclaredValue());
        sessionAttributes.put("comments", operationsBean.getComments());
        sessionAttributes.put("rate", operationsBean.getRate());
        sessionAttributes.put("createdBy", operationsBean.getCreatedBy());
        sessionAttributes.put("modifiedBy", operationsBean.getModifiedBy());
        sessionAttributes.put("createdTimestamp", operationsBean.getCreatedTimestamp());
        sessionAttributes.put("modifiedTimestamp", operationsBean.getModifiedTimestamp());
        sessionAttributes.put("weight", operationsBean.getWeight());
        //sessionAttributes.put("status", "PLANNING 2");
        sessionAttributes.put("vendorSea", operationsBean.getVendorList());
        sessionAttributes.put("orderIdParam", operationsBean.getOrderId());
        sessionAttributes.put("modeOfService", operationsBean.getModeOfService());
        sessionAttributes.put("freightType", operationsBean.getFreightType());

        /*List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorId(operationsBean.getVendorList());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }*/

        // Vessel schedules filtered by class
        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());
        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorIdOriDesClass(operationsBean.getVendorList(), order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        /*sessionAttributes.put("orderItemIdParam", (Integer)sessionAttributes.get("orderItemIdParam"));*/

        // return the values of operation bean back to hidden fields
        /*OrderItems entity = operationsService.findOrderItemById((Integer)sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);*/

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty()){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        // for the order items to appear again
        nameSizeList = (List) sessionAttributes.get("nameSizeList") ;

        clearErrorsAndMessages();
        addActionMessage("Vessel Schedule loaded !");

        return SUCCESS;

    }

    public String findVesselSchedule() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        Customer customerEntity = customerService.findCustomerById(orderEntity.getCustomerId());
        customer = new CustomerBean();
        customer.setCustomerType(customerEntity.getCustomerType());

        sessionAttributes.put("orderItemId", operationsBean.getOrderItemId());
        sessionAttributes.put("nameSize", operationsBean.getNameSize());
        sessionAttributes.put("quantity", operationsBean.getQuantity());
        sessionAttributes.put("classification", operationsBean.getClassification());
        sessionAttributes.put("commodity", operationsBean.getCommodity());
        sessionAttributes.put("declaredValue", operationsBean.getDeclaredValue());
        sessionAttributes.put("comments", operationsBean.getComments());
        sessionAttributes.put("rate", operationsBean.getRate());
        sessionAttributes.put("createdBy", operationsBean.getCreatedBy());
        sessionAttributes.put("modifiedBy", operationsBean.getModifiedBy());
        sessionAttributes.put("createdTimestamp", operationsBean.getCreatedTimestamp());
        sessionAttributes.put("modifiedTimestamp", operationsBean.getModifiedTimestamp());
        sessionAttributes.put("weight", operationsBean.getWeight());
        // sessionAttributes.put("status", "PLANNING 2");
        sessionAttributes.put("vendorSea", operationsBean.getVendorList());
        sessionAttributes.put("orderIdParam", operationsBean.getOrderId());
        sessionAttributes.put("modeOfService", operationsBean.getModeOfService());
        sessionAttributes.put("freightType", operationsBean.getFreightType());
        // Vessel schedules filtered by class
        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());
        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorIdOriDesClass(operationsBean.getVendorList(), order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        sessionAttributes.put("orderItemIdParam", operationsBean.getOrderItemId());

        // return the values of operation bean back to hidden fields
        OrderItems entity = operationsService.findOrderItemById(operationsBean.getOrderItemId());

        orderItem = transformToOrderItemFormBean(entity);

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().equals("NONE") || orderItem.getVesselScheduleId().isEmpty()){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        clearErrorsAndMessages();
        addActionMessage("Vessel Schedule loaded !");

        return SUCCESS;
    }

    public String viewInfo() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        if(entity == null){
            sessionAttributes.put("orderIdParam", orderIdParam);
            return INPUT;
        }

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);
        // To display vessel schedule info

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE") ){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        return SUCCESS;
    }

    public String viewSeaFreightPlanningBulk() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        sessionAttributes.put("checkedItemsInSession", check);
        order = transformToOrderFormBean(orderEntity);

        return "PLANNING 2";
    }

    public String viewSeaFreightPlanning() {
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

    public String viewEditSeaFreight() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        return SUCCESS;
    }

    public String viewEditInlandFreightOrigin() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        /*List<OrderItems> orderItemsListEntity = operationsService.findAllOrderItemsByOrderId(orderEntity.getOrderId());

        for (OrderItems orderItemElem : orderItemsListEntity){
            if(orderItemElem.getOrderItemId() == orderItemIdParam){
                orderItemFreightPlan.add(transformToOrderItemFormBean(orderItemElem));
            }
        }*/

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE") ){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        return SUCCESS;
    }

    public String viewEditInlandFreightDestination() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        return SUCCESS;
    }

    public String viewFreightPlanning(){
        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        if(entity == null){
            sessionAttributes.put("orderIdParam", orderIdParam);
            return "input";
        }

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        List<OrderItems> orderItemsListEntity = operationsService.findAllOrderItemsByOrderId(orderEntity.getOrderId());

        for (OrderItems orderItemElem : orderItemsListEntity){
            if(orderItemElem.getOrderItemId() == orderItemIdParam){
                orderItemFreightPlan.add(transformToOrderItemFormBean(orderItemElem));
            }
        }

        Customer customerEntity = customerService.findCustomerById(orderEntity.getCustomerId());
        customer = new CustomerBean();
        customer.setCustomerType(customerEntity.getCustomerType());

//        String schedulesExist;

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());
        /*List<VesselSchedules> vesselSchedulesList = operationsService.findAllVesselSchedule();*/
        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        return "PLANNING 1";
    }

    public String viewFreightPlanningInland(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        if(entity == null){
            sessionAttributes.put("orderIdParam", orderIdParam);
            return INPUT;
        }

        orderItem = transformToOrderItemFormBean(entity);

        /*Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));*/
        Orders orderEntity = orderService.findOrdersById(entity.getOrderId());
        if (!orderEntity.getOrderStatus().equals("ON GOING")){
            return "ORDERED_CANCELLED";
        }
        order = transformToOrderFormBean(orderEntity);

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

            OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(orderItem.getOrderItemId());
            orderItemOriginVendor.add(transformToOrderItemFormBean(orderItemsListing));
            orderItemDestinationVendor.add(transformToOrderItemFormBean(orderItemsListing));

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location

        sessionAttributes.put("orderIdParam", entity.getOrderId());
        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        if("PLANNING 2".equals(entity.getStatus())){
            return "PLANNING 2";
        }else{
            return "PLANNING 3";
        }
    }

    public String reloadInlandFreightPlanning() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + entity.getVesselScheduleId());

        if(entity.getVesselScheduleId()!=null){
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location

        nameSizeList = (List) sessionAttributes.get("nameSizeList");
        orderItems = (List) sessionAttributes.get("orderItems");

        orderItemOriginVendor.add(transformToOrderItemFormBean(entity));
        orderItemDestinationVendor.add(transformToOrderItemFormBean(entity));

        clearErrorsAndMessages();
        addActionMessage("Vendor Added Successfully!");

        if ("PLANNING 2".equals(entity.getStatus())) {
            return "PLANNING 2";
        } else if ("PLANNING 3".equals(entity.getStatus())) {
            return "PLANNING 3";
        } else {
            return "ON GOING";
        }
    }

    public String reloadInlandFreightPlanningBulk() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        String[] check = (String[]) sessionAttributes.get("checkedItemsInSession");

        OrderItems entity = operationsService.findOrderItemById(Integer.parseInt(check[0]));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location

        nameSizeList = (List) sessionAttributes.get("nameSizeList");
        orderItems = (List) sessionAttributes.get("orderItems");
        orderItemFreightPlan = (List) sessionAttributes.get("orderItemFreightPlan") ;

        clearErrorsAndMessages();
        addActionMessage("Vendor Added Successfully!");

        if ("PLANNING 2".equals(entity.getStatus())) {
            return "PLANNING 2";
        } else if ("PLANNING 3".equals(entity.getStatus())) {
            return "PLANNING 3";
        } else {
            return "ON GOING";
        }
    }

    public String addVendorInPlanningError() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + entity.getVesselScheduleId());

        if(entity.getVesselScheduleId()!=null){
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location

        nameSizeList = (List) sessionAttributes.get("nameSizeList");
        orderItems = (List) sessionAttributes.get("orderItems");

        orderItemOriginVendor.add(transformToOrderItemFormBean(entity));
        orderItemDestinationVendor.add(transformToOrderItemFormBean(entity));

        clearErrorsAndMessages();
        addActionMessage("Vendor Already Exists!");

        return SUCCESS;
    }

    public String addVendorInPlanningErrorBulk() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        String[] check = (String[]) sessionAttributes.get("checkedItemsInSession");

        /*OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));*/

        /*orderItem = transformToOrderItemFormBean(entity);*/

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        if(orderItem.getVesselScheduleId() != null ){
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
        }

        vendorTruckingOriginList = vendorService.findVendorTruckByLocation(order.getOriginationPort()); // for filtering of trucking vendor on origin location

        vendorTruckingDestinationList = vendorService.findVendorTruckByLocation(order.getDestinationPort()); // for filtering of trucking vendor on destination location

        nameSizeList = (List) sessionAttributes.get("nameSizeList");
        orderItems = (List) sessionAttributes.get("orderItems");

        clearErrorsAndMessages();
        addActionMessage("Vendor Already Exists!");

        return SUCCESS;
    }

    public String reloadSeaFreightPlanning() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());

        sessionAttributes.put("nameSizeParam", sessionAttributes.get("nameSizeParam"));

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE") ){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Vendor Added Successfully!");

        return SUCCESS;
    }

    public String reloadSeaFreightPlanningBulk() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

//        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorId((Integer)sessionAttributes.get("vendorIdPass"));
//
//        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
//            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
//        }

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        List<OrderItems> orderItemsListing = orderService.findAllItemByOrderId(orderEntity.getOrderId());

        for(OrderItems orderItemElem : orderItemsListing){
            orderItemVesselSchedule.add(transformToOrderItemFormBean(orderItemElem));
        }

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        // for the order items to appear again
        nameSizeList = (List) sessionAttributes.get("nameSizeList");

        orderItemFreightPlan = (List) sessionAttributes.get("orderItemFreightPlan");

        // Vessel schedules filtered by class
        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        clearErrorsAndMessages();
        addActionMessage("Vendor Added Successfully!");

        return SUCCESS;
    }

    public String reloadSeaFreightSchedulePlanning() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());

        sessionAttributes.put("nameSizeParam", sessionAttributes.get("nameSizeParam"));

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE") ){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        // if Truck Origin Code is null and populates field with none value
        if(orderItem.getTruckOrigin() == null || orderItem.getTruckOrigin().equals("") || orderItem.getTruckOrigin().length() == 0 || orderItem.getTruckOrigin().isEmpty()){
            orderItem.setVendorOrigin("NONE");
            orderItem.setDriverOrigin("NONE");
            orderItem.setTruckOrigin("NONE");
            orderItem.setFinalPickupDate("NONE");
            truck.setTruckType("NONE");
            truck.setPlateNumber("NONE");
            truck.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckOrigin());
            truck = transformToFormBeanTrucks(truckEntity);
        }

        // if Truck Destination Code is null and populates field with none value
        if(orderItem.getTruckDestination() == null || orderItem.getTruckDestination().equals("") || orderItem.getTruckDestination().length() == 0 || orderItem.getTruckDestination().isEmpty()){
            orderItem.setVendorDestination("NONE");
            orderItem.setDriverDestination("NONE");
            orderItem.setTruckDestination("NONE");
            orderItem.setFinalDeliveryDate("NONE");
            truckDestination.setTruckType("NONE");
            truckDestination.setPlateNumber("NONE");
            truckDestination.setGrossWeight(0);
        }else{
            Trucks truckEntity = vendorService.findTrucksByTruckCode(orderItem.getTruckDestination());
            truckDestination = transformToFormBeanTrucks(truckEntity);
        }

        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        orderItemFreightPlan = (List) sessionAttributes.get("orderItemFreightPlan");

        clearErrorsAndMessages();
        addActionMessage("Vessel Schedule has been added successfully!");

        return SUCCESS;
    }

    public String reloadSeaFreightSchedulePlanningBulk() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        List<OrderItems> orderItemsListing = orderService.findAllItemByOrderId(orderEntity.getOrderId());

        for(OrderItems orderItemElem : orderItemsListing){
            orderItemVesselSchedule.add(transformToOrderItemFormBean(orderItemElem));
        }

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        // for the order items to appear again
        nameSizeList = (List) sessionAttributes.get("nameSizeList") ;

        orderItemFreightPlan = (List) sessionAttributes.get("orderItemFreightPlan");

        // Vessel schedules filtered by class
        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        clearErrorsAndMessages();
        addActionMessage("Vessel Schedule has been added successfully!");

        return SUCCESS;
    }

    public String addVesselScheduleInPlanningBulkAlreadyExists() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        // if Vessel Schedule Id is null and populates field with none value
        if(orderItem.getVesselScheduleId() == null || orderItem.getVesselScheduleId().equals("") || orderItem.getVesselScheduleId().length() == 0 || orderItem.getVesselScheduleId().isEmpty() || orderItem.getVesselScheduleId().equals("NONE")){
            orderItem.setVendorSea("NONE");
            orderItem.setVesselScheduleId("NONE");
            vesselSchedule.setVesselName("NONE");
            vesselSchedule.setDepartureDate("NONE");
            vesselSchedule.setArrivalDate("NONE");
            vesselSchedule.setDepartureTime("NONE");
            vesselSchedule.setArrivalTime("NONE");
            vesselSchedule.setOriginPort("NONE");
            vesselSchedule.setDestinationPort("NONE");
            scheduleExists = "FALSE";
        }else{
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(orderItem.getVesselScheduleId());
            vesselSchedule = transformToFormBeanVesselSchedule(vesselScheduleEntity);
            scheduleExists = "TRUE";
        }

        List<OrderItems> orderItemsListing = orderService.findAllItemByOrderId(orderEntity.getOrderId());

        for(OrderItems orderItemElem : orderItemsListing){
            orderItemVesselSchedule.add(transformToOrderItemFormBean(orderItemElem));
        }

        // Vessel schedules filtered by origin and destination
        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByOriDesClass(order.getOriginationPort(), order.getDestinationPort());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        // for the order items to appear again
        nameSizeList = (List) sessionAttributes.get("nameSizeList") ;
        orderItemFreightPlan = (List) sessionAttributes.get("orderItemFreightPlan") ;

        // Vessel schedules filtered by class
        vendorShippingListClass = vendorService.findShippingVendorClass(customerService.findCustomerById(order.getCustomerId()).getCustomerType());

        clearErrorsAndMessages();
        addActionMessage("Voyage Number entered already exists!");

        return SUCCESS;
    }

    public String setLCLBulkSchedule(){

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAA " + vesselScheduleIdParam);
        System.out.println("BBBBBBBBBBBBBBBBBBBBBBBB " + vendorIdParam);
        System.out.println("CCCCCCCCCCCCCCCCCCCCCCCC " + checkLCL);

        String str = checkLCL;

        ArrayList aList = new ArrayList(Arrays.asList(str.split(",")));

        Container containerEntity = new Container();

        for(int i=0; i<aList.size(); i++){
            System.out.println(" ---------------------------> " + aList.get(i));

            Integer OrderIdHolder = Integer.parseInt(aList.get(i).toString());

            Orders orderEntity = orderService.findOrdersById(OrderIdHolder);
            /*To update the status of the order*/
            orderEntity.setOrderStatus("ON GOING");
            orderService.updateOrder(orderEntity);

            List<OrderItems> orderItemEntity = operationsService.findAllOrderItemsByOrderId(OrderIdHolder);

            for(OrderItems orderItemElem : orderItemEntity){
                orderItemElem.setVendorSea(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVendorCode());
                orderItemElem.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVoyageNumber());

                if("SHIPPING AND TRUCKING".equals(orderService.findOrdersById(OrderIdHolder).getServiceType())){
                    if("DOOR TO DOOR".equals(orderService.findOrdersById(OrderIdHolder).getServiceMode())){
                        orderItemElem.setStatus("PLANNING 2");
                    }else if("DOOR TO PIER".equals(orderService.findOrdersById(OrderIdHolder).getServiceMode())){
                        orderItemElem.setStatus("PLANNING 2");
                    }else{
                        orderItemElem.setStatus("PLANNING 3");
                    }
                }else{
                    orderItemElem.setStatus("ON GOING");
                }

                operationsService.updateOrderItem(orderItemElem);
            }
        }

        // function will add a consolidated new placeholder container for the order items selected begin
        Vendor vendorEntity = vendorService.findVendorById(vendorIdParam);
        VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam);
        // Containers created in planning will have the vendorName and Voyage number combined as placeholder for container Number
        containerEntity.setContainerNumber(vendorEntity.getVendorName() + " - " + vesselScheduleEntity.getVoyageNumber());
        containerEntity.setContainerStatus("CONSOLIDATED");
        containerEntity.setShipping(vesselScheduleEntity.getVoyageNumber());
        containerEntity.setEirType("EIR FORM 1");
        containerEntity.setPortCode(vesselScheduleEntity.getDestinationPort());
        containerService.updateContainer(containerEntity);

        // Add EIR 1 DOCUMENT BEGIN
        Documents documentEntity = new Documents();

        Client client = clientService.findClientById(getClientId().toString());
        documentEntity.setClient(client);

        if(containerEntity.getEirType().equals("EIR FORM 1")){
            documentEntity.setDocumentName(DocumentsConstants.EQUIPMENT_INTERCHANGE_RECEIPT_1);
        }else{
            documentEntity.setDocumentName(DocumentsConstants.EQUIPMENT_INTERCHANGE_RECEIPT_2);
        }
        documentEntity.setReferenceId(containerEntity.getContainerId());
        documentEntity.setReferenceTable("CONTAINERS");
        documentEntity.setCreatedDate(new Date());
        documentEntity.setDocumentStatus("FOR PRINTING");
        documentEntity.setVendorCode(containerEntity.getShipping());
        documentEntity.setDocumentProcessed(0);

        documentsService.addDocuments(documentEntity);
        // Add EIR 1 DOCUMENT END

        for(int i=0; i<aList.size(); i++){

            Integer OrderIdHolder = Integer.parseInt(aList.get(i).toString());

            List<OrderItems> orderItemEntity = operationsService.findAllOrderItemsByOrderId(OrderIdHolder);

            for(OrderItems orderItemElem : orderItemEntity){

                orderItemElem.setContainerId(containerEntity.getContainerId()); // Container Id will be saved for all order items under order id
                operationsService.updateOrderItem(orderItemElem);
            }

        }
        // function will add a consolidated new placeholder container for the order items selected end

        return SUCCESS;
    }

    public String viewSeaFreightList() {
        String column = getColumnBookingFilter();

        // For FCL Requirement
        List<Orders> fclOrders = new ArrayList<Orders>();

        if (StringUtils.isNotBlank(column)) {
            fclOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "FULL CONTAINER LOAD");
        }else if(originCity != null && destinationCity != null){
            fclOrders = operationsService.findOrdersByOriginDestinationFCL(originCity, destinationCity);
        }else{
            fclOrders = operationsService.findOrdersByFCL();
        }

        for (Orders orderElem : fclOrders){
            // will only show bookings that is not archived
            String strOrig = orderElem.getOrderStatus();
            int intIndex = strOrig.indexOf("ARCHIVED");

            if(intIndex == -1){
                if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                    fclTable.add(transformToOrderFormBean(orderElem));
                }
            }
        }

        // For LCL Requirement
        List<Orders> lclOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            lclOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LESS CONTAINER LOAD");
        }else if(originCity != null && destinationCity != null){
            lclOrders = operationsService.findOrdersByOriginDestinationLCL(originCity, destinationCity);
        }else{
            lclOrders = operationsService.findOrdersByLCL();
        }

        for (Orders orderElem : lclOrders){
            // will only show bookings that is not archived
            String strOrig = orderElem.getOrderStatus();
            int intIndex = strOrig.indexOf("ARCHIVED");

            if(intIndex == -1){
                if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())){
                    lclTable.add(transformToOrderFormBean(orderElem));
                }
            }
        }

        // For LCU Requirement
        List<Orders> lcuOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            lcuOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LOOSE CARGO LOAD");
        }else if(originCity != null && destinationCity != null){
            lcuOrders = operationsService.findOrdersByOriginDestinationLCU(originCity, destinationCity);
        }else{
            lcuOrders = operationsService.findOrdersByLCU();
        }

        for (Orders orderElem : lcuOrders){
            // will only show bookings that is not archived
            String strOrig = orderElem.getOrderStatus();
            int intIndex = strOrig.indexOf("ARCHIVED");

            if(intIndex == -1){
                if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                    lcuTable.add(transformToOrderFormBean(orderElem));
                }
            }
        }

        // For RCU Requirement
        List<Orders> rcuOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            rcuOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "ROLLING CARGO LOAD");
        }else if(originCity != null && destinationCity != null){
            rcuOrders = operationsService.findOrdersByOriginDestinationRCU(originCity, destinationCity);
        }else{
            rcuOrders = operationsService.findOrdersByRCU();
        }

        for (Orders orderElem : rcuOrders){
            // will only show bookings that is not archived
            String strOrig = orderElem.getOrderStatus();
            int intIndex = strOrig.indexOf("ARCHIVED");

            if(intIndex == -1){
                if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                    rcuTable.add(transformToOrderFormBean(orderElem));
                }
            }
        }

        // Load all vessel schedules
        // FOR IMPROVEMENT -- FILTER ALL VESSEL SCHEDULES DATES THAT WILL NOT INCLUDE CURRENT DATE
        List<VesselSchedules> vesselSchedulesList = operationsService.findAllVesselSchedule();

        if(vesselSchedulesList != null){
            for(VesselSchedules vesselScheduleElem : vesselSchedulesList){
                vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
            }
        }

        return SUCCESS;
    }

    public String viewInlandFreightList() {
        String column = getColumnBookingFilter();

        // For FCL Trucking Origin
        List<Orders> fclTrucksOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            fclTrucksOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "FULL CONTAINER LOAD");
        }else if(originCityTruck != null){
            fclTrucksOrders = operationsService.findOrdersByFCLTrucksOrigin(originCityTruck);
        }else{
            fclTrucksOrders = operationsService.findOrdersByFCLTrucks();
        }

        for (Orders orderElem : fclTrucksOrders){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("DOOR TO PIER")){
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        fclTruckTable.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        // For LCL Trucking Origin
        List<Orders> lclTrucksOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            lclTrucksOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LESS CONTAINER LOAD");
        }else if(originCityTruck != null){
            lclTrucksOrders = operationsService.findOrdersByLCLTrucksOrigin(originCityTruck);
        }else{
            lclTrucksOrders = operationsService.findOrdersByLCLTrucks();
        }

        for (Orders orderElem : lclTrucksOrders){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("DOOR TO PIER") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        lclTruckTable.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        // For LCU Trucking Origin
        List<Orders> lcuTrucksOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            lcuTrucksOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LOOSE CARGO LOAD");
        }else if(originCityTruck != null){
            lcuTrucksOrders = operationsService.findOrdersByLCUTrucksOrigin(originCityTruck);
        }else{
            lcuTrucksOrders = operationsService.findOrdersByLCUTrucks();
        }

        for (Orders orderElem : lcuTrucksOrders){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("DOOR TO PIER") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        lcuTruckTable.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        // For RCU Trucking Origin
        List<Orders> rcuTrucksOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            rcuTrucksOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "ROLLING CARGO LOAD");
        }else if(originCityTruck != null){
            rcuTrucksOrders = operationsService.findOrdersByRCUTrucksOrigin(originCityTruck);
        }else{
            rcuTrucksOrders = operationsService.findOrdersByRCUTrucks();
        }

        for (Orders orderElem : rcuTrucksOrders){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("DOOR TO PIER") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        rcuTruckTable.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        // For FTL Requirement
        List<Orders> ftlOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            ftlOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "FULL TRUCK LOAD");
        }else if(originCityTruck != null){
            ftlOrders = operationsService.findOrdersByOriginFTL(originCityTruck);
        }else{
            ftlOrders = operationsService.findOrdersByFTL();
        }

        for (Orders orderElem : ftlOrders){
            // will only show bookings that is not archived
            String strOrig = orderElem.getOrderStatus();
            int intIndex = strOrig.indexOf("ARCHIVED");

            if(intIndex == -1){
                if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                    ftlTable.add(transformToOrderFormBean(orderElem));
                }
            }
        }

        // For LTL Requirement
        List<Orders> ltlOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            ltlOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LESS TRUCK LOAD");
        }else if(originCityTruck != null){
            ltlOrders = operationsService.findOrdersByOriginLTL(originCityTruck);
        }else{
            ltlOrders = operationsService.findOrdersByLTL();
        }

        for (Orders orderElem : ltlOrders){
            // will only show bookings that is not archived
            String strOrig = orderElem.getOrderStatus();
            int intIndex = strOrig.indexOf("ARCHIVED");

            if(intIndex == -1){
                if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                    ltlTable.add(transformToOrderFormBean(orderElem));
                }
            }
        }

        // For FCL Trucking Destination
        List<Orders> fclTrucksOrdersDes = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            fclTrucksOrdersDes = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "FULL CONTAINER LOAD");
        }else if(destinationCityTruck != null){
            fclTrucksOrdersDes = operationsService.findOrdersByFCLTrucksDestination(destinationCityTruck);
        }else{
            fclTrucksOrdersDes = operationsService.findOrdersByFCLTrucks();
        }

        for (Orders orderElem : fclTrucksOrdersDes){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("PIER TO DOOR") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        fclTruckTableDes.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        // For LCL Trucking Destination
        List<Orders> lclTrucksOrdersDes = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            lclTrucksOrdersDes = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LESS CONTAINER LOAD");
        }else if(destinationCityTruck != null){
            lclTrucksOrdersDes = operationsService.findOrdersByLCLTrucksDestination(destinationCityTruck);
        }else{
            lclTrucksOrdersDes = operationsService.findOrdersByLCLTrucks();
        }

        for (Orders orderElem : lclTrucksOrdersDes){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("PIER TO DOOR") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        lclTruckTableDes.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        // For LCU Trucking Destination
        List<Orders> lcuTrucksOrdersDes = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            lcuTrucksOrdersDes = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LOOSE CARGO LOAD");
        }else if(destinationCityTruck != null){
            lcuTrucksOrdersDes = operationsService.findOrdersByLCUTrucksDestination(destinationCityTruck);
        }else{
            lcuTrucksOrdersDes = operationsService.findOrdersByLCUTrucks();
        }

        for (Orders orderElem : lcuTrucksOrdersDes){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("PIER TO DOOR") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        lcuTruckTableDes.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        // For RCU Trucking Destination
        List<Orders> rcuTrucksOrdersDes = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            rcuTrucksOrdersDes = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "ROLLING CARGO LOAD");
        }else if(destinationCityTruck != null){
            rcuTrucksOrdersDes = operationsService.findOrdersByRCUTrucksDestination(destinationCityTruck);
        }else{
            rcuTrucksOrdersDes = operationsService.findOrdersByRCUTrucks();
        }

        for (Orders orderElem : rcuTrucksOrdersDes){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("PIER TO DOOR") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        rcuTruckTableDes.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }

        return SUCCESS;
    }
    public String viewInlandFreightList_FCL(){
        String column = getColumnBookingFilter();

        // For FCL Trucking Origin
        List<Orders> fclTrucksOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            fclTrucksOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "FULL CONTAINER LOAD");
        }else if(originCityTruck != null){
            fclTrucksOrders = operationsService.findOrdersByFCLTrucksOrigin(originCityTruck);
        }else{
            fclTrucksOrders = operationsService.findOrdersByFCLTrucks();
        }

        for (Orders orderElem : fclTrucksOrders){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("DOOR TO PIER")){
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        fclTruckTable.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }
        return SUCCESS;
    }
    public String viewInlandFreightList_LCL(){
        String column = getColumnBookingFilter();

        // For LCL Trucking Origin
        List<Orders> lclTrucksOrders = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            lclTrucksOrders = orderService.findOrdersByBookingNumber(column, order.getOrderKeyword(), getClientId(), "LESS CONTAINER LOAD");
        }else if(originCityTruck != null){
            lclTrucksOrders = operationsService.findOrdersByLCLTrucksOrigin(originCityTruck);
        }else{
            lclTrucksOrders = operationsService.findOrdersByLCLTrucks();
        }

        for (Orders orderElem : lclTrucksOrders){
            if(orderElem.getServiceMode().equals("DOOR TO DOOR") || orderElem.getServiceMode().equals("DOOR TO PIER") ) {
                // will only show bookings that is not archived
                String strOrig = orderElem.getOrderStatus();
                int intIndex = strOrig.indexOf("ARCHIVED");

                if(intIndex == -1){
                    if(!"SERVICE ACCOMPLISHED".equals(orderElem.getOrderStatus())) {
                        lclTruckTable.add(transformToOrderFormBean(orderElem));
                    }
                }
            }
        }
        return SUCCESS;
    }

    public String viewFreightItemList() {
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);

        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);
        sessionAttributes.put("modeOfService", orderEntity.getServiceMode());
        sessionAttributes.put("freightType", orderEntity.getServiceType());

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String reloadFreightItemList() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        sessionAttributes.put("orderIdParam", orderIdParam);
        sessionAttributes.put("modeOfService", orderEntity.getServiceMode());
        sessionAttributes.put("freightType", orderEntity.getServiceType());

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionError("Item(s) no longer exist");

        return SUCCESS;
    }

    public String viewFreightItemListError() {

        clearErrorsAndMessages();
        addActionError("Status must be the same");

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParamSession);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }
    public String viewSeaFreightItemListErrorInput() {
        clearErrorsAndMessages();
        addActionError("Status must be Planning 1 only.");

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParamSession);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String viewSeaFreightItemListErrorEditInput() {
        clearErrorsAndMessages();
//        addActionError("Status must be Planning 1 to 3, On Going, Queue for Pickup, Consolidation, and Departure only.");
        addActionError("Status must be Planning 1 to 3 only.");

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParamSession);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String viewInlandFreightItemListErrorInput() {
        clearErrorsAndMessages();
//        addActionError("Status must be Planning 2, 3, Queue for Pickup and Delivery only.");
        addActionError("Status must be Planning 2 and 3 only.");

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParamSession);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String viewInlandFreightItemListNoVendorInput() {
        clearErrorsAndMessages();
        addActionError("No current vendors being set yet and Planning 1 should only be editable in Freight Planning only.");

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParamSession);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String viewInlandFreightItemListErrorEditInput() {
        clearErrorsAndMessages();
        addActionError("Planning 1 should only be editable in Freight Planning only.");

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParamSession);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    // Error for null
    public String viewFreightItemListNullError() {

        clearErrorsAndMessages();
        addActionError("No Item(s) selected");

        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        order = transformToOrderFormBean(orderEntity);

        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParamSession);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String viewInfoOrderInland() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemElem));
        }
        return SUCCESS;
    }

    public String viewInfoOrderSea() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemElem));
        }
        return SUCCESS;
    }

    public String listVendorDriverAndTrucks() {

        List<Driver> driverList = vendorService.findDriverByVendorId(vendorId);
        List<Trucks> trucksList = vendorService.findTrucksByVendorId(vendorId);

        for(int i = 0; i < driverList.size(); i++) {
            if(driverList.get(i).getStatus().equals("ACTIVE")) {
                driverMap.put(driverList.get(i).getFirstName() + " " + driverList.get(i).getLastName(), driverList.get(i).getFirstName() + " " + driverList.get(i).getLastName());
            }
        }

        for(int i = 0; i <trucksList.size(); i++) {
            trucksMap.put(trucksList.get(i).getTruckCode(), trucksList.get(i).getPlateNumber());
        }

        return SUCCESS;
    }

    public String truckDetails(){

        Trucks truckEntity = vendorService.findTrucksByTruckCode(truckCodeParam);

        truck = transformToFormBeanTrucks(truckEntity);

        bodyTypeMap.put(truck.getTruckType(),truck.getTruckType());
        plateNumberMap.put(truck.getPlateNumber(), truck.getPlateNumber());
        grossWeightMap.put(truck.getGrossWeight(), truck.getGrossWeight());

        return SUCCESS;
    }

    public String listVessel() {

        List <Vessel> vendorEntity = vendorService.findVesselByVendorId(vendorId);

        for(int i=0; i < vendorEntity.size(); i++){
            vesselMap.put(vendorEntity.get(i).getVesselName(), vendorEntity.get(i).getVesselName() + " = " + vendorEntity.get(i).getVesselType() );
        }

        return SUCCESS;
    }

    private TruckBean transformToFormBeanTrucks(Trucks entity) {

        TruckBean formBean = new TruckBean();

        formBean.setTruckId(entity.getTruckId());
        formBean.setTruckType(entity.getTruckType());
        formBean.setModelNumber(entity.getModelNumber());
        formBean.setModelYear(entity.getModelYear());
        formBean.setEngineNumber(entity.getEngineNumber());
        formBean.setTruckCode(entity.getTruckCode());
        formBean.setGrossWeight(entity.getGrossWeight());
        formBean.setPlateNumber(entity.getPlateNumber());
        formBean.setVendorId(entity.getVendorId());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());
        formBean.setModifiedTimeStamp(new Date());
        formBean.setMotorVehicleNumber(entity.getMotorVehicleNumber());
        formBean.setIssueDate(entity.getIssueDate());
        formBean.setNetWeight(entity.getNetWeight());
        formBean.setNetCapacity(entity.getNetCapacity());
        formBean.setOwnerName(entity.getOwnerName());
        formBean.setOwnerAddress(entity.getOwnerAddress());
        formBean.setOfficialReceipt(entity.getOfficialReceipt());

        return formBean;
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
        formBean.setConsigneeName(consigneeName.getCompanyName());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));
        //formBean.setConsigneeCode(entity.getConsigneeCode());
        formBean.setOrderId(entity.getOrderId());

        List <OrderItems> orderItemsVolume = orderService.findAllItemByOrderId(entity.getOrderId());

        Float orderVolume = 0.F;

        for(OrderItems orderItemElem : orderItemsVolume) {
            if(orderItemElem.getVolume() != null){
                orderVolume = orderVolume + orderItemElem.getVolume();
            }
        }

        formBean.setOrderVolumeInt(Math.round(orderVolume)); // For showing the total volume of order items inside booking

        Double orderWeight = 0.0;

        for(OrderItems orderItemElem : orderItemsVolume) {
            if(orderItemElem.getWeight() != null){
                orderWeight = orderWeight + orderItemElem.getWeight();
            }
        }

        formBean.setOrderWeightInt(orderWeight.intValue()); // For showing the total volume of order items inside booking

        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());

        if(entity.getOriginationPort() != null){
            formBean.setOriginationPort(entity.getOriginationPort());
        }else if(entity.getServiceMode().equals("DELIVERY")){
            formBean.setOriginationPort("NOT APPLICABLE");
        }else{
            formBean.setOriginationPort("NONE");
        }

        /*formBean.setOriginationPort(entity.getOriginationPort());*/
        formBean.setModeOfPayment(entity.getPaymentMode());
        formBean.setNotifyBy(entity.getNotificationType());
        formBean.setOrderDate(entity.getOrderDate());
        /*formBean.setDestinationPort(entity.getDestinationPort());*/

        if(entity.getDestinationPort() != null){
            formBean.setDestinationPort(entity.getDestinationPort());
        }else if(entity.getServiceMode().equals("PICKUP")){
            formBean.setDestinationPort("NOT APPLICABLE");
        }else{
            formBean.setDestinationPort("NONE");
        }

        formBean.setRates(entity.getRates());
        formBean.setComments(entity.getComments());

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

        if(entity.getPickupDate() != null){
            /*formBean.setPickupDate(entity.getPickupDate());*/
            formBean.setStrPickupDate(formatter.format(entity.getPickupDate()));
        }else if(entity.getServiceMode().equals("DELIVERY")){
            formBean.setStrPickupDate("NOT APPLICABLE");
        }else{
            formBean.setStrPickupDate("NONE");
        }

        if(entity.getDeliveryDate() != null){
            /*formBean.setDeliveryDate(entity.getDeliveryDate());*/
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
        if (entity.getShipperAddressId()!=null) {
            Address addresses = customerService.findAddressById(entity.getShipperAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(addresses));
            formBean.setShipperInfoAddress(address);
        }else if(entity.getServiceMode().equals("DELIVERY")){
            address = new AddressBean();
            address.setAddress("NOT APPLICABLE");
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
        if (entity.getConsigneeAddressId()!=null) {
            Address consigneeAddress = customerService.findAddressById(entity.getConsigneeAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(consigneeAddress));
            formBean.setConsigneeInfoAddress(address);
        }else if(entity.getServiceMode().equals("PICKUP")){
            address = new AddressBean();
            address.setAddress("NOT APPLICABLE");
            formBean.setConsigneeInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            formBean.setConsigneeInfoAddress(address);
        }

        // for consignee contact person
        formBean.setConsigneeContactPersonId(entity.getConsigneeContactPersonId());
        if (entity.getConsigneeContactPersonId() != null) {
            Contacts contactElem = customerService.findContactById(entity.getConsigneeContactPersonId());
            formBean.setConsigneeContactName(contactElem.getFirstName() + " " + contactElem.getMiddleName() + " " + contactElem.getLastName());
        }

        List<OrderItems> orderItemEntity = operationsService.findAllOrderItemsByOrderId(entity.getOrderId());

        if(orderItemEntity.size() >= 1){
                if(orderItemEntity.get(0).getTruckOrigin() == null || "".equals(orderItemEntity.get(0).getTruckOrigin())){
                    formBean.setPlateNumberOri("NONE");
                }
                else{
                    Trucks truckEntityOri = vendorService.findTrucksByTruckCode(orderItemEntity.get(0).getTruckOrigin());
                    formBean.setPlateNumberOri(truckEntityOri.getPlateNumber());
                }

                if(orderItemEntity.get(0).getTruckDestination() == null || "".equals(orderItemEntity.get(0).getTruckDestination())){
                    formBean.setPlateNumberDes("NONE");
                }
                else {
                    Trucks truckEntityDes = vendorService.findTrucksByTruckCode(orderItemEntity.get(0).getTruckDestination());
                    formBean.setPlateNumberDes(truckEntityDes.getPlateNumber());
                }
        }

        return formBean;
    }

    public String consolidateAction(){

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAA " + vesselScheduleIdParam);
        System.out.println("BBBBBBBBBBBBBBBBBBBBBBBB " + vendorIdParam);
        System.out.println("CCCCCCCCCCCCCCCCCCCCCCCC " + checkLCL);

        // Load all vessel schedules
        // FOR IMPROVEMENT -- FILTER ALL VESSEL SCHEDULES DATES THAT WILL NOT INCLUDE CURRENT DATE
        vesselSchedule.setOrdersLCL(checkLCL);

        List<VesselSchedules> vesselSchedulesList = operationsService.findAllVesselSchedule();

        for(VesselSchedules vesselScheduleElem : vesselSchedulesList){

            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        return SUCCESS;
    }

    public OrderItemsBean transformToOrderItemFormBean(OrderItems entity) {
        OrderItemsBean formBean = new OrderItemsBean();
        Trucks truckEntityOri = vendorService.findTrucksByTruckCode(entity.getTruckOrigin());
        Trucks truckEntityDes = vendorService.findTrucksByTruckCode(entity.getTruckDestination());
        formBean.setNameSize(entity.getNameSize());
        formBean.setStatus(entity.getStatus());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setClientId(entity.getClientId());
        formBean.setNameSize(entity.getNameSize());
        formBean.setOrderId(entity.getOrderId());
        formBean.setQuantity(entity.getQuantity());
        formBean.setClassification(entity.getClassification());
        formBean.setDescription(entity.getCommodity());
        formBean.setDeclaredValue(entity.getDeclaredValue());
        formBean.setRemarks(entity.getComments());
        formBean.setRate(entity.getRate());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setStatus(entity.getStatus());
        formBean.setWeight(entity.getWeight());

        Orders orderCheck = orderService.findOrdersById(entity.getOrderId());

        if(truckEntityOri == null || truckEntityOri.equals("")) {
            formBean.setPlateNumberOri("NONE");
        }
        else if(orderCheck.getServiceMode().equals("DELIVERY")){
            formBean.setPlateNumberOri("NOT APPLICABLE");
        }else{
            formBean.setPlateNumberOri(vendorService.findTrucksByTruckCode(entity.getTruckOrigin()).getPlateNumber());
        }

        if(truckEntityDes == null || truckEntityDes.equals("")) {
            formBean.setPlateNumberDes("NONE");
        }
        else if(orderCheck.getServiceMode().equals("PICKUP")){
            formBean.setPlateNumberOri("NOT APPLICABLE");
        }else{
            formBean.setPlateNumberDes(vendorService.findTrucksByTruckCode(entity.getTruckDestination()).getPlateNumber());
        }

        if(entity.getVendorSea() == null || "".equals(entity.getVendorSea()) || "NONE".equals(entity.getVendorSea())){
            formBean.setVendorSea("NONE");
        }else{
            formBean.setVendorSea(entity.getVendorSea());
        }

        // Vendor Origin and Destination will have N/A values if service mode does not require them
        if (orderCheck.getServiceMode().equals("PIER TO DOOR")){
            formBean.setVendorOrigin("N/A");
            formBean.setVendorOriginName("N/A");
            formBean.setFinalPickupDate("N/A");
            if(entity.getVendorDestination() == null || "".equals(entity.getVendorDestination())){
                formBean.setVendorDestination("NONE");
                formBean.setVendorDestinationName("NONE");
            }else{
                formBean.setVendorDestination(entity.getVendorDestination());
                formBean.setVendorDestinationName(vendorService.findVendorByVendorCode(entity.getVendorDestination()).getVendorName());
            }
            formBean.setFinalDeliveryDate(entity.getFinalDeliveryDate());
        }else if(orderCheck.getServiceMode().equals("DOOR TO PIER")){
            if(entity.getVendorOrigin() == null || "".equals(entity.getVendorOrigin())){
                formBean.setVendorOrigin("NONE");
                formBean.setVendorOriginName("NONE");
            }else{
                formBean.setVendorOrigin(entity.getVendorOrigin());
                formBean.setVendorOriginName(vendorService.findVendorByVendorCode(entity.getVendorOrigin()).getVendorName());
            }
            formBean.setFinalPickupDate(entity.getFinalPickupDate());
            formBean.setVendorDestination("N/A");
            formBean.setVendorDestinationName("N/A");
            formBean.setFinalDeliveryDate("N/A");
        }else if(orderCheck.getServiceMode().equals("PIER TO PIER")){
            formBean.setVendorOrigin("N/A");
            formBean.setVendorOriginName("N/A");
            formBean.setFinalPickupDate("N/A");
            formBean.setVendorDestination("N/A");
            formBean.setVendorDestinationName("N/A");
            formBean.setFinalDeliveryDate("N/A");
        }else if(orderCheck.getServiceType().equals("TRUCKING")){

            if(orderCheck.getServiceMode().equals("DELIVERY")){
                if(entity.getVendorDestination() == null || "".equals(entity.getVendorDestination())){
                    formBean.setVendorDestination("NONE");
                    formBean.setVendorDestinationName("NONE");
                    formBean.setFinalDeliveryDate("NONE");
                }else{
                    formBean.setVendorDestination(entity.getVendorOrigin());
                    formBean.setVendorDestinationName(vendorService.findVendorByVendorCode(entity.getVendorDestination()).getVendorName());
                    formBean.setFinalDeliveryDate(entity.getFinalDeliveryDate());
                }
                formBean.setVendorOrigin("NOT APPLICABLE");
                formBean.setVendorOriginName("NOT APPLICABLE");
                formBean.setFinalPickupDate("NOT APPLICABLE");

            }else{
                if(entity.getVendorOrigin() == null || "".equals(entity.getVendorOrigin())){
                    formBean.setVendorOrigin("NONE");
                    formBean.setVendorOriginName("NONE");
                    formBean.setFinalPickupDate("NONE");
                }else{
                    formBean.setVendorOrigin(entity.getVendorOrigin());
                    formBean.setVendorOriginName(vendorService.findVendorByVendorCode(entity.getVendorOrigin()).getVendorName());
                    formBean.setFinalPickupDate(entity.getFinalPickupDate());
                }
                formBean.setVendorDestination("NOT APPLICABLE");
                formBean.setVendorDestinationName("NOT APPLICABLE");
                formBean.setFinalDeliveryDate("NOT APPLICABLE");
            }
        }else{
            if(entity.getVendorOrigin() == null || "".equals(entity.getVendorOrigin()) || "NONE".equals(entity.getVendorOrigin())){
                formBean.setVendorOrigin("NONE");
                formBean.setVendorOriginName("NONE");
                formBean.setFinalPickupDate("NONE");
            }else{
                formBean.setVendorOrigin(entity.getVendorOrigin());
                formBean.setVendorOriginName(vendorService.findVendorByVendorCode(entity.getVendorOrigin()).getVendorName());
                formBean.setFinalPickupDate(entity.getFinalPickupDate());
            }
            if(entity.getVendorDestination() == null || "".equals(entity.getVendorDestination()) || "NONE".equals(entity.getVendorDestination())){
                formBean.setVendorDestination("NONE");
                formBean.setVendorDestinationName("NONE");
                formBean.setFinalDeliveryDate("NONE");
            } else {
                formBean.setVendorDestination(entity.getVendorDestination());
                formBean.setVendorDestinationName(vendorService.findVendorByVendorCode(entity.getVendorDestination()).getVendorName());
                formBean.setFinalDeliveryDate(entity.getFinalDeliveryDate());
            }
        }

        if (entity.getVesselScheduleId() == null || "".equals(entity.getVesselScheduleId()) || "NONE".equals(entity.getVesselScheduleId())) {
            formBean.setVesselScheduleId("NONE");
            formBean.setVesselName("NONE");
            formBean.setVendorName("NONE");
            formBean.setDepartureDate("NONE");
            formBean.setArrivalDate("NONE");
        } else {
            formBean.setVesselScheduleId(entity.getVesselScheduleId());
            // Clarence set vessel schedule ID as voyage Number too confusing...
            Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorSea());
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(entity.getVesselScheduleId());
            formBean.setVendorName(vendorEntity.getVendorName());
            formBean.setVoyageNumber(vesselScheduleEntity.getVoyageNumber());
            formBean.setVesselName(vesselScheduleEntity.getVesselName());
            formBean.setOriginPort(vesselScheduleEntity.getOriginPort());
            formBean.setDestinationPort(vesselScheduleEntity.getDestinationPort());
            formBean.setDepartureDate(vesselScheduleEntity.getDepartureDate());
            formBean.setArrivalDate(vesselScheduleEntity.getArrivalDate());
        }

        formBean.setFinalPickupDate(entity.getFinalPickupDate());
        formBean.setFinalDeliveryDate(entity.getFinalDeliveryDate());
        formBean.setDriverOrigin(entity.getDriverOrigin());
        formBean.setDriverDestination(entity.getDriverDestination());
        formBean.setTruckOrigin(entity.getTruckOrigin());
        formBean.setTruckDestination(entity.getTruckDestination());
        formBean.setVolume(entity.getVolume());
        formBean.setContainerId(entity.getContainerId());

        return formBean;
    }

    public String checkOrderConsolidate() throws ParseException {

        List<Integer> ordersListing = new ArrayList<Integer>();

        if(check == null){

        }else{

            SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
            String dateInStringPast = "31-Dec-1900";
            String dateInStringFuture = "31-Dec-3000";
            Date pastDate = formatter.parse(dateInStringPast);
            Date futureDate = formatter.parse(dateInStringFuture);

            filterPickup = pastDate;
            filterDelivery = futureDate;

            for(int i=0; i<check.length; i++){
                if(check[i].equals("false") || check[i].equals("null")|| "".equals(check[i])){ // catches error when no values inside check

                }

                Integer orderId = Integer.parseInt(check[i]);
                Orders entity = orderService.findOrdersById(orderId);

                if (entity.getPickupDate().compareTo(filterPickup)>0){
                    filterPickup = entity.getPickupDate();
                }

                if (entity.getDeliveryDate().compareTo(filterDelivery)<0){
                    filterDelivery = entity.getDeliveryDate();
                }

            }
        }

        viewSeaFreightList();

        return SUCCESS;
    }

    public OrderItems transformOrderItemToEntityBeanSea (OperationsBean formBean) {

        OrderItems entity = new OrderItems();

        Client client = clientService.findClientById(getClientId().toString());
        entity.setOrderItemId(orderItemIdParam);
        entity.setClientId(client.getClientId());
        entity.setNameSize(operationsService.findOrderItemById(orderItemIdParam).getNameSize());
        entity.setOrderId(operationsService.findOrderItemById(orderItemIdParam).getOrderId());
        entity.setQuantity(operationsService.findOrderItemById(orderItemIdParam).getQuantity());
        entity.setClassification(operationsService.findOrderItemById(orderItemIdParam).getClassification());
        entity.setDeclaredValue(operationsService.findOrderItemById(orderItemIdParam).getDeclaredValue());
        entity.setRate(operationsService.findOrderItemById(orderItemIdParam).getRate());
        entity.setCreatedBy(operationsService.findOrderItemById(orderItemIdParam).getCreatedBy());
        entity.setModifiedBy(operationsService.findOrderItemById(orderItemIdParam).getModifiedBy());
        entity.setComments(operationsService.findOrderItemById(orderItemIdParam).getComments());
        entity.setCommodity(operationsService.findOrderItemById(orderItemIdParam).getCommodity());
        entity.setCreatedTimestamp(operationsService.findOrderItemById(orderItemIdParam).getCreatedTimestamp());
        entity.setModifiedTimestamp(operationsService.findOrderItemById(orderItemIdParam).getModifiedTimestamp());
        entity.setWeight(operationsService.findOrderItemById(orderItemIdParam).getWeight());
        entity.setVolume(operationsService.findOrderItemById(orderItemIdParam).getVolume());
        entity.setServiceRequirement(operationsService.findOrderItemById(orderItemIdParam).getServiceRequirement());

        if("SHIPPING AND TRUCKING".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemIdParam).getOrderId()).getServiceType())) {
            if ("DOOR TO DOOR".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemIdParam).getOrderId()).getServiceMode())) {
                entity.setStatus("PLANNING 2");
            } else if ("DOOR TO PIER".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemIdParam).getOrderId()).getServiceMode())) {
                entity.setStatus("PLANNING 2");
            } else {
                entity.setStatus("PLANNING 3");
            }
        }else{
            entity.setStatus("ON GOING");
        }

        /*if ("SHIPPING".equals(orderService.findOrdersById(operationsService.findOrderItemById(orderItemIdParam).getOrderId()).getServiceType())) {
            entity.setStatus("ON GOING");
        }*/

        /*entity.setVendorSea(vendorService.findVendorById(Integer.parseInt(vendorSea)).getVendorCode());*/
        /*entity.setVendorSea(operationsService.findOrderItemById(orderItemIdParam).getVendorSea());*/
        return entity;
    }

    public OrderItems transformOrderItemToEntityBeanOrigin (OperationsBean formBean) {
        OrderItems entity = new OrderItems();
        entity.setVendorOrigin(vendorService.findVendorById(formBean.getVendorListOrigin()).getVendorCode());
        entity.setFinalPickupDate(formBean.getPickupDate());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setClientId(formBean.getClientId());
        entity.setNameSize(formBean.getNameSize());
        entity.setOrderId(formBean.getOrderId());
        entity.setQuantity(formBean.getQuantity());
        entity.setClassification(formBean.getClassification());
        entity.setCommodity(formBean.getCommodity());
        entity.setDeclaredValue(formBean.getDeclaredValue());
        entity.setComments(formBean.getComments());
        entity.setRate(formBean.getRate());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setModifiedBy(formBean.getModifiedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        entity.setModifiedTimestamp(formBean.getModifiedTimestamp());
        entity.setWeight(formBean.getWeight());

        if ("SHIPPING AND TRUCKING".equals(formBean.getFreightType())) {
            if ("DOOR TO PIER".equals(formBean.getModeOfService())) {
                entity.setStatus("ON GOING");
            } else {
                entity.setStatus("PLANNING 3");
            }
        } else {
            entity.setStatus("ON GOING");
        }

        entity.setDriverOrigin(formBean.getDriverOrigin());
        entity.setTruckOrigin(formBean.getTruckOrigin());
        entity.setVendorSea(formBean.getVendorSea());
        entity.setVesselScheduleId(formBean.getVesselScheduleId());
        // Add missing order items field that was left out in the form and added in the backend instead
        entity.setCommodity(operationsService.findOrderItemById(formBean.getOrderItemId()).getCommodity());
        entity.setComments(operationsService.findOrderItemById(formBean.getOrderItemId()).getComments());
        entity.setCreatedTimestamp(operationsService.findOrderItemById(formBean.getOrderItemId()).getCreatedTimestamp());
        entity.setModifiedTimestamp(operationsService.findOrderItemById(formBean.getOrderItemId()).getModifiedTimestamp());
        entity.setWeight(operationsService.findOrderItemById(formBean.getOrderItemId()).getWeight());
        entity.setVolume(operationsService.findOrderItemById(formBean.getOrderItemId()).getVolume());
        entity.setServiceRequirement(operationsService.findOrderItemById(formBean.getOrderItemId()).getServiceRequirement());

        return entity;
    }

    public OrderItems transformOrderItemToEntityBeanDestination (OperationsBean formBean) {
        OrderItems entity = new OrderItems();
        entity.setVendorDestination(vendorService.findVendorById(formBean.getVendorListDestination()).getVendorCode());
        entity.setFinalDeliveryDate(formBean.getDeliveryDate());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setClientId(formBean.getClientId());
        entity.setNameSize(formBean.getNameSize());
        entity.setOrderId(formBean.getOrderId());
        entity.setQuantity(formBean.getQuantity());
        entity.setClassification(formBean.getClassification());
        entity.setCommodity(formBean.getCommodity());
        entity.setDeclaredValue(formBean.getDeclaredValue());
        entity.setComments(formBean.getComments());
        entity.setRate(formBean.getRate());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setModifiedBy(formBean.getModifiedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        entity.setModifiedTimestamp(formBean.getModifiedTimestamp());
        entity.setWeight(formBean.getWeight());
        entity.setStatus("ON GOING");
        entity.setVendorOrigin(formBean.getVendorOrigin());
        entity.setFinalPickupDate(formBean.getPickupDate());
        entity.setDriverOrigin(formBean.getDriverOrigin());
        entity.setTruckOrigin(formBean.getTruckOrigin());
        entity.setVendorSea(formBean.getVendorSea());
        entity.setVesselScheduleId(formBean.getVesselScheduleId());
        entity.setDriverDestination(formBean.getDriverDestination());
        entity.setTruckDestination(formBean.getTruckDestination());
        // Add missing order items field that was left out in the form and added in the backend instead
        entity.setCommodity(operationsService.findOrderItemById(formBean.getOrderItemId()).getCommodity());
        entity.setComments(operationsService.findOrderItemById(formBean.getOrderItemId()).getComments());
        entity.setCreatedTimestamp(operationsService.findOrderItemById(formBean.getOrderItemId()).getCreatedTimestamp());
        entity.setModifiedTimestamp(operationsService.findOrderItemById(formBean.getOrderItemId()).getModifiedTimestamp());
        entity.setWeight(operationsService.findOrderItemById(formBean.getOrderItemId()).getWeight());
        entity.setVolume(operationsService.findOrderItemById(formBean.getOrderItemId()).getVolume());
        entity.setServiceRequirement(operationsService.findOrderItemById(formBean.getOrderItemId()).getServiceRequirement());

        return entity;
    }

    public VesselScheduleBean transformToFormBeanVesselSchedule(VesselSchedules entity) {

        VesselScheduleBean formBean = new VesselScheduleBean();
        /*formBean.setVesselScheduleId(entity.getVesselScheduleId());*/
//        System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + entity.getVesselScheduleId() );
        if (entity.getVesselScheduleId() == null || "".equals(entity.getVesselScheduleId()) || "NONE".equals(entity.getVesselScheduleId())) {
            /*formBean.setVesselScheduleId("NONE");*/
            formBean.setVesselName("NONE");
        } else {
            formBean.setVesselScheduleId(entity.getVesselScheduleId());
            // Clarence set vessel schedule ID as voyage Number too confusing...
            /*formBean.setVesselName(vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(entity.getVesselScheduleId()).getVesselName());*/
        }
        formBean.setVendorId(entity.getVendorId());
        formBean.setOriginPort(entity.getOriginPort());
        formBean.setDestinationPort(entity.getDestinationPort());
        formBean.setArrivalDate(entity.getArrivalDate());
        formBean.setArrivalTime(entity.getArrivalTime());
        formBean.setDepartureDate(entity.getDepartureDate());
        formBean.setDepartureTime(entity.getDepartureTime());
        formBean.setClientId(entity.getClientId());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setVoyageNumber(entity.getVoyageNumber());
        formBean.setVesselName(entity.getVesselName());
        // To find for the Vendor Name via Vendor Code
        formBean.setVendorName(vendorService.findVendorByVendorCode(entity.getVendorCode()).getVendorName());
        // To show vendor class
        formBean.setVendorClass(vendorService.findVendorByVendorCode(entity.getVendorCode()).getVendorClass());
        return formBean;
    }

//    -----------------CONSOLIDATION MODULE-------------------------

    public String loadAddFormPage() {
        filterVesselSchedule();
        return SUCCESS;
    }

    public VesselScheduleBean transformToVesselSchedule(VesselSchedules entity) {
        VesselScheduleBean formBean = new VesselScheduleBean();

        formBean.setVesselScheduleId(entity.getVesselScheduleId());
        formBean.setVoyageNumber(entity.getVoyageNumber());
        Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorCode());
        formBean.setVoyageVendorDestination(entity.getVoyageNumber() + " - " + vendorEntity.getVendorName() + " - " + entity.getDestinationPort() );

        return formBean;
    }

    public String loadQRFormPage(){ return SUCCESS; }

    public String loadSuccessGenerateQR(){

        clearErrorsAndMessages();
        addActionMessage("Success! Container has been deleted.");
        return SUCCESS;
    }

    public String loadSearchContainerPage(){ return SUCCESS; }

    public String viewContainerList() {

        String column = getColumnFilter();
        List<Container> containerList = new ArrayList<Container>();

        if (StringUtils.isNotBlank(column)) {
            containerList = containerService.findContainerByCriteria(column, container.getContainerKeyword());
        } else {
            containerList = containerService.findAllContainer();
        }
        for (Container containerElem : containerList) {
            containers.add(transformContainerToFormBean(containerElem));
        }
        return SUCCESS;
    }

    public String deleteContainer() {
        Container containerEntity = containerService.findContainerById(containerIdParam);

        List <OrderItems> orderItemListing = operationsService.findAllOrderItemsWithContainer(containerIdParam);

        if(orderItemListing.size() > 0){
            clearErrorsAndMessages();
            addActionMessage("Container cannot be deleted. One or more booking and Order Item(s ) is associated with it");
            viewContainerList();
            return "error";
        }else{

            if(containerEntity.getEirType().equals("EIR FORM 1")){
                Documents documentEIR1 = documentsService.findEIRAndRefId("EQUIPMENT INTERCHANGE RECEIPT 1",containerIdParam,"CONTAINERS");
                documentsService.deleteDocument(documentEIR1);
            }else if(containerEntity.getEirType().equals("EIR FORM 2")){
                Documents documentEIR2 = documentsService.findEIRAndRefId("EQUIPMENT INTERCHANGE RECEIPT 2",containerIdParam,"CONTAINERS");
                documentsService.deleteDocument(documentEIR2);
            }

            containerService.deleteContainer(containerEntity);
        }

        return SUCCESS;
    }

    public String loadSuccessDeleteContainer() {
        List<Container> containerEntityList = containerService.findAllContainer();
        for (Container containerElem : containerEntityList) {
            containers.add(transformContainerToFormBean(containerElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Container has been deleted.");

        return SUCCESS;
    }

    public String getColumnBookingFilter() {

        String column = "";
        if (order == null) {
            System.out.println("ok");
            return column;
        } else {
            if ("BOOKING NUMBER".equals(order.getOrderSearchCriteria())) {
                column = "orderNumber";
            }
            return column;
        }

    }

    public String getColumnFilter() {
        String column = "";
        if ("CONTAINER NUMBER".equals(container.getContainerSearchCriteria())) {
            column = "containerNumber";
        } else if ("EIR NUMBER".equals(container.getContainerSearchCriteria())) {
            column = "eirNumber";
        } else if ("SHIPPING LINE".equals(container.getContainerSearchCriteria())) {
            column = "shipping";
        }
        return column;
    }

    public String viewContainerInfo() {
        Container containerEntity = new Container();
        containerEntity = containerService.findContainerById(containerIdParam);
        container = transformContainerToFormBean(containerEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("containerId", container.getContainerId());

        return SUCCESS;
    }

    public ContainerBean transformContainerToFormBean(Container entity) {

        ContainerBean formBean = new ContainerBean();
        formBean.setContainerId(entity.getContainerId());
        /*formBean.setClientId(entity.getClientId());  */
        formBean.setEirNumber(entity.getEirNumber());
        formBean.setGateInTime(entity.getGateInTime());
        formBean.setGateOutTime(entity.getGateOutTime());

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
        if(entity.getGateInTime() != null){
            Date dateGateInTime = entity.getGateInTime();
            formBean.setStrGateInTime(formatter.format(dateGateInTime));
        }

        if(entity.getGateOutTime() != null){
            Date dateGateOutTime = entity.getGateOutTime();
            formBean.setStrGateOutTime(formatter.format(dateGateOutTime));
        }

        formBean.setShipping(entity.getShipping());
        formBean.setTrucking(entity.getTrucking());
        formBean.setPlateNumber(entity.getPlateNumber());
        formBean.setVanNumber(entity.getVanNumber());
        formBean.setDriver(entity.getDriver());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setRemarks(entity.getRemarks());
        formBean.setVanTo(entity.getVanTo());
        formBean.setVanFrom(entity.getVanFrom());
        formBean.setContainerNumber(entity.getContainerNumber());
        formBean.setContainerSize(entity.getContainerSize());
        formBean.setContainerType(entity.getContainerType());
        formBean.setEirType(entity.getEirType());
        formBean.setVanLocation(entity.getVanLocation());
        formBean.setLadenEmpty(entity.getLadenEmpty());
        formBean.setReceiptNumber(entity.getReceiptNumber());
        formBean.setForkliftOperator(entity.getForkliftOperator());
        formBean.setOperationsDept(entity.getOperationsDept());
        formBean.setContainerStatus(entity.getContainerStatus());
        formBean.setSealNumber(entity.getSealNumber());
        formBean.setBulletSeal(entity.getBulletSeal());
        formBean.setShippingSeal(entity.getShippingSeal());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setPortCode(entity.getPortCode());

        if(!"".equals(entity.getShipping()) && entity.getShipping() != null){
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(entity.getShipping());
            formBean.setVoyageVendorDestination(entity.getShipping() + " - " + vendorService.findVendorByVendorCode(vesselScheduleEntity.getVendorCode()).getVendorName() + " - " + vesselScheduleEntity.getDestinationPort());
        }else{
            formBean.setVoyageVendorDestination("NONE");
        }

        // FOR EIR 1 and 2 DOCUMENTS
        if(!entity.getEirType().equals("NONE")){
            String docName;

            if(entity.getEirType().equals("EIR FORM 1")){
                docName = "EQUIPMENT INTERCHANGE RECEIPT 1";
            }else{
                docName = "EQUIPMENT INTERCHANGE RECEIPT 2";
            }

            Documents documentElem = documentsService.findEIRAndRefId(docName,entity.getContainerId(),"CONTAINERS");

            if(documentElem != null){
                formBean.setDocumentCheck("AVAILABLE");
                formBean.setDocumentId(documentElem.getDocumentId());
            }
        }

        return formBean;
    }

    private Container transformContainerToEntityBean(ContainerBean formBean){

        Container entity = new Container();
        /*Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);*/

        if(formBean.getContainerId() != null) {
            entity.setContainerId(new Integer(formBean.getContainerId()));
        }

        entity.setEirType(formBean.getEirType());
        entity.setEirNumber(formBean.getEirNumber());
        entity.setReceiptNumber(formBean.getReceiptNumber());
        entity.setGateInTime(formBean.getGateInTime());
        entity.setGateOutTime(formBean.getGateOutTime());
        entity.setShipping(formBean.getShipping());
        if(!"".equals(formBean.getShipping())){
            VesselSchedules vesselScheduleEntity = vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(formBean.getShipping());
            entity.setPortCode(vesselScheduleEntity.getDestinationPort()); // to save the destination port
        }
        entity.setVanNumber(formBean.getVanNumber());
        entity.setVanLocation(formBean.getVanLocation());
        entity.setTrucking(formBean.getTrucking());
        entity.setPlateNumber(formBean.getPlateNumber());
        entity.setDriver(formBean.getDriver());
        entity.setSealNumber(formBean.getSealNumber());
        entity.setBulletSeal(formBean.getBulletSeal());
        entity.setShippingSeal(formBean.getShippingSeal());
        entity.setOrderNumber(formBean.getOrderNumber());
        entity.setRemarks(formBean.getRemarks());
        entity.setLadenEmpty(formBean.getLadenEmpty());
        entity.setVanTo(formBean.getVanTo());
        entity.setVanFrom(formBean.getVanFrom());
        entity.setForkliftOperator(formBean.getForkliftOperator());
        entity.setOperationsDept(formBean.getOperationsDept());
        entity.setContainerNumber(formBean.getContainerNumber());
        entity.setContainerSize(formBean.getContainerSize());
        entity.setContainerType(formBean.getContainerType());
        entity.setLadenEmpty(formBean.getLadenEmpty());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedTimestamp(new Date());

        if ("CONSOLIDATED".equals(formBean.getContainerStatus())) {
            entity.setContainerStatus("CONSOLIDATED");
        } else if ("OPEN".equals(formBean.getContainerStatus())){
            entity.setContainerStatus("OPEN");
        } else{
            entity.setContainerStatus(formBean.getContainerStatus());
        }


        return entity;
    }

    public String editContainer() throws Exception {
        validateOnSubmit(container);
        if (hasActionErrors()) {
            return INPUT;
        }
        try {
            Container oldContainer = containerService.findContainerById(container.getContainerId());
            Container newContainer = transformContainerToEntityBean(container);

            if(container.getShipping().equals("")){
                if(!"".equals(oldContainer.getShipping())){
                    newContainer.setShipping(oldContainer.getShipping());
                    newContainer.setPortCode(oldContainer.getPortCode());
                }else{
                    newContainer.setShipping("");
                }
            }else if(!oldContainer.getShipping().equals(newContainer.getShipping())){
                List <OrderItems> orderItemListing = operationsService.findAllOrderItemsWithContainer(oldContainer.getContainerId());
                if(orderItemListing.size() > 0){
                    filterVesselSchedule();
                    loadSuccessEditContainer();
                    clearErrorsAndMessages();
                    addActionMessage("Container cannot be edited. One or more booking is associated with it");
                    return INPUT;
                }
            }else{
                newContainer.setShipping(container.getShipping());
                newContainer.setPortCode(vesselSchedulesService.findVesselSchedulesByIdVoyageNumber(container.getShipping()).getDestinationPort());
            }

            newContainer.setModifiedBy(commonUtils.getUserNameFromSession());
            newContainer.setModifiedTimestamp(new Date());
            containerService.updateContainer(newContainer);
        } catch (ContainerAlreadyExistsException e) {
            addFieldError("container.containerId", getText("err.containerId.already.exist"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String loadSuccessEditContainer() {
        List<Container> containerEntityList = containerService.findAllContainer();
        for (Container containerElem : containerEntityList) {
            containers.add(transformContainerToFormBean(containerElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Container has been edited.");

        return SUCCESS;
    }

    public String checkoutContainer() throws Exception {

        Container containerEntity  = transformContainerToEntityBean(container);
        containerEntity.setContainerStatus("GATE OUT");
        containerService.updateContainer(containerEntity);

        Documents eir1Entity = documentsService.findDocumentAndId("EQUIPMENT INTERCHANGE RECEIPT 1",containerEntity.getContainerId());

        eir1Entity.setDocumentName(DocumentsConstants.EQUIPMENT_INTERCHANGE_RECEIPT_2);

        documentsService.updateDocument(eir1Entity);

        return SUCCESS;
    }

    public String loadSuccessGateOutContainer() {
        List<Container> containerEntityList = containerService.findAllContainer();
        for (Container containerElem : containerEntityList) {
            containers.add(transformContainerToFormBean(containerElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Container has been Gate Out.");

        return SUCCESS;
    }

    public void validateOnSubmit(ContainerBean container) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(container.getContainerNumber())) {
            addFieldError("container.containerNumber", "Container Number is required");
        }

    }

    public String loadEditFormPage() {
        Container containerEntity = containerService.findContainerById(containerIdParam);
        filterVesselSchedule();
        container = transformContainerToFormBean(containerEntity);
        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("containerId", container.getContainerId());
        return SUCCESS;
    }

    public void filterVesselSchedule(){

        List <VesselSchedules> vesselSchedules = vesselSchedulesService.findAllVesselSchedules();

        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date dateWithoutTime = cal.getTime();

        for(VesselSchedules vesselScheduleElem : vesselSchedules){
            String dateString = vesselScheduleElem.getDepartureDate();
            SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
            try {

                Date departureDate = formatter.parse(dateString);

                if(dateWithoutTime.before(departureDate) || dateWithoutTime.equals(departureDate)){
                    vesselScheduleList.add(transformToVesselSchedule(vesselScheduleElem));
                }

            }catch(ParseException e){
                e.printStackTrace();
            }
        }

    }

    public String loadCheckoutFormPage() {
        Container containerEntity = containerService.findContainerById(containerIdParam);
        container = transformContainerToFormBean(containerEntity);
        addActionMessage("Success! Container has been Gate Out.");
        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("containerId", container.getContainerId());
        return SUCCESS;
    }

//    -----------------CONSOLIDATION MODULE-------------------------

//    -----------------DOCUMENTS PAGE-------------------------

    public String orderDocumentsInput() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        if(orderIdParam == null){
            orderIdParam = (Integer)sessionAttributes.get("orderIdParam");
        }

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);

        // Reference number will be added to this document ID
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        document = transformDocumentsToFormBean(documentEntity);

        return SUCCESS;
    }

    public String addReferenceNumber() {

        Documents documentsEntity = transformToDocumentEntityBean(document);

        documentsService.updateDocument(documentsEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", documentsEntity.getReferenceId());

        /*return SUCCESS;*/
        if(documentsEntity.getDocumentName().equals("PROFORMA BILL OF LADING") || documentsEntity.getDocumentName().equals("AUTHORIZATION TO WITHDRAW") || documentsEntity.getDocumentName().equals("ACCEPTANCE RECEIPT") || documentsEntity.getDocumentName().equals("RELEASE ORDER") ){
            return "FREIGHT";
        }else{
            return "DISPATCH";
        }
    }

    public String viewDocumentList() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        // Order ID param pass value
        if (orderIdParam == null) {
            orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        }

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);

        List<Documents> documentsList = new ArrayList<Documents>();

        documentsList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsList) {
            if(documentElem.getDocumentName().equals("PROFORMA BILL OF LADING") || documentElem.getDocumentName().equals("AUTHORIZATION TO WITHDRAW") || documentElem.getDocumentName().equals("ACCEPTANCE RECEIPT") || documentElem.getDocumentName().equals("RELEASE ORDER") ){
                documents.add(transformDocumentsToFormBean(documentElem));
            }
        }

        return SUCCESS;
    }

    public String viewDocumentListInland() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        // Order ID param pass value
        if (orderIdParam == null) {
            orderIdParam = (Integer) sessionAttributes.get("orderIdParam");
        }

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);

        List<Documents> documentsList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsList) {
            if(documentElem.getDocumentName().equals("HOUSE WAYBILL ORIGIN") || documentElem.getDocumentName().equals("HOUSE WAYBILL DESTINATION") ){
                documents.add(transformDocumentsToFormBean(documentElem));
            }
        }

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

        entity.setReferenceNumber(formBean.getReferenceNumber());
        entity.setCreatedDate(new Date());
        entity.setDocumentName(formBean.getDocumentName());
        entity.setOutboundStage(formBean.getOutboundStage());
        entity.setInboundStage(formBean.getInboundStage());
        entity.setFinalOutboundStage(formBean.getFinalOutboundStage());
        entity.setFinalInboundStage(formBean.getFinalInboundStage());
        entity.setCompleteStage(formBean.getCompleteStage());
        entity.setArchiveStage(formBean.getArchiveStage());
        entity.setReferenceId(formBean.getReferenceId());
        entity.setReferenceTable(formBean.getReferenceTable());
        entity.setOrderNumber(formBean.getOrderNumber());
        entity.setDocumentStatus("DOCUMENT UPDATED");
        entity.setDocumentProcessed(formBean.getDocumentProcessed());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setInboundReturned(formBean.getInboundReturned());
        entity.setDocumentComments(formBean.getDocumentComments());
        entity.setAging(formBean.getAging());
        entity.setVendorCode(documentsService.findDocumentById(subEntity.getDocumentId()).getVendorCode());

        return entity;
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
        formBean.setFinalOutboundStage(entity.getFinalOutboundStage());
        formBean.setFinalInboundStage(entity.getFinalInboundStage());
        formBean.setArchiveStage(entity.getArchiveStage());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setInboundReturned(entity.getInboundReturned());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setDocumentComments(entity.getDocumentComments());
        formBean.setInboundReturned(entity.getInboundReturned());
        formBean.setDocumentComments(entity.getDocumentComments());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setAging(entity.getAging());
        formBean.setCreatedDate(entity.getCreatedDate());

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

        formBean.setStrCreatedDate(formatter.format(entity.getCreatedDate()));

        if(!entity.getVendorCode().equals("null")){
            Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorCode());

            formBean.setVendorCode(vendorEntity.getVendorCode());
            formBean.setVendorName(vendorEntity.getVendorName());
        }else{
            formBean.setVendorCode("NONE");
            formBean.setVendorName("NONE");
        }

        return formBean;
    }

    public String createdDocumentsSea(){
        // will delete all existing document and resets all freight documents begin
        List<Documents> freightDocuments = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents freightDocumentElem : freightDocuments){
            if(freightDocumentElem.getDocumentName().equals("PROFORMA BILL OF LADING")){
                Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                documentsService.deleteDocument(documentEntity);
            }
        }
        // will delete all existing document and resets all freight documents end

        List<String> vendorCodeDocument = new ArrayList<String>();
        /*List<String> vendorDestination = new ArrayList<String>();*/

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        // Shipping vendors set will be stored in VendorCodeDocument variable
        for (OrderItems everyItem : orderItemsList) {
            if (vendorCodeDocument.isEmpty()) {
                vendorCodeDocument.add(everyItem.getVendorSea());
            } else {
                if (!vendorCodeDocument.contains(everyItem.getVendorSea())) {
                    vendorCodeDocument.add(everyItem.getVendorSea());
                }
            }
        }

        // Destination vendors set will be stored in VendorDestination Variable
//        for (OrderItems everyItem : orderItemsList) {
//            if (vendorDestination.isEmpty()) {
//                vendorDestination.add(everyItem.getVendorDestination());
//            } else {
//                if (!vendorDestination.contains(everyItem.getVendorDestination())) {
//                    vendorDestination.add(everyItem.getVendorDestination());
//                }
//            }
            /*if(everyItem.getVendorDestination() != null){
                vendorDestination.add(everyItem.getVendorDestination()+"-"+everyItem.getOrderItemId());
            }
            if (vendorDestination.isEmpty()) {

            } else {
                if (!vendorDestination.contains(everyItem.getVendorDestination())) {
                    vendorDestination.add(everyItem.getVendorDestination()+"-"+everyItem.getOrderItemId());
                }
            }*/
//        }

        List<Documents> proforma = documentsService.findDocumentNameAndId("PROFORMA BILL OF LADING", orderIdParam);
        /*List<Documents> withdrawAuthorization = documentsService.findDocumentNameAndId("AUTHORIZATION TO WITHDRAW", orderIdParam);
        List<Documents> acceptanceReceipt = documentsService.findDocumentNameAndId("ACCEPTANCE RECEIPT", orderIdParam);
        List<Documents> releaseOrder = documentsService.findDocumentNameAndId("RELEASE ORDER", orderIdParam);*/

        for (String itemVendor : vendorCodeDocument) {
            if(itemVendor != null && !itemVendor.equals("")){ // proforma document will be created if shipping vendor is not null

                if (proforma.size() == 0) {
                    Documents documentEntityProforma = new Documents();

                    Client client = clientService.findClientById(getClientId().toString());
                    documentEntityProforma.setClient(client);

                    documentEntityProforma.setDocumentName(DocumentsConstants.PROFORMA_BILL_OF_LADING);
                    documentEntityProforma.setReferenceId(orderEntity.getOrderId());
                    documentEntityProforma.setReferenceTable("ORDERS");
                    documentEntityProforma.setOrderNumber(orderEntity.getOrderNumber());
                    documentEntityProforma.setCreatedDate(new Date());
                    documentEntityProforma.setDocumentStatus("FROM PLANNING");
                    documentEntityProforma.setVendorCode(itemVendor);

                    if(orderEntity.getServiceType().equals("SHIPPING")){
                        documentEntityProforma.setFinalOutboundStage(1);
                        documentEntityProforma.setDocumentProcessed(2);
                    }else{
                        documentEntityProforma.setOutboundStage(1);
                        documentEntityProforma.setDocumentProcessed(0);
                    }

                    documentEntityProforma.setCreatedBy(commonUtils.getUserNameFromSession());
                    // orderitem id should be set in orderitemid column WIP
                    String documentCode = documentsService.findNextControlNo(getClientId(), "PBL"); // BRF for Booking Request Form Document Code
                    documentEntityProforma.setControlNumber(documentCode);

                    documentEntityProforma.setReferenceNumber(documentCode.replace("PBL-",""));

                    documentsService.addDocuments(documentEntityProforma);

                } else { // will prompt a message when attempting to create proforma if one was already created
                    clearErrorsAndMessages();
                    addActionError("Proforma Bill of Lading(s) already exists.");

                    for(OrderItems orderItemsElem : orderItemsList) {
                        orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                    }
                }

            }else{ // if no shipping vendor set will return an error message
                clearErrorsAndMessages();
                addActionError("Container(s) / Item(s) has no Shipping vendor set!");

                for(OrderItems orderItemsElem : orderItemsList) {
                    orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                }

                return INPUT;
            }
        }

        clearErrorsAndMessages();
        addActionMessage("SUCCESS! Document(s) has been created");

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String createdInlandDocument(){
        // will delete all existing document and resets all inland documents begin
        List<Documents> freightDocuments = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents freightDocumentElem : freightDocuments){
            if(freightDocumentElem.getDocumentName().equals("HOUSE WAYBILL ORIGIN") || freightDocumentElem.getDocumentName().equals("HOUSE WAYBILL DESTINATION")){
                Documents documentEntity = documentsService.findDocumentById(freightDocumentElem.getDocumentId());
                documentsService.deleteDocument(documentEntity);
            }
        }

        List<String> vendorOrigin = new ArrayList<String>();
        List<String> vendorDestination = new ArrayList<String>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        // Origin vendors set will be stored in VendorOrigin Variable
        for (OrderItems everyItem : orderItemsList) {
            if (vendorOrigin.isEmpty()) {
                vendorOrigin.add(everyItem.getVendorOrigin());
            } else {
                if (!vendorOrigin.contains(everyItem.getVendorOrigin())) {
                    vendorOrigin.add(everyItem.getVendorOrigin());
                }
            }
        }

        // Destination vendors set will be stored in VendorDestination Variable
        for (OrderItems everyItem : orderItemsList) {
            if (vendorDestination.isEmpty()) {
                vendorDestination.add(everyItem.getVendorDestination());
            } else {
                if (!vendorDestination.contains(everyItem.getVendorDestination())) {
                    vendorDestination.add(everyItem.getVendorDestination());
                }
            }
        }

        System.out.println("VENDOR ORIGIN                              " + vendorOrigin);
        System.out.println("VENDOR DESTINATION                        " + vendorDestination);

        if(orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("TRUCKING") ){

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER") || orderEntity.getServiceMode().equals("PICKUP") || orderEntity.getServiceMode().equals("INTER-WAREHOUSE")){

                List<Documents> waybillOrigin = documentsService.findDocumentNameAndId("HOUSE WAYBILL ORIGIN", orderIdParam);

                for (String itemVendor : vendorOrigin) {
                    if(itemVendor != null) { // house waybill origin document will be created if origin vendor is not null
                        if (waybillOrigin.size() == 0) {
                            Documents documentEntity = new Documents();

                            Client client = clientService.findClientById(getClientId().toString());
                            documentEntity.setClient(client);

                            documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_ORIGIN);
                            documentEntity.setReferenceId(orderEntity.getOrderId());
                            documentEntity.setReferenceTable("ORDERS");
                            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                            documentEntity.setCreatedDate(new Date());
                            documentEntity.setDocumentStatus("FROM PLANNING");
                            documentEntity.setVendorCode(itemVendor);
                            documentEntity.setOutboundStage(1);
                            documentEntity.setDocumentProcessed(0);
                            documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                            // orderitem id should be set in orderitemid column WIP
                            String documentCode = documentsService.findNextControlNo(getClientId(), "HWO"); // BRF for Booking Request Form Document Code
                            documentEntity.setControlNumber(documentCode);

                            /*documentEntity.setReferenceNumber(documentCode.replace("HWO-",""));*/

                            documentsService.addDocuments(documentEntity);
                        } else { // will prompt a message when attempting to create house waybill origin if one was already created
                            clearErrorsAndMessages();
                            addActionError("House Waybill Origin(s) already exists.");
                        }
                    }else{ // if no origin vendor set will return an error message

                        clearErrorsAndMessages();
                        addActionError("Container(s) / Item(s) has no Trucking origin vendor set!");

                        for(OrderItems orderItemsElem : orderItemsList) {
                            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                        }

                        return INPUT;
                    }

                }

            }

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("PIER TO DOOR") || orderEntity.getServiceMode().equals("DELIVERY") ){

                List<Documents> waybillDestination = documentsService.findDocumentNameAndId("HOUSE WAYBILL DESTINATION", orderIdParam);

                for (String itemVendor : vendorDestination) {
                    if(itemVendor != null) { // house waybill destination document will be created if destination vendor is not null
                        if (waybillDestination.size() == 0) {
                            Documents documentEntity = new Documents();

                            Client client = clientService.findClientById(getClientId().toString());
                            documentEntity.setClient(client);

                            documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_DESTINATION);
                            documentEntity.setReferenceId(orderEntity.getOrderId());
                            documentEntity.setReferenceTable("ORDERS");
                            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                            documentEntity.setCreatedDate(new Date());
                            documentEntity.setDocumentStatus("FROM PLANNING");
                            documentEntity.setVendorCode(itemVendor);
                            if(orderEntity.getServiceMode().equals("DELIVERY")){
                                documentEntity.setOutboundStage(1);
                                documentEntity.setDocumentProcessed(0);
                            }else{
                                documentEntity.setFinalOutboundStage(1);
                                documentEntity.setDocumentProcessed(2);
                            }
                            documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                            // orderitem id should be set in orderitemid column WIP
                            String documentCode = documentsService.findNextControlNo(getClientId(), "HWD"); // BRF for Booking Request Form Document Code
                            documentEntity.setControlNumber(documentCode);

                            /*documentEntity.setReferenceNumber(documentCode.replace("HWD-",""));*/

                            documentsService.addDocuments(documentEntity);
                        } else {
                            clearErrorsAndMessages();
                            addActionError("House Waybill Destination(s) already exists.");
                        }
                    }else{ // if no destination vendor set will return an error message
                        clearErrorsAndMessages();
                        addActionError("Container(s) / Item(s) has no Trucking destination vendor set!");

                        for(OrderItems orderItemsElem : orderItemsList) {
                            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                        }

                        return INPUT;
                    }
                }
            }
        }

        clearErrorsAndMessages();
        addActionMessage("SUCCESS! Document(s) has been created");

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String createdDocumentOrigin() {
        List<String> vendorCodeDocument = new ArrayList<String>();
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);
        // Origin vendors set will be stored in VendorCodeDocument Variable
        for (OrderItems everyItem : orderItemsList) {
            if (vendorCodeDocument.isEmpty()) {
                vendorCodeDocument.add(everyItem.getVendorOrigin());
            } else {
                if (!vendorCodeDocument.contains(everyItem.getVendorOrigin())) {
                    vendorCodeDocument.add(everyItem.getVendorOrigin());
                }
            }
        }

        List<Documents> waybillOrigin = documentsService.findDocumentNameAndId("HOUSE WAYBILL ORIGIN", orderIdParam);

        for (String itemVendor : vendorCodeDocument) {
            if(itemVendor != null) { // house waybill origin document will be created if origin vendor is not null
                if (waybillOrigin.size() == 0) {
                    Documents documentEntity = new Documents();

                    Client client = clientService.findClientById(getClientId().toString());
                    documentEntity.setClient(client);

                    documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_ORIGIN);
                    documentEntity.setReferenceId(orderEntity.getOrderId());
                    documentEntity.setReferenceTable("ORDERS");
                    documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                    documentEntity.setCreatedDate(new Date());
                    documentEntity.setDocumentStatus("FROM PLANNING");
                    documentEntity.setVendorCode(itemVendor);
                    documentEntity.setOutboundStage(1);
                    documentEntity.setDocumentProcessed(0);
                    documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                    // orderitem id should be set in orderitemid column WIP

                    documentsService.addDocuments(documentEntity);
                } else { // will prompt a message when attempting to create house waybill origin if one was already created
                    clearErrorsAndMessages();
                    addActionError("I have found out that there is a document with the same name. Please delete them first before creating a new one");

                    for (OrderItems orderItemsElem : orderItemsList) {
                        orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                    }
                    return INPUT;
                }
            }else{ // if no origin vendor set will return an error message
                clearErrorsAndMessages();
                addActionError("Container(s) / Item(s) has no Shipping vendor set!");

                for(OrderItems orderItemsElem : orderItemsList) {
                    orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                }

                return INPUT;
            }

        }

        clearErrorsAndMessages();
        addActionMessage("SUCCESS! Document(s) has been created");

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String createdDocumentDestination() {
        List<String> vendorCodeDocument = new ArrayList<String>();
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);
        // Destination vendors set will be stored in VendorCodeDocument Variable
        for (OrderItems everyItem : orderItemsList) {
            if (vendorCodeDocument.isEmpty()) {
                vendorCodeDocument.add(everyItem.getVendorDestination());
            } else {
                if (!vendorCodeDocument.contains(everyItem.getVendorDestination())) {
                    vendorCodeDocument.add(everyItem.getVendorDestination());
                }
            }
        }

        List<Documents> waybillDestination = documentsService.findDocumentNameAndId("HOUSE WAYBILL DESTINATION", orderIdParam);

        for (String itemVendor : vendorCodeDocument) {
            if(itemVendor != null) { // house waybill destination document will be created if destination vendor is not null
                if (waybillDestination.size() == 0) {
                    Documents documentEntity = new Documents();

                    Client client = clientService.findClientById(getClientId().toString());
                    documentEntity.setClient(client);

                    documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_DESTINATION);
                    documentEntity.setReferenceId(orderEntity.getOrderId());
                    documentEntity.setReferenceTable("ORDERS");
                    documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                    documentEntity.setCreatedDate(new Date());
                    documentEntity.setDocumentStatus("FROM PLANNING");
                    documentEntity.setVendorCode(itemVendor);
                    documentEntity.setFinalOutboundStage(1);
                    documentEntity.setDocumentProcessed(2);
                    documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                    // orderitem id should be set in orderitemid column WIP

                    documentsService.addDocuments(documentEntity);
                } else {
                    clearErrorsAndMessages();
                    addActionError("I have found out that there is a document with the same name. Please delete them first before creating a new one");
                    /*addActionMessage("I have found out that there is a document with the same name. Please delete them first before creating a new one");*/
                    for (OrderItems orderItemsElem : orderItemsList) {
                        orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                    }
                    return INPUT;
                }
            }else{ // if no destination vendor set will return an error message
                clearErrorsAndMessages();
                addActionError("Container(s) / Item(s) has no Shipping vendor set!");

                for(OrderItems orderItemsElem : orderItemsList) {
                    orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                }

                return INPUT;
            }

        }

        clearErrorsAndMessages();
        addActionMessage("SUCCESS! Document(s) has been created");

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String deleteDocument() {
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        documentsService.deleteDocument(documentEntity);

        List<Documents> documentsList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsList) {
            if(documentElem.getDocumentName().equals("PROFORMA BILL OF LADING") || documentElem.getDocumentName().equals("AUTHORIZATION TO WITHDRAW") || documentElem.getDocumentName().equals("ACCEPTANCE RECEIPT") || documentElem.getDocumentName().equals("RELEASE ORDER")  ){
                documents.add(transformDocumentsToFormBean(documentElem));
            }
        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
    }

    public String deleteDocumentInland() {
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        documentsService.deleteDocument(documentEntity);

        List<Documents> documentsList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsList) {
            if(documentElem.getDocumentName().equals("HOUSE WAYBILL ORIGIN") || documentElem.getDocumentName().equals("HOUSE WAYBILL DESTINATION")){
                documents.add(transformDocumentsToFormBean(documentElem));
            }
        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        return SUCCESS;
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

    public String containerAdd() throws Exception {

        validateOnSubmit(container);
        if (hasFieldErrors())
            return INPUT;

        try {
            Container containerEntity = transformContainerToEntityBean(container);
            containerEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            containerEntity.setCreatedTimestamp(new Date());
            containerEntity.setModifiedTimestamp(new Date());
            containerEntity.setContainerStatus("OPEN");
            containerService.addContainer(containerEntity);

            /*Notification notificationEntity = new Notification();
            notificationEntity.setDescription("CONTAINER");
            notificationEntity.setNotificationId(17);
            notificationEntity.setNotificationType("Email");
            notificationEntity.setReferenceId(1);
            notificationEntity.setReferenceTable("Container");
            notificationEntity.setUserId(1);
            notificationService.addNotification(notificationEntity);*/

            // Add EIR 1 DOCUMENT BEGIN
            Documents documentEntity = new Documents();

            Client client = clientService.findClientById(getClientId().toString());
            documentEntity.setClient(client);

            if(containerEntity.getEirType().equals("EIR FORM 1")){
                documentEntity.setDocumentName(DocumentsConstants.EQUIPMENT_INTERCHANGE_RECEIPT_1);
            }else{
                documentEntity.setDocumentName(DocumentsConstants.EQUIPMENT_INTERCHANGE_RECEIPT_2);
            }
            documentEntity.setReferenceId(containerEntity.getContainerId());
            documentEntity.setReferenceTable("CONTAINERS");
            documentEntity.setCreatedDate(new Date());
            documentEntity.setDocumentStatus("FOR PRINTING");
            documentEntity.setVendorCode(containerEntity.getShipping());
            documentEntity.setDocumentProcessed(0);

            documentsService.addDocuments(documentEntity);
            // Add EIR 1 DOCUMENT END

        }catch(ContainerAlreadyExistsException e) {
            addFieldError("container.containerId", getText("err.container.already.exist"));
            return INPUT;
        }
        clearErrorsAndMessages();
        addActionMessage("Success! New Form has been added.");
        return SUCCESS;
    }

    public String loadSuccessAddContainer() {
        List<Container> containerEntityList = containerService.findAllContainer();
        for (Container containerElem : containerEntityList) {
            containers.add(transformContainerToFormBean(containerElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Container has been added.");

        return SUCCESS;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }

    public Integer getOrderItemIdParam() {
        return orderItemIdParam;
    }

    public void setOrderItemIdParam(Integer orderItemIdParam) {
        this.orderItemIdParam = orderItemIdParam;
    }

    public OperationsService getOperationsService() {
        return operationsService;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public List<OrderItemsBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItemsBean> orderItems) {
        this.orderItems = orderItems;
    }

    public OrderItemsBean getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItemsBean orderItem) {
        this.orderItem = orderItem;
    }

    public List<Vendor> getVendorShippingList() {
        return vendorShippingList;
    }

    public void setVendorShippingList(List<Vendor> vendorShippingList) {
        this.vendorShippingList = vendorShippingList;
    }

    public List<Vendor> getVendorShippingListClass() {
        return vendorShippingListClass;
    }

    public void setVendorShippingListClass(List<Vendor> vendorShippingListClass) {
        this.vendorShippingListClass = vendorShippingListClass;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public Integer getNameSizeParam() {
        return nameSizeParam;
    }

    public void setNameSizeParam(Integer nameSizeParam) {
        this.nameSizeParam = nameSizeParam;
    }

    public List<VesselScheduleBean> getVesselSchedules() {
        return vesselSchedules;
    }

    public void setVesselSchedules(List<VesselScheduleBean> vesselSchedules) {
        this.vesselSchedules = vesselSchedules;
    }

    public OperationsBean getOperationsBean() {
        return operationsBean;
    }

    public void setOperationsBean(OperationsBean operationsBean) {
        this.operationsBean = operationsBean;
    }

    public List<Vendor> getVendorTruckingList() {
        return vendorTruckingList;
    }

    public void setVendorTruckingList(List<Vendor> vendorTruckingList) {
        this.vendorTruckingList = vendorTruckingList;
    }

    public Map getParamMap() {
        return paramMap;
    }

    public void setParamMap(Map paramMap) {
        this.paramMap = paramMap;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public Map<String, String> getDriverMap() {
        return driverMap;
    }

    public void setDriverMap(Map<String, String> driverMap) {
        this.driverMap = driverMap;
    }

    public Map<String, String> getTrucksMap() {
        return trucksMap;
    }

    public void setTrucksMap(Map<String, String> trucksMap) {
        this.trucksMap = trucksMap;
    }

    public TruckBean getTruckDestination() {
        return truckDestination;
    }

    public void setTruckDestination(TruckBean truckDestination) {
        this.truckDestination = truckDestination;
    }

    public List<Driver> getListDrivers() {
        return listDrivers;
    }

    public void setListDrivers(List<Driver> listDrivers) {
        this.listDrivers = listDrivers;
    }

    public String getOrderNoParam() {
        return orderNoParam;
    }

    public void setOrderNoParam(String orderNoParam) {
        this.orderNoParam = orderNoParam;
    }

    public Integer getVesselScheduleIdParam() {
        return vesselScheduleIdParam;
    }

    public void setVesselScheduleIdParam(Integer vesselScheduleIdParam) {
        this.vesselScheduleIdParam = vesselScheduleIdParam;
    }

    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    public VesselSchedulesService getVesselSchedulesService() {
        return vesselSchedulesService;
    }

    public void setVesselSchedulesService(VesselSchedulesService vesselSchedulesService) {
        this.vesselSchedulesService = vesselSchedulesService;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public CustomerService getCustomerService() {
        return customerService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
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

    public List<Parameters> getStatusList() {
        return statusList;
    }

    public void setStatusList(List<Parameters> statusList) {
        this.statusList = statusList;
    }

    public List<Parameters> getVendorClassList() {
        return vendorClassList;
    }

    public void setVendorClassList(List<Parameters> vendorClassList) {
        this.vendorClassList = vendorClassList;
    }

    public List<Parameters> getVendorTypeList() {
        return vendorTypeList;
    }

    public void setVendorTypeList(List<Parameters> vendorTypeList) {
        this.vendorTypeList = vendorTypeList;
    }

    public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public VendorBean getVendor() {
        return vendor;
    }

    public void setVendor(VendorBean vendor) {
        this.vendor = vendor;
    }

    public List<VendorBean> getVendors() {
        return vendors;
    }

    public void setVendors(List<VendorBean> vendors) {
        this.vendors = vendors;
    }

    public ClientService getClientService() {
        return clientService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public CommonUtils getCommonUtils() {
        return commonUtils;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }

    public List<Parameters> getPortsList() {
        return portsList;
    }

    public void setPortsList(List<Parameters> portsList) {
        this.portsList = portsList;
    }

    public VesselScheduleBean getVesselSchedule() {
        return vesselSchedule;
    }

    public void setVesselSchedule(VesselScheduleBean vesselSchedule) {
        this.vesselSchedule = vesselSchedule;
    }

    public Integer getVendorIdParam() {
        return vendorIdParam;
    }

    public void setVendorIdParam(Integer vendorIdParam) {
        this.vendorIdParam = vendorIdParam;
    }

    public List<Parameters> getUpdateStatusList() {
        return updateStatusList;
    }

    public void setUpdateStatusList(List<Parameters> updateStatusList) {
        this.updateStatusList = updateStatusList;
    }

    public void setDocumentsService(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }

    public String[] getCheck() {
        return check;
    }

    public void setCheck(String[] check) {
        this.check = check;
    }

    public String getEditParam() {
        return editParam;
    }

    public void setEditParam(String editParam) {
        this.editParam = editParam;
    }

    public List<Parameters> getTruckTypeList() {
        return truckTypeList;
    }

    public void setTruckTypeList(List<Parameters> truckTypeList) {
        this.truckTypeList = truckTypeList;
    }

    public DriverBean getDriver() {
        return driver;
    }

    public void setDriver(DriverBean driver) {
        this.driver = driver;
    }

    public TruckBean getTruck() {
        return truck;
    }

    public void setTruck(TruckBean truck) {
        this.truck = truck;
    }

    public void setContainerService(ContainerService containerService) {
        this.containerService = containerService;
    }

    public List<ContainerBean> getContainers() {
        return containers;
    }

    public void setContainers(List<ContainerBean> containers) {
        this.containers = containers;
    }

    public List<DocumentsBean> getDocuments() {
        return documents;
    }

    public void setDocuments(List<DocumentsBean> documents) {
        this.documents = documents;
    }

    public Integer getDocumentIdParam() {
        return documentIdParam;
    }

    public void setDocumentIdParam(Integer documentIdParam) {
        this.documentIdParam = documentIdParam;
    }

    public Integer getContainerIdParam() {
        return containerIdParam;
    }

    public void setContainerIdParam(Integer containerIdParam) {
        this.containerIdParam = containerIdParam;
    }

    public ContainerBean getContainer() {
        return container;
    }

    public void setContainer(ContainerBean container) {
        this.container = container;
    }

    public List<Parameters> getContainerSearchList() {
        return containerSearchList;
    }

    public void setContainerSearchList(List<Parameters> containerSearchList) {
        this.containerSearchList = containerSearchList;
    }

    public List<Parameters> getContainerSizeList() {
        return containerSizeList;
    }

    public void setContainerSizeList(List<Parameters> containerSizeList) {
        this.containerSizeList = containerSizeList;
    }

    public List<Parameters> getContainerEirTypeList() {
        return containerEirTypeList;
    }

    public void setContainerEirTypeList(List<Parameters> containerEirTypeList) {
        this.containerEirTypeList = containerEirTypeList;
    }

    public List<Parameters> getContainerStatusList() {
        return containerStatusList;
    }

    public void setContainerStatusList(List<Parameters> containerStatusList) {
        this.containerStatusList = containerStatusList;
    }

    public List<OrderBean> getFclTable() {
        return fclTable;
    }

    public void setFclTable(List<OrderBean> fclTable) {
        this.fclTable = fclTable;
    }

    public List<OrderBean> getLclTable() {
        return lclTable;
    }

    public void setLclTable(List<OrderBean> lclTable) {
        this.lclTable = lclTable;
    }

    public List<OrderBean> getLcuTable() {
        return lcuTable;
    }

    public void setLcuTable(List<OrderBean> lcuTable) {
        this.lcuTable = lcuTable;
    }

    public List<OrderBean> getRcuTable() {
        return rcuTable;
    }

    public void setRcuTable(List<OrderBean> rcuTable) {
        this.rcuTable = rcuTable;
    }

    public String getOriginCity() {
        return originCity;
    }

    public void setOriginCity(String originCity) {
        this.originCity = originCity;
    }

    public String getDestinationCity() {
        return destinationCity;
    }

    public void setDestinationCity(String destinationCity) {
        this.destinationCity = destinationCity;
    }

    public List<OrderBean> getFtlTable() {
        return ftlTable;
    }

    public void setFtlTable(List<OrderBean> ftlTable) {
        this.ftlTable = ftlTable;
    }

    public List<OrderBean> getLtlTable() {
        return ltlTable;
    }

    public void setLtlTable(List<OrderBean> ltlTable) {
        this.ltlTable = ltlTable;
    }

    public String getTruckCodeParam() {
        return truckCodeParam;
    }

    public void setTruckCodeParam(String truckCodeParam) {
        this.truckCodeParam = truckCodeParam;
    }

    public Map<String, String> getBodyTypeMap() {
        return bodyTypeMap;
    }

    public void setBodyTypeMap(Map<String, String> bodyTypeMap) {
        this.bodyTypeMap = bodyTypeMap;
    }

    public Map<String, String> getPlateNumberMap() {
        return plateNumberMap;
    }

    public void setPlateNumberMap(Map<String, String> plateNumberMap) {
        this.plateNumberMap = plateNumberMap;
    }

    public Map<Integer, Integer> getGrossWeightMap() {
        return grossWeightMap;
    }

    public void setGrossWeightMap(Map<Integer, Integer> grossWeightMap) {
        this.grossWeightMap = grossWeightMap;
    }

    public List<OrderBean> getFclTruckTable() {
        return fclTruckTable;
    }

    public void setFclTruckTable(List<OrderBean> fclTruckTable) {
        this.fclTruckTable = fclTruckTable;
    }

    public List<OrderBean> getLclTruckTable() {
        return lclTruckTable;
    }

    public void setLclTruckTable(List<OrderBean> lclTruckTable) {
        this.lclTruckTable = lclTruckTable;
    }

    public List<OrderBean> getLcuTruckTable() {
        return lcuTruckTable;
    }

    public void setLcuTruckTable(List<OrderBean> lcuTruckTable) {
        this.lcuTruckTable = lcuTruckTable;
    }

    public List<OrderBean> getRcuTruckTable() {
        return rcuTruckTable;
    }

    public void setRcuTruckTable(List<OrderBean> rcuTruckTable) {
        this.rcuTruckTable = rcuTruckTable;
    }

    public List<OrderBean> getFclTruckTableDes() {
        return fclTruckTableDes;
    }

    public void setFclTruckTableDes(List<OrderBean> fclTruckTableDes) {
        this.fclTruckTableDes = fclTruckTableDes;
    }

    public List<OrderBean> getLclTruckTableDes() {
        return lclTruckTableDes;
    }

    public void setLclTruckTableDes(List<OrderBean> lclTruckTableDes) {
        this.lclTruckTableDes = lclTruckTableDes;
    }

    public List<OrderBean> getLcuTruckTableDes() {
        return lcuTruckTableDes;
    }

    public void setLcuTruckTableDes(List<OrderBean> lcuTruckTableDes) {
        this.lcuTruckTableDes = lcuTruckTableDes;
    }

    public List<OrderBean> getRcuTruckTableDes() {
        return rcuTruckTableDes;
    }

    public void setRcuTruckTableDes(List<OrderBean> rcuTruckTableDes) {
        this.rcuTruckTableDes = rcuTruckTableDes;
    }

    public String getDestinationCityTruck() {
        return destinationCityTruck;
    }

    public void setDestinationCityTruck(String destinationCityTruck) {
        this.destinationCityTruck = destinationCityTruck;
    }

    public String getOriginCityTruck() {
        return originCityTruck;
    }

    public void setOriginCityTruck(String originCityTruck) {
        this.originCityTruck = originCityTruck;
    }

    public List<Vessel> getListVessel() {
        return listVessel;
    }

    public void setListVessel(List<Vessel> listVessel) {
        this.listVessel = listVessel;
    }

    public Map<String, String> getVesselMap() {
        return vesselMap;
    }

    public void setVesselMap(Map<String, String> vesselMap) {
        this.vesselMap = vesselMap;
    }

    public List<String> getNameSizeList() {
        return nameSizeList;
    }

    public void setNameSizeList(List<String> nameSizeList) {
        this.nameSizeList = nameSizeList;
    }

    public DocumentsBean getDocument() {
        return document;
    }

    public void setDocument(DocumentsBean document) {
        this.document = document;
    }

    public CustomerBean getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerBean customer) {
        this.customer = customer;
    }

    public String getScheduleExists() {
        return scheduleExists;
    }

    public void setScheduleExists(String scheduleExists) {
        this.scheduleExists = scheduleExists;
    }

    public List<OrderItemsBean> getCurrentVesselSchedule() {
        return currentVesselSchedule;
    }

    public void setCurrentVesselSchedule(List<OrderItemsBean> currentVesselSchedule) {
        this.currentVesselSchedule = currentVesselSchedule;
    }

    public List<OrderItemsBean> getOrderItemVesselSchedule() {
        return orderItemVesselSchedule;
    }

    public void setOrderItemVesselSchedule(List<OrderItemsBean> orderItemVesselSchedule) {
        this.orderItemVesselSchedule = orderItemVesselSchedule;
    }

    public List<OrderItemsBean> getOrderItemOriginVendor() {
        return orderItemOriginVendor;
    }

    public void setOrderItemOriginVendor(List<OrderItemsBean> orderItemOriginVendor) {
        this.orderItemOriginVendor = orderItemOriginVendor;
    }

    public List<OrderItemsBean> getOrderItemDestinationVendor() {
        return orderItemDestinationVendor;
    }

    public void setOrderItemDestinationVendor(List<OrderItemsBean> orderItemDestinationVendor) {
        this.orderItemDestinationVendor = orderItemDestinationVendor;
    }

    public List<Vendor> getVendorTruckingOriginList() {
        return vendorTruckingOriginList;
    }

    public void setVendorTruckingOriginList(List<Vendor> vendorTruckingOriginList) {
        this.vendorTruckingOriginList = vendorTruckingOriginList;
    }

    public List<Vendor> getVendorTruckingDestinationList() {
        return vendorTruckingDestinationList;
    }

    public void setVendorTruckingDestinationList(List<Vendor> vendorTruckingDestinationList) {
        this.vendorTruckingDestinationList = vendorTruckingDestinationList;
    }

    public Date getFilterDelivery() {
        return filterDelivery;
    }

    public void setFilterDelivery(Date filterDelivery) {
        this.filterDelivery = filterDelivery;
    }

    public Date getFilterPickup() {
        return filterPickup;
    }

    public void setFilterPickup(Date filterPickup) {
        this.filterPickup = filterPickup;
    }

    public String getCheckLCL() {
        return checkLCL;
    }

    public void setCheckLCL(String checkLCL) {
        this.checkLCL = checkLCL;
    }

    public String[] getCheckInland() {
        return checkInland;
    }

    public void setCheckInland(String[] checkInland) {
        this.checkInland = checkInland;
    }

    public String getFinalPickupParam() {
        return finalPickupParam;
    }

    public void setFinalPickupParam(String finalPickupParam) {
        this.finalPickupParam = finalPickupParam;
    }

    public String getDriverCodeParam() {
        return driverCodeParam;
    }

    public void setDriverCodeParam(String driverCodeParam) {
        this.driverCodeParam = driverCodeParam;
    }

    public String getFinalDeliveryParam() {
        return finalDeliveryParam;
    }

    public void setFinalDeliveryParam(String finalDeliveryParam) {
        this.finalDeliveryParam = finalDeliveryParam;
    }

    public String getDestinationConfirmFlag() {
        return destinationConfirmFlag;
    }

    public void setDestinationConfirmFlag(String destinationConfirmFlag) {
        this.destinationConfirmFlag = destinationConfirmFlag;
    }

    public String getOriginConfirmFlag() {
        return originConfirmFlag;
    }

    public void setOriginConfirmFlag(String originConfirmFlag) {
        this.originConfirmFlag = originConfirmFlag;
    }

    public String getContainerNumberPlaceHolder() {
        return containerNumberPlaceHolder;
    }

    public void setContainerNumberPlaceHolder(String containerNumberPlaceHolder) {
        this.containerNumberPlaceHolder = containerNumberPlaceHolder;
    }

    public List<VesselScheduleBean> getVesselScheduleList() {
        return vesselScheduleList;
    }

    public void setVesselScheduleList(List<VesselScheduleBean> vesselScheduleList) {
        this.vesselScheduleList = vesselScheduleList;
    }

    public List<Parameters> getBookingNumSearchList() {
        return bookingNumSearchList;
    }

    public void setBookingNumSearchList(List<Parameters> bookingNumSearchList) {
        this.bookingNumSearchList = bookingNumSearchList;
    }

    public List<Vendor> getVendorList() {
        return vendorList;
    }

    public void setVendorList(List<Vendor> vendorList) {
        this.vendorList = vendorList;
    }

    public List<OrderItemsBean> getOrderItemFreightPlan() {
        return orderItemFreightPlan;
    }

    public void setOrderItemFreightPlan(List<OrderItemsBean> orderItemFreightPlan) {
        this.orderItemFreightPlan = orderItemFreightPlan;
    }
}