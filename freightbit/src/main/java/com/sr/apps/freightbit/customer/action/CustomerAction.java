package com.sr.apps.freightbit.customer.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.customer.formbean.ItemBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.common.service.ParameterService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class CustomerAction extends ActionSupport implements Preparable {

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(CustomerAction.class);

    private List<CustomerBean> customers = new ArrayList<CustomerBean>();
    private List<ItemBean> items = new ArrayList<ItemBean>();
    private List<Parameters> customerTypeList = new ArrayList<Parameters>();
    private List<Parameters> customerSearchList = new ArrayList<Parameters>();

    private Integer customerIdParam;
    private String keyword; //search keyword for customer
    private String searchType; // get the search type

    private CustomerBean customer = new CustomerBean();
    private ItemBean item = new ItemBean();

    private CustomerService itemService;
    private CustomerService customerService;
    private ClientService clientService;
    private ParameterService parameterService;

    @Override
    public void prepare() {

        customerTypeList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_TYPE);
        customerSearchList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_SEARCH);
    }

    public Integer getCustomerSessionId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer customerId = (Integer) sessionAttributes.get("customerId");
        return customerId;
    }


    ////// START OF ITEMS ///////////////


    public String customerAddItems() {
        return SUCCESS;
    }

    public String customerAddItemExecute() throws Exception {
        itemService.addItem(transformItemToEntityBean(item));
        return SUCCESS;
    }

    //////////// END OF ITEMS //////////////


    public String customerSearch() {
        return SUCCESS;
    }

    public String customerInfo() {

        Customer customerEntity = customerService.findCustomerById(customerIdParam);
        customer = transformToFormBean(customerEntity);
        return SUCCESS;
    }


    ////// START OF CUSTOMER ///////////////

    public String customerSearchExecute() {
        if (searchType.equals("customerName")) {
            List<Customer> customerEntityList = customerService.findCustomerByName(keyword);
            for (Customer customerElem : customerEntityList) {
                customers.add(transformToFormBean(customerElem));
            }
        } else if (searchType.equals("customerId")) {

            Customer customerEntity = customerService.findCustomerById(Integer.parseInt(keyword));
            customers.add(transformToFormBean(customerEntity));

        } else if (searchType.equals("customerType")) {
            List<Customer> customerEntityList = customerService.findCustomerByType(keyword);
            for (Customer customerElem : customerEntityList) {
                customers.add(transformToFormBean(customerElem));
            }

        } else if (searchType.equals("email")) {
            Customer customerEntityList = customerService.findCustomerByEmail(keyword);
            customers.add(transformToFormBean(customerEntityList));
        }
        System.out.print(searchType);
        return SUCCESS;
    }

    public String customerDeleteExecute() {

        Customer customeEntity = customerService.findCustomerById(customerIdParam);
        customerService.deleteCustomer(customeEntity);
        return SUCCESS;
    }

    public String customerEdit() {

        Customer customerEntity = customerService.findCustomerById(customerIdParam);
        customer = transformToFormBean(customerEntity);
        return SUCCESS;
    }

    public String customerEditExecute() {
        validateOnSubmit(customer);
        if (hasActionErrors())
            return INPUT;
        customerService.updateCustomer(transformToEntityBean(customer));
        return SUCCESS;

    }

    public String customerAdd() {
        return SUCCESS;
    }

    public String customerAddExecute() throws Exception {
        validateOnSubmit(customer);
        if (hasFieldErrors())
            return INPUT;
        customerService.addCustomer(transformToEntityBean(customer));
        return SUCCESS;
    }

    public String customerList() {
        List<Customer> customerEntityList = customerService.findAllCustomer(getClientId());
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        return SUCCESS;
    }

    ////// END OF ITEMS ///////////////

    public ItemBean transformItemToFormBean(Items entity) {

        ItemBean formBean = new ItemBean();

        formBean.setItemCode(entity.getItemCode());
        formBean.setItemName(entity.getItemName());
        formBean.setSrp(entity.getSrp());
        formBean.setLength(entity.getLength());
        formBean.setWidth(entity.getWidth());
        formBean.setHeight(entity.getHeight());
        formBean.setBasePrice(entity.getBasePrice());
        formBean.setNote(entity.getNote());
        formBean.setDescription(entity.getDescription());

        return formBean;

    }

    public Items transformItemToEntityBean(ItemBean formBean) {

        Items entity = new Items();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (formBean.getCustomerItemsId() != null)
            entity.setCustomerItemsId(new Integer(formBean.getCustomerItemsId()));

        entity.setItemName("test");
        entity.setItemCode("test123");
        entity.setCustomerId(7);
        entity.setSrp(141.00);
        entity.setLength(11);
        entity.setWidth(11);
        entity.setHeight(11);
        entity.setCriticalQuality(11);
        entity.setBasePrice(110.00);
        entity.setNote("awagaea");
        entity.setDescription("afafaefafaf");
        entity.setCreatedBy(getClientId().toString());
        entity.setModifiedBy(getClientId().toString());

        return entity;
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

        return formBean;
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
        entity.setCreatedBy(getClientId().toString());
        entity.setModifiedBy(getClientId().toString());

        return entity;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public void validateOnSubmit(CustomerBean customerBean) {
        clearErrorsAndMessages();
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

    public Integer getCustomerIdParam() {
        return customerIdParam;
    }

    public void setCustomerIdParam(Integer customerIdParam) {
        this.customerIdParam = customerIdParam;
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
}