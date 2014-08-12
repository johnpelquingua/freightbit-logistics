<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

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
                        <s:form action="addOrder" theme="bootstrap">
                        <div class="form-group" style="margin-top: 15px;">
                            <label class="col-lg-2 control-label">Service Requirement</label>

                            <div class="col-lg-10">

                                <s:select cssClass="form-control step1"
                                          style="margin-bottom: 15px !important;"
                                          name="order.serviceRequirement"
                                          list="serviceRequirementList"
                                          id="order.serviceRequirement"
                                          onchange="serviceValidate()"
                                          listKey="key"
                                          listValue="value"
                                />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Service Mode</label>

                            <div class="col-lg-10">

                                <s:select id="order.modeOfService"
                                          cssClass="form-control step1"
                                          style="margin-bottom: 15px !important;"
                                          onchange="typeValidate()"
                                          name="order.modeOfService"
                                          list="modeOfServiceList"
                                          listKey="key"
                                          listValue="value"
                                          value="orderBean.modeOfService"
                                />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Freight Type</label>

                            <div class="col-lg-10">

                                <s:select id="order.freightType"
                                          cssClass="form-control step1"
                                          style="margin-bottom: 15px !important;"
                                          name="order.freightType"
                                          list="freightTypeList"
                                          listKey="key"
                                          listValue="value"
                                />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Payment Mode</label>

                            <div class="col-lg-10">

                                <s:select id="order.modeOfPayment"
                                          cssClass="form-control step1"
                                          style="margin-bottom: 15px !important;"
                                          name="order.modeOfPayment"
                                          list="modeOfPaymentList"
                                          listKey="key"
                                          listValue="value"
                                />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Customer Name</label>

                            <div class="col-lg-10">

                                <s:select id="customerName"
                                          cssClass="form-control step1"
                                          style="margin-bottom: 15px !important;"
                                          name="order.customerId"
                                          list="customerList"
                                          listKey="customerId"
                                          listValue="customerName"
                                          emptyOption="true"
                                          required="true"
                                />
                                <%--onchange="contactSearch()"--%>

                            </div>
                            <div id="ajaxResponse"></div>
                        </div>

                    </fieldset>
                </div>

                <legend style="text-align: left;">
                            <span >
                                Booking Information
                            </span>
                </legend>

                <div class="form-group">

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Date and Time</label>
                    <div class="col-lg-3" >
                        <input type="text" class="from_date form-control step2" id="datepicker1" name="order.pickupDate" required="true" placeholder="Select Pick-up date" contenteditable="false" style="margin-bottom: 15px !important;">

                    </div>

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Date and Time</label>
                    <div class="col-lg-3" >
                        <input type="text" class="to_date form-control step2" id="datepicker2" name="order.deliveryDate" required="true" placeholder="Select Deliver date" contenteditable="false" style="margin-bottom: 15px !important;">
                    </div>

                </div>

                <div class="form-group">

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Origin Port</label>
                    <div class="col-lg-3" >

                        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                                  id="select1" name="order.originationPort" list="portsList" listKey="key"
                                  listValue="value" required="true"/>

                    </div>

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Destination Port</label>
                    <div class="col-lg-3" >

                        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                                  id="select2" name="order.destinationPort" list="portsList" listKey="key"
                                  listValue="value" required="true"/>

                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Notification Type</label>

                        <div class="col-lg-9">
                            <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                                      name="order.notifyBy" list="notifyByList" listKey="key" listValue="value" />
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Comments </label>

                        <div class="col-lg-9">
                            <s:textarea  name="order.comments" cssClass="form-control" cssStyle="resize: none; margin-bottom: 15px !important;" required="true"/>
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
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person</label>

                        <div class="col-lg-6">
                            <%--<s:select cssClass="form-control step2" style="margin-bottom: 15px !important;" id="shipperContact"
                                      list="contactsList" listKey="contactId" listValue="firstName +' '+ middleName +' '+ lastName"/>--%>
                                <s:select cssClass="form-control step2" style="margin-bottom: 15px !important; width: 555px;" id="shipperContact" name="order.shipperContactId"
                                          list="contactsList" listKey="contactId" listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
                        </div>

                        <div class="col-lg-3 ">

                            <button type="button" class="btn btn-info pull-right"
                                    onclick="location.href='loadAddOrderPage'">
                                Add Contact Person
                            </button>

                        </div>

                    </div>

                    <div class="form-group" style="clear: both;">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Address</label>

                        <div class="col-lg-6">
                            <s:select cssClass="form-control step2" style="margin-bottom: 15px !important; width: 555px;" id="shipperAddress" name="order.shipperAddressId"
                                      list="addressList" listKey="addressId" listValue="addressLine1 + ' ' + addressLine2" required="true"/>
                        </div>

                        <div class="col-lg-3 ">

                            <button type="button" class="btn btn-info pull-right"
                                    onclick="location.href='loadAddOrderPage'" style="width: 153px;">
                                Add Address
                            </button>

                        </div>

                    </div>

                    <legend style="text-align: left;">
                            <span >
                                Consignee Information

                                <%--<button type="button" class="btn btn-info pull-right"
                                        onclick="location.href='loadAddOrderPage'">
                                     Add Consignee
                                </button>--%>

                            </span>
                    </legend>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Consignee Name</label>

                        <div class="col-lg-6">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important; width: 555px;" id="shipperConsignee" name="order.consigneeContactId"
                                      list="consigneeList" listKey="contactId"
                                      listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
                        </div>

                        <div class="col-lg-3 ">
                            <button type="button" class="btn btn-info pull-right"
                                    onclick="location.href='loadAddOrderPage'" style="width: 153px;">
                                Add Consignee
                            </button>
                        </div>

                    </div>

                    <div class="form-group" style="clear:both;">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Address</label>

                        <div class="col-lg-6">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important; width: 728px;" id="consigneeAddress" name="order.consigneeAddressId"
                                      list="consigneeAddressList" listKey="addressId"
                                      listValue="addressLine1 + ' ' + addressLine2" required="true"/>
                        </div>


                    </div>

                <div style="clear: both;">

                    <button type="button" id="Cancel" class="btn btn-lg">
                        Cancel
                    </button>

                    <s:submit name="submit" cssClass="btn btn-primary btn-lg" value="Next" />

                </div>
                </s:form>
                </div>
                <%--Cargo / Item Box--%>
                <%--<div id="2ndPart" style="clear:both;" class="well">

                    <fieldset class="inputs">

                        <legend style="text-align: left;">
                            <span>
                                Cargo Information
                            </span>
                        </legend>

                        &lt;%&ndash;<s:form cssClass="form-horizontal" theme="bootstrap" action="addItemsInTable" >&ndash;%&gt;

                        <div class="form-group">

                            <label class="col-lg-3 control-label">
                                Container Quantity
                            </label>

                            <div class="col-lg-3" >
                                    <s:select cssClass="form-control"
                                              id="orderItem_quantity"
                                              name="orderItem.quantity"
                                              list="containerQuantity"
                                              cssStyle="margin-bottom: 15px !important;"
                                    />
                            </div>

                            <label class="col-lg-3 control-label">
                                Container Size
                            </label>

                            <div class="col-lg-3" >
                                    <s:select cssClass="form-control"
                                              id="orderItem_nameSize"
                                              name="orderItem.nameSize"
                                              list="containerList"
                                              listKey="key"
                                              listValue="value"
                                              cssStyle="margin-bottom: 15px !important;"
                                    />
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label" for="orderItem.weight">
                                Weight (kg)
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control step3"
                                             name="orderItem.weight"
                                             id="orderItem_weight"
                                             cssStyle="margin-bottom: 15px !important;"
                                />
                            </div>

                            <label class="col-lg-3 control-label">
                                Volume (cm³)
                            </label>
                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control step3"
                                             name="orderItem.volume"
                                             id="orderItem_volume"
                                             cssStyle="margin-bottom: 15px !important;"
                                />
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label">
                                Classification
                            </label>

                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control step3"
                                             name="orderItem.classification"
                                             id="orderItem_classification"
                                             cssStyle="margin-bottom: 15px !important;"
                                 />
                            </div>

                            <label class="col-lg-3 control-label">
                                Commodity
                            </label>

                            <div class="col-lg-3" >

                                <s:textfield cssClass="form-control step3"
                                             name="orderItem.description"
                                             id="orderItem_description"
                                             cssStyle="margin-bottom: 15px !important;"
                                 />

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label">
                                Rate (Php)
                            </label>
                            <div class="col-lg-3" >
                                <s:textfield cssClass="form-control step3"
                                             id="orderItem_rate"
                                             name="orderItem.rate"
                                             cssStyle="margin-bottom: 15px !important;"
                                 />
                            </div>

                            <label class="col-lg-3 control-label">
                                Declared Value (Php)
                            </label>
                            <div class="col-lg-3">

                                <s:textfield cssClass="form-control step3"
                                             name="orderItem.declaredValue"
                                             id="orderItem_declaredValue"
                                             cssStyle="margin-bottom: 15px !important;"
                                />

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-3 control-label">
                                Comments
                            </label>
                            <div class="col-lg-3" >
                                <s:textarea cssClass="form-control step3"
                                            name="orderItem.remarks"
                                            id="orderItem_remarks"
                                            cssStyle="margin-bottom: 15px !important; resize: none;"

                                />
                            </div>

                        </div>

                        <legend />

                        <button type="button" id="addItem" class="btn btn-info pull-right" style="margin-top: 15px;">
                            <i class="fa fa-plus"></i> Add Container
                        </button>

                        &lt;%&ndash;<s:submit name="submit"  cssClass="btn btn-info pull-right" cssStyle="margin-top: 15px;" value="Add Container" />&ndash;%&gt;

                        &lt;%&ndash;</s:form>&ndash;%&gt;

                    </fieldset>

                    <div>


                    </div>

                </div>--%> <%-- End Cargo / Item Box--%>

                <%--<div id="3rdPart" >

                    <fieldset>

                        <legend style="text-align: left;">
                            <span>
                                Cargo Listing
                            </span>
                        </legend>

                        <div class="panel-body">
                            <div class="table-responsive list-table">
                                <table class="table table-striped table-hover table-bordered text-center tablesorter" id="customer-list">
                                    <thead>
                                    <tr class="header_center" style="background-color: #fff;">
                                        <th class="tb-font-black">Quantity</th>
                                        <th class="tb-font-black">Size</th>
                                        <th class="tb-font-black">Weight</th>
                                        <th class="tb-font-black">Class</th>
                                        <th class="tb-font-black">Commodity</th>
                                        <th class="tb-font-black">Value</th>
                                        <th class="tb-font-black">Rate</th>
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
                                            <td class="tb-font-black"><s:property value="classification"/></td>
                                            <td class="tb-font-black"><s:property value="description"/></td>
                                            <td class="tb-font-black"><s:property value="declaredValue"/></td>
                                            <td class="tb-font-black"><s:property value="rate"/></td>
                                            <td class="tb-font-black"><s:property value="remarks"/></td>

                                            <td class="tb-font-black">

                                                &lt;%&ndash;<s:url var="deleteItemUrl" action="deleteItem">
                                                    <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                                     title="Delete this Item?"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                    <img src="includes/images/remove-user.png" class="icon-action circ-icon">
                                                </s:a>&ndash;%&gt;

                                            </td>
                                        </tr>
                                    </s:iterator>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </fieldset>

                </div>--%>

                <%--<button type="button" class="btn btn-primary pull-right"
                        style="margin-top: 15px;"
                        onclick="location.href='loadAddOrderPage'">
                    <i class="fa fa-plus"></i> Create Booking
                </button>--%>

            </div>

        </div>
    </div>

