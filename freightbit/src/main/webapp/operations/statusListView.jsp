<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Shipment Monitoring </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
            <li class="active"> Operations</li>
            <li class="active"> On-Going Booking List</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
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
                <a href="viewStatusList" class="btn btn-primary" id ="groups-btn">Display All</a>
                </span>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="/viewStatusList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">

                        <td><display:column property="orderDate" title="Booking Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                            class="tb-font-black" style="text-align: center;"> </display:column></td>

                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="orderItemStatus" title="Current Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_SALES')">
                        <td><display:column title="Action">
                            <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewStatusListItemsUrl}" rel="tooltip"
                                 title="Update Status">
                                <i class="fa fa-edit"></i>
                            </s:a>

                        </display:column></td>
                            </sec:authorize>

                    </display:table>
                </div>
            </div>
            <div class="panel-footer">
                <div class="table-responsive" >
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <label>Legend: </label> <br>
                            <i class="fa fa-edit"></i> Update Status
                        </div>
                        <div class="col-lg-6">
                            <strong> QUEUE FOR PICK-UP</strong> <br>The pick-up requirement is lined-up for service action. <br>
                            <strong> POSITIONED</strong> <br>The container was positioned at the area of the shipper for stuffing. <br>
                            <strong> IN TRANSIT TO PICK-UP</strong> <br>The truck is in-transit to pick-up area. <br>
                            <strong> PICKED-UP</strong> <br>The shipment was pulled out from the area of the shipper. <br>
                            <strong> QUEUE FOR DELIVERY</strong> <br>The delivery requirement is lined-up for service action. <br>
                            <strong> IN TRANSIT TO DELIVERY</strong> <br>The truck is in-transit to delivery area. <br>
                            <strong> DELIVERED</strong> <br>The shipment was delivered to the consignee. <br>
                            <strong> SERVICE ACCOMPLISHED</strong> <br>The booking request has been accomplished.
                        </div>
                        <div class="col-lg-6">
                            <strong> CONSOLIDATION</strong> <br>The shipment is for consolidation at Ernest warehouse. <br>
                            <strong> QUEUE FOR DEPARTURE</strong> <br>The shipment is at the port of origin waiting for departure. <br>
                            <strong> IN-TRANSIT</strong> <br>The shipment is on board the cargo vessel and is in-transit to port of destination. <br>
                            <strong> ARRIVED</strong> <br>The shipment has arrived at the port of destination.<br>
                            <strong> RETURNED TO ORIGIN</strong> <br>The shipment was not successfully delivered and is to return to origin.<br>
                            <strong> PENDING</strong> <br>The booking request is pending for action. <br>
                            <strong> CANCELLED</strong> <br>The booking was cancelled.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        tableProp('DESTI_ORIG','order',0 ,7, 8, 9, 5, 6, 1);
    });
</script>
