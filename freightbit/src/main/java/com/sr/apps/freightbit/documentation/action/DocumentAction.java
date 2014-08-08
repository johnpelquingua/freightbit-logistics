package com.sr.apps.freightbit.documentation.action;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 8/8/14
 * Time: 10:19 AM
 * To change this template use File | Settings | File Templates.
 */

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
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.entity.Rates;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.customer.service.ItemService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class DocumentAction extends ActionSupport implements Preparable {

    private List<CustomerBean> customers = new ArrayList<CustomerBean>();
    private List<AddressBean> addresss = new ArrayList<AddressBean>();
    private List<ItemBean> items = new ArrayList<ItemBean>();
    private List<RatesBean> rates = new ArrayList<RatesBean>();
    private List<ContactBean> contacts = new ArrayList<ContactBean>();
    private List<ConsigneeBean> consignees = new ArrayList<ConsigneeBean>();

    @Override
    public void prepare(){

    }


}
