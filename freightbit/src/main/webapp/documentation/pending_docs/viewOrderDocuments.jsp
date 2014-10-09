<%--
  Created by IntelliJ IDEA.
  User: JMXPSX
  Date: 9/24/2014
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .pagebanner, .pagelinks {
        display: none;
    }
</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-file-text"></i> Documents Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='../documentation/viewPendingDocuments' />"> Pending Documents List</a></li>
            <li class="active"> Pending Documents of Booking Number <s:property value="bookingNumber"/></li> <%--placeholder--%>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-file-text"></i> Document Stages</h3>
            </div>

            <div class="panel-body">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-book"></i>
                        <span class="panel-title">Booking Information</span>
                    </div>
                    <div class="panel-body form-horizontal">
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Booking Number</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Type</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer Name</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee Name</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="well">
                    <fieldset class="inputs">
                        <legend style="text-align: left;">
                            <span >
                                Input
                            </span>
                        </legend>

                            <s:form action="editDocumentInfo" theme="bootstrap">

                                <div class="form-group">

                                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Proforma Bill of Lading Number</label>
                                    <div class="col-lg-3" >
                                        <input type="text" class="form-control" id="proformaBillofLadingNumber" name="document.referenceNumber" style="margin-bottom: 15px !important;">
                                    </div>

                                </div>



                                <div class="pull-right">
                                    <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
                                </div>
                            </s:form>

                    </fieldset>
                </div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#outbound" role="tab" data-toggle="tab">Outbound</a></li>
                    <li><a href="#inbound" role="tab" data-toggle="tab">Inbound</a></li>
                    <li><a href="#finalOutbound" role="tab" data-toggle="tab">Final Set Outbound</a></li>
                    <li><a href="#finalInbound" role="tab" data-toggle="tab">Final Set Inbound</a></li>
                    <li><a href="#archive" role="tab" data-toggle="tab">Archive</a></li>
                    <li><a href="#billing" role="tab" data-toggle="tab">Billing</a></li>
                </ul>


                <div class="tab-content">
                    <%--OUTBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade in active" id="outbound">

                        <div class="panel-body">


                            <div class="table-responsive">
                                <display:table id="document" name="documents" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px;">

                                    <td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>--%>

                                    <td>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>
                                    </td>


                                </display:table>
                            </div>
                        </div>

                    </div>
                    <%--INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="inbound">

                        INBOUND DOCUMENTS

                    </div>
                    <%--FINAL SET OUTBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="finalOutbound">

                        FINAL SET OUTBOUND DOCUMENTS

                    </div>
                    <%--FINAL SET INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="finalInbound">

                        FINAL SET INBOUND DOCUMENTS

                    </div>
                    <%--ARCHIVE BEGIN--%>
                    <div class="tab-pane fade" id="archive">

                        ARCHIVE DOCUMENTS

                    </div>
                    <%--BILLING DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="billing">

                        BILLING DOCUMENTS

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>


<script>

$(document).ready(function() {

    var tbl = document.getElementById("document");
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {
            if (tbl.rows[i].cells[1].innerHTML == "PROFORMA BILL OF LADING") {
                tbl.rows[i].cells[3].innerHTML= "<i class='fa fa-ban'></i>";
            }
        }
    }

    /*var tbl = document.getElementById("document");
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {
            if (tbl.rows[i].cells[0].innerHTML == "0") {
                tbl.rows[i].cells[0].innerHTML= "<i class='fa fa-square-o'></i>";
            }
        }
    }*/

});

    function generateReport(documentId,documentName){
        if(documentName == "BOOKING REQUEST FORM"){
            var win = window.open('documentations/generateBookingRequestReport?documentIdParam='+documentId,'bookingRequest','width=910,height=800');
            win.onload = function() { this.document.title = "Booking Request Form"; }
        }else if (documentName == "PROFORMA BILL OF LADING"){
            alert("BOL");
        }
    }

    function generateReleaseOrderReport(){

        var win = window.open('documentations/generateReleaseOrderReport','bookingRequest','width=910,height=800');
        win.onload = function() { this.document.title = "Release Order"; }

    }

</script>