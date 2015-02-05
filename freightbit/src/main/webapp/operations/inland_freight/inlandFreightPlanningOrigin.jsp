<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span>
                <h1><i class="fa fa-truck"></i> Dispatch Plan : Origin</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewInlandFreightList' />"> Dispatch Plan : Orders </a>
            </li>
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

                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                        Dispatch Plan : Containers
                    </s:if>
                    <s:else>
                        Dispatch Plan : Items
                    </s:else>
                </s:a>
            </li>
            <li class="active"> Dispatch Plan : Origin</li>
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
                <s:textfield cssClass="serviceModeField form-control" value="%{order.modeOfService}"
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
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control pickupDate" value="%{order.pickupDate}"
                             disabled="true"></s:textfield>
            </div>
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Delivery Date</label>
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

<s:if test="order.freightType=='TRUCKING'">
    <%--<s:if test="order.modeOfService=='PICKUP'">--%>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-truck"></i>
                <span class="panel-title"> Dispatch Plan : Origin</span>
            </div>
            <div class="panel-body">
                <s:form cssClass="form-horizontal originForm" theme="bootstrap" action="editOrderItemsOrigin">

                    <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}"/>
                    <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}"/>
                    <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}"/>
                    <s:hidden name="operationsBean.orderId" value="%{orderItem.orderId}"/>
                    <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}"/>
                    <s:hidden name="operationsBean.classification" value="%{orderItem.classification}"/>
                    <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}"/>
                    <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}"/>
                    <s:hidden name="operationsBean.comments" value="%{orderItem.comments}"/>
                    <s:hidden name="operationsBean.rate" value="%{orderItem.rate}"/>
                    <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}"/>
                    <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}"/>
                    <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}"/>
                    <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}"/>
                    <s:hidden name="operationsBean.status" value="%{orderItem.status}"/>
                    <s:hidden name="operationsBean.weight" value="%{orderItem.weight}"/>
                    <s:hidden name="operationsBean.vendorOrigin" value="%{orderItem.vendorOrigin}"/>
                    <s:hidden name="operationsBean.vendorSea" value="%{orderItem.vendorSea}"/>
                    <s:hidden name="operationsBean.vesselScheduleId" value="%{orderItem.vesselScheduleId}"/>
                    <s:hidden name="order.orderId" value="%{orderItem.orderId}"/>
                    <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}"/>
                    <s:hidden name="operationsBean.freightType" value="%{order.freightType}"/>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

                        <div class="col-lg-8">
                            <div>
                                <s:if test="#attr.order.freightType == 'TRUCKING'">
                                    <s:select list="vendorTruckingList" name="operationsBean.vendorListOrigin"
                                              id="vendorListOrigin" listKey="vendorId" listValue="vendorName" cssClass="dispatchInput form-control"
                                              emptyOption="true" value="%{orderItem.vendorDestination}" ></s:select>
                                </s:if>
                                <s:else>
                                    <s:select list="vendorTruckingOriginList" name="operationsBean.vendorListOrigin"
                                              id="vendorListOrigin" listKey="vendorId" listValue="vendorName" cssClass="dispatchInput form-control"
                                              emptyOption="true" value="%{orderItem.vendorDestination}" ></s:select>
                                </s:else>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div>
                                <a data-target="#createVendor" id="createVendorButton" data-toggle="modal" class="btn btn-info">
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
                                          id="driverList" listKey="driverId" listValue="firstName + lastName" cssClass="dispatchInput form-control"
                                          emptyOption="true" value="%{orderItem.driverDestination}" ></s:select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div>
                                <a class="btn btn-info" data-toggle="modal" id="createDriverButton" data-target="#createDriver"
                                   style="width:100px !important;">
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
                                          id="trucksList" listKey="truckId" listValue="truckCode" cssClass="dispatchInput form-control"
                                          emptyOption="true" value="%{orderItem.truckDestination}" ></s:select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div>
                                <a data-target="#createTruck" data-toggle="modal" id="createTruckButton" class="btn btn-info"
                                   style="width:100px !important;">
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
                                <s:textfield cssClass="dispatchInput form-control"
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
                                <s:textfield cssClass="dispatchInput form-control"
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
                                <s:textfield cssClass="dispatchInput form-control"
                                             id="grossWeight_textfield"
                                             disabled="true"
                                        />
                            </div>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>

                        <div class="col-lg-8">
                            <s:textfield cssClass="from_date form-control step2 finalPickupDate" value="%{orderItem.finalPickupdate}"
                                         id="pickup" name="operationsBean.pickupDate" placeholder="Select start date"
                                         contenteditable="false" style="margin-bottom: 15px !important;"/>
                        </div>
                    </div>

                    <div style="float: right;">
                        <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>
                        </s:url>
                        <s:a href="%{viewInlandFreightItemListUrl}" rel="tooltip" title="Cancel">
                            <button type="button" id="Cancel" class="btn btn-danger">
                                Cancel
                            </button>
                        </s:a>
                        <button class="btn btn-primary finalSaveBtn" type="button" disabled>Save</button>
                    </div>

                </s:form>
            </div>
        </div>
    <%--</s:if>--%>
