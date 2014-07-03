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

}