<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-anchor"></i> Dispatch Plan </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewInlandFreightList' />"> Dispatch Plan : Orders </a></li>
            <li class="active">
                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="#attr.order.orderNo"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                     title="Update Status">
                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                        Dispatch Plan : Containers
                    </s:if>
                    <s:else>
                        Dispatch Plan : Items
                    </s:else>
                </s:a>
            </li>
            <li class="active"> Dispatch Plan </li>
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

                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.orderNumber}"
                                     disabled="true"></s:textfield>
                    </div>
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Freight Type</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.freightType}"
                                     disabled="true"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service
                        Req't</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.serviceRequirement}"
                                     name="book-num"
                                     disabled="true"></s:textfield>
                    </div>
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service
                        Mode</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.modeOfService}"
                                     disabled="true"></s:textfield>
                    </div>

                </div>

                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer
                        Name</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.customerName}"
                                     disabled="true"></s:textfield>
                    </div>
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee
                        Name</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.consigneeCode}"
                                     disabled="true"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Origin Port</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.originationPort}"
                                     disabled="true"></s:textfield>
                    </div>
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Destination Port</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.destinationPort}"
                                     disabled="true"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Departure Date</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.pickupDate}"
                                     disabled="true"></s:textfield>
                    </div>
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Arrival Date</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.deliveryDate}"
                                     disabled="true"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Pickup Address</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.shipperInfoAddress.address}" name="book-num"
                                     disabled="true"></s:textfield>
                    </div>
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Destination Address</label>
                    <div class="col-lg-4">
                        <s:textfield cssClass="form-control" value="%{order.consigneeInfoAddress.address}" name="book-num"
                                     disabled="true"></s:textfield>
                    </div>

            </div>
        </div>
    </div>

        <s:if test="order.freightType=='SHIPPING AND TRUCKING'">
            <s:if test="order.modeOfService=='DOOR TO DOOR'">
                <%--<div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-anchor"></i>
                        <span class="panel-title"> Freight Plan </span>
                    </div>
                    <div class="panel-body">
                        <s:form cssClass="form-horizontal" action="findVesselScheduleBulk" theme="bootstrap" style="margin-bottom: -50px;">
                            &lt;%&ndash;<c:out value="${sessionScope.vendorIdPass}" />&ndash;%&gt;
                            <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                            <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                            <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                            <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
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
                            <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                            <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />

                            <div class="form-group">
                                <s:if test="#attr.order.serviceRequirement=='FULL CONTAINER LOAD'">
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                                </s:if>
                                <s:else>
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                                </s:else>
                                <div class="col-lg-10">
                                    &lt;%&ndash;<div class="form-control">&ndash;%&gt;
                                        &lt;%&ndash;<c:out value="${sessionScope.nameSizeParam}"/>&ndash;%&gt;
                                        <ol>
                                            <s:iterator value="nameSizeList" >
                                                <li><s:property /></li>
                                            </s:iterator>
                                        </ol>
                                    &lt;%&ndash;</div>&ndash;%&gt;
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                                <div class="col-lg-4">
                                    <div>
                                        <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                                  id="operationsBean_vendorList"
                                                  listKey="vendorId" listValue="vendorName" cssClass="form-control"
                                                  emptyOption="true"></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a href="#" style="width: 135px;">
                                            <s:submit cssClass="btn btn-primary" name="submit" value="Filter by Vendor"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                            Add Vendor
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                            Add Schedule
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </s:form>
                        <div class="form-group" style="padding-top: 50px;">
                            <hr>
                            <h4 style="text-align:center;">List of Schedules</h4>
                            <hr>
                        </div>
                        <s:if test="hasActionMessages()">
                            <div class="col-lg-12" id="successDiv">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                    <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                                </div>
                            </div>
                        </s:if>
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column title="Action">
                                <s:url var="editBulkItemsUrl" action="editBulkItems">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId">
                                    </s:param>
                                    <s:param name="vendorIdParam"
                                             value="#attr.vesselSchedule.vendorId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editBulkItemsUrl}" rel="tooltip"
                                     title="Update Status">
                                    Choose this vessel...
                                </s:a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>--%>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-truck"></i>
                        <span class="panel-title">Dispatch Plan : Origin</span>
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
                                                  emptyOption="true" value="%{orderItem.vendorDestination}" ></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createVendor" id="createVendorButton" class="btn btn-info">
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
                                                  emptyOption="true" value="%{orderItem.driverDestination}"></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createDriver" id="createDriverButton" class="btn btn-info" style="width:100px !important;">
                                            Add Driver
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Truck Code</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select list="listDrivers" name="operationsBean.truckOrigin"
                                                  id="trucksList"
                                                  listKey="truckId" listValue="truckCode" cssClass="form-control"
                                                  emptyOption="true" value="%{orderItem.truckDestination}" ></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createTruck" id="createTruckButton" class="btn btn-info" style="width:100px !important;">
                                            Add Truck
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Truck Type</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="bodyType"
                                                  list="#{bodyType}"
                                                  value="%{bodyType}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="bodyType_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Plate Number</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="plateNumber"
                                                  list="#{plateNumber}"
                                                  value="%{plateNumber}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="plateNumber_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Gross Weight</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="grossWeight"
                                                  list="#{grossWeight}"
                                                  value="%{grossWeight}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="grossWeight_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>
                                <div class="col-lg-8">
                                    <s:textfield cssClass="from_date form-control step2" value="%{orderItem.finalPickupdate}" id="pickup" name="operationsBean.pickupDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;" />
                                </div>
                            </div>
                            <div style="float: right; margin: -65px 50px 5px 0px;">
                                <button class="btn btn-primary"  style=" padding: 7px 32px; ">Save</button>
                            </div>
                        </s:form>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-truck"></i>
                        <span class="panel-title">Dispatch Plan : Destination</span>
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
                                <label class="col-lg-2 control-label">Vendor</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select list="vendorTruckingList" name="operationsBean.vendorListDestination"
                                                  id="vendorListDestination" listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                                  emptyOption="true" value="%{orderItem.vendorDestination}"></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createVendor" id="createVendorButton" class="btn btn-info">
                                            Add Vendor
                                        </a>
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Driver</label>
                                <div class="col-lg-8">
                                    <div>
                                        <s:select list="listDrivers" name="operationsBean.driverDestination"
                                                  id="driverListDestination" listKey="driverId" listValue="firstName + lastName" cssClass="form-control"
                                                  emptyOption="true" value="%{orderItem.driverDestination}" ></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createDriver" class="btn btn-info" id="createDriverButton" style="width:100px !important;">
                                            Add Driver
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Truck Code</label>
                                <div class="col-lg-8">
                                    <div>
                                        <s:select list="listDrivers" name="operationsBean.truckDestination"
                                                  id="trucksListDestination" listKey="truckId" listValue="truckCode" cssClass="form-control"
                                                  emptyOption="true" value="%{orderItem.truckDestination}" ></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createTruck" id="createTruckButton" class="btn btn-info" style="width:100px !important;">
                                            Add Truck
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Truck Type</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="bodyTypeDestination"
                                                  list="#{bodyType}"
                                                  value="%{bodyType}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="bodyType_Destination_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Plate Number</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="plateNumberDestination"
                                                  list="#{plateNumber}"
                                                  value="%{plateNumber}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="plateNumber_Destination_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Gross Weight</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="grossWeightDestination"
                                                  list="#{grossWeight}"
                                                  value="%{grossWeight}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="grossWeight_Destination_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group" style="margin-bottom: 0px !important;">
                                <label for="dropoff" class="col-sm-2 control-label">Drop off Date</label>
                                <div class="col-sm-8" style="padding: 0px; width: 64.5% !important; position: relative; left: 15px;">
                                    <s:textfield cssClass="from_date form-control step2" value="%{orderItem.finalDeliveryDate}" id="dropoff" name="operationsBean.deliveryDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;" />
                                </div>
                            </div>
                            <div style="float: right; margin: -50px 50px 5px 0px;">
                                <button class="btn btn-primary"  style=" padding: 7px 32px; ">Save</button>
                            </div>
                        </s:form>
                    </div>
                    <div class="panel-footer">
                        <div class="pull-right">
                            <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                 title="Update Status">

                                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                    <button type="button" class="btn">
                                        Back to Dispatch Plan : Containers
                                    </button>
                                </s:if>
                                <s:else>
                                    <button type="button" class="btn">
                                        Back to Dispatch Plan : Items
                                    </button>
                                </s:else>

                            </s:a>
                        </div>
                    </div>
                </div>
            </s:if>
            <s:elseif test="order.modeOfService=='DOOR TO PIER'">
                <%--<div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-anchor"></i>
                        <span class="panel-title">Freight Plan</span>
                    </div>
                    <div class="panel-body">
                        <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: -50px;">
                            &lt;%&ndash;<c:out value="${sessionScope.vendorIdPass}" />&ndash;%&gt;
                            <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                            <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                            <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                            <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
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
                            <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                            <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />

                            <div class="form-group">
                                <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                                </s:if>
                                <s:else>
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                                </s:else>
                                <div class="col-lg-10">
                                    &lt;%&ndash;<div class="form-control">&ndash;%&gt;
                                        &lt;%&ndash;<c:out value="${sessionScope.nameSizeParam}"/>&ndash;%&gt;
                                        <ol>
                                            <s:iterator value="nameSizeList" >
                                                <li><s:property /></li>
                                            </s:iterator>
                                        </ol>
                                    &lt;%&ndash;</div>&ndash;%&gt;
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                                <div class="col-lg-4">
                                    <div>
                                        <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                                  id="operationsBean_vendorList"
                                                  listKey="vendorId" listValue="vendorName" cssClass="form-control"
                                                  emptyOption="true"></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a href="#" style="width: 135px;">
                                            <s:submit cssClass="btn btn-primary" name="submit" value="Filter by Vendor"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                            Add Vendor
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                            Add Schedule
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </s:form>
                        <div class="form-group" style="padding-top: 50px;">
                            <hr>
                            <h4 style="text-align:center;">List of Schedules</h4>
                            <hr>
                        </div>
                        <s:if test="hasActionMessages()">
                            <div class="col-lg-12" id="successDiv">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                    <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                                </div>
                            </div>
                        </s:if>
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column title="Action">
                                <s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId">
                                    </s:param>
                                    <s:param name="vendorIdParam"
                                             value="#attr.vesselSchedule.vendorId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip"
                                     title="Update Status">
                                    Choose this vessel...
                                </s:a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>--%>

                <%--Origin--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-truck"></i>
                        <span class="panel-title">Dispatch Plan : Origin</span>
                    </div>
                    <div class="panel-body form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{orderItem.vendorOrigin}" disabled="true" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{orderItem.driverOrigin}" disabled="true" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Truck Code</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{orderItem.truckOrigin}" disabled="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{orderItem.finalPickupDate}" disabled="true" />
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="pull-right">
                            <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                 title="Update Status">

                                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                    <button type="button" class="btn">
                                        Back to Dispatch Plan : Containers
                                    </button>
                                </s:if>
                                <s:else>
                                    <button type="button" class="btn">
                                        Back to Dispatch Plan : Items
                                    </button>
                                </s:else>

                            </s:a>
                        </div>
                    </div>
                </div>
            </s:elseif>
            <s:elseif test="order.modeOfService=='PIER TO DOOR'">
                <%--<div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-anchor"></i>
                        <span class="panel-title">Freight Plan</span>
                    </div>
                    <div class="panel-body">
                        <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: -50px;">
                            &lt;%&ndash;<c:out value="${sessionScope.vendorIdPass}" />&ndash;%&gt;
                            <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                            <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                            <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                            <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
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
                            <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                            <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />
                            <div class="form-group">
                                <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                                </s:if>
                                <s:else>
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                                </s:else>
                                <div class="col-lg-10">
                                    &lt;%&ndash;<div class="form-control">&ndash;%&gt;
                                        &lt;%&ndash;<c:out value="${sessionScope.nameSizeParam}"/>&ndash;%&gt;
                                        <ol>
                                            <s:iterator value="nameSizeList" >
                                                <li><s:property /></li>
                                            </s:iterator>
                                        </ol>
                                    &lt;%&ndash;</div>&ndash;%&gt;
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                                <div class="col-lg-4">
                                    <div>
                                        <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                                  id="operationsBean_vendorList"
                                                  listKey="vendorId" listValue="vendorName" cssClass="form-control"
                                                  emptyOption="true"></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a href="#" style="width: 135px;">
                                            <s:submit cssClass="btn btn-primary" name="submit" value="Filter by Vendor"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                            Add Vendor
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                            Add Schedule
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </s:form>
                        <div class="form-group" style="padding-top: 50px;">
                            <hr>
                            <h4 style="text-align:center;">List of Schedules</h4>
                            <hr>
                        </div>
                        <s:if test="hasActionMessages()">
                            <div class="col-lg-12" id="successDiv">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                    <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                                </div>
                            </div>
                        </s:if>
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column title="Action">
                                <s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId">
                                    </s:param>
                                    <s:param name="vendorIdParam"
                                             value="#attr.vesselSchedule.vendorId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip"
                                     title="Update Status">
                                    Choose this vessel...
                                </s:a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>--%>

                <%--Destination--%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-truck"></i>
                        <span class="panel-title">Dispatch Plan : Destination</span>
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
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Dropoff Date</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{orderItem.finalDeliveryDate}" disabled="true" />
                            </div>
                        </div>
                    </div>

                    <div class="panel-footer">
                        <div class="pull-right">
                            <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                 title="Update Status">

                                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                    <button type="button" class="btn">
                                        Back to Dispatch Plan : Containers
                                    </button>
                                </s:if>
                                <s:else>
                                    <button type="button" class="btn">
                                        Back to Dispatch Plan : Items
                                    </button>
                                </s:else>

                            </s:a>
                        </div>
                    </div>
                </div>
            </s:elseif>
        </s:if>

        <%--<s:if test="order.freightType=='SHIPPING'">
            <s:if test="order.modeOfService=='PIER TO PIER'">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-anchor"></i>
                        <span class="panel-title">Freight Plan</span>
                    </div>
                    <div class="panel-body">
                        <s:form cssClass="form-horizontal" action="findVesselScheduleBulk" theme="bootstrap" style="margin-bottom: -50px;">
                            &lt;%&ndash;<c:out value="${sessionScope.vendorIdPass}" />&ndash;%&gt;
                            <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                            <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                            <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                            <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
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
                            <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                            <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />

                            <div class="form-group">
                                <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                                </s:if>
                                <s:else>
                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                                </s:else>
                                <div class="col-lg-10">
                                    &lt;%&ndash;<div class="form-control">&ndash;%&gt;
                                        &lt;%&ndash;<c:out value="${sessionScope.nameSizeParam}"/>&ndash;%&gt;
                                        <ol>
                                            <s:iterator value="nameSizeList" >
                                                <li><s:property /></li>
                                            </s:iterator>
                                        </ol>
                                    &lt;%&ndash;</div>&ndash;%&gt;
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                                <div class="col-lg-4">
                                    <div>
                                        <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                                  id="operationsBean_vendorList"
                                                  listKey="vendorId" listValue="vendorName" cssClass="form-control"
                                                  emptyOption="true"></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a href="#" style="width: 135px;">
                                            <s:submit cssClass="btn btn-primary" name="submit" value="Filter by Vendor"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                            Add Vendor
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="text-align: center;">
                                    <div>
                                        <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                            Add Schedule
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </s:form>
                        <div class="form-group" style="padding-top: 50px;">
                            <hr>
                            <h4 style="text-align:center;">List of Schedules</h4>
                            <hr>
                        </div>
                        <s:if test="hasActionMessages()">
                            <div class="col-lg-12" id="successDiv">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                    <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                                </div>
                            </div>
                        </s:if>
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column title="Action">
                                <s:url var="editBulkItemsUrl" action="editBulkItems">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId">
                                    </s:param>
                                    <s:param name="vendorIdParam"
                                             value="#attr.vesselSchedule.vendorId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editBulkItemsUrl}" rel="tooltip"
                                     title="Update Status">
                                    Choose this vessel...
                                </s:a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>
            </s:if>
        </s:if>--%>

        <%--<s:if test="order.freightType=='TRUCKING'">
            &lt;%&ndash;<s:if test="order.modeOfService=='PICKUP'">&ndash;%&gt;
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-truck"></i>
                        <span class="panel-title"> Dispatch Plan : Origin</span>
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
                                        <a data-toggle="modal" data-target="#createVendor" class="btn btn-info">
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
                                                  emptyOption="true" value="%{orderItem.driverDestination}" ></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createDriver" id="createDriverButtonOrigin" class="btn btn-info" style="width:100px !important;">
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
                                                  emptyOption="true" value="%{orderItem.truckDestination}" ></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div>
                                        <a data-toggle="modal" data-target="#createTruck" id="createTruckButtonOrigin" class="btn btn-info" style="width:100px !important;">
                                            Add Truck
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Truck Type</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="bodyType"
                                                  list="#{bodyType}"
                                                  value="%{bodyType}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="bodyType_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Plate Number</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="plateNumber"
                                                  list="#{plateNumber}"
                                                  value="%{plateNumber}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="plateNumber_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Gross Weight</label>

                                <div class="col-lg-8">
                                    <div>
                                        <s:select cssClass="form-control"
                                                  id="grossWeight"
                                                  list="#{grossWeight}"
                                                  value="%{grossWeight}"
                                                  style="display:none"
                                                />
                                        <s:textfield cssClass="form-control"
                                                     id="grossWeight_textfield"
                                                     disabled="true"
                                                />
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>
                                <div class="col-lg-8">
                                    <s:textfield cssClass="from_date form-control step2" value="%{orderItem.finalPickupdate}" id="pickup" name="operationsBean.pickupDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;" />
                                </div>
                            </div>
                            <div style="float: right; margin: -65px 50px 5px 0px;">
                                <button class="btn btn-primary" style=" padding: 7px 32px; " >Save</button>
                            </div>
                        </s:form>
                    </div>
                </div>
            &lt;%&ndash;</s:if>&ndash;%&gt;
        </s:if>--%>

        <%--<s:if test="order.freightType=='TRUCKING'">
            <s:if test="order.modeOfService=='DELIVERY'">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <i class="fa fa-truck"></i>
                        <span class="panel-title"> Dispatch Plan : Destination</span>
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
                                    <div class="col-lg-2">
                                        <div>
                                            <a data-toggle="modal" data-target="#createVendor" class="btn btn-info">
                                                Add Vendor
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="operationsBean.driverDestination" class="col-sm-2 control-label">Driver:</label>
                                <div class="col-sm-10">
                                    <div style="width:90%;float:left;padding-right:10px;">
                                        <s:select list="listDrivers" name="operationsBean.driverDestination"
                                                  id="driverListDestination"
                                                  listKey="driverId" listValue="firstName + lastName" cssClass="form-control"
                                                  emptyOption="true" value="%{orderItem.driverDestination}" ></s:select>
                                    </div>
                                    <div class="col-lg-2">
                                        <div>
                                            <a data-toggle="modal" data-target="#createDriver" class="btn btn-info" id="createDriverButton" style="width:100px !important;">
                                                Add Driver
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="operationsBean.truckDestination" class="col-sm-2 control-label">Truck:</label>
                                <div class="col-sm-10">
                                    <div style="width:90%;float:left;padding-right:10px;">
                                        <s:select list="listDrivers" name="operationsBean.truckDestination"
                                                  id="trucksListDestination"
                                                  listKey="truckId" listValue="truckCode" cssClass="form-control"
                                                  emptyOption="true" value="%{orderItem.truckDestination}" ></s:select>
                                    </div>
                                    <div class="col-lg-2">
                                        <div>
                                            <a data-toggle="modal" data-target="#createTruck" id="createTruckButton" class="btn btn-info" style="width:100px !important;">
                                                Add Truck
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 0px !important;">
                                <label for="dropoff" class="col-sm-2 control-label">Drop off Date:</label>
                                <div class="col-sm-8" style="padding: 0px; width: 64.5% !important; position: relative; left: 15px;">
                                    <s:textfield cssClass="from_date form-control step2" value="%{orderItem.finalDeliveryDate}" id="dropoff" name="operationsBean.deliveryDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;" />
                                </div>
                            </div>
                            <div style="float: right; margin: -50px 50px 5px 0px;">
                                <button class="btn btn-primary"  style=" padding: 7px 32px; ">Save</button>
                            </div>
                        </s:form>
                    </div>
                </div>
            </s:if>
        </s:if>--%>


    <%--<div class="panel-footer">
        <div class="table-responsive">
        <div class="pull-right">
            <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                <s:param name="orderIdParam"
                         value="#attr.order.orderId"></s:param>
                <s:param name="orderNoParam"
                         value="#attr.order.orderNo"></s:param>
            </s:url>
            <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip">

                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                    <button type="button" class="btn">
                        Back to Dispatch Plan : Containers
                    </button>
                </s:if>
                <s:else>
                    <button type="button" class="btn">
                        Back to Dispatch Plan : Items
                    </button>
                </s:else>
            </s:a>
        </div>
        </div>
    </div>--%>
