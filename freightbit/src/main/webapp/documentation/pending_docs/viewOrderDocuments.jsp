<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%--<script>

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

            if(final_outbound_tab == "FINAL_OUTBOUND_SENT" ){

                $("#third").toggleClass('active complete');
                $("#fourth").toggleClass('disabled active');
            }

            var final_inbound_tab = $("#documentTabFinalInbound").val();

            if(final_inbound_tab == "FINAL_INBOUND_COMPLETE" ){

                $("#fourth").toggleClass('active complete');
                $("#fifth").toggleClass('disabled active');
            }

        });

    });

</script>--%>

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
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Customer Name</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                            </div>
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px; text-align: center;">Consignee Name</label>
                            <div class="col-lg-4">
                                <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
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

                <%--<div class="well">

                    <div class="container">

                        <div class="row bs-wizard" style="border-bottom:0;">

                            <div class="col-xs-2 bs-wizard-step active" id="first">
                                <div class="text-center bs-wizard-stepnum">OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#outbound" class="bs-wizard-dot" data-toggle="tab" onclick="OutboundProgress()"></a>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="second"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#inbound" class="bs-wizard-dot" data-toggle="tab" onclick="InboundProgress()"></a>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="third"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">FINAL OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalOutbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalOutboundProgress()"></a>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="fourth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">FINAL INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalInbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalInboundProgress()"></a>
                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="fifth"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">COMPLETE</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#complete" class="bs-wizard-dot" data-toggle="tab" onclick="completeProgress()"></a>
                            </div>

                        </div>

                    </div>

                </div>--%>

            </div>

            <%--------------------------FOR EXAMPLE PURPOSES------------------------------%>
            <%--<div id="leftDiv">
                &lt;%&ndash;<s:include value="/documentation/result.jsp"></s:include>&ndash;%&gt;
            </div>
            <div>
                <a href="#" id="idAnchor">Partial Refresh</a>
            </div>--%>
            <%--------------------------FOR EXAMPLE PURPOSES------------------------------%>

            <%--<div id="inputDiv"> &t;%&ndash;Area where input fields will appear&ndash;%&gt;
            </div>--%>

            <%--<s:if test="hasActionMessages()">
                <div class="col-lg-12">
                    <div class="alert alert-errors">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                    </div>
                </div>
            </s:if>--%>

            <%--Anchor on tab click--%>
            <%--<s:textfield  value="%{documentTabArchive}" id="documentTabArchive"  />
            <s:textfield  value="%{documentTabBilling}" id="documentTabBilling"  />--%>
            <%--cssStyle="visibility: hidden;"--%>

                <s:if test="hasActionMessages()">
                    <div class="col-lg-12" id="successDiv">
                        <div id="alert" class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                        </div>
                    </div>
                </s:if>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist" style="padding-left: 10px;">
                    <%--Redirects to Outbound Stage--%>
                    <li class="active" id="out">
                        <%--<s:url var="outboundStageUrl" action="viewOrderDocuments">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            &lt;%&ndash;<s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>&ndash;%&gt;
                        </s:url>
                        <s:a class="icon-action-link" href="%{outboundStageUrl}">
                            Outbound
                        </s:a>--%>
                        <a href="#outbound" role="tab" data-toggle="tab">Outbound</a>
                    </li>
                    <%--Redirects to Inbound Stage--%>
                    <li id="in">
                        <%--<s:url var="inboundStageUrl" action="viewOrderDocumentsInbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            &lt;%&ndash;<s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>&ndash;%&gt;
                        </s:url>
                        <s:a class="icon-action-link" href="%{inboundStageUrl}">
                            Inbound
                        </s:a>--%>
                        <a href="#inbound" role="tab" data-toggle="tab">Inbound</a>
                    </li>
                    <%--Redirects to Final Outbound Stage--%>
                    <li id="fiOut">
                        <%--<s:url var="finalOutboundStageUrl" action="viewOrderDocumentsFinalOutbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{finalOutboundStageUrl}">
                            Final Outbound
                        </s:a>--%>
                        <a href="#finalOutbound" role="tab" data-toggle="tab">Final Outbound</a>
                    </li>
                    <%--Redirects to Final Inbound Stage--%>
                    <li id="fiIn">
                        <%--<s:url var="finalInboundStageUrl" action="viewOrderDocumentsFinalInbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{finalInboundStageUrl}">
                            Final Inbound
                        </s:a>--%>
                        <a href="#finalInbound" role="tab" data-toggle="tab">Final Inbound</a>
                    </li>
                    <li id="comp"><a href="#complete" role="tab" data-toggle="tab">Complete</a></li>
                    <%--<li id="arch"><a href="#archive" role="tab" data-toggle="tab">Archive</a></li>
                    <li id="bill"><a href="#billing" role="tab" data-toggle="tab">Billing</a></li>--%>
                </ul>

                <div class="tab-content" id="focusHere" tabindex="-1">
