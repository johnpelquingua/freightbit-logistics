<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <h1><i class="fa fa-truck"></i> Inland Freight Planning: Destination</h1>

        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Inland Freight Planning: Orders  </li>
            <li class="active"> Inland Freight Planning: Items / Containers</li>
            <li class="active"> Inland Freight Planning: Destination</li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-truck"></i>
            <span class="panel-title">Booking Information</span>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="book-num" class="col-sm-2 control-label">Booking Number:</label>
                <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{order.orderNo}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-sm-2 control-label">Service Mode:</label>
                <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-sm-2 control-label">Service Type:</label>
                <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-sm-2 control-label">Customer Name:</label>
                <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-sm-2 control-label">Consignee Name:</label>
                <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
        </div>

    </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-anchor"></i>
                <span class="panel-title">Sea Operation</span>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="book-num" class="col-sm-2 control-label">Vendor:</label>
                    <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                        <s:textfield cssClass="form-control" value="%{orderItem.vendorSea}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="book-num" class="col-sm-2 control-label">Voyage Number :</label>
                    <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                        <s:textfield cssClass="form-control" value="%{orderItem.vesselScheduleId}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
            </div>

        </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-truck"></i>
            <span class="panel-title">Inland Operation: Origin</span>
        </div>
        <div class="panel-body">
            <div class="form-group">

                <label class="col-sm-2 control-label">Vendor:</label>

                <div class="col-sm-10" style="padding: 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{orderItem.vendorOrigin}" disabled="true" />
                </div>
            </div>

            <div class="form-group">

                <label class="col-sm-2 control-label">Driver:</label>

                <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{orderItem.driverOrigin}" disabled="true" />
                </div>

            </div>

            <div class="form-group">

                <label class="col-sm-2 control-label">Truck:</label>

                <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px; margin-top: -10px;">
                    <s:textfield cssClass="form-control" value="%{orderItem.truckOrigin}" disabled="true" />
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">Pickup Date:</label>
                <div class="col-sm-10" style="padding: 0px; width: 77.5%; position: relative; left: 15px;">
                    <s:textfield cssClass="form-control" value="%{orderItem.finalPickupDate}" disabled="true" />
                </div>
            </div>

        </div>

    </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-truck"></i>
                <span class="panel-title">Inland Operation: Destination</span>
            </div>
            <div class="panel-body">

                <s:form cssClass="form-horizontal" theme="bootstrap" action="editOrderItemsDestination">
                    <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                    <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                    <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                    <s:hidden name="operationsBean.orderId" value="%{orderItem.orderId}" />
                    <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}" />
                    <s:hidden name="operationsBean.classification" value="%{orderItem.classification}" />
                    <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}" />
                    <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}" />
                    <s:hidden name="operationsBean.comments" value="%{orderItem.comments}" />
                    <s:hidden name="operationsBean.rate" value="%{orderItem.rate}" />
                    <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}" />
                    <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}" />
                    <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}" />
                    <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}" />
                    <s:hidden name="operationsBean.status" value="%{orderItem.status}" />
                    <s:hidden name="operationsBean.weight" value="%{orderItem.weight}" />
                    <s:hidden name="operationsBean.pickupDate" value="%{orderItem.finalPickupDate}" />
                    <s:hidden name="operationsBean.vendorOrigin" value="%{orderItem.vendorOrigin}" />
                    <s:hidden name="operationsBean.vendorSea" value="%{orderItem.vendorSea}" />
                    <s:hidden name="order.orderId" value="%{orderItem.orderId}" />

                    <div class="form-group">

                        <label for="operationsBean.vendorListDestination" class="col-sm-2 control-label">Vendor:</label>

                        <div class="col-sm-10">
                            <div style="width:90%;float:left;padding-right:10px;">
                                <s:select list="vendorTruckingList" name="operationsBean.vendorListDestination"
                                          id="vendorListDestination"
                                          listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                          emptyOption="true" value="%{orderItem.vendorDestination}"
                                        ></s:select>
                            </div>
                            <div style="width:5%;float:left;">
                                <a href="#.html" class="btn btn-info">
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="operationsBean.driverDestination" class="col-sm-2 control-label">Driver:</label>

                        <div class="col-sm-10">
                            <div style="width:90%;float:left;padding-right:10px;">
                                <s:select list="listDrivers" name="operationsBean.driverDestination"
                                          id="driverList"
                                          listKey="driverId" listValue="firstName + lastName" cssClass="form-control"
                                          emptyOption="true" value="%{orderItem.driverDestination}"
                                        ></s:select>
                            </div>
                            <div style="width:5%;float:left;">
                                <a href="#.html" class="btn btn-info">
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="operationsBean.truckDestination" class="col-sm-2 control-label">Truck:</label>

                        <div class="col-sm-10">
                            <div style="width:90%;float:left;padding-right:10px;">
                                <s:select list="listDrivers" name="operationsBean.truckDestination"
                                          id="trucksList"
                                          listKey="truckId" listValue="truckCode" cssClass="form-control"
                                          emptyOption="true" value="%{orderItem.truckDestination}"
                                        ></s:select>
                            </div>
                            <div style="width:5%;float:left;">
                                <a href="#.html" class="btn btn-info">
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="form-group" style="margin-bottom: 0px !important;">

                        <label for="dropoff" class="col-sm-2 control-label">Drop off Date:</label>

                        <div class="col-sm-10" style="padding: 0px; width: 75.5% !important; position: relative; left: 15px;">
                            <s:textfield cssClass="from_date form-control step2" value="%{orderItem.finalDeliveryDate}" id="dropoff" name="operationsBean.deliveryDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;" />
                        </div>

                    </div>

                <div style="float: right;">
                    <button class="btn btn-primary" style="position: relative; left: -50px;">Save</button>
                </div>

                </s:form>

            </div>

        </div>

    </div>


