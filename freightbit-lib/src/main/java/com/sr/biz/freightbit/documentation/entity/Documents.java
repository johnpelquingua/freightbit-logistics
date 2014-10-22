package com.sr.biz.freightbit.documentation.entity;

import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */

@Entity
@Table(name = "documents", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "documentId"))
public class Documents implements Serializable {

    private Integer documentId;
    /*private String documentType;*/
    /*private Integer clientId;*/
    private Client client;
    private String documentName;
    private Integer referenceId;
    private String referenceTable;
    private String orderNumber;
    private Date createdDate;
    private String documentStatus;
    private Integer documentProcessed;
    private String referenceNumber;
    private Integer outboundStage;
    private Integer inboundStage;
    private Integer finalOutboundStage;
    private Integer finalInboundStage;
    private Integer archiveStage;
    private Integer billingStage;
    private Date inboundReturned;
    private Date finalOutboundSent;
    private Date finalInboundReturned;
    private String finalOutboundLbc;
    private String finalInboundReceivedBy;
    private String createdBy;
    private String documentComments;

    public Documents() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "documentId", unique = true)
    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    /*@Column(name = "documentType")
    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }*/

    /*@Column(name = "clientId")
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }*/

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId")
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "documentName")
	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	@Column(name = "referenceId")
	public Integer getReferenceId() {
		return referenceId;
	}

	public void setReferenceId(Integer referenceId) {
		this.referenceId = referenceId;
	}

	@Column(name = "referenceTable")
	public String getReferenceTable() {
		return referenceTable;
	}

	public void setReferenceTable(String referenceTable) {
		this.referenceTable = referenceTable;
	}

	@Column(name = "orderNumber")
	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	@Column(name = "createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

    @Column(name = "documentStatus")
    public String getDocumentStatus() {
        return documentStatus;
    }

    public void setDocumentStatus(String documentStatus) {
        this.documentStatus = documentStatus;
    }

    @Column(name = "documentProcessed")
    public Integer getDocumentProcessed() {
        return documentProcessed;
    }

    public void setDocumentProcessed(Integer documentProcessed) {
        this.documentProcessed = documentProcessed;
    }

    @Column(name = "referenceNumber")
    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    @Column(name = "outboundStage")
    public Integer getOutboundStage() {
        return outboundStage;
    }

    public void setOutboundStage(Integer outboundStage) {
        this.outboundStage = outboundStage;
    }

    @Column(name = "inboundStage")
    public Integer getInboundStage() {
        return inboundStage;
    }

    public void setInboundStage(Integer inboundStage) {
        this.inboundStage = inboundStage;
    }

    @Column(name = "finalOutboundStage")
    public Integer getFinalOutboundStage() {
        return finalOutboundStage;
    }

    public void setFinalOutboundStage(Integer finalOutboundStage) {
        this.finalOutboundStage = finalOutboundStage;
    }

    @Column(name = "finalInboundStage")
    public Integer getFinalInboundStage() {
        return finalInboundStage;
    }

    public void setFinalInboundStage(Integer finalInboundStage) {
        this.finalInboundStage = finalInboundStage;
    }

    @Column(name = "archiveStage")
    public Integer getArchiveStage() {
        return archiveStage;
    }

    public void setArchiveStage(Integer archiveStage) {
        this.archiveStage = archiveStage;
    }

    @Column(name = "billingStage")
    public Integer getBillingStage() {
        return billingStage;
    }

    public void setBillingStage(Integer billingStage) {
        this.billingStage = billingStage;
    }

    @Column(name = "inboundReturned")
    public Date getInboundReturned() {
        return inboundReturned;
    }

    public void setInboundReturned(Date inboundReturned) {
        this.inboundReturned = inboundReturned;
    }

    @Column(name = "finalOutboundSent")
    public Date getFinalOutboundSent() {
        return finalOutboundSent;
    }

    public void setFinalOutboundSent(Date finalOutboundSent) {
        this.finalOutboundSent = finalOutboundSent;
    }

    @Column(name = "finalInboundReturned")
    public Date getFinalInboundReturned() {
        return finalInboundReturned;
    }

    public void setFinalInboundReturned(Date finalInboundReturned) {
        this.finalInboundReturned = finalInboundReturned;
    }

    @Column(name = "finalOutboundLbc")
    public String getFinalOutboundLbc() {
        return finalOutboundLbc;
    }

    public void setFinalOutboundLbc(String finalOutboundLbc) {
        this.finalOutboundLbc = finalOutboundLbc;
    }

    @Column(name = "finalInboundReceivedBy")
    public String getFinalInboundReceivedBy() {
        return finalInboundReceivedBy;
    }

    public void setFinalInboundReceivedBy(String finalInboundReceivedBy) {
        this.finalInboundReceivedBy = finalInboundReceivedBy;
    }

    @Column(name = "createdBy")
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "documentComments")
    public String getDocumentComments() {
        return documentComments;
    }

    public void setDocumentComments(String documentComments) {
        this.documentComments = documentComments;
    }
}
