<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-info-circle"></i> View Information : <s:property value="%{order.orderNumber}" /> </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewSeaFreightList' />"> Freight Plan : Orders </a></li>
            <li class="active">
                <%--<a href="<s:url action='viewSeaFreightList' />"> Sea Freight Planning : Containers / Items </a>--%>
                <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="#attr.order.orderNo"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                     title="Update Status">

                    <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                        Freight Plan : Containers
                    </s:if>
                    <s:else>
                        Freight Plan : Items
                    </s:else>
                </s:a>
            </li>
            <li class="active"> View Planning Information</li>
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
                Name</label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num"
                             disabled="true"></s:textfield>
            </div>
            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee
                Name</label>
            <div class="col-lg-4">
                <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num"
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

<div class="panel panel-primary">
    <div class="panel-heading">
        <i class="fa fa-anchor"></i>
        <span class="panel-title">Freight Plan</span>
        <%--<span class="pull-right">--%>
            <%--<a class="btn btn-primary new-booking" onclick="location.href='loadAddDriverPage'">--%>
                <%--<i class="fa fa-pencil"></i> Edit--%>
            <%--</a>--%>
        <%--</span>--%>

        <s:url var="viewFreightPlanningUrl" action="viewEditSeaFreight">
            <s:param name="orderItemIdParam"
                     value="#attr.orderItem.orderItemId">
            </s:param>
            <s:param name="nameSizeParam"
                     value="#attr.orderItem.nameSizeParam">
            </s:param>
        </s:url>
        <span class="pull-right">
        <s:a cssClass="btn btn-primary new-booking" href="%{viewFreightPlanningUrl}" rel="tooltip"
             title="Update Status" >
            <i class="fa fa-edit">Edit</i>
        </s:a>
        </span>
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

    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-truck"></i>
                    <span class="panel-title"> Dispatch Plan : Origin</span>
                    <s:url var="viewFreightPlanningUrl" action="viewEditInlandFreightOrigin">
                        <s:param name="orderItemIdParam"
                                 value="#attr.orderItem.orderItemId">
                        </s:param>
                        <s:param name="nameSizeParam"
                                 value="#attr.orderItem.nameSizeParam">
                        </s:param>
                    </s:url>
                    <span class="pull-right">
                    <s:a cssClass="btn btn-primary new-booking" href="%{viewFreightPlanningUrl}" rel="tooltip"
                         title="Update Status" >
                        <i class="fa fa-edit">Edit</i>
                    </s:a>
                    </span>
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

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>

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

            </div>
        </div>


        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-truck"></i>
                    <span class="panel-title"> Dispatch Plan : Destination</span>
                    <s:url var="viewFreightPlanningUrl" action="viewEditInlandFreightDestination">
                        <s:param name="orderItemIdParam"
                                 value="#attr.orderItem.orderItemId">
                        </s:param>
                        <s:param name="nameSizeParam"
                                 value="#attr.orderItem.nameSizeParam">
                        </s:param>
                    </s:url>
                    <span class="pull-right">
                    <s:a cssClass="btn btn-primary new-booking" href="%{viewFreightPlanningUrl}" rel="tooltip"
                         title="Update Status" >
                        <i class="fa fa-edit">Edit</i>
                    </s:a>
                    </span>
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

                        <label class="col-lg-2 control-label" style="padding-top:0px;">Dropoff Date:</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.finalDeliveryDate}" disabled="true" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

<div class="pull-right">
    <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
        <s:param name="orderIdParam"
                 value="#attr.order.orderId"></s:param>
        <s:param name="orderNoParam"
                 value="#attr.order.orderNo"></s:param>
    </s:url>
    <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
         title="Update Status">

        <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
            <button type="button" class="btn btn-default">
                Back to Freight Plan : Containers
            </button>
        </s:if>
        <s:else>
            <button type="button" class="btn btn-default">
                Back to Freight Plan : Items
            </button>
        </s:else>

    </s:a>
</div>




</div>


</div>