<%------------------------------------------OUTBOUND DOCUMENTS BEGIN-----------------------------------------------%>

                    <div class="tab-pane fade in active" id="outbound">

                        <div class="panel-body">

                            <%--<s:if test=" documentTab == 'OUTBOUND_PENDING' ">--%>

                                <%--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#inboundReceivedModal">
                                    Activate Outbound Documents
                                </button>--%>

                                <%--<s:url var="activateOutboundUrl" action="activateOutbound">
                                    <s:param name="orderIdParam"
                                             value="#attr.order.orderId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{activateOutboundUrl}" rel="tooltip">
                                    <button type="button" class="btn btn-primary">Activate Outbound Documents</button>
                                </s:a>--%>

                            <%--</s:if>--%>

                            <s:if test=" documentTab == 'OUTBOUND_READY' ">

                                <div class="table-responsive">
                                    <s:form name="myform" action="processDocuments">
                                    <s:textfield type="hidden" name="document.documentItem" id="documentItem"></s:textfield>
                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>

                                    <display:table id="document" name="outboundDocuments" requestURI="viewOrderDocuments.action" pagesize="50" class="outboundTable outbound_table table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">

                                        <td>
                                            <%--<display:column title="<input type='checkbox' id='outboundCheckBox' name='outboundCheckBox'/>">--%>
                                                <display:column title="">

                                                <%--<s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>--%>
                                                <%--<s:property value="%{#attr.document.documentId}"/>--%>

                                                <%--<s:if test=" documentTab == 'OUTBOUND_STAGE' || documentTab == 'OUTBOUND_COMPLETE' || documentTab == 'OUTBOUND_STAGE_PENDING'">--%>

                                                    <s:if test="#attr.document.documentProcessed == 0">
                                                        <s:url var="checkDocumentUrl" action="checkDocument">
                                                            <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                        </s:url>
                                                        <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Check Document">
                                                            <i class="fa fa-square-o"></i>
                                                        </s:a>
                                                        <%--<s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>--%>
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

                                                <%--</s:if>--%>

                                                <%--<s:else>--%>

                                                    <%--<i class="fa fa-square-o"></i>--%>

                                                <%--</s:else>--%>

                                            </display:column>
                                        </td>

                                        <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                            </display:column>
                                        </td>

                                        <td><display:column property="referenceNumber" title="Series Number" class="tb-font-black" style="text-align: center;">
                                            </display:column>
                                        </td>

                                        <td><display:column property="vendorCode" title="Vendor" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                            style="text-align: center;" > </display:column></td>

                                        <td><display:column property="documentComments" title="Comments" class="tb-font-black"
                                                            style="text-align: center;" > </display:column></td>

                                        <%--<td><display:column property="documentType" title="Comments" class="tb-font-black"
                                                            style="text-align: center;" > </display:column></td>--%>

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
                                                        <a id="edit-icon" href="#" data-toggle="modal" data-target="#inputModal" onclick="showInputFields(${document.referenceId},'${document.documentId}');">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                    <%--</s:if>--%>
                                                    <%--Print Document--%>
                                                    <s:if test="#attr.document.documentName=='BOOKING REQUEST FORM' || #attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN' || #attr.document.documentName=='ACCEPTANCE RECEIPT' || #attr.document.documentName=='PROFORMA BILL OF LADING' ">
                                                        <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                            <i class="fa fa-print"></i>
                                                        </a>
                                                    </s:if>

                                                    <s:url var="deleteDocumentUrl" action="deleteDocument">
                                                        <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{deleteDocumentUrl}" rel="tooltip" title="Delete Document" onclick="return confirm('Delete this document?');">
                                                        <i class="fa fa-trash-o"></i>
                                                    </s:a>
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

                                </div>


                                    <%--<s:if test=" documentTab == 'OUTBOUND_STAGE' ">--%>

                                        <%--<s:submit tabindex="-1" cssClass="checkBtn btn btn-primary pull-right" value="Check Document(s)" onclick="addCheckText()"></s:submit>--%>

                                        <%--<s:url var="completeDocumentsUrl" action="completeDocuments">
                                            <s:param name="orderIdParam"
                                                     value="#attr.order.orderId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{completeDocumentsUrl}" rel="tooltip">
                                            <button type="button" class="btn btn-primary pull-right">Complete Outbound Stage</button>
                                        </s:a>--%>

                                        <a id="add-document" href="#" data-toggle="modal" data-target="#addDocumentModal" onclick="addDocument(${order.orderId},'OUTBOUND');">
                                            <button type="button" class="btn btn-primary pull-right">Add Outbound Document</button>
                                        </a>

                                        <%--<s:url var="addOutboundDocumentUrl" action="addOutboundDocument">
                                            <s:param name="orderIdParam"
                                                     value="#attr.order.orderId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{addOutboundDocumentUrl}" rel="tooltip">
                                            <button type="button" class="btn btn-primary pull-right">Add Outbound Document</button>
                                        </s:a>--%>

                                    <%--</s:if>--%>

                                </s:form>
                            </s:if>
                        </div>

                    </div>

