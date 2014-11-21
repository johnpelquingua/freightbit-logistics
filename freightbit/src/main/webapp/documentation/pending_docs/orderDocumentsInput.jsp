<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="panel-body">

    <div class="well">
        <%--<div class="container">--%>
            <s:form action="addReferenceNumber" theme="bootstrap">
                <%--<div class="form-group">--%>
                    <label class="col-lg-4 control-label" style="text-align: right;">Document Name</label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;" value="%{document.documentName}" disabled="true"></s:textfield>
                    </div>
                <%--</div>
                <div class="form-group">--%>
                    <label class="col-lg-4 control-label" style="text-align: right; clear:both;">Vendor</label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;" value="%{document.vendorCode}" disabled="true"></s:textfield>
                    </div>
                <%--</div>
                <div class="form-group">--%>
                    <label class="col-lg-4 control-label" style="clear:both; text-align: right; clear:both;">Reference Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-8" >
                        <%--<s:property value="%{document.documentId}" />
                        <s:property value="%{document.documentName}" />
                        <s:property value="%{document.referenceId}" />
                        <s:property value="%{document.referenceNumber}" />--%>
                        <s:hidden name="document.documentId" value="%{document.documentId}" />
                        <s:hidden name="document.documentName" value="%{document.documentName}" id="documentName" />
                        <s:hidden name="document.referenceId" value="%{document.referenceId}" />
                        <s:hidden name="document.referenceTable" value="%{document.referenceTable}" />
                        <s:hidden name="document.orderNumber" value="%{document.orderNumber}" />
                        <s:hidden name="document.outboundStage" value="%{document.outboundStage}" />
                        <s:hidden name="document.inboundStage" value="%{document.inboundStage}" />
                        <s:hidden name="document.finalOutboundStage" value="%{document.finalOutboundStage}" />
                        <s:hidden name="document.finalInboundStage" value="%{document.finalInboundStage}" />
                        <s:hidden name="document.archiveStage" value="%{document.archiveStage}" />
                        <s:hidden name="document.documentProcessed" value="%{document.documentProcessed}" />
                        <s:hidden name="document.inboundReturned" value="%{document.inboundReturned}" />
                        <s:hidden name="document.createdBy" value="%{document.createdBy}" />
                        <s:hidden name="document.orderItemId" value="%{document.orderItemId}" />
                        <s:if test="document.documentName=='PROFORMA BILL OF LADING' || document.documentName=='MASTER BILL OF LADING' || document.documentName=='MASTER WAYBILL ORIGIN' || document.documentName=='SALES INVOICE'">
                            <s:textfield cssClass="form-control" placeholder="Reference Number" name="document.referenceNumber" style="margin-bottom: 15px !important;"
                                         id="document_referenceNumber" required="true" />
                        </s:if>
                        <s:else>
                            <%--<s:property value="%{document.referenceNumber}" />--%>
                            <s:textfield cssClass="form-control" name="document.referenceNumber" style="margin-bottom: 15px !important;" disabled="true" />
                        </s:else>
                    </div>
                <%--</div>
                <div class="form-group">--%>
                    <label class="col-lg-4 control-label" style="text-align: right; clear:both;">Comments</label>
                    <div class="col-lg-8" >
                        <s:textarea cssClass="form-control" placeholder="Comments" name="document.documentComments" style="margin-bottom: 15px !important; resize:none; height: 200px;"
                                     id="document_documentComments" />
                    </div>
                <%--</div>--%>
                    <div style="clear:both;" class="pull-right">
                        <s:url var="cancelInputUrl" action="viewOrderDocuments">
                            <s:param name="orderIdParam" value="document.referenceId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{cancelInputUrl}" rel="tooltip">
                            <button type="button" class="btn">Cancel</button>
                        </s:a>
                        <s:submit name="submit" cssClass="btn btn-primary" value="Save" onclick="transformString()"/>
                    </div>
            </s:form>
        <%--</div>--%>
    </div>

</div>


