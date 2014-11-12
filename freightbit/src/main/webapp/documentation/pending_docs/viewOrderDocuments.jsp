<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script>

    $(document).ready(function() {

        $( window ).load(function() {

            var outbound_tab = $("#documentTab").val();

            if(outbound_tab == "OUTBOUND_COMPLETE"){

                $("#first").toggleClass('active complete');
                $("#second").toggleClass('disabled active');
            }

            var inbound_tab = $("#documentTabInbound").val();

            if(inbound_tab == "INBOUND_COMPLETE"){

                $("#second").toggleClass('active complete');
                $("#third").toggleClass('disabled active');
            }

            var final_outbound_tab = $("#documentTabFinalOutbound").val();

            if(final_outbound_tab == "FINAL_OUTBOUND_SENT"){

                $("#third").toggleClass('active complete');
                $("#fourth").toggleClass('disabled active');
            }

        });

    });

</script>

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
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
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
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
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

                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-list-ol"></i> Cargo Details</h3>
                    </div>

                    <div class="panel-body">

                        <div class="table-responsive list-table">

                            <table class="table table-striped table-hover table-bordered text-center tablesorter" id="orderItems">
                                <thead>
                                <tr class="header_center" style="background-color: #fff;">
                                    <th class="tb-font-black">Vendor Origin</th>
                                    <th class="tb-font-black">Vendor Sea</th>
                                    <th class="tb-font-black">Vendor Destination</th>
                                    <th class="tb-font-black">Quantity</th>
                                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <span>
                                    <th class="tb-font-black">Size</th>
                                    <th class="tb-font-black">Weight <br /> (tons) </th>
                                </span>
                                    </s:if>
                                    <s:else>
                                <span>
                                    <th class="tb-font-black">Name</th>
                                    <th class="tb-font-black">Weight <br /> (kg) </th>
                                </span>
                                    </s:else>

                                    <th class="tb-font-black">Volume <br /> (cm&#179;) </th>
                                    <th class="tb-font-black">Commodity</th>
                                </tr>
                                </thead>
                                <tbody>

                                <s:iterator value="orderItems" var="orderItem">
                                    <tr>
                                        <td class="tb-font-black"><s:property value="vendorOrigin"/></td>
                                        <td class="tb-font-black"><s:property value="vendorSea"/></td>
                                        <td class="tb-font-black"><s:property value="vendorDestination"/></td>
                                        <td class="tb-font-black"><s:property value="quantity"/></td>
                                        <td class="tb-font-black"><s:property value="nameSize"/></td>
                                        <td class="tb-font-black"><s:property value="weight"/></td>
                                        <td class="tb-font-black"><s:property value="volume"/></td>
                                        <td class="tb-font-black"><s:property value="description"/></td>
                                    </tr>
                                </s:iterator>
                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>

                <div class="well">

                    <div class="container">

                        <div class="row bs-wizard" style="border-bottom:0;">

                            <div class="col-xs-2 bs-wizard-step active" id="first">
                                <div class="text-center bs-wizard-stepnum">OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#outbound" class="bs-wizard-dot" data-toggle="tab" onclick="OutboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Lorem ipsum dolor sit amet.</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="second"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#inbound" class="bs-wizard-dot" data-toggle="tab" onclick="InboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Nam mollis tristique erat vel tristique. Aliquam erat volutpat. Mauris et vestibulum nisi. Duis molestie nisl sed scelerisque vestibulum. Nam placerat tristique placerat</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="third"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">FINAL OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalOutbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalOutboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center">Integer semper dolor ac auctor rutrum. Duis porta ipsum vitae mi bibendum bibendum</div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="fourth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">FINAL INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalInbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalInboundProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="fifth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">ARCHIVE</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#archive" class="bs-wizard-dot" data-toggle="tab" onclick="archiveProgress()"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="sixth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">BILLING</div>
                                <div class="progress"><div class="progress-bar" data-toggle="tab" onclick="BillingProgress"></div></div>
                                <a href="#billing" class="bs-wizard-dot"></a>
                                <%--<div class="bs-wizard-info text-center"></div>--%>
                            </div>
                        </div>

                    </div>
                </div>

                </div>

            <%--------------------------FOR EXAMPLE PURPOSES------------------------------%>
            <%--<div id="leftDiv">
                &lt;%&ndash;<s:include value="/documentation/result.jsp"></s:include>&ndash;%&gt;
            </div>
            <div>
                <a href="#" id="idAnchor">Partial Refresh</a>
            </div>--%>
            <%--------------------------FOR EXAMPLE PURPOSES------------------------------%>

            <div id="inputDiv"> <%--Area where input fields will appear--%>
            </div>

            <%--Anchor on tab click--%>
            <s:textfield cssStyle="visibility: hidden;" value="%{documentTab}" id="documentTab"  />
            <s:textfield cssStyle="visibility: hidden;" value="%{documentTabInbound}" id="documentTabInbound"  />
            <s:textfield cssStyle="visibility: hidden;" value="%{documentTabFinalOutbound}" id="documentTabFinalOutbound"  />

                <s:if test="hasActionMessages()">
                    <div class="col-lg-12" id="successDiv">
                        <div id="alert" class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                        </div>
                    </div>
                </s:if>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <%--Redirects to Outbound Stage--%>
                    <li class="active" id="out">
                        <s:url var="outboundStageUrl" action="viewOrderDocuments">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <%--<s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>--%>
                        </s:url>
                        <s:a class="icon-action-link" href="%{outboundStageUrl}">
                            Outbound
                        </s:a>
                    </li>
                    <%--Redirects to Inbound Stage--%>
                    <li id="in">
                        <s:url var="inboundStageUrl" action="viewOrderDocumentsInbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <%--<s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>--%>
                        </s:url>
                        <s:a class="icon-action-link" href="%{inboundStageUrl}">
                            Inbound
                        </s:a>
                    </li>
                    <%--Redirects to Final Outbound Stage--%>
                    <li id="fiOut">
                        <s:url var="finalOutboundStageUrl" action="viewOrderDocumentsFinalOutbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{finalOutboundStageUrl}">
                            Final Outbound
                        </s:a>
                    </li>
                    <%--Redirects to Final Inbound Stage--%>
                    <li id="fiIn">
                        <s:url var="finalInboundStageUrl" action="viewOrderDocumentsFinalInbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{finalInboundStageUrl}">
                            Final Inbound
                        </s:a>
                    </li>
                    <li id="arch"><a href="#archive" role="tab" data-toggle="tab">Archive</a></li>
                    <li id="bill"><a href="#billing" role="tab" data-toggle="tab">Billing</a></li>
                </ul>

                <div class="tab-content">
                    <%--OUTBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade in active" id="outbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <s:form name="myform" action="processDocuments">
                                <s:textfield type="hidden" name="document.documentItem" id="documentItem"></s:textfield>

                                <display:table id="document" name="outboundDocuments" requestURI="viewOrderDocuments.action" pagesize="10" class="outbound_table table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px;">

                                    <td>
                                        <display:column>

                                            <%--<s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>--%>
                                            <%--<s:property value="%{#attr.document.documentId}"/>--%>

                                            <s:if test=" documentTab == 'OUTBOUND' ">

                                                <s:if test="#attr.document.documentProcessed == 0">
                                                    <%--<s:url var="checkDocumentUrl" action="checkDocument">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Check Document">
                                                        <i class="fa fa-square-o"></i>
                                                    </s:a>--%>
                                                    <s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>
                                                </s:if>

                                                <s:else>
                                                    <%--<s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:a>--%>
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:else>
                                                <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>
                                                <%--<input  id="documentProcess" value="${document.documentId}" name="documentNameParam"/>--%>

                                            </s:if>

                                            <s:else>

                                                <i class="fa fa-check-square-o"></i>

                                            </s:else>

                                        </display:column>
                                    </td>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="vendorCode" title="Vendor" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </display:column></td>

                                    <td><display:column property="documentComments" title="Comments" class="tb-font-black"
                                                        style="text-align: center;" > </display:column></td>

                                    <td>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >

                                            <%--<s:if test=" documentTab == 'OUTBOUND' ">--%>

                                                <%--<input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>--%>

                                                <%--Input Reference ID--%>
                                                <%--<s:if test="#attr.document.documentName=='PROFORMA BILL OF LADING'">--%>
                                                    <%--<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                        <i class="fa fa-edit"></i>
                                                    </a>--%>
                                                    <%--<s:url var="addReferenceNumberUrl" action="orderDocumentsInput">
                                                        <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a id="edit-icon" class="icon-action-link" href="%{addReferenceNumberUrl}" rel="tooltip" title ="Add Reference Number">
                                                        <i class="fa fa-edit"></i>
                                                    </s:a>--%>
                                                    <a id="edit-icon" href="#" onclick="showInputFields(${document.referenceId},'${document.documentId}');">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                <%--</s:if>--%>
                                                <%--Print Document--%>
                                                <s:if test="#attr.document.documentName=='BOOKING REQUEST FORM' || #attr.document.documentName=='BOOKING REQUEST FORM WITH SIGNATURE' || #attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN WITH SIGNATURE' || #attr.document.documentName=='ACCEPTANCE RECEIPT' ">
                                                    <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                </s:if>
                                                <%--Move Document--%>
                                                <%--<s:url var="moveDocumentUrl" action="moveDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="check-icon" class="icon-action-link" href="%{moveDocumentUrl}" rel="tooltip" title ="Next Stage">
                                                    <i class="fa fa-hand-o-right"></i>
                                                </s:a>--%>

                                            <%--</s:if>

                                            <s:else>

                                                <i class="fa fa-ban"></i>

                                            </s:else>--%>

                                        </display:column>
                                    </td>

                                </display:table>
                                <%--<s:submit cssClass="btn btn-default" value="Process Documents" onclick="addTextSet()"></s:submit>--%>

                            </div>

                                <s:if test=" documentTab == 'OUTBOUND' ">

                                    <%--<s:url var="processDocumentsUrl" action="moveDocuments">
                                        <s:param name="orderIdParam"
                                                 value="#attr.order.orderId"></s:param>
                                        &lt;%&ndash;<s:property value="%{#attr.order.orderId}"/>&ndash;%&gt;
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{processDocumentsUrl}">
                                        <button type="button" id="Cancel" class="pull-right btn">
                                            Process Documents
                                        </button>
                                    </s:a>--%>

                                    <s:submit cssClass="btn btn-default pull-right" value="Check Document(s)" onclick="addCheckText()"></s:submit>

                                </s:if>

                                <s:else>
                                    <button type="button" id="Cancel" class="pull-right btn" disabled>
                                        Check Document(s)
                                    </button>
                                    <%--<s:submit cssClass="btn btn-default pull-right" value="Process Documents" onclick="addMoveText()"></s:submit>--%>
                                </s:else>

                            </s:form>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>
</div>

<s:textfield value="%{outboundCount}" id="outboundCount" type="hidden" />
<s:textfield value="%{inboundCount}" id="inboundCount" type="hidden" />
<s:textfield value="%{finalOutboundCount}" id="finalOutboundCount" type="hidden"/>
<s:textfield value="%{finalInboundCount}" id="finalInboundCount" type="hidden"/>

<script>

$(document).ready(function() {

    /*----------------------For Example Purposes-------------------------*/
    $('#idAnchor').click(function(){

        $.ajax({
            url: 'getResultAction', // action to be perform
            type: 'POST',       //type of posting the data
            data: { name: 'Jeetu', age: '24' }, // data to set to Action Class
            dataType: 'html',
            success: function (html) {
                $('#leftDiv').html(html); //set result.jsp output to leftDiv
                window.location.href = '#leftDiv';
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });

    });
    /*----------------------For Example Purposes-------------------------*/


    var outbound_tab = $("#documentTab").val();
    if ($('#successDiv').length !== 0){
        window.location.href = '#documentTab';
    }


$( window ).load(function() {

    /*Anchor on inbound tab click*/

    if (outbound_tab == "OUTBOUND" || outbound_tab == "OUTBOUND_COMPLETE") {
        window.location.href = '#documentTab';
    }

});

});

/*Script that will trigger input area*/

function showInputFields(referenceId,documentId) {

    $.ajax({
        url: 'getInputFieldAction',
        type: 'POST',
        data: { orderIdParam: referenceId , documentIdParam: documentId },
        dataType: 'html',
        success: function (html) {
            $('#inputDiv').html(html);
            window.location.href = '#sixth';
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });

}

function generateReport(documentId,documentName) {
    if (documentName == "BOOKING REQUEST FORM" || documentName == "BOOKING REQUEST FORM WITH SIGNATURE") {
        var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Booking Request Form";
        }
    }
    else if (documentName == "HOUSE BILL OF LADING") {
        var win = window.open('documentations/generateBillofLadingReport?documentIdParam=' + documentId, 'HouseBillofLading', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Bill of Lading";
        }
    }
    else if (documentName == "HOUSE WAYBILL ORIGIN" || documentName == "HOUSE WAYBILL ORIGIN WITH SIGNATURE") {
        var win = window.open('documentations/generateHouseWayBillReport?documentIdParam=' + documentId, 'HouseWayBillOrigin', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Way Bill Origin";
        }
    }
    else if (documentName == "HOUSE WAYBILL DESTINATION") {
        var win = window.open('documentations/generateHouseWayBillDestinationReport?documentIdParam=' + documentId, 'HouseWayBillDestination', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Way Bill Destination";
        }
    }
    else if (documentName == "ACCEPTANCE RECEIPT") {
        var win = window.open('documentations/generateAcceptanceReceiptReport?documentIdParam=' + documentId, 'Acceptance Receipt', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " Acceptance Receipt";
        }
    }
}

/*function generateReleaseOrderReport(){

    var win = window.open('documentations/generateReleaseOrderReport','bookingRequest','width=910,height=800');
    win.onload = function() { this.document.title = "Release Order"; }

}
*/
function OutboundProgress(){
    document.getElementById("out").className='active';
    document.getElementById("in").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
}

function InboundProgress(){
    document.getElementById("in").className='active';
    document.getElementById("out").className='';
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

function archiveProgress() {
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

function addCheckText() {
    document.getElementById("documentItem").value = "check";
}


</script>