</div>

<script type="text/javascript">

    var pickup = $('#pickup');
    var dropoff = $('#dropoff');


    //pick up date validation
    pickup.datepicker({

        // on 5:00pm
//            timeFormat: 'h:mm TT',
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        onClose: function(dateText, inst) {

            if (dropoff.val() != '') {
                var testStartDate = pickup.datepicker('getDate');
                var testEndDate = dropoff.datepicker('getDate');

                if (testStartDate > testEndDate)
                    dropoff.datepicker('setDate', testStartDate);

            }

            else {
                dropoff.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            dropoff.datetimepicker('option', 'minDate', pickup.datetimepicker('getDate') );
        }

    });

    // delivery date validation -jp
    dropoff.datepicker({

        // on 6:00pm
//        timeFormat: 'h:mm TT',
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        onClose: function(dateText, inst) {

            if (pickup.val() != '') {
                var testStartDate = pickup.datepicker('getDate');
                var testEndDate = dropoff.datepicker('getDate');

                if (testStartDate > testEndDate)
                    pickup.datepicker('setDate', testEndDate);

            }

            else {
                pickup.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            pickup.datepicker('option', 'maxDate', dropoff.datepicker('getDate') );
        }

    });

    $(document).ready(function() {
        $('#vendorListDestination').change(function(event) {
            var vendorId = $("#vendorListDestination").val();

            $.getJSON('listVendorDriverAndTrucks', {
                        vendorId : vendorId
                    },

                    function(jsonResponse) {

                        var driver = $('#driverList');

                        driver.find('option').remove();

                        var truck = $('#trucksList');

                        truck.find('option').remove();

                        $.each(jsonResponse.driverMap, function(key, value) {
                            $('<option>').val(key).text(value).appendTo(driver);
                        });

                        $.each(jsonResponse.trucksMap, function(key, value) {
                            $('<option>').val(key).text(value).appendTo(truck);
                        });
                    });
        });
    });

</script>
