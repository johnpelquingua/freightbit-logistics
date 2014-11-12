<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="panel-body">

    <div class="well">
        <div class="container">

            <s:form action="addReferenceNumberInbound" theme="bootstrap">
                <div class="form-group">
                    <label class="col-lg-2 control-label" style="text-align: right;">Document Name</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;" value="%{document.documentName}" disabled="true"></s:textfield>
                    </div>
                    <label class="col-lg-2 control-label" style="text-align: right;">Vendor</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;" value="%{document.vendorCode}" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label" style="clear:both; text-align: right;">Reference Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-4" >
                            <%--<s:property value="%{document.documentId}" />
                            <s:property value="%{document.documentName}" />
                            <s:property value="%{document.referenceId}" />
                            <s:property value="%{document.archiveStage}" />--%>
                        <s:hidden name="document.documentId" value="%{document.documentId}" />
                        <s:hidden name="document.documentName" value="%{document.documentName}" id="documentName" />
                        <s:hidden name="document.referenceId" value="%{document.referenceId}" />
                        <s:hidden name="document.referenceTable" value="%{document.referenceTable}" />
                        <s:hidden name="document.orderNumber" value="%{document.orderNumber}" />
                        <s:hidden name="document.documentProcessed" value="%{document.documentProcessed}" />
                        <s:hidden name="document.outboundStage" value="%{document.outboundStage}" />
                        <s:hidden name="document.inboundStage" value="%{document.inboundStage}" />
                        <s:hidden name="document.finalOutboundStage" value="%{document.finalOutboundStage}" />
                        <s:hidden name="document.finalInboundStage" value="%{document.finalInboundStage}" />
                        <s:hidden name="document.archiveStage" value="%{document.archiveStage}" />
                        <s:hidden name="document.inboundReturned" value="%{document.inboundReturned}" />
                        <s:hidden name="document.createdBy" value="%{document.createdBy}" />
                        <s:hidden name="document.orderItemId" value="%{document.orderItemId}" />
                        <s:if test="document.documentName=='MASTER BILL OF LADING' || document.documentName=='MASTER WAYBILL ORIGIN' || document.documentName=='SALES INVOICE' ">
                            <s:textfield cssClass="form-control" placeholder="Reference Number" name="document.referenceNumber" style="margin-bottom: 15px !important;"
                                         id="document_referenceNumber" required="true" />
                        </s:if>
                        <s:else>
                            <s:textfield cssClass="form-control" name="document.referenceNumber" disabled="true" />
                        </s:else>
                    </div>
                    <label class="col-lg-2 control-label" style="text-align: right;">Comments</label>
                    <div class="col-lg-4" >
                        <s:textarea cssClass="form-control" placeholder="Comments" name="document.documentComments" style="margin-bottom: 15px !important; resize:none; height: 200px;"
                                    id="document_documentComments" />
                    </div>
                </div>
                <div style="clear:both;" class="pull-right">
                    <s:url var="cancelInputUrl" action="viewOrderDocumentsInbound">
                        <s:param name="orderIdParam" value="document.referenceId"></s:param>
                    </s:url>
                    <s:a class="icon-action-link" href="%{cancelInputUrl}" rel="tooltip">
                        <button type="button" class="btn">Cancel</button>
                    </s:a>
                    <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
                </div>
                <%--<label class="col-lg-2">Reference Number<span class="asterisk_red"></span></label>
                <div class="col-lg-8">
                    &lt;%&ndash;<s:property value="%{document.documentId}" />&ndash;%&gt;
                    <s:property value="%{document.documentName}" />
                   &lt;%&ndash; <s:property value="%{document.outboundStage}" />
                    <s:property value="%{document.inboundStage}" />
                    <s:property value="%{document.referenceId}" />&ndash;%&gt;
                    <s:hidden name="document.documentId" value="%{document.documentId}" />
                    <s:hidden name="document.documentName" value="%{document.documentName}" />
                    <s:hidden name="document.outboundStage" value="%{document.outboundStage}" />
                    <s:hidden name="document.inboundStage" value="%{document.inboundStage}" />
                    <s:hidden name="document.referenceId" value="%{document.referenceId}" />
                    <s:hidden name="document.referenceTable" value="%{document.referenceTable}" />
                    <s:hidden name="document.orderNumber" value="%{document.orderNumber}" />
                    <s:hidden name="document.inboundReturned" value="%{document.inboundReturned}" />
                    <s:hidden name="document.documentComments" value="%{document.documentComments}" />
                    <s:hidden name="document.orderItemId" value="%{document.orderItemId}" />
                    <s:textfield cssClass="form-control" placeholder="Reference Number" name="document.referenceNumber"
                                 id="document.referenceNumber" required="true" maxLength="30" autofocus="true"
                                 pattern="[a-zA-Z\s ]+"
                                 title="Name should not contain special characters and/or numbers."/>
                </div>
                <s:submit name="submit" cssClass="btn btn-primary" value="Save" />--%>
            </s:form>
        </div>
    </div>

</div>

