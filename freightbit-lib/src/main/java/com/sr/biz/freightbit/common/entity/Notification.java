package com.sr.biz.freightbit.common.entity;

import java.io.Serializable;

/**
 * Created by user on 9/29/2014.
 */
public class Notification implements Serializable {
    private Integer notificationId;
    private String description;
    private  String notificationType;
    private Integer referenceId;
    private String referenceTable;
    private Integer userId;

    public Notification(){

    }

    public Notification(Integer notificationId, String description, String notificationType, Integer referenceId, String referenceTable, Integer userId) {
        this.notificationId = notificationId;
        this.description = description;
        this.notificationType = notificationType;
        this.referenceId = referenceId;
        this.referenceTable = referenceTable;
        this.userId = userId;
    }

    public Integer getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(Integer notificationId) {
        this.notificationId = notificationId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
