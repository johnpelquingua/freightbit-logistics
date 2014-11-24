<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Shipment Monitoring </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
            <li class="active"> On-Going Booking List</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> On-Going Booking List</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="/viewStatusList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>
                        <td><display:column property="orderDate" title="Booking Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--Order Number--%>
                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--ORIGIN--%>
                        <td><display:column property="originationPort" title="Origin <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--DESTINATION--%>
                        <td><display:column property="destinationPort" title="Destination <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--Freight Type--%>
                        <td><display:column property="freightType" title="Freight Type <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="serviceRequirement" title="Service Requirement <i class='fa fa-sort' />"
                                            class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="modeOfService" title="Service Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column title="Action">
                            <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewStatusListItemsUrl}" rel="tooltip"
                                 title="Update Status">
                                <%--<img src="../includes/images/edit-booking.png" class="icon-action circ-icon"
                                style="border-radius:25%;">--%>
                                <i class="fa fa-edit"></i>
                            </s:a>

                        </display:column></td>

                    </display:table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        tableProp('DESTI_ORIG','order',0 ,7, 8, 9, 5, 6);
    });
</script>