</s:if>

<s:if test="order.freightType=='SHIPPING AND TRUCKING'">
<s:if test="order.modeOfService=='DOOR TO DOOR'">
<div class="panel panel-primary">
    <div class="panel-heading">
        <i class="fa fa-anchor"></i>
        <span class="panel-title">Freight Plan</span>
    </div>
    <div class="panel-body form-horizontal">
        <div class="form-group">
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{orderItem.vendorSea}" name="book-num"
                             disabled="true"></s:textfield>
            </div>
        </div>
        <div class="form-group">
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Voyage Number </label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{orderItem.vesselScheduleId}" name="book-num"
                             disabled="true"></s:textfield>
            </div>
        </div>
        <div class="form-group">
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Vessel Name </label>
            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{vesselSchedule.vesselName}" name="book-num" disabled="true"></s:textfield>
            </div>
        </div>

        <div class="form-group">
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Departure Date </label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control departureDate" value="%{vesselSchedule.departureDate}" name="book-num" disabled="true"></s:textfield>
            </div>
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Arrival Date <Port></Port> </label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control" value="%{vesselSchedule.arrivalDate}" name="book-num" disabled="true"></s:textfield>
            </div>
        </div>

        <div class="form-group">
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Departure Time </label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control" value="%{vesselSchedule.departureTime}" name="book-num" disabled="true"></s:textfield>
            </div>
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Arrival Time <Port></Port> </label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control" value="%{vesselSchedule.arrivalTime}" name="book-num" disabled="true"></s:textfield>
            </div>
        </div>

        <div class="form-group">
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Origin Port </label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control" value="%{vesselSchedule.originPort}" name="book-num" disabled="true"></s:textfield>
            </div>
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Destination <Port></Port> </label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control" value="%{vesselSchedule.destinationPort}" name="book-num" disabled="true"></s:textfield>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <i class="fa fa-truck"></i>
        <span class="panel-title"> Dispatch Plan : Origin</span>
    </div>
    <div class="panel-body">
        <s:form cssClass="form-horizontal originForm" theme="bootstrap" action="editOrderItemsOrigin">

            <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}"/>
            <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}"/>
            <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}"/>
            <s:hidden name="operationsBean.orderId" value="%{orderItem.orderId}"/>
            <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}"/>
            <s:hidden name="operationsBean.classification" value="%{orderItem.classification}"/>
            <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}"/>
            <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}"/>
            <s:hidden name="operationsBean.comments" value="%{orderItem.comments}"/>
            <s:hidden name="operationsBean.rate" value="%{orderItem.rate}"/>
            <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}"/>
            <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}"/>
            <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}"/>
            <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}"/>
            <s:hidden name="operationsBean.status" value="%{orderItem.status}"/>
            <s:hidden name="operationsBean.weight" value="%{orderItem.weight}"/>
            <s:hidden name="operationsBean.vendorOrigin" value="%{orderItem.vendorOrigin}"/>
            <s:hidden name="operationsBean.vendorSea" value="%{orderItem.vendorSea}"/>
            <s:hidden name="operationsBean.vesselScheduleId" value="%{orderItem.vesselScheduleId}"/>
            <s:hidden name="order.orderId" value="%{orderItem.orderId}"/>
            <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}"/>
            <s:hidden name="operationsBean.freightType" value="%{order.freightType}"/>

            <div class="form-group">
                <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

                <div class="col-lg-8">
                    <div>
                        <s:if test="#attr.order.freightType == 'TRUCKING'">
                            <s:select list="vendorTruckingList" name="operationsBean.vendorListOrigin"
                                      id="vendorListOrigin" listKey="vendorId" listValue="vendorName" cssClass="dispatchInput form-control"
                                      emptyOption="true" value="%{orderItem.vendorDestination}" ></s:select>
                        </s:if>
                        <s:else>
                            <s:select list="vendorTruckingOriginList" name="operationsBean.vendorListOrigin"
                                      id="vendorListOrigin" listKey="vendorId" listValue="vendorName" cssClass="dispatchInput form-control"
                                      emptyOption="true" value="%{orderItem.vendorDestination}" ></s:select>
                        </s:else>
                    </div>
                </div>

                <div class="col-lg-2">
                    <div>
                        <a data-target="#createVendor" id="createVendorButton" data-toggle="modal" class="btn btn-info">
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
                                  id="driverList" listKey="driverId" listValue="firstName + lastName" cssClass="dispatchInput form-control"
                                  emptyOption="true" value="%{orderItem.driverDestination}" ></s:select>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div>
                        <a data-toggle="modal" data-target="#createDriver" id="createDriverButton" class="btn btn-info"
                           style="width:100px !important;">
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
                                  id="trucksList" listKey="truckId" listValue="truckCode" cssClass="dispatchInput form-control"
                                  emptyOption="true" value="%{orderItem.truckDestination}" ></s:select>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div>
                        <a data-target="#createTruck" data-toggle="modal" id="createTruckButton" class="btn btn-info"
                           style="width:100px !important;">
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
                        <s:textfield cssClass="dispatchInput form-control"
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
                        <s:textfield cssClass="dispatchInput form-control"
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
                        <s:textfield cssClass="dispatchInput form-control"
                                     id="grossWeight_textfield"
                                     disabled="true"
                                />
                    </div>
                </div>

            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>

                <div class="col-lg-8">
                    <s:textfield cssClass="from_date form-control step2 finalPickupDate" value="%{orderItem.finalPickupdate}"
                                 id="pickup" name="operationsBean.pickupDate" placeholder="Select start date"
                                 contenteditable="false" style="margin-bottom: 15px !important;"/>
                </div>
            </div>
            <div style="float: right;">
                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="#attr.order.orderNo"></s:param>
                </s:url>
                <s:a href="%{viewInlandFreightItemListUrl}" rel="tooltip" title="Cancel">
                    <button type="button" id="Cancel" class="btn btn-danger">
                        Cancel
                    </button>
                </s:a>
                <button class="btn btn-primary finalSaveBtn" type="button" disabled>Save</button>
            </div>
        </s:form>
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
                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                    <button type="button" class="btn btn-danger">
                        <i class="fa fa-chevron-left"></i> Dispatch Plan : Containers
                    </button>
                </s:if>
                <s:else>
                    <button type="button" class="btn btn-danger">
                        <i class="fa fa-chevron-left"></i>  Dispatch Plan : Items
                    </button>
                </s:else>
            </s:a>
        </div>
    </div>