<%------------------------------------------OUTBOUND DOCUMENTS END-----------------------------------------------%>

<%------------------------------------------INBOUND DOCUMENTS END-----------------------------------------------%>

                    <div class="tab-pane fade" id="inbound">

                        <div class="panel-body">

                            <%--<s:if test=" documentTabInbound == 'NO_INBOUND_DOCUMENTS' && documentTab == 'OUTBOUND_COMPLETE' ">

                                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#inboundReceivedModal">
                                    Activate Inbound Documents
                                </button>

                            </s:if>--%>

                            <s:if test=" documentTabInbound == 'INBOUND_READY' ">

                                <%--<div class="form-group" style="padding-left: 15px;">--%>
                                    <%--Date/Time received : <s:label name = "dateReturnedInbound"></s:label>--%>
                                    <%--<label class="col-lg-2 control-label" >Date Received</label>--%>
                                    <%--<div class="col-lg-3">--%>
                                        <%--<s:textfield type="text" cssClass="form-control" name = "dateReturnedInbound" cssStyle="margin-bottom: 15px;" disabled="true"></s:textfield>--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <div class="table-responsive" style="clear:both;">
                                    <s:form name="myform" action="processDocumentsInbound">
                                    <s:textfield type="hidden" name="orderIdParam" id="order-Id"   />
                                    <s:textfield type="hidden" name="document.documentItem" id="documentItemInbound" />
                                    <display:table id="document" name="inboundDocuments" requestURI="viewOrderDocuments.action" pagesize="50" class="inbound_table table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">

                                        <td>
                                            <%--<display:column title="<input type='checkbox' id='inboundCheckBox' />" class="tb-font-black" style="text-align: center;" >--%>
                                                <display:column title="">

                                                <%--<s:if test=" documentTabInbound == 'INBOUND_STAGE' ">--%>

                                                    <s:if test="#attr.document.documentProcessed <= 1">
                                                        <s:url var="checkDocumentInboundUrl" action="checkDocumentInbound">
                                                            <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                        </s:url>
                                                        <s:a class="icon-action-link" href="%{checkDocumentInboundUrl}" rel="tooltip" title ="Check Document">
                                                            <i class="fa fa-square-o"></i>
                                                        </s:a>
                                                    </s:if>
                                                    <s:else>
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:else>

                                                    <%--<s:if test="#attr.document.documentProcessed == 1">
                                                        <s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>
                                                    </s:if>
                                                    <s:else>
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:else>--%>

                                                <%--</s:if>--%>

                                                <%--<s:if test=" documentTabInbound == 'INBOUND_COMPLETE' ">--%>

                                                    <%--&lt;%&ndash;<s:url var="checkDocumentInboundUrl" action="checkDocumentInbound">--%>
                                                        <%--<s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>--%>
                                                    <%--</s:url>--%>
                                                    <%--<s:a class="icon-action-link" href="%{checkDocumentInboundUrl}" rel="tooltip" title ="Check Document">--%>
                                                        <%--<i class="fa fa-square-o"></i>--%>
                                                    <%--</s:a>&ndash;%&gt;--%>
                                                    <%--<s:if test="#attr.document.documentProcessed == 1">--%>
                                                        <%--<i class="fa fa-square-o"></i>--%>
                                                    <%--</s:if>--%>
                                                    <%--<s:else>--%>
                                                        <%--<i class="fa fa-check-square-o"></i>--%>
                                                    <%--</s:else>--%>

                                                <%--</s:if>--%>

                                                <%--<s:if test=" documentTabInbound == 'NO_INBOUND_DATE' || documentTabInbound == 'OUTBOUND_DOCUMENTS_INCOMPLETE' ">--%>

                                                    <%--<i class="fa fa-square-o"></i>--%>

                                                <%--</s:if>--%>

                                                <%--<s:else>

                                                    <i class="fa fa-square-o"></i>

                                                </s:else>--%>

                                                <%--<s:if test="#attr.document.documentProcessed == 0">
                                                    <s:url var="checkDocumentInboundUrl" action="checkDocumentInbound">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{checkDocumentInboundUrl}">
                                                        <i class="fa fa-square-o"></i>
                                                    </s:a>
                                                </s:if>

                                                <s:else>
                                                    &lt;%&ndash;<s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:a>&ndash;%&gt;
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:else>--%>
                                                <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>

                                                <%--<input id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>--%>

                                            </display:column>
                                        </td>

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

                                                <%--<s:if test=" documentTabInbound == 'INBOUND' ">--%>

                                                <%--<input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>--%>

                                                <%--Input Reference ID--%>
                                                <%--<s:if test="#attr.document.documentName=='MASTER BILL OF LADING' || #attr.document.documentName=='SALES INVOICE' || #attr.document.documentName=='MASTER WAYBILL ORIGIN' ">--%>
                                                <%--<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                    <i class="fa fa-edit"></i>
                                                </a>--%>
                                                <%--<s:url var="addReferenceNumberInboundUrl" action="orderDocumentsInboundInput">
                                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="edit-icon" class="icon-action-link" href="%{addReferenceNumberInboundUrl}" rel="tooltip" title ="Add Reference Number">
                                                    <i class="fa fa-edit"></i>
                                                </s:a>--%>
                                                <a id="edit-icon" href="#" data-toggle="modal" data-target="#inputModal" onclick="showInputFields(${document.referenceId},'${document.documentId}');">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <%--</s:if>--%>
                                                <%--Print Document--%>
                                                <s:if test="#attr.document.documentName=='BOOKING REQUEST FORM' || #attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN' || #attr.document.documentName=='ACCEPTANCE RECEIPT' || #attr.document.documentName=='PROFORMA BILL OF LADING' ">
                                                    <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                </s:if>

                                                <s:url var="deleteDocumentUrl" action="deleteDocument">
                                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteDocumentUrl}" rel="tooltip" title="Delete Document" onclick="return confirm('Delete this document?');">
                                                    <i class="fa fa-trash-o"></i>
                                                </s:a>

                                                <%--Move Document--%>
                                                <%--<s:url var="moveDocumentInboundUrl" action="moveDocumentInbound">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="check-icon" class="icon-action-link" href="%{moveDocumentInboundUrl}" rel="tooltip" title ="Next Stage">
                                                    <i class="fa fa-hand-o-right"></i>
                                                </s:a>--%>

                                                <%--</s:if>--%>

                                                <%--<s:if test=" documentTabInbound == 'NO_INBOUND_DATE' || documentTabInbound == 'OUTBOUND_DOCUMENTS_INCOMPLETE' || documentTabInbound == 'INBOUND_COMPLETE' ">

                                                    <i class="fa fa-ban"></i>

                                                </s:if>--%>

                                                <%--<s:else>

                                                    <i class="fa fa-ban"></i>

                                                </s:else>--%>

                                            </display:column>
                                        </td>

                                    </display:table>

                                <%--<s:if test=" documentTabInbound == 'INBOUND_STAGE' ">--%>

                                    <%--<s:submit cssClass="btn btn-primary pull-right"  value="Check Document(s)" onclick="addCheckTextInbound()"></s:submit>--%>
                                    <%--<s:url var="completeDocumentsInboundUrl" action="completeDocumentsInbound">
                                        <s:param name="orderIdParam"
                                                 value="#attr.order.orderId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{completeDocumentsInboundUrl}" rel="tooltip">
                                        <button type="button" class="btn btn-primary pull-right">Complete Inbound Stage</button>
                                    </s:a>--%>

                                <%--</s:if>--%>

                                    <a id="add-document" href="#" data-toggle="modal" data-target="#addDocumentModal" onclick="addDocument(${order.orderId},'INBOUND');">
                                        <button type="button" class="btn btn-primary pull-right">Add Inbound Document</button>
                                    </a>

                                </s:form>

                                </div>

                            </s:if>

                        </div>

                    </div>

