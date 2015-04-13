<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<style>
    .fa-arrow-circle-down {
        cursor: pointer;
        color: #428bca;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-anchor"></i> Freight Plan </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Operations</li>
            <li class="active"><a href="<s:url action='viewSeaFreightList' />"> Freight Plan : Orders </a></li>
            <li class="active">
                <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="#attr.order.orderNo"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip" >
                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                        Freight Plan : Containers
                    </s:if>
                    <s:else>
                        Freight Plan : Items
                    </s:else>
                </s:a>
            </li>
            <li class="active"> Freight Plan</li>
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
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Booking
                    Number</label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Freight Type</label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{order.freightType}" name="book-num"
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
                    <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>

            </div>

            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer
                    </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee
                    </label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{order.consigneeName}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>
            </div>

            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Origin Port</label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{order.originationPort}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Destination Port</label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control" value="%{order.destinationPort}" name="book-num"
                                 disabled="true"></s:textfield>
                </div>
            </div>

            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Departure Date</label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control pickupDate" value="%{order.strPickupDate}"
                                 disabled="true"></s:textfield>
                </div>
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Arrival Date</label>
                <div class="col-lg-4">
                    <s:textfield cssClass="form-control deliveryDate" value="%{order.strDeliveryDate}"
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

            <s:hidden value="%{customer.customerType}" id="bookingClass"/>
        </div>

    </div>

    <s:if test="order.freightType=='SHIPPING'">
        <s:if test="order.modeOfService=='PIER TO PIER'">
            <div class="panel panel-primary" id="focusHere" tabindex="-1">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Freight Plan</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: 1.4em;">
                        <%--<c:out value="${sessionScope.vendorIdPass}" />--%>
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
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Container Size: </label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Item Name: </label>
                            </s:else>
                            <div class="col-lg-10">
                                <s:property value="orderItem.nameSize"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingListClass" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorName" cssClass="form-control addScheduleInput"
                                              emptyOption="true" ></s:select>
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
<%---------------------------------------------------------------------------------------------%>

                <s:if test="scheduleExists == 'TRUE' ">

                    <div class="well">
                        <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> Current Schedules</h4>
                        <display:table id="vesselSchedule" name="vesselSchedule"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter currentSchedulesTable"
                                       style="margin-top: 15px;">
                            <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                        </display:table>
                    </div>
                </s:if>

<%---------------------------------------------------------------------------------------------%>
                    <div class="form-group" style="padding-top: 50px;">
                        <hr>
                        <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> List of Schedules</h4>
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
                    <div class="loadingDiv" style="text-align: center;">
                        Pulling up Schedules. Please Wait.<br/>
                        <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
                    </div>
                    <div class="tableDiv" style="display: none;">
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter listOfSchedules"
                                       style="margin-top: 15px;">
                            <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vendorClass" title="Class" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column title="Action">
                                <a class="icon-action-link" rel="tooltip" title="Set Schedule" data-toggle="modal" data-target="#saveFreightPlanning" onclick="confirmFreightPlan(${orderItem.orderItemId},${vesselSchedule.vesselScheduleId},${vesselSchedule.vendorId})">
                                    <i class="fa fa-arrow-circle-down"></i>
                                </a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="pull-right">
                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip">

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Containers
                                </button>
                            </s:if>
                            <s:else>
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Items
                                </button>
                            </s:else>

                        </s:a>
                    </div>
                </div>

            </div>
        </s:if>
    </s:if>

    <s:if test="order.freightType=='SHIPPING AND TRUCKING'">
        <s:if test="order.modeOfService=='DOOR TO DOOR'">
            <div class="panel panel-primary" id="focusHere" tabindex="-1">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Freight Plan</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: 1.4em;">
                        <%--<c:out value="${sessionScope.vendorIdPass}" />--%>
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
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Container Size: </label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Item Name: </label>
                            </s:else>
                            <div class="col-lg-10">
                                <s:property value="orderItem.nameSize"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingListClass" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorName" cssClass="form-control"
                                              emptyOption="true" ></s:select>
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
    <%---------------------------------------------------------------------------------------------%>
            <%--<s:textfield value="%{scheduleExists}" />--%>
            <s:if test="scheduleExists == 'TRUE' ">

                <div class="well">
                    <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> Current Schedules</h4>
                    <display:table id="vesselSchedule" name="vesselSchedule"
                                   requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter currentSchedulesTable">
                        <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                    </display:table>
                </div>
            </s:if>

    <%---------------------------------------------------------------------------------------------%>
                    <div class="form-group" style="padding-top: 0px;">
                        <hr>
                        <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> List of Schedules</h4>
                    </div>
                    <s:if test="hasActionMessages()">
                        <div class="col-lg-12" id="successDiv">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                            </div>
                        </div>
                    </s:if>
                    <div class="loadingDiv" style="text-align: center;">
                        Pulling up Schedules. Please Wait.<br/>
                        <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
                    </div>
                    <div class="tableDiv" style="display: none;">
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                   requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter listOfSchedules"
                                   style="margin-top: 15px;">
                        <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="vendorClass" title="Class" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <%--<s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                <s:param name="orderItemIdParam"
                                         value="#attr.orderItem.orderItemId">
                                </s:param>
                                <s:param name="vesselScheduleIdParam"
                                         value="#attr.vesselSchedule.vesselScheduleId">
                                </s:param>
                                <s:param name="vendorIdParam"
                                         value="#attr.vesselSchedule.vendorId">
                                </s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip" title="Set Schedule">
                                <i class="fa fa-arrow-circle-down"></i>
                            </s:a>--%>
                            <a class="icon-action-link" rel="tooltip" title="Set Schedule" data-toggle="modal" data-target="#saveFreightPlanning" onclick="confirmFreightPlan(${orderItem.orderItemId},${vesselSchedule.vesselScheduleId},${vesselSchedule.vendorId})">
                                <i class="fa fa-arrow-circle-down"></i>
                            </a>
                        </display:column></td>
                    </display:table>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="pull-right">
                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip" >

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Containers
                                </button>
                            </s:if>
                            <s:else>
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Items
                                </button>
                            </s:else>

                        </s:a>
                    </div>
                </div>

            </div>

            <%--Destination--%>
        </s:if>
        <s:elseif test="order.modeOfService=='DOOR TO PIER'">
            <div class="panel panel-primary" id="focusHere" tabindex="-1">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Freight Plan</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: 1.4em;">
                        <%--<c:out value="${sessionScope.vendorIdPass}" />--%>
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
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Container Size: </label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Item Name: </label>
                            </s:else>
                            <div class="col-lg-10">
                                <s:property value="orderItem.nameSize"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingListClass" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorName" cssClass="form-control"
                                              emptyOption="true" ></s:select>
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
    <%---------------------------------------------------------------------------------------------%>
                <%--<s:textfield value="%{scheduleExists}" />--%>
                <s:if test="scheduleExists == 'TRUE' ">
                <div class="well">
                    <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> Current Schedules</h4>
                    <display:table id="vesselSchedule" name="vesselSchedule"
                                   requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter currentSchedulesTable"
                                   style="margin-top: 15px;">
                        <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                    </display:table>
                </div>
                </s:if>

    <%---------------------------------------------------------------------------------------------%>
                <div class="form-group" style="padding-top: 50px;">
                        <hr>
                        <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> List of Schedules</h4>
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
                    <div class="loadingDiv" style="text-align: center;">
                        Pulling up Schedules. Please Wait.<br/>
                        <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
                    </div>
                    <div class="tableDiv" style="display: none;">
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter listOfSchedules"
                                       style="margin-top: 15px;">
                            <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vendorClass" title="Class" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column title="Action">
                                <%--<s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderItem.orderItemId">
                                    </s:param>
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId">
                                    </s:param>
                                    <s:param name="vendorIdParam"
                                             value="#attr.vesselSchedule.vendorId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip" title="Set Schedule">
                                    <i class="fa fa-arrow-circle-down" data-toggle="modal" data-target="#saveFreightPlanning" onclick="confirmFreightPlan(${},${},${})"></i>
                                </s:a>--%>
                                <a class="icon-action-link" rel="tooltip" title="Set Schedule" data-toggle="modal" data-target="#saveFreightPlanning" onclick="confirmFreightPlan(${orderItem.orderItemId},${vesselSchedule.vesselScheduleId},${vesselSchedule.vendorId})">
                                    <i class="fa fa-arrow-circle-down"></i>
                                </a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="pull-right">
                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip">

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Containers
                                </button>
                            </s:if>
                            <s:else>
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Items
                                </button>
                            </s:else>

                        </s:a>
                    </div>
                </div>

            </div>
        </s:elseif>
        <s:elseif test="order.modeOfService=='PIER TO DOOR'">
            <div class="panel panel-primary" id="focusHere" tabindex="-1">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Freight Plan</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: 1.4em;">
                        <%--<c:out value="${sessionScope.vendorIdPass}" />--%>
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
                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Container Size: </label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label " style="padding-top:0px;font-size: 13px;">Item Name: </label>
                            </s:else>
                            <div class="col-lg-10">
                                <s:property value="orderItem.nameSize"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingListClass" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorName" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
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
    <%---------------------------------------------------------------------------------------------%>

                    <s:if test="scheduleExists == 'TRUE' ">
                    <div class="well">
                        <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> Current Schedules</h4>
                        <hr>
                        <display:table id="vesselSchedule" name="vesselSchedule"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter currentSchedulesTable"
                                       style="margin-top: 15px;">
                            <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                        </display:table>
                    </div>
                    </s:if>

    <%---------------------------------------------------------------------------------------------%>
                    <div class="form-group" style="padding-top: 50px;">
                        <hr>
                        <h4 style="text-align:center;"><i class="fa fa-clock-o"></i> List of Schedules</h4>
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
                    <div class="loadingDiv" style="text-align: center;">
                        Pulling up Schedules. Please Wait.<br/>
                        <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
                    </div>
                    <div class="tableDiv" style="display: none;">
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter listOfSchedules"
                                       style="margin-top: 15px;">
                            <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="vendorClass" title="Class" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column title="Action">
                                <%--<s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderItem.orderItemId">
                                    </s:param>
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId">
                                    </s:param>
                                    <s:param name="vendorIdParam"
                                             value="#attr.vesselSchedule.vendorId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip" title="Set Schedule">
                                    &lt;%&ndash;Choose this vessel...&ndash;%&gt;
                                    <i class="fa fa-arrow-circle-down"></i>
                                </s:a>--%>
                                <a class="icon-action-link" rel="tooltip" title="Set Schedule" data-toggle="modal" data-target="#saveFreightPlanning" onclick="confirmFreightPlan(${orderItem.orderItemId},${vesselSchedule.vesselScheduleId},${vesselSchedule.vendorId})">
                                    <i class="fa fa-arrow-circle-down"></i>
                                </a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="pull-right">
                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip">

                            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Containers
                                </button>
                            </s:if>
                            <s:else>
                                <button type="button" class="btn btn-danger">
                                    <i class="fa fa-chevron-left"></i>
                                    Back to Freight Plan : Items
                                </button>
                            </s:else>

                        </s:a>
                    </div>
                </div>

            </div>
        </s:elseif>
    </s:if>
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

                    <s:form action="addVendorSea" cssClass="form-horizontal" theme="bootstrap">
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Type<span
                                    class="asterisk_red"></span></label>

                            <%--<div class="col-lg-9"></span>
                                <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType"
                                          listKey="key" listValue="value" cssClass="form-control"/>
                            </div>--%>
                            <div class="col-lg-9"></span>
                                <%--<s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType"
                                          listKey="key" listValue="value" cssClass="form-control"/>--%>
                                <s:hidden type="hidden" cssClass="form-control" value="SHIPPING" name="vendor.vendorType"
                                             id="vendor.vendorType"/>
                                <s:textfield cssClass="form-control" value="Shipping" name="vendor_vendorType"
                                             id="vendor_vendorType" disabled="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label" style="padding-top:0px;">Company<span
                                    class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="Company Name" name="vendor.vendorName"
                                             id="vendor.vendorName" required="true"/>
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

                            <%--<s:hidden id="vendorIdHolder" name="vesselSchedule.vendorId" />--%>
                            <s:hidden value="%{#attr.orderItem.orderItemId}" name="orderItemIdParam" />

                            <label>Vendor<span class="asterisk_red"></span></label>

                            <s:select list="vendorShippingListClass" id="vesselSchedule_vendorName" name="vesselSchedule.vendorId"
                                  listKey="vendorId" listValue="vendorName" cssClass="form-control addScheduleInput vendorIdPass"
                                  emptyOption="true" required="true"></s:select>

                            <label>Voyage Number<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control voyageNumber" id="voyageNumber" name="vesselSchedule.voyageNumber" required="true"
                                         maxlength="10" title="Voyage Number will only accept alphanumeric input only e.g. a-z, A-Z, 0-9"
                                         pattern="[a-zA-Z0-9\-]+"/>

                            <label>Vessel<span class="asterisk_red"></span></label>

                            <s:select emptyOption="true" id="vesselList"
                                      value="vesselSchedule.vesselName"
                                      name="vesselSchedule.vesselName"
                                      list="vesselList" listValue="value" listKey="key"
                                      cssClass="form-control vesselName" required="true"/>

                            <label>Departure Date<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control departureDate" id="departureDate"
                                         name="vesselSchedule.departureDate"/>

                            <label>Departure Time<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" id="departureTime"
                                         name="vesselSchedule.departureTime" readonly="true"/>

                            <label>Arrival Date<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" id="arrivalDate" name="vesselSchedule.arrivalDate" readonly="true"/>

                            <label>Arrival Time<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" id="arrivalTime"
                                         name="vesselSchedule.arrivalTime"/>

                            <label>Origin Pier<span class="asterisk_red"></span></label>

                            <s:select emptyOption="true" id="vesselSchedule_originPort"
                                      value="vesselSchedule.originPort"
                                      name="vesselSchedule.originPort"
                                      list="portsList" listValue="value" listKey="key"
                                      cssClass="form-control" required="true"/>

                            <label>Destination Pier<span class="asterisk_red"></span></label>

                            <s:select emptyOption="true" id="vesselSchedule_destinationPort"
                                      value="vesselSchedule.destinationPort"
                                      name="vesselSchedule.destinationPort"
                                      list="portsList" listValue="value" listKey="key"
                                      cssClass="form-control" required="true"/>

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

<!-- Confirm Vendor Modal -->
<div class="modal fade" id="saveFreightPlanning" role="dialog" aria-labelledby="myModalLabel1" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><i class="fa fa-check"></i> Confirm Freight Plan Details</h4>
            </div>

            <div class="modal-body">
                <div id="inputDiv"/>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">

    $("#date").datepicker({dateFormat: 'yy-dd-mm'});

    // Anchor on successDiv on every schedule load
    if ($('#successDiv').length !== 0){
        window.location.href = '#anchorDiv';
    }

    function confirmFreightPlan(orderItemId,vesselScheduleId,vendorId) {
        $.ajax({
            url: 'getConfirmModalAction',
            type: 'POST',
            data: {orderItemIdParam: orderItemId, vesselScheduleIdParam: vesselScheduleId, vendorIdParam: vendorId},
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert('An error occured! ' + thrownError);
            }
        });
    }

    $(document).ready(function(){
    // User must choose a vendor first before adding vessel schedule

        window.location.href = '#focusHere';
        hideVesselSchedule();

        $(".vendorIdPass").change(function() {
            var vendorId = $(".vendorIdPass").val();

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

        /*$("#createSchedule").click(function() {
            *//*var vendorId = $("#operationsBean_vendorList").val();

            if (vendorId == "" || null){
                alert("Select a vendor first");
                $("#operationsBean_vendorList").focus();
                return false;
            }

            $("#vendorIdHolder").val(vendorId);*//*
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
        });*/
        $("#createSchedule").click(function() {
            $("#vesselSchedule_vendorName").val('');
            $("#voyageNumber").val('');
            $("#vesselList").val('');
            $("#departureDate").val('');
            $("#departureTime").val('');
            $("#arrivalDate").val('');
            $("#arrivalTime").val('');
            $("#vesselSchedule_originPort").val('');
            $("#vesselSchedule_destinationPort").val('');
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

</script>