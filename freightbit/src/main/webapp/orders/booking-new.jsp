<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

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
    <%--<img src="includes/images/add-user.png" class="box-icon">--%>
        <i class="fa fa-book"></i>
    <span class="panel-title">Booking Information</span>
</div>
<div class="panel-body">
<div class="table-responsive">

<div class="form-group">

    <label class="col-lg-2 control-label"
           for="orderBean.orderNumber" style="margin-top: 5px;">Booking Number:</label>
    <div class="col-lg-4">
        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                     name="orderBean.orderNumber" disabled="true"/>
    </div>

    <label class="col-lg-2 control-label"
           for="orderBean.orderNumber" style="margin-top: 5px;">Booking Date:</label>
    <div class="col-lg-4">
        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                     name="orderBean.orderNumber" disabled="true"/>
    </div>

</div>

<div class="form-group">

    <label class="col-lg-2 control-label" for="orderBean.modeOfService" style="margin-top: 5px;">Service Mode:</label>
    <div class="col-lg-4" >
        <s:select id="mode" cssClass="form-control" style="margin-bottom: 15px !important;"
                  onchange="typeValidate()"
                  name="orderBean.modeOfService" list="modeOfServiceList" listKey="key"
                  listValue="value" value="orderBean.modeOfService" emptyOption="true"/>
    </div>

    <label class="col-lg-2 control-label" for="orderBean.serviceRequirement" style="margin-top: 5px;">Service Requirement:</label>
    <div class="col-lg-4" >
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  name="orderBean.serviceRequirement" list="serviceRequirementList" id="serviceReq"
                  onchange="serviceValidate()"
                  listKey="key"
                  listValue="value" emptyOption="true"/>
    </div>

</div>

<div class="form-group">

    <label class="col-lg-2 control-label" for="orderBean.freightType" style="margin-top: 5px;">Freight Type:</label>
    <div class="col-lg-4" >
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  name="orderBean.freightType" list="freightTypeList" listKey="key"
                  listValue="value" emptyOption="true"/>
    </div>

    <label class="col-lg-2 control-label" for="orderBean.modeOfPayment" style="margin-top: 5px;">Payment Mode:</label>
    <div class="col-lg-4" >
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  name="orderBean.modeOfPayment" list="modeOfPaymentList" listKey="key"
                  listValue="value" emptyOption="true"/>
    </div>

</div>

<div class="form-group">

    <label class="col-lg-2 control-label"
           for="orderBean.orderNumber" style="margin-top: 5px;">Status:</label>
    <div class="col-lg-4">
        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                     name="orderBean.orderNumber" disabled="true"/>
    </div>

    <label class="col-lg-2 control-label"
           for="orderBean.orderNumber" style="margin-top: 5px;">Processed By:</label>
    <div class="col-lg-4">
        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                     name="orderBean.orderNumber" disabled="true"/>
    </div>

</div>

<ul class="nav nav-tabs" role="tablist">
    <li class="active"><a href="#details" role="tab" data-toggle="tab" onclick="hideForm()">Details</a></li>
    <li><a href="#shipper" role="tab" data-toggle="tab" onclick="hideForm()">Shipper</a></li>
    <li><a href="#consignee" role="tab" data-toggle="tab" onclick="hideForm()">Consignee</a></li>
    <li><a href="#item" role="tab" data-toggle="tab" id="item-menu" onclick="lcl()">Items</a></li>
    <li><a href="#cargo" role="tab" data-toggle="tab" id="cargo-menu" onclick="fcl()">Cargo</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade in active" id="details">

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.origin" style="margin-top: 5px;">Port of Origin:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.origin"/>
        </div>

        <label class="col-lg-2 control-label"
               for="orderBean.destination" style="margin-top: 5px;">Port of Destination:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.destination"/>
        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label"
               for="orderBean.pickupDate" style="margin-top: 5px;">Pickup Date:</label>
        <div class="col-lg-4" >
            <input type="text" class="from_date form-control" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;">

        </div>

        <label class="col-lg-2 control-label"
               for="orderBean.deliveryDate" style="margin-top: 5px;">Delivery Date:</label>
        <div class="col-lg-4" >
            <input type="text" class="to_date form-control" placeholder="Select end date" contenteditable="false" style="margin-bottom: 15px !important;">
        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label"
               for="orderBean.rates" style="margin-top: 5px;">Notification Type:</label>
        <div class="col-lg-4" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.notifyBy" list="notifyByList" listKey="key"
                      listValue="value"
                      value="orderBean.notifyBy" emptyOption="true"/>
        </div>

        <label class="col-lg-2 control-label"
               for="orderBean.comments" style="margin-top: 5px;">Comments :</label>
        <div class="col-lg-4" >
            <s:textarea cssClass="form-control"
                         name="orderBean.comments" style="resize:none;"></s:textarea>
        </div>

    </div>

</div>