</div>

<%--Start Add Vendor Modal--%>

<div class="modal fade" id="createDriver" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Driver</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form cssClass="form-horizontal" action="addDriver" theme="bootstrap">
                        <s:hidden name = "driver.vendorId" id="vendorId" ></s:hidden>

                    <div class="form-group">

                        <label for="driver.licenseNumber" class="col-lg-3 control-label" style="padding-top:0px;">License<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="AXX-XX-XXXXXXX"
                                         name="driver.licenseNumber" id="driver_licenseNumber" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.lastName" class="col-lg-3 control-label" style="padding-top:0px;">Last Name<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="driver.lastName"
                                         id="driver_lastName" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.firstName" class="col-lg-3 control-label" style="padding-top:0px;">First Name<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="driver.firstName"
                                         id="driver_firstName" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.middleName" class="col-lg-3 control-label" style="padding-top:0px;">Middle Name</label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="driver.middleName"
                                         id="driver_middleName" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.title" class="col-lg-3 control-label" style="padding-top:0px;">Title<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Title" name="driver.title"
                                         id="driver_title" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-3 control-label" for="driver.status" style="padding-top:0px;">Status</label>

                        <div class="col-lg-9">
                            <s:select list="statusList" listKey="key" listValue="value" name="driver.status"
                                      cssClass="form-control"/>
                        </div>

                    </div>

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

