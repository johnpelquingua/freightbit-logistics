<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

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
<!-- /.row -->

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
                        <table class="table table-user-information">
                            <tbody>
                            <tr>

                                <td style="font-weight: normal; font-size: 12px; text-align:right !important; border-top: none;">Booking Number</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.orderNumber"/></td>
                            </tr>

                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Freight Type</td>
                                <td style="text-align: left !important;"><s:property value="order.freightType"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Service Mode</td>
                                <td style="text-align: left !important;"><s:property value="order.modeOfService"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Origin Port</td>
                                <td style="text-align: left !important;"><s:property value="order.originationPort"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Notification Type</td>
                                <td style="text-align: left !important;"><s:property value="order.notifyBy"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Status</td>
                                <td style="text-align: left !important;"><s:property value="order.orderStatus"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Comments</td>
                                <td style="text-align: left !important;"><s:property value="order.comments"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-lg-6 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important; border-top: none;">Booking Date</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.orderDate"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Service Requirement</td>
                                <td style="text-align: left !important;" class="serviceReq"><s:property value="order.serviceRequirement"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Payment Mode</td>
                                <td style="text-align: left !important;"><s:property value="order.modeOfPayment"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Destination Port</td>
                                <td style="text-align: left !important;"><s:property value="order.destinationPort"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Total Rate</td>
                                <%--<td style="text-align: left !important;"><s:property value="order.rates"/></td>--%>
                                <td style="text-align: left !important;">"N/A"</td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:right !important;">Prepared By</td>
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
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important; border-top: none;">Customer Name</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.customerName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Contact Person</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.name"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Contact Number</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.phone"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Mobile</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.mobile"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Fax</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.fax"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Email Address</td>
                                <td style="text-align: left !important;"><s:property value="order.shipperInfoContact.email"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Pickup Date</td>
                                <td style="text-align: left !important;"><s:property value="order.pickupDate"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Pickup Address</td>
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
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important; border-top: none;">Consignee Name</td>
                                <td style="border-top: none; text-align: left !important;"><s:property value="order.consigneeInfoContact.name"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Contact Person</td>
                                <td style="text-align: left !important;"><s:property value="order.ConsigneeContactName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Contact Number</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.phone"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Mobile</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.mobile"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Fax</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.fax"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Email Address</td>
                                <td style="text-align: left !important;"><s:property value="order.consigneeInfoContact.email"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Delivery Date</td>
                                <td style="text-align: left !important;"><s:property value="order.deliveryDate"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: normal; font-size: 12px; text-align:left !important;">Delivery Address</td>
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
            <%--<s:property value="%{order.orderId}"/>--%>
            <s:hidden name="order.orderId" value="%{order.orderId}"/>
                <fieldset class="inputs">

                    <legend style="text-align: left;">
                        <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                            <span>
                                Container Information
                            </span>
                        </s:if>
                        <s:else>
                            <span>
                                Item Information
                            </span>
                            <div class="pull-right">

                                <a data-toggle="modal" data-target="#createItem"  class="btn btn-info" id="idCustomer"> Add New Item</a>
                            </div>
                        </s:else>
                    </legend>

                    <div class="form-group" style="padding-top: 25px;">

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                                <span>
                                    Container Quantity<span class="asterisk_red">
                                </span>
                            </s:if>
                            <s:else>
                                <span>
                                    Item Quantity<span class="asterisk_red">
                                </span>
                            </s:else>
                        </label>

                        <div class="col-lg-3" >
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' ">
                            <span>
                                <s:select cssClass="form-control"
                                          id="orderItem.quantity"
                                          name="orderItem.quantity"
                                          list="containerQuantity"
                                          emptyOption="true"
                                          required="true"
                                          onchange="fcl()"
                                        />
                            </span>
                            </s:if>
                            <s:else>
                            <span>
                                <s:select cssClass="form-control"
                                          id="orderItem_quantity"
                                          name="orderItem.quantity"
                                          list="itemQuantity"
                                          emptyOption="true"
                                          required="true"

                                        />
                            </span>
                            </s:else>
                        </div>

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' ">
                                <span>
                                    Container Size<span class="asterisk_red">
                                </span>
                            </s:if>
                            <s:else>
                                <span>
                                    Item Name<span class="asterisk_red">
                                </span>
                            </s:else>
                        </label>

                        <div class="col-lg-3" >

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' ">
                                <span>
                                    <s:select cssClass="form-control"
                                              id="orderItem.nameSize"
                                              name="orderItem.nameSize"
                                              list="containerList"
                                              listKey="key"
                                              listValue="value"
                                              emptyOption="true"
                                              required="true"
                                            />
                                </span>
                            </s:if>
                            <s:else>
                                <%--<s:select cssClass="form-control"
                                          id="item_Name"
                                          name="orderItem.nameSize"
                                          list="customerItems"
                                          listKey="customerItemsId"
                                          listValue="ItemName"
                                          emptyOption="true"
                                          required="true"

                                        />--%>

                                <%--<input list="items" id="itemName" class="form-control" />
                                <datalist id="items">
                                    <s:iterator status="stat" value="customerItems">
                                        <option value=<s:property value="%{customerItemsId}" /> />
                                    </s:iterator>
                                </datalist>--%>

                                <input list="items" id="itemName" name="orderItem.nameSize" class="form-control" maxLength="30" required="true"/>
                                <datalist id="items">
                                    <s:iterator value="customerItems">
                                        <%--<option value=<s:property value="%{customerItemsId}" /> ><s:property value="%{itemName}" /> </option>--%>
                                        <option id=<s:property value="%{customerItemsId}" /> value=<s:property value="%{itemName}" /> />
                                    </s:iterator>
                                </datalist>

                            </s:else>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                            Rate (Php)<span class="asterisk_red" />
                        </label>
                        <div class="col-lg-3" >
                            <s:textfield cssClass="form-control"
                                         id="orderItem_rate"
                                         name="orderItem.rate"
                                         required="true"
                                         maxLength="16"

                                    />
                        </div>

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                            Commodity
                        </label>

                        <div class="col-lg-3" >

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                                <s:textfield cssClass="form-control"
                                             name="orderItem.description"
                                             id="orderItem.description"
                                        />
                            </s:if>
                            <s:else>
                                <s:select cssClass="form-control"
                                          id="orderItem_description"
                                          list="#{orderItem_description}"
                                          value="%{orderItem_description}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             name="orderItem.description"
                                             id="orderItem_description_textfield"
                                             maxLength="20"
                                        />
                            </s:else>

                        </div>

                    </div>

                    <div class="form-group weightAndVolume">

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                                Weight (kg)<span class="asterisk_red" />
                        </label>

                        <div class="col-lg-3" >
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                                <s:textfield cssClass="form-control"
                                             name="orderItem.weight"
                                             id="orderItem_weight" />
                            </s:if>
                            <s:else>
                                <s:select cssClass="form-control"
                                          id="orderItem_weight"
                                          list="#{orderItem_weight}"
                                          value="%{orderItem_weight}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             name="orderItem.weight"
                                             id="orderItem_weight_textfield"
                                             maxLength="9"
                                             required="true"
                                             placeholder="XXXXXX.XX"
                                             pattern="\d+(\.\d{2})?"
                                        />
                            </s:else>

                        </div>

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                            Volume (m&#179;)<span class="asterisk_red"/>
                        </label>
                        <div class="col-lg-3" >

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                                <s:textfield cssClass="form-control"
                                             id="orderItem-volume"
                                             name="orderItem.volume"
                                        />
                            </s:if>
                            <s:else>
                                <s:select cssClass="form-control"
                                          id="orderItem_volume"
                                          list="#{orderItem_volume}"
                                          value="%{orderItem_volume}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             name="orderItem.volume"
                                             id="orderItem_volume_textfield"
                                             required="true"
                                        />
                            </s:else>

                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                            Comments
                        </label>
                        <div class="col-lg-3" >
                            <s:textarea cssClass="form-control"
                                        name="orderItem.remarks"
                                        id="orderItem_remarks"
                                        cssStyle="resize: none; height: 150px;"
                                    />
                        </div>

                        <label class="col-lg-3 control-label" style="padding-top: 0px;">
                            Declared Value (Php)<span class="asterisk_red" />
                        </label>
                        <div class="col-lg-3" >

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                                <s:textfield cssClass="form-control"
                                             name="orderItem.declaredValue"
                                             id="orderItem_declaredValues"
                                        />
                            </s:if>
                            <s:else>
                                <s:select cssClass="form-control"
                                          id="orderItem_declaredValue"
                                          list="#{orderItem_declaredValue}"
                                          value="%{orderItem_declaredValue}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             name="orderItem.declaredValue"
                                             id="orderItem_declaredValue_textfield"
                                             maxLength="19"
                                             required="true"
                                        />
                            </s:else>

                        </div>

                    </div>

                    <legend />

                    <div style="clear:both; margin-top: 20px;" class="pull-right">
                        <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
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
        <div id="alert" class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">

    <div class="col-lg-12">

        <div class="well">

        <fieldset>

            <legend style="text-align: left;">
                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
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
                <div class="table-responsive list-table">

                    <table class="itemListing table table-striped table-hover table-bordered text-center tablesorter" id="orderItems">
                        <thead>
                        <tr class="header_center" style="background-color: #fff;">
                            <th class="tb-font-black">Quantity</th>
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' ">
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
                                <td class="tb-font-black"><s:property value="declaredValue"/></td>
                                <td class="tb-font-black"><s:property value="rate"/></td>
                                <td class="tb-font-black"><s:property value="remarks"/></td>

                                <td class="tb-font-black">

                                    <s:url var="deleteItemUrl" action="deleteItem">
                                        <s:param name="orderItemIdParam" value="%{orderItemId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                         title="Delete this Item?"
                                         onclick="return confirm('Do you really want to delete this item?');">
                                        <i class="fa fa-trash-o"></i>
                                    </s:a>

                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                        <%--<s:property  value="%{customerItemsId}"/>--%>
                    </table>

                </div>
            </div>

            <legend />

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

<div style="text-align: center;">

</div>

</div>

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
                                             cssClass="form-control addItemInput" pattern="[A-Za-z ]+" title="Must be letters only" maxlength="50"/>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Item Code<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.itemCode" id="item_itemCode" required="true"
                                             cssClass="form-control addItemInput" maxLength="3" pattern="[A-Z]+" title="Must be capital letters only" onkeypress="return alphaKeyOnly(event)"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Weight (kg)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.weight" id="item.weight" required="true"
                                             cssClass="form-control addItemInput" pattern="[0-9.,]+" title="Special characters in Price is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                        </div>

                        <!-- Text input-->
                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">SRP (Php)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.srp" id="item_srp" required="true" cssClass="form-control addItemInput" pattern="[0-9.,]+" title="Special characters in Quality is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Length (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.length" id="item.length" required="true" cssClass="addItemInput form-control"
                                             style="150px" pattern="[0-9.]+" title="Special characters in length is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Width (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.width" id="item.width" required="true" cssClass="addItemInput form-control"  pattern="[0-9.]+" title="Special characters in width is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" style="padding-top:0px;">Height (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield name="item.height" id="item.height" required="true"
                                             cssClass="addItemInput form-control" pattern="[0-9.]+" title="Special characters in height is not valid" onkeypress="return isNumberKey(event)"/>
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
                <h4 class="modal-title" id="myModalLabel">Cancel Booking</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel the booking?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <%--<s:property value="order.orderId"/>--%>
                <s:url var="deleteOrderUrl" action="deleteOrder">
                    <s:param name="orderIdParam" value="order.orderId"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip">
                    <button type="button" class="btn btn-danger">Yes</button>
                </s:a>
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
                <h4 class="modal-title" id="myModalLabel">Save Booking ?</h4>
            </div>
            <div class="modal-body">

                <div class="panel-body">

                    <div class="col-lg-12">

                        <div class="col-lg-12">

                            <div class="panel panel-info ">

                                <br/>

                                <table class="table leftAlign table-user-information">
                                    <th style="font-size: 20px; border-top: none; width: 300px;">
                                        Booking Number
                                        <%--<s:property value="order.orderId"/>--%>
                                    </th>
                                    <th style="font-size: 20px; border-top: none; width: 300px;">
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
                                        <td><s:property value="order.comments"/></td>
                                    </tr>

                                    </tbody>
                                </table>

                            </div>

                        </div>

                        <div class="col-lg-6">

                            <div class="panel panel-info ">

                                <table class="table leftAlign table-user-information">

                                    <th style="font-size: 18px; border-top: none; width: 300px;">Customer Information</th>

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

                                    <th style="font-size: 18px; border-top: none; width: 300px;">Consignee Information</th>

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
                    <div class="table-responsive list-table">

                        <table class="table table-striped table-hover table-bordered text-center tablesorter" id="orderItems">
                            <thead>
                            <tr class="header_center" style="background-color: #fff;">
                                <th class="tb-font-black">Quantity</th>
                                <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
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

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <%--<button type="button" class="btn btn-primary" href="#"><a style="color: #fff; text-decoration: none;" href="<s:url action='../orders/viewOrders' />">Yes</a></button>--%>
                <button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>
            </div>
        </div>
    </div>
</div>
</div>

<script type="text/javascript">
    // AUTHORED BY Jan Sarmiento -- START
    $(document).ready(function(){
        // adding item memory
        $('.addItemToList').click(function(){
            localStorage.setItem('addingItems', true);
        })

        $('.addContainerToList').click(function(){
            localStorage.setItem('addingContainer', true);
        })

        addTotalRate();
        newlineHandler('itemListing', 8);
    })

    $(function(){ // function to check if adding item memory exists
        if(localStorage.getItem('addingItems') || localStorage.getItem('addingContainer')){
            $('.addItemDiv').focus();
        }
    })

    $(function(){ // THIS FUNCTION HIDES THE WEIGHT AND VOLUME FIELD IF THE SERVICE REQ IS FULL CONTAINER LOAD
        if($('.serviceReq').text() == 'FULL CONTAINER LOAD'){
            $('.weightAndVolume').hide();
        }
    })
    // END

function getThis(){
    var itemQuantityField = $("#orderItem_quantity").val();
    var itemNameField = $("#itemName").val();
    var itemRateField = $("#orderItem_rate").val();
    var itemDescriptionField = $("#orderItem_description_textfield").val();
    var itemWeightField = $("#orderItem_weight").val();
    var itemVolumeField = $("#orderItem_volume_textfield").val();
    var itemRemarksField = $("#orderItem_remarks").val();
    var itemValueField = $("#orderItem_declaredValue_textfield").val();

    localStorage.setItem("itemQuantityField",itemQuantityField);
    localStorage.setItem("itemNameField",itemNameField);
    localStorage.setItem("itemRateField",itemRateField);
    localStorage.setItem("itemDescriptionField",itemDescriptionField);
    localStorage.setItem("itemWeightField", itemWeightField);
    localStorage.setItem("itemVolumeField",itemVolumeField);
    localStorage.setItem("itemRemarksField",itemRemarksField);
    localStorage.setItem("itemValueField",itemValueField);
}

function setThis(){
    $("#orderItem_quantity").val(localStorage.getItem("itemQuantityField"));
    $("#itemName").val(localStorage.getItem("itemNameField"));
    $("#orderItem_rate").val(localStorage.getItem("itemRateField"));
    $("#orderItem_description_textfield").val(localStorage.getItem("itemDescriptionField"));
    $("#orderItem_weight").val(localStorage.getItem("itemWeightField"));
    $("#orderItem_volume_textfield").val(localStorage.getItem("itemVolumeField"));
    $("#orderItem_remarks").val(localStorage.getItem("itemRemarksField"));
    $("#orderItem_declaredValue_textfield").val(localStorage.getItem("itemValueField"));
}

$( window ).load(function() {

    setThis();

    localStorage.clear();

});

function alphaKeyOnly(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    if ((charCode > 32 && charCode < 57)||(charCode > 57 && charCode <65) || (charCode > 90 && charCode < 97) )
        return false;

    return true;
}

function isNumberKey(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57) || (charCode == 46 && $(this).val().indexOf('.') != -1))
        return false;

    return true;
}

