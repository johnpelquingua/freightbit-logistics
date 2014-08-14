<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> Booking Information</h3>
    </div>

    <div class="panel-body">

        <div class="col-lg-12">

            <div class="col-lg-6">
                <div align="center">
                    <img alt="User Pic" src="../includes/images/photo.png" style="height: 200px; width: 200px;"
                         class="img-circle">
                </div>
                <br/>

                <table class="table leftAlign table-user-information">
                    <th style="font-size: 20px; border-top: none; width: 300px;">Booking Number: <s:property
                            value="order.orderNo"/></th>
                    <tbody>
                    <tr>
                        <td style="color: gray !important;">Service Mode:</td>
                        <td><s:property value="order.modeOfService"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Origin Port:</td>
                        <td><s:property value="order.originationPort"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Payment Mode:</td>
                        <td><s:property value="order.modeOfPayment"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Notification Type:</td>
                        <td><s:property value="order.notifyBy"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Booking Date:</td>
                        <td><s:property value="order.bookingDate"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Service Requirement:</td>
                        <td><s:property value="order.serviceRequirement"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Destination Port:</td>
                        <td><s:property value="order.destinationPort"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Total Rate:</td>
                        <td><s:property value="order.rates"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Status:</td>
                        <td><s:property value="order.orderStatus"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Comments:</td>
                        <td><s:property value="order.comments"/></td>
                    </tr>

                    </tbody>
                </table>

            </div>

            <div class="col-lg-6">

                <table class="table leftAlign table-user-information">

                    <th style="font-size: 20px; border-top: none; width: 300px;">Shipper Information</th>

                    <tbody>

                    <tr>
                        <td style="color: gray !important;">Shipper Name:</td>
                        <td><s:property value="order.customerName"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Contact Person:</td>
                        <td><s:property value="order.shipperInfoContact.name"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Contact Number:</td>
                        <td><s:property value="order.shipperInfoContact.phone"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Mobile:</td>
                        <td><s:property value="order.shipperInfoContact.mobile"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Fax:</td>
                        <td><s:property value="order.shipperInfoContact.fax"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">E-Mail:</td>
                        <td><s:property value="order.shipperInfoContact.email"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Pick-up Date:</td>
                        <td><s:property value="order.pickupDate"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Pick-up Address:</td>
                        <td><s:property value="order.shipperInfoAddress.address"/></td>
                    </tr>

                    <th style="font-size: 20px; border-top: none; width: 400px;">Consignee Information</th>

                    <tr>
                        <td style="color: gray !important;">Consignee Name:</td>
                        <td><s:property value="order.customerName"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Contact Person:</td>
                        <td><s:property value="order.consigneeInfoContact.name"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Contact Number:</td>
                        <td><s:property value="order.consigneeInfoContact.phone"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Mobile:</td>
                        <td><s:property value="order.consigneeInfoContact.mobile"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Fax:</td>
                        <td><s:property value="order.consigneeInfoContact.fax"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">E-Mail:</td>
                        <td><s:property value="order.consigneeInfoContact.email"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Delivery Date:</td>
                        <td><s:property value="order.deliveryDate"/></td>
                    </tr>
                    <tr>
                        <td style="color: gray !important;">Delivery Address:</td>
                        <td><s:property value="order.consigneeInfoAddress.address"/></td>
                    </tr>
                    </tbody>
                </table>

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
            <table class="table table-striped table-hover table-bordered text-center tablesorter">
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
            </table>
        </div>
    </div>
</div>

<!-- /.row -->