</div>

    <%--<div class="panel-heading">
        <i class="fa fa-truck"></i>
        <span class="panel-title"> Dispatch Plan : Destination</span>
    </div>
    <div class="panel-body form-horizontal">

        <div class="form-group">

            <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{orderItem.vendorDestination}" disabled="true"/>
            </div>

        </div>

        <div class="form-group">

            <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{orderItem.driverDestination}" disabled="true"/>
            </div>

        </div>

        <div class="form-group">

            <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{orderItem.truckDestination}" disabled="true"/>
            </div>

        </div>

        <div class="form-group">

            <label class="col-lg-2 control-label" style="padding-top:0px;">Body Type</label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{truckDestination.truckType}" disabled="true" />
            </div>

        </div>

        <div class="form-group">

            <label class="col-lg-2 control-label" style="padding-top:0px;">Plate Number</label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{truckDestination.plateNumber}" disabled="true" />
            </div>

        </div>

        <div class="form-group">

            <label class="col-lg-2 control-label" style="padding-top:0px;">Gross Weight</label>

            <div class="col-lg-1">
                <s:textfield cssClass="form-control" value="%{truckDestination.grossWeight}" disabled="true" />
            </div>

        </div>

        <div class="form-group">

            <label for="pickup" class="col-lg-2 control-label" style="padding-top:0px;">Dropoff Date</label>

            <div class="col-lg-10">
                <s:textfield cssClass="form-control" value="%{orderItem.finalDeliveryDate}" disabled="true"/>
            </div>

        </div>
    </div>--%>

