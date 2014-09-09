<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> Booking List </a></li>
            <li class="active"> Edit Booking</li>
        </ol>

    </div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="panel panel-primary">
<div class="panel-heading">
    <i class="fa fa-book"></i>
    <span class="panel-title">Booking Information</span>
</div>
<div class="panel-body">

<div class="container">

<div class="row setup-content" id="step-1">
<div class="col-lg-12">

<div class="col-lg-12 text-center">

<div class="well">
    <fieldset class="inputs">
        <legend style="text-align: left;">
                            <span >
                                Basic Information
                            </span>
        </legend>
        <s:form action="editOrder" theme="bootstrap">
        <%--<s:property value="%{order.orderId}"/>--%>
        <s:hidden name="order.orderId" value="%{order.orderId}"/>
        <%--<s:property value="%{order.orderNumber}"/>--%>
        <s:hidden name="order.orderNumber" value="%{order.orderNumber}"/>
        <div class="form-group" style="margin-top: 15px;">
            <label class="col-lg-2 control-label">Service Requirement <span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.serviceRequirement}" />--%>
                <s:select cssClass="form-control"
                          style="margin-bottom: 15px !important;"
                          name="order.serviceRequirement"
                          list="serviceRequirementList"
                          id="order.serviceRequirement"
                          listKey="key"
                          listValue="value"
                        />

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-2 control-label">Service Mode <span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.modeOfService}" />--%>
                <s:select id="order_modeOfService"
                          cssClass="form-control"
                          style="margin-bottom: 15px !important;"
                          name="order.modeOfService"
                          list="modeOfServiceList"
                          listKey="key"
                          listValue="value"
                          value="order.modeOfService"
                        />

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-2 control-label">Freight Type<span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.freightType}" />--%>
                <s:select id="order.freightType"
                          cssClass="form-control"
                          style="margin-bottom: 15px !important;"
                          name="order.freightType"
                          list="freightTypeList"
                          listKey="key"
                          listValue="value"
                          value="order.freightType"
                        />

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-2 control-label">Payment Mode<span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.modeOfPayment}" />--%>
                <s:select id="order.modeOfPayment"
                          cssClass="form-control step1"
                          style="margin-bottom: 15px !important;"
                          name="order.modeOfPayment"
                          list="modeOfPaymentList"
                          listKey="key"
                          listValue="value"
                          value="order.modeOfPayment"
                        />

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-2 control-label">Customer Name<span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.customerId}" />--%>
                <s:select id="customerName"
                          cssClass="form-control step1"
                          style="margin-bottom: 15px !important;"
                          name="order.customerId"
                          list="customerList"
                          listKey="customerId"
                          listValue="customerName"
                          emptyOption="true"
                          required="true"
                          value="order.customerId"
                          disabled="true"
                        />

            </div>
                <%--<div id="ajaxResponse"></div>--%>
        </div>

    </fieldset>
</div>

<legend style="text-align: left;">
    <span >
        Booking Information
    </span>
</legend>

<div class="form-group">

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Date and Time<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.pickupDate}" />--%>
        <s:textfield type="text" class="from_date form-control step2" id="datepicker1" name="order.pickupDate" value="%{order.pickupDate}" required="true" placeholder="Select Pick-up date" contenteditable="false" style="margin-bottom: 15px !important;" />
    </div>

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Date and Time<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.deliveryDate}" />--%>
        <s:textfield type="text" class="to_date form-control step2" id="datepicker2" name="order.deliveryDate" value="%{order.deliveryDate}" required="true" placeholder="Select Deliver date" contenteditable="false" style="margin-bottom: 15px !important;" />
    </div>

</div>

