<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Booking</li>
            <li class="active"><a href="<s:url action='viewOrders' />"> Booking List </a> </li>
            <li class="active"> Booking Information</li>
        </ol>
    </div>
</div>

<div class="panel panel-primary">
    <%--<td><s:property value="#attr.order.documentId"/></td>--%>
    <div class="panel-heading">
        <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Booking Information</h3>
        <div class="btn-toolbar pull-right">
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                    <a class="btn btn-success" title="Edit Booking" href="<s:url action='loadEditOrderInBooking' ><s:param name="orderIdParam" value="%{order.orderId}"></s:param></s:url>" > <i class="fa fa-edit"></i> Edit Booking</a>
                    <%--<s:property value="#attr.order.documentCheck"/>--%>
                <s:if test=" #attr.order.documentCheck == 'AVAILABLE' ">
                    <a class="btn btn-info" title="Print Booking" href="#" onclick="generateReport(${order.documentId},'BOOKING REQUEST FORM')"> <i class="fa fa-print"></i> Print Booking</a>
                </s:if>
                <s:else>
                    <a class="btn btn-info" title="Create Booking Request Form" href="<s:url action='createReport' ><s:param name="orderIdParam" value="%{order.orderId}"></s:param></s:url>" > <i class="fa fa-file-text-o"></i> Create Booking Request Form</a>
                </s:else>
            </sec:authorize>
        </div>
    </div>

    <div class="panel-body">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-info">
                    <table class="table leftAlign table-user-information" style="table-layout: fixed">
                        <th style="font-size: 20px; border-top: none; width: 250px;">
                            <i class="fa fa-book"></i> Booking Number
                            <%--<s:property value="order.orderId"/>--%>
                        </th>
                        <th style="font-size: 20px; border-top: none; width: 250px;">
                            <s:property value="order.orderNumber"/>
                        </th>
                        <tbody>
                        <tr>
                            <td style="color: gray !important;">Freight Type</td>
                            <td><s:property value="order.freightType"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Service Requirement</td>
                            <td><s:property value="order.serviceRequirement"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Service Mode</td>
                            <td><s:property value="order.modeOfService"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Payment Mode</td>
                            <td><s:property value="order.modeOfPayment"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Notification Type</td>
                            <td><s:property value="order.notifyBy"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Booking Date</td>
                            <td><s:property value="order.orderDate"/></td>
                        </tr>
                        <tr>
                            <%--<td style="color: gray !important;">Origin Port</td>
                            <td><s:property value="order.originationPort"/></td>--%>
                            <s:if test="order.freightType == 'TRUCKING'">
                                <td style="color: gray !important;">Location</td>
                            </s:if>
                            <s:else>
                                <td style="color: gray !important;">Origin Port</td>
                            </s:else>
                            <td><s:property value="order.originationPort"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Destination Port</td>
                            <td><s:property value="order.destinationPort"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Total Rate</td>
                            <%--<td><s:property value="order.rates"/></td>--%>
                            <td>"N/A"</td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Status</td>
                            <td><s:property value="order.orderStatus"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Comments</td>
                            <td id="comment-wrapper" class="comment-wrapper" style="word-wrap: break-word;" ><s:property value="order.comments"/></td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-info">
                    <table class="table leftAlign table-user-information">
                        <th style="font-size: 20px; border-top: none; width: 300px;">
                            <i class="fa fa-user"></i> Customer Information
                        </th>
                        <tbody>
                        <tr>
                            <td style="color: gray !important;">Company / Customer Name</td>
                            <td><s:property value="order.customerName"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Contact Person</td>
                            <td><s:property value="order.shipperInfoContact.name"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Phone</td>
                            <td><s:property value="order.shipperInfoContact.phone"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Mobile</td>
                            <td><s:property value="order.shipperInfoContact.mobile"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Fax</td>
                            <td><s:property value="order.shipperInfoContact.fax"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Email Address</td>
                            <td><s:property value="order.shipperInfoContact.email"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Pickup Date</td>
                            <td><s:property value="order.strPickupDate"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Pickup Address</td>
                            <td><s:property value="order.shipperInfoAddress.address"/></td>
                        </tr>

                    </table>
                </div>
                <div class="panel panel-info">
                    <table class="table leftAlign table-user-information">
                        <th style="font-size: 20px; border-top: none; width: 300px;">
                            <i class="fa fa-user"></i> Consignee Information</th>
                        <tr>
                            <td style="color: gray !important;">Company</td>
                            <td><s:property value="order.consigneeName"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Consignee Name</td>
                            <td><s:property value="order.consigneeInfoContact.name"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Contact Person</td>
                            <td><s:property value="order.consigneeContactName"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Phone</td>
                            <td><s:property value="order.consigneeInfoContact.phone"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Mobile</td>
                            <td><s:property value="order.consigneeInfoContact.mobile"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Fax</td>
                            <td><s:property value="order.consigneeInfoContact.fax"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Email Address</td>
                            <td><s:property value="order.consigneeInfoContact.email"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Delivery Date</td>
                            <td><s:property value="order.strDeliveryDate"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Delivery Address</td>
                            <td><s:property value="order.consigneeInfoAddress.address"/></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list-ol"></i> Cargo Details</h3>
    </div>

    <div class="panel-body">
        <div class="table-responsive list-table cargoDetailsTableDiv center-text">

            <%--<table class="table table-striped table-hover table-bordered text-center tablesorter">
                <thead>
                <tr>
                    <th>Quantity</th>
                    <th>Class</th>
                    <th>Height</th>
                    <th>Width</th>
                    <th>Length</th>
                    <th>Weight</th>
                    <th>Value</th>
                </tr>

                </thead>
                <tbody>
                <s:iterator value="order.orderItemsBean" var="orderItem">
                    <tr>
                        <td><s:property value="quantity"/></td>
                        <td><s:property value="classification"/></td>
                        <td><s:property value="height"/></td>
                        <td><s:property value="width"/></td>
                        <td><s:property value="length"/></td>
                        <td><s:property value="weight"/></td>
                        <td><s:property value="declaredValue"/></td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>--%>

                <table class="table table-striped table-hover table-bordered text-center tablesorter itemListing" id="orderItems">
                    <thead>
                        <tr class="header_center" style="background-color: #fff;">
                            <th class="tb-font-black">Quantity</th>
                            <s:if test="order.serviceRequirement == 'FULL CONTAINER LOAD' || order.serviceRequirement == 'FULL TRUCK LOAD'">
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
                            <th class="tb-font-black">Volume <br /> (cbm) </th>
                            <th class="tb-font-black">Commodity</th>
                            <th class="tb-font-black">Value <br /> (Php) </th>
                            <th class="tb-font-black">Rate <br /> (Php) </th>
                            <th class="tb-font-black">Comment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="orderItems" var="orderItem">
                            <tr>
                                <td class="tb-font-black"><s:property value="quantity"/></td>
                                <td class="tb-font-black"><s:property value="nameSize"/></td>
                                <td class="tb-font-black"><s:property value="weight"/></td>
                                <td class="tb-font-black"><s:property value="volume"/></td>
                                <td class="tb-font-black"><s:property value="description"/></td>
                                <%--<td class="tb-font-black"><s:property value="declaredValue"/></td>--%>
                                <td class="tb-font-black"><s:property value="getText('format.money',{declaredValue})"/></td>
                                <td class="tb-font-black"><s:property value="rate"/></td>
                                <td class="tb-font-black"><s:property value="remarks"/></td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            <div class="pull-right totalRateDivParent" style="font-size: 1.3em; margin-right: 1em;">
                Total Rate: Php <span id="totalRate"></span>
                <%--<div id="totalRate"></div>--%>
            </div>
        </div>
    </div>

    <div class="panel-footer">
        <div class="pull-right">
            <button type="button" id="Cancel" class="btn btn-danger" onclick="location.href='viewOrders'">
                <i class="fa fa-chevron-left"></i> Back to Booking List
            </button>
        </div>
    </div>

