<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-anchor"></i> Sea Freight Planning </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewSeaFreightList' />"> Sea Freight Planning : Orders </a></li>
            <li class="active">
                <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="#attr.order.orderNo"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                     title="Update Status">
                    <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                        Sea Freight Planning : Containers
                    </s:if>
                    <s:else>
                        Sea Freight Planning : Items
                    </s:else>
                </s:a>
            </li>
            <li class="active"> Sea Freight Planning</li>
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
            <div class="panel-body form-horizontal">
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Booking Number</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Type</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer Name</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee Name</label>
                    <div class="col-lg-10" id="anchorDiv">
                        <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
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
                <s:form cssClass="form-horizontal" theme="bootstrap" action="editBulkItemsInlandOrigin">
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

                    <s:hidden name="operationsBean.vendorOrigin" value="%{orderItem.vendorOrigin}" />
                    <s:hidden name="operationsBean.vendorSea" value="%{orderItem.vendorSea}" />
                    <s:hidden name="operationsBean.vesselScheduleId" value="%{orderItem.vesselScheduleId}" />
                    <s:hidden name="order.orderId" value="%{orderItem.orderId}" />

                    <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                    <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />
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

    </div>
</div>

<%--Start Add Vendor Modal--%>

<div class="modal fade" id="createVendor" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Vendor</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <%--<s:property  value="%{orderItem.orderItemId}"/>--%>
                    <%--<s:textfield id="itemIdHolder"  value="%{orderItem.orderItemId}"/>--%>
                    <s:form action="addVendor" cssClass="form-horizontal" theme="bootstrap">
                    <label>Name<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" id="vendor.vendorName" placeholder="Vendor Name"
                                 name="vendor.vendorName"></s:textfield>

                    <label>Code<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" id="vendor.vendorCode" placeholder="Vendor Code"
                                 name="vendor.vendorCode" maxLength="3" pattern="[A-Z]+" title="Must be letters only and CAPS."></s:textfield>

                    <label>Class Name<span class="asterisk_red"></span></label>

                    <s:select cssClass="form-control" id="vendor.vendorClass" list="vendorClassList" listKey="key"
                              listValue="value"
                              name="vendor.vendorClass"/>

                    <label>Status<span class="asterisk_red"></span></label>

                    <s:select cssClass="form-control" id="vendor.vendorStatus" list="statusList"
                              listKey="key" listValue="value"
                              name="vendor.vendorStatus"/>

                </div>
            </div>
            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

<%--End Add Vendor Modal--%>

<%--Start Add Schedule--%>

<div class="modal fade" id="addSchedule" role="form" aria-labelledby="myModalLabel2">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">Add Schedule</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addVesselScheduleInPlanning">

                    <label>Voyage Number<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" name="vesselSchedule.voyageNumber"/>

                    <s:hidden id="vendorIdHolder" name="vesselSchedule.vendorId" />

                    <label> Departure Date<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" id="departureDate"
                                 name="vesselSchedule.departureDate"/>

                    <label> Departure Time<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" id="departureTime"
                                 name="vesselSchedule.departureTime" readonly="true"/>

                    <label>Arrival Date<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" id="arrivalDate" name="vesselSchedule.arrivalDate" readonly="true"/>

                    <label> Arrival Time<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" id="arrivalTime"
                                 name="vesselSchedule.arrivalTime"/>

                    <label>Origin Pier<span class="asterisk_red"></span></label>

                    <s:select emptyOption="true" id="vesselSchedule_originPort"
                              value="vesselSchedule.originPort"
                              name="vesselSchedule.originPort"
                              list="portsList" listValue="value" listKey="key"
                              cssClass="form-control"/>

                    <label>Destination Pier<span class="asterisk_red"></span></label>

                    <s:select emptyOption="true" id="vesselSchedule_destinationPort"
                              value="vesselSchedule.destinationPort"
                              name="vesselSchedule.destinationPort"
                              list="portsList" listValue="value" listKey="key"
                              cssClass="form-control"/>

                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--End Add Schedule--%>

<script type="text/javascript">

    $("#date").datepicker({dateFormat: 'yy-dd-mm'});

    // Anchor on successDiv on every schedule load
    if ($('#successDiv').length !== 0){
        window.location.href = '#anchorDiv';
    }

    // User must choose a vendor first before adding vessel schedule
    $(document).ready(function(){
        $("#createSchedule").click(function() {
            var vendorId = $("#operationsBean_vendorList").val();

            if (vendorId == "" || null){
                alert("Select a vendor first");
                $("#operationsBean_vendorList").focus();
                return false;
            }

            $("#vendorIdHolder").val(vendorId);
        });
    });

    var departureDate = $('#departureDate');
    var arrivalDate = $('#arrivalDate');
    // departure date
    departureDate.datepicker({

                dateFormat: 'mm-dd-yy',
                minDate: 0,

                onClose: function(dateText, inst) {
                    if (arrivalDate.val() != '') {
                        var testStartDate = departureDate.datepicker('getDate');
                        var testEndDate = departureDate.datepicker('getDate');

                        if (testStartDate > testEndDate)
                            arrivalDate.datepicker('setDate', testStartDate);
                    }
                    else {
                        arrivalDate.val(dateText);
                    }
                },

                onSelect: function (selectedDateTime){
                    arrivalDate.datepicker('option', 'minDate', departureDate.datepicker('getDate') );
                }
            }

    );
    // arrival date
    arrivalDate.datepicker(
            {
                dateFormat: 'mm-dd-yy',
                minDate: 0,

                onClose: function(dateText, inst) {

                    if (departureDate.val() != '') {
                        var testStartDate = departureDate.datepicker('getDate');
                        var testEndDate = arrivalDate.datepicker('getDate');

                        if (testStartDate > testEndDate)
                            departureDate.datepicker('setDate', testEndDate);

                    }

                    else {
                        departureDate.val(dateText);
                    }
                },

                onSelect: function (selectedDateTime){
                    departureDate.datepicker('option', 'maxDate', arrivalDate.datepicker('getDate') );
                }
            });

    $('#arrivalTime').timepicker( {
        timeFormat: 'h:mm TT'

    });

    $('#departureTime').timepicker( {
        timeFormat: 'h:mm TT'

    });

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

    var select1 = select = document.getElementById('vesselSchedule_originPort');
    var select2 = select = document.getElementById('vesselSchedule_destinationPort');

    select2.value = '';

    select1.onchange = function() {
        preventDuplicatePort.call(this, select2, this.selectedIndex);
    };

    select2.onchange = function() {
        preventDuplicatePort.call(this, select1, this.selectedIndex);
    };

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

</script>