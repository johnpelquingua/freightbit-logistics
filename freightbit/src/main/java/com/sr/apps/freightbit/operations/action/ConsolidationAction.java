package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.ContainerBean;
import com.sr.apps.freightbit.operations.formbean.OperationsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.DocumentsConstants;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.operations.entity.Container;
import com.sr.biz.freightbit.operations.service.ContainerService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.vendor.service.VendorService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.*;

public class ConsolidationAction extends ActionSupport implements Preparable {

	private static final long serialVersionUID = 1L;
	private static final Logger Log = Logger.getLogger(ConsolidationAction.class);

	Map paramMap = new HashMap();

	private String containerSizeParam;
	private String orderNoParam;
	private String editParam;
	private Integer orderIdParam;
	private Integer orderItemIdParam;
	private Integer containerIdParam;
	private Integer nameSizeParam;
	private Integer vendorId;
    private String containerStatusParam;
    private String containerPortCodeParam;

	private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItemsBeans = new ArrayList<OrderItemsBean>();
    private List<OrderItemsBean> orderItemsInsideContainer = new ArrayList<OrderItemsBean>();
	private List<ContainerBean> orderItems = new ArrayList<ContainerBean>();
	private List<ContainerBean> containers = new ArrayList<ContainerBean>();

	private List<Parameters> statusList = new ArrayList<Parameters>();
	private List<Parameters> updateStatusList = new ArrayList<Parameters>();

	private OrderItemsBean orderItem = new OrderItemsBean();
	private OperationsBean operationsBean = new OperationsBean();
	private OrderBean order = new OrderBean();
	private ContainerBean container = new ContainerBean();

	private OperationsService operationsService;
	private OrderService orderService;
	private ParameterService parameterService;
	private CommonUtils commonUtils;
	private ContainerService containerService;
    private VendorService vendorService;
    private DocumentsService documentsService;
    private ClientService clientService;

    private List<Parameters> containerSearchList = new ArrayList<Parameters>();

    private String[] check;

	@Override
	public void prepare() throws Exception {
        containerSearchList = parameterService.getParameterMap(ParameterConstants.CONTAINER_SEARCH);
    }

    public String viewConsolidationContainerInfo() {

        Container containerEntity = containerService.findContainerById(containerIdParam);
        container = transformContainerToFormBean(containerEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("containerSizeParam", containerSizeParam);
        sessionAttributes.put("containerIdParam", containerIdParam);
        sessionAttributes.put("containerStatusParam", containerStatusParam);

        /*List<OrderItems> orderItemsUnderContainer = orderService.findAllOrderItemsByContainerId((Integer) sessionAttributes.get("containerIdParam"));*/
        List<OrderItems> orderItemsUnderContainer = orderService.findAllOrderItemsByContainerId(containerIdParam);

        for (OrderItems orderItemsUnderContainerElem : orderItemsUnderContainer) {
            orderItemsInsideContainer.add(transformToOrderItemFormBean(orderItemsUnderContainerElem));
        }

        return SUCCESS;
    }

    public String finalizeContainer() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        Integer containerId = (Integer) sessionAttributes.get("containerIdParam");

        Container containerEntity = containerService.findContainerById(containerId);

        //change status to FULL LOAD
        containerEntity.setContainerStatus("FINAL");
        containerService.updateContainer(containerEntity);

        return SUCCESS;
    }

