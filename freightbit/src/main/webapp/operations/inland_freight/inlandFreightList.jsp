<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-truck"></i> Dispatch Plan : Orders </h1>
                </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Operations</li>
            <li class="active"> Dispatch Plan : Orders </li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading" style="margin-bottom: 1.5em;">
                <i class="fa fa-list"></i>
                <span class="panel-title">Freight Plan List</span>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#bookingNumModal" onclick="postAjaxHtml('bookingNumSearchDispatch', 'bookingNumInputDiv');">
                        <i class="fa fa-search"></i> Search Order Number
                    </button>
                </span>
            </div>

            <!-- Main Nav tabs -->
            <div class="row padding-10-lr">
                <ul class="nav nav-tabs center-text" role="tablist">
                    <li class="active col-md-4 padding-0-r" id="ori">
                        <a href="#oriTab" role="tab" data-toggle="tab"><i class="fa fa-truck"></i> Origin</a>
                    </li>
                    <li class="col-md-4 padding-0-lr" id="truck">
                        <a href="#truckTab" role="tab" data-toggle="tab"><i class="fa fa-flip-horizontal fa-truck"></i> Trucking</a>
                    </li>
                    <li id="des" class="col-md-4 padding-0-l">
                        <a href="#desTab" role="tab" data-toggle="tab"><i class="fa fa-flip-horizontal fa-truck"></i> Destination</a>
                    </li>
                </ul>
            </div>

            <div class="tab-content">
                <%--ORIGIN TABS--%>
                <div class="tab-pane fade in active" id="oriTab">
                    <center style="padding-top: 15px; padding-bottom: 10px;"><i><span style="color: red;">*</span> Service Freight Type: <b>Shipping and Trucking</b> -- and -- Service Mode: <b>Door to Door</b> / <b>Door to Pier</b> only</i></center>
                    <div class="padding-10-top">
                        <s:form action="changeTruckOrigin" theme="bootstrap">
                            <label class="col-lg-2 col-lg-offset-2 control-label">Filter by Origin :</label>
                            <div class="col-lg-3">
                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                          id="select1" list="portsList" listKey="key"
                                          listValue="value" name="originCityTruck" emptyOption="true" required="true"
                                          onchange="$(this).closest('form').submit()"
                                        />
                            </div>
                            <a href="viewInlandFreightList" class="btn btn-primary" id ="groups-btn">Display All</a>
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
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="fclOriTab">
                            <div class="panel-body">
                                <div class="table-responsive table-responsive-scroll">
                                    <display:table id="order" name="fclTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="fclTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="plateNumberOri" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                <i style="color: red;" class="fa fa-ban"></i>                                            </s:if>
                                            <s:else>
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
                                            </s:else>
                                        </display:column></td>
                                        </sec:authorize>
                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="lclOriTab">
                            <div class="panel-body">
                                <div class="table-responsive table-responsive-scroll">
                                    <display:table id="order" name="lclTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="lclTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="plateNumberOri" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                        <td>
                                            <display:column title="Action">
                                                <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                    <i style="color: red;" class="fa fa-ban"></i>
                                                </s:if>
                                                <s:else>
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
                                                </s:else>
                                            </display:column>
                                        </td>
                                        </sec:authorize>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="lcuOriTab">
                            <div class="panel-body">
                                <div class="table-responsive table-responsive-scroll">
                                    <display:table id="order" name="lcuTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="lcuTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="plateNumberOri" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                <i style="color: red;" class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
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
                                            </s:else>
                                        </display:column></td>
                                            </sec:authorize>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="rcuOriTab">
                            <div class="panel-body">
                                <div class="table-responsive table-responsive-scroll">
                                    <display:table id="order" name="rcuTruckTable"
                                                   requestURI="/viewFreightList.action" pagesize="10"
                                                   class="rcuTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells:hide !important">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="plateNumberOri" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>

                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                <i style="color: red;" class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
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
                                            </s:else>
                                        </display:column></td>
                                            </sec:authorize>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <%--TRUCKING TABS--%>
                <div class="tab-pane fade" id="truckTab">
                    <div class="padding-10-top">
                        <s:form action="changeTruckOrigin" theme="bootstrap">
                            <label class="col-lg-2 col-lg-offset-2 control-label">Filter by Location :</label>
                            <div class="col-lg-3">
                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                          id="select1" list="portsList" listKey="key"
                                          listValue="value" name="originCityTruck" emptyOption="true" required="true"
                                          onchange="$(this).closest('form').submit()"
                                        />

                            </div>
                            <a href="viewInlandFreightList" class="btn btn-primary" id ="groups-btn">Display All</a>
                        </s:form>
                    </div>
                    <div class="pull-right">
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
                                <div class="table-responsive table-responsive-scroll">
                                    <display:table id="order" name="ftlTable"
                                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                                   class="ftlTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells: hide;">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 15%;"> </display:column></td>
                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 20%;"> </display:column></td>
                                        <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 25%;"> </display:column></td>
                                        <%--<td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <%--<td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 15%;"> </display:column></td>
                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 15%;"> </display:column></td>
                                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                <i style="color: red;" class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
                                                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                                     title="Set Vendor">
                                                    <i class="fa fa-tasks" id="status"></i>
                                                </s:a>

                                                <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                    <i class="fa fa-info-circle"></i>
                                                </s:a>
                                            </s:else>
                                        </display:column></td>
                                            </sec:authorize>

                                    </display:table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="ltlTab">
                            <div class="panel-body">
                                <div class="table-responsive table-responsive-scroll">
                                    <display:table id="order" name="ltlTable"
                                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                                   class="ltlTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                   style="margin-top: 15px;empty-cells: hide;">

                                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 15%;"> </display:column></td>
                                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 20%;"> </display:column></td>
                                        <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 25%;"> </display:column></td>
                                        <%--<td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <%--<td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 15%;"> </display:column></td>
                                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;width: 15%;"> </display:column></td>
                                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                        <td><display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                <i style="color: red;" class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
                                                <s:url var="viewInlandFreightItemListUrl" action="viewInlandFreightItemList">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInlandFreightItemListUrl}" rel="tooltip"
                                                     title="Set Vendor">
                                                    <i class="fa fa-tasks" id="status"></i>
                                                </s:a>

                                                <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderInland">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                    <i class="fa fa-info-circle"></i>
                                                </s:a>
                                            </s:else>
                                        </display:column></td>
                                            </sec:authorize>

                                    </display:table>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

                <%--DESTINATION TABS--%>
                <div class="tab-pane fade" id="desTab">

                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT')">

                        <center style="padding-top: 15px; padding-bottom: 10px;"><i><span style="color: red;">*</span> Service Freight Type: <b>Shipping and Trucking</b> -- and -- Service Mode: <b>Door to Door</b> / <b>Pier to Door</b> only</i></center>
                        <div class="padding-10-top">
                            <s:form action="changeTruckDestination" theme="bootstrap">
                                <label class="col-lg-2 col-lg-offset-2 control-label">Filter by Destination :</label>
                                <div class="col-lg-3">
                                    <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                              id="select2" list="portsList" listKey="key"
                                              listValue="value" name="destinationCityTruck" emptyOption="true" required="true"
                                              onchange="$(this).closest('form').submit()" />
                                </div>
                                <a href="viewInlandFreightList" class="btn btn-primary" id ="groups-btn">Display All</a>
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
                                    <div class="table-responsive table-responsive-scroll">
                                        <display:table id="order" name="fclTruckTableDes"
                                                       requestURI="/viewFreightList.action" pagesize="10"
                                                       class="fclTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                       style="margin-top: 15px;empty-cells:hide !important">

                                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="plateNumberDes" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                                class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>
                                            <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                            <td><display:column title="Action">
                                                <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                    <i style="color: red;" class="fa fa-ban"></i>
                                                </s:if>
                                                <s:else>
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
                                                </s:else>
                                            </display:column></td>
                                            </sec:authorize>

                                        </display:table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="lclDesTab">
                                <div class="panel-body">
                                    <div class="table-responsive table-responsive-scroll">
                                        <display:table id="order" name="lclTruckTableDes"
                                                       requestURI="/viewFreightList.action" pagesize="10"
                                                       class="lclTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                       style="margin-top: 15px;empty-cells:hide !important">

                                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="plateNumberDes" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                                class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>
                                            <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                            <td><display:column title="Action">
                                                <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                    <i style="color: red;" class="fa fa-ban"></i>
                                                </s:if>
                                                <s:else>
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
                                                </s:else>
                                            </display:column></td>
                                            </sec:authorize>

                                        </display:table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="lcuDesTab">
                                <div class="panel-body">
                                    <div class="table-responsive table-responsive-scroll">
                                        <display:table id="order" name="lcuTruckTableDes"
                                                       requestURI="/viewFreightList.action" pagesize="10"
                                                       class="lcuTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                       style="margin-top: 15px;empty-cells:hide !important">

                                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="plateNumberDes" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                                class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>
                                            <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                            <td><display:column title="Action">
                                                <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                    <i style="color: red;" class="fa fa-ban"></i>
                                                </s:if>
                                                <s:else>
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
                                                </s:else>
                                            </display:column></td>
                                            </sec:authorize>

                                        </display:table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="rcuDesTab">
                                <div class="panel-body">
                                    <div class="table-responsive table-responsive-scroll">
                                        <display:table id="order" name="rcuTruckTableDes"
                                                       requestURI="/viewFreightList.action" pagesize="10"
                                                       class="rcuTable table table-scroll table-hover table-bordered text-center tablesorter table-condensed"
                                                       style="margin-top: 15px;empty-cells:hide !important">

                                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="plateNumberDes" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="serviceRequirement" title="Rqt. <i class='fa fa-sort' />"
                                                                class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>

                                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                                style="text-align: center;"> </display:column></td>
                                            <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                            <td><display:column title="Action">
                                                <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                    <i style="color: red;" class="fa fa-ban"></i>
                                                </s:if>
                                                <s:else>
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
                                                </s:else>
                                            </display:column></td>
                                            </sec:authorize>

                                        </display:table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </sec:authorize>

                </div>
            </div>

            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <label>LEGEND:</label>
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #d9534f;"></i> Cancelled <br>
                            <i class='fa fa-anchor'></i> Shipping <br>
                            <i class='fa fa-tasks' ></i> Set Vendor<br>
                            <i style="color: red;" class='fa fa-ban'></i> Actions Disabled
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #428bca;"></i> On Going <br>
                            <i class='fa fa-truck' ></i> Trucking <br>
                            <i class='fa fa-print' ></i> Print
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #f0ad4e;"></i> Pending / Incomplete <br>
                            <i class='fa fa-info-circle' ></i> Information <br>
                            <i class='fa fa-check' ></i> Approve
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #5cb85c;"></i> Approved / Newly Added <br>
                            <i class='fa fa-trash-o'></i> Delete <br>
                            <i class='fa fa-times' ></i> Cancel <br>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="bookingNumModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" style="padding: 0px;">
                <div id="bookingNumInputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        tablePropClass('NONE', 'lclTable', 8, 4, 6, 7, 0, 0);
        tablePropClass('NONE', 'fclTable', 8, 4, 6, 7, 0, 0);
        tablePropClass('NONE', 'lcuTable', 8, 4, 6, 7, 0, 0);
        tablePropClass('NONE', 'rcuTable', 8, 4, 6, 7, 0, 0);
        tablePropClass('NONE', 'ftlTable', 5, 0, 0, 4, 0, 0);
        tablePropClass('NONE', 'ltlTable', 5, 0, 0, 4, 0, 0);
    });

    $(function () { $('#myTab a:first').tab('show') });

    $(function() {
        $('a[data-toggle="tab"]').on('click', function (e) { localStorage.setItem('lastTab', $(e.target).attr('href')); });
        var lastTab = localStorage.getItem('lastTab');
        if (lastTab) { $('a[href="'+lastTab+'"]').click(); }
    });
</script>