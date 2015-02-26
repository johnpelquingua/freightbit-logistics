<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-truck"></i> Dispatch Plan : Orders</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewInlandFreightList' />"> Dispatch Plan : Orders  </a></li>
            <li class="active"> Booking Information</li>
        </ol>
    </div>
</div>

<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> Booking Information</h3>
    </div>

    <div class="panel-body">

        <div class="col-lg-12">

            <div class="col-lg-6">

                <div class="panel panel-info ">

                    <table class="table leftAlign table-user-information" style="table-layout: fixed;">
                        <th style="font-size: 20px; border-top: none; width: 250px;">
                            Booking Number
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
                            <td style="color: gray !important;">Origin Port</td>
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
                            <td id="comment-wrapper" class="comment-wrapper" style="word-wrap: break-word" ><s:property value="order.comments"/></td>
                        </tr>

                        </tbody>
                    </table>

                </div>

            </div>

            <div class="col-lg-6">

                <div class="panel panel-info ">

                    <table class="table leftAlign table-user-information">

                        <th style="font-size: 20px; border-top: none; width: 300px;">Customer Information</th>

                        <tbody>

                        <tr>
                            <td style="color: gray !important;">Customer Name</td>
                            <td><s:property value="order.customerName"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Contact Person</td>
                            <td><s:property value="order.shipperInfoContact.name"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Contact Number</td>
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
                            <td style="color: gray !important;">E-mail</td>
                            <td><s:property value="order.shipperInfoContact.email"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Pick-up Date</td>
                            <td><s:property value="order.pickupDate"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Pick-up Address</td>
                            <td><s:property value="order.shipperInfoAddress.address"/></td>
                        </tr>

                    </table>

                </div>

                <div class="panel panel-info ">

                    <table class="table leftAlign table-user-information">

                        <th style="font-size: 20px; border-top: none; width: 300px;">Consignee Information</th>

                        <tbody>

                        <tr>
                            <td style="color: gray !important;">Consignee Name</td>
                            <td><s:property value="order.consigneeInfoContact.name"/></td>
                        </tr>
                        <tr>
                            <td style="color: gray !important;">Contact Person</td>
                            <td><s:property value="order.ConsigneeContactName"/></td>
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
                            <td><s:property value="order.deliveryDate"/></td>
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
        <div class="table-responsive list-table">

            <table class="table table-striped table-hover table-bordered text-center tablesorter" id="orderItems">
                <thead>
                <tr class="header_center" style="background-color: #fff;">
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
                        <td class="tb-font-black"><s:property value="declaredValue"/></td>
                        <td class="tb-font-black"><s:property value="rate"/></td>
                        <td class="tb-font-black"><s:property value="remarks"/></td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>

        </div>
    </div>

    <div class="panel-footer">

        <div class="pull-right">
            <button type="button" id="Cancel" class="btn btn-danger" onclick="location.href='viewInlandFreightList'">
                <i class="fa fa-chevron-left"></i> Back to Dispatch Plan : Orders
            </button>
        </div>

    </div>

</div>