<%------------------------------------------INBOUND DOCUMENTS END-----------------------------------------------%>

<%------------------------------------------FINAL OUTBOUND DOCUMENTS BEGIN-----------------------------------------------%>

                    <div class="tab-pane fade" id="finalOutbound">

                        <div class="panel-body">

                            <%--<s:if test=" documentTabFinalOutbound == 'NO_FINAL_OUTBOUND_DOCUMENTS' && documentTabInbound == 'INBOUND_COMPLETE' ">
                                <s:url var="activateFinalOutboundUrl" action="activateFinalOutbound">
                                    <s:param name="orderIdParam"
                                             value="#attr.order.orderId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{activateFinalOutboundUrl}" rel="tooltip">
                                    <button type="button" class="btn btn-primary">Activate Final Outbound Documents</button>
                                </s:a>
                            </s:if>--%>

                            <s:if test=" documentTabFinalOutbound == 'FINAL_OUTBOUND_READY' && documentTab != 'OUTBOUND_MISSING' ">

                                <%--<div class="form-group" style="padding-left: 15px;">--%>
                                    <%--<p>Date/Time sent : <s:label name = "dateSentFinalOutbound"></s:label></p>--%>
                                    <%--<p>Tracking number : <s:label name = "finalOutboundTrackingNumber"></s:label></p>--%>
                                    <%--<label class="col-lg-3 control-label" >Date Sent</label>--%>
                                    <%--<div class="col-lg-3">--%>
                                        <%--<s:textfield type="text" cssClass="form-control" name = "dateSentFinalOutbound" cssStyle="margin-bottom: 15px;" disabled="true"></s:textfield>--%>
                                    <%--</div>--%>
                                    <%--<label class="col-lg-2 control-label" >Tracking Number</label>--%>
                                    <%--<div class="col-lg-3">--%>
                                        <%--<s:textfield type="text" cssClass="form-control" name = "finalOutboundTrackingNumber" cssStyle="margin-bottom: 15px;" disabled="true"></s:textfield>--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <div class="table-responsive" style="clear:both;">
                                <s:form name="myform" action="processDocumentsFinalOutbound">
                                    <s:textfield type="hidden" name="orderIdParam" id="order-Id"   />
                                    <s:textfield type="hidden" name="document.documentItem" id="documentItemFinalOutbound"></s:textfield>
                                    <display:table id="document" name="finalOutboundDocuments" requestURI="viewOrderDocuments.action" pagesize="50" class="final_outbound_table table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">

                                        <td>
                                            <%--<display:column title="<input type='checkbox' id='foCheckBox'/>" class="tb-font-black" style="text-align: center;">--%>
                                            <display:column title="">

                                                <%--<s:if test=" documentTabFinalOutbound == 'FINAL_OUTBOUND_STAGE' || documentTabFinalOutbound == 'FINAL_OUTBOUND_PENDING' ">--%>

                                                    <s:if test="#attr.document.documentProcessed <= 2">
                                                        <s:url var="checkDocumentFinalOutboundUrl" action="checkDocumentFinalOutbound">
                                                            <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                        </s:url>
                                                        <s:a class="icon-action-link" href="%{checkDocumentFinalOutboundUrl}">
                                                            <i class="fa fa-square-o"></i>
                                                        </s:a>
                                                    </s:if>
                                                    <s:else>
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:else>

                                                    <%--<s:if test="#attr.document.documentProcessed == 2">
                                                        <s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>
                                                    </s:if>
                                                    <s:else>
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:else>--%>

                                                    <%--<s:else>--%>
                                                        <%--<s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                            <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                        </s:url>
                                                        <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                            <i class="fa fa-check-square-o"></i>
                                                        </s:a>--%>

                                                        <%--<i class="fa fa-check-square-o"></i>--%>
                                                    <%--</s:else>--%>

                                                    <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>
                                                    <%--<input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>--%>

                                                <%--</s:if>--%>

                                                <%--<s:if test=" documentTabFinalOutbound == 'FINAL_OUTBOUND_DOCUMENTS_INCOMPLETE' ">
                                                    <i class="fa fa-square-o"></i>
                                                </s:if>--%>

                                                <%--<s:if test=" documentTabFinalOutbound == 'FINAL_OUTBOUND_COMPLETE' || documentTabFinalOutbound == 'FINAL_OUTBOUND_SENT' ">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:if>--%>

                                            </display:column>

                                        </td>

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
                                                <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                                    <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                    <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                    <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                                </display:column>--%>
                                            <display:column title="Action" class="tb-font-black" style="text-align: center;" >

                                                <%--<input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>--%>

                                                <%--Input Reference ID--%>
                                                <%--<s:if test="#attr.document.documentName=='MASTER BILL OF LADING' || #attr.document.documentName=='SALES INVOICE / DELIVERY RECEIPT' || #attr.document.documentName=='MASTER WAYBILL ORIGIN' ">--%>
                                                <%--<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                    <i class="fa fa-edit"></i>
                                                </a>--%>
                                                <%--<s:url var="notifyByFaxFinalOutboundUrl" action="notifyByFaxFinalOutbound">
                                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="edit-icon" class="icon-action-link" href="%{notifyByFaxFinalOutboundUrl}" rel="tooltip" title ="Add Reference Number">
                                                    <i class="fa fa-fax"></i>
                                                </s:a>
                                            </s:if>--%>
                                                <a id="edit-icon" href="#" data-toggle="modal" data-target="#inputModal" onclick="showInputFields(${document.referenceId},'${document.documentId}');">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <%--Print Document--%>
                                                <s:if test="#attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='AUTHORIZATION TO WITHDRAW' || #attr.document.documentName=='HOUSE WAYBILL DESTINATION' || #attr.document.documentName=='ACCEPTANCE RECEIPT' || #attr.document.documentName=='RELEASE ORDER' ">
                                                    <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                </s:if>

                                                <s:url var="deleteDocumentUrl" action="deleteDocument">
                                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteDocumentUrl}" rel="tooltip" title="Delete Document" onclick="return confirm('Delete this document?');">
                                                    <i class="fa fa-trash-o"></i>
                                                </s:a>

                                                <%--Move Document--%>
                                                <%--<s:url var="moveDocumentFinalOutboundUrl" action="moveDocumentFinalOutbound">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="check-icon" class="icon-action-link" href="%{moveDocumentFinalOutboundUrl}" rel="tooltip" title ="moveDocumentFinalOutboundUrl ">
                                                    <i class="fa fa-hand-o-right"></i>
                                                </s:a>--%>

                                            </display:column>
                                        </td>

                                    </display:table>
                                    </div>

                                    <%--<s:if test=" documentTabFinalOutbound == 'FINAL_OUTBOUND_STAGE' || documentTabFinalOutbound == 'FINAL_OUTBOUND_PENDING' ">--%>

                                        <%--<s:submit cssClass="btn btn-primary pull-right" value="Check Document(s)" onclick="addCheckTextFinalOutbound()"></s:submit>--%>
                                        <%--<button type="button" id="Cancel" class="pull-right btn" onclick="addCheckTextFinalOutbound()">
                                            Check Document(s)
                                        </button>--%>

                                        <%--<s:url var="completeDocumentsFinalOutboundUrl" action="completeDocumentsFinalOutbound">
                                            <s:param name="orderIdParam"
                                                     value="#attr.order.orderId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{completeDocumentsFinalOutboundUrl}" rel="tooltip">
                                            <button type="button" class="btn btn-primary pull-right">Complete Final Outbound Stage</button>
                                        </s:a>--%>

                                    <%--</s:if>--%>

                                    <%--<s:if test=" documentTabFinalOutbound == 'FINAL_OUTBOUND_COMPLETE' ">--%>
                                        <%--<button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#sendFinalOutbound">--%>
                                            <%--Send Documents--%>
                                        <%--</button>--%>
                                    <%--</s:if>--%>

                                    <a id="add-document" href="#" data-toggle="modal" data-target="#addDocumentModal" onclick="addDocument(${order.orderId},'FINAL OUTBOUND');">
                                        <button type="button" class="btn btn-primary pull-right">Add Final Outbound Document</button>
                                    </a>

                                </s:form>

                            </s:if>

                        </div>

                    </div>

