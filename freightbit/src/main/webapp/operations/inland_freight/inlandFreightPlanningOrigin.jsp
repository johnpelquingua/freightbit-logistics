<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-truck"></i> Inland Freight Planning : Origin</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewInlandFreightList' />"> Inland Freight Planning : Orders  </a></li>
            <li class="active">
                <%--<a href="<s:url action='viewSeaFreightList' />"> Sea Freight Planning : Containers / Items </a>--%>
                <s:url var="viewSeaFreightItemListUrl" action="viewInlandFreightItemList">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="#attr.order.orderNo"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                     title="Update Status">

                    <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                        Inland Freight Planning : Containers
                    </s:if>
                    <s:else>
                        Inland Freight Planning : Items
                    </s:else>
                </s:a>
            </li>
            <li class="active"> Inland Freight Planning : Origin</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-md-12">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-book"></i>
            <span class="panel-title">Booking Information</span>
        </div>
        <div class="panel-body form-horizontal">
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label">Booking Number</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label">Service Mode</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label">Service Type</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label">Customer Name</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label">Consignee Name</label>
                <div class="col-lg-10">
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
        <div class="panel-body form-horizontal">
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{orderItem.vendorSea}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>

            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Voyage Number </label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{orderItem.vesselScheduleId}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
        </div>

    </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-truck"></i>
                <span class="panel-title">Inland Operation : Origin</span>
            </div>
            <div class="panel-body">

                <s:form cssClass="form-horizontal" theme="bootstrap" action="editOrderItemsOrigin">
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
                    <%--<s:hidden name="operationsBean.pickupDate" value="%{orderItem.finalPickupDate}" />--%>
                    <s:hidden name="operationsBean.vendorOrigin" value="%{orderItem.vendorOrigin}" />
                    <s:hidden name="operationsBean.vendorSea" value="%{orderItem.vendorSea}" />
                    <s:hidden name="operationsBean.vesselScheduleId" value="%{orderItem.vesselScheduleId}" />
                    <s:hidden name="order.orderId" value="%{orderItem.orderId}" />

                    <div class="form-group">

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

                        <div class="col-lg-8">
                            <div>
                                <s:select list="vendorTruckingList" name="operationsBean.vendorListOrigin"
                                          id="vendorListOrigin"
                                          listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                          emptyOption="true" value="%{orderItem.vendorDestination}"
                                        ></s:select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div>
                                <a href="#.html" class="btn btn-info">
                                    <%--<i class="fa fa-plus"></i>--%>
                                    Add Vendor
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>

                        <div class="col-lg-8">
                            <div>
                                <s:select list="listDrivers" name="operationsBean.driverOrigin"
                                          id="driverList"
                                          listKey="driverId" listValue="firstName + lastName" cssClass="form-control"
                                          emptyOption="true" value="%{orderItem.driverDestination}"
                                        ></s:select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div>
                                <a href="#.html" class="btn btn-info" style="width:100px !important;">
                                    <%--<i class="fa fa-plus"></i>--%>
                                    Add Driver
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>

                        <div class="col-lg-8">
                            <div>
                                <s:select list="listDrivers" name="operationsBean.truckOrigin"
                                          id="trucksList"
                                          listKey="truckId" listValue="truckCode" cssClass="form-control"
                                          emptyOption="true" value="%{orderItem.truckDestination}"
                                        ></s:select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div>
                                <a href="#.html" class="btn btn-info" style="width:100px !important;">
                                    <%--<i class="fa fa-plus"></i>--%>
                                    Add Truck
                                </a>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="from_date form-control step2" value="%{orderItem.finalPickupdate}" id="pickup" name="operationsBean.pickupDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;" />
                        </div>

                    </div>

                    <div style="float: right;">
                        <button class="btn btn-primary" >Save</button>
                    </div>

                </s:form>

            </div>

        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-truck"></i>
                <span class="panel-title">Inland Operation : Destination</span>
            </div>
            <div class="panel-body form-horizontal">

                    <div class="form-group">

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.vendorDestination}" disabled="true" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.driverDestination}" disabled="true" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.truckDestination}" disabled="true" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="pickup" class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.finalDeliveryDate}" disabled="true" />
                        </div>

                    </div>
            </div>

            <div class="panel-footer">

                <div class="pull-right">

                    <s:url var="viewSeaFreightItemListUrl" action="viewInlandFreightItemList">
                        <s:param name="orderIdParam"
                                 value="#attr.order.orderId"></s:param>
                        <s:param name="orderNoParam"
                                 value="#attr.order.orderNo"></s:param>
                    </s:url>
                    <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                         title="Update Status">

                        <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                            <button type="button" class="btn">
                                Inland Freight Planning : Containers
                            </button>
                        </s:if>
                        <s:else>
                            <button type="button" class="btn">
                                Inland Freight Planning : Items
                            </button>
                        </s:else>
                    </s:a>

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
        dropoff.datetimepicker({

            // on 6:00pm
            timeFormat: 'h:mm TT',
            minDate: 0,
            onClose: function(dateText, inst) {

                if (pickup.val() != '') {
                    var testStartDate = pickup.datetimepicker('getDate');
                    var testEndDate = dropoff.datetimepicker('getDate');

                    if (testStartDate > testEndDate)
                        pickup.datetimepicker('setDate', testEndDate);

                }

                else {
                    pickup.val(dateText);
                }
            },

            onSelect: function (selectedDateTime){
                pickup.datetimepicker('option', 'maxDate', dropoff.datetimepicker('getDate') );
            }

        });

        $(document).ready(function() {
            $('#vendorListOrigin').change(function(event) {
                var vendorId = $("#vendorListOrigin").val();

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