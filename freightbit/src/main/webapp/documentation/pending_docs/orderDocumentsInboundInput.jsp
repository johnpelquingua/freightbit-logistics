<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="panel-body">

    <div class="well">
        <div class="container">
            <s:form action="addReferenceNumberInbound" theme="bootstrap">
                <label class="col-lg-2">Reference Number<span class="asterisk_red"></span></label>
                <div class="col-lg-8">
                    <%--<s:property value="%{document.documentId}" />--%>
                    <s:property value="%{document.documentName}" />
                   <%-- <s:property value="%{document.outboundStage}" />
                    <s:property value="%{document.inboundStage}" />
                    <s:property value="%{document.referenceId}" />--%>
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
                <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
            </s:form>
        </div>
    </div>

</div>

