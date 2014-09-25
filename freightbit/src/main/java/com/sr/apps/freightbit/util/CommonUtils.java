package com.sr.apps.freightbit.util;

import com.opensymphony.xwork2.ActionContext;
import com.sr.biz.freightbit.core.entity.User;

import java.util.Map;

public class CommonUtils {

    public String getUserNameFromSession() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        User user = (User) sessionAttributes.get("user");
        return user.getUsername();
    }
    
    public User getUser() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        User user = (User) sessionAttributes.get("user");
        return user;
    }
    
    public Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }
    
    /**
     * If commonUtils.getCustomerIdFromSession() != null, then the logged-in user is a customer
     * Else, the logged-in user is not a customer
     * 
     * Example in OrderAction.viewOrders(), you should only display the orders for that customer if the logged-in user is a customer
     * if (commonUtils.getCustomerIdFromSession() != null)
     *    orderEntityList = orderService.findOrdersByCriteria("customerId", order.getCustomerId(), commonUtils.getClientId());
     * @return
     */
    public Integer getCustomerIdFromSession() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        User user = (User) sessionAttributes.get("user");
        return user.getCustomerId();
    }

}