</div>

</div>
</div>
</div>
</div>

<script type="text/javascript">

// Date and Timepicker options

$(document).ready(function() {

    // Customer Dropdown
    $('#customerName').change(function(event) {
        var custId = $("#customerName").val();
        alert(custId);

        $.getJSON('customerAction', {
            customerID : custId
        },
            function(jsonResponse) {
                alert(jsonResponse.dummyMsg);

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

                $('<option>').val(key).text(value).appendTo(select2);

            });
            // populate customer consignee list
            $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                //alert($("#shipperConsignee").val());

                if($("#shipperConsignee").val() != ''){
                    $('<option>').val(null).text("").appendTo(select3);
                    $('<option>').val(key).text(value).appendTo(select3);
                }else{
                    $('<option>').val(key).text(value).appendTo(select3);
                }
            });

            // populate customer address list
            $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                //alert($("#consigneeAddress").val());

                if($("#consigneeAddress").val() != ''){
                    $('<option>').val(null).text("").appendTo(select4);
                    $('<option>').val(key).text(value).appendTo(select4);
                }else{
                    $('<option>').val(key).text(value).appendTo(select4);
                }

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
            alert(consignee_Id);
        var select4 = $('#consigneeAddress');

        select4.find('option').remove();

        // populate consignee address
        $.each(jsonResponse.consigneeAddressMap, function(key, value) {

            if($("#shipperConsignee").val() != ''){
                $('<option>').val(key).text(value).appendTo(select4);
            }else{
                if($("#consigneeAddress").val() != ''){
                    $('<option>').val(null).text("").appendTo(select4);
                }
                $('<option>').val(key).text(value).appendTo(select4);
            }

        });

        });

    });

    //Consignee Address on Select
    $('#consigneeAddress').change(function(event) {
        var custId = $("#customerName").val();
        var address_Id = $("#consigneeAddress").val();
        alert(address_Id);
        $.getJSON('addressAction', {
            customerID : custId,
            addressId: address_Id
        },
            function (jsonResponse) {
                alert(address_Id);
                var select3 = $('#shipperConsignee');

                select3.find('option').remove();

                // populate consignee field
                $.each(jsonResponse.customerConsigneeMap, function (key, value) {

                    if($("#consigneeAddress").val() != ''){
                        $('<option>').val(key).text(value).appendTo(select3);
                    }else{
                        if($("#shipperConsignee").val() != ''){
                            $('<option>').val(null).text("").appendTo(select3);
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

    // Save Items in Table

    $('#addItem').click(function(){

        var orderItemQuantity = $("#orderItem_quantity").val();
        var orderItemNameSize = $("#orderItem_nameSize").val();
        var orderItemWeight = $("#orderItem_weight").val();
        var orderItemVolume = $("#orderItem_volume").val();
        var orderItemClassification = $("#orderItem_classification").val();
        var orderItemDescription = $("#orderItem_description").val();
        var orderItemRate = $("#orderItem_rate").val();
        var orderItemDeclaredValue = $("#orderItem_declaredValue").val();
        var orderItemRemarks = $("#orderItem_remarks").val();

        $.ajax({
            url: 'addItemsInTable',
            type: 'POST',
            data: {

                orderItemQuantityParam: orderItemQuantity,
                orderItemNameSizeParam: orderItemNameSize,
                orderItemWeightParam:orderItemWeight,
                orderItemVolumeParam:orderItemVolume,
                orderItemClassificationParam:orderItemClassification,
                orderItemDescriptionParam:orderItemDescription,
                orderItemRateParam:orderItemRate,
                orderItemDeclaredValueParam:orderItemDeclaredValue,
                orderItemRemarksParam:orderItemRemarks

            },
            dataType: 'html',
            success: function (html) {
                alert(html);
                ('#3rdPart').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    });

});

    // For Service Mode Dropdown selection

    function dynamicDropdown(select, index) {

    var opt = select.options,
            lent = opt.length;

    while ( lent-- ){
        opt[ lent ].disabled = false;
    }

    alert(select.options[ index ].value);


    // If Service Requirement is Rolling Cargo
    if (select.options[ index ].value === 'ROLLING CARGO LOAD') {
        sMode.options[0].disabled = true;
        sMode.options[1].disabled = true;
        sMode.options[2].disabled = true;
        sMode.options[3].disabled = false;
        sMode.value = (sMode.options[3].value);
        sType.options[0].disabled = true;
        sType.options[1].disabled = false;
        sType.options[2].disabled = true;
        sType.value = (sType.options[1].value);


    } else {
        sMode.options[0].disabled = false;
        sMode.options[1].disabled = false;
        sMode.options[2].disabled = false;
        sMode.options[3].disabled = false;
        sMode.value = (sMode.options[0].value);
        sType.options[0].disabled = false;
        sType.options[1].disabled = false;
        sType.options[2].disabled = false;
        sType.value = (sType.options[0].value);
    }

    if (select.options[ index ].value === 'DOOR TO DOOR') {

        sType.options[0].disabled = false;
        sType.options[1].disabled = true;
        sType.options[2].disabled = false;
        sType.value = (sType.options[0].value);

    }

    // If Service Mode is Door to Pier or Pier to Door
    if (select.options[ index ].value === 'DOOR TO PIER' || select.options[ index ].value === 'PIER TO DOOR') {

        sType.options[0].disabled = false;
        sType.options[1].disabled = true;
        sType.options[2].disabled = false;
        sType.value = (sType.options[0].value);

        }
    // If Service Mode is Pier to Pier
    if (select.options[ index ].value === 'PIER TO PIER') {

        sType.options[0].disabled = true;
        sType.options[1].disabled = false;
        sType.options[2].disabled = true;
        sType.value = (sType.options[1].value);

        }
    // If Service Type is Shipping
    if (select.options[ index ].value === 'SHIPPING'){

        sMode.options[0].disabled = true;
        sMode.options[1].disabled = true;
        sMode.options[2].disabled = true;
        sMode.options[3].disabled = false;
        sMode.value = (sMode.options[3].value);

        }
    // If Service Type is Trucking or Shipping and Trucking
    if (select.options[ index ].value === 'TRUCKING' || select.options[ index ].value === 'SHIPPING AND TRUCKING') {

        sMode.value = (sMode.options[0].value);
        sMode.options[0].disabled = false;
        sMode.options[1].disabled = false;
        sMode.options[2].disabled = false;
        sMode.options[3].disabled = true;
        }
    }

    var sReq =  select = document.getElementById('order.serviceRequirement');
    var sType = select = document.getElementById('order.freightType');
    var sMode = select = document.getElementById('order.modeOfService');

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

    select2.value = '';

    select1.onchange = function() {
        preventDuplicatePort.call(this, select2, this.selectedIndex);
        };

    select2.onchange = function() {
        preventDuplicatePort.call(this, select1, this.selectedIndex);
        };

</script>