</s:if>
<s:elseif test="order.modeOfService=='DOOR TO PIER'">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-anchor"></i>
            <span class="panel-title">Freight Plan</span>
        </div>
        <div class="panel-body form-horizontal">
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{orderItem.vendorSea}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Voyage Number </label>

                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{orderItem.vesselScheduleId}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Vessel Name </label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{vesselSchedule.vesselName}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>

            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Departure Date </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control departureDate" value="%{vesselSchedule.departureDate}" name="book-num" disabled="true"></s:textfield>
                </div>
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Arrival Date <Port></Port> </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{vesselSchedule.arrivalDate}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>

            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Departure Time </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{vesselSchedule.departureTime}" name="book-num" disabled="true"></s:textfield>
                </div>
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Arrival Time <Port></Port> </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{vesselSchedule.arrivalTime}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>

            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Origin Port </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{vesselSchedule.originPort}" name="book-num" disabled="true"></s:textfield>
                </div>
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Destination <Port></Port> </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{vesselSchedule.destinationPort}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-truck"></i>
            <span class="panel-title"> Dispatch Plan : Origin</span>
        </div>
        <div class="panel-body">
            <s:form cssClass="form-horizontal originForm" theme="bootstrap" action="editOrderItemsOrigin">
                <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}"/>
                <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}"/>
                <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}"/>
                <s:hidden name="operationsBean.orderId" value="%{orderItem.orderId}"/>
                <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}"/>
                <s:hidden name="operationsBean.classification" value="%{orderItem.classification}"/>
                <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}"/>
                <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}"/>
                <s:hidden name="operationsBean.comments" value="%{orderItem.comments}"/>
                <s:hidden name="operationsBean.rate" value="%{orderItem.rate}"/>
                <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}"/>
                <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}"/>
                <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}"/>
                <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}"/>
                <s:hidden name="operationsBean.status" value="%{orderItem.status}"/>
                <s:hidden name="operationsBean.weight" value="%{orderItem.weight}"/>
                <s:hidden name="operationsBean.vendorOrigin" value="%{orderItem.vendorOrigin}"/>
                <s:hidden name="operationsBean.vendorSea" value="%{orderItem.vendorSea}"/>
                <s:hidden name="operationsBean.vesselScheduleId" value="%{orderItem.vesselScheduleId}"/>
                <s:hidden name="order.orderId" value="%{orderItem.orderId}"/>
                <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}"/>
                <s:hidden name="operationsBean.freightType" value="%{order.freightType}"/>
                <div class="form-group">
                    <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>

                    <div class="col-lg-8">
                        <div>
                            <s:if test="#attr.order.freightType == 'TRUCKING'">
                                <s:select list="vendorTruckingList" name="operationsBean.vendorListOrigin"
                                          id="vendorListOrigin" listKey="vendorId" listValue="vendorName" cssClass="dispatchInput form-control"
                                          emptyOption="true" value="%{orderItem.vendorDestination}" ></s:select>
                            </s:if>
                            <s:else>
                                <s:select list="vendorTruckingOriginList" name="operationsBean.vendorListOrigin"
                                          id="vendorListOrigin" listKey="vendorId" listValue="vendorName" cssClass="dispatchInput form-control"
                                          emptyOption="true" value="%{orderItem.vendorDestination}" ></s:select>
                            </s:else>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div>
                            <a data-target="#createVendor" id="createVendorButton" data-toggle="modal" class="btn btn-info">
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
                                      listKey="driverId" listValue="firstName + lastName" cssClass="dispatchInput form-control"
                                      emptyOption="true" value="%{orderItem.driverDestination}"
                                    ></s:select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div>
                            <a data-toggle="modal" data-target="#createDriver" id="createDriverButton" class="btn btn-info"
                               style="width:100px !important;">
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
                                      listKey="truckId" listValue="truckCode" cssClass="dispatchInput form-control"
                                      emptyOption="true" value="%{orderItem.truckDestination}" ></s:select>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div>
                            <a data-target="#createTruck" data-toggle="modal" id="createTruckButton" class="btn btn-info"
                               style="width:100px !important;">
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
                            <s:textfield cssClass="dispatchInput form-control"
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
                            <s:textfield cssClass="dispatchInput form-control"
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
                            <s:textfield cssClass="dispatchInput form-control"
                                         id="grossWeight_textfield"
                                         disabled="true"
                                    />
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="from_date form-control step2 finalPickupDate" value="%{orderItem.finalPickupdate}"
                                     id="pickup" name="operationsBean.pickupDate" placeholder="Select start date"
                                     contenteditable="false" style="margin-bottom: 15px !important;"/>
                    </div>
                </div>
                <div style="float: right;">
                    <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                        <s:param name="orderIdParam"
                                 value="#attr.order.orderId"></s:param>
                        <s:param name="orderNoParam"
                                 value="#attr.order.orderNo"></s:param>
                    </s:url>
                    <s:a href="%{viewInlandFreightItemListUrl}" rel="tooltip" title="Cancel">
                        <button type="button" id="Cancel" class="btn btn-danger">
                            Cancel
                        </button>
                    </s:a>
                    <button class="btn btn-primary finalSaveBtn" type="button" disabled>Save</button>
                </div>
            </s:form>
        </div>
    </div>