<div class="modal fade" id="createTruck" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Trucks</h4>
            </div>

            <div class="modal-body">

                <s:form cssClass="form-horizontal" action="addTruck" method="post" theme="bootstrap">
                    <%--Plate Number = plateNumber--%>
                    <s:hidden name="truck.vendorId" id="vendorIdTruck" ></s:hidden>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="e.g. ABC-123, XYZ-7890, etc." name="truck.plateNumber"
                                     id="truck_plateNumber" required="true" />
                    </div>
                </div>
                    <%--LTO Certificate Number = code--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">LTO Certificate Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="LTO Certificate Number" name="truck.truckCode"
                                     id="truck_truckCode" required="true" maxlength="10"/>
                    </div>
                </div>
                    <%--MV File Number--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">MV File Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="MV File Number" name="truck.motorVehicleNumber"
                                     id="truck_motorVehicleNumber" required="true" />
                    </div>
                </div>
                    <%--Model = modelNumber--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Model<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="e.g. 4Runner, Yukon, Silverado, etc." name="truck.modelNumber"
                                     id="truck_modelNumber" required="true"/>
                    </div>
                </div>
                    <%--Owner's Name = ownerName--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Owner's Name<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Owner's Name" name="truck.ownerName"
                                     id="truck_ownerName" required="true"/>
                    </div>
                </div>
                    <%--Owner's Address = ownerAddress--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0;">Owner's Address<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Owner's Address" name="truck.ownerAddress"
                                     id="truck_ownerAddress" required="true"/>
                    </div>
                </div>
                    <%--O.R. Number = officialReceipt--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">O.R. Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="O.R. Number" name="truck.officialReceipt"
                                     id="truck_officialReceipt" required="true"/>
                    </div>
                </div>
                    <%--CR Date of Issue--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0;">CR Date of Issue<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="CR Date of Issue" name="truck.issueDate" id="issueDate" required="true"/>
                    </div>
                </div>
                    <%--Make = engineNumber--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Make<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="e.g. Toyota, GMC, Chevrolet, etc."
                                     name="truck.engineNumber"
                                     id="truck_engineNumber" required="true"/>
                    </div>
                </div>
                    <%--Type of Body = truckType--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Type of Body<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:select list="truckTypeList" name="truck.truckType" listKey="key" listValue="value"
                                  cssClass="form-control"/>
                    </div>
                </div>
                    <%--Year Model = modelYear--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Year Model<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder=" e.g. 1999, 2012, etc." name="truck.modelYear"
                                     id="truck_modelYear" required="true" maxLength="4"/>
                    </div>
                </div>
                    <%--Gross Weight = grossWeight--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Gross Weight (kg.)<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Gross Weight" name="truck.grossWeight"
                                     id="truck_grossWeight" required="true"/>
                    </div>
                </div>
                    <%--Net Weight = netWeight--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Net Weight (kg.)<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Net Weight" name="truck.netWeight"
                                     id="truck_netWeight" required="true"/>
                    </div>
                </div>
                    <%--Net Capacity = netCapacity--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Net Capacity<span class="asterisk_red"></span></label>
                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Net Capacity" name="truck.netCapacity"
                                     id="truck_netCapacity" required="true"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </s:form>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="createVendor" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Vendor</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form cssClass="form-horizontal" action="addVendor" method="POST" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Type<span class="asterisk_red"></span></label>

                        <div class="col-lg-9"></span>
                            <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType"
                                      listKey="key" listValue="value" cssClass="form-control" />
                            <%--<s:hidden type="hidden" cssClass="form-control" value="SHIPPING" name="vendor.vendorType"
                                      id="vendor.vendorType"/>
                            <s:textfield cssClass="form-control" value="Shipping" name="vendor_vendorType"
                                         id="vendor_vendorType" disabled="true"/>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Company<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Company Name" name="vendor.vendorName"
                                         id="vendor_vendorName" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Code<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" name="vendor.vendorCode" id="vendor_vendorCode" required="true"
                                         placeholder="Code" maxLength="3" pattern="[A-Z]+" title="Must be letters only" onkeypress="return alphaKeyOnly(event)"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Class<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:select list="vendorClassList" listKey="key" listValue="value" cssClass="form-control"
                                      id="vendor.vendorClass" name="vendor.vendorClass"/>
                        </div>
                    </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Service Area<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:select list="portsList" listKey="key" listValue="value" cssClass="form-control"
                                          id="vendor.serviceArea" name="vendor.serviceArea"/>
                            </div>
                        </div>


                </div>
            </div>
            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" value="Save" type="submit"/>
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

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addVesselScheduleEdit">

                    <label>Voyage Number<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control" name="vesselSchedule.voyageNumber"/>

                    <s:hidden id="vendorIdHolder" name="vesselSchedule.vendorId" />

                    <label>Vessel<span class="asterisk_red"></span></label>

                    <s:select emptyOption="true" id="vesselList"
                              value="vesselSchedule.vesselName"
                              name="vesselSchedule.vesselName"
                              list="vesselList" listValue="value" listKey="key"
                              cssClass="form-control" required="true"/>

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
                              list="portsList" listValue="value" listKey="key"order
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
            // To get the vessel list of the vendor
            $.getJSON('listVessel', {
                vendorId: vendorId
            },

            function (jsonResponse) {

                var vessel = $('#vesselList');

                vessel.find('option').remove();

                $.each(jsonResponse.vesselMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(vessel);
                });

            });
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

                var truckCode = $("#trucksList").val();

                $.getJSON('truckDetails', {
                    truckCodeParam: truckCode
                },

                function (jsonResponse) {
                    var select1 = $('#bodyType');

                    select1.find('option').remove();

                    var select2 = $('#plateNumber');

                    select2.find('option').remove();

                    var select3 = $('#grossWeight');

                    select3.find('option').remove();

                    // For Truck Type Auto-populate
                    $.each(jsonResponse.bodyTypeMap, function (key,value) {

                        $('<option>').val(key).text(value).appendTo(select1);
                        var bodyType = $("#bodyType").val();
                        document.getElementById("bodyType_textfield").value = bodyType;

                    });

                    // For Plate Number Auto-populate
                    $.each(jsonResponse.plateNumberMap, function (key,value) {

                        $('<option>').val(key).text(value).appendTo(select2);
                        var plateNumber = $("#plateNumber").val();
                        document.getElementById("plateNumber_textfield").value = plateNumber;

                    });

                    // For Gross Weight Auto-populate
                    $.each(jsonResponse.grossWeightMap, function (key,value) {

                        $('<option>').val(key).text(value).appendTo(select3);
                        var grossWeight = $("#grossWeight").val();
                        document.getElementById("grossWeight_textfield").value = grossWeight;

                    });
                });

            });
        });
    });

    $(document).ready(function() {
        $('#vendorListDestination').change(function(event) {
            var vendorId = $("#vendorListDestination").val();

            $.getJSON('listVendorDriverAndTrucks', {
                vendorId : vendorId
            },

            function(jsonResponse) {

                var driver = $('#driverListDestination');

                driver.find('option').remove();

                var truck = $('#trucksListDestination');

                truck.find('option').remove();

                $.each(jsonResponse.driverMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(driver);
                });

                $.each(jsonResponse.trucksMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(truck);
                });

                var truckCode = $("#trucksListDestination").val();
                if(truckCode != null) {
                    $.getJSON('truckDetails', {
                        truckCodeParam: truckCode
                    },

                    function (jsonResponse) {
                        var select4 = $('#bodyTypeDestination');

                        select4.find('option').remove();

                        var select5 = $('#plateNumberDestination');

                        select5.find('option').remove();

                        var select6 = $('#grossWeightDestination');

                        select6.find('option').remove();

                        // For Truck Type Auto-populate
                        $.each(jsonResponse.bodyTypeMap, function (key, value) {

                            $('<option>').val(key).text(value).appendTo(select4);
                            var bodyType = $("#bodyTypeDestination").val();
                            document.getElementById("bodyType_Destination_textfield").value = bodyType;

                        });

                        // For Plate Number Auto-populate
                        $.each(jsonResponse.plateNumberMap, function (key, value) {

                            $('<option>').val(key).text(value).appendTo(select5);
                            var plateNumber = $("#plateNumberDestination").val();
                            document.getElementById("plateNumber_Destination_textfield").value = plateNumber;

                        });

                        // For Gross Weight Auto-populate
                        $.each(jsonResponse.grossWeightMap, function (key, value) {

                            $('<option>').val(key).text(value).appendTo(select6);
                            var grossWeight = $("#grossWeightDestination").val();
                            document.getElementById("grossWeight_Destination_textfield").value = grossWeight;

                        });
                    });
                }
                else{
                    document.getElementById("bodyType_Destination_textfield").value = '';
                    document.getElementById("plateNumber_Destination_textfield").value = '';
                    document.getElementById("grossWeight_Destination_textfield").value = '';

                }
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
            dropoff.datepicker('option', 'minDate', pickup.datepicker('getDate') );
        }

    });

    // delivery date validation -jp
    dropoff.datepicker({

        // on 6:00pm
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

    $(document).ready(function () {
        $("#createDriverButton").click(function () {
            var vendorId = $("#vendorListOrigin").val();
            $("#driver_licenseNumber").val('');
            $("#driver_lastName").val('');
            $("#driver_firstName").val('');
            $("#driver_middleName").val('');
            $("#driver_title").val('');

            if (vendorId == "" || null) {
                alert("Select a vendor first");
                return false;
            }
            $("#vendorId").val(vendorId);
        })
    });

    $(document).ready(function () {
        $("#createTruckButton").click(function () {
            var vendorId = $("#vendorListOrigin").val();
            $("#truck_plateNumber").val('');
            $("#truck_truckCode").val('');
            $("#truck_motorVehicleNumber").val('');
            $("#truck_modelNumber").val('');
            $("#truck_ownerName").val('');
            $("#truck_ownerAddress").val('');
            $("#truck_officialReceipt").val('');
            $("#truck_engineNumber").val('');
            $("#truck_modelYear").val('');
            $("#truck_grossWeight").val('');
            $("#truck_netWeight").val('');
            $("#truck_netCapacity").val('');

            if (vendorId == "" || null) {
                alert("Select a vendor first");
                return false;
            }
            $("#vendorIdTruck").val(vendorId);
        })
    });

    $(document).ready(function () {
        $("#createVendorButton").click(function () {
            $("#vendor_vendorName").val('');
            $("#vendor_vendorCode").val('');
        })
    });

    $(document).ready(function () {
        $("#createDriverButton").click(function () {
            var vendorId = $("#vendorListDestination").val();
            $("#driver_licenseNumber").val('');
            $("#driver_lastName").val('');
            $("#driver_firstName").val('');
            $("#driver_middleName").val('');
            $("#driver_title").val('');

            if (vendorId == "" || null) {
                alert("Select a vendor first");
                return false;
            }
            $("#vendorId").val(vendorId);
        })
    });

    $(document).ready(function () {
        $("#createTruckButton").click(function () {
            var vendorId = $("#vendorListDestination").val();
            $("#truck_plateNumber").val('');
            $("#truck_truckCode").val('');
            $("#truck_motorVehicleNumber").val('');
            $("#truck_modelNumber").val('');
            $("#truck_ownerName").val('');
            $("#truck_ownerAddress").val('');
            $("#truck_officialReceipt").val('');
            $("#truck_engineNumber").val('');
            $("#truck_modelYear").val('');
            $("#truck_grossWeight").val('');
            $("#truck_netWeight").val('');
            $("#truck_netCapacity").val('');

            if (vendorId == "" || null) {
                alert("Select a vendor first");
                return false;
            }
            $("#vendorIdTruck").val(vendorId);
        })
    });

    $(document).ready(function(){

        $("#driver_licenseNumber").mask("A99-99-9999999");
//        $("#shipping_mobile").mask("(+63999)(999-9999)");
//        $("#shipping_fax").mask("(999) 999-9999");

    });

    $(document).ready(function(){

        $("#truck_motorVehicleNumber").mask("9999-99999999999");
        $("#truck_plateNumber").mask("AAA-999");
//        $("#shipping_fax").mask("(999) 999-9999");

    });

    var issueDate = $('#issueDate');

    issueDate.datepicker({

        dateFormat: 'mm/dd/yy',
        startDate: 2

    });

</script>