<div class="tab-pane fade" id="shipper">

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.companyName" style="margin-top: 5px;">Company Name:</label>
        <div class="col-lg-10" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.companyName" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.contactPerson" style="margin-top: 5px;">Contact Person:</label>
        <div class="col-lg-4" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.contactPerson" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.pickupAddress" style="margin-top: 5px;">Pickup Address:</label>
        <div class="col-lg-4" >
            <s:select id="pickupaddress" cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.pickupAddress" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

    </div>

</div>

<div class="tab-pane fade" id="consignee">

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.consigneeName" style="margin-top: 5px;">Consignee Name:</label>
        <div class="col-lg-10">
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.consigneeName" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.consigneeContactPerson" style="margin-top: 5px;">Contact Person:</label>
        <div class="col-lg-4" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.consigneeContactPerson" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.deliveryAddress" style="margin-top: 5px;">Delivery Address:</label>
        <div class="col-lg-4" >
            <s:select id="deliveryaddress" cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.deliveryAddress" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

    </div>

</div>


<!-- Item -->

<div class="tab-pane fade" id="item">

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.quantity" style="margin-top: 5px;"> Item Quantity:</label>
        <div class="col-lg-4" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.quantity" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.size" style="margin-top: 5px;">Item Volume:</label>
        <div class="col-lg-4" >
           <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.size" />

        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.estimatedWeight" style="margin-top: 5px;">Estimated Weight:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.estimatedWeight"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.declaredValue" style="margin-top: 5px;">Declared Value:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.declaredValue"/>
        </div>

    </div>

    <div class="form-group">

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.classification" style="margin-top: 5px;">Classification:</label>
        <div class="col-lg-4" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.classification" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.rate" style="margin-top: 5px;">Rate:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.rate"/>
        </div>

    </div>

    <div class="form-group">
        <label class="col-lg-2 control-label" for="orderBean.deliveryAddress" style="margin-top: 5px;">Commodity Description:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.orderNumber"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-lg-2 control-label" for="orderBean.deliveryAddress" style="margin-top: 5px;">Remarks:</label>
        <div class="col-lg-4" >
            <s:textarea cssClass="form-control" style="margin-bottom: 15px !important; resize:none;"
                         name="orderBean.orderNumber"> </s:textarea>
        </div>
    </div>

    <div class="col-lg-2 col-lg-offset-10" style="margin-bottom:20px;">
        <s:submit cssClass="btn btn-info pull-right" name="submit" value="Add"/>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Item List</h3>
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
                                <th class="tb-font-black" style="text-align: center;">Volume <i class="fa fa-sort"></i>
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

                                    <a href="#"><i class="fa fa-times-circle"></i></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel-footer">
                    <span class="col-lg-offset-9">
                    <b>Total Rate :</b>
                    </span>
                </div>

            </div>
        </div>
    </div>
</div>


<!-- Cargo -->

<div class="tab-pane fade" id="cargo">

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.quantity" style="margin-top: 5px;">Container Quantity:</label>
        <div class="col-lg-4" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.quantity" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.size" style="margin-top: 5px;">Container Size:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.size"/>
        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.estimatedWeight" style="margin-top: 5px;">Estimated Weight:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.estimatedWeight"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.declaredValue" style="margin-top: 5px;">Declared Value:</label>
        <div class="col-lg-4">
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.declaredValue"/>
        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.classification" style="margin-top: 5px;">Classification:</label>
        <div class="col-lg-4" >
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                      name="orderBean.classification" list="customerList" listKey="customerId"
                      listValue="customerName" emptyOption="true"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.rate" style="margin-top: 5px;">Rate:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.rate"/>
        </div>

    </div>

    <div class="form-group">

        <label class="col-lg-2 control-label" for="orderBean.deliveryAddress" style="margin-top: 5px;">Commodity Description:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.orderNumber"/>
        </div>

        <label class="col-lg-2 control-label" for="orderBean.deliveryAddress" style="margin-top: 5px;">Remarks:</label>
        <div class="col-lg-4" >
            <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                         name="orderBean.orderNumber"/>
        </div>

    </div>

    <div class="col-lg-2 col-lg-offset-10" style="margin-bottom:20px;">
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
                                    <a href="#"><i class="fa fa-times-circle"></i></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="panel-footer">
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


<script type="text/javascript">

    var startDate = new Date('01/01/2012');
    var FromStartDate = new Date();
    var FromEndDate = new Date();
    var ToEndDate = new Date();

    ToEndDate.setDate(ToEndDate.getDate()+365);

    $('.from_date').datepicker({

        weekStart: 1,
        /*startDate: '01/01/2012',*/
        startDate: FromStartDate,
        /*endDate: FromEndDate,*/
        endDate: ToEndDate,
        autoclose: true
    })
            .on('changeDate', function(selected){
                startDate = new Date(selected.date.valueOf());
                startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
                $('.to_date').datepicker('setStartDate', startDate);
            });

    $('.to_date')
            .datepicker({

                weekStart: 1,
                startDate: startDate,
                endDate: ToEndDate,
                autoclose: true
            })

            .on('changeDate', function(selected){
                FromEndDate = new Date(selected.date.valueOf());
                FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
                $('.from_date').datepicker('setEndDate', FromEndDate);
            });

</script>

