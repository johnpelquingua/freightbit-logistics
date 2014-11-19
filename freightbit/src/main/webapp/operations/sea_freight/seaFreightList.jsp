<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Freight Plan : Orders </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Freight Plan : Orders </li>
        </ol>
    </div>
</div>

<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>
                    Freight Plan List
                </h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="viewSeaFreightList.action" pagesize="10"
                                   class="table table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;empty-cells: hide;">

                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                            class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <s:if test="#attr.order.orderStatus=='PENDING'">
                                <i class="fa fa-ban"></i>
                            </s:if>
                            <s:else>
                                <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                    <s:param name="orderIdParam"
                                             value="#attr.order.orderId"></s:param>
                                    <s:param name="orderNoParam"
                                             value="#attr.order.orderNo"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
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
        tableProp('','order', 7, 4, 5, 6);
    })
</script>