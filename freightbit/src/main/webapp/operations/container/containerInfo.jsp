<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Container Information</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='../operations/viewContainerList' />"> Container Management </a>
            </li>
            <li class="active"> Container Information</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>
<s:if test="hasActionErrors()">
   <div class="col-lg-12">
	   <div class="alert alert-errors">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
   			<strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
		</div>
   </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Container Information</h3>
                <span class="pull-right">

                    <s:url var="editContainerUrl" action="loadEditFormPage">
                        <s:param name="containerIdParam"
                                 value="#attr.container.containerId"></s:param>
                    </s:url>

                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_FREIGHT_SPECIALIST', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">

                        <s:a href="%{editContainerUrl}" cssClass="btn btn-success new-booking" rel="tooltip"
                             title="Edit this EIR Form">
                            <i class="fa fa-pencil"></i> Edit Container
                        </s:a>

                        <s:if test="#attr.container.containerStatus != 'FROM SHIPMENT MONITORING'">
                            <a class="btn btn-info" title="Print Equipment Interchange Receipt" href="#" onclick="generateReport(${container.documentId},'${container.eirType}')"> <i class="fa fa-print"></i> Print Equipment Interchange Receipt</a>
                        </s:if>

                    </sec:authorize>

                </span>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3">

                        <div class="panel panel-info ">

                            <div class="row">
                                <div class="col-lg-14">

                                    <div class="col-lg-12">

                                        <table class="table table-user-information profile" style="margin-top: 0px; margin-bottom: 0px;">
                                            <tbody>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Container Number:</td>
                                                <td style="text-transform:uppercase"><s:property value="container.containerNumber" /></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Container Size:</td>
                                                <td><s:property value="container.containerSize"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Container Status:</td>
                                                <td><s:property value="container.containerStatus"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Shipping Line:</td>
                                                <td><s:property value="container.shipping"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Gate In:</td>
                                                <td><s:property value="container.strGateInTime"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Gate Out:</td>
                                                <td><s:property value="container.strGateOutTime"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Receipt Number:</td>
                                                <td><s:property value="container.receiptNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">EIR Number:</td>
                                                <td><s:property value="container.eirNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Van Location:</td>
                                                <td><s:property value="container.vanLocation"/></td>
                                            </tr>
                                            </tbody>
                                            <s:set name="containerId" value="%{container.containerId}" scope="session"/>
                                        </table>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-right">
                    <a href="viewContainerList" class="btn btn-danger" id ="groups-btn"> <i class="fa fa-chevron-left"></i> Back to Container Lists</a>
                </span>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function generateReport(documentId,documentName) {

        if(documentName == 'EIR FORM 1'){
            var win = window.open('documentations/generateEIR1RequestReport?documentIdParam=' + documentId, 'eir1', 'width=910,height=800');
            win.onload = function () {
                this.document.title = "Equipment Interchange Receipt 1";
            }
        }else{
            var win = window.open('documentations/generateEIR2RequestReport?documentIdParam=' + documentId, 'eir2', 'width=910,height=800');
            win.onload = function () {
                this.document.title = "Equipment Interchange Receipt 2";
            }
        }
    }

</script>