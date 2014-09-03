<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div class="row">
    <div class="col-lg-12">
        <h1><i class="fa fa-anchor"></i> Sea Freight Planning</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Sea Freight Planning : Orders </li>
            <li class="active"> Sea Freight Planning: Items / Containers </li>
            <li class="active"> Sea Freight Planning</li>
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
                <h3 class="panel-title"><i class="fa fa-anchor"></i>
                    <%--<s:property value="%{nameSizeParam}" />--%>
                    <c:out value="${sessionScope.nameSizeParam}"/></h3>
            </div>

            <div class="panel-body">

                <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: -50px;">

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

                    <div class="form-group">


                        <label for="operations.nameSizeParam" class="col-sm-2 control-label">Container Number:</label>

                        <div class="col-sm-10">
                            <div class="form-control">
                                <%--<s:property value="%{nameSizeParam}" />--%>
                                <c:out value="${sessionScope.nameSizeParam}"/>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="operationsBean.vendorList" class="col-sm-2 control-label">Vendor:</label>

                        <div class="col-sm-10" style="width: 80%;">
                            <div style="width:90%;float:left;padding-right:10px;">
                                <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                          id="operationsBean.vendorList"
                                          listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                          emptyOption="true"
                                        ></s:select>
                            </div>
                            <div style="width:5%;float:left;">
                                <a href="#.html" class="btn btn-info">
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </div>

                    </div>

                    <s:submit cssClass="btn btn-default btn-info pull-right" style="position: relative;top: -50px;" name="submit" value="Search"/>

                </s:form>

                <div class="form-group">

                    <hr>
                    <center><h4>List of Schedules</h4></center>
                    <hr>

                </div>

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
                        </s:url>
                        <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip"
                             title="Update Status">
                            Choose this vessel...
                        </s:a>

                    </display:column></td>
                </display:table>

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


                <div class="form-group">

                    <label for="vendorList" class="col-sm-2 control-label">Vendor:</label>

                    <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px; margin-top: -10px;">
                        <s:textfield cssClass="form-control" value="%{orderItem.vendorDestination}" disabled="true" />
                    </div>

                </div>

                <div class="form-group">

                    <label for="driver" class="col-sm-2 control-label">Driver:</label>

                    <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px; margin-top: -10px;">
                        <s:textfield cssClass="form-control" value="%{orderItem.driverDestination}" disabled="true" />
                    </div>

                </div>

                <div class="form-group">

                    <label for="truck" class="col-sm-2 control-label">Truck:</label>

                    <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px; margin-top: -10px;">
                        <s:textfield cssClass="form-control" value="%{orderItem.truckDestination}" disabled="true" />
                    </div>

                </div>

                <div class="form-group">

                    <label for="pickup" class="col-sm-2 control-label">Pickup Date:</label>

                    <div class="col-sm-10" style="padding: 10px 0px; width: 77.5%; position: relative; left: 15px; margin-top: -10px;">
                        <s:textfield cssClass="form-control" value="%{orderItem.finalDeliveryDate}" disabled="true" />
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    $("#date").datepicker({dateFormat: 'yy-dd-mm'});
</script>