<%------------------------------------------FINAL OUTBOUND DOCUMENTS END-----------------------------------------------%>

<%------------------------------------------FINAL INBOUND DOCUMENTS BEGIN-----------------------------------------------%>

                    <div class="tab-pane fade" id="finalInbound">

                        <div class="panel-body">

                            <%--<s:if test=" documentTabFinalInbound == 'NO_FINAL_INBOUND_DOCUMENTS' && documentTabFinalOutbound == 'FINAL_OUTBOUND_SENT'">

                                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#finalInboundReceivedModal">
                                    Activate Finale Inbound Documents
                                </button>

                            </s:if>--%>

                            <s:if test=" documentTabFinalInbound == 'FINAL_INBOUND_READY' ">

                                <%--<div class="form-group" style="padding-left: 15px;">--%>
                                    <%--<p>Date Receieved : <s:label name="dateReturnedFinalInbound" ></s:label></p>--%>
                                    <%--<label class="col-lg-3 control-label" >Date Received</label>--%>
                                    <%--<div class="col-lg-3">--%>
                                        <%--<s:textfield type="text" cssClass="form-control" name = "dateReturnedFinalInbound" cssStyle="margin-bottom: 15px;" disabled="true"></s:textfield>--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <div class="table-responsive" style="clear:both;">
                                    <s:form name="myform" action="processDocumentsFinalInbound">
                                    <s:textfield type="hidden" name="orderIdParam" id="order-Id"   />
                                    <s:textfield type="hidden" name="document.documentItem" id="documentItemFinalInbound"></s:textfield>
                                    <display:table id="document" name="finalInboundDocuments" requestURI="viewOrderDocuments.action" pagesize="50" class="final_inbound_table table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">

                                        <td>
                                            <%--<display:column title="<input type='checkbox' id='fiCheckBox' />" class="tb-font-black" style="text-align: center;">--%>
                                            <display:column title="">

                                                <s:if test="#attr.document.documentProcessed <= 3">
                                                    <s:url var="checkDocumentFinalInboundUrl" action="checkDocumentFinalInbound">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{checkDocumentFinalInboundUrl}" rel="tooltip" title ="Check Document">
                                                        <i class="fa fa-square-o"></i>
                                                    </s:a>
                                                    <%--<s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>--%>
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
                                                <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                            </display:column>
                                        </td>

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

                                        <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                            style="text-align: center;" > </i></display:column></td>--%>

                                        <td>
                                                <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                                    <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                    <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                    <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                                </display:column>--%>
                                            <display:column title="Action" class="tb-font-black" style="text-align: center;" >

                                                <%--<input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>--%>

                                                <%--Input Reference ID--%>
                                                <%--<s:if test="#attr.document.documentName=='MASTER BILL OF LADING' || #attr.document.documentName=='SALES INVOICE / DELIVERY RECEIPT WITH SIGNATURE' || #attr.document.documentName=='MASTER WAYBILL DESTINATION' ">
                                                    &lt;%&ndash;<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                        <i class="fa fa-edit"></i>
                                                    </a>&ndash;%&gt;
                                                    <s:url var="addReferenceNumberFinalInboundUrl" action="addReferenceNumberFinalInbound">
                                                        <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a id="edit-icon" class="icon-action-link" href="%{addReferenceNumberFinalInboundUrl}" rel="tooltip" title ="Add Reference Number">
                                                        <i class="fa fa-edit"></i>
                                                    </s:a>
                                                </s:if>--%>
                                                <a id="edit-icon" href="#" data-toggle="modal" data-target="#inputModal" onclick="showInputFields(${document.referenceId},'${document.documentId}');">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <%--Print Document--%>
                                                <s:if test="#attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE RELEASE ORDER' || #attr.document.documentName=='HOUSE WAYBILL DESTINATION' || #attr.document.documentName=='AUTHORIZATION TO WITHDRAW' ">
                                                    <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                </s:if>

                                                <s:url var="deleteDocumentUrl" action="deleteDocument">
                                                    <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteDocumentUrl}" rel="tooltip" title="Delete Document" onclick="return confirm('Delete this document?');">
                                                    <i class="fa fa-trash-o"></i>
                                                </s:a>

                                                <%--Move Document--%>
                                                <%--<s:url var="moveDocumentFinalOutboundUrl" action="moveDocumentFinalOutbound">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="check-icon" class="icon-action-link" href="%{moveDocumentFinalOutboundUrl}" rel="tooltip" title ="moveDocumentFinalOutboundUrl ">
                                                    <i class="fa fa-hand-o-right"></i>
                                                </s:a>--%>

                                            </display:column>
                                        </td>

                                    </display:table>
                                </div>
                                        <%--<s:if test=" documentTabFinalInbound == 'FINAL_INBOUND_STAGE' ">--%>
                                            <%--<s:submit cssClass="btn btn-primary pull-right"  value="Check Document(s)" onclick="addCheckTextFinalInbound()"></s:submit>--%>
                                            <%--<button type="button" id="Cancel" class="pull-right btn" onclick="addCheckTextFinalInbound()">
                                                Check Document(s)
                                            </button>--%>
                                            <%--<s:url var="completeDocumentsFinalInboundUrl" action="completeDocumentsFinalInbound">
                                                <s:param name="orderIdParam"
                                                         value="#attr.order.orderId"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{completeDocumentsFinalInboundUrl}" rel="tooltip">
                                                <button type="button" class="btn btn-primary pull-right">Complete Final Inbound Stage</button>
                                            </s:a>--%>
                                        <%--</s:if>--%>

                                        <a id="add-document" href="#" data-toggle="modal" data-target="#addDocumentModal" onclick="addDocument(${order.orderId},'FINAL INBOUND');">
                                            <button type="button" class="btn btn-primary pull-right">Add Final Inbound Document</button>
                                        </a>

                                    </s:form>
                            </s:if>

                        </div>

                    </div>

