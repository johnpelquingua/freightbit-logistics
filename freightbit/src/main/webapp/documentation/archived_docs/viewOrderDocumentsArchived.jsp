<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .pagebanner, .pagelinks {
        display: none;
    }
    #inboundReceivedModal{
        top:50%;
        outline: none;
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
            <li class="active"><a href="<s:url action='../documentation/viewArchivedDocuments' />"> Archived Documents List</a></li>
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
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Booking Number</label>
                            <div class="col-lg-4">
                                <s:textfield type="hidden" cssClass="form-control" value="%{order.orderId}" id="order_Id" name="book-num" disabled="true"></s:textfield>
                                <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num" disabled="true"></s:textfield>
                            </div>
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Freight Type</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.freightType}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Service Requirement</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                            </div>
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Service Mode</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Customer</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                            </div>
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Consignee</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.consigneeName}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Origin Port</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.originationPort}"
                                             disabled="true"></s:textfield>
                            </div>
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Destination Port</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.destinationPort}"
                                             disabled="true"></s:textfield>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Pickup Date</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.pickupDate}"
                                             disabled="true"></s:textfield>
                            </div>
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Delivery Date</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.deliveryDate}"
                                             disabled="true"></s:textfield>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Pickup Address</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.shipperInfoAddress.address}" name="book-num"
                                             disabled="true"></s:textfield>
                            </div>
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Destination Address</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.consigneeInfoAddress.address}" name="book-num"
                                             disabled="true"></s:textfield>
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
                                </span>
                                    </s:if>
                                    <s:else>
                                <span>
                                    <th class="tb-font-black">Name</th>
                                </span>
                                    </s:else>
                                    <th class="tb-font-black">Weight <br /> (kg) </th>
                                    <th class="tb-font-black">Volume <br /> (m&#179;) </th>
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
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-file-text"></i> Documents</h3>
                    </div>

                    <div class="panel-body">
                        <div style="margin: 1em;">

                            <s:form name="myform" action="processDocumentsComplete">

                                <%--<s:textfield type="hidden" name="orderIdParam" id="order-Id"/>--%>
                                <%--<s:textfield type="hidden" name="document.documentItem" id="documentItemComplete"></s:textfield>--%>
                            <display:table id="document" name="archiveDocuments" requestURI="viewOrderDocumentsArchived.action" pagesize="50" class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">

                                <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                </display:column>
                                </td>

                                <td><display:column property="referenceNumber" title="Series Number" class="tb-font-black" style="text-align: center;">
                                </display:column>
                                </td>

                                <td><display:column property="vendorCode" title="Vendor" class="tb-font-black" style="text-align: center;">
                                </display:column>
                                </td>

                                <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                </display:column>
                                </td>

                                <td><display:column property="documentComments" title="Comments" class="tb-font-black" style="text-align: center;">
                                </display:column>
                                </td>

                                <td>

                                    <display:column title="Action" class="tb-font-black" style="text-align: center;" >

                                        <a id="edit-icon" href="#" data-toggle="modal" data-target="#inputModal" onclick="showInputFields(${document.referenceId},'${document.documentId}');">
                                            <i class="fa fa-edit"></i>
                                        </a>

                                        <%--Print Document--%>
                                        <s:if test="#attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE RELEASE ORDER' || #attr.document.documentName=='HOUSE WAYBILL DESTINATION' || #attr.document.documentName=='AUTHORIZATION TO WITHDRAW' || #attr.document.documentName=='BOOKING REQUEST FORM' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN' || #attr.document.documentName=='PROFORMA BILL OF LADING' ">
                                            <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </s:if>

                                        <s:else>

                                        </s:else>

                                    </display:column>

                                </td>

                            </display:table>
                        </div>

                        <s:if test=" documentTabComplete == 'COMPLETE_READY' ">

                            <s:submit cssClass="btn btn-primary pull-right"  value="Check Document(s)" onclick="addCheckTextComplete()"></s:submit>

                        </s:if>

                        </s:form>

                        <s:if test=" documentTabComplete == 'ARCHIVE_PENDING' ">

                            <s:url var="archiveStageUrl" action="activateArchive">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{archiveStageUrl}" rel="tooltip">
                                <button type="button" class="btn btn-primary pull-right">Move To Archive</button>
                            </s:a>

                        </s:if>

                        <%------------------------------------------COMPLETE DOCUMENTS END-----------------------------------------------%>
                    </div>
                </div>
            </div>

                <s:if test="hasActionMessages()">
                    <div class="col-lg-12" id="successDiv">
                        <div id="alert" class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                        </div>
                    </div>
                </s:if>

<%------------------------------------------COMPLETE DOCUMENTS BEGIN-----------------------------------------------%>


        </div>
    </div>
</div>

<%--<s:property value="%{documentTab}" /> <br />--%>
<%--<s:property value="%{documentTabInbound}" /> <br />--%>
<%--<s:property value="%{documentTabFinalOutbound}" /> <br />--%>
<%--<s:property value="%{documentTabFinalInbound}" /> <br />--%>
<%--<s:property value="%{documentTabComplete}" /> <br />--%>

<s:hidden value="%{documentTab}" id="documentTab"  />
<s:hidden value="%{documentTabInbound}" id="documentTabInbound"  />
<s:hidden value="%{documentTabFinalOutbound}" id="documentTabFinalOutbound"  />
<s:hidden value="%{documentTabFinalInbound}" id="documentTabFinalInbound"  />
<s:hidden value="%{documentTabComplete}" id="documentTabComplete"  />
<br />
<s:hidden value="%{outboundCount}" id="outboundCount"  />
<s:hidden value="%{inboundCount}" id="inboundCount"  />
<s:hidden value="%{finalOutboundCount}" id="finalOutboundCount" />
<s:hidden value="%{finalInboundCount}" id="finalInboundCount" />
<s:hidden value="%{completeCount}" id="completeCount" />

<%--Modal window for input--%>
<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>
        </div>
    </div>
</div>

<%--Modal for adding outbound document--%>
<div class="modal fade" id="addDocumentModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div id="documentInputDiv"> <%--Area where input fields will appear--%> </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Inbound documents received-->
<div class="modal fade" id="inboundReceivedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left: 15em; margin-top: -10em; overflow-y: hidden">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body row">
                <s:form action="dateReceivedInbound" theme="bootstrap">
                    <s:textfield cssClass="form-control"  id="order-Id" name="orderIdParam" type="hidden" />
                    <div class="col-md-12">
                        <label class="control-label" >Date Received</label>
                        <div>
                            <s:textfield type="text" cssClass="form-control" id="datepicker" name="dateReturnedInbound" required="true" placeholder="Select Returned date"></s:textfield>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <label class="control-label" style="padding-top:0px;">No. of SI / DR documents returned</label>
                        <div>
                            <s:select cssClass="form-control" name="quantitySI_DR" cssStyle="margin-bottom: 15px !important; resize: none;" list="documentQuantity" emptyOption="true" required="true" />
                        </div>
                    </div>

                    <div style="float: right; margin-right: 1em; margin-top: 2em;">
                        <s:submit name="submit" cssClass="btn btn-primary" value="Okay" onclick="addOrderId()" />
                    </div>
                </s:form>
            </div>

        </div>
    </div>
</div>

<%--Modal for Final Outbound Documents Sent--%>
<div class="modal fade" id="sendFinalOutbound" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body row">
                <s:form action="finalOutboundSent" theme="bootstrap">
                    <div class="col-md-12">
                        <label class="control-label" >Date Sent</label>
                        <div>
                            <s:textfield type="text" cssClass="form-control" id="datepicker2" name = "dateSentFinalOutbound" cssStyle="margin-bottom: 15px;" required="true" placeholder="Select Date Sent"></s:textfield>
                        </div>
                    </div>
                    <s:textfield cssClass="form-control"  id="order-Id" name="orderIdParam" type="hidden" />
                    <div class="col-md-12">
                        <label class="control-label" >Tracking Number</label>
                        <div>
                            <s:textfield type="text" cssClass="form-control" name = "finalOutboundTrackingNumber" cssStyle="margin-bottom: 15px !important;" required="true" placeholder="Input Tracking Number"></s:textfield>
                        </div>
                    </div>
                    <div style="float: right; margin-right: 1em; margin-top: 2em;">
                        <s:submit name="submit" cssClass="btn btn-primary" value="Okay" onclick="addOrderId()" />
                    </div>
                </s:form>
            </div>

        </div>
    </div>
</div>

<%--Modal for Final Inbound Documents--%>
<div class="modal fade " id="finalInboundReceivedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Final Inbound Documents</h4>
            </div>
            <div class="modal-body" style="margin-top: -10px;">
                <s:form action="dateReceivedFinalInbound" theme="bootstrap">
                    <label style="margin-left: 0.5em;" class="control-label">Date Received</label>
                    <s:textfield type="text" cssClass="form-control" id="datepicker3" name="dateReturnedFinalInbound" required="true" placeholder="Select Returned date"></s:textfield>
                    <s:textfield cssClass="form-control"  id="order-Id" name="orderIdParam" type="hidden" />
                    <div style="margin-top: 1em;" class="pull-right">
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                        <s:submit name="submit" cssClass="btn btn-primary" value="Okay" onclick="addOrderId()" />
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function(){
        massCheckbox('outboundCheckBox', 'outboundTable');
        massCheckbox('inboundCheckBox', 'inbound_table');
        massCheckbox('foCheckBox', 'final_outbound_table');
        massCheckbox('fiCheckBox', 'final_inbound_table');

        $('.checkBtn').click(function(){
            localStorage.setItem('checkDocuments', 'FOCUS');
        })

        $('i[class="fa fa-edit"]').click(function () {
            localStorage.setItem('editDocuments', 'FOCUS');
        })
    })

    $(function() {
        $('#myTab a:first').tab('show');

        //for bootstrap 3 use 'shown.bs.tab' instead of 'shown' in the next line
        $('a[data-toggle="tab"]').on('click', function (e) {
            localStorage.setItem('lastTab', $(e.target).attr('href'));
        });

        //go to the latest tab, if it exists:
        var lastTab = localStorage.getItem('lastTab'),
            documentEdit = localStorage.getItem('checkDocuments'),
            documentCheck = localStorage.getItem('editDocuments');

        if (lastTab) {
            $('a[href="'+lastTab+'"]').click();
        }

        if(documentEdit || documentCheck){
//            $('.checkBtn').focus();
            $(document).scrollTop($(document).height());
        }
    });

    function addCheckText() {
        var orderIdGet = document.getElementById("order_Id").value;

        document.getElementById("documentItem").value = "check";
        document.getElementById("order-Id").value = orderIdGet;
    }

    function addCheckTextInbound() {
        var orderIdGet = document.getElementById("order_Id").value;

        document.getElementById("documentItemInbound").value = "check";
        document.getElementById("order-Id").value = orderIdGet;
    }

    function addCheckTextFinalOutbound() {
        var orderIdGet = document.getElementById("order_Id").value;

        document.getElementById("documentItemFinalOutbound").value = "check";
        document.getElementById("order-Id").value = orderIdGet;
    }

    function addCheckTextFinalInbound() {
        var orderIdGet = document.getElementById("order_Id").value;

        document.getElementById("documentItemFinalInbound").value = "check";
        document.getElementById("order-Id").value = orderIdGet;
    }

    function addCheckTextComplete() {
        var orderIdGet = document.getElementById("order_Id").value;

        document.getElementById("documentItemComplete").value = "check";
        document.getElementById("order-Id").value = orderIdGet;
    }

    function addOrderId() {
        var orderIdGet = document.getElementById("order_Id").value;
        document.getElementById("order-Id").value = orderIdGet;
    }

