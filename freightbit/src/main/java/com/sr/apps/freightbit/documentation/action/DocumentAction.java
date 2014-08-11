package com.sr.apps.freightbit.documentation.action;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 8/8/14
 * Time: 10:19 AM
 * To change this template use File | Settings | File Templates.
 */

import com.opensymphony.xwork2.ActionSupport;


public class DocumentAction extends ActionSupport {

    public String viewArchivedDocuments() {
        return SUCCESS;
    }

    public String viewPendingDocuments() {
        return SUCCESS;
    }

    public String viewPlainDocuments() {
        return SUCCESS;
    }




}