<div class="form-group">

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Origin Port<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.originationPort}" />--%>
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  id="select1" name="order.originationPort" list="portsList" listKey="key"
                  listValue="value" required="true" value="order.originationPort"/>

    </div>

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Destination Port<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.destinationPort}" />--%>
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  id="select2" name="order.destinationPort" list="portsList" listKey="key"
                  listValue="value" required="true" value="order.destinationPort"/>

    </div>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Notification Type<span class="asterisk_red"></span></label>

        <div class="col-lg-9">
            <%--<s:property value="%{order.notifyBy}" />--%>
            <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                      name="order.notifyBy" list="notifyByList" listKey="key" listValue="value" value="order.notifyBy"/>
        </div>

    </div>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Comments </label>
        <%--<s:property value="%{order.comments}" />--%>
        <div class="col-lg-9">
            <s:textarea  name="order.comments" cssClass="form-control" cssStyle="resize: none; margin-bottom: 15px !important;" />
        </div>
    </div>

</div>

    <%--<button id="activate-step-2" class="btn btn-primary pull-right" style="margin-bottom: 15px !important;">Next</button>--%>
    <%--<s:submit name="submit" cssClass="btn btn-primary btn-lg" value="Next" />
    </s:form>--%>

<div id="2ndPartOnLoad" style="clear:both;">

    <legend style="text-align: left;">
        <span >
            Shipper Information
        </span>
    </legend>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person<span class="asterisk_red"></span></label>

        <div class="col-lg-8">
            <%--<s:property value="%{order.shipperContactId}" />--%>
            <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;" id="shipperContact" name="order.shipperContactId" value="order.shipperContactId"
                      list="contactsList" listKey="contactId" listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
        </div>

        <div class="col-lg-1">
                <%--<button type="button" class="btn btn-info pull-right"
                        onclick="location.href='loadAddOrderPage'">
                    Add Contact Person
                </button>--%>
            <div class="pull-right">
                <a href="#" class="btn btn-info"><i class="fa fa-plus"></i></a>
            </div>

        </div>

    </div>

    <div class="form-group" style="clear: both;">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Address<span class="asterisk_red"></span></label>

        <div class="col-lg-8">
            <%--<s:property value="%{order.shipperAddressId}" />--%>
            <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;" id="shipperAddress" name="order.shipperAddressId" value="order.shipperAddressId"
                      list="addressList" listKey="addressId" listValue="addressLine1 + ' ' + addressLine2" required="true"/>
        </div>

        <div class="col-lg-1">

                <%--<button type="button" class="btn btn-info pull-right"
                        onclick="location.href='loadAddOrderPage'" style="width: 153px;">
                    Add Address
                </button>--%>

            <div class="pull-right">
                <a href="#" class="btn btn-info"><i class="fa fa-plus"></i></a>
            </div>

        </div>

    </div>

    <legend style="text-align: left;">
        <span >
            Consignee Information
        </span>
    </legend>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Consignee Name<span class="asterisk_red"></span></label>

        <div class="col-lg-8">
            <%--<s:property value="%{order.consigneeContactId}" />--%>
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="shipperConsignee" name="order.consigneeContactId" value="order.consigneeContactId"
                      list="consigneeList" listKey="contactId"
                      listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
        </div>

        <div class="col-lg-1">
                <%--<button type="button" class="btn btn-info pull-right"
                        onclick="location.href='loadAddOrderPage'" style="width: 153px;">
                    Add Consignee
                </button>--%>
            <div class="pull-right">
                <a href="#" class="btn btn-info"><i class="fa fa-plus"></i></a>
            </div>

        </div>

    </div>

    <div class="form-group" style="clear:both;">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Address<span class="asterisk_red"></span></label>

        <div class="col-lg-8">
            <%--<s:property value="%{order.consigneeAddressId}" />--%>
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="consigneeAddress" name="order.consigneeAddressId" value="order.consigneeAddressId"
                      list="consigneeAddressList" listKey="addressId"
                      listValue="addressLine1 + ' ' + addressLine2" required="true"/>
        </div>

    </div>

    <div style="clear: both;">

    </div>

</div>

</div>

</div>
</div>

</div>

</div>

<div class="panel-footer">

    <div class="pull-right">
        <button type="button" id="Cancel" class="btn" data-toggle="modal" data-target="#cancelBooking">
            Cancel
        </button>

        <s:submit name="submit" cssClass="btn btn-primary" value="Next" />
        </s:form>
    </div>

</div>

</div>
</div>
</div>

