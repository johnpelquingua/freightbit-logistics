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
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Freight Type</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.freightType}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Requirement</label>
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
                        <%--<legend style="text-align: left;">--%>
                            <%--<span >--%>
                               <%--Progress--%>
                            <%--</span>--%>
                        <%--</legend>--%>

                    <div class="container">


                        <div class="row bs-wizard" style="border-bottom:0;">

                            <div class="col-xs-2 bs-wizard-step active">
                                <div class="text-center bs-wizard-stepnum">OUTBOUND 1</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#outbound" class="bs-wizard-dot" data-toggle="tab" onclick="OutboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet.</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">INBOUND 1</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#inbound" class="bs-wizard-dot" data-toggle="tab" onclick="InboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Nam mollis tristique erat vel tristique. Aliquam erat volutpat. Mauris et vestibulum nisi. Duis molestie nisl sed scelerisque vestibulum. Nam placerat tristique placerat</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">OUTBOUND 2</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalOutbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalOutboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Integer semper dolor ac auctor rutrum. Duis porta ipsum vitae mi bibendum bibendum</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">INBOUND 2</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalInbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalInboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">ARCHIVE</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#archive" class="bs-wizard-dot" data-toggle="tab" onclick="archiveProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">BILLING</div>
                                <div class="progress"><div class="progress-bar" data-toggle="tab" onclick="BillingProgress"></div></div>
                                <a href="#billing" class="bs-wizard-dot"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>
                        </div>





                    </div>
                </div>


                </div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active" id="out"><a href="#outbound" role="tab" data-toggle="tab">Outbound</a></li>
                    <li id="in"><a href="#inbound" role="tab" data-toggle="tab">Inbound</a></li>
                    <li id="fiOut"><a href="#finalOutbound" role="tab" data-toggle="tab">Final Set Outbound</a></li>
                    <li id="fiIn"><a href="#finalInbound" role="tab" data-toggle="tab">Final Set Inbound</a></li>
                    <li id="arch"><a href="#archive" role="tab" data-toggle="tab">Archive</a></li>
                    <li id="bill"><a href="#billing" role="tab" data-toggle="tab">Billing</a></li>
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



                            <div class="panel-body">


                                <div class="table-responsive">
                                    <display:table id="InboundDocument" name="documents" requestURI="viewOrderDocuments.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
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

    function InboundProgress(){
        document.getElementById("in").className='active';
        document.getElementById("out").className='';
        document.getElementById("arch").className='';
        document.getElementById("bill").className='';
        document.getElementById("fiOut").className='';
        document.getElementById("fiIn").className='';
    }

    function OutboundProgress(){
    document.getElementById("out").className='active';
    document.getElementById("in").className='';
        document.getElementById("arch").className='';
        document.getElementById("bill").className='';
        document.getElementById("fiOut").className='';
        document.getElementById("fiIn").className='';
    }

    function finalOutboundProgress(){
    document.getElementById("out").className='';
    document.getElementById("in").className='';
        document.getElementById("arch").className='';
        document.getElementById("bill").className='';
        document.getElementById("fiOut").className='active';
        document.getElementById("fiIn").className='';
    }

function finalInboundProgress() {
    document.getElementById("out").className = '';
    document.getElementById("in").className = '';
    document.getElementById("arch").className = '';
    document.getElementById("bill").className = '';
    document.getElementById("fiOut").className = '';
    document.getElementById("fiIn").className = 'active';
}

function    archiveProgress() {
    document.getElementById("out").className = '';
    document.getElementById("in").className = '';
    document.getElementById("arch").className = 'active';
    document.getElementById("bill").className = '';
    document.getElementById("fiOut").className = '';
    document.getElementById("fiIn").className = '';
}

function BillingProgress() {
    document.getElementById("out").className = '';
    document.getElementById("in").className = '';
    document.getElementById("arch").className = '';
    document.getElementById("bill").className = 'active';
    document.getElementById("fiOut").className = '';
    document.getElementById("fiIn").className = '';
}


</script>