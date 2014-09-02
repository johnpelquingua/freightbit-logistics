<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">

    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Seafreight Operations </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Seafreight Operations </li>
        </ol>

    </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <display:table id="order" name="orders"
                                       requestURI="/viewFreightList.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                       style="margin-top: 15px;">
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Sea Freight Operations List

                </h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="/viewFreightList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                   style="margin-top: 15px;">

                        <td><display:column property="orderNo" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                            <td><display:column title="Action">
                                <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                    <s:param name="orderIdParam"
                                             value="#attr.order.orderId"></s:param>
                                    <s:param name="orderNoParam"
                                             value="#attr.order.orderNo"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                                     title="Update Status">
                                    <i class="fa fa-pencil"></i>
                                </s:a>
                            </display:column></td>
                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="serviceRequirement" title="Service Requirement <i class='fa fa-sort' />"
                                            class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="modeOfService" title="Service Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column title="Action">
                            <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                                 title="Update Status">
                                <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
                            </s:a>

                        </display:column></td>

                    </display:table>
                </div>
            </div>

        </div>
    </div>

</div>

