<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-truck"></i> Dispatch Plan : Orders </h1>
                </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Dispatch Plan : Orders </li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading" style="margin-bottom: 1.5em;">
                <h3 class="panel-title">
                    <i class="fa fa-list"></i> Dispatch Plan List
                </h3>
            </div>

            <!-- Main Nav tabs -->
            <div class="row padding-10-lr">
                <ul class="nav nav-tabs center-text" role="tablist">
                    <li class="active col-md-4 padding-0-r" id="ori">
                        <a href="#oriTab" role="tab" data-toggle="tab"><i class="fa fa-truck"></i> Origin</a>
                    </li>
                    <li class="col-md-4 padding-0-lr" id="truck">
                        <a href="#truckTab" role="tab" data-toggle="tab"><i class="fa fa-automobile"></i> Trucking</a>
                    </li>
                    <li id="des" class="col-md-4 padding-0-l">
                        <a href="#desTab" role="tab" data-toggle="tab"><i class="fa fa-flip-horizontal fa-truck"></i> Destination</a>
                    </li>
                </ul>
            </div>

            <div class="tab-content">
                <%--ORIGIN TABS--%>
                <div class="tab-pane fade in active" id="oriTab">
                    <div class="padding-10-top">
                        <s:form action="changeTruckOrigin" theme="bootstrap">
                            <label class="col-lg-2 control-label">Sort by Origin :</label>
                            <div class="col-lg-3">
                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                          id="select1" list="portsList" listKey="key"
                                          listValue="value" name="originCityTruck" emptyOption="true" required="true"
                                          onchange="$(this).closest('form').submit()"
                                        />
                            </div>
                        </s:form>
                    </div>
                    <ul class="nav nav-tabs center-text padding-0-bot" role="tablist" style="clear:both;">
                        <li class="active col-md-3 padding-0-r" id="fclOri">
                            <a href="#fclOriTab" role="tab" data-toggle="tab">Full Container Load (FCL)</a>
                        </li>
                        <li class="col-md-3 padding-0-lr" id="lclOri">
                            <a href="#lclOriTab" role="tab" data-toggle="tab">Less Container Load (LCL)</a>
                        </li>
                        <li class="col-md-3 padding-0-lr" id="lcuOri">
                            <a href="#lcuOriTab" role="tab" data-toggle="tab">Loose Cargo Load (LCU)</a>
                        </li>
                        <li class="col-md-3 padding-0-lr" id="rcuOri">
                            <a href="#rcuOriTab" role="tab" data-toggle="tab">Rolling Cargo Load (RCU)</a>
                        </li>
                        <%--<li id="ftlOri">
                            <a href="#ftlTab" role="tab" data-toggle="tab">FTL</a>
                        </li>
                        <li id="ltlOri">
                            <a href="#ltlTab" role="tab" data-toggle="tab">LTL</a>
                        </li>--%>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="fclOriTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="fclTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="fclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="lclOriTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="lclTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="lclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td>
                                            <display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam"
                                                         value="#attr.order.orderId"></s:param>
                                                <s:param name="orderNoParam"
                                                         value="#attr.order.orderNo"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                            </display:column>
                                        </td>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="lcuOriTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="lcuTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="lcuTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="rcuOriTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="rcuTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="rcuTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <%--<div class="tab-pane fade" id="ftlTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="ftlTable"
                                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                                   class="table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells: hide;">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        &lt;%&ndash;<td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>&ndash;%&gt;
                                        &lt;%&ndash;<td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>&ndash;%&gt;
                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING'">
                                                <i class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
                                                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                                     title="Update Status">
                                                    <i class="fa fa-edit" id="status"></i>
                                                </s:a>

                                                <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                    <i class="fa fa-info-circle"></i>
                                                </s:a>
                                            </s:else>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="ltlTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="ltlTable"
                                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                                   class="table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells: hide;">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        &lt;%&ndash;<td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>&ndash;%&gt;
                                        &lt;%&ndash;<td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>&ndash;%&gt;
                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING'">
                                                <i class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
                                                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                                     title="Update Status">
                                                    <i class="fa fa-edit" id="status"></i>
                                                </s:a>

                                                <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                    <i class="fa fa-info-circle"></i>
                                                </s:a>
                                            </s:else>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>

                        </div>--%>
                    </div>
                </div>

                <%--TRUCKING TABS--%>
                <div class="tab-pane fade" id="truckTab">
                    <div class="padding-10-top">
                        <s:form action="changeTruckOrigin" theme="bootstrap">
                            <label class="col-lg-2 control-label">Sort by Location :</label>
                            <div class="col-lg-3">
                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                          id="select1" list="portsList" listKey="key"
                                          listValue="value" name="originCityTruck" emptyOption="true" required="true"
                                          onchange="$(this).closest('form').submit()"
                                        />
                            </div>
                        </s:form>
                    </div>

                    <ul class="nav nav-tabs padding-10-lr center-text" role="tablist" style="clear:both;">
                        <li class="active col-md-6 padding-0-lr" id="ftlOri">
                            <a href="#ftlTab" role="tab" data-toggle="tab">Full Truck Load (FTL)</a>
                        </li>
                        <li class="col-md-6 padding-0-lr" id="ltlOri">
                            <a href="#ltlTab" role="tab" data-toggle="tab">Less Truck Load (LTL)</a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <div class="tab-pane fade in active" id="ftlTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="ftlTable"
                                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                                   class="table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells: hide;">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <%--<td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <%--<td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING'">
                                                <i class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
                                                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                                     title="Set Vendor">
                                                    <i class="fa fa-tasks" id="status"></i>
                                                </s:a>

                                                <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                    <i class="fa fa-info-circle"></i>
                                                </s:a>
                                            </s:else>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="ltlTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="ltlTable"
                                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                                   class="table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells: hide;">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <%--<td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <%--<td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING'">
                                                <i class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
                                                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                                     title="Set Vendor">
                                                    <i class="fa fa-tasks" id="status"></i>
                                                </s:a>

                                                <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                    <i class="fa fa-info-circle"></i>
                                                </s:a>
                                            </s:else>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

                <%--DESTINATION TABS--%>
                <div class="tab-pane fade" id="desTab">
                    <div class="padding-10-top">
                        <s:form action="changeTruckDestination" theme="bootstrap">
                            <label class="col-lg-2 control-label">Sort by Destination :</label>
                            <div class="col-lg-3">
                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                          id="select2" list="portsList" listKey="key"
                                          listValue="value" name="destinationCityTruck" emptyOption="true" required="true"
                                          onchange="$(this).closest('form').submit()"
                                        />
                            </div>
                        </s:form>
                    </div>
                    <ul class="nav nav-tabs center-text padding-0-bot" role="tablist" style="clear:both;">
                        <li class="active col-md-3 padding-0-r" id="fclDes">
                            <a href="#fclDesTab" role="tab" data-toggle="tab">Full Container Load (FCL)</a>
                        </li>
                        <li class="col-md-3 padding-0-lr" id="lclDes">
                            <a href="#lclDesTab" role="tab" data-toggle="tab">Less Container Load (LCL)</a>
                        </li>
                        <li class="col-md-3 padding-0-lr" id="lcuDes">
                            <a href="#lcuDesTab" role="tab" data-toggle="tab">Loose Cargo Load (LCU)</a>
                        </li>
                        <li class="col-md-3 padding-0-l" id="rcuDes">
                            <a href="#rcuDesTab" role="tab" data-toggle="tab">Rolling Cargo Load (RCU)</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="fclDesTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="fclTruckTableDes"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="fclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="lclDesTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="lclTruckTableDes"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="lclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam"
                                                         value="#attr.order.orderId"></s:param>
                                                <s:param name="orderNoParam"
                                                         value="#attr.order.orderNo"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="lcuDesTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="lcuTruckTableDes"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="lcuTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="rcuDesTab">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <display:table id="order" name="rcuTruckTableDes"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="rcuTable table table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column title="Action">
                                            <s:url var="viewFreightItemListUrl" action="viewInlandFreightItemList">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewFreightItemListUrl}" rel="tooltip"
                                                 title="Set Vendor">
                                                <i class="fa fa-tasks"></i>
                                            </s:a>

                                            <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </display:column></td>

                                    </display:table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class="fa fa-stop" style="color: #d9534f;"></i> Cancelled</td>
                                <td><i class="fa fa-stop" style="color: #428bca;"></i> On Going</td>
                                <td style="width: 20%;"><i class="fa fa-stop" style="color: #f0ad4e;"></i> Pending / Incomplete</td>
                                <td><i class="fa fa-stop" style="color: #5cb85c;"></i> Approved / Newly Added</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i class='fa fa-anchor'></i> Shipping</td>
                                <td><i class='fa fa-truck' ></i> Trucking</td>
                                <td><i class='fa fa-info-circle' ></i> Information</td>
                                <td><i class='fa fa-trash-o'></i> Delete</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i class='fa fa-tasks' ></i> Set Vendor</td>
                                <td><i class='fa fa-print' ></i> Print</td>
                                <td><i class='fa fa-check' ></i> Approve</td>
                                <td><i class='fa fa-times' ></i> Cancel</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        tablePropClass('NONE', 'lclTable', 7, 4, 5, 6, 0, 0);
        tablePropClass('NONE', 'fclTable', 7, 4, 5, 6, 0, 0);
        tablePropClass('NONE', 'lcuTable', 7, 4, 5, 6, 0, 0);
        tablePropClass('NONE', 'rcuTable', 7, 4, 5, 6, 0, 0);
    });

    $(function () { $('#myTab a:first').tab('show') });

    $(function() {
        $('a[data-toggle="tab"]').on('click', function (e) { localStorage.setItem('lastTab', $(e.target).attr('href')); });
        var lastTab = localStorage.getItem('lastTab');
        if (lastTab) { $('a[href="'+lastTab+'"]').click(); }
    });
</script>