package com.sr.apps.freightbit.customer.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.common.service.ParameterService;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class CustomerAction extends ActionSupport implements Preparable{

    private List<CustomerBean> customers = new ArrayList<CustomerBean>();
    private List<Parameters> customerTypeList = new ArrayList<Parameters>();
    private CustomerBean customer = new CustomerBean();
    private String customerNameParam;

    private CustomerService customerService;
    private ClientService clientService;
    private ParameterService parameterService;

    @Override
    public void prepare(){
        customerTypeList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_TYPE);
    }

    public String customerSearch(){
        return SUCCESS;
    }



    public String customerDeleteExecute(){

        Customer customeEntity = customerService.findCustomerByName(customerNameParam);
        customerService.deleteCustomer(customeEntity);
        return SUCCESS;
    }
    public String customerEdit(){

        Customer customerEntity = customerService.findCustomerByName(customerNameParam);
        customer = transformToFormBean(customerEntity);
        return SUCCESS;
    }

    public String customerEditExecute(){
        validateOnSubmit(customer);
        if(hasActionErrors())
            return INPUT;
        customerService.updateCustomer(transformToEntityBean(customer));
        return SUCCESS;

    }
    public String customerAdd(){
        return SUCCESS;
    }

    public String customerAddExecute() throws Exception {
        validateOnSubmit(customer);
        if (hasFieldErrors())
            return INPUT;
        customerService.addCustomer(transformToEntityBean(customer));
        return SUCCESS;
    }


    public String customerList(){
        List<Customer> customerEntityList = customerService.findAllCustomer(getClientId());
        for(Customer customerElem : customerEntityList){
            customers.add(transformToFormBean(customerElem));
        }
        return SUCCESS;
    }



    private CustomerBean transformToFormBean(Customer entity){

        CustomerBean formBean = new CustomerBean();
        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerName(entity.getCustomerName());
        formBean.setPhone(entity.getPhone());
        formBean.setEmail(entity.getEmail());
        formBean.setWebsite(entity.getWebsite());
        formBean.setFax(entity.getFax());
        formBean.setMobile(entity.getMobile());
        formBean.setCustomerType(entity.getCustomerType());

        return formBean;
    }

    private Customer transformToEntityBean(CustomerBean formBean) {
        Customer entity = new Customer();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
               if (formBean.getCustomerId()!=null)
                     entity.setCustomerId(new Integer(formBean.getCustomerId()));

            entity.setCustomerName(formBean.getCustomerName());
            entity.setCustomerType(formBean.getCustomerType());
            entity.setWebsite(formBean.getWebsite());
            entity.setPhone(formBean.getPhone());
            entity.setMobile(formBean.getMobile());
            entity.setFax(formBean.getFax());
            entity.setEmail(formBean.getEmail());
            entity.setDti(formBean.getDti());
            entity.setMayorsPermit(formBean.getMayorsPermit());
            entity.setAaf(formBean.getAaf());
            entity.setSignatureCard(formBean.getSignatureCard());
            entity.setCreatedBy("ADMIN");

        return entity;
    }
    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public void validateOnSubmit(CustomerBean customerBean) {
        clearErrorsAndMessages();
        if(StringUtils.isBlank(customerBean.getCustomerName())){
            addFieldError("customer.customerName", getText("err.customerName.required"));
        }
        if(StringUtils.isBlank(customerBean.getPhone())){
            addFieldError("customer.phone", getText("err.phone.required"));
        }
        if(StringUtils.isBlank(customerBean.getMobile())){
            addFieldError("customer.mobile", getText("err.mobile.required"));
        }
        if(StringUtils.isBlank(customerBean.getEmail())){
            addFieldError("customer.email", getText("err.email.required"));
        }
    }

    public List<CustomerBean> getCustomers() {
        return customers;
    }

    public void setCustomers(List<CustomerBean> customers) {
        this.customers = customers;
    }

    public List<Parameters> getCustomerTypeList() {
        return customerTypeList;
    }

    public void setCustomerTypeList(List<Parameters> customerTypeList) {
        this.customerTypeList = customerTypeList;
    }

    public CustomerBean getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerBean customer) {
        this.customer = customer;
    }

    public String getCustomerNameParam() {
        return customerNameParam;
    }

    public void setCustomerNameParam(String customerNameParam) {
        this.customerNameParam = customerNameParam;
    }

    public CustomerService getCustomerService() {
        return customerService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public ClientService getClientService() {
        return clientService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }
}
