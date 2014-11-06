package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
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
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.operations.entity.Container;
import com.sr.biz.freightbit.operations.service.ContainerService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.exceptions.DriverAlreadyExistsException;
import com.sr.biz.freightbit.vendor.exceptions.TrucksAlreadyExistsException;
import com.sr.biz.freightbit.vendor.exceptions.VendorAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import com.sr.biz.freightbit.vesselSchedule.service.VesselSchedulesService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.*;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
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

    private List<Parameters> truckTypeList = new ArrayList<Parameters>();

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private VesselScheduleBean vesselSchedule = new VesselScheduleBean();
    private List<VesselScheduleBean> vesselSchedules = new ArrayList<VesselScheduleBean>();
    private List<ContainerBean> containers = new ArrayList<ContainerBean>();
    private List<DocumentsBean> documents = new ArrayList<DocumentsBean>();

    private List<Vendor> vendorShippingList = new ArrayList<Vendor>();
    private List<Vendor> vendorTruckingList = new ArrayList<Vendor>();
    private List<Parameters> vendorTypeList = new ArrayList<Parameters>();
    private List<Parameters> vendorClassList = new ArrayList<Parameters>();
    private List<Parameters> statusList = new ArrayList<Parameters>();
    private List<Parameters> updateStatusList = new ArrayList<Parameters>();
    private List<Driver> listDrivers = new ArrayList<Driver>();
    private List<VendorBean> vendors = new ArrayList<VendorBean>();
    private List<Parameters> portsList = new ArrayList<Parameters>();

    private OrderItemsBean orderItem = new OrderItemsBean();
    private OperationsBean operationsBean = new OperationsBean();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();
    private VendorBean vendor = new VendorBean();
    private DriverBean driver = new DriverBean();
    private TruckBean truck = new TruckBean();

    private OperationsService operationsService;
    private VendorService vendorService;
    private VesselSchedulesService vesselSchedulesService;
    private OrderService orderService;
    private CustomerService customerService;
    private ParameterService parameterService;
    private ClientService clientService;
    private CommonUtils commonUtils;
    private DocumentsService documentsService;
    private ContainerService containerService;

    private Map<String, String> driverMap = new LinkedHashMap<String, String>();
    private Map<String, String> trucksMap = new HashMap<String, String>();

    private String[] check;

    Map paramMap = new HashMap();



    @Override
    public void prepare() {
        vendorShippingList = vendorService.findVendorsByCriteria("vendorType", "SHIPPING", 1);
        vendorTruckingList = vendorService.findVendorsByCriteria("vendorType", "TRUCKING", 1);
        vendorTypeList = parameterService.getParameterMap(ParameterConstants.VENDOR_TYPE);
        vendorClassList = parameterService.getParameterMap(ParameterConstants.VENDOR_CLASS);
        statusList = parameterService.getParameterMap(ParameterConstants.STATUS);
//        updateStatusList = parameterService.getParameterMap(ParameterConstants.UPDATE_STATUS);
        portsList = parameterService.getParameterMap(ParameterConstants.PORTS);
        truckTypeList = parameterService.getParameterMap(ParameterConstants.TRUCK_TYPE);

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

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderId);

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

        // Proforma Bill of Lading will be created under pending documents begin
