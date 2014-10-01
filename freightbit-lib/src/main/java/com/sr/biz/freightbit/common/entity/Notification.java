package com.sr.biz.freightbit.common.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by user on 9/29/2014.
 */

@Entity
@Table(name = "notification"
        , catalog = "freightbit")

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


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "notificationId", unique = true, nullable = false)
    public Integer getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(Integer notificationId) {
        this.notificationId = notificationId;
    }

    @Column(name = "description", nullable = false)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "notificationType", nullable = false)
    public String getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }

    @Column(name = "referenceId", nullable = true)
    public Integer getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(Integer referenceId) {
        this.referenceId = referenceId;
    }

    @Column(name = "referenceTable", nullable = false)
    public String getReferenceTable() {
        return referenceTable;
    }

    public void setReferenceTable(String referenceTable) {
        this.referenceTable = referenceTable;
    }

    @Column(name = "userId", nullable = false)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
