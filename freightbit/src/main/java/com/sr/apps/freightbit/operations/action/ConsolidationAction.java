package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.ContainerBean;
import com.sr.apps.freightbit.operations.formbean.OperationsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.operations.entity.Container;
import com.sr.biz.freightbit.operations.service.ContainerService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.log4j.Logger;

import java.util.*;

public class ConsolidationAction extends ActionSupport implements Preparable {

	private static final long serialVersionUID = 1L;
	private static final Logger Log = Logger.getLogger(ConsolidationAction.class);

	Map paramMap = new HashMap();

	private String orderNoParam;
	private String editParam;
	private Integer orderIdParam;
	private Integer orderItemIdParam;
	private Integer containerIdParam;
	private Integer nameSizeParam;
	private Integer vendorId;

	private List<OrderBean> orders = new ArrayList<OrderBean>();
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

	@Override
	public void prepare() throws Exception {}

	public String updateStatusOfContainers() {

		Map sessionAttributes = ActionContext.getContext().getSession();
		Integer containerId = (Integer) sessionAttributes.get("containerIdParam");

		//shows container id
		Container containerEntity = containerService.findContainerById(containerId);

		//change status to FULL LOAD
		containerEntity.setContainerStatus("FULL LOAD");
		containerService.updateContainer(containerEntity);

		container = transformToContainerFormBean(containerEntity);
		// displays order items under orders
		List<Container> containerList = new ArrayList<Container>();

		containerList = (List<Container>) containerService.findContainerById(containerId);

		for(Container containerItemsLst : containerList) {
			orderItems.add(transformToContainerFormBean(containerItemsLst));
		}
		clearErrorsAndMessages();
		addActionMessage("Success");

		return SUCCESS;
	}




	public ContainerBean transformToContainerFormBean(Container entity) {

		ContainerBean formBean = new ContainerBean();
		formBean.setOrderNumber(entity.getOrderNumber());

		return formBean;
	}
}