$(document).ready(function() {
    $("#orderItem_rate").maskMoney();
    $("#orderItem_declaredValues").maskMoney();
    $("#item_srp").maskMoney();
    $("#orderItem_rate").maskMoney();
    $("#orderItem_weight").mask('9,999,999');
    $("#orderItem-volume").mask('9,999,999');
//    $("#orderItemVolume").mask('9,999,999');
    $("#orderItem_volume_textfield").mask('9,999,999');
    $("#orderItem_declaredValues").maskMoney();
    $("#orderItem_declaredValue_textfield").maskMoney();
});

    $("#item_itemCode").keyup(function(){
        this.value=this.value.toUpperCase();
    });

    //to get the customer id
    $(document).ready(function(){
        $("#idCustomer").click(function(){
            var custId = $("#custIdHolder").val();
            /*alert(custId);*/
            getThis();
            $("#customerIdHolder").val(custId);
        });
    });

    $(document).ready(function() {
        // Anchor on successDiv on every add order item
        if ($('#successDiv').length !== 0){
            window.location.href = '#successDiv';
        }

        // On click event of Item name change
        //$('#itemName').click(function(event) {
        $("#itemName").bind('input', function () {
            var x = $('#itemName').val();
            var z = $('#items');
            var val = $(z).find('option[value="' + x + '"]');
            var item_Id = val.attr('id');
            //alert(item_Id);

            /*var item_Id = $("#itemName").val();
            alert(item_Id);*/

            if(item_Id == '') {
                document.getElementById("orderItem_volume_textfield").value = '';
                document.getElementById("orderItem_description_textfield").value = '';
                document.getElementById("orderItem_declaredValue_textfield").value = '';
                document.getElementById("orderItem_weight_textfield").value = '';
            }

            $.getJSON('itemAction', {
                itemId: item_Id
            },

            function (jsonResponse) {
                var select = $('#orderItem_volume');

                select.find('option').remove();

                var select2 = $('#orderItem_description');

                select2.find('option').remove();

                var select3 = $('#orderItem_declaredValue');

                select3.find('option').remove();

                var select4 = $('#orderItem_weight');

                select4.find('option').remove();

                var itemQuantity = $("#orderItem_quantity").val();
                // Set quantity to 1 when Item name is selected first
                if(itemQuantity == '') {
                    document.getElementById("orderItem_quantity").value = 1;
                }

                    // populate item volume based on length X Width X Height
                    $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {

                        $('<option>').val(key).text(value).appendTo(select);

                        var itemVolume = $("#orderItem_volume").val(); // get value of volume
                        document.getElementById("orderItem_volume_textfield").value = itemVolume; // set volume of Item volume textfield
                        var itemNum = $("#orderItem_quantity").val(); // get value of quantity
                        var totalVolume = itemNum * itemVolume; // compute for total volume
                        $("#orderItem_volume").html(""); // clear list of order Item volume dropdown
                        var newOption = $('<option value="'+totalVolume+'">'+totalVolume+'</option>'); // append new value to the dropdown list
                        $("#orderItem_volume").append(newOption);
                        document.getElementById("orderItem_volume_textfield").value = totalVolume; // set total volume to the order item volume textfield

                    });

                    // populate item description
                    $.each(jsonResponse.shipperItemCommodityMap, function (key, value) {

                        $('<option>').val(key).text(value).appendTo(select2);

                        var itemCommodity = $("#orderItem_description").val();
                        document.getElementById("orderItem_description_textfield").value = itemCommodity;

                    });

                    // populate item declared value
                    $.each(jsonResponse.shipperItemValueMap, function (key, value) {

                        $('<option>').val(key).text(value).appendTo(select3);

                        var itemValue = $("#orderItem_declaredValue").val(); // get value of order item
                        document.getElementById("orderItem_declaredValue_textfield").value = itemValue; // set value of order item to textfield
                        var itemNum = $("#orderItem_quantity").val(); // get value of quantity
                        var totalValue = itemNum * itemValue; // compute for total value
                        $("#orderItem_declaredValue").html(""); // clear list of order Item value dropdown
                        var newOption2 = $('<option value="'+totalValue+'">'+totalValue+'</option>'); // append new value to the dropdown list
                        $("#orderItem_declaredValue").append(newOption2);
                        document.getElementById("orderItem_declaredValue_textfield").value = totalValue; // set total value to the order item value textfield
                    });

                    // populate item declared weight
                    $.each(jsonResponse.shipperItemWeightMap, function (key, value) {

                        $('<option>').val(key).text(value).appendTo(select4);

                        var itemWeight = $("#orderItem_weight").val(); // get weight of order item
                        document.getElementById("orderItem_weight_textfield").value = itemWeight; // set weight of order item to textfield
                        var itemNum = $("#orderItem_quantity").val(); // get value of quantity
                        var totalWeight = itemNum * itemWeight; // compute for total value
                        $("#orderItem_weight").html(""); // clear list of order Item weight dropdown
                        var newOption3 = $('<option value="'+totalWeight+'">'+totalWeight+'</option>'); // append new value to the dropdown list
                        $("#orderItem_weight").append(newOption3);
                        document.getElementById("orderItem_weight_textfield").value = totalWeight; // set total value to the order item value textfield
                    });

            });

        });

        // On click event of Item Quantity change
        $('#orderItem_quantity').change(function(event) {
            var x = $('#itemName').val();
            var z = $('#items');
            var val = $(z).find('option[value="' + x + '"]');
            var item_Id = val.attr('id');

            //var item_Id = $("#itemName").val();
            //alert(item_Id);

            if(item_Id == '') {
                document.getElementById("orderItem_volume_textfield").value = '';
                document.getElementById("orderItem_description_textfield").value = '';
                document.getElementById("orderItem_declaredValue_textfield").value = '';
                document.getElementById("orderItem_weight_textfield").value = '';
            }

            $.getJSON('itemAction', {
                itemId: item_Id
            },

                function (jsonResponse) {
                    var select = $('#orderItem_volume');

                    select.find('option').remove();

                    var select2 = $('#orderItem_description');

                    select2.find('option').remove();

                    var select3 = $('#orderItem_declaredValue');

                    select3.find('option').remove();

                    var select4 = $('#orderItem_weight');

                    select4.find('option').remove();

                    // populate item volume based on length X Width X Height
                    $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {

                        $('<option>').val(key).text(value).appendTo(select);

                        var itemVolume = $("#orderItem_volume").val(); // get value of volume
                        document.getElementById("orderItem_volume_textfield").value = itemVolume; // set volume of Item volume textfield
                        var itemNum = $("#orderItem_quantity").val(); // get value of quantity
                        var totalVolume = itemNum * itemVolume; // compute for total volume
                        $("#orderItem_volume").html(""); // clear list of order Item volume dropdown
                        var newOption = $('<option value="'+totalVolume+'">'+totalVolume+'</option>'); // append new value to the dropdown list
                        $("#orderItem_volume").append(newOption);
                        document.getElementById("orderItem_volume_textfield").value = totalVolume; // set total volume to the order item volume textfield

                    });

                    // populate item description
                    $.each(jsonResponse.shipperItemCommodityMap, function (key, value) {

                        $('<option>').val(key).text(value).appendTo(select2);

                        var itemCommodity = $("#orderItem_description").val();
                        document.getElementById("orderItem_description_textfield").value = itemCommodity;

                    });

                    // populate item declared value
                    $.each(jsonResponse.shipperItemValueMap, function (key, value) {

                        $('<option>').val(key).text(value).appendTo(select3);

                        var itemValue = $("#orderItem_declaredValue").val(); // get value of order item
                        document.getElementById("orderItem_declaredValue_textfield").value = itemValue; // set value of order item to textfield
                        var itemNum = $("#orderItem_quantity").val(); // get value of quantity
                        var totalValue = itemNum * itemValue; // compute for total value
                        $("#orderItem_declaredValue").html(""); // clear list of order Item value dropdown
                        var newOption2 = $('<option value="'+totalValue+'">'+totalValue+'</option>'); // append new value to the dropdown list
                        $("#orderItem_declaredValue").append(newOption2);
                        document.getElementById("orderItem_declaredValue_textfield").value = totalValue; // set total value to the order item value textfield
                    });

                        // populate item declared weight
                        $.each(jsonResponse.shipperItemWeightMap, function (key, value) {

                            $('<option>').val(key).text(value).appendTo(select4);

                            var itemWeight = $("#orderItem_weight").val(); // get weight of order item
                        document.getElementById("orderItem_weight_textfield").value = itemWeight; // set weight of order item to textfield
                        var itemNum = $("#orderItem_quantity").val(); // get value of quantity
                        var totalWeight = itemNum * itemWeight; // compute for total value
                        $("#orderItem_weight").html(""); // clear list of order Item weight dropdown
                        var newOption3 = $('<option value="'+totalWeight+'">'+totalWeight+'</option>'); // append new value to the dropdown list
                        $("#orderItem_weight").append(newOption3);
                        document.getElementById("orderItem_weight_textfield").value = totalWeight; // set total value to the order item value textfield
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
            if(sContainer.value === '10 FOOTER'){
                var totalVolume = sQuantity.value * 14; /*cmb*/
                var totalWeight = sQuantity.value * 9000; /*tons*/
                document.getElementById("orderItem-volume").value = totalVolume;
                document.getElementById("orderItem_weight").value = totalWeight;
            }
            if(sContainer.value === '20 FOOTER'){
                var totalVolume = sQuantity.value * 28; /*cmb*/
                var totalWeight = sQuantity.value * 18000; /*tons*/
                document.getElementById("orderItem-volume").value = totalVolume;
                document.getElementById("orderItem_weight").value = totalWeight;
            }
            if(sContainer.value === '40 STD FOOTER'){
                var totalVolume = sQuantity.value * 56; /*cmb*/
                var totalWeight = sQuantity.value * 20000; /*tons*/
                document.getElementById("orderItem-volume").value = totalVolume;
                document.getElementById("orderItem_weight").value = totalWeight;
            }
            if(sContainer.value === '40 HC FOOTER'){
                var totalVolume = sQuantity.value * 78; /*cmb*/
                var totalWeight = sQuantity.value * 22000; /*tons*/
                document.getElementById("orderItem-volume").value = totalVolume;
                document.getElementById("orderItem_weight").value = totalWeight;
            }
        }

        if (select.options[ index ].value === '') {

            document.getElementById("orderItem-volume").value = "";
//            document.getElementById("orderItemVolume").value = "";
        }

        if (select.options[ index ].value === '10 FOOTER') {

            var containerQuantityNull = document.getElementById("orderItem.quantity").value;

            if(containerQuantityNull == '') {
                document.getElementById("orderItem_weight").value = 9000;
                document.getElementById("orderItem.quantity").value = 1;
                document.getElementById("orderItem-volume").value = "14";
//                document.getElementById("orderItemVolume").value = "14";
            }else{
                var containerQuantity = document.getElementById("orderItem.quantity").value;
                var containerVolume = containerQuantity * 14;
                document.getElementById("orderItem_weight").value = 9000;
                document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
            }
        }

        if (select.options[ index ].value === '20 FOOTER') {

            var containerQuantityNull = document.getElementById("orderItem.quantity").value;

            if(containerQuantityNull == '') {
                document.getElementById("orderItem_weight").value = 18000;
                document.getElementById("orderItem.quantity").value = 1;
                document.getElementById("orderItem-volume").value = "28";
//                document.getElementById("orderItemVolume").value = "28";
            }else {
                var containerQuantity = document.getElementById("orderItem.quantity").value;
                var containerVolume = containerQuantity * 28;
                document.getElementById("orderItem_weight").value = 18000;
                document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
            }
        }

        if (select.options[ index ].value === '40 STD FOOTER') {

            var containerQuantity = document.getElementById("orderItem.quantity").value;

            if(containerQuantity == '') {
                document.getElementById("orderItem_weight").value = 20000;
                document.getElementById("orderItem.quantity").value = 1;
                document.getElementById("orderItem-volume").value = "56";
//                document.getElementById("orderItemVolume").value = "56";
            }else {
                var containerQuantity = document.getElementById("orderItem.quantity").value;
                var containerVolume = containerQuantity * 56;
                document.getElementById("orderItem_weight").value = 20000;
                document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
            }
        }

        if (select.options[ index ].value === '40 HC FOOTER') {

            var containerQuantity = document.getElementById("orderItem.quantity").value;

            if(containerQuantity == '') {
                document.getElementById("orderItem_weight").value = 22000;
                document.getElementById("orderItem.quantity").value = 1;
                document.getElementById("orderItem-volume").value = "78";
//                document.getElementById("orderItemVolume").value = "78";
            }else {
                var containerQuantity = document.getElementById("orderItem.quantity").value;
                var containerVolume = containerQuantity * 78;
                document.getElementById("orderItem_weight").value = 22000;
                document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
            }
        }
    }

    $(document).ready(function(){
        validationForm('addItemInput', 'saveBtnModal');
    })

    var sContainer = select = document.getElementById('orderItem.nameSize');
    var sQuantity = select = document.getElementById('orderItem.quantity');

    sContainer.onchange = function () {
        dynamicDropdown.call(this, sContainer, this.selectedIndex);
    };

    sQuantity.onchange = function () {
        dynamicDropdown.call(this, sQuantity, this.selectedIndex);
    };

</script>