</s:elseif>
</s:if>
</div>
</div>

<div class="modal fade" id="createDriver" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Driver</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form cssClass="form-horizontal" action="addDriverInland" theme="bootstrap">

                    <s:hidden name = "driver.vendorId" id="vendorIdDriver" ></s:hidden>
                    <div class="form-group">

                        <label for="driver.licenseNumber" class="col-lg-3 control-label" style="padding-top:0px;">License<span
                                class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="AXX-XX-XXXXXXX"
                                         name="driver.licenseNumber" id="driver_licenseNumber" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.lastName" class="col-lg-3 control-label" style="padding-top:0px;">Last
                            Name<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="driver.lastName"
                                         id="driver_lastName" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.firstName" class="col-lg-3 control-label" style="padding-top:0px;">First Name<span
                                class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="driver.firstName"
                                         id="driver_firstName" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.middleName" class="col-lg-3 control-label" style="padding-top:0px;">Middle
                            Name</label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="driver.middleName"
                                         id="driver_middleName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.title" class="col-lg-3 control-label" style="padding-top:0px;">Title<span
                                class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Title" name="driver.title"
                                         id="driver_title" required="true"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-lg-3 control-label" for="driver.status"
                               style="padding-top:0px;">Status</label>

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

<div class="modal fade" id="createVendor" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Vendor</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form cssClass="form-horizontal" action="addVendorInlandOrigin" method="POST" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Type<span
                                class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <%--<s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType"
                                      listKey="key" listValue="value" cssClass="form-control"/>--%>
                            <s:hidden type="hidden" cssClass="form-control" value="TRUCKING" name="vendor.vendorType"
                                      id="vendor.vendorType"/>
                            <s:textfield cssClass="form-control" value="Trucking" name="vendor_vendorType"
                                         id="vendor_vendorType" disabled="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Company<span
                                class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Company Name" name="vendor.vendorName"
                                         id="vendor_vendorName" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Code<span
                                class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" name="vendor.vendorCode" id="vendor_vendorCode"
                                         required="true"
                                         placeholder="Code" maxLength="3" pattern="[A-Z]+" title="Must be letters only"
                                         onkeypress="return alphaKeyOnly(event)"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Class<span
                                class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:select list="vendorClassList" listKey="key" listValue="value" cssClass="form-control"
                                      id="vendor.vendorClass" name="vendor.vendorClass"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="padding-top:0px;">Service Area<span
                                class="asterisk_red"></span></label>

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

