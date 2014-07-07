<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<sj:head compressed='true' jquerytheme="ui-darkness"/>
<sx:head debug="true" extraLocales="en-us,nl-nl,de-de"/>--%>


<div class="row">
    <div class="col-lg-12">
        <h1>Booking Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> <i class="fa fa-list"></i> Booking List </a>
            </li>
            <li class="active"><i class="fa fa-book"></i> New Booking</li>
        </ol>

    </div>
</div>
<div class="row">
<div class="col-lg-12">
<div class="panel panel-primary">
<div class="panel-heading">
    <img src="includes/images/add-user.png" class="box-icon">
    <span class="panel-title">Booking Information</span>
</div>
<div class="panel-body">
<div class="table-responsive">
<div class="form-group">
    <label class="col-sm-2 control-label"
           for="orderBean.orderNumber">Booking Number:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                     name="orderBean.orderNumber" disabled="true"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.modeOfService">Service Mode:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  name="orderBean.modeOfService" list="modeOfServiceList" listKey="key"
                  listValue="value" value="orderBean.modeOfService" emptyOption="true"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.serviceRequirement">Requirement:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  name="orderBean.serviceRequirement" list="serviceRequirementList"
                  listKey="key"
                  listValue="value" emptyOption="true"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.freightType">Freight Type:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  name="orderBean.freightType" list="freightTypeList" listKey="key"
                  listValue="value" emptyOption="true"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.modeOfPayment">Payment:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  name="orderBean.modeOfPayment" list="modeOfPaymentList" listKey="key"
                  listValue="value" emptyOption="true"/>
    </div>
</div>


<ul class="nav nav-tabs" role="tablist">
    <li class="active"><a href="#details" role="tab" data-toggle="tab">Details</a></li>
    <li><a href="#shipper" role="tab" data-toggle="tab">Shipper</a></li>
    <li><a href="#consignee" role="tab" data-toggle="tab">Consignee</a></li>
    <li><a href="#itemcargo" role="tab" data-toggle="tab">Item/Cargo</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade in active" id="details">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.origin">Origin:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.origin"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"
               for="orderBean.destination">Destination:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.destination"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"
               for="orderBean.rates">Rates:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.rates"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"
               for="orderBean.rates">Notification Type:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.notifyBy" list="notifyByList" listKey="key"
                      listValue="value"
                      value="orderBean.notifyBy" emptyOption="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"
               for="orderBean.comments">Comments :</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control"
                         name="orderBean.comments"></s:textfield>
        </div>
    </div>
</div>
<div class="tab-pane fade" id="shipper">

    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.companyName">Company Name:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.companyName" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.contactPerson">Contact Person:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.contactPerson" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"
               for="orderBean.pickupDate">Pickup Date:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <sj:datepicker id="datepicker1"
                           displayFormat="mm-dd-yy"
                           imageUrl="includes/images/datepicker.gif"
                           imageTooltip="Select Your Birthdate"
                           showButton="true"
                           changeYear="true"
                           changeMonth="true"
                           style="width: 100% !important; margin-bottom: 15px !important; display: initial!important; border: 1px solid #ccc; border-radius: 4px; height: 34px;"
                           name="orderBean.pickupDate"
                           value="%{orderBean.bookingDate}"
                    />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.pickupAddress">Pickup Address:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.pickupAddress" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>
</div>


<div class="tab-pane fade" id="consignee">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.consigneeName">Consignee Name:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.consigneeName" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.consigneeContactPerson">Contact Person:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.consigneeContactPerson" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"
               for="orderBean.deliveryDate">Delivery Date:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <sj:datepicker id="datepicker1"
                           displayFormat="mm-dd-yy"
                           imageUrl="includes/images/datepicker.gif"
                           imageTooltip="Select Your Birthdate"
                           showButton="true"
                           changeYear="true"
                           changeMonth="true"
                           style="width: 100% !important; margin-bottom: 15px !important; display: initial!important; border: 1px solid #ccc; border-radius: 4px; height: 34px;"
                           name="orderBean.deliveryDate"
                           value="%{orderBean.bookingDate}"
                    />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.deliveryAddress">Delivery Address:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.deliveryAddress" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>

