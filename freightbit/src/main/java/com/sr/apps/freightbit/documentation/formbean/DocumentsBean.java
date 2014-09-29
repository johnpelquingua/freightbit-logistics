package com.sr.apps.freightbit.documentation.formbean;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 8/8/14
 * Time: 10:21 AM
 * To change this template use File | Settings | File Templates.
 */
public class DocumentsBean {
    private Integer documentId;
    private String documentType;
    private Integer clientId;
    private String documentName;
    private Integer referenceId;
    private String referenceTable;
    private String orderNumber;
    private Date createdDate;

    private Integer documentIdParam;
    private Integer orderIdParam;

    public DocumentsBean() {
    }

    public DocumentsBean(Integer documentId, String documentType, Integer clientId, String documentName, Integer referenceId, String referenceTable, String orderNumber, Date createdDate, Integer documentIdParam, Integer orderIdParam) {
        this.documentId = documentId;
        this.documentType = documentType;
        this.clientId = clientId;
        this.documentName = documentName;
        this.referenceId = referenceId;
        this.referenceTable = referenceTable;
        this.orderNumber = orderNumber;
        this.createdDate = createdDate;
        this.documentIdParam = documentIdParam;
        this.orderIdParam = orderIdParam;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public Integer getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(Integer referenceId) {
        this.referenceId = referenceId;
    }

    public String getReferenceTable() {
        return referenceTable;
    }

    public void setReferenceTable(String referenceTable) {
        this.referenceTable = referenceTable;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getDocumentIdParam() {
        return documentIdParam;
    }

    public void setDocumentIdParam(Integer documentIdParam) {
        this.documentIdParam = documentIdParam;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }
}