	public String updateStatusOfContainers() {

        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>CONTAINER ID " + containerIdParam);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>CONTAINER SIZE " + containerSizeParam);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>CONTAINER STATUS " + containerStatusParam);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>CONTAINER PORT CODE " + containerPortCodeParam);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>ORDER ITEM ID " + orderItemIdParam);

		/*Map sessionAttributes = ActionContext.getContext().getSession();*/

		Integer containerId = containerIdParam;

        List<Integer> itemId = new ArrayList<Integer>();
        Container containerEntity = new Container();

        if (check == null) {

            return INPUT;

        } else {

            for (String everyItemId : check) {
                itemId.add(Integer.parseInt(everyItemId));
            }

            //shows container id
            containerEntity = containerService.findContainerById(containerId);

            //change status to FULL LOAD
            containerEntity.setContainerStatus("CONSOLIDATED");
            containerService.updateContainer(containerEntity);

            for (Integer id : itemId) {
                OrderItems updateItem = orderService.findOrderItemByOrderItemId(id);
                updateItem.setContainerId(containerId);
                operationsService.updateOrderItem(updateItem);
            }

            /*List<Container> containerList = containerService.findAllContainer();

            for (Container containerElem : containerList) {
                containers.add(transformContainerToFormBean(containerElem));
            }*/
        }

        List<Orders> orders = orderService.findOrdersByLCLAndDestination("LESS CONTAINER LOAD", containerPortCodeParam);
        List<OrderItems> orderItemsInsideContainerList = orderService.findAllOrderItemsByContainerId(containerIdParam);

        if ("CONSOLIDATED".equals(containerEntity.getContainerStatus()) || "FINAL".equals(containerEntity.getContainerStatus())) {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }
            for (OrderItems orderItemsInsideContainerElem : orderItemsInsideContainerList) {
                orderItemsInsideContainer.add(transformToOrderItemFormBean(orderItemsInsideContainerElem));
            }

            Container containerNewEntity = containerService.findContainerById(containerIdParam);
            container = transformContainerToFormBean(containerEntity);

            return "CONSOLIDATED";

        } else {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }

            Container containerNewEntity = containerService.findContainerById(containerIdParam);
            container = transformContainerToFormBean(containerEntity);

            return SUCCESS;
        }

         /*orderItems = new ArrayList<OrderItems>();
         orderItemsUnderContainer = new ArrayList<OrderItems>();*/

        /*List<OrderItems> orderItems = orderService.findAllOrderItemLCL();
        List<OrderItems> orderItemsUnderContainer = orderService.findAllOrderItemsByContainerId((Integer) sessionAttributes.get("containerIdParam"));*/

        /*if ("CONSOLIDATED".equals(sessionAttributes.get("containerStatusParam"))) {
            for (OrderItems orderItemElem : orderItems) {
                orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
            }

            for (OrderItems orderItemsUnderContainerElem : orderItemsUnderContainer) {
                orderItemsInsideContainer.add(transformToOrderItemFormBean(orderItemsUnderContainerElem));
            }

            return "CONSOLIDATED";
        } else {
            for (OrderItems orderItemElem : orderItems) {
                orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
            }
            return SUCCESS;
        }*/
	}

    public String updateStatusOfContainersError() {
        clearErrorsAndMessages();
		addActionError("Please choose an Item to consolidate");

        List<OrderItems> orderItems = new ArrayList<OrderItems>();
        orderItems = orderService.findAllOrderItemLCL();

        for (OrderItems orderItemElem : orderItems) {
            orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
            System.out.println(orderItemElem.getNameSize());
        }
        return SUCCESS;
    }


    public String viewConsolidationContainerList() {
        String column = getColumnFilter();

        List<Container> containerList = new ArrayList<Container>();

        if (StringUtils.isNotBlank(column)) {
            containerList = containerService.findContainerByCriteria(column, container.getContainerKeyword());
        } else {
            containerList = containerService.findAllContainer();
        }
            for (Container containerElem : containerList) {
                if(containerElem.getContainerStatus().equals("OPEN") || containerElem.getContainerStatus().equals("CONSOLIDATED") || containerElem.getContainerStatus().equals("FINAL")){
                    containers.add(transformContainerToFormBean(containerElem));
                }
            }
        return SUCCESS;
    }

    public String createConsolidationReport(){

        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + containerIdParam );
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + containerSizeParam );
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + containerStatusParam );
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + containerPortCodeParam );

        Documents documentManifest = documentsService.findManifestAndTableAndRefId("CONSOLIDATION MANIFEST","CONTAINERS",containerIdParam);

        if(documentManifest == null){

            // Consolidation Form will be created under pending documents start

            Documents documentEntity = new Documents();
            Client client = clientService.findClientById(getClientId().toString());
            documentEntity.setClient(client);
            documentEntity.setDocumentName(DocumentsConstants.CONSOLIDATION_MANIFEST);
            documentEntity.setReferenceId(containerIdParam);
            documentEntity.setReferenceTable("CONTAINERS");
            documentEntity.setCreatedDate(new Date());
            documentEntity.setDocumentStatus("FROM CONSOLIDATION");
            documentEntity.setDocumentProcessed(0);
            documentEntity.setCreatedBy(commonUtils.getUserNameFromSession());
            documentEntity.setVendorCode("ELC");
            documentsService.addDocuments(documentEntity);

            // Consolidation Form will be created under pending documents end

        }

        List<Orders> orders = orderService.findOrdersByLCLAndDestination("LESS CONTAINER LOAD", containerPortCodeParam);
        List<OrderItems> orderItemsInsideContainerList = orderService.findAllOrderItemsByContainerId(containerIdParam);

        if ("CONSOLIDATED".equals(containerStatusParam) || "FINAL".equals(containerStatusParam)) {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }
            for (OrderItems orderItemsInsideContainerElem : orderItemsInsideContainerList) {
                orderItemsInsideContainer.add(transformToOrderItemFormBean(orderItemsInsideContainerElem));
            }

            Container containerEntity = containerService.findContainerById(containerIdParam);
            container = transformContainerToFormBean(containerEntity);

            return "CONSOLIDATED";

        } else {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }

            Container containerEntity = containerService.findContainerById(containerIdParam);
            container = transformContainerToFormBean(containerEntity);

            return SUCCESS;
        }

    }

    public String removeItemOnContainer() {

        OrderItems orderItemEntity = orderService.findOrderItemByOrderItemId(orderItemIdParam);
        orderItemEntity.setContainerId(null);
        operationsService.updateOrderItem(orderItemEntity);

        /*Map sessionAttributes = ActionContext.getContext().getSession();*/

        List<Orders> orders = orderService.findOrdersByLCLAndDestination("LESS CONTAINER LOAD", containerPortCodeParam);
        List<OrderItems> orderItemsInsideContainerList = orderService.findAllOrderItemsByContainerId(containerIdParam);

        if ("CONSOLIDATED".equals(containerStatusParam) || "FINAL".equals(containerStatusParam) ) {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }
            for (OrderItems orderItemsInsideContainerElem : orderItemsInsideContainerList) {
                orderItemsInsideContainer.add(transformToOrderItemFormBean(orderItemsInsideContainerElem));
            }

            return "CONSOLIDATED";

        } else {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }
            return SUCCESS;
        }

        /*List<OrderItems> orderItems = orderService.findAllOrderItemLCL();
        List<OrderItems> orderItemsUnderContainer = orderService.findAllOrderItemsByContainerId((Integer) sessionAttributes.get("containerIdParam"));

        if ("CONSOLIDATED".equals(sessionAttributes.get("containerStatusParam"))) {
            for (OrderItems orderItemElem : orderItems) {
                orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
            }

            for (OrderItems orderItemsUnderContainerElem : orderItemsUnderContainer) {
                orderItemsInsideContainer.add(transformToOrderItemFormBean(orderItemsUnderContainerElem));
            }

            return "CONSOLIDATED";
        } else {
            for (OrderItems orderItemElem : orderItems) {
                orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
            }
            return SUCCESS;
        }*/

    }

    public String getColumnFilter() {
        String column = "";
        if ("CONTAINER NUMBER".equals(container.getContainerSearchCriteria())) {
            column = "containerNumber";
        } else if ("SIZE".equals(container.getContainerSearchCriteria())) {
            column = "containerSize";
        } else if ("STATUS".equals(container.getContainerSearchCriteria())) {
            column = "containerStatus";
        }

        return column;
    }

    public String viewConsolidationItemList() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        sessionAttributes.put("containerSizeParam", containerSizeParam);
        sessionAttributes.put("containerIdParam", containerIdParam);
        sessionAttributes.put("containerStatusParam", containerStatusParam);
        sessionAttributes.put("containerPortCodeParam", containerPortCodeParam);

        /*List<Orders> orders = orderService.findOrdersByCriteria("serviceRequirement","LESS CONTAINER LOAD",getClientId());*/
        List<Orders> orders = orderService.findOrdersByLCLAndDestination("LESS CONTAINER LOAD", containerPortCodeParam);
        List<OrderItems> orderItemsInsideContainerList = orderService.findAllOrderItemsByContainerId(containerIdParam);

        if ("CONSOLIDATED".equals(containerStatusParam) || "FINAL".equals(containerStatusParam)) {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }
            for (OrderItems orderItemsInsideContainerElem : orderItemsInsideContainerList) {
                orderItemsInsideContainer.add(transformToOrderItemFormBean(orderItemsInsideContainerElem));
            }

            Container containerEntity = containerService.findContainerById(containerIdParam);
            container = transformContainerToFormBean(containerEntity);

            return "CONSOLIDATED";

        } else {
            for(Orders orderElem : orders){
                List<OrderItems> orderItemList = operationsService.findAllOrderItemsByOrderId(orderElem.getOrderId());
                for(OrderItems orderItemElem : orderItemList ){
                    if(orderItemElem.getContainerId() == null || orderItemElem.getContainerId() == 0){
                        orderItemsBeans.add(transformToOrderItemFormBean(orderItemElem));
                    }
                }
            }

            Container containerEntity = containerService.findContainerById(containerIdParam);
            container = transformContainerToFormBean(containerEntity);

            return SUCCESS;
        }
    }

    public String loadConsolidationContainerSearch() {
        return SUCCESS;
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
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setStatus(entity.getStatus());
        /*formBean.setWeight(entity.getWeight());*/
        formBean.setVendorSea(entity.getVendorSea());
        formBean.setVendorOrigin(entity.getVendorOrigin());
        formBean.setVendorDestination(entity.getVendorDestination());
        /*formBean.setVendorSea(entity.getVendorSea());*/
        formBean.setOrderNum(orderService.findOrdersById(entity.getOrderId()).getOrderNumber());
        formBean.setPort(orderService.findOrdersById(entity.getOrderId()).getDestinationPort());

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
        /*formBean.setVolume(entity.getVolume());*/
        formBean.setVolumeInt(Math.round(entity.getVolume()));
        formBean.setWeightInt(entity.getWeight().intValue());

        return formBean;
    }

    public ContainerBean transformContainerToFormBean(Container entity) {
        ContainerBean formBean = new ContainerBean();

        formBean.setContainerId(entity.getContainerId());
        formBean.setEirNumber(entity.getEirNumber());
        formBean.setGateInTime(entity.getGateInTime());
        formBean.setGateOutTime(entity.getGateOutTime());
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
        formBean.setContainerStatus(entity.getContainerStatus());
        formBean.setEirType(entity.getEirType());
        formBean.setSealNumber(entity.getSealNumber());
        formBean.setVanLocation(entity.getVanLocation());
        formBean.setLadenEmpty(entity.getLadenEmpty());
        formBean.setReceiptNumber(entity.getReceiptNumber());
        formBean.setLadenEmpty(entity.getLadenEmpty());
        formBean.setForkliftOperator(entity.getForkliftOperator());
        formBean.setOperationsDept(entity.getOperationsDept());
        formBean.setPortCode(entity.getPortCode());

        /*if("CONSOLIDATED".equals(entity.getContainerStatus())) {
            formBean.setContainerStatus("CONSOLIDATED");
        }
        else if("OPEN".equals(entity.getContainerStatus())){
            formBean.setContainerStatus("OPEN");
        }
        else if("FINAL".equals(entity.getContainerStatus())){
            formBean.setContainerStatus("FINAL");
        }*/

        if("GATE OUT".equals(entity.getContainerStatus())) {
            formBean.setContainerNumber(null);
            formBean.setContainerSize(null);
            formBean.setContainerStatus(null);
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

        Documents documentManifest = documentsService.findManifestAndTableAndRefId("CONSOLIDATION MANIFEST","CONTAINERS",entity.getContainerId());

        if(documentManifest != null){
            formBean.setDocumentManifestCheck("YES");
            formBean.setDocumentManifestId(documentManifest.getDocumentId());
        }

        return formBean;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public static Logger getLog() {
        return Log;
    }

    public Map getParamMap() {
        return paramMap;
    }

    public void setParamMap(Map paramMap) {
        this.paramMap = paramMap;
    }

    public String getOrderNoParam() {
        return orderNoParam;
    }

    public void setOrderNoParam(String orderNoParam) {
        this.orderNoParam = orderNoParam;
    }

    public String getEditParam() {
        return editParam;
    }

    public void setEditParam(String editParam) {
        this.editParam = editParam;
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

    public Integer getContainerIdParam() {
        return containerIdParam;
    }

    public void setContainerIdParam(Integer containerIdParam) {
        this.containerIdParam = containerIdParam;
    }

    public Integer getNameSizeParam() {
        return nameSizeParam;
    }

    public void setNameSizeParam(Integer nameSizeParam) {
        this.nameSizeParam = nameSizeParam;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public List<ContainerBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<ContainerBean> orderItems) {
        this.orderItems = orderItems;
    }

    public List<ContainerBean> getContainers() {
        return containers;
    }

    public void setContainers(List<ContainerBean> containers) {
        this.containers = containers;
    }

    public List<Parameters> getStatusList() {
        return statusList;
    }

    public void setStatusList(List<Parameters> statusList) {
        this.statusList = statusList;
    }

    public List<Parameters> getUpdateStatusList() {
        return updateStatusList;
    }

    public void setUpdateStatusList(List<Parameters> updateStatusList) {
        this.updateStatusList = updateStatusList;
    }

    public OrderItemsBean getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItemsBean orderItem) {
        this.orderItem = orderItem;
    }

    public OperationsBean getOperationsBean() {
        return operationsBean;
    }

    public void setOperationsBean(OperationsBean operationsBean) {
        this.operationsBean = operationsBean;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public ContainerBean getContainer() {
        return container;
    }

    public void setContainer(ContainerBean container) {
        this.container = container;
    }

    public OperationsService getOperationsService() {
        return operationsService;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public CommonUtils getCommonUtils() {
        return commonUtils;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }

    public ContainerService getContainerService() {
        return containerService;
    }

    public void setContainerService(ContainerService containerService) {
        this.containerService = containerService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public List<OrderItemsBean> getOrderItemsBeans() {
        return orderItemsBeans;
    }

    public void setOrderItemsBeans(List<OrderItemsBean> orderItemsBeans) {
        this.orderItemsBeans = orderItemsBeans;
    }

    public VendorService getVendorService() {
        return vendorService;
    }

    public String getContainerSizeParam() {
        return containerSizeParam;
    }

    public void setContainerSizeParam(String containerSizeParam) {
        this.containerSizeParam = containerSizeParam;
    }

    public String[] getCheck() {
        return check;
    }

    public void setCheck(String[] check) {
        this.check = check;
    }

    public List<Parameters> getContainerSearchList() {
        return containerSearchList;
    }

    public void setContainerSearchList(List<Parameters> containerSearchList) {
        this.containerSearchList = containerSearchList;
    }

    public String getContainerStatusParam() {
        return containerStatusParam;
    }

    public void setContainerStatusParam(String containerStatusParam) {
        this.containerStatusParam = containerStatusParam;
    }

    public List<OrderItemsBean> getOrderItemsInsideContainer() {
        return orderItemsInsideContainer;
    }

    public void setOrderItemsInsideContainer(List<OrderItemsBean> orderItemsInsideContainer) {
        this.orderItemsInsideContainer = orderItemsInsideContainer;
    }

    public DocumentsService getDocumentsService() {
        return documentsService;
    }

    public void setDocumentsService(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }

    public String getContainerPortCodeParam() {
        return containerPortCodeParam;
    }

    public void setContainerPortCodeParam(String containerPortCodeParam) {
        this.containerPortCodeParam = containerPortCodeParam;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }


}