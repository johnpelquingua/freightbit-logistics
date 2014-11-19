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
        var tableTr = $('#order tbody tr');
        for(var i = 0; i < tableTr.size(); i++){
            var statusColumn = $('#order tbody tr td:nth-child(7)').eq(i).text(),
                    typeColumn = $('#order tbody tr td:nth-child(4)').eq(i),
                    reqColumn = $('#order tbody tr td:nth-child(5)').eq(i),
                    modeColumn = $('#order tbody tr td:nth-child(6)').eq(i);

            // ROW COLORS
            if(statusColumn == 'PENDING' || statusColumn == 'INCOMPLETE'){
                tableTr.eq(i).css('background-color', '#fcf8e3');
            }else if(statusColumn == 'DISAPPROVED' || statusColumn == 'CANCELLED'){
                tableTr.eq(i).css('background-color', '#f2dede');
            }else if(statusColumn == 'APPROVED' || statusColumn == 'SERVICE ACCOMPLISHED'){
                tableTr.eq(i).css('background-color', '#dff0d8');
            }else if(statusColumn == 'ON GOING'){
                tableTr.eq(i).css('background-color', '#bce8f1');
            }

            // TYPE ICONS
            if(typeColumn.text() == 'SHIPPING AND TRUCKING'){
                typeColumn.empty().append("<i class='fa fa-anchor' /> <i class='fa fa-truck' />");
            }else if(typeColumn.text() == 'SHIPPING'){
                typeColumn.empty().append("<i class='fa fa-anchor' />");
            }else if(typeColumn.text() == 'TRUCKING'){
                typeColumn.empty().append("<i class='fa fa-truck' />");
            }

            // REQT COLUMN
            if(reqColumn.text() == 'FULL CARGO LOAD' || reqColumn.text() == 'FULL CONTAINER LOAD'){
                reqColumn.empty().append('FCL');
            }else if(reqColumn.text() == 'FULL TRUCK LOAD'){
                reqColumn.empty().append('FTL');
            }else if(reqColumn.text() == 'LESS TRUCK LOAD'){
                reqColumn.empty().append('LTL');
            }else if(reqColumn.text() == 'LESS CARGO LOAD' || reqColumn.text() == 'LESS CONTAINER LOAD'){
                reqColumn.empty().append('LCL');
            }else if(reqColumn.text() == 'LOOSE CARGO LOAD'){
                reqColumn.empty().append('LCU');
            }else if(reqColumn.text() == 'ROLLING CARGO LOAD'){
                reqColumn.empty().append('RCU');
            }

            // MODE COLUMN
            if(modeColumn.text() == 'DOOR TO DOOR'){
                modeColumn.empty().append('DD');
            }else if(modeColumn.text() == 'DOOR TO PIER' || modeColumn.text() == 'DOOR TO PORT'){
                modeColumn.empty().append('DP');
            }else if(modeColumn.text() == 'PIER TO DOOR' || modeColumn.text() == 'PORT TO DOOR'){
                modeColumn.empty().append('PD');
            }else if(modeColumn.text() == 'PIER TO PIER' || modeColumn.text() == 'PORT TO PORT'){
                modeColumn.empty().append('PP')
            }else if(modeColumn.text() == 'PICKUP'){
                modeColumn.empty().append('P')
            }else if(modeColumn.text() == 'DELIVERY'){
                modeColumn.empty().append('D')
            }else if(modeColumn.text() == 'INTER-WAREHOUSE'){
                modeColumn.empty().append('IW')
            }
        }
    });
</script>