</div>
<div class="tab-pane fade" id="itemcargo">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.quantity">Quantity:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.quantity" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.size">Size:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.size"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.estimatedWeight">Estimated Weight:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.estimatedWeight"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.declaredValue">Declared Value:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.declaredValue"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.classification">Classification:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.classification" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.rate">Rate:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.rate"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.deliveryAddress">Commodity Description:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.orderNumber"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="orderBean.deliveryAddress">Remarks:</label>

        <div class="col-sm-9" style="margin-left:4%">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.orderNumber"/>
        </div>
    </div>
    <div class="col-lg-2 col-lg-offset-10">
        <s:submit cssClass="btn btn-info pull-right" name="submit" value="Add"/>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Cargo List</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive list-table">
                        <table class="table table-striped table-hover table-bordered text-center tablesorter">
                            <thead>
                            <tr class="header_center">
                                <%--<th class="tb-font-black"><input type="checkbox"/></th>--%>
                                <th class="tb-font-black" style="text-align: center;">Quantity <i
                                        class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Size <i class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Class <i class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Weight <i class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Value <i class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Description <i
                                        class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Remarks <i class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Rate <i class="fa fa-sort"></i>
                                </th>
                                <th class="tb-font-black" style="text-align: center;">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="success">
                                <td class="tb-font-black">2</td>
                                <td class="tb-font-black">50</td>
                                <td class="tb-font-black">Premium</td>
                                <td class="tb-font-black">150</td>
                                <td class="tb-font-black">2,000</td>
                                <td class="tb-font-black">Door to Door</td>
                                <td class="tb-font-black">Approved</td>
                                <td class="tb-font-black">5,000</td>

                                <td class="tb-font-black">
                                    <%--<a href="#"><img src="includes/images/edit-booking.png" title="Edit Booking"> </a>
                                    <a href="#"><img src="includes/images/delete-booking.png" title="Delete Booking"> </a>
                                    <a href="#"><img src="includes/images/info-booking.png" title="Booking Info"> </a>--%>

                                    <a href="#"><i class="fa fa-times-circle"></i></a>

                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="panel-footer">
                    <%--<span class="pull-right">
                    <a href="viewOrders" class="icon-action-link" rel="tooltip" >
                        <img src="includes/images/add-user.png" class="icon-action circ-icon">
                    </a>
                    </span>--%>
                                <span class="col-lg-offset-9">
										<b>Total Rate :</b>
                                </span>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</div>
</div>
<div class="panel-footer">
    <div class="btn-group pull-right">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-info">Save</button>
    </div>
</div>
</div>
</div>
</div>


<%--sir jo--%>

<div class="row">
    <div class="col-lg-12">
        <h1>Booking Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> <i class="fa fa-list"></i> Booking List </a>
            </li>
            <li class="active"><i class="fa fa-book"></i> New Booking</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
<div class="col-lg-12">
<div class="panel panel-primary">

<div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-book"></i> New Booking</h3>
</div>

