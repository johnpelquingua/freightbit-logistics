<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .itemListingDeleteActionIcon, .itemListingEditActionIcon  {
        cursor: pointer;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> Booking List </a> </li>
            <li class="active"> Booking Information</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<s:if test="hasActionErrors()">
    <div class="col-lg-12">
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
<div class="col-lg-12">
<div class="panel panel-primary">

<div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-info-circle"></i> Booking Information</h3>
    <%--<div class="btn-toolbar pull-right">
        <a class="btn btn-info" title="Edit Booking" href="<s:url action='loadEditOrderInBooking' ><s:param name="orderIdParam" value="%{order.orderId}"></s:param></s:url>" >Edit Booking</a>
    </div>--%>
</div>

<div class="panel-body">

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-book"></i> Order Details
                </h3>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-lg-6 ">
                        <table class="table table-user-information" style="table-layout: fixed;">
                            <tbody>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important; border-top: none; width: 30%">Booking Number</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.orderNumber"/></td>
                            </tr>

                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Freight Type</td>
                                <td style="text-align: left !important;"><s:property value="order.freightType"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Service Mode</td>
                                <td style="text-align: left !important;"><s:property value="order.modeOfService"/></td>
                            </tr>
                            <tr>
                                <%--<td style="font-weight: normal; font-size: 12px; text-align:left !important;">Origin Port</td>--%>
                                <s:if test="order.freightType == 'TRUCKING'">
                                    <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Location</td>
                                </s:if>
                                <s:else>
                                    <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Origin Port</td>
                                </s:else>

                                <td style="text-align: left !important;"><s:property value="order.originationPort"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Notification Type</td>
                                <td style="text-align: left !important;"><s:property value="order.notifyBy"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Status</td>
                                <td style="text-align: left !important;"><s:property value="order.orderStatus"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Comments</td>
                                <td style="text-align: left !important;word-wrap: break-word;" id="comment-wrapper" class="comment-wrapper"><s:property value="order.comments"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-lg-6 ">
                        <table class="table table-user-information" style="table-layout: fixed;">
                            <tbody>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important; border-top: none; width: 30%">Booking Date</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.orderDate"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Service Requirement</td>
                                <td style="text-align: left !important;" class="serviceReq"><s:property value="order.serviceRequirement"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Payment Mode</td>
                                <td style="text-align: left !important;"><s:property value="order.modeOfPayment"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Destination Port</td>
                                <td style="text-align: left !important;"><s:property value="order.destinationPort"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Total Rate</td>
                                <%--<td style="text-align: left !important;"><s:property value="order.rates"/></td>--%>
                                <td style="text-align: left !important;">"N/A"</td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Prepared By</td>
                                <td style="text-align: left !important;"><s:property value="order.accountRep"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

<div class="row">
    <div class="col-lg-6">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-male"></i> Customer Information</h3>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class=" col-md-12 col-lg-12 ">
                        <table class="table table-user-information">
                            <s:hidden id="custIdHolder" value="%{order.customerId}"/>
                            <%--<s:property value="%{order.customerId}"/>--%>
                            <tbody>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important; border-top: none; width: 30%">Customer Name</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.customerName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Contact Person</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.name"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Contact Number</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.phone"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Mobile</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.mobile"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Fax</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.fax"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Email Address</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.email"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Pickup Date</td>
                                <td style="text-align: left !important;"><s:property value="order.pickupDate"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Pickup Address</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoAddress.address"/></td>
                            </tr>
                            </tbody>

                        </table>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="col-lg-6">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-male"></i> Consignee Information</h3>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class=" col-md-12 col-lg-12 ">
                        <table class="table table-user-information">

                            <tbody>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important; border-top: none; width: 30%">Consignee Name</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.consigneeInfoContact.name"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Contact Person</td>
                                <td style="text-align: left !important;"><s:property value="order.ConsigneeContactName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Contact Number</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.phone"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Mobile</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.mobile"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Fax</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.fax"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Email Address</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.email"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Delivery Date</td>
                                <td style="text-align: left !important;"><s:property value="order.deliveryDate"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 13px; text-align:left !important;">Delivery Address</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoAddress.address"/></td>
                            </tr>
                            </tbody>

                        </table>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<div class="row addItemDiv" tabindex="-1">

    <div class="col-lg-12" >

        <div class="well">

            <s:form cssClass="form-horizontal" theme="bootstrap" action="editItemsInTable" >
            <s:hidden name="order.orderId" value="%{order.orderId}"/>
            <s:hidden  name="item.customerId" id="customerIdHolder" value='%{order.customerId}'/>
            <s:hidden name="orderItem.orderItemId" value="%{orderItem.orderItemId}" />
            <s:hidden name="orderItem.vesselScheduleId" value="%{orderItem.vesselScheduleId}" />
            <s:hidden name="orderItem.driverOrigin" value="%{orderItem.driverOrigin}" />
            <s:hidden name="orderItem.driverDestination" value="%{orderItem.driverDestination}" />
            <s:hidden name="orderItem.truckOrigin" value="%{orderItem.truckOrigin}" />
            <s:hidden name="orderItem.truckDestination" value="%{orderItem.truckDestination}" />
            <s:hidden name="orderItem.finalPickupDate" value="%{orderItem.finalPickupDate}" />
            <s:hidden name="orderItem.finalDeliveryDate" value="%{orderItem.finalDeliveryDate}" />
            <s:hidden name="orderItem.vendorOrigin" value="%{orderItem.vendorOrigin}" />
            <s:hidden name="orderItem.vendorDestination" value="%{orderItem.vendorDestination}" />
            <s:hidden name="orderItem.vendorSea" value="%{orderItem.vendorSea}" />
            <s:hidden name="orderItem.serviceRequirement" value="%{orderItem.serviceRequirement}" />
            <s:hidden name="orderItem.containerId" value="%{orderItem.containerId}" />

                <fieldset class="inputs">

<%------------------------------------------------ FULL CONTAINER LOAD AND FULL TRUCK LOAD BEGIN ----------------------------------------------------------------%>

                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' || order.serviceRequirement=='FULL TRUCK LOAD' || order.serviceRequirement=='FTL' ">
                        <legend style="text-align: left;">
                            <span>
                                Container Information
                            </span>
                        </legend>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Container Size<span class="asterisk_red" />
                            </label>

                            <div class="col-lg-3" >
                                <s:select cssClass="form-control containerSizeDropdown"
                                          id="orderItem.nameSize"
                                          name="orderItem.nameSize"
                                          list="containerList"
                                          listKey="key"
                                          listValue="value"
                                          emptyOption="true"
                                          required="true" />
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Container Quantity<span class="asterisk_red" />
                            </label>
    `
                            <div class="col-lg-3" >

                                <s:hidden name="orderItem.quantity" value="%{orderItem.quantity}" />
                                <s:select cssClass="form-control containerQuantityDropdown"
                                          id="orderItem_quantityFCL"
                                          name="orderItem.quantity"
                                          list="containerQuantity"
                                          emptyOption="true"
                                          required="true"
                                          onchange="fcl()"
                                          disabled="true"/>
                            </div>

                        </div>

                            <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Rate (Php)
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control"
                                             id="orderItem_rate"
                                             name="orderItem.rate"
                                             maxLength="16"
                                             disabled="true" />
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Commodity
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control"
                                             name="orderItem.description"
                                             id="orderItem.description" />

                            </div>

                        </div>

                        <div class="form-group weightAndVolume">

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                    Weight (kg)<span class="asterisk_red" />
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control"
                                             name="orderItem.weight"
                                             id="orderItem_weight"
                                             value="%{getText('format.number',{orderItem.weight})}" />
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Volume (cbm)<span class="asterisk_red"/>
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control"
                                             id="orderItem-volume"
                                             name="orderItem.volume"
                                             value="%{getText('format.number',{orderItem.volume})}" />

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Comments
                            </label>

                            <div class="col-lg-3" >
                                <s:textarea cssClass="form-control"
                                            name="orderItem.remarks"
                                            id="orderItem_remarks"
                                            cssStyle="resize: none; height: 150px;"
                                            maxLength="255" />
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Declared Value (Php)<span class="asterisk_red" />
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control automaticDeclaredValue"
                                             name="orderItem.declaredValue"
                                             id="orderItem_declaredValues"
                                             value="%{getText('format.money',{orderItem.declaredValue})}"/>
                            </div>

                        </div>

                    </s:if>

<%------------------------------------------------ FULL CONTAINER LOAD AND FULL TRUCK LOAD END ----------------------------------------------------------------%>

<%------------------------------------------------ LESS CONTAINER LOAD BEGIN ----------------------------------------------------------------%>

                    <s:else>

                        <legend style="text-align: left;">
                            <span>
                                Item Information
                            </span>
                        </legend>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">

                                <span>
                                    Item Name<span class="asterisk_red" />
                                </span>

                            </label>

                            <div class="col-lg-3" >

                                    <s:hidden value="%{orderItem.nameSize}" />

                                    <s:hidden value="%{orderItem.itemName}" />

                                    <s:hidden value="%{items.customerItemsId}" />

                                    <input list="items" id="itemName" name="orderItem.nameSize" class="form-control" maxLength="30" required="true" value=<s:property value="%{items.itemName}"/> />
                                    <datalist id="items">
                                        <s:iterator value="customerItems">
                                            <option id=<s:property value="%{customerItemsId}" /> value=<s:property value="%{itemName}" /> />
                                        </s:iterator>
                                    </datalist>

                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">

                                    <span>
                                        Item Quantity<span class="asterisk_red" />
                                    </span>

                            </label>

                            <div class="col-lg-3" >

                                <span>
                                    <s:select cssClass="form-control"
                                              id="orderItem_quantity"
                                              name="orderItem.quantity"
                                              list="itemQuantity"
                                              emptyOption="true"
                                              value="%{orderItem.quantity}"
                                              required="true" />
                                </span>

                            </div>

                        </div>

                        <div class="form-group weightAndVolume">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Item Code<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:select cssClass="form-control"
                                          id="orderItem_itemCode"
                                          list="#{orderItem_itemCode}"
                                          value="%{items.itemCode}"
                                          style="display:none;" />

                                <s:textfield name="item.itemCode" id="orderItem_itemCode_textfield" required="true"
                                             cssClass="form-control addItemInput" maxLength="25" value="%{items.itemCode}"
                                             pattern="[a-zA-Z0-9]+" title="Item Code should not contain special characters"/>
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Weight (kg)<span class="asterisk_red" />
                            </label>

                            <div class="col-lg-3" >

                                    <s:select cssClass="form-control"
                                              id="orderItem_weight"
                                              list="#{orderItem_weight}"
                                              value="%{getText('format.number',{orderItem.weight})}"
                                              style="display:none;" />

                                    <s:textfield cssClass="form-control"
                                                 name="orderItem.weight"
                                                 id="orderItem_weight_textfield"
                                                 maxLength="9"
                                                 required="true"
                                                 value="%{getText('format.number',{orderItem.weight})}"
                                                 pattern="\d+(\.\d{2})?" />

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Length (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:select cssClass="form-control"
                                          id="orderItem_length"
                                          list="#{orderItem_length}"
                                          value="%{getText('format.number',{items.length})}"
                                          style="display:none;"/>

                                <s:textfield name="item.length" value="%{getText('format.number',{items.length})}" id="orderItem_length_textfield" required="true" cssClass="addItemInput form-control"
                                             style="150px" pattern="\d+(\.\d{1,2})?" title="Special characters in length is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Rate (Php)
                            </label>
                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control"
                                             id="orderItem_rate"
                                             name="orderItem.rate"
                                             maxLength="16"
                                             disabled="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Width (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:select cssClass="form-control"
                                          id="orderItem_width"
                                          list="#{orderItem_width}"
                                          value="%{getText('format.number',{items.width})}"
                                          style="display:none;" />

                                <s:textfield name="item.width" id="orderItem_width_textfield" required="true" value="%{getText('format.number',{items.width})}" cssClass="addItemInput form-control"  pattern="\d+(\.\d{1,2})?" title="Special characters in width is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Declared Value (Php)<span class="asterisk_red" />
                            </label>
                            <div class="col-lg-3" >

                                    <s:select cssClass="form-control automaticDeclaredValue"
                                              id="orderItem_declaredValue"
                                              list="#{orderItem_declaredValue}"
                                              value="%{getText('format.number',{orderItem_declaredValue})}"
                                              style="display:none;" />

                                    <s:textfield cssClass="form-control automaticDeclaredValue"
                                                 name="orderItem.declaredValue"
                                                 id="orderItem_declaredValue_textfield"
                                                 maxLength="19"
                                                 required="true" />

                            </div>
                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Height (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:select cssClass="form-control"
                                          id="orderItem_height"
                                          list="#{orderItem_height}"
                                          value="%{getText('format.number',{items.height})}"
                                          style="display:none;" />

                                <s:textfield name="item.height" id="orderItem_height_textfield" required="true" value="%{getText('format.number',{items.height})}"
                                             cssClass="addItemInput form-control" pattern="\d+(\.\d{1,2})?" title="Special characters in height is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Commodity
                            </label>

                            <div class="col-lg-3" >

                                    <s:select cssClass="form-control"
                                              id="orderItem_description"
                                              list="#{orderItem_description}"
                                              value="%{orderItem_description}"
                                              style="display:none;" />

                                    <s:textfield cssClass="form-control"
                                                 name="orderItem.description"
                                                 id="orderItem_description_textfield"
                                                 maxLength="20" />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Comments
                            </label>
                            <div class="col-lg-3" >
                                <s:select cssClass="form-control"
                                          id="orderItem_remarks"
                                          list="#{orderItem_remarks}"
                                          value="%{orderItem_remarks}"
                                          style="display:none;" />

                                <s:textarea cssClass="form-control"
                                            name="orderItem.remarks"
                                            id="orderItem_remarks_textarea"
                                            cssStyle="resize: none; height: 150px;"
                                            maxLength="255" />
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px; ">
                                Volume (cbm)<span class="asterisk_red"/>
                            </label>
                            <div class="col-lg-3" style="padding-top: 0px; ">

                                    <s:select cssClass="form-control"
                                              id="orderItem_volume"
                                              list="#{orderItem_volume}"
                                              value="%{getText('format.number',{orderItem.volume})}"
                                              style="display:none;" />

                                    <s:textfield cssClass="form-control"
                                                 name="orderItem.volume"
                                                 value="%{getText('format.number',{orderItem.volume})}"
                                                 id="orderItem_volume_textfield"/>

                            </div>
                        </div>

                    </s:else>

<%------------------------------------------------ LESS CONTAINER LOAD END ----------------------------------------------------------------%>

                    <div style="clear:both; margin-top: 20px;" class="pull-right">
                        <button class="btn btn-danger" data-toggle="modal" data-target="#cancelBooking">
                            Cancel
                        </button>
                        <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' || order.serviceRequirement=='FULL TRUCK LOAD' || order.serviceRequirement=='FTL' ">
                            <span>
                                <s:submit name="submit" cssClass="addContainerToList btn btn-primary" id="submit_button" value="Save Container to List"/>
                            </span>
                        </s:if>
                        <s:else>
                            <span>
                                <s:submit name="submit" cssClass="addItemToList btn btn-primary" id="submit_button" value="Save Item to List" />
                            </span>
                        </s:else>
                    </div>

                </fieldset>

            </s:form>

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

<s:if test="hasActionErrors()">
    <div class="col-lg-12">
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<%--<div class="row">

    <div class="col-lg-12">

        <div class="well">

        <fieldset>

            <legend style="text-align: left;">
                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' || order.serviceRequirement=='FULL TRUCK LOAD' || order.serviceRequirement=='FTL' ">
                    <h4>
                        Container Listing <small>(Maximum of 5 Containers)</small>
                    </h4>
                </s:if>
                <s:else>
                    <h4>
                        Item Listing <small>(Maximum of 250 Items)</small>
                    </h4>
                </s:else>
            </legend>

            <div class="panel-body">
                &lt;%&ndash;<div class="loadingDiv" style="text-align: center;">
                    Processing Items. Please Wait.<br/>
                    <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
                </div>&ndash;%&gt;
                <div class="table-responsive list-table tableDiv" style="display: none;">

                    <table class="itemListing table table-striped table-hover table-bordered text-center tablesorter" id="orderItems">
                        <thead>
                        <tr class="header_center" style="background-color: #fff;">
                            <th class="tb-font-black">Quantity</th>
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' || order.serviceRequirement=='FULL TRUCK LOAD' || order.serviceRequirement=='FTL' ">
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
                            <th class="tb-font-black">Action</th>
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
                                <td class="tb-font-black"><s:property value="getText('{0,number,#,##0.00}',{declaredValue})"/></td>
                                <td class="tb-font-black"><s:property value="rate"/></td>
                                <td class="tb-font-black"><s:property value="remarks"/></td>

                                <td class="tb-font-black">
                                    &lt;%&ndash;<a id="edit-icon" href="#" data-toggle="modal" data-target="#editItemListingModal" onclick="showEditItemListingFields(${orderItemId});">
                                        <i class="fa fa-edit"></i>
                                    </a>&ndash;%&gt;

                                    <s:url var="editOrderItemUrl" action="loadEditOrderItem">
                                        <s:param name="orderItemIdParam" value="%{#attr.order.orderItemId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editOrderItemUrl}" rel="tooltip" title ="Edit Order Item">
                                        <i class="fa fa-edit"></i>
                                    </s:a>

                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <s:url var="deleteItemUrl" action="deleteItem">
                                        <s:param name="orderItemIdParam" value="%{orderItemId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                         title="Delete this Item?"
                                         onclick="return confirm('Do you really want to delete this item?');">
                                    </s:a>
                                    <i class="fa fa-trash-o itemListingDeleteActionIcon"></i>
                                    </sec:authorize>

                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                        &lt;%&ndash;<s:property  value="%{customerItemsId}"/>&ndash;%&gt;
                    </table>

                </div>
            </div>

            &lt;%&ndash;<legend />&ndash;%&gt;

            <div style="clear:both;">
                <div class="col-lg-12" style="margin-top: 20px;">
                    <div class="col-lg-2 col-lg-offset-7" style="text-align: right; padding-right: 0px;">
                    Total Rate: Php
                    </div>
                    <div class="col-lg-2" id="totalRate">
                        0
                    </div>
                </div>
            </div>

        </fieldset>

        </div>

    </div>

</div>--%>

<%--<div style="text-align: center;">

</div>--%>

<%--</div>--%>

<%--<div class="panel-footer">

    <div class="pull-right">
        <button class="btn btn-danger" data-toggle="modal" data-target="#cancelBooking">
            Cancel
        </button>

        <button class="btn btn-primary" data-toggle="modal" data-target="#saveBooking">
            Save Booking
        </button>
    </div>

</div>--%>

</div>
</div>
</div>

<%--start add item--%>
<div class="modal fade" id="createItem" role="dialog" aria-labelledby="myModalLabel3">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add New Item</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <div class="table-responsive list-table">
                        <s:form theme="bootstrap" cssClass="form-horizontal" action="addItemInBooking">
                        <s:hidden name="item.customerId" id="customerIdHolder"/>
                        <%--<s:property value="%{item.customerId}" />--%>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Item Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.itemName" id="item.itemName" required="true"
                                             cssClass="form-control addItemInput" pattern="^(\s*[a-zA-Z0-9]+(([a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$" title="Must be letters only" maxlength="50"/>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Item Code<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.itemCode" id="item_itemCode" required="true"
                                             cssClass="form-control addItemInput" maxLength="25"
                                             pattern="[a-zA-Z0-9]+" title="Item Code should not contain special characters"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Weight (kg)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.weight" id="item.weight" required="true"
                                             cssClass="form-control addItemInput" pattern="\d+(\.\d{1,2})?" title="Special characters in Price is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                        </div>

                        <!-- Text input-->
                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">SRP (Php)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.srp" id="item_srp" required="true" cssClass="form-control addItemInput" pattern="\d+(\.\d{1,2})?" title="Special characters in Quality is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Length (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.length" id="item.length" required="true" cssClass="addItemInput form-control"
                                             style="150px" pattern="\d+(\.\d{1,2})?" title="Special characters in length is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Width (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.width" id="item.width" required="true" cssClass="addItemInput form-control"  pattern="\d+(\.\d{1,2})?" title="Special characters in width is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Height (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.height" id="item.height" required="true"
                                             cssClass="addItemInput form-control" pattern="\d+(\.\d{1,2})?" title="Special characters in height is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Description</label>

                            <div class="col-lg-9">
                                <s:textarea name="item.description" id="item.description" resize="none"
                                            style="resize:none" rows="3" cssClass="form-control" maxlength="50"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Note</label>

                            <div class="col-lg-9">
                                <s:textarea name="item.note" id="item.note" cssClass="form-control"
                                            style="resize:none" rows="3" maxlength="50"/>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary saveBtnModal" name="submit" value="Save" disabled="true"/>
                </div>
                </s:form>
            </div>

        </div>
    </div>
</div>
<%--end add item--%>

<!-- Cancel Booking Modal -->
<div class="modal fade" id="cancelBooking" role="dialog" aria-labelledby="myModalLabel2" >
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
                <h4 class="modal-title" id="myModalLabel"><i class="fa fa-warning" style="color: red"></i> Cancel Booking</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel the booking?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="location.href='addOrderInfo'">Yes</button>
                <%--<button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>--%>
            </div>
        </div>
    </div>
</div>

<!-- Save Booking Modal -->
<div class="modal fade" id="saveBooking" role="dialog" aria-labelledby="myModalLabel1" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
                <h4 class="modal-title" id="myModalLabel"><i class="fa fa-check"></i> Confirm Booking Details</h4>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <div class="panel panel-info ">
                                <br/>
                                <table class="table leftAlign table-user-information" style="table-layout: fixed;">
                                    <th style="font-size: 20px; border-top: none;">
                                        <i class="fa fa-book"></i> Booking Number
                                        <%--<s:property value="order.orderId"/>--%>
                                    </th>
                                    <th style="font-size: 20px; border-top: none;">
                                        <s:property value="order.orderNumber"/>
                                    </th>
                                    <tbody>
                                    <tr>
                                        <td style="color: gray !important;">Freight Type</td>
                                        <td><s:property value="order.freightType"/></td>
                                    </tr>
                                    <tr>
                                        <td style="color: gray !important;">Service Requirement</td>
                                        <td><s:property value="order.serviceRequirement" /></td>
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
                                        <td id="comment-wrapper" class="comment-wrapper" style="word-wrap: break-word;"><s:property value="order.comments"/></td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-6">

                            <div class="panel panel-info ">

                                <table class="table leftAlign table-user-information">
                                    <th style="font-size: 18px; border-top: none;" colspan="2"><i class="fa fa-user"></i> Customer Information</th>
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
                                        <td><s:property value="order.pickupDate"/></td>
                                    </tr>
                                    <tr>
                                        <td style="color: gray !important;">Pickup Address</td>
                                        <td><s:property value="order.shipperInfoAddress.address"/></td>
                                    </tr>

                                </table>

                        </div>

                    </div>
						<div class="col-lg-6">
                            <div class="panel panel-info ">

                                <table class="table leftAlign table-user-information">

                                    <th style="font-size: 18px; border-top: none;" colspan="2"><i class="fa fa-user"></i> Consignee Information</th>

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

                <div class="panel-body">
                    <div class="cargoContainerSavingTableLoadingDiv well" style="text-align: center; display: none;">
                        <h4><i class="fa fa-warning" style="color: #ff0000"></i> Booking has no cargo/container!</h4>
                        <i>Please make sure that the information of the booking is correct</i>
                    </div>
                    <div class="table-responsive list-table cargoContainerSavingTableDiv">
                        <table class="cargoContainerSavingTable table table-striped table-hover table-bordered text-center tablesorter" id="orderItems">
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
                                    <td class="tb-font-black"><s:property value="getText('{0,number,#,##0.00}',{declaredValue})"/></td>
                                    <td class="tb-font-black"><s:property value="rate"/></td>
                                    <td class="tb-font-black"><s:property value="remarks"/></td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Save</button>
            </div>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="editItemListingModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">
                <div id="editItemListingInput"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="itemListingDeleteModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="font-size: 1.5em;"><i class="fa fa-warning" style="color: red;"></i> Confirm Item Deletion</div>
            <div class="modal-body">
                Are you sure you want to delete this item?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <a class="itemListingDeleteConfirmBtn btn btn-danger" href="#">Delete</a>
            </div>
        </div>
    </div>
</div>

<%--<script type="text/javascript" src="../includes/js/bookingInfo.js"></script>--%>

<script>

    $( window ).load(function() {
        $('.addItemDiv').focus();
    });

    // THIS FUNCTION HIDES THE WEIGHT AND VOLUME FIELD IF THE SERVICE REQ IS FULL CONTAINER LOAD
    $(function(){
        if($('.serviceReq').text() == 'FULL CONTAINER LOAD' || $('.serviceReq').text() == 'FULL TRUCK LOAD'){
            $('.weightAndVolume').hide();
        }
    });

    $(document).ready(function() {

        // On click event of Item name change
        $("#itemName").bind('input', function () {
            var x = $('#itemName').val();
            var z = $('#items');
            var val = $(z).find('option[value="' + x + '"]');
            var item_Id = val.attr('id');

            if(item_Id == '') {
                document.getElementById("orderItem_volume_textfield").value = '';
                document.getElementById("orderItem_description_textfield").value = '';
                document.getElementById("orderItem_declaredValue_textfield").value = '';
                document.getElementById("orderItem_weight_textfield").value = '';
                document.getElementById("orderItem_itemCode_textfield").value = '';
                document.getElementById("orderItem_length_textfield").value = '';
                document.getElementById("orderItem_width_textfield").value = '';
                document.getElementById("orderItem_height_textfield").value = '';
            }

            $.getJSON('itemAction', {
                itemId: item_Id
            },function (jsonResponse) {
                var select = $('#orderItem_volume'),
                    select2 = $('#orderItem_description'),
                    select3 = $('#orderItem_declaredValue'),
                    select4 = $('#orderItem_weight'),
                    select5 = $('#orderItem_itemCode'),
                    select6 = $('#orderItem_length'),
                    select7 = $('#orderItem_width'),
                    select8 = $('#orderItem_height'),
                    select9 = $('#orderItem_remarks'),
                    serviceReq = $('.serviceReq');

                    select.find('option').remove();
                    select2.find('option').remove();
                    select3.find('option').remove();
                    select4.find('option').remove();
                    select5.find('option').remove();
                    select6.find('option').remove();
                    select7.find('option').remove();
                    select8.find('option').remove();
                    select9.find('option').remove();

                var itemQuantity = $("#orderItem_quantity").val();
                // Set quantity to 1 when Item name is selected first
                if(itemQuantity == '') {
                    document.getElementById("orderItem_quantity").value = 1;
                }

                // populate item description
                $.each(jsonResponse.shipperItemCommodityMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select2);
                    document.getElementById("orderItem_description_textfield").value = $("#orderItem_description").val();
                });

                // populate item declared value
                $.each(jsonResponse.shipperItemValueMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select3);
                    document.getElementById("orderItem_declaredValue_textfield").value = $("#orderItem_declaredValue").val(); // set value of order item to textfield
                    var totalValue = $("#orderItem_quantity").val() * $("#orderItem_declaredValue").val(); // compute for total value
                    $("#orderItem_declaredValue").html(""); // clear list of order Item value dropdown
                    var newOption2 = $('<option value="'+totalValue+'">'+totalValue+'</option>'); // append new value to the dropdown list
                    $("#orderItem_declaredValue").append(newOption2);
                    document.getElementById("orderItem_declaredValue_textfield").value = totalValue; // set total value to the order item value textfield
                });

                // populate item declared weight
                $.each(jsonResponse.shipperItemWeightMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select4);
                    document.getElementById("orderItem_weight_textfield").value = $("#orderItem_weight").val(); // set weight of order item to textfield
                    var totalWeight = $("#orderItem_quantity").val() * $("#orderItem_weight").val(); // compute for total value
                    $("#orderItem_weight").html(""); // clear list of order Item weight dropdown
                    var newOption3 = $('<option value="'+totalWeight+'">'+totalWeight+'</option>'); // append new value to the dropdown list
                    $("#orderItem_weight").append(newOption3);
                    document.getElementById("orderItem_weight_textfield").value = totalWeight; // set total value to the order item value textfield
                });

                $.each(jsonResponse.shipperItemCodeMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select5);
                    document.getElementById("orderItem_itemCode_textfield").value = $("#orderItem_itemCode").val();
                });

                $.each(jsonResponse.shipperItemLengthMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select6);
                    document.getElementById("orderItem_length_textfield").value = (parseInt($("#orderItem_length").val())).toPrecision(1);
                    var totalLength = $('#orderItem_quantity').val() * (parseInt($("#orderItem_length").val())).toPrecision(1);
                    $("#orderItem_length").html(""); // clear list of order Item length dropdown
                    var newOption4 = $('<option value="'+totalLength+'">'+totalLength+'</option>'); // append new value to the dropdown list
                    $("#orderItem_length").append(newOption4);
                    document.getElementById("orderItem_length_textfield").value = totalLength; // set total value to the order item length textfield
                });

                $.each(jsonResponse.shipperItemWidthMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select7);
                    document.getElementById("orderItem_width_textfield").value = (parseInt($("#orderItem_width").val())).toPrecision(1);
                    var totalWidth = $('#orderItem_quantity').val() * (parseInt($("#orderItem_width").val())).toPrecision(1);
                    $("#orderItem_width").html(""); // clear list of order Item width dropdown
                    var newOption5 = $('<option value="'+totalWidth+'">'+totalWidth+'</option>'); // append new value to the dropdown list
                    $("#orderItem_width").append(newOption5);
                    document.getElementById("orderItem_width_textfield").value = totalWidth; // set total value to the order item width textfield
                });

                $.each(jsonResponse.shipperItemHeightMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select8);
                    document.getElementById("orderItem_height_textfield").value = (parseInt($("#orderItem_height").val())).toPrecision(1);
                    var totalHeight = $('#orderItem_quantity').val() * (parseInt($("#orderItem_height").val())).toPrecision(1);
                    $("#orderItem_height").html(""); // clear list of order Item height dropdown
                    var newOption6 = $('<option value="'+totalHeight+'">'+totalHeight+'</option>'); // append new value to the dropdown list
                    $("#orderItem_height").append(newOption6);
                    document.getElementById("orderItem_height_textfield").value = totalHeight; // set total value to the order item height textfield
                });

                $.each(jsonResponse.shipperItemCommentsMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select9);
                    document.getElementById("orderItem_remarks_textarea").value = $("#orderItem_remarks").val();
                });

                // populate item volume based on length X Width X Height
                $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select);

                    var orderItemQuantity = $("#orderItem_quantity").val(),
                        orderItemLength = $("#orderItem_length").val(),
                        orderItemWidth = $("#orderItem_width").val(),
                        orderItemHeight = $("#orderItem_height").val(),
                        orderItem_volume = $("#orderItem_volume"),
                        orderItemVolume;

                    orderItemVolume = orderItemQuantity * (orderItemLength * orderItemWidth * orderItemHeight);
                    orderItem_volume.html("");
                    var newOption = $('<option value="'+orderItemVolume+'">'+orderItemVolume+'</option>'); // append new value to the dropdown list
                    orderItem_volume.append(newOption);
                    document.getElementById("orderItem_volume_textfield").value = orderItemVolume; // set total volume to the order item volume textfield
                });

            });

        });

        // On click event of Item Quantity change
        $('#orderItem_quantity').change(function(event) {
            var x = $('#itemName').val(),
                    z = $('#items'),
                    val = $(z).find('option[value="' + x + '"]'),
                    item_Id = val.attr('id');

            if(item_Id == '') {
                document.getElementById("orderItem_volume_textfield").value = '';
                document.getElementById("orderItem_description_textfield").value = '';
                document.getElementById("orderItem_declaredValue_textfield").value = '';
                document.getElementById("orderItem_weight_textfield").value = '';
            }

            $.getJSON('itemAction', {
                itemId: item_Id
            },function (jsonResponse){
                var select = $('#orderItem_volume'),
                    select2 = $('#orderItem_description'),
                    select3 = $('#orderItem_declaredValue'),
                    select4 = $('#orderItem_weight'),
                    select5 = $('#orderItem_itemCode'),
                    select6 = $('#orderItem_length'),
                    select7 = $('#orderItem_width'),
                    select8 = $('#orderItem_height'),
                    select9 = $('#orderItem_remarks'),
                    serviceReq = $('.serviceReq');

                    select.find('option').remove();
                    select2.find('option').remove();
                    select3.find('option').remove();
                    select4.find('option').remove();
                    select5.find('option').remove();
                    select6.find('option').remove();
                    select7.find('option').remove();
                    select8.find('option').remove();
                    select9.find('option').remove();

                if(serviceReq == 'FULL CONTAINER LOAD' || serviceReq == 'FULL TRUCK LOAD') {

                    // populate item volume based on length X Width X Height
                    $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                        $('<option>').val(key).text(value).appendTo(select);
                        document.getElementById("orderItem_volume_textfield").value = $("#orderItem_volume").val(); // set volume of Item volume textfield
                        var totalVolume = $("#orderItem_quantity").val() * $("#orderItem_volume").val(); // compute for total volume
                        $("#orderItem_volume").html(""); // clear list of order Item volume dropdown
                        var newOption = $('<option value="' + totalVolume + '">' + totalVolume + '</option>'); // append new value to the dropdown list
                        $("#orderItem_volume").append(newOption);
                        document.getElementById("orderItem_volume_textfield").value = totalVolume; // set total volume to the order item volume textfield

                    });
                }

                // populate item description
                $.each(jsonResponse.shipperItemCommodityMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select2);
                    document.getElementById("orderItem_description_textfield").value = $("#orderItem_description").val();
                });

                // populate item declared value
                $.each(jsonResponse.shipperItemValueMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select3);
                    document.getElementById("orderItem_declaredValue_textfield").value = $("#orderItem_declaredValue").val(); // set value of order item to textfield
                    var totalValue = $("#orderItem_quantity").val() * $("#orderItem_declaredValue").val(); // compute for total value
                    $("#orderItem_declaredValue").html(""); // clear list of order Item value dropdown
                    var newOption2 = $('<option value="'+totalValue+'">'+totalValue+'</option>'); // append new value to the dropdown list
                    $("#orderItem_declaredValue").append(newOption2);
                    document.getElementById("orderItem_declaredValue_textfield").value = totalValue; // set total value to the order item value textfield
                });

                // populate item declared weight
                $.each(jsonResponse.shipperItemWeightMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select4);
                    document.getElementById("orderItem_weight_textfield").value = $("#orderItem_weight").val(); // set weight of order item to textfield
                    var totalWeight = $("#orderItem_quantity").val() * $("#orderItem_weight").val(); // compute for total value
                    $("#orderItem_weight").html(""); // clear list of order Item weight dropdown
                    var newOption3 = $('<option value="'+totalWeight+'">'+totalWeight+'</option>'); // append new value to the dropdown list
                    $("#orderItem_weight").append(newOption3);
                    document.getElementById("orderItem_weight_textfield").value = totalWeight; // set total value to the order item value textfield
                });

                $.each(jsonResponse.shipperItemCodeMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select5);
                    document.getElementById("orderItem_itemCode_textfield").value = $("#orderItem_itemCode").val();
                });

                $.each(jsonResponse.shipperItemLengthMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select6);
                    document.getElementById("orderItem_length_textfield").value = (parseInt($("#orderItem_length").val())).toPrecision(1);
                    var totalLength = $('#orderItem_quantity').val() * (parseInt($("#orderItem_length").val())).toPrecision(1);
                    $("#orderItem_length").html(""); // clear list of order Item length dropdown
                    var newOption4 = $('<option value="'+totalLength+'">'+totalLength+'</option>'); // append new value to the dropdown list
                    $("#orderItem_length").append(newOption4);
                    document.getElementById("orderItem_length_textfield").value = totalLength; // set total value to the order item length textfield
                });

                $.each(jsonResponse.shipperItemWidthMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select7);
                    document.getElementById("orderItem_width_textfield").value = (parseInt($("#orderItem_width").val())).toPrecision(1);
                    var totalWidth = $('#orderItem_quantity').val() * (parseInt($("#orderItem_width").val())).toPrecision(1);
                    $("#orderItem_width").html(""); // clear list of order Item width dropdown
                    var newOption5 = $('<option value="'+totalWidth+'">'+totalWidth+'</option>'); // append new value to the dropdown list
                    $("#orderItem_width").append(newOption5);
                    document.getElementById("orderItem_width_textfield").value = totalWidth; // set total value to the order item width textfield
                });

                $.each(jsonResponse.shipperItemHeightMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select8);
                    document.getElementById("orderItem_height_textfield").value = (parseInt($("#orderItem_height").val())).toPrecision(1);
                    var totalHeight = $('#orderItem_quantity').val() * (parseInt($("#orderItem_height").val())).toPrecision(1);
                    $("#orderItem_height").html(""); // clear list of order Item height dropdown
                    var newOption6 = $('<option value="'+totalHeight+'">'+totalHeight+'</option>'); // append new value to the dropdown list
                    $("#orderItem_height").append(newOption6);
                    document.getElementById("orderItem_height_textfield").value = totalHeight; // set total value to the order item height textfield
                });

                $.each(jsonResponse.shipperItemCommentsMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select9);
                    document.getElementById("orderItem_remarks_textarea").value = $("#orderItem_remarks").val();
                });

                // populate item volume based on length X Width X Height
                $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select);

                    var orderItemQuantity = $("#orderItem_quantity").val(),
                        orderItemLength = $("#orderItem_length").val(),
                        orderItemWidth = $("#orderItem_width").val(),
                        orderItemHeight = $("#orderItem_height").val(),
                        orderItem_volume = $("#orderItem_volume"),
                        orderItemVolume;

                    orderItemVolume = orderItemQuantity * (orderItemLength * orderItemWidth * orderItemHeight);
                    orderItem_volume.html("");
                    var newOption = $('<option value="'+orderItemVolume+'">'+orderItemVolume+'</option>'); // append new value to the dropdown list
                    orderItem_volume.append(newOption);
                    document.getElementById("orderItem_volume_textfield").value = orderItemVolume; // set total volume to the order item volume textfield
                });

            });

        });

    });

    // On dropdown change
    function dynamicDropdown(select, index) {
        var opt = select.options,
                lent = opt.length;

        while (lent--) {
            opt[ lent ].disabled = false;
        }

        /*To compute for total tons and weight for FCL*/
        if (sContainer.value != ''){
            var totalVolume,
                    totalWeight,
                    totalValue

            switch(sContainer.value){
                case '10 FOOTER' :
                    totalVolume = sQuantity.value * 14;
                    totalWeight = sQuantity.value * 9000;
                    totalValue = sQuantity.value * 250000;
                    totalVolume = 1 * 14;
                    totalWeight = 1 * 9000;
                    totalValue = 1 * 250000;
                    document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                    document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                    document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                    break;
                case '20 FOOTER' :
                    totalVolume = sQuantity.value * 28;
                    totalWeight = sQuantity.value * 18000;
                    totalValue = sQuantity.value * 500000;
                    totalVolume = 1 * 28;
                    totalWeight = 1 * 18000;
                    totalValue = 1 * 500000;
                    document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                    document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                    document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                    break;
                case '40 STD FOOTER' :
                    totalVolume = sQuantity.value * 56;
                    totalWeight = sQuantity.value * 20000;
                    totalValue = sQuantity.value * 1000000;
                    totalVolume = 1 * 56;
                    totalWeight = 1 * 20000;
                    totalValue = 1 * 1000000;
                    document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                    document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                    document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                    break;
                case '40 HC FOOTER' :
                    totalVolume = sQuantity.value * 78;
                    totalWeight = sQuantity.value * 22000;
                    totalValue = sQuantity.value * 1000000;
                    totalVolume = 1 * 78;
                    totalWeight = 1 * 22000;
                    totalValue = 1 * 1000000;
                    document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                    document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                    document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                    break;
            }
        }

        if (select.options[ index ].value === '') {
            document.getElementById("orderItem-volume").value = "";
        }

        if (select.options[ index ].value === '10 FOOTER') {
            var containerQuantityNull = document.getElementById("orderItem_quantityFCL").value;
            if(containerQuantityNull == '') {
                document.getElementById("orderItem_weight").value = '9,000';
                document.getElementById("orderItem_quantityFCL").value = 1;
                document.getElementById("orderItem-volume").value = '14';
                document.getElementById("orderItem_declaredValues").value = '250,000.00';
            }
        }

        if (select.options[ index ].value === '20 FOOTER') {
            var containerQuantityNull = document.getElementById("orderItem_quantityFCL").value;
            if(containerQuantityNull == '') {
                document.getElementById("orderItem_weight").value = '18,000';
                document.getElementById("orderItem_quantityFCL").value = 1;
                document.getElementById("orderItem-volume").value = '28';
                document.getElementById("orderItem_declaredValues").value = '500,000.00';
            }
        }

        if (select.options[ index ].value === '40 STD FOOTER') {
            var containerQuantity = document.getElementById("orderItem_quantityFCL").value;
            if(containerQuantity == '') {
                document.getElementById("orderItem_weight").value = '20,000';
                document.getElementById("orderItem_quantityFCL").value = 1;
                document.getElementById("orderItem-volume").value = '56';
                document.getElementById("orderItem_declaredValues").value = '1,000,000.00';
            }
        }

        if (select.options[ index ].value === '40 HC FOOTER') {
            var containerQuantity = document.getElementById("orderItem_quantityFCL").value;
            if(containerQuantity == '') {
                document.getElementById("orderItem_weight").value = '22,000';
                document.getElementById("orderItem_quantityFCL").value = 1;
                document.getElementById("orderItem-volume").value = '78';
                document.getElementById("orderItem_declaredValues").value = '1,000,000.00';
            }
        }
    }

    var sContainer = select = document.getElementById('orderItem.nameSize');
    var sQuantity = select = document.getElementById('orderItem_quantityFCL');

    sContainer.onchange = function () {
        dynamicDropdown.call(this, sContainer, this.selectedIndex);
    };

    if(sQuantity != null){
        sQuantity.onchange = function () {
            dynamicDropdown.call(this, sQuantity, this.selectedIndex);
        };
    }

</script>