<div class="modal fade" id="createTruck" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Trucks</h4>
            </div>

            <div class="modal-body">

                <s:form cssClass="form-horizontal" action="addTruckInland" method="post" theme="bootstrap">
                    <%--Plate Number = plateNumber--%>
                <s:hidden name="truck.vendorId" id="vendorIdTruck" ></s:hidden>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="e.g. ABC-123, XYZ-7890, etc."
                                     name="truck.plateNumber"
                                     id="truck_plateNumber" required="true"/>
                    </div>
                </div>
                    <%--LTO Certificate Number = code--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">LTO Certificate Number<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="LTO Certificate Number" name="truck.truckCode"
                                     id="truck_truckCode" required="true" maxlength="10"/>
                    </div>
                </div>
                    <%--MV File Number--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">MV File Number<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="MV File Number"
                                     name="truck.motorVehicleNumber"
                                     id="truck_motorVehicleNumber" required="true"/>
                    </div>
                </div>
                    <%--Model = modelNumber--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Model<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="e.g. 4Runner, Yukon, Silverado, etc."
                                     name="truck.modelNumber"
                                     id="truck_modelNumber" required="true"/>
                    </div>
                </div>
                    <%--Owner's Name = ownerName--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Owner's Name<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Owner's Name" name="truck.ownerName"
                                     id="truck_ownerName" required="true"/>
                    </div>
                </div>
                    <%--Owner's Address = ownerAddress--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0;">Owner's Address<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Owner's Address" name="truck.ownerAddress"
                                     id="truck_ownerAddress" required="true"/>
                    </div>
                </div>
                    <%--O.R. Number = officialReceipt--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">O.R. Number<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="O.R. Number" name="truck.officialReceipt"
                                     id="truck_officialReceipt" required="true"/>
                    </div>
                </div>
                    <%--CR Date of Issue--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0;">CR Date of Issue<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="CR Date of Issue" name="truck.issueDate"
                                     id="issueDate" required="true"/>
                    </div>
                </div>
                    <%--Make = engineNumber--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Make<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="e.g. Toyota, GMC, Chevrolet, etc."
                                     name="truck.engineNumber"
                                     id="truck_engineNumber" required="true"/>
                    </div>
                </div>
                    <%--Type of Body = truckType--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Type of Body<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:select list="truckTypeList" name="truck.truckType" listKey="key" listValue="value"
                                  cssClass="form-control"/>
                    </div>
                </div>
                    <%--Year Model = modelYear--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Year Model<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder=" e.g. 1999, 2012, etc." name="truck_modelYear"
                                     id="truck.modelYear" required="true" maxLength="4"/>
                    </div>
                </div>
                    <%--Gross Weight = grossWeight--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Gross Weight (kg.)<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Gross Weight" name="truck_grossWeight"
                                     id="truck.grossWeight" required="true"/>
                    </div>
                </div>
                    <%--Net Weight = netWeight--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Net Weight (kg.)<span
                            class="asterisk_red"></span></label>

                    <div class="col-lg-8">
                        <s:textfield cssClass="form-control" placeholder="Net Weight" name="truck.netWeight"
                                     id="truck_netWeight" required="true"/>
                    </div>
                </div>
                    <%--Net Capacity = netCapacity--%>
                <div class="form-group">
                    <label class="col-lg-4 control-label" style="padding-top:0px;">Net Capacity<span
                            class="asterisk_red"></span></label>

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

