package com.sr.apps.freightbit.customer.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.customer.formbean.ConsigneeBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.customer.formbean.ItemBean;
import com.sr.apps.freightbit.customer.formbean.RatesBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Rates;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.customer.service.ItemService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class CustomerAction extends ActionSupport implements Preparable {

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(CustomerAction.class);

    private List<CustomerBean> customers = new ArrayList<CustomerBean>();
    private List<AddressBean> addresss = new ArrayList<AddressBean>();
    private List<ItemBean> items = new ArrayList<ItemBean>();
    private List<RatesBean> rates = new ArrayList<RatesBean>();
    private List<ContactBean> contacts = new ArrayList<ContactBean>();
    private List<ConsigneeBean> consignees = new ArrayList<ConsigneeBean>();

    private List<Parameters> customerTypeList = new ArrayList<Parameters>();
    private List<Parameters> customerSearchList = new ArrayList<Parameters>();
    private List<Parameters> addressTypeList = new ArrayList<Parameters>();
    private List<Parameters> rateTypeList = new ArrayList<Parameters>();
    private List<Parameters> contactTypeList = new ArrayList<Parameters>();

    private Integer customersItemIdParam;
    private String customerCodeParam;
    private Integer addressIdParam;
    private String keyword; //search keyword for customer
    private String searchType; // get the search type
    private String customerKeyword;
    private Integer ratesIdParam;
    private Integer contactCodeParam;

    private CustomerBean customer = new CustomerBean();
    private ItemBean item = new ItemBean();
    private AddressBean address = new AddressBean();
    private RatesBean rate = new RatesBean();
    private ContactBean contact = new ContactBean();
    private ConsigneeBean consignee = new ConsigneeBean();

    private CustomerService itemService;
    private ItemService itemServices;
    private CustomerService customerService;
    private ClientService clientService;
    private ParameterService parameterService;
    private CommonUtils commonUtils;

    @Override
    public void prepare() {
        addressTypeList = parameterService.getParameterMap(ParameterConstants.ADDRESS_TYPE);
        customerTypeList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_TYPE);
        customerSearchList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_SEARCH);
        rateTypeList = parameterService.getParameterMap(ParameterConstants.RATES_TYPE);
        contactTypeList = parameterService.getParameterMap(ParameterConstants.CONTACT_TYPE);
    }

    public Integer getCustomerSessionId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer customerId = (Integer) sessionAttributes.get("customerId");
        return customerId;
    }


    ////// START OF ITEMS ///////////////

    public String addItem() throws Exception {
        validateOnSubmitItem(item);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.addItem(transformToEntityBeanItem(item));
        return SUCCESS;
    }

    public String editItem() {
        validateOnSubmitItem(item);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.updateItems(transformToEntityBeanItem(item));
        return SUCCESS;
    }

    public String loadAddItem() {
        return SUCCESS;
    }

    public String loadEditItem() {
        Items itemEntity = customerService.findItemByCustomerItemsId(customersItemIdParam);
        item = transformToFormBeanItem(itemEntity);
        return SUCCESS;
    }

    public String loadSaveCompleteItem() {
        Integer customerId = getCustomerSessionId();
        List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
        for (Items itemsElem : itemEntityList) {
            items.add(transformToFormBeanItem(itemsElem));
        }
        return SUCCESS;
    }

    public void validateOnSubmitItem(ItemBean itemBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(itemBean.getItemName())) {
            addFieldError("item.itemName", getText("err.itemName.required"));
        }
        if (StringUtils.isBlank(itemBean.getItemCode())) {
            addFieldError("item.itemCode", getText("err.itemCode.required"));
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
        if (itemBean.getCriticalQuality() == null) {
            addFieldError("item.criticalQuality", getText("err.criticalQuality.required"));
        }
        if (itemBean.getBasePrice() == null) {
            addFieldError("item.basePrice", getText("err.basePrice.required"));
        }
        if (StringUtils.isBlank(itemBean.getDescription())) {
            addFieldError("item.description", getText("err.description.required"));
        }
    }

    public String deleteItem() {
        Items itemEntity = customerService.findItemByCustomerItemsId(customersItemIdParam);
        customerService.deleteItem(itemEntity);
        return SUCCESS;
    }

    public String viewItems() {
        Integer customerId = getCustomerSessionId();
        List<Items> itemEntityList = customerService.findItemByCustomerId(customerId);
        for (Items itemsElem : itemEntityList) {
            items.add(transformToFormBeanItem(itemsElem));
        }
        return SUCCESS;
    }

    public ItemBean transformToFormBeanItem(Items entity) {

        ItemBean formBean = new ItemBean();
        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerItemsId(entity.getCustomerItemsId());
        formBean.setCriticalQuality(entity.getCriticalQuality());
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

    public Items transformToEntityBeanItem(ItemBean formBean) {

        Items entity = new Items();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (formBean.getCustomerItemsId() != null)
            entity.setCustomerItemsId(new Integer(formBean.getCustomerItemsId()));

        entity.setItemName(formBean.getItemName());
        entity.setItemCode(formBean.getItemCode());
        entity.setCustomerId(getCustomerSessionId());
        entity.setSrp(formBean.getSrp());
        entity.setLength(formBean.getLength());
        entity.setWidth(formBean.getWidth());
        entity.setHeight(formBean.getHeight());
        entity.setCriticalQuality(formBean.getCriticalQuality());
        entity.setBasePrice(formBean.getBasePrice());
        entity.setNote(formBean.getNote());
        entity.setDescription(formBean.getDescription());
        entity.setCreatedBy(getClientId().toString());
        entity.setModifiedBy(getClientId().toString());

        return entity;
    }


    //////////// END OF ITEMS //////////////


    public String loadSearchCustomerPage() {
        return SUCCESS;
    }

    public String customerInfo() {
        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customer = transformToFormBean(customerEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("customerId", customer.getCustomerId());

        return SUCCESS;

    }


    ////// START OF CUSTOMER ///////////////

    public String loadAddCustomerPage() {
        return SUCCESS;
    }

    public String loadEditCustomerPage() {
        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customer = transformToFormBean(customerEntity);
        return SUCCESS;
    }

    public String loadSaveCompletePage() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        return SUCCESS;
    }

    public String customerSearchExecute() {
        String column = getColumnFilter();
        List<Customer> customerEntityList = new ArrayList<Customer>();

        if (StringUtils.isNotBlank(column)) {
            customerEntityList = customerService.findCustomersByCriteria(column, customer.getCustomerKeyword(), getClientId());

        } else {
            customerEntityList = customerService.findAllCustomer();
        }

        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }

        return SUCCESS;
    }

    public String getColumnFilter() {
        String column = "";
        if ("customerName".equals(customer.getCustomerSearchCriteria())) {
            column = "customerName";
        } else if ("customerCode".equals(customer.getCustomerSearchCriteria())) {
            column = "customerCode";
        } else if ("customerType".equals(customer.getCustomerSearchCriteria())) {
            column = "customerType";
        } else if ("email".equals(customer.getCustomerSearchCriteria())) {
            column = "email";
        }
        return column;
    }

    public String customerDeleteExecute() {

        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customerService.deleteCustomer(customerEntity);
        return SUCCESS;
    }

    public String customerEdit() {

        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
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

    public String customerAddExecute() throws Exception {
        validateOnSubmit(customer);
        if (hasFieldErrors())
            return INPUT;
        Integer customerId = customerService.addCustomer(transformToEntityBean(customer));
        /*Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("customerId", customerId);*/

        return SUCCESS;
    }

    public String customerList() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        return SUCCESS;
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

    ////// END OF ITEMS ///////////////

    //address
    public String addAddress() throws Exception {
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.addAddress(transformToEntityBeanAddress(address));
        return SUCCESS;
    }

    public String editAddress() {
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.updateAddress(transformToEntityBeanAddress(address));
        return SUCCESS;
    }

    public String deleteAddress() {
        Address addressEntity = customerService.findAddressById(addressIdParam);
        customerService.deleteAddress(addressEntity);
        return SUCCESS;
    }

    public String loadAddAddress() {
        return SUCCESS;
    }

    public String loadSaveCompleteAddress() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressEntityList = new ArrayList<Address>();
        addressEntityList = customerService.findAllAddressByRefId(customerId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }
        return SUCCESS;
    }

    public String loadEditAddress() {
        Address addressEntity = customerService.findAddressById(addressIdParam);
        address = transformToFormBeanAddress(addressEntity);
        return SUCCESS;
    }

    public String viewAddress() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressEntityList = new ArrayList<Address>();
        addressEntityList = customerService.findAllAddressByRefId(customerId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }
        return SUCCESS;
    }

    public void validateOnSubmitAddress(AddressBean addressBean) {
        clearErrorsAndMessages();
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getAddressLine1())) {
            addFieldError("address.addressLine1", getText("err.addressLine1.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getCity())) {
            addFieldError("address.city", getText("err.city.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getState())) {
            addFieldError("address.state", getText("err.state.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getZip())) {
            addFieldError("address.zip", getText("err.zip.required"));
        }
    }

    public AddressBean transformToFormBeanAddress(Address entity) {
        AddressBean formBean = new AddressBean();

        formBean.setAddressId(entity.getAddressId());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setAddressLine1(entity.getAddressLine1());
        formBean.setAddressLine2(entity.getAddressLine2());
        formBean.setAddressType(entity.getAddressType());
        formBean.setCity(entity.getCity());
        formBean.setState(entity.getState());
        formBean.setZip(entity.getZip());
        return formBean;
    }

    public Address transformToEntityBeanAddress(AddressBean formBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getAddressId() != null) {
            entity.setAddressId(formBean.getAddressId());
        }

        Integer customerId = getCustomerSessionId();

        entity.setReferenceTable("CUSTOMER");
        entity.setReferenceId(customerId);
        entity.setAddressLine1(formBean.getAddressLine1());
        entity.setAddressLine2(formBean.getAddressLine2());
        entity.setAddressType(formBean.getAddressType());
        entity.setCity(formBean.getCity());
        entity.setState(formBean.getState());
        entity.setZip(formBean.getZip());
        entity.setCreatedTimestamp(new Date());
        entity.setCreatedBy("admin");
        entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy("admin");

        return entity;
    }

    //rates

    public String addRates() throws Exception {
        validateOnSubmitRates(rate);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.addRate(transformToEntityBeanRates(rate));
        return SUCCESS;
    }

    public String editRates() {
        validateOnSubmitRates(rate);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.updateRate(transformToEntityBeanRates(rate));
        return SUCCESS;
    }

    public String deleteRates() {
        Rates rateEntity = customerService.findRateById(ratesIdParam);
        customerService.deleteRate(rateEntity);
        return SUCCESS;
    }

    public String viewRates() {
        Integer customerId = getCustomerSessionId();
        List<Rates> ratesEntityList = new ArrayList<Rates>();
        ratesEntityList = customerService.findAllRatesByCustomerId(customerId);
        for (Rates ratesElem : ratesEntityList) {
            rates.add(transformToFormBeanRates(ratesElem));
        }
        return SUCCESS;
    }

    public String loadAddRates() {
        return SUCCESS;
    }

    public String loadEditRates() {
        Rates ratesEntity = customerService.findRateById(ratesIdParam);
        rate = transformToFormBeanRates(ratesEntity);
        return SUCCESS;
    }

    public String loadSaveCompleteRates() {
        Integer customerId = getCustomerSessionId();
        List<Rates> ratesEntityList = new ArrayList<Rates>();
        ratesEntityList = customerService.findAllRatesByCustomerId(customerId);
        for (Rates ratesElem : ratesEntityList) {
            rates.add(transformToFormBeanRates(ratesElem));
        }
        return SUCCESS;
    }

    public void validateOnSubmitRates(RatesBean ratesBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(ratesBean.getOrigin())) {
            addFieldError("rates.origin", getText("err.origin.required"));
        }
        if (StringUtils.isBlank(ratesBean.getDestination())) {
            addFieldError("rates.destination", getText("err.destination.required"));
        }
        if (ratesBean.getRate() == null) {
            addFieldError("rates.rate", getText("err.rate.required"));
        }
    }

    public RatesBean transformToFormBeanRates(Rates entity) {
        RatesBean formBean = new RatesBean();

        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerRateId(entity.getCustomerRateId());
        formBean.setOrigin(entity.getOrigin());
        formBean.setDestination(entity.getDestination());
        formBean.setRate(entity.getRate());
        formBean.setRateType(entity.getRateType());

        return formBean;
    }

    public Rates transformToEntityBeanRates(RatesBean formBean) {
        Rates entity = new Rates();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getCustomerRateId() != null) {
            entity.setCustomerRateId(formBean.getCustomerRateId());
        }

        Integer customerId = getCustomerSessionId();

        entity.setCustomerId(customerId);
        entity.setOrigin(formBean.getOrigin());
        entity.setDestination(formBean.getDestination());
        entity.setRate(formBean.getRate());
        entity.setRateType(formBean.getRateType());
        entity.setCreatedBy("admin");
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedBy("admin");
        entity.setModifiedTimestamp(new Date());

        return entity;
    }

    ////// BEGIN OF CONTACTS ///////////////

    public String loadAddContact() {
        return SUCCESS;
    }

    public String loadEditContact() {
        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        contact = transformToFormBeanContacts(contactEntity);
        return SUCCESS;
    }

    public String addContact() throws Exception {
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        try {
            customerService.addContact(transformToEntityBeanContacts(contact));
        } catch (ContactAlreadyExistsException e) {
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String editContact() {
        validateOnSubmitContact(contact);
        if (hasFieldErrors()) {
            return INPUT;
        }
        try {
            Contacts contactEntity = transformToEntityBeanContacts(contact);
            contactEntity.setModifiedBy(commonUtils.getUserNameFromSession());
            customerService.updateContact(contactEntity);
        } catch (ContactAlreadyExistsException e) {
            addFieldError("contact.lastName", getText("err.contact.already.exists"));
            return INPUT;
        }
        return SUCCESS;
    }

    public String deleteContact() {

        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        customerService.deleteContact(contactEntity);
        return SUCCESS;
    }


    public String viewContacts() {
        Integer customerId = getCustomerSessionId();
        List<Contacts> contactEntityList = new ArrayList<Contacts>();
        contactEntityList = customerService.findContactByReferenceId(customerId);
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }
        return SUCCESS;
    }

    public String loadSaveCompleteContacts() {
        Integer customerId = getCustomerSessionId();
        List<Contacts> contactEntityList = new ArrayList<Contacts>();
        contactEntityList = customerService.findContactByReferenceId(customerId);
        for (Contacts contactElem : contactEntityList) {
            contacts.add(transformToFormBeanContacts(contactElem));
        }
        return SUCCESS;
    }

    private Contacts transformToEntityBeanContacts(ContactBean contactBean) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        if (contactBean.getContactId() != null) {
            entity.setContactId(contactBean.getContactId());
        }
        System.out.println(commonUtils.getUserNameFromSession());
        Integer customerId = getCustomerSessionId();
        entity.setReferenceId(customerId);
        entity.setReferenceTable("CUSTOMER");
        entity.setContactType(contactBean.getContactType());
        entity.setFirstName(contactBean.getFirstName());
        entity.setMiddleName(contactBean.getMiddleName());
        entity.setLastName(contactBean.getLastName());
        entity.setPhone(contactBean.getPhone());
        entity.setMobile(contactBean.getMobile());
        entity.setFax(contactBean.getFax());
        entity.setEmail(contactBean.getEmail());
        entity.setCreatedTimestamp(new Date());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());

        return entity;
    }


    private ContactBean transformToFormBeanContacts(Contacts entity) {
        ContactBean formBean = new ContactBean();

        formBean.setContactId(entity.getContactId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setContactType(entity.getContactType());
        formBean.setFirstName(entity.getFirstName());
        formBean.setMiddleName(entity.getMiddleName());
        formBean.setLastName(entity.getLastName());
        formBean.setPhone(entity.getPhone());
        formBean.setMobile(entity.getMobile());
        formBean.setFax(entity.getFax());
        formBean.setEmail(entity.getEmail());
        return formBean;
    }

    public void validateOnSubmitContact(ContactBean contactBean) {
        clearErrorsAndMessages();

        if (org.apache.commons.lang.StringUtils.isBlank(contactBean.getLastName())) {
            addFieldError("contact.lastName", getText("err.lastNameContact.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(contactBean.getFirstName())) {
            addFieldError("contact.firstName", getText("err.firstNameContact.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(contactBean.getMiddleName())) {
            addFieldError("contact.middleName", getText("err.middleNameContact.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(contactBean.getPhone())) {
            addFieldError("contact.phone", getText("err.phoneContact.required"));
        }
    }

    ////// END OF CONTACTS ///////////////


    //consignee

    public String addConsignee() {
        validateOnSubmitConsignee(consignee);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.addConsignee(transformContactToEntityBean(consignee), transformAddressToEntityBean(consignee));
        return SUCCESS;
    }

    public String editConsignee() {
        validateOnSubmitConsignee(consignee);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.updateConsignee(transformContactToEntityBean(consignee), transformAddressToEntityBean(consignee));
        return SUCCESS;
    }

    public String deleteConsignee() {
        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        customerService.deleteConsignee(contactEntity, addressEntity);
        return SUCCESS;
    }

    public String loadAddConsignee() {
        return SUCCESS;
    }

    public String loadEditConsignee() {
        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity);
        return SUCCESS;
    }

    public String loadSaveCompleteConsignee() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressList = new ArrayList<Address>();
        List<Contacts> contactsList = new ArrayList<Contacts>();
        addressList = customerService.findAddressByParameterMap(customerId, "CONSIGNEE", getClientId());
        contactsList = customerService.findContactByParameterMap(customerId, "CONSIGNEE", getClientId());
        if (contactsList != null && addressList != null) {
            for (Integer i = 0; i < addressList.size() && i < contactsList.size(); i++) {
                consignees.add(transformToFormBeanConsignee(addressList.get(i), contactsList.get(i)));
            }
        }
        return SUCCESS;
    }

    public String viewConsignees() {
        Integer customerId = getCustomerSessionId();
        List<Contacts> contactsList = new ArrayList<Contacts>();
        contactsList = customerService.findContactByParameterMap(customerId, "CONSIGNEE", getClientId());
        if (contactsList != null) {
            for (int i = 0; i < contactsList.size(); i++) {
                Contacts contactConsignee = contactsList.get(i);
                Address addressConsignee = customerService.findAddressByParameterMap(customerId, "CONSIGNEE", getClientId(), contactConsignee.getContactId());
                consignees.add(transformToFormBeanConsignee(addressConsignee, contactConsignee));
            }
        }
        return SUCCESS;
    }

    public String consigneeInfo() {
        Contacts contactEntity = customerService.findContactById(contactCodeParam);
        Address addressEntity = customerService.findAddressById(addressIdParam);
        consignee = transformToFormBeanConsignee(addressEntity, contactEntity);
        return SUCCESS;
    }

    public void validateOnSubmitConsignee(ConsigneeBean consigneeBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(consigneeBean.getLastName())) {
            addFieldError("consignee.lastName", getText("err.lastNameContact.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getFirstName())) {
            addFieldError("consignee.firstName", getText("err.firstNameContact.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getPhone())) {
            addFieldError("consignee.phone", getText("err.phoneContact.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getAddressLine1())) {
            addFieldError("consignee.addressLine1", getText("err.addressLine1.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getCity())) {
            addFieldError("consignee.city", getText("err.city.required"));
        }
        if (StringUtils.isBlank(consigneeBean.getZip())) {
            addFieldError("consignee.zip", getText("err.zip.required"));
        }
    }

    public Address transformAddressToEntityBean(ConsigneeBean formBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getAddressId() != null) {
            entity.setAddressId(formBean.getAddressId());
        }

        Integer customerId = getCustomerSessionId();

        entity.setReferenceTable("CUSTOMERS");
        entity.setReferenceId(customerId);
        entity.setAddressLine1(formBean.getAddressLine1());
        entity.setAddressLine2(formBean.getAddressLine2());
        entity.setAddressType("CONSIGNEE");
        entity.setCity(formBean.getCity());
        entity.setState(formBean.getState());
        entity.setZip(formBean.getZip());
        entity.setCreatedTimestamp(new Date());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy("admin");

        return entity;
    }

    public Contacts transformContactToEntityBean(ConsigneeBean formBean) {
        Contacts entity = new Contacts();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (formBean.getContactId() != null) {
            entity.setContactId(formBean.getContactId());
        }

        Integer customerId = getCustomerSessionId();

        entity.setReferenceTable("CUSTOMERS");
        entity.setContactType("CONSIGNEE");
        entity.setReferenceId(customerId);
        entity.setFirstName(formBean.getFirstName());
        entity.setMiddleName(formBean.getMiddleName());
        entity.setLastName(formBean.getLastName());
        entity.setPhone(formBean.getPhone());
        entity.setMobile(formBean.getMobile());
        entity.setEmail(formBean.getEmail());
        entity.setFax(formBean.getFax());
        entity.setCreatedTimestamp(new Date());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy("admin");

        return entity;
    }

    public ConsigneeBean transformToFormBeanConsignee(Address address, Contacts contact) {
        ConsigneeBean formBean = new ConsigneeBean();

        formBean.setFirstName(contact.getFirstName());
        formBean.setMiddleName(contact.getMiddleName());
        formBean.setLastName(contact.getLastName());
        formBean.setPhone(contact.getPhone());
        formBean.setMobile(contact.getMobile());
        formBean.setEmail(contact.getEmail());
        formBean.setContactId(contact.getContactId());
        formBean.setFax(contact.getFax());

        formBean.setAddressLine1(address.getAddressLine1());
        formBean.setAddressLine2(address.getAddressLine2());
        formBean.setCity(address.getCity());
        formBean.setState(address.getState());
        formBean.setZip(address.getZip());
        formBean.setAddressId(address.getAddressId());


        return formBean;
    }

    //utils
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


    public Integer getCustomersItemIdParam() {
        return customersItemIdParam;
    }

    public void setCustomersItemIdParam(Integer customersItemIdParam) {
        this.customersItemIdParam = customersItemIdParam;
    }

    public void setItemService(CustomerService itemService) {
        this.itemService = itemService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
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

    public String getCustomerCodeParam() {
        return customerCodeParam;
    }

    public void setCustomerCodeParam(String customerCodeParam) {
        this.customerCodeParam = customerCodeParam;
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

    public String getCustomerKeyword() {
        return customerKeyword;
    }

    public void setCustomerKeyword(String customerKeyword) {
        this.customerKeyword = customerKeyword;
    }

    public AddressBean getAddress() {
        return address;
    }

    public void setAddress(AddressBean address) {
        this.address = address;
    }

    public List<AddressBean> getAddresss() {
        return addresss;
    }

    public void setAddresss(List<AddressBean> addresss) {
        this.addresss = addresss;
    }

    public Integer getAddressIdParam() {
        return addressIdParam;
    }

    public void setAddressIdParam(Integer addressIdParam) {
        this.addressIdParam = addressIdParam;
    }

    public List<Parameters> getAddressTypeList() {
        return addressTypeList;
    }

    public void setAddressTypeList(List<Parameters> addressTypeList) {
        this.addressTypeList = addressTypeList;
    }

    public List<Parameters> getRateTypeList() {
        return rateTypeList;
    }

    public void setRateTypeList(List<Parameters> rateTypeList) {
        this.rateTypeList = rateTypeList;
    }

    public List<RatesBean> getRates() {
        return rates;
    }

    public void setRates(List<RatesBean> rates) {
        this.rates = rates;
    }

    public Integer getRatesIdParam() {
        return ratesIdParam;
    }

    public void setRatesIdParam(Integer ratesIdParam) {
        this.ratesIdParam = ratesIdParam;
    }

    public RatesBean getRate() {
        return rate;
    }

    public void setRate(RatesBean rate) {
        this.rate = rate;
    }

    public List<ContactBean> getContacts() {
        return contacts;
    }

    public void setContacts(List<ContactBean> contacts) {
        this.contacts = contacts;
    }

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
    }

    public List<ConsigneeBean> getConsignees() {
        return consignees;
    }

    public void setConsignees(List<ConsigneeBean> consignees) {
        this.consignees = consignees;
    }

    public ConsigneeBean getConsignee() {
        return consignee;
    }

    public void setConsignee(ConsigneeBean consignee) {
        this.consignee = consignee;
    }

    public Integer getContactCodeParam() {
        return contactCodeParam;
    }

    public void setContactCodeParam(Integer contactCodeParam) {
        this.contactCodeParam = contactCodeParam;
    }

    public List<Parameters> getContactTypeList() {
        return contactTypeList;
    }

    public void setContactTypeList(List<Parameters> contactTypeList) {
        this.contactTypeList = contactTypeList;
    }

    public CommonUtils getCommonUtils() {
        return commonUtils;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }
}