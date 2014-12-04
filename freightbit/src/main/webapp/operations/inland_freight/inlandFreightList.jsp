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

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" style="clear:both; padding: 5px; padding-bottom: 0px;">
                <li class="active" id="out">
                    <a href="#fclTab" role="tab" data-toggle="tab">Full Container Load (FCL)</a>
                </li>
                <li id="in">
                    <a href="#lclTab" role="tab" data-toggle="tab">Less Container Load (LCL)</a>
                </li>
                <li id="fiOut">
                    <a href="#lcuTab" role="tab" data-toggle="tab">Loose Cargo Load (LCU)</a>
                </li>
                <li id="fiIn">
                    <a href="#rcuTab" role="tab" data-toggle="tab">Rolling Cargo Load (RCU)</a>
                </li>
            </ul>

            <div class="tab-content">

                <div class="tab-pane fade in active" id="fclTab">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <display:table id="order" name="fclTable"
                                           requestURI="/viewFreightList.action" pagesize="10"
                                           class="fclTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
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
                                         title="Update Status">
                                        <i class="fa fa-edit"></i>
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

                <div class="tab-pane fade" id="lclTab">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <display:table id="order" name="lclTable"
                                           requestURI="/viewFreightList.action" pagesize="10"
                                           class="lclTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
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
                                         title="Update Status">
                                        <i class="fa fa-edit"></i>
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

                <div class="tab-pane fade" id="lcuTab">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <display:table id="order" name="lcuTable"
                                           requestURI="/viewFreightList.action" pagesize="10"
                                           class="lcuTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
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
                                         title="Update Status">
                                        <i class="fa fa-edit"></i>
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

                <div class="tab-pane fade" id="rcuTab">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <display:table id="order" name="rcuTable"
                                           requestURI="/viewFreightList.action" pagesize="10"
                                           class="rcuTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
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
                                         title="Update Status">
                                        <i class="fa fa-edit"></i>
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
        tablePropClass('NONE', 'lclTable', 7, 4, 5, 6, 0, 0);
        tablePropClass('NONE', 'fclTable', 7, 4, 5, 6, 0, 0);
        tablePropClass('NONE', 'lcuTable', 7, 4, 5, 6, 0, 0);
        tablePropClass('NONE', 'rcuTable', 7, 4, 5, 6, 0, 0);
    })

    $(function () {
        $('#myTab a:first').tab('show')
    });

    $(function() {
        //for bootstrap 3 use 'shown.bs.tab' instead of 'shown' in the next line
        $('a[data-toggle="tab"]').on('click', function (e) {
            localStorage.setItem('lastTab', $(e.target).attr('href'));
        });

        //go to the latest tab, if it exists:
        var lastTab = localStorage.getItem('lastTab');

        if (lastTab) {
            $('a[href="'+lastTab+'"]').click();

        }
    });
</script>