//        Orders orderEntity = orderService.findOrdersById(documentIdEntity.getReferenceId());

        Documents documentEntity = new Documents();

        Client client = clientService.findClientById(getClientId().toString());
        documentEntity.setClient(client);

        documentEntity.setDocumentName(DocumentsConstants.PROFORMA_BILL_OF_LADING);
        documentEntity.setReferenceId(orderEntity.getOrderId());
        documentEntity.setReferenceTable("ORDERS");
        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
        documentEntity.setCreatedDate(new Date());
        documentEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
        documentEntity.setOutboundStage(1);
        documentEntity.setDocumentProcessed(0);

        documentsService.addDocuments(documentEntity);

        // Proforma Bill of Lading will be created under pending documents end

        clearErrorsAndMessages();
        addActionMessage("Success! Items has been updated and moved to Inland Freight Planning.");

        return SUCCESS;
    }

    public String addDriver() {
        try {
            Driver driverEntity = transformToEntityBeanDriver(driver);
            driverEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            driverEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            driverEntity.setCreatedTimestamp(new Date());
            vendorService.addDriver(driverEntity);
        }catch (DriverAlreadyExistsException e) {
            addFieldError("driver.licenseNumber", getText("err.driver.already.exists"));
            return INPUT;
        }
        /*vendorService.addDriver(transformToEntityBeanDriver(driver));*/
        return SUCCESS;
    }

    public String addTrucks() {
        try {
            Trucks truckEntity = transformToEntityBeanTrucks(truck);
            truckEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            truckEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            truckEntity.setCreatedTimestamp(new Date());
            vendorService.addTrucks(truckEntity);
        }catch (TrucksAlreadyExistsException e) {
            addFieldError("truck.truckCode", getText("err.truck.already.exists"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String addVendor(){

        try {
            Vendor vendorEntity = transformVendorToEntityBean(vendor);
            vendorEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            vendorEntity.setCreatedTimeStamp(new Date());
            vendorEntity.setModifiedBY(commonUtils.getUserNameFromSession());
            vendorService.addVendor(vendorEntity);
        } catch (VendorAlreadyExistsException e) {
            addFieldError("vendor.vendorCode", getText("err.vendorCode.already.exists"));
            return INPUT;
        }

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
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimeStamp(new Date());
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

        Map sessionAttributes = ActionContext.getContext().getSession();
        entity.setVendorId(driverBean.getVendorId());

//        entity.setDriverCode(driverBean.getDriverCode());
        entity.setLicenseNumber(driverBean.getLicenseNumber());
        entity.setLastName(driverBean.getLastName());
        entity.setFirstName(driverBean.getFirstName());
        entity.setMiddleName(driverBean.getMiddleName());
        entity.setTitle(driverBean.getTitle());
        entity.setStatus(driverBean.getStatus());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(driverBean.getCreatedTimeStamp());

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
        entity.setMotorVehicleNumber(truckBean.getMotorVehicleNumber());
        entity.setIssueDate(truckBean.getIssueDate());
        entity.setNetWeight(truckBean.getNetWeight());
        entity.setNetCapacity(truckBean.getNetCapacity());
        entity.setOwnerName(truckBean.getOwnerName());
        entity.setOwnerAddress(truckBean.getOwnerAddress());
        entity.setOfficialReceipt(truckBean.getOfficialReceipt());

        System.out.println(truckBean.getVendorId());
        System.out.println(truckBean.getTruckType());
        System.out.println(truckBean.getPlateNumber());
        System.out.println(truckBean.getModelNumber());
        System.out.println(truckBean.getModelYear());
        System.out.println(truckBean.getEngineNumber());
        System.out.println(truckBean.getGrossWeight());
        System.out.println(commonUtils.getUserNameFromSession());
        System.out.println(new Date());
        System.out.println(truckBean.getMotorVehicleNumber());
        System.out.println(truckBean.getIssueDate());
        System.out.println(truckBean.getNetWeight());
        System.out.println(truckBean.getNetCapacity());
        System.out.println(truckBean.getOwnerAddress());
        System.out.println(truckBean.getOfficialReceipt());

        return entity;
    }

    //utils
    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public String checkItemStatus() {
        List<Integer> planning1 = new ArrayList();
        List<Integer> planning2 = new ArrayList();
        List<Integer> planning3 = new ArrayList();

        if ("".equals(orderItem.getEditItem())) {

            if (check == null) {
                return INPUT;

            } else {
                for (int i =0; i<check.length; i++) {
                    Integer orderItemId = Integer.parseInt(check[i]);
                    OrderItems entity = orderService.findOrderItemByOrderItemId(orderItemId);
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
                }
            }

            Map sessionAttributes = ActionContext.getContext().getSession();
            Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
            sessionAttributes.put("checkedItemsInSession", check);
            order = transformToOrderFormBean(orderEntity);

            if (planning1.size() > 0) {
                return "PLANNING 1";
            } else if (planning2.size() > 0) {
                return "PLANNING 2";
            } else if (planning3.size() > 0) {
                return "PLANNING 3";
            } else {
                return INPUT;
            }

        } else {

            orderItem.setEditItem("");

            if (check == null) {
                return INPUT;
            } else {
                for (int i =0; i<check.length; i++) {
                    Integer orderItemId = Integer.parseInt(check[i]);
                    OrderItems entity = orderService.findOrderItemByOrderItemId(orderItemId);
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
                }

                Map sessionAttributes = ActionContext.getContext().getSession();
                Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
                sessionAttributes.put("checkedItemsInSession", check);
                order = transformToOrderFormBean(orderEntity);
                return "EDIT";
            }
        }
    }

    public String reloadEditPage() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorId((Integer)sessionAttributes.get("vendorIdPass"));

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

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
                orderItemEntity.setVendorSea(vendorIdParam.toString());
                orderItemEntity.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVoyageNumber());

                if("SHIPPING AND TRUCKING".equals(freightType)) {
                    if ("DOOR TO DOOR".equals(modeOfService)) {
                        orderItemEntity.setStatus("PLANNING 2");
                    } else if ("DOOR TO PIER".equals(modeOfService)) {
                        orderItemEntity.setStatus("PLANNING 2");
                    } else {
                        orderItemEntity.setStatus("PLANNING 3");
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

        sessionAttributes.put("vendorIdParam", vendorIdParam);

        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        // Proforma Bill of Lading will be activated under pending documents
//        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
//
//        Documents documentEntity = new Documents();
//            /*documentEntity.setClientId(commonUtils.getClientId());*/
//        Client client = clientService.findClientById(getClientId().toString());
//        documentEntity.setClient(client);
//        /*documentEntity.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//        documentEntity.setDocumentName(DocumentsConstants.PROFORMA_BILL_OF_LADING);
//        documentEntity.setReferenceId(orderEntity.getOrderId());
//        documentEntity.setReferenceTable("ORDERS");
//        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
//        documentEntity.setCreatedDate(new Date());
//        documentEntity.setDocumentStatus("PENDING");
//        documentEntity.setDocumentProcessed(0);
//
//        documentsService.addDocuments(documentEntity);
        // End of Activation of Proforma Bill of Lading under pending documents

        // Proforma Bill of Lading will be activated under pending documents
//        Documents documentEntity2 = new Documents();
//
//        documentEntity2.setClient(client);
//        /*documentEntity2.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//        documentEntity2.setDocumentName(DocumentsConstants.HOUSE_BILL_OF_LADING);
//        documentEntity2.setReferenceId(orderEntity.getOrderId());
//        documentEntity2.setReferenceTable("ORDERS");
//        documentEntity2.setOrderNumber(orderEntity.getOrderNumber());
//        documentEntity2.setCreatedDate(new Date());
//        documentEntity2.setDocumentStatus("PENDING");
//        documentEntity2.setDocumentProcessed(0);
//
//        documentsService.addDocuments(documentEntity2);
        // End of Activation of Proforma Bill of Lading under pending documents
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
                OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemId);
                orderItemEntity.setOrderItemId(orderItemId);
                orderItemEntity.setVendorOrigin(operationsBean.getVendorListOrigin().toString());
                orderItemEntity.setDriverOrigin(operationsBean.getDriverOrigin());
                orderItemEntity.setTruckOrigin(operationsBean.getTruckOrigin());
                orderItemEntity.setFinalPickupDate(operationsBean.getPickupDate());
                orderItemEntity.setClientId(1);

                if("SHIPPING AND TRUCKING".equals(freightType)) {
                    if ("DOOR TO DOOR".equals(modeOfService)) {
                        orderItemEntity.setStatus("PLANNING 3");
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

        sessionAttributes.put("vendorIdParam", vendorIdParam);

        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        // Proforma Bill of Lading will be activated under pending documents
//        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
//        Documents documentEntity = new Documents();
//            /*documentEntity.setClientId(commonUtils.getClientId());*/
//        Client client = clientService.findClientById(getClientId().toString());
//        documentEntity.setClient(client);
//        /*documentEntity.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//        documentEntity.setDocumentName(DocumentsConstants.PROFORMA_BILL_OF_LADING);
//        documentEntity.setReferenceId(orderEntity.getOrderId());
//        documentEntity.setReferenceTable("ORDERS");
//        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
//        documentEntity.setCreatedDate(new Date());
//        documentEntity.setDocumentStatus("PENDING");
//        documentEntity.setDocumentProcessed(0);
//
//        documentsService.addDocuments(documentEntity);
//        // End of Activation of Proforma Bill of Lading under pending documents
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
                OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemId);
                orderItemEntity.setOrderItemId(orderItemId);
                orderItemEntity.setVendorDestination(operationsBean.getVendorListDestination().toString());
                orderItemEntity.setDriverDestination(operationsBean.getDriverDestination());
                orderItemEntity.setTruckDestination(operationsBean.getTruckDestination());
                orderItemEntity.setFinalDeliveryDate(operationsBean.getDeliveryDate());
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

        sessionAttributes.put("vendorIdParam", vendorIdParam);

        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        // Proforma Bill of Lading will be activated under pending documents
        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

//        Documents documentEntity = new Documents();
//            /*documentEntity.setClientId(commonUtils.getClientId());*/
//        Client client = clientService.findClientById(getClientId().toString());
//        documentEntity.setClient(client);
//        /*documentEntity.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//        documentEntity.setDocumentName(DocumentsConstants.PROFORMA_BILL_OF_LADING);
//        documentEntity.setReferenceId(orderEntity.getOrderId());
//        documentEntity.setReferenceTable("ORDERS");
//        documentEntity.setOrderNumber(orderEntity.getOrderNumber());
//        documentEntity.setCreatedDate(new Date());
//        documentEntity.setDocumentStatus("PENDING");
//        documentEntity.setDocumentProcessed(0);
//
//        documentsService.addDocuments(documentEntity);
        // End of Activation of Proforma Bill of Lading under pending documents
        return SUCCESS;
    }

    public String editOrderItemsSea() {
        Client client = clientService.findClientById(getClientId().toString());

        try {
            OrderItems entity = transformOrderItemToEntityBeanSea(operationsBean);
            entity.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(vesselScheduleIdParam).getVoyageNumber());
            operationsService.updateOrderItem(entity);
            Orders orderEntity = orderService.findOrdersById(entity.getOrderId());


//            //MAHIRAP TO PROMISE LALO NA KAPAG EDIT NG DOCUMENT AT DELETE
//            Documents documentEntity = new Documents();
//            /*documentEntity.setClientId(commonUtils.getClientId());*/
//
//            documentEntity.setClient(client);
//            /*documentEntity.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//            documentEntity.setDocumentName(DocumentsConstants.PROFORMA_BILL_OF_LADING);
//
//            documentEntity.setReferenceId(orderEntity.getOrderId());
//            documentEntity.setVendorCode(entity.getVendorSea());
//
//            documentEntity.setReferenceTable("ORDERS");
//            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
//            documentEntity.setCreatedDate(new Date());
//            documentEntity.setDocumentStatus("INPUT #");
//            documentEntity.setDocumentProcessed(0);
//
//            documentsService.addDocuments(documentEntity);
//
//            // House Bill of Lading will be created under pending documents
//            Documents documentEntity2 = new Documents();
//
//            documentEntity2.setClient(client);
//        /*documentEntity2.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//            documentEntity2.setDocumentName(DocumentsConstants.HOUSE_BILL_OF_LADING);
//            documentEntity2.setReferenceId(orderEntity.getOrderId());
//            documentEntity2.setVendorCode(entity.getVendorSea());
//
//            documentEntity2.setReferenceTable("ORDERS");
//            documentEntity2.setOrderNumber(orderEntity.getOrderNumber());
//            documentEntity2.setCreatedDate(new Date());
//            documentEntity2.setDocumentStatus("FOR PRINTING");
//            documentEntity2.setDocumentProcessed(0);
//
//            documentsService.addDocuments(documentEntity2);


//            if (orderEntity.getServiceMode().equals("PIER TO PIER") && orderEntity.getServiceMode().equals("PIER TO DOOR") ){
//
//                // Acceptance Receipt will be created under pending documents
//                Documents documentEntity3 = new Documents();
//
//                documentEntity3.setClient(client);
//                /*documentEntity3.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//                documentEntity3.setDocumentName(DocumentsConstants.ACCEPTANCE_RECEIPT);
//                documentEntity3.setReferenceId(orderEntity.getOrderId());
//                documentEntity3.setReferenceTable("ORDERS");
//                documentEntity3.setOrderNumber(orderEntity.getOrderNumber());
//                documentEntity3.setCreatedDate(new Date());
//                documentEntity3.setDocumentStatus("FOR PRINTING");
//                documentEntity3.setDocumentProcessed(0);
//
//                documentsService.addDocuments(documentEntity3);
//            }

        } catch (Exception e) {
            log.error("Update Orderitem failed", e);
            return INPUT;
        }

        Map sessionAttributes = ActionContext.getContext().getSession();

        sessionAttributes.put("vendorIdParam", vendorIdParam);

        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        return SUCCESS;
    }

    public String editOrderItemsOrigin() {

        try {
            OrderItems entity = transformOrderItemToEntityBeanOrigin(operationsBean);
            operationsService.updateOrderItem(entity);

            Orders orderEntity = orderService.findOrdersById(entity.getOrderId());

            // House Way Bill Origin will be created under pending documents begin
//        Orders orderEntity = orderService.findOrdersById(documentIdEntity.getReferenceId());

            Documents documentEntity = new Documents();

            Client client = clientService.findClientById(getClientId().toString());
            documentEntity.setClient(client);

            documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_ORIGIN);
            documentEntity.setReferenceId(orderEntity.getOrderId());
            documentEntity.setReferenceTable("ORDERS");
            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
            documentEntity.setReferenceNumber(orderEntity.getOrderNumber());
            documentEntity.setCreatedDate(new Date());
            documentEntity.setDocumentStatus("FOR PRINTING");
            documentEntity.setOutboundStage(1);
            documentEntity.setDocumentProcessed(0);
            documentEntity.setOrderItemId(entity.getOrderItemId());

            documentsService.addDocuments(documentEntity);

            // House Way Bill Origin will be created under pending documents end

//            Documents documentEntity = new Documents();
//            /*documentEntity.setClientId(commonUtils.getClientId());*/
//            Client client = clientService.findClientById(getClientId().toString());
//            documentEntity.setClient(client);
//            /*documentEntity.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//            documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_ORIGIN);
//            documentEntity.setReferenceId(orderEntity.getOrderId());
//            documentEntity.setReferenceTable("ORDERS");
//            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
//            documentEntity.setCreatedDate(new Date());
//            documentEntity.setDocumentStatus("FOR PRINTING");
//            documentEntity.setDocumentProcessed(0);
//
//            documentsService.addDocuments(documentEntity);
//            // End of Activation of Proforma Bill of Lading under pending documents

        } catch (Exception e) {
            log.error( "update failed", e);
            return INPUT;
        }

        return SUCCESS;
    }

    public String editOrderItemsDestination() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        try {
            OrderItems entity = transformOrderItemToEntityBeanDestination(operationsBean);

            Orders orderEntity = orderService.findOrdersById(entity.getOrderId());

            // House Way Bill Destination will be created under pending documents begin
//        Orders orderEntity = orderService.findOrdersById(documentIdEntity.getReferenceId());

            Documents documentEntity = new Documents();

            Client client = clientService.findClientById(getClientId().toString());
            documentEntity.setClient(client);

            documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_DESTINATION);
            documentEntity.setReferenceId(orderEntity.getOrderId());
            documentEntity.setReferenceTable("ORDERS");
            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
            documentEntity.setReferenceNumber(orderEntity.getOrderNumber());
            documentEntity.setCreatedDate(new Date());
            documentEntity.setDocumentStatus("FOR PRINTING");
            documentEntity.setFinalOutboundStage(1);
            documentEntity.setDocumentProcessed(0);
            documentEntity.setOrderItemId(entity.getOrderItemId());

            documentsService.addDocuments(documentEntity);

            // House Way Bill Destination will be created under pending documents end

//            Documents documentEntity = new Documents();
//            /*documentEntity.setClientId(commonUtils.getClientId());*/
//            Client client = clientService.findClientById(getClientId().toString());
//            documentEntity.setClient(client);
//            /*documentEntity.setDocumentType(DocumentsConstants.OUTBOUND);*/
//
//            documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_DESTINATION);
//            documentEntity.setReferenceId(orderEntity.getOrderId());
//            documentEntity.setReferenceTable("ORDERS");
//            documentEntity.setOrderNumber(orderEntity.getOrderNumber());
//            documentEntity.setCreatedDate(new Date());
//            documentEntity.setDocumentStatus("FOR PRINTING");
//            documentEntity.setDocumentProcessed(0);
//
//            documentsService.addDocuments(documentEntity);
//            // End of Activation of Proforma Bill of Lading under pending documents


            operationsService.updateOrderItem(entity);
        } catch (Exception e) {
            log.error("Update Orderitem failed", e);
            return INPUT;
        }

        return SUCCESS;
    }