<%------------------------------------------FINAL INBOUND DOCUMENTS END-----------------------------------------------%>

<%------------------------------------------COMPLETE DOCUMENTS BEGIN-----------------------------------------------%>

                    <div class="tab-pane fade" id="complete">

                        <div class="panel-body">

                            <s:if test=" documentTabComplete == 'COMPLETE_READY' || documentTabComplete == 'ARCHIVE_PENDING' ">

                                <div class="table-responsive" style="clear:both;">

                                <s:form name="myform" action="processDocumentsComplete">

                                <s:textfield type="hidden" name="orderIdParam" id="order-Id"/>
                                <s:textfield type="hidden" name="document.documentItem" id="documentItemComplete"></s:textfield>
                                <display:table id="document" name="completeDocuments" requestURI="viewOrderDocuments.action" pagesize="50" class="final_inbound_table table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px;">

                                    <td>

                                            <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <%--<display:column title="<input type='checkbox' id='fiCheckBox' />" class="tb-font-black" style="text-align: center;" >--%>

                                                <%--<s:if test=" documentTabComplete == 'COMPLETE_STAGE_ACTIVE' ">--%>

                                                    <s:if test="#attr.document.documentProcessed <= 4">
                                                        <s:checkbox theme="simple" name="check" fieldValue="%{#attr.document.documentId}"/>
                                                        <%--<s:url var="checkDocumentCompleteUrl" action="checkDocumentComplete">
                                                            <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                        </s:url>
                                                        <s:a class="icon-action-link" href="%{checkDocumentCompleteUrl}" rel="tooltip" title ="Check Document">
                                                            <i class="fa fa-square-o"></i>
                                                        </s:a>--%>
                                                    </s:if>

                                                    <s:else>
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:else>
                                                    <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>
                                                    <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                                <%--</s:if>--%>

                                            </display:column>

                                    </td>

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
                                            <s:if test="#attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE RELEASE ORDER' || #attr.document.documentName=='HOUSE WAYBILL DESTINATION' || #attr.document.documentName=='AUTHORIZATION TO WITHDRAW' || #attr.document.documentName=='BOOKING REQUEST FORM' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN' ">
                                                <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                    <i class="fa fa-print"></i>
                                                </a>
                                            </s:if>

                                            <s:url var="deleteDocumentUrl" action="deleteDocument">
                                                <s:param name="orderIdParam" value="%{#attr.document.referenceId}"></s:param>
                                                <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{deleteDocumentUrl}" rel="tooltip" title="Delete Document" onclick="return confirm('Delete this document?');">
                                                <i class="fa fa-trash-o"></i>
                                            </s:a>

                                        </display:column>

                                    </td>

                                </display:table>
                                </div>

                                <%--<s:if test=" documentTabComplete == 'COMPLETE_STAGE' ">--%>

                                    <s:submit cssClass="btn btn-primary pull-right"  value="Complete Document(s)" onclick="addCheckTextComplete()"></s:submit>

                                <%--</s:if>--%>

                                </s:form>

                                <s:if test=" documentTabFinalInbound == 'FINAL_INBOUND_COMPLETE' && documentTabComplete == 'COMPLETE_STAGE_INACTIVE' ">

                                    <s:url var="activateCompleteStageUrl" action="activateCompleteStage">
                                        <s:param name="orderIdParam"
                                                 value="#attr.order.orderId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{activateCompleteStageUrl}" rel="tooltip">
                                        <button type="button" class="btn btn-primary pull-right">Activate Complete Stage</button>
                                    </s:a>

                                </s:if>

                                <%--<s:property value="#attr.order.orderStatus" />--%>

                                <%--<s:if test=" documentTabComplete == 'ALL_DOCUMENTS_COMPLETE' &&  ">--%>

                                <s:if test=" #attr.order.orderStatus == 'SERVICE ACCOMPLISHED'  ">
                                    <s:url var="archiveStageUrl" action="activateArchive">
                                        <s:param name="orderIdParam"
                                                 value="#attr.order.orderId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{archiveStageUrl}" rel="tooltip">
                                        <button type="button" class="btn btn-primary pull-right">Move To Archive</button>
                                    </s:a>

                                </s:if>

                            </s:if>

                        </div>

                    </div>

