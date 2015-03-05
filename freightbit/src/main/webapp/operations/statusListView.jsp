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

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <i class="fa fa-list"></i>
                <span class="panel-title">On-Going Booking List</span>
                <span class="pull-right">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="postAjaxHtml('loadSearchBookingPage', 'inputDiv');">
                        <i class="fa fa-search"></i> Search Booking Number
                    </button>
                </sec:authorize>
                </span>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="/viewStatusList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>
                        <td><display:column property="orderDate" title="Booking Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 15%; text-align: center;"> </display:column></td>
                        <%--Order Number--%>
                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 10%; text-align: center;"> </display:column></td>

                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 15%; text-align: center;"> </display:column></td>

                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 20%; text-align: center;"> </display:column></td>
                        <%--ORIGIN--%>
                        <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 6%; text-align: center;"> </display:column></td>
                        <%--DESTINATION--%>
                        <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 6%; text-align: center;"> </display:column></td>
                        <%--Freight Type--%>
                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 6%; text-align: center;"> </display:column></td>

                        <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                            class="tb-font-black"
                                            style="width: 8%; text-align: center;"> </display:column></td>

                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center; width: 8%;"> </display:column></td>

                        <td><display:column property="orderItemStatus" title="Current Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center; width: 15%;"> </display:column></td>

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
            <div class="panel-footer">
                <div class="table-responsive" >
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>Legend: </label></td>
                                <td><i class="fa fa-edit"></i> Update Status </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> PICK UP</strong> <br>The shipment was pulled out from the area of the shipper.</td>
                                <td><strong> POSITIONED</strong> <br>The container was positioned at the area of the shipper for stuffing.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> QUEUE FOR DEPARTURE</strong> <br>The shipment is at the port of origin waiting for departure.</td>
                                <td><strong> IN-TRANSIT</strong> <br>The shipment is on board the cargo vessel and is in-transit to port of destination.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> RETURNED TO ORIGIN</strong> <br>The shipment was not successfully delivered and is to return to origin.</td>
                                <td><strong> ARRIVED</strong> <br>The shipment has arrived at the port of destination.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> DELIVERED</strong> <br>The shipment was delivered to the consignee.</td>
                                <td><strong> IN TRANSIT TO DELIVERY</strong> <br>The truck is in-transit to delivery area.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> QUEUE FOR DELIVERY</strong> <br>The delivery requirement is lined-up for service action.</td>
                                <td><strong> QUEUE FOR PICK UP</strong> <br>The pick-up requirement is lined-up for service action.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> CANCELED</strong> <br>The booking was cancelled.</td>
                                <td><strong> PENDING</strong> <br>The booking request is pending for action.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> CONSOLIDATION</strong> <br>The shipment is for consolidation at Ernest warehouse.</td>
                                <td><strong> IN TRANSIT TO PICK UP</strong> <br>The truck is in-transit to pickup area.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> SERVICE ACCOMPLISHED</strong> <br>The booking request has been accomplished.</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%--<div class="modal-header">
                <center><h4 class="modal-title" id="alertlabel"><li class="fa fa-info"/> Warning</h4></center>
            </div>--%>
            <div class="modal-body">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>--%>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        tableProp('DESTI_ORIG','order',0 ,7, 8, 9, 5, 6, 1);
    });
</script>