</div>

<!-- /.row -->

<script type="text/javascript">

    $(document).ready(function() {

        addTotalRate();
        containerHandler('itemListing', 2, 3, 4);

        if($('.itemListing tbody tr').size() == 0){
            $('.totalRateDivParent').hide();
            $('.itemListing').hide();
            $('.cargoDetailsTableDiv').append('<h4 style="padding-bottom: -10px"><i class="fa fa-warning " style="color: red;"></i> No cargo/container found!</h4><i>Please make sure that the information of the booking is correct</i>');
        }

        // Adding of Rates and displaying it in Total Rates
//        var tbl = document.getElementById("orderItems");
//        if (tbl != null) {
//
//            var orderItemTotalRate = 0;
//
//            for (var i = 0; i < tbl.rows.length; i++){
//
//                var orderItemRate = parseInt(tbl.rows[i+1].cells[6].innerHTML);
//
//                orderItemTotalRate = orderItemTotalRate + orderItemRate;
//
//                document.getElementById("totalRate").innerHTML = orderItemTotalRate;
//            }
//        }

    });

    function generateReport(documentId,documentName) {
        var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Booking Request Form";
        }
    }

    /*function createReport(orderId) {
        $.ajax({
            url: 'createReport',
            type: 'POST',
            data: { orderIdParam: orderId },
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });

    }*/

</script>