<div class="panel-body">

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Order Details</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="form-group">
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Service Requirement : </label>

                        <div class="col-lg-4">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      name="orderBean.serviceRequirement" list="serviceRequirementList" listKey="key"
                                      listValue="value" value="orderBean.serviceRequirement"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Service Mode :</label>

                        <div class="col-lg-4">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      name="orderBean.modeOfService" list="modeOfServiceList" listKey="key"
                                      listValue="value" value="orderBean.modeOfService"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Booking Number :</label>

                        <div class="col-lg-4">
                            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Booking Date :</label>

                        <div class="col-lg-4">
                            <sj:datepicker id="datepicker1"
                                           displayFormat="mm-dd-yy"
                                           imageUrl="includes/images/datepicker.gif"
                                           imageTooltip="Select Your Birthdate"
                                           showButton="true"
                                           changeYear="true"
                                           changeMonth="true"
                                           style="width: 100% !important; margin-bottom: 15px !important; display: initial!important; border: 1px solid #ccc; border-radius: 4px; height: 34px;"
                                           name="orderBean.bookingDate"
                                           value="%{orderBean.bookingDate}"
                                    />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Port of Origin :</label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Port of Destination :</label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Notification Type :</label>

                        <div class="col-lg-4">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      name="orderBean.notifyBy" list="notifyByList" listKey="key" listValue="value"
                                      value="orderBean.notifyBy"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Payment Mode :</label>

                        <div class="col-lg-4">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      name="orderBean.modeOfPaymentList" list="modeOfPaymentList" listKey="key"
                                      listValue="value" value="orderBean.modeOfPayment"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Rate :</label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Status :</label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Comments :</label>

                        <div class="col-lg-4">
                            <textarea class="form-control" rows="3"
                                      style="resize:none; margin-bottom: 15px !important;"></textarea>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Booked By :</label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
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
                <h3 class="panel-title">Shipper Details</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="form-group">
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Name :</label>

                        <div class="col-lg-9">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Contact Person:</label>

                        <div class="col-lg-9">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Pick-Up Date :</label>

                        <div class="col-lg-9">
                            <sj:datepicker id="datepicker2"
                                           displayFormat="mm-dd-yy"
                                           imageUrl="includes/images/datepicker.gif"
                                           imageTooltip="Select Your Birthdate"
                                           showButton="true"
                                           changeYear="true"
                                           changeMonth="true"
                                           style="width: 100% !important; margin-bottom: 15px !important; display: initial!important; border: 1px solid #ccc; border-radius: 4px; height: 34px;"
                                           name="orderBean.bookingDate"
                                           value="%{orderBean.bookingDate}"
                                    />
                        </div>
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Pick-Up Address:</label>

                        <div class="col-lg-9">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Consignee Details</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="form-group">
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Name :</label>

                        <div class="col-lg-9">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Contact Person:</label>

                        <div class="col-lg-9">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Delivery Date :</label>

                        <div class="col-lg-9">
                            <sj:datepicker id="datepicker3"
                                           displayFormat="mm-dd-yy"
                                           imageUrl="includes/images/datepicker.gif"
                                           imageTooltip="Select Your Birthdate"
                                           showButton="true"
                                           changeYear="true"
                                           changeMonth="true"
                                           style="width: 100% !important; margin-bottom: 15px !important; display: initial!important; border: 1px solid #ccc; border-radius: 4px; height: 34px;"
                                           name="orderBean.bookingDate"
                                           value="%{orderBean.bookingDate}"
                                    />
                        </div>
                        <label class="col-lg-3 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Delivery Address:</label>

                        <div class="col-lg-9">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Cargo Details</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="form-group">
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Quantity : </label>

                        <div class="col-lg-4">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Size : </label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Estimated Weight : </label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Declared Value : </label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Classification : </label>

                        <div class="col-lg-4">
                            <select class="form-control" style="margin-bottom: 15px !important;">

                            </select>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Rate : </label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Commodity Description : </label>

                        <div class="col-lg-4">
                            <input class="form-control" style="margin-bottom: 15px !important;"/>
                        </div>
                        <label class="col-lg-2 control-label tb-font-black"
                               style="text-align: right; padding-top: 7px;">Remarks : </label>

                        <div class="col-lg-4">
                            <textarea class="form-control" style="margin-bottom: 15px !important; resize:none;"
                                      rows="3"> </textarea>
                        </div>
                        <div class="col-lg-2 col-lg-offset-10">
                            <s:submit cssClass="btn btn-info pull-right" name="submit" value="Add"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Cargo List</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-hover table-bordered text-center tablesorter">
                        <thead>
                        <tr class="header_center">
                            <%--<th class="tb-font-black"><input type="checkbox"/></th>--%>
                            <th class="tb-font-black" style="text-align: center;">Quantity <i class="fa fa-sort"></i>
                            </th>
                            <th class="tb-font-black" style="text-align: center;">Size <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Class <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Weight <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Value <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Description <i class="fa fa-sort"></i>
                            </th>
                            <th class="tb-font-black" style="text-align: center;">Remarks <i class="fa fa-sort"></i>
                            </th>
                            <th class="tb-font-black" style="text-align: center;">Rate <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="success">
                            <td class="tb-font-black">2</td>
                            <td class="tb-font-black">50</td>
                            <td class="tb-font-black">Premium</td>
                            <td class="tb-font-black">150</td>
                            <td class="tb-font-black">2,000</td>
                            <td class="tb-font-black">Door to Door</td>
                            <td class="tb-font-black">Approved</td>
                            <td class="tb-font-black">5,000</td>

                            <td class="tb-font-black">
                                <%--<a href="#"><img src="includes/images/edit-booking.png" title="Edit Booking"> </a>
                                <a href="#"><img src="includes/images/delete-booking.png" title="Delete Booking"> </a>
                                <a href="#"><img src="includes/images/info-booking.png" title="Booking Info"> </a>--%>

                                <a href="#"><i class="fa fa-times-circle"></i></a>

                            </td>

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-footer">
                <%--<span class="pull-right">
                <a href="viewOrders" class="icon-action-link" rel="tooltip" >
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </a>
                </span>--%>
                                <span class="col-lg-offset-9">
										<b>Total Rate :</b>
                                </span>
            </div>
        </div>
    </div>
</div>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
    <button type="button" class="btn btn-info">Save</button>
</div>
</div>
</div>
</div>