<!-- Cancel Booking Modal -->
<div class="modal fade" id="cancelBooking" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

$(document).ready(function() {

    $( window ).load(function() {
        var custId = $("#customerName").val();
        /*alert(custId);*/

        $.getJSON('customerAction', {
                    customerID : custId
                },
                function(jsonResponse) {
                    /*alert(jsonResponse.dummyMsg);*/

                    $('#ajaxResponse').text(jsonResponse.dummyMsg);

                    var select = $('#shipperContact');

                    select.find('option').remove();

                    var select2 = $('#shipperAddress');

                    select2.find('option').remove();

                    var select3 = $('#shipperConsignee');

                    select3.find('option').remove();

                    var select4 = $('#consigneeAddress');

                    select4.find('option').remove();

                    // populate customer consignee list
                    $.each(jsonResponse.customerContactsMap, function(key, value) {

                        $('<option>').val(key).text(value).appendTo(select);

                    });
                    // populate customer address list
                    $.each(jsonResponse.customerAddressMap, function(key, value) {

                        if($("#order_modeOfService").val() == 'DOOR TO PIER') {
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }else if ($("#order_modeOfService").val() == 'PIER TO DOOR') {
                            $("#shipperAddress").prop('disabled', true);
                            $("#consigneeAddress").prop('disabled', false);
                        }else if ($("#order_modeOfService").val() == 'PIER TO PIER'){
                            $("#consigneeAddress").prop('disabled', true);
                            $("#shipperAddress").prop('disabled', true);
                        }else{
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', false);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }

                    });
                    // populate customer consignee list
                    $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                        //alert($("#shipperConsignee").val());

                        if($("#shipperConsignee").val() != ''){
                            //$('<option>').val(null).text("").appendTo(select3);
                            $('<option>').val(key).text(value).appendTo(select3);
                        }else{
                            $('<option>').val(key).text(value).appendTo(select3);
                        }
                    });

                    // populate customer address list
                    $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                        //alert($("#consigneeAddress").val());

                        if($("#consigneeAddress").val() != ''){
                            if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER'){
                                $('<option>').val(null).text("").appendTo(select4);
                            }
                            $('<option>').val(key).text(value).appendTo(select4);
                        }else{
                            $('<option>').val(key).text(value).appendTo(select4);
                        }

                    });

        });
    });

    // Customer Dropdown
    $('#customerName').change(function(event) {
        var custId = $("#customerName").val();
        /*alert(custId);*/

        $.getJSON('customerAction', {
                    customerID : custId
                },
                function(jsonResponse) {
                    /*alert(jsonResponse.dummyMsg);*/

                    $('#ajaxResponse').text(jsonResponse.dummyMsg);

                    var select = $('#shipperContact');

                    select.find('option').remove();

                    var select2 = $('#shipperAddress');

                    select2.find('option').remove();

                    var select3 = $('#shipperConsignee');

                    select3.find('option').remove();

                    var select4 = $('#consigneeAddress');

                    select4.find('option').remove();

                    // populate customer consignee list
                    $.each(jsonResponse.customerContactsMap, function(key, value) {

                        $('<option>').val(key).text(value).appendTo(select);

                    });
                    // populate customer address list
                    $.each(jsonResponse.customerAddressMap, function(key, value) {

                        if($("#order_modeOfService").val() == 'DOOR TO PIER') {
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }else if ($("#order_modeOfService").val() == 'PIER TO DOOR') {
                            $("#shipperAddress").prop('disabled', true);
                            $("#consigneeAddress").prop('disabled', false);
                        }else if ($("#order_modeOfService").val() == 'PIER TO PIER'){
                            $("#consigneeAddress").prop('disabled', true);
                            $("#shipperAddress").prop('disabled', true);
                        }else{
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', false);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }

                    });
                    // populate customer consignee list
                    $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                        //alert($("#shipperConsignee").val());

                        /*if($("#shipperConsignee").val() != ''){
                            if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER' || $("#order_modeOfService").val() == 'PIER TO DOOR'){
                                $('<option>').val(null).text("").appendTo(select3);
                            }
                            $('<option>').val(key).text(value).appendTo(select3);
                        }else{
                            $('<option>').val(key).text(value).appendTo(select3);
                        }*/
                        $('<option>').val(null).text("").appendTo(select3);
                        $('<option>').val(key).text(value).appendTo(select3);
                    });

                    // populate customer address list
                    $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                        //alert($("#consigneeAddress").val());

                        /*if($("#consigneeAddress").val() != ''){
                            if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER' || $("#order_modeOfService").val() == 'PIER TO DOOR'){
                                $('<option>').val(null).text("").appendTo(select4);
                            }
                            $('<option>').val(key).text(value).appendTo(select4);
                        }else{
                            $('<option>').val(key).text(value).appendTo(select4);
                        }*/
                        $('<option>').val(null).text("").appendTo(select4);
                        $('<option>').val(key).text(value).appendTo(select4);
                    });

                });

    });

    //Consignee on Select
    $('#shipperConsignee').change(function(event) {
        var custId = $("#customerName").val();
        var consignee_Id = $("#shipperConsignee").val();

        $.getJSON('consigneeAction', {
                    customerID : custId,
                    consigneeId : consignee_Id
                },
                function(jsonResponse) {
                    /*alert(consignee_Id);*/
                    var select4 = $('#consigneeAddress');

                    select4.find('option').remove();

                    // populate consignee address
                    $.each(jsonResponse.consigneeAddressMap, function(key, value) {

                        if($("#order_modeOfService").val() == 'DOOR TO DOOR' || $("#order_modeOfService").val() == 'PIER TO DOOR') {

                            if ($("#shipperConsignee").val() != '') {
                                $('<option>').val(key).text(value).appendTo(select4);
                            } else {
                                if ($("#consigneeAddress").val() != '') {
                                    $('<option>').val(null).text("").appendTo(select4);
                                }
                                $('<option>').val(key).text(value).appendTo(select4);
                            }

                        }
                    });

                });

    });

    //Consignee Address on Select
    $('#consigneeAddress').change(function(event) {
        var custId = $("#customerName").val();
        var address_Id = $("#consigneeAddress").val();
        /*alert(address_Id);*/
        $.getJSON('addressAction', {
                    customerID : custId,
                    addressId: address_Id
                },
                function (jsonResponse) {
                    /*alert(address_Id);*/
                    var select3 = $('#shipperConsignee');

                    select3.find('option').remove();

                    // populate consignee field
                    $.each(jsonResponse.customerConsigneeMap, function (key, value) {

                        if($("#consigneeAddress").val() != ''){
                            $('<option>').val(key).text(value).appendTo(select3);
                        }else{
                            if($("#shipperConsignee").val() != ''){
                                //$('<option>').val(null).text("").appendTo(select3);
                            }
                            $('<option>').val(key).text(value).appendTo(select3);
                        }

                    });

                });

    });


    // Date Time Picker
    var fromDatePickUp = $('#datepicker1');
    var toDateDelivery = $('#datepicker2');

    //pick up date validation
    fromDatePickUp.datetimepicker({

        // on 5:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {

            if (toDateDelivery.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    toDateDelivery.datetimepicker('setDate', testStartDate);
            }

            else {
                toDateDelivery.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            toDateDelivery.datetimepicker('option', 'minDate', fromDatePickUp.datetimepicker('getDate') );
        }

    });

    // delivery date validation -jp
    toDateDelivery.datetimepicker({

        // on 6:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {

            if (fromDatePickUp.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    fromDatePickUp.datetimepicker('setDate', testEndDate);
            }

            else {
                fromDatePickUp.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            fromDatePickUp.datetimepicker('option', 'maxDate', toDateDelivery.datetimepicker('getDate') );
        }

    });

});