//    public Orders transformOrderToEntityBean (OperationsBean formBean) {
//        Orders entity = new Orders();
//
//
//    }

    public String addVesselSchedule(){
        /*validateOnSubmit(vesselSchedule);
        if (hasFieldErrors()) {
            return INPUT;
        }*/

        try {
            VesselSchedules entity = transformToVesselScheduleEntityBean(vesselSchedule);
            entity.setCreatedBy(commonUtils.getUserNameFromSession());
            entity.setCreatedTimestamp(new Date());
            entity.setModifiedBy(commonUtils.getUserNameFromSession());
            entity.setModifiedTimestamp(new Date());
            vesselSchedulesService.addVesselSchedule(entity);
        } catch (Exception e) {
            addFieldError("vesselSchedule.voyageNumber", "Voyage Number already exists");
            return INPUT;
        }

        Integer vendorIdPass = (transformToVesselScheduleEntityBean(vesselSchedule).getVendorId());

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("vendorIdPass", vendorIdPass);
        sessionAttributes.put("nameSizeParam", sessionAttributes.get("nameSizeParam"));
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

//    public OrderItems transformOrderItemToEntityBeanBulk(OperationsBean formBean) {
//        OrderItems entity = new OrderItems();
//
//        entity.setVendorSea(formBean.getVendorList().toString());
//        entity.setVesselScheduleId();
//
//        return entity;
//    }

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
//        sessionAttributes.put("status", "PLANNING 2");
        sessionAttributes.put("vendorSea", operationsBean.getVendorList());
        sessionAttributes.put("orderIdParam", operationsBean.getOrderId());
        sessionAttributes.put("modeOfService", operationsBean.getModeOfService());
        sessionAttributes.put("freightType", operationsBean.getFreightType());

        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorId(operationsBean.getVendorList());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Vessel Schedule loaded !");

        return SUCCESS;

    }

    public String findVesselSchedule() {

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
//        sessionAttributes.put("status", "PLANNING 2");
        sessionAttributes.put("vendorSea", operationsBean.getVendorList());
        sessionAttributes.put("orderIdParam", operationsBean.getOrderId());
        sessionAttributes.put("modeOfService", operationsBean.getModeOfService());
        sessionAttributes.put("freightType", operationsBean.getFreightType());

        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorId(operationsBean.getVendorList());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        sessionAttributes.put("orderItemIdParam", (Integer)sessionAttributes.get("orderItemIdParam"));

        // return the values of operation bean back to hidden fields
        OrderItems entity = operationsService.findOrderItemById((Integer)sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        //sessionAttributes.put("nameSizeParam", operationsBean.getNameSize());

        clearErrorsAndMessages();
        addActionMessage("Vessel Schedule loaded !");

        return SUCCESS;
    }

    public String viewInfo() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(entity);
        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        return SUCCESS;
    }

    public String viewSeaFreightPlanningBulk() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        sessionAttributes.put("checkedItemsInSession", check);
        order = transformToOrderFormBean(orderEntity);

        return "PLANNING 2";
    }

    public String viewEditSeaFreight() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        return SUCCESS;
    }

    public String viewEditInlandFreightOrigin() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

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

        return SUCCESS;
    }

    public String viewFreightPlanning(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        if ("PLANNING 1".equals(entity.getStatus())) {
            return "PLANNING 1";
        } else if ("PLANNING 2".equals(entity.getStatus())) {
            return "PLANNING 2";
        } else {
            return "PLANNING 3";
        }
    }

    public String reloadInlandFreightPlanning() {

        System.out.println("___________________reloadInlandFreightPlanning");

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        // should put vendor id

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

        System.out.println("___________________reloadInlandFreightPlanning");

        Map sessionAttributes = ActionContext.getContext().getSession();

        String[] check = (String[]) sessionAttributes.get("checkedItemsInSession");

        OrderItems entity = operationsService.findOrderItemById(Integer.parseInt(check[0]));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        // should put vendor id

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

    public String reloadSeaFreightPlanning() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));

        orderItem = transformToOrderItemFormBean(entity);

        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));

        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderItemId());
        /*sessionAttributes.put("nameSizeParam", entity.getNameSize());*/
        sessionAttributes.put("nameSizeParam", sessionAttributes.get("nameSizeParam"));

        // should put vendor id

        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorId((Integer)sessionAttributes.get("vendorIdPass"));

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

        // should put vendor id

        List<VesselSchedules> vesselSchedulesList = operationsService.findVesselScheduleByVendorId((Integer)sessionAttributes.get("vendorIdPass"));

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Vendor Added Successfully!");

        return SUCCESS;
    }

    public String viewFreightList() {
        List<Orders> ordersList = new ArrayList<Orders>();

        ordersList = operationsService.findAllOrders();

        for (Orders orderElem : ordersList) {
            orders.add(transformToOrderFormBean(orderElem));
        }
        return SUCCESS;
    }

    public String viewFreightItemList() {

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);
        sessionAttributes.put("modeOfService", orderEntity.getServiceMode());
        sessionAttributes.put("freightType", orderEntity.getServiceType());

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String viewFreightItemListError() {
        clearErrorsAndMessages();
        addActionMessage("Status must be the same");

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
            driverMap.put(driverList.get(i).getFirstName() + " " + driverList.get(i).getLastName(), driverList.get(i).getFirstName() + " " + driverList.get(i).getLastName());
        }

        for(int i = 0; i <trucksList.size(); i++) {
            trucksMap.put(trucksList.get(i).getTruckCode(), trucksList.get(i).getTruckCode());
        }

        return SUCCESS;
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
        formBean.setOrderDate(entity.getOrderDate());
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

    public OrderItemsBean transformToOrderItemFormBean(OrderItems entity) {
        OrderItemsBean formBean = new OrderItemsBean();
        formBean.setNameSize(entity.getNameSize());
        formBean.setStatus(entity.getStatus());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setClientId(entity.getClientId());
        formBean.setNameSize(entity.getNameSize());
        formBean.setOrderId(entity.getOrderId());
        formBean.setQuantity(entity.getQuantity());
        formBean.setClassification(entity.getClassification());
        formBean.setCommodity(entity.getCommodity());
        formBean.setDeclaredValue(entity.getDeclaredValue());
        formBean.setComments(entity.getComments());
        formBean.setRate(entity.getRate());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimeStamp(entity.getModifiedTimestamp());
        formBean.setStatus(entity.getStatus());
        formBean.setWeight(entity.getWeight());
        formBean.setVendorSea(entity.getVendorSea());
        formBean.setVendorOrigin(entity.getVendorOrigin());
        formBean.setVendorDestination(entity.getVendorDestination());
        /*formBean.setVendorSea(entity.getVendorSea());*/

        if (entity.getVesselScheduleId() == null || "".equals(entity.getVesselScheduleId())) {
            formBean.setVesselScheduleId("");
        } else {
            formBean.setVesselScheduleId(entity.getVesselScheduleId());
        }

        formBean.setFinalPickupDate(entity.getFinalPickupDate());
        formBean.setFinalDeliveryDate(entity.getFinalDeliveryDate());
        formBean.setDriverOrigin(entity.getDriverOrigin());
        formBean.setDriverDestination(entity.getDriverDestination());
        formBean.setTruckOrigin(entity.getTruckOrigin());
        formBean.setTruckDestination(entity.getTruckDestination());

        return formBean;
    }

    public OrderItems transformOrderItemToEntityBeanSea (OperationsBean formBean) {
        OrderItems entity = new OrderItems();

        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderItemId = (Integer) sessionAttributes.get("orderItemId");
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");
        String nameSize = (String) sessionAttributes.get("nameSize");
        Integer quantity = (Integer) sessionAttributes.get("quantity");
        String classification = (String) sessionAttributes.get("classification");
        String commodity = (String) sessionAttributes.get("commodity");
        Double declaredValue = (Double) sessionAttributes.get("declaredValue");
        String comments = (String) sessionAttributes.get("comments");
        Float rate = (Float) sessionAttributes.get("rate");
        String createdBy = (String) sessionAttributes.get("createdBy");
        String modifiedBy = (String) sessionAttributes.get("modifiedBy");
        Date createdTimestamp = (Date) sessionAttributes.get("createdTimestamp");
        Date modifiedTimestamp = (Date) sessionAttributes.get("modifiedTimestamp");
        Double weight = (Double) sessionAttributes.get("weight");
//        String status = (String) sessionAttributes.get("status");
        String vendorSea = sessionAttributes.get("vendorSea").toString();

        String modeOfService = sessionAttributes.get("modeOfService").toString();
        String freightType = sessionAttributes.get("freightType").toString();

        System.out.println("<---------VendorSea: " + vendorSea + "------------------->");
        System.out.println("<---------VendorSea: " + sessionAttributes.get("vendorSea").toString() + "------------------->");
        System.out.println("<---------VendorSea: " + quantity + "------------------->");
        entity.setOrderItemId(orderItemId);
        entity.setClientId(clientId);
        entity.setNameSize(nameSize);
        entity.setOrderId(orderId);
        entity.setQuantity(quantity);
        entity.setClassification(classification);
        entity.setCommodity(commodity);
        entity.setDeclaredValue(declaredValue);
        entity.setComments(comments);
        entity.setRate(rate);
        entity.setCreatedBy(createdBy);
        entity.setModifiedBy(modifiedBy);
        entity.setCreatedTimestamp(createdTimestamp);
        entity.setModifiedTimestamp(modifiedTimestamp);
        entity.setWeight(weight);

        if("SHIPPING AND TRUCKING".equals(freightType)) {
            if ("DOOR TO DOOR".equals(modeOfService)) {
                entity.setStatus("PLANNING 2");
            } else if ("DOOR TO PIER".equals(modeOfService)) {
                entity.setStatus("PLANNING 2");
            } else {
                entity.setStatus("PLANNING 3");
            }
        }

        if ("SHIPPING".equals(freightType)) {
            entity.setStatus("ON GOING");
        }

        entity.setVendorSea(vendorService.findVendorById(Integer.parseInt(vendorSea)).getVendorCode());
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
        entity.setVendorSea(formBean.getVendorSea());
        entity.setDriverDestination(formBean.getDriverDestination());
        entity.setTruckDestination(formBean.getTruckDestination());
        entity.setDriverOrigin(formBean.getDriverOrigin());
        entity.setTruckOrigin(formBean.getTruckOrigin());
        entity.setVendorSea(formBean.getVendorSea());
        entity.setVesselScheduleId(formBean.getVesselScheduleId());

        return entity;
    }

    public VesselScheduleBean transformToFormBeanVesselSchedule(VesselSchedules entity) {
        VesselScheduleBean formBean = new VesselScheduleBean();
        formBean.setVesselScheduleId(entity.getVesselScheduleId());
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
        return formBean;
    }

