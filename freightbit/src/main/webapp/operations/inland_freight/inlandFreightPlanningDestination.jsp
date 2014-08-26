<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 8/26/14
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header"><i class="fa fa-truck"></i> Inland Freight Planning: Destination</h1>

    <div class="main-box">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <img src="images/add-user.png" class="box-icon">
                    <span class="panel-title">Inland Operation</span>
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
                        <div class="form-group">

                            <label for="booknum" class="col-sm-2 control-label">Booking Number:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" value="%{orderItem.orderId}" name="order.orderId" disabled="true"></s:textfield>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vendorList" class="col-sm-2 control-label">Vendor:</label>

                            <div class="col-sm-10">
                                <div style="width:90%;float:left;padding-right:10px;">
                                    <s:select list="vendorTruckingList" name="operationsBean.vendorListDestination"
                                              id="vendorListDestination"
                                              listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
                                </div>
                                <div style="width:5%;float:left;">
                                    <a href="#.html" class="icon-action-link">
                                        <img src="images/add-sched.png" class="icon-action circ-icon">
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="driver" class="col-sm-2 control-label">Driver:</label>

                            <div class="col-sm-10">
                                <s:select list="listDrivers" name="operationsBean.driverList"
                                          id="driverList"
                                          listKey="driverId" listValue="firstName + lastName" cssClass="form-control"
                                          emptyOption="true"
                                        ></s:select>
                                <div style="width:5%;float:left;">
                                    <a href="#.html" class="icon-action-link">
                                        <img src="images/add-sched.png" class="icon-action circ-icon">
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="truck" class="col-sm-2 control-label">Truck:</label>

                            <div class="col-sm-10">
                                <div style="width:90%;float:left;padding-right:10px;">
                                    <s:select list="listDrivers" name="operationsBean.trucksList"
                                              id="trucksList"
                                              listKey="truckId" listValue="truckCode" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
                                </div>
                                <div style="width:5%;float:left;">
                                    <a href="#.html" class="icon-action-link">
                                        <img src="images/add-sched.png" class="icon-action circ-icon">
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="dropoff" class="col-sm-2 control-label">Drop off Date:</label>

                            <div class="col-sm-10">
                                <input type="text" class="from_date form-control step2" id="dropoff" name="operationsBean.deliveryDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;">
                            </div>

                        </div>

                    <div style="float: right;">
                        <button class="btn btn-default" onclick="location.href='inland-operation.html'">Save</button>
                        <button class="btn btn-default" onclick="location.href='inland-operation.html'">Cancel</button>
                    </div>

                    </s:form>

                </div>

            </div>

        </div>


    </div>

    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="images/chat.png" class="box-icon">
                <span class="panel-title">Booking Information</span>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center">
                        <tbody>
                        <tr>
                            <td class="tb-font-black">Shipper</td>
                            <td class="tb-font-black">Solutions Resource</td>
                        </tr>
                        <tr>
                            <td class="tb-font-black">Consignee</td>
                            <td class="tb-font-black">Solutions Resource</td>
                        </tr>
                        <tr>
                            <td class="tb-font-black">Pick up Address</td>
                            <td class="tb-font-black">Luzon</td>
                        </tr>
                        <tr>
                            <td class="tb-font-black">Delivery Address</td>
                            <td class="tb-font-black">Davao</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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