// For Service Mode Dropdown selection

function dynamicDropdown(select, index) {

    var opt = select.options,
            lent = opt.length;

    while ( lent-- ){
        opt[ lent ].disabled = false;
    }

    /*alert(select.options[ index ].value);*/


    // If Service Requirement is Rolling Cargo
    if (select.options[ index ].value === 'ROLLING CARGO LOAD') {

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].disabled = false;
                sMode.options[i].selected = true;
            }else{
                sMode.options[i].disabled = true;
            }
        }

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value != "SHIPPING"){
                sType.options[i].disabled = true;
            }else{
                sType.options[i].disabled = false;
                sType.options[i].selected = true;
            }
        }

    } else {

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "DOOR TO DOOR"){
                sMode.options[i].disabled = false;
                //sMode.options[i].selected = true;
            }else{
                sMode.options[i].disabled = false;

            }
        }

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value == "SHIPPING AND TRUCKING"){
                sType.options[i].disabled = false;
                //sType.options[i].selected = true;
            }else{
                sType.options[i].disabled = false;

            }
        }
    }
    // if service mode is Door to Door, Door to Pier and Pier to Door
    if (select.options[ index ].value === 'DOOR TO DOOR' || select.options[ index ].value === 'DOOR TO PIER' || select.options[ index ].value === 'PIER TO DOOR') {

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value == "SHIPPING" ){
                sType.options[i].disabled = true;

            }else {
                if(sType.options[i].value == "SHIPPING AND TRUCKING"){
                    sType.options[i].disabled = false;
                    /*sType.options[i].selected = true;*/
                }else{
                    sType.options[i].disabled = false;
                    0
                }
            }
        }

        if (select.options[ index ].value === 'DOOR TO PIER'){

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', true);
            $("#consigneeAddress").val('');
        }else if (select.options[ index ].value === 'PIER TO DOOR'){

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', true);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');

        }else {

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');
        }

    }

    // If Service Mode is Pier to Pier
    if (select.options[ index ].value === 'PIER TO PIER') {

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value != "SHIPPING"){
                sType.options[i].disabled = true;
            }else{
                sType.options[i].disabled = false;
                sType.options[i].selected = true;
            }
        }

        $("#customerName").val('');
        $("#shipperContact").val('');
        $("#shipperAddress").prop('disabled', true);
        $("#shipperAddress").val('');
        $("#shipperConsignee").val('');
        $("#consigneeAddress").prop('disabled', true);
        $("#consigneeAddress").val('');

    }
    // If Service Type is Shipping
    if (select.options[ index ].value === 'SHIPPING'){

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].disabled = false;
                sMode.options[i].selected = true;
            }else{
                sMode.options[i].disabled = true;
            }
        }

    }
    // If Service Type is Trucking or Shipping and Trucking
    if (select.options[ index ].value === 'TRUCKING' || select.options[ index ].value === 'SHIPPING AND TRUCKING') {

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].disabled = true;
            }else{
                if(sMode.options[i].value == "DOOR TO DOOR"){
                    sMode.options[i].disabled = false;
                    //sMode.options[i].selected = true;
                }else{
                    sMode.options[i].disabled = false;

                }
            }
        }

    }
}

var sReq = select = document.getElementById('order.serviceRequirement');
var sType = select = document.getElementById('order.freightType');
var sMode = select = document.getElementById('order_modeOfService');

sReq.onchange = function() {
    dynamicDropdown.call(this, sReq ,this.selectedIndex);
};

sType.onchange = function() {
    dynamicDropdown.call(this, sType ,this.selectedIndex);
};

sMode.onchange = function() {
    dynamicDropdown.call(this, sMode, this.selectedIndex);
};

// Avoid selecting duplicate ports

function preventDuplicatePort(select, index) {

    var options = select.options,
            len = options.length;

    while ( len-- ){
        options[ len ].disabled = false;
    }

    select.options[ index ].disabled = true;

    if( index === select.selectedIndex ){
        alert('You already selected the same port "' + select.options[index].text + '". Please choose another' );
        /*this.selectedIndex = 0;*/
        select2.value = '';
    }

}

var select1 = select = document.getElementById('select1');
var select2 = select = document.getElementById('select2');

select1.onchange = function() {
    preventDuplicatePort.call(this, select2, this.selectedIndex);
};

select2.onchange = function() {
    preventDuplicatePort.call(this, select1, this.selectedIndex);
};


</script>
