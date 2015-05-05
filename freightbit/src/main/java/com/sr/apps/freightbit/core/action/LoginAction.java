package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.operations.service.OrderStatusLogsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.sr.biz.freightbit.common.service.ParameterService;

import javax.servlet.http.HttpServletRequest;
import java.math.BigInteger;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LoginAction extends ActionSupport implements SessionAware {
    private static final Logger log = Logger.getLogger(LoginAction.class);

    private String username;
    private String password;
    private List<OrderBean> lclTable = new ArrayList<OrderBean>();
    private String originCity; // load table based on origin city
    private Map<String, Object> sessionAttributes = null;
    private List<Parameters> portsList = new ArrayList<Parameters>();

    private Double bacolodWeight;
    private Float bacolodVolume;
    private Double butuanWeight;
    private Float butuanVolume;
    private Double cagayanWeight;
    private Float cagayanVolume;
    private Double cebuWeight;
    private Float cebuVolume;
    private Double cotabatoWeight;
    private Float cotabatoVolume;
    private Double davaoWeight;
    private Float davaoVolume;
    private Double dumagueteWeight;
    private Float dumagueteVolume;
    private Double gensanWeight;
    private Float gensanVolume;
    private Double iliganWeight;
    private Float iliganVolume;
    private Double iloiloWeight;
    private Float iloiloVolume;
    private Double ozamisWeight;
    private Float ozamisVolume;
    private Double palawanWeight;
    private Float palawanVolume;
    private Double roxasWeight;
    private Float roxasVolume;
    private Double tagbilaranWeight;
    private Float tagbilaranVolume;
    private Double taclobanWeight;
    private Float taclobanVolume;
    private Double zamboangaWeight;
    private Float zamboangaVolume;

    private OrderBean order = new OrderBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private UserService userService;
    private OperationsService operationsService;
    private OrderStatusLogsService orderStatusLogsService;
    private NotificationService notificationService;
    private OrderService orderService;
    private ParameterService parameterService;
    public BigInteger Booking, Customer , User , Vendor , AllNotification;

    private String test ;

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String execute() throws Exception {

        portsList = parameterService.getParameterMap(ParameterConstants.PORTS);

        log.debug("execute login...");
        HttpServletRequest request = ServletActionContext.getRequest();  
        Principal user = request.getUserPrincipal();
        this.setUsername(request.getUserPrincipal().getName());

        /*if (sessionAttributes.get("USER")!= null){
            return SUCCESS;
		}*/

        User userEntity = userService.findUserByUserName(username);
        if (userEntity != null) {

        	userService.updateLastVisitDate(userEntity);
            sessionAttributes.put("clientId", userEntity.getClient().getClientId());
            sessionAttributes.put("user", userEntity);
            sessionAttributes.put("loggedinUser", userEntity.getFirstName() + " " + userEntity.getLastName());

            Booking = notificationService.countAll();
            Customer = notificationService.countAllCustomer();
            User = notificationService.countAllUser();
            Vendor = notificationService.countAllVendor();
            AllNotification = notificationService.countAllNotification();
            System.out.println("The number of  new booking is "+Booking);
            System.out.println("The number of  new Customer is "+Customer);
            System.out.println("The number of  new User is "+User);
            System.out.println("The number of  new Vendor is "+Vendor);
            System.out.println("The Number of all Notification is "+AllNotification);

            viewStatusList();
            return SUCCESS;

        } else {
            log.debug("clearing errors and messages...");
            clearErrorsAndMessages();
            addActionError(getText("error.login"));
            return INPUT;
        }

    }

    public void validate() {
/*        if (getUsername().length() == 0) {
            addFieldError("username", "User Name is required");
        }

        if (getPassword().length() == 0) {
            addFieldError("password", getText("password.required"));
        }*/
    }

    public String viewStatusList() {

        List<Orders> orderEntityList = new ArrayList<Orders>();
        String column = getColumnFilter();

        if (StringUtils.isNotBlank(column)) {
            orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());
        } else {
            orderEntityList = orderStatusLogsService.findAllOrders();
        }
        for (Orders ordersElem : orderEntityList) {
            orders.add(transformToOrderFormBean(ordersElem));
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
            }
            return column;
        }

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
        formBean.setServiceRequirement(entity.getServiceRequirement());
        formBean.setModeOfService(entity.getServiceMode());

        //formBean.setConsigneeCode(entity.getConsigneeCode());
        formBean.setOrderId(entity.getOrderId());

        List <OrderItems> orderItemsVolume = orderService.findAllItemByOrderId(entity.getOrderId());

        Float orderVolume = 0.F;

        for(OrderItems orderItemElem : orderItemsVolume) {
            if(orderItemElem.getVolume() != null){
                orderVolume = orderVolume + orderItemElem.getVolume();
            }
        }

        formBean.setOrderVolume(orderVolume); // For showing the total volume of order items inside booking

        Double orderWeight = 0.0;

        for(OrderItems orderItemElem : orderItemsVolume) {
            if(orderItemElem.getWeight() != null){
                orderWeight = orderWeight + orderItemElem.getWeight();
            }
        }

        formBean.setOrderWeight(orderWeight); // For showing the total volume of order items inside booking

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

        return formBean;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public void setSession(Map<String, Object> sessionAttributes) {
        this.sessionAttributes = sessionAttributes;
    }

    public BigInteger getBooking() {
        return Booking;
    }

    public void setBooking(BigInteger booking) {
        Booking = booking;
    }

    public BigInteger getCustomer() {
        return Customer;
    }

    public void setCustomer(BigInteger customer) {
        Customer = customer;
    }

    public BigInteger getUser() {
        return User;
    }

    public void setUser(BigInteger user) {
        User = user;
    }

    public BigInteger getVendor() {
        return Vendor;
    }

    public void setVendor(BigInteger vendor) {
        Vendor = vendor;
    }

    public BigInteger getAllNotification() {
        return AllNotification;
    }

    public void setAllNotification(BigInteger allNotification) {
        AllNotification = allNotification;
    }

    public String getOriginCity() {
        return originCity;
    }

    public void setOriginCity(String originCity) {
        this.originCity = originCity;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }

    public List<OrderBean> getLclTable() {
        return lclTable;
    }

    public void setLclTable(List<OrderBean> lclTable) {
        this.lclTable = lclTable;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
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

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public Double getButuanWeight() {
        return butuanWeight;
    }

    public void setButuanWeight(Double butuanWeight) {
        this.butuanWeight = butuanWeight;
    }

    public Float getButuanVolume() {
        return butuanVolume;
    }

    public void setButuanVolume(Float butuanVolume) {
        this.butuanVolume = butuanVolume;
    }

    public Double getBacolodWeight() {
        return bacolodWeight;
    }

    public void setBacolodWeight(Double bacolodWeight) {
        this.bacolodWeight = bacolodWeight;
    }

    public Float getBacolodVolume() {
        return bacolodVolume;
    }

    public void setBacolodVolume(Float bacolodVolume) {
        this.bacolodVolume = bacolodVolume;
    }

    public Double getCagayanWeight() {
        return cagayanWeight;
    }

    public void setCagayanWeight(Double cagayanWeight) {
        this.cagayanWeight = cagayanWeight;
    }

    public Float getCagayanVolume() {
        return cagayanVolume;
    }

    public void setCagayanVolume(Float cagayanVolume) {
        this.cagayanVolume = cagayanVolume;
    }

    public Double getCebuWeight() {
        return cebuWeight;
    }

    public void setCebuWeight(Double cebuWeight) {
        this.cebuWeight = cebuWeight;
    }

    public Float getCebuVolume() {
        return cebuVolume;
    }

    public void setCebuVolume(Float cebuVolume) {
        this.cebuVolume = cebuVolume;
    }

    public Double getCotabatoWeight() {
        return cotabatoWeight;
    }

    public void setCotabatoWeight(Double cotabatoWeight) {
        this.cotabatoWeight = cotabatoWeight;
    }

    public Float getCotabatoVolume() {
        return cotabatoVolume;
    }

    public void setCotabatoVolume(Float cotabatoVolume) {
        this.cotabatoVolume = cotabatoVolume;
    }

    public Double getDavaoWeight() {
        return davaoWeight;
    }

    public void setDavaoWeight(Double davaoWeight) {
        this.davaoWeight = davaoWeight;
    }

    public Float getDavaoVolume() {
        return davaoVolume;
    }

    public void setDavaoVolume(Float davaoVolume) {
        this.davaoVolume = davaoVolume;
    }

    public Double getDumagueteWeight() {
        return dumagueteWeight;
    }

    public void setDumagueteWeight(Double dumagueteWeight) {
        this.dumagueteWeight = dumagueteWeight;
    }

    public Float getDumagueteVolume() {
        return dumagueteVolume;
    }

    public void setDumagueteVolume(Float dumagueteVolume) {
        this.dumagueteVolume = dumagueteVolume;
    }

    public Double getGensanWeight() {
        return gensanWeight;
    }

    public void setGensanWeight(Double gensanWeight) {
        this.gensanWeight = gensanWeight;
    }

    public Float getGensanVolume() {
        return gensanVolume;
    }

    public void setGensanVolume(Float gensanVolume) {
        this.gensanVolume = gensanVolume;
    }

    public Double getIliganWeight() {
        return iliganWeight;
    }

    public void setIliganWeight(Double iliganWeight) {
        this.iliganWeight = iliganWeight;
    }

    public Float getIliganVolume() {
        return iliganVolume;
    }

    public void setIliganVolume(Float iliganVolume) {
        this.iliganVolume = iliganVolume;
    }

    public Float getIloiloVolume() {
        return iloiloVolume;
    }

    public void setIloiloVolume(Float iloiloVolume) {
        this.iloiloVolume = iloiloVolume;
    }

    public Double getIloiloWeight() {
        return iloiloWeight;
    }

    public void setIloiloWeight(Double iloiloWeight) {
        this.iloiloWeight = iloiloWeight;
    }

    public Double getOzamisWeight() {
        return ozamisWeight;
    }

    public void setOzamisWeight(Double ozamisWeight) {
        this.ozamisWeight = ozamisWeight;
    }

    public Float getOzamisVolume() {
        return ozamisVolume;
    }

    public void setOzamisVolume(Float ozamisVolume) {
        this.ozamisVolume = ozamisVolume;
    }

    public Double getPalawanWeight() {
        return palawanWeight;
    }

    public void setPalawanWeight(Double palawanWeight) {
        this.palawanWeight = palawanWeight;
    }

    public Float getPalawanVolume() {
        return palawanVolume;
    }

    public void setPalawanVolume(Float palawanVolume) {
        this.palawanVolume = palawanVolume;
    }

    public Double getRoxasWeight() {
        return roxasWeight;
    }

    public void setRoxasWeight(Double roxasWeight) {
        this.roxasWeight = roxasWeight;
    }

    public Float getRoxasVolume() {
        return roxasVolume;
    }

    public void setRoxasVolume(Float roxasVolume) {
        this.roxasVolume = roxasVolume;
    }

    public Double getTagbilaranWeight() {
        return tagbilaranWeight;
    }

    public void setTagbilaranWeight(Double tagbilaranWeight) {
        this.tagbilaranWeight = tagbilaranWeight;
    }

    public Float getTagbilaranVolume() {
        return tagbilaranVolume;
    }

    public void setTagbilaranVolume(Float tagbilaranVolume) {
        this.tagbilaranVolume = tagbilaranVolume;
    }

    public Double getTaclobanWeight() {
        return taclobanWeight;
    }

    public void setTaclobanWeight(Double taclobanWeight) {
        this.taclobanWeight = taclobanWeight;
    }

    public Float getTaclobanVolume() {
        return taclobanVolume;
    }

    public void setTaclobanVolume(Float taclobanVolume) {
        this.taclobanVolume = taclobanVolume;
    }

    public Double getZamboangaWeight() {
        return zamboangaWeight;
    }

    public void setZamboangaWeight(Double zamboangaWeight) {
        this.zamboangaWeight = zamboangaWeight;
    }

    public Float getZamboangaVolume() {
        return zamboangaVolume;
    }

    public void setZamboangaVolume(Float zamboangaVolume) {
        this.zamboangaVolume = zamboangaVolume;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public OrderStatusLogsService getOrderStatusLogsService() {
        return orderStatusLogsService;
    }

    public void setOrderStatusLogsService(OrderStatusLogsService orderStatusLogsService) {
        this.orderStatusLogsService = orderStatusLogsService;
    }
}
