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
    <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Booking Information</h3>
    <div class="btn-toolbar pull-right">
        <a class="btn btn-info" title="Edit Booking" href="<s:url action='loadEditOrderInBooking' ><s:param name="orderIdParam" value="%{order.orderId}"></s:param></s:url>" >Edit Booking</a>
    </div>
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

            <s:form cssClass="form-horizontal" theme="bootstrap" action="addItemsInTable" >
            <s:hidden name="order.orderId" value="%{order.orderId}"/>
            <s:hidden  name="item.customerId" id="customerIdHolder" value='%{order.customerId}'/>
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
                                <s:select cssClass="form-control containerQuantityDropdown"
                                          id="orderItem_quantityFCL"
                                          name="orderItem.quantity"
                                          list="containerQuantity"
                                          emptyOption="true"
                                          required="true"
                                          onchange="fcl()" />
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
                                             id="orderItem_weight" />
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top: 0px;">
                                Volume (cbm)<span class="asterisk_red"/>
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control"
                                             id="orderItem-volume"
                                             name="orderItem.volume" />

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
                                             id="orderItem_declaredValues" />
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

                                    <input list="items" id="itemName" name="orderItem.nameSize" class="form-control" maxLength="30" required="true"/>
                                    <datalist id="items">
                                        <s:iterator value="customerItems">
                                            <option id=<s:property value="%{customerItemsId}" /> value=<s:property value="%{itemName}" /> />
                                            <%--<option id=<s:property value="%{itemCode}"/>> <s:property value="%{itemName}"/> </option>--%>
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
                                          value="%{orderItem_itemCode}"
                                          style="display:none" />

                                <s:textfield name="item.itemCode" id="orderItem_itemCode_textfield" required="true"
                                             cssClass="form-control addItemInput" maxLength="25"
                                             pattern="[a-zA-Z0-9]+" title="Item Code should not contain special characters"/>
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Weight (kg)<span class="asterisk_red" />
                            </label>

                            <div class="col-lg-3" >

                                    <s:select cssClass="form-control"
                                              id="orderItem_weight"
                                              list="#{orderItem_weight}"
                                              value="%{orderItem_weight}"
                                              style="display:none" />

                                    <s:textfield cssClass="form-control"
                                                 name="orderItem.weight"
                                                 id="orderItem_weight_textfield"
                                                 maxLength="9"
                                                 required="true"
                                                 pattern="\d+(\.\d{2})?" />

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Length (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:select cssClass="form-control"
                                          id="orderItem_length"
                                          list="#{orderItem_length}"
                                          value="%{getText('format.number',{orderItem_length})}"
                                          style="display:none" />

                                <s:textfield name="item.length" id="orderItem_length_textfield" required="true" cssClass="addItemInput form-control"
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
                                          value="%{getText('format.number',{orderItem_width})}"
                                          style="display:none" />

                                <s:textfield name="item.width" id="orderItem_width_textfield" required="true" cssClass="addItemInput form-control"  pattern="\d+(\.\d{1,2})?" title="Special characters in width is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Declared Value (Php)<span class="asterisk_red" />
                            </label>
                            <div class="col-lg-3" >

                                    <s:select cssClass="form-control automaticDeclaredValue"
                                              id="orderItem_declaredValue"
                                              list="#{orderItem_declaredValue}"
                                              value="%{getText('format.number',{orderItem_declaredValue})}"
                                              style="display:none" />

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
                                          value="%{orderItem_height}"
                                          style="display:none" />

                                <s:textfield name="item.height" id="orderItem_height_textfield" required="true"
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
                                              style="display:none" />

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
                                          style="display:none" />

                                <s:textarea cssClass="form-control"
                                            name="orderItem.remarks"
                                            id="orderItem_remarks_textarea"
                                            cssStyle="resize: none; height: 150px;"
                                            maxLength="255" />
                            </div>

                            <label class="col-lg-3 control-label" style="padding-top: 0px; display: none; ">
                                Volume (cbm)<span class="asterisk_red"/>
                            </label>
                            <div class="col-lg-3" style="padding-top: 0px; display: none; ">

                                    <s:select cssClass="form-control"
                                              id="orderItem_volume"
                                              list="#{orderItem_volume}"
                                              value="%{orderItem_volume}"/>

                                    <s:textfield cssClass="form-control"
                                                 name="orderItem.volume"
                                                 id="orderItem_volume_textfield"/>

                            </div>
                        </div>

                    </s:else>

<%------------------------------------------------ LESS CONTAINER LOAD END ----------------------------------------------------------------%>

                    <div style="clear:both; margin-top: 20px;" class="pull-right">
                        <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' || order.serviceRequirement=='FULL TRUCK LOAD' || order.serviceRequirement=='FTL' ">
                            <span>
                                <s:submit name="submit" cssClass="addContainerToList btn btn-primary" id="submit_button" value="Add Container to List"/>
                            </span>
                        </s:if>
                        <s:else>
                            <span>
                                <s:submit name="submit" cssClass="addItemToList btn btn-primary" id="submit_button" value="Add Item to List" />
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

<div class="row">

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
                <div class="loadingDiv" style="text-align: center;">
                    Processing Items. Please Wait.<br/>
                    <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
                </div>
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
                                <td class="tb-font-black"><s:property value="itemName"/></td>
                                <td class="tb-font-black"><s:property value="weight"/></td>
                                <td class="tb-font-black"><s:property value="volume"/></td>
                                <td class="tb-font-black"><s:property value="description"/></td>
                                <td class="tb-font-black"><s:property value="getText('{0,number,#,##0.00}',{declaredValue})"/></td>
                                <td class="tb-font-black"><s:property value="rate"/></td>
                                <td class="tb-font-black"><s:property value="remarks"/></td>
                                <%--<td class="tb-font-black"><s:property value="orderItemId"/></td>--%>

                                <td class="tb-font-black">
                                    <%--<a id="edit-icon" href="#" data-toggle="modal" data-target="#editItemListingModal" onclick="showEditItemListingFields(${orderItemId});">
                        f                <i class="fa fa-edit"></i>
                                    </a>--%>

                                    <s:url var="editOrderItemUrl" action="loadEditOrderItem">
                                        <s:param name="orderItemIdParam" value="%{orderItemId}"></s:param>
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
                        <%--<s:property  value="%{customerItemsId}"/>--%>
                    </table>

                </div>
            </div>

            <%--<legend />--%>

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

</div>

<%--<div style="text-align: center;">

</div>--%>

<%--</div>--%>

<div class="panel-footer">

    <div class="pull-right">
        <!-- Button trigger modal -->
        <button class="btn btn-danger" data-toggle="modal" data-target="#cancelBooking">
            Cancel
        </button>

        <button class="btn btn-primary" data-toggle="modal" data-target="#saveBooking">
            Save Booking
        </button>
    </div>

</div>

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
                <button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>
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

<script type="text/javascript" src="../includes/js/bookingInfo.js"></script>