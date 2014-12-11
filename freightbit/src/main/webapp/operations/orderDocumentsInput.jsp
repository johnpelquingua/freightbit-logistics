<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="panel-body">

    <div class="well">

            <s:form action="addReferenceNumber" theme="bootstrap">

                    <label class="col-lg-4 control-label" style="text-align: right;">Document Name</label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;" value="%{document.documentName}" disabled="true"></s:textfield>
                    </div>

                    <label class="col-lg-4 control-label" style="text-align: right; clear:both;">Vendor</label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;" value="%{document.vendorCode}" disabled="true"></s:textfield>
                    </div>

                    <label class="col-lg-4 control-label" style="clear:both; text-align: right; clear:both;">Series Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-8" >

                        <s:hidden name="document.documentId" value="%{document.documentId}" />
                        <s:hidden name="document.documentName" value="%{document.documentName}" id="documentName" />
                        <s:hidden name="document.vendorCode" value="%{document.vendorCode}" />
                        <s:hidden name="document.referenceId" value="%{document.referenceId}" />
                        <s:hidden name="document.referenceTable" value="%{document.referenceTable}" />
                        <s:hidden name="document.orderNumber" value="%{document.orderNumber}" />
                        <s:hidden name="document.outboundStage" value="%{document.outboundStage}" />
                        <s:hidden name="document.inboundStage" value="%{document.inboundStage}" />
                        <s:hidden name="document.finalOutboundStage" value="%{document.finalOutboundStage}" />
                        <s:hidden name="document.finalInboundStage" value="%{document.finalInboundStage}" />
                        <s:hidden name="document.completeStage" value="%{document.completeStage}" />
                        <s:hidden name="document.archiveStage" value="%{document.archiveStage}" />
                        <s:hidden name="document.documentProcessed" value="%{document.documentProcessed}" />
                        <s:hidden name="document.inboundReturned" value="%{document.inboundReturned}" />
                        <s:hidden name="document.createdBy" value="%{document.createdBy}" />
                        <s:hidden name="document.orderItemId" value="%{document.orderItemId}" />
                        <s:hidden name="document.documentType" value="%{document.documentType}" />

                        <s:textfield cssClass="form-control modalComment" name="document.referenceNumber" style="margin-bottom: 15px !important;" required="true" />

                    </div>

                    <label class="col-lg-4 control-label" style="text-align: right; clear:both;">Comments</label>
                    <div class="col-lg-8" >
                        <s:textarea cssClass="form-control modalTextArea" name="document.documentComments" style="margin-bottom: 15px !important; resize:none; height: 200px;"
                                     id="document_documentComments" />
                    </div>

                    <div style="clear:both;" class="pull-right">
                        <s:url var="cancelInputUrl" action="viewOrderDocuments">
                            <s:param name="orderIdParam" value="document.referenceId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{cancelInputUrl}" rel="tooltip">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </s:a>
                        <s:submit name="submit" cssClass="btn btn-primary" value="Save" onclick="transformString()"/>
                    </div>

            </s:form>

    </div>

</div>


