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
                <span class="panel-title">Inland Operation: Destination</span>
            </div>
            <div class="panel-body">
                <s:form cssClass="form-horizontal" theme="bootstrap" action="editBulkItemsInlandDestination">
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
                    <s:hidden name="operationsBean.pickupDate" value="2014-10-02" />
                    <s:hidden name="operationsBean.vendorOrigin" value="%{orderItem.vendorOrigin}" />
                    <s:hidden name="operationsBean.vendorSea" value="%{orderItem.vendorSea}" />
                    <s:hidden name="order.orderId" value="%{orderItem.orderId}" />
                    <s:hidden name="operationsBean.vesselScheduleId" value="0" />
                    <s:hidden name="operationsBean.driverOrigin" value="%{orderItem.driverOrigin}" />
                    <s:hidden name="operationsBean.truckOrigin" value="%{orderItem.truckOrigin}" />
                    <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                    <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />
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