<%-- MODAL FOR DATE WARNING  -- START --%>
<div class="modal fade" id="dateWarningModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel" style="color: red"><i class="fa fa-warning"></i> WARNING</h4>
            </div>
            <div class="modal-body" id="dateWarningModalBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%-- MODAL FOR DATE WARNING  -- END --%>

<script type="text/javascript">

    var pickup = $('#pickup');
    var dropoff = $('#dropoff');

    //pick up date validation
    pickup.datepicker({

        // on 5:00pm
//            timeFormat: 'h:mm TT',
        dateFormat: 'yy-mm-dd',
        minDate: 0,
        onClose: function (dateText, inst) {

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

        onSelect: function (selectedDateTime) {
            dropoff.datetimepicker('option', 'minDate', pickup.datetimepicker('getDate'));
        }

    });

    // delivery date validation -jp
    dropoff.datetimepicker({

        // on 6:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function (dateText, inst) {

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

        onSelect: function (selectedDateTime) {
            pickup.datetimepicker('option', 'maxDate', dropoff.datetimepicker('getDate'));
        }

    });

    $(document).ready(function () {
        $('#vendorListOrigin').change(function (event) {
            var vendorId = $("#vendorListOrigin").val();

            $.getJSON('listVendorDriverAndTrucks', {
                        vendorId: vendorId
                },

                function (jsonResponse) {

                    var driver = $('#driverList');

                    driver.find('option').remove();

                    var truck = $('#trucksList');

                    truck.find('option').remove();

                    $.each(jsonResponse.driverMap, function (key, value) {
                        $('<option>').val(key).text(value).appendTo(driver);
                    });

                    $.each(jsonResponse.trucksMap, function (key, value) {
                        $('<option>').val(key).text(value).appendTo(truck);
                    });

                    var truckCode = $("#trucksList").val();
                    if(truckCode != null) {
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
                            $.each(jsonResponse.bodyTypeMap, function (key, value) {

                                $('<option>').val(key).text(value).appendTo(select1);
                                var bodyType = $("#bodyType").val();
                                document.getElementById("bodyType_textfield").value = bodyType;

                            });

                            // For Plate Number Auto-populate
                            $.each(jsonResponse.plateNumberMap, function (key, value) {

                                $('<option>').val(key).text(value).appendTo(select2);
                                var plateNumber = $("#plateNumber").val();
                                document.getElementById("plateNumber_textfield").value = plateNumber;

                            });

                            // For Gross Weight Auto-populate
                            $.each(jsonResponse.grossWeightMap, function (key, value) {

                                $('<option>').val(key).text(value).appendTo(select3);
                                var grossWeight = $("#grossWeight").val();
                                document.getElementById("grossWeight_textfield").value = grossWeight;

                            });
                        });
                    }
                    else{
                        document.getElementById("bodyType_textfield").value = '';
                        document.getElementById("plateNumber_textfield").value = '';
                        document.getElementById("grossWeight_textfield").value = '';
                    }
            });
        });
    });

    $(document).ready(function () {
        $("#createVendorButton").click(function () {
            setThis();
            $("#vendor_vendorName").val('');
            $("#vendor_vendorCode").val('');
        })
    });

    $(document).ready(function () {
        $("#createDriverButton").click(function () {
            var vendorId = $("#vendorListOrigin").val();
            setThis();
            $("#driver_licenseNumber").val('');
            $("#driver_lastName").val('');
            $("#driver_firstName").val('');
            $("#driver_middleName").val('');
            $("#driver_title").val('');

            if (vendorId == "" || null) {
                alert("Select a vendor first");
                return false;
            }
            $("#vendorIdDriver").val(vendorId);
        })
    });

    $(document).ready(function () {
        $("#createTruckButton").click(function () {
            var vendorId = $("#vendorListOrigin").val();
            setThis();
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

    $(document).ready(function(){
        validationForm('dispatchInput', 'finalSaveBtn');
        dateValidationInit();
    });

    //    Read the value in cache
    function getThis() {
        $("#vendorListOrigin").val(localStorage.getItem("vendorListField"));
        $("#driverList").val(localStorage.getItem("driverListField"));
        $("#trucksList").val(localStorage.getItem("trucksListField"));
        $("#dropoff").val(localStorage.getItem("dropoffField"));
    }

    //    Set the value in cache
    function setThis() {
        localStorage.setItem("vendorListField", $("#vendorListOrigin").val());
        localStorage.setItem("driverListField", $("#driverList").val());
        localStorage.setItem("trucksListField", $("#trucksList").val());
        localStorage.setItem("dropoffField", $("#dropoff").val());
    }

    $(document).ready(function () {
        $(window).load(function () {
            getThis();
            var vendorId = $("#vendorListOrigin").val();

            $.getJSON('listVendorDriverAndTrucks', {
                        vendorId: vendorId
                    },

                    function (jsonResponse) {

                        var driver = $('#driverList');

                        driver.find('option').remove();

                        var truck = $('#trucksList');

                        truck.find('option').remove();

                        $.each(jsonResponse.driverMap, function (key, value) {
                            $('<option>').val(key).text(value).appendTo(driver);
                        });

                        $.each(jsonResponse.trucksMap, function (key, value) {
                            $('<option>').val(key).text(value).appendTo(truck);
                        });

                        var truckCode = $("#trucksList").val();
                        if(truckCode != null) {
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
                                        $.each(jsonResponse.bodyTypeMap, function (key, value) {

                                            $('<option>').val(key).text(value).appendTo(select1);
                                            var bodyType = $("#bodyType").val();
                                            document.getElementById("bodyType_textfield").value = bodyType;

                                        });

                                        // For Plate Number Auto-populate
                                        $.each(jsonResponse.plateNumberMap, function (key, value) {

                                            $('<option>').val(key).text(value).appendTo(select2);
                                            var plateNumber = $("#plateNumber").val();
                                            document.getElementById("plateNumber_textfield").value = plateNumber;

                                        });

                                        // For Gross Weight Auto-populate
                                        $.each(jsonResponse.grossWeightMap, function (key, value) {

                                            $('<option>').val(key).text(value).appendTo(select3);
                                            var grossWeight = $("#grossWeight").val();
                                            document.getElementById("grossWeight_textfield").value = grossWeight;

                                        });
                                    });
                        }
                        else{
                            document.getElementById("bodyType_textfield").value = '';
                            document.getElementById("plateNumber_textfield").value = '';
                            document.getElementById("grossWeight_textfield").value = '';
                        }
                    });
            localStorage.clear();
        });
    });
</script>