<%------------------------------------------COMPLETE DOCUMENTS END-----------------------------------------------%>

            </div>

        </div>
    </div>
</div>

<s:property value="%{documentTab}" /> <br />
<s:property value="%{documentTabInbound}" /> <br />
<s:property value="%{documentTabFinalOutbound}" /> <br />
<s:property value="%{documentTabFinalInbound}" /> <br />
<s:property value="%{documentTabComplete}" /> <br />

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

<%--<s:textfield type="hidden" value="%{archiveCount}" id="archiveCount" />
<s:textfield type="hidden" value="%{billingCount}" id="billingCount" />--%>

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

function addDocument(referenceId,documentStage) {
//    document.getElementById("referenceId").value = referenceId;
    alert(documentStage);
    $.ajax({
        url: 'getAddDocumentAction',
        async: false,
        type: 'POST',
        data: { orderIdParam: referenceId , documentStageParam: documentStage },
        dataType: 'html',
        success: function (html) {
            $('#documentInputDiv').empty().html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}


    function generateReport(documentId,documentName) {
    if (documentName == "BOOKING REQUEST FORM") {
        var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
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
        var win = window.open('documentations/generateAuthorizationToWithdrawReport?documentIdParam=' + documentId, 'Proforma Bill of Lading', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Authorization to Withdraw";
            window.location.href = '#documentTab';
        }
    }
}

/*function generateReleaseOrderReport(){

    var win = window.open('documentations/generateReleaseOrderReport','bookingRequest','width=910,height=800');
    win.onload = function() { this.document.title = "Release Order"; }

}
*/

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

/*function OutboundProgress(){
    document.getElementById("out").className='active';
    document.getElementById("in").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
    document.getElementById("comp").className='';
}

function InboundProgress(){
    document.getElementById("out").className='';
    document.getElementById("in").className='active';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
    document.getElementById("comp").className='';
}

function finalOutboundProgress(){
    document.getElementById("out").className='';
    document.getElementById("in").className='';
    document.getElementById("fiOut").className='active';
    document.getElementById("fiIn").className='';
    document.getElementById("comp").className='';
}

function finalInboundProgress() {
    document.getElementById("out").className='';
    document.getElementById("in").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='active';
    document.getElementById("comp").className='';
}

function completeProgress() {
    document.getElementById("out").className='';
    document.getElementById("in").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
    document.getElementById("comp").className='active';
}*/

/*function archiveProgress() {
    document.getElementById("out").className='';
    document.getElementById("in").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
    document.getElementById("comp").className='';
    document.getElementById("arch").className='active';
    document.getElementById("bill").className='';
}

function BillingProgress() {
    document.getElementById("out").className='';
    document.getElementById("in").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
    document.getElementById("comp").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='active';
}*/

</script>