//    -----------------CONSOLIDATION MODULE-------------------------

    public String viewContainerList() {
        List<Container> containerList = new ArrayList<Container>();
        containerList = containerService.findAllContainer();

        for (Container containerElem : containerList) {
            containers.add(transformContainerToFormBean(containerElem));
        }
        return SUCCESS;
    }

    public ContainerBean transformContainerToFormBean(Container entity) {
        ContainerBean formBean = new ContainerBean();

        formBean.setContainerId(entity.getContainerId());
        formBean.setEirNumber(entity.getEirNumber());
        formBean.setDateTime(entity.getDateTime());
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

        return formBean;
    }

//    -----------------CONSOLIDATION MODULE-------------------------

//    -----------------DOCUMENTS PAGE-------------------------

    public String viewDocumentList() {
        List<Documents> documentsList = new ArrayList<Documents>();

        documentsList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsList) {
            documents.add(transformDocumentToFormBean(documentElem));
        }

        return SUCCESS;
    }

    public String createdDocumentsSea() {
        List<Documents> documentsList = new ArrayList<Documents>();
        List<String> vendorCodeDocument = new ArrayList<String>();
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);


        for (OrderItems everyItem : orderItemsList) {
            if (vendorCodeDocument.isEmpty()) {
                vendorCodeDocument.add(everyItem.getVendorSea());
            } else {
                if (!vendorCodeDocument.contains(everyItem.getVendorSea())) {
                    vendorCodeDocument.add(everyItem.getVendorSea());
                }
            }
        }

        List<Documents> proforma = documentsService.findDocumentNameAndId("PROFORMA BILL OF LADING", orderIdParam);
        for (String itemVendor : vendorCodeDocument) {
            if (proforma.size() == 0) {
                Documents documentEntity = new Documents();

                Client client = clientService.findClientById(getClientId().toString());
                documentEntity.setClient(client);

                documentEntity.setDocumentName(DocumentsConstants.PROFORMA_BILL_OF_LADING);
                documentEntity.setReferenceId(orderEntity.getOrderId());
                documentEntity.setReferenceTable("ORDERS");
                documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                documentEntity.setCreatedDate(new Date());
                documentEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
                documentEntity.setVendorCode(itemVendor);
                documentEntity.setOutboundStage(1);
                documentEntity.setDocumentProcessed(0);

                documentsService.addDocuments(documentEntity);
            } else {
                clearErrorsAndMessages();
                addActionMessage("I have found out that there is a document with the same name. Please delete them first before creating a new one");
                for(OrderItems orderItemsElem : orderItemsList) {
                    orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                }
                return INPUT;
            }

        }

        clearErrorsAndMessages();
        addActionMessage("SUCCESS! Documents has been created");

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String createdDocumentOrigin() {
        List<Documents> documentsList = new ArrayList<Documents>();
        List<String> vendorCodeDocument = new ArrayList<String>();
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);


        for (OrderItems everyItem : orderItemsList) {
            if (vendorCodeDocument.isEmpty()) {
                vendorCodeDocument.add(everyItem.getVendorOrigin());
            } else {
                if (!vendorCodeDocument.contains(everyItem.getVendorOrigin())) {
                    vendorCodeDocument.add(everyItem.getVendorOrigin());
                }
            }
        }

        List<Documents> proforma = documentsService.findDocumentNameAndId("HOUSE WAYBILL ORIGIN", orderIdParam);
        for (String itemVendor : vendorCodeDocument) {
            if (proforma.size() == 0) {
                Documents documentEntity = new Documents();

                Client client = clientService.findClientById(getClientId().toString());
                documentEntity.setClient(client);

                documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_ORIGIN);
                documentEntity.setReferenceId(orderEntity.getOrderId());
                documentEntity.setReferenceTable("ORDERS");
                documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                documentEntity.setCreatedDate(new Date());
                documentEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
                documentEntity.setVendorCode(itemVendor);
                documentEntity.setOutboundStage(1);
                documentEntity.setReferenceNumber(orderIdParam.toString());
                documentEntity.setDocumentProcessed(0);

                documentsService.addDocuments(documentEntity);
            } else {
                clearErrorsAndMessages();
                addActionMessage("I have found out that there is a document with the same name. Please delete them first before creating a new one");
                for(OrderItems orderItemsElem : orderItemsList) {
                    orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                }
                return INPUT;
            }

        }

        clearErrorsAndMessages();
        addActionMessage("SUCCESS! Documents has been created");

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String createdDocumentDestination() {
        List<Documents> documentsList = new ArrayList<Documents>();
        List<String> vendorCodeDocument = new ArrayList<String>();
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);


        for (OrderItems everyItem : orderItemsList) {
            if (vendorCodeDocument.isEmpty()) {
                vendorCodeDocument.add(everyItem.getVendorDestination());
            } else {
                if (!vendorCodeDocument.contains(everyItem.getVendorDestination())) {
                    vendorCodeDocument.add(everyItem.getVendorDestination());
                }
            }
        }

        List<Documents> proforma = documentsService.findDocumentNameAndId("HOUSE WAYBILL DESTINATION", orderIdParam);
        for (String itemVendor : vendorCodeDocument) {
            if (proforma.size() == 0) {
                Documents documentEntity = new Documents();

                Client client = clientService.findClientById(getClientId().toString());
                documentEntity.setClient(client);

                documentEntity.setDocumentName(DocumentsConstants.HOUSE_WAYBILL_DESTINATION);
                documentEntity.setReferenceId(orderEntity.getOrderId());
                documentEntity.setReferenceTable("ORDERS");
                documentEntity.setOrderNumber(orderEntity.getOrderNumber());
                documentEntity.setCreatedDate(new Date());
                documentEntity.setDocumentStatus("INPUT REFERENCE NUMBER");
                documentEntity.setVendorCode(itemVendor);
                documentEntity.setReferenceNumber(orderIdParam.toString());
                documentEntity.setOutboundStage(1);
                documentEntity.setDocumentProcessed(0);

                documentsService.addDocuments(documentEntity);
            } else {
                clearErrorsAndMessages();
                addActionMessage("I have found out that there is a document with the same name. Please delete them first before creating a new one");
                for(OrderItems orderItemsElem : orderItemsList) {
                    orderItems.add(transformToOrderItemFormBean(orderItemsElem));
                }
                return INPUT;
            }

        }

        clearErrorsAndMessages();
        addActionMessage("SUCCESS! Documents has been created");

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }



    public String deleteDocument() {
        Documents documentEntity = documentsService.findDocumentById(documentIdParam);
        documentsService.deleteDocument(documentEntity);

        List<Documents> documentsList = new ArrayList<Documents>();

        documentsList = documentsService.findDocumentsByOrderId(orderIdParam);

        for (Documents documentElem : documentsList) {
            documents.add(transformDocumentToFormBean(documentElem));
        }
        return SUCCESS;
    }

    public DocumentsBean transformDocumentToFormBean(Documents entity) {
        DocumentsBean formBean = new DocumentsBean();

        formBean.setDocumentName(entity.getDocumentName());
        formBean.setReferenceNumber(entity.getReferenceNumber());
        formBean.setVendorCode(entity.getVendorCode());
        formBean.setDocumentStatus(entity.getDocumentStatus());
        formBean.setCreatedDate(entity.getCreatedDate());
        formBean.setDocumentId(entity.getDocumentId());
        return formBean;
    }

//    -----------------DOCUMENTS PAGE-------------------------


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

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public Integer getNameSizeParam() {
        return nameSizeParam;
    }

    public void setNameSizeParam(Integer nameSizeParam) {
        this.nameSizeParam = nameSizeParam;
    }

    public VendorService getVendorService() {
        return vendorService;
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
}
