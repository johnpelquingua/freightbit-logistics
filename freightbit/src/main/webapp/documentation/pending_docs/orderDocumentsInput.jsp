<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%--<div class="container">--%>
            <div class="modal-header margin-10-bot center-text" style="font-size: 1.5em; !important;">
                <i class="fa fa-file"></i> Edit Documents
            </div>
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
                    <label class="col-lg-4 control-label documentSeries" style="clear:both; text-align: right; clear:both;">Series Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-8" >
                        <%--<s:property value="%{document.vendorCode}" />
                        <s:property value="%{document.documentType}" />--%>

                        <s:hidden name="document.documentId" value="%{document.documentId}" />
                        <s:hidden name="document.documentName" value="%{document.documentName}" id="documentName" />
                        <s:hidden name="document.referenceId" value="%{document.referenceId}" />
                        <s:hidden name="document.referenceTable" value="%{document.referenceTable}" />
                        <s:hidden name="document.orderNumber" value="%{document.orderNumber}" />
                        <s:hidden name="document.createdDate" value="%{document.createdDate}" />
                        <s:hidden name="document.documentStatus" value="%{document.documentStatus}" />
                        <s:hidden name="document.documentProcessed" value="%{document.documentProcessed}" />
                        <s:hidden name="document.documentType" value="%{document.documentType}" />
                        <s:hidden name="document.outboundStage" value="%{document.outboundStage}" />
                        <s:hidden name="document.inboundStage" value="%{document.inboundStage}" />
                        <s:hidden name="document.finalOutboundStage" value="%{document.finalOutboundStage}" />
                        <s:hidden name="document.finalInboundStage" value="%{document.finalInboundStage}" />
                        <s:hidden name="document.completeStage" value="%{document.completeStage}" />
                        <s:hidden name="document.inboundReturned" value="%{document.inboundReturned}" />
                        <s:hidden name="document.finalOutboundSent" value="%{document.finalOutboundSent}" />
                        <s:hidden name="document.finalOutboundLbc" value="%{document.finalOutboundLbc}" />
                        <s:hidden name="document.finalInboundReturned" value="%{document.finalInboundReturned}" />
                        <s:hidden name="document.finalInboundReceivedBy" value="%{document.finalInboundReceivedBy}" />
                        <s:hidden name="document.createdBy" value="%{document.createdBy}" />
                        <s:hidden name="document.orderItemId" value="%{document.orderItemId}" />
                        <s:hidden name="document.aging" value="%{document.aging}" />
                        <s:hidden name="document.contactId" value="%{document.contactId}" />

                        <%--<s:if test="document.documentName=='PROFORMA BILL OF LADING' || document.documentName=='MASTER BILL OF LADING' || document.documentName=='MASTER WAYBILL ORIGIN' || document.documentName=='SALES INVOICE' || document.documentName=='MASTER WAYBILL DESTINATION' ">
                            <s:textfield cssClass="form-control" placeholder="Reference Number" name="document.referenceNumber" style="margin-bottom: 15px !important;"
                                         id="document_referenceNumber" required="true" />
                        </s:if>
                        <s:else>--%>
                            <%--<s:property value="%{document.referenceNumber}" />--%>
                            <s:textfield cssClass="form-control modalComment" name="document.referenceNumber" style="margin-bottom: 15px !important;" required="true" />
                        <%--</s:else>--%>
                    </div>
                <%--</div>
                <div class="form-group">--%>
                    <label class="col-lg-4 control-label" style="text-align: right; clear:both;">Comments</label>
                    <div class="col-lg-8" >
                        <s:textarea cssClass="form-control modalTextArea" name="document.documentComments" style="margin-bottom: 15px !important; resize:none; height: 200px;"
                                     id="document_documentComments" />
                    </div>
                <%--</div>--%>
                    <div style="clear:both;" class="modal-footer">
                        <s:url var="cancelInputUrl" action="viewOrderDocuments">
                            <s:param name="orderIdParam" value="document.referenceId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{cancelInputUrl}" rel="tooltip">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </s:a>
                        <s:submit name="submit" cssClass="btn btn-primary" value="Save" onclick="transformString()"/>
                    </div>
            </s:form>
        <%--</div>--%>