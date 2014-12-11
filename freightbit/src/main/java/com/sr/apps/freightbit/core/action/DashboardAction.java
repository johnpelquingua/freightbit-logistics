package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DashboardAction extends ActionSupport implements SessionAware {
    private static final Logger log = Logger.getLogger(LoginAction.class);

    private String username;
    private String password;
    private String originCity;
    private List<OrderBean> lclTable = new ArrayList<OrderBean>();
    private Map<String, Object> sessionAttributes = null;
    private List<Parameters> portsList = new ArrayList<Parameters>();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();

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

    private UserService userService;
    private OrderService orderService;
    private OperationsService operationsService;
    private CustomerService customerService;
    private ParameterService parameterService;
    private NotificationService notificationService;
    BigInteger Booking , Customer,User,Vendor, AllNotification ;

    public String home() {

        portsList = parameterService.getParameterMap(ParameterConstants.PORTS);
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

        changeOrigin();

        return SUCCESS;

    }

    public String changeOrigin(){

        portsList = parameterService.getParameterMap(ParameterConstants.PORTS);
        Booking = notificationService.countAll();
        Customer = notificationService.countAllCustomer();
        User = notificationService.countAllUser();
        Vendor = notificationService.countAllVendor();
        AllNotification = notificationService.countAllNotification();

        /*==============================================CODE FOR OPTIMIZATION===========================================*/
        /*==============================================CODE FOR OPTIMIZATION===========================================*/
        /*==============================================CODE FOR OPTIMIZATION===========================================*/

        /*-------------------------------------------BACOLOD-------------------------------------------------*/

        if(originCity == null){
            originCity = "MANILA";
        }

        List<Orders> bacolodOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "BACOLOD");

        bacolodWeight = 0.00; // Loop of per order item weight total
        bacolodVolume = 0.F; // Loop of per order item volume total

        /*for (Orders orderBacolod : bacolodOrders) {

                *//*lclTable.add(transformToOrderFormBean(orderDestination));*//*

            List<OrderItems> bacolodOrderItems = orderService.findAllItemByOrderId(orderBacolod.getOrderId());

            for (OrderItems orderItemBacolod : bacolodOrderItems) {
                bacolodWeight = bacolodWeight + orderItemBacolod.getWeight();
                bacolodVolume = bacolodVolume + orderItemBacolod.getVolume();
            }

        }

            *//*-------------------------------------------BACOLOD-------------------------------------------------*//*

            *//*-------------------------------------------BUTUAN-------------------------------------------------*//*

        List<Orders> butuanOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "BUTUAN");

        butuanWeight = 0.00; // Loop of per order item weight total
        butuanVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : butuanOrders){

            List<OrderItems> butuanOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemButuan : butuanOrderItems){
                butuanWeight = butuanWeight + orderItemButuan.getWeight();
                butuanVolume = butuanVolume + orderItemButuan.getVolume();
            }

        }

            *//*-------------------------------------------BUTUAN-------------------------------------------------*//*

            *//*-------------------------------------------CAGAYAN-------------------------------------------------*//*

        List<Orders> cagayanOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "CAGAYAN");

        cagayanWeight = 0.00; // Loop of per order item weight total
        cagayanVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : cagayanOrders){

            List<OrderItems> cagayanOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemCagayan : cagayanOrderItems){
                cagayanWeight = cagayanWeight + orderItemCagayan.getWeight();
                cagayanVolume = cagayanVolume + orderItemCagayan.getVolume();
            }

        }

            *//*-------------------------------------------CAGAYAN-------------------------------------------------*//*

            *//*-------------------------------------------CEBU-------------------------------------------------*//*

        List<Orders> cebuOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "CEBU");

        cebuWeight = 0.00; // Loop of per order item weight total
        cebuVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : cebuOrders){

            List<OrderItems> cebuOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemCebu : cebuOrderItems){
                cebuWeight = cebuWeight + orderItemCebu.getWeight();
                cebuVolume = cebuVolume + orderItemCebu.getVolume();
            }

        }

            *//*-------------------------------------------CEBU-------------------------------------------------*//*

            *//*-------------------------------------------COTABATO-------------------------------------------------*//*

        List<Orders> cotabatoOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "COTABATO");

        cotabatoWeight = 0.00; // Loop of per order item weight total
        cotabatoVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : cotabatoOrders){

            List<OrderItems> cotabatoOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemCotabato : cotabatoOrderItems){
                cotabatoWeight = cotabatoWeight + orderItemCotabato.getWeight();
                cotabatoVolume = cotabatoVolume + orderItemCotabato.getVolume();
            }

        }

            *//*-------------------------------------------COTABATO-------------------------------------------------*//*

            *//*-------------------------------------------DAVAO-------------------------------------------------*//*

        List<Orders> davaoOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "DAVAO");

        davaoWeight = 0.00; // Loop of per order item weight total
        davaoVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : davaoOrders){

            List<OrderItems> davaoOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemDavao : davaoOrderItems){
                davaoWeight = davaoWeight + orderItemDavao.getWeight();
                davaoVolume = davaoVolume + orderItemDavao.getVolume();
            }

        }
            *//*-------------------------------------------DAVAO-------------------------------------------------*//*

            *//*-------------------------------------------DUMAGUETE-------------------------------------------------*//*

        List<Orders> dumagueteOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "DUMAGUETE");

        dumagueteWeight = 0.00; // Loop of per order item weight total
        dumagueteVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : dumagueteOrders){

            List<OrderItems> dumagueteOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemDumaguete : dumagueteOrderItems){
                dumagueteWeight = dumagueteWeight + orderItemDumaguete.getWeight();
                dumagueteVolume = dumagueteVolume + orderItemDumaguete.getVolume();
            }

        }

            *//*-------------------------------------------DUMAGUETE-------------------------------------------------*//*

            *//*-------------------------------------------GENSAN-------------------------------------------------*//*

        List<Orders> gensanOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "GEN. SANTOS");

        gensanWeight = 0.00; // Loop of per order item weight total
        gensanVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : gensanOrders){

            List<OrderItems> gensanOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemGensan : gensanOrderItems){
                gensanWeight = gensanWeight + orderItemGensan.getWeight();
                gensanVolume = gensanVolume + orderItemGensan.getVolume();
            }

        }

            *//*-------------------------------------------GENSAN-------------------------------------------------*//*

            *//*-------------------------------------------ILIGAN-------------------------------------------------*//*

        List<Orders> iliganOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "ILIGAN");

        iliganWeight = 0.00; // Loop of per order item weight total
        iliganVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : iliganOrders){

            List<OrderItems> iliganOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemIligan : iliganOrderItems){
                iliganWeight = iliganWeight + orderItemIligan.getWeight();
                iliganVolume = iliganVolume + orderItemIligan.getVolume();
            }

        }

            *//*-------------------------------------------ILIGAN-------------------------------------------------*//*

            *//*-------------------------------------------ILOILO-------------------------------------------------*//*

        List<Orders> iloiloOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "ILOILO");

        iloiloWeight = 0.00; // Loop of per order item weight total
        iloiloVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : iloiloOrders){

            List<OrderItems> iloiloOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemIloilo : iloiloOrderItems){
                iloiloWeight = iloiloWeight + orderItemIloilo.getWeight();
                iloiloVolume = iloiloVolume + orderItemIloilo.getVolume();
            }

        }

            *//*-------------------------------------------ILOILO-------------------------------------------------*//*

            *//*-------------------------------------------OZAMIS-------------------------------------------------*//*

        List<Orders> ozamisOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "OZAMIS");

        ozamisWeight = 0.00; // Loop of per order item weight total
        ozamisVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : ozamisOrders){

            List<OrderItems> ozamisOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemOzamis : ozamisOrderItems){
                ozamisWeight = ozamisWeight + orderItemOzamis.getWeight();
                ozamisVolume = ozamisVolume + orderItemOzamis.getVolume();
            }

        }

            *//*-------------------------------------------OZAMIS-------------------------------------------------*//*

            *//*-------------------------------------------PALAWAN-------------------------------------------------*//*

        List<Orders> palawanOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "PALAWAN");

        palawanWeight = 0.00; // Loop of per order item weight total
        palawanVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : palawanOrders){

            List<OrderItems> palawanOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemPalawan : palawanOrderItems){
                palawanWeight = palawanWeight + orderItemPalawan.getWeight();
                palawanVolume = palawanVolume + orderItemPalawan.getVolume();
            }

        }

            *//*-------------------------------------------PALAWAN-------------------------------------------------*//*

            *//*-------------------------------------------ROXAS-------------------------------------------------*//*

        List<Orders> roxasOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "ROXAS");

        roxasWeight = 0.00; // Loop of per order item weight total
        roxasVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : roxasOrders){

            List<OrderItems> roxasOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemRoxas : roxasOrderItems){
                roxasWeight = roxasWeight + orderItemRoxas.getWeight();
                roxasVolume = roxasVolume + orderItemRoxas.getVolume();
            }

        }

            *//*-------------------------------------------ROXAS-------------------------------------------------*//*

            *//*-------------------------------------------TAGBILARAN-------------------------------------------------*//*

        List<Orders> tagbilaranOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "TAGBILARAN");

        tagbilaranWeight = 0.00; // Loop of per order item weight total
        tagbilaranVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : tagbilaranOrders){

            List<OrderItems> tagbilaranOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemTagbilaran : tagbilaranOrderItems){
                tagbilaranWeight = tagbilaranWeight + orderItemTagbilaran.getWeight();
                tagbilaranVolume = tagbilaranVolume + orderItemTagbilaran.getVolume();
            }

        }

            *//*-------------------------------------------TAGBILARAN-------------------------------------------------*//*

            *//*-------------------------------------------TACLOBAN-------------------------------------------------*//*

        List<Orders> taclobanOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "TACLOBAN");

        taclobanWeight = 0.00; // Loop of per order item weight total
        taclobanVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : taclobanOrders){

            List<OrderItems> taclobanOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemTacloban : taclobanOrderItems){
                taclobanWeight = taclobanWeight + orderItemTacloban.getWeight();
                taclobanVolume = taclobanVolume + orderItemTacloban.getVolume();
            }

        }

            *//*-------------------------------------------TACLOBAN-------------------------------------------------*//*

            *//*-------------------------------------------ZAMBOANGA-------------------------------------------------*//*

        List<Orders> zamboangaOrders = operationsService.findOrdersByOriginDestinationStatusTypeLCL(originCity, "ZAMBOANGA");

        zamboangaWeight = 0.00; // Loop of per order item weight total
        zamboangaVolume = 0.F; // Loop of per order item volume total

        for (Orders orderDestination : zamboangaOrders){

            List<OrderItems> zamboangaOrderItems = orderService.findAllItemByOrderId(orderDestination.getOrderId());

            for (OrderItems orderItemZamboanga : zamboangaOrderItems){
                zamboangaWeight = zamboangaWeight + orderItemZamboanga.getWeight();
                zamboangaVolume = zamboangaVolume + orderItemZamboanga.getVolume();
            }

        }*/

            /*-------------------------------------------ZAMBOANGA-------------------------------------------------*/

            /*==============================================CODE FOR OPTIMIZATION===========================================*/
            /*==============================================CODE FOR OPTIMIZATION===========================================*/
            /*==============================================CODE FOR OPTIMIZATION===========================================*/

        return SUCCESS;
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

    public void setBooking(BigInteger Booking) {
        this.Booking = Booking;
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

    public void setSessionAttributes(Map<String, Object> sessionAttributes) {
        this.sessionAttributes = sessionAttributes;
    }

    public List<Parameters> getPortsList() {
        return portsList;
    }

    public void setPortsList(List<Parameters> portsList) {
        this.portsList = portsList;
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

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
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

    public Double getIloiloWeight() {
        return iloiloWeight;
    }

    public void setIloiloWeight(Double iloiloWeight) {
        this.iloiloWeight = iloiloWeight;
    }

    public Float getIloiloVolume() {
        return iloiloVolume;
    }

    public void setIloiloVolume(Float iloiloVolume) {
        this.iloiloVolume = iloiloVolume;
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
}