$(document).ready(function() {
    // START function to handle "new line" characters on comments column on all tables. refer to : ernest.js - Jan Sarmiento
    newlineHandler('outbound_table', 6);
    newlineHandler('inbound_table', 6);
    newlineHandler('final_outbound_table', 6);
    newlineHandler('final_inbound_table', 6);
    // END
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
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}

    $('.addDocTrigger').click(function(){
        $.ajax({
            url: 'getAddDocumentAction',
            async: false,
            type: 'POST',
            data: { orderIdParam: $(this).attr('data-referenceId') , documentStageParam: $(this).attr('data-stage') },
            dataType: 'html',
            success: function (html) {
                $('#documentInputDiv').empty().html(html);
                $('#addDocumentModal').modal().show();
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    });

    function generateReport(documentId,documentName,vendorCode) {
    if (documentName == "BOOKING REQUEST FORM") {
//        alert(vendorCode);
        var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId , 'bookingRequest', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Booking Request Form";
            window.location.href = '#documentTab';
        }
    }
    else if (documentName == "HOUSE BILL OF LADING") {
        var win = window.open('documentations/generateBillofLadingReport?documentIdParam=' + documentId, 'HouseBillofLading', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Bill of Lading";
            window.location.href = '#documentTab';
        }
    }
    else if (documentName == "HOUSE WAYBILL ORIGIN") {
        var win = window.open('documentations/generateHouseWayBillReport?documentIdParam=' + documentId, 'HouseWayBillOrigin', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Way Bill Origin";
            window.location.href = '#documentTab';
        }
    }
    else if (documentName == "HOUSE WAYBILL DESTINATION") {
        var win = window.open('documentations/generateHouseWayBillDestinationReport?documentIdParam=' + documentId, 'HouseWayBillDestination', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " House Way Bill Destination";
            window.location.href = '#documentTab';
        }
    }
    else if (documentName == "ACCEPTANCE RECEIPT") {
        var win = window.open('documentations/generateAcceptanceReceiptReport?documentIdParam=' + documentId, 'Acceptance Receipt', 'width=910,height=800');
        win.onload = function () {
            this.document.title = " Acceptance Receipt";
            window.location.href = '#documentTab';
        }
    }
    else if (documentName == "AUTHORIZATION TO WITHDRAW") {
        var win = window.open('documentations/generateAuthorizationToWithdrawReport?documentIdParam=' + documentId, 'Authorization to Withdraw', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Authorization to Withdraw";
            window.location.href = '#documentTab';
        }
    }
    else if (documentName == "PROFORMA BILL OF LADING") {
        var win = window.open('documentations/generateProformaReport?documentIdParam=' + documentId, 'Proforma Bill of Lading', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Authorization to Withdraw";
            window.location.href = '#documentTab';
        }
    }
    else if (documentName == "RELEASE ORDER") {
        var win = window.open('documentations/generateReleaseOrderReport?documentIdParam=' + documentId, 'Release Order', 'width=910,height=800');
        win.onload = function() {
            this.document.title = "Release Order";
            window.location.href = '#focusHere';
        }
    }
}

// Date Time Picker
var returnedDate = $('#datepicker');
var sentDate = $('#datepicker2');
var finalReturnedDate = $('#datepicker3');

returnedDate.datepicker({

    timeFormat: 'h:mm TT',
    minDate: 0

});

sentDate.datepicker({

    timeFormat: 'h:mm TT',
    minDate: 0

});

finalReturnedDate.datepicker({

    timeFormat: 'h:mm TT',
    minDate: 0

});

</script>