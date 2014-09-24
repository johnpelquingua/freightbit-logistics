<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"> Booking List</li>
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

<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Booking List</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" onclick="location.href='bookingSearch'">
                        <i class="fa fa-search"></i> Search Booking
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddOrderPage'">
                        <i class="fa fa-book"></i> New Booking
                    </button>

                    <s:property value="%{ctr}"/>
                </span>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                        <display:table id="order" name="orders" requestURI="viewOrders.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;" > </i></display:column></td>
                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="serviceRequirement" title="Service Requirement <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="orderDate" title="Order Date <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color"
                                                style="text-align: center;"> </display:column></td>

                            <td class="tb-font-black" style="text-align: center;">
                                <display:column title="Actions">

                                    <%--edit booking--%>
                                    <s:url var="editOrderUrl" action="loadEditOrder">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editOrderUrl}" rel="tooltip" title ="Edit Booking">
                                        <i class="fa fa-pencil"></i>
                                    </s:a>
                                    <%--delete booking--%>
                                    <s:url var="deleteOrderUrl" action="deleteOrder">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip" title="Delete Booking" onclick="return confirm('Do you really want to delete?');">
                                        <i class="fa fa-trash-o"></i>
                                    </s:a>
                                    <%--info booking--%>
                                    <s:url var="viewInfoOrderUrl" action="viewInfoOrder">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                        <i class="fa fa-info-circle"></i>
                                    </s:a>
                                    | <%--separator--%>
                                    <%--approve booking--%>
                                    <%--<s:property value="%{#attr.order.orderId}"/>--%>
                                    <s:url var="approveOrderUrl" action="approveOrder">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{approveOrderUrl}" rel="tooltip" title="Approve Booking" onclick="return confirm('Approve Booking?');">
                                        <i class="fa fa-check"></i>
                                    </s:a>
                                    <%--cancel booking--%>
                                    <s:url var="cancelOrderUrl" action="cancelOrder">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{cancelOrderUrl}" rel="tooltip" title="Cancel Booking" onclick="return confirm('Cancel Booking?');">
                                        <i class="fa fa-times"></i>
                                    </s:a>

                                </display:column>
                            </td>

                        </display:table >

                </div>
            </div>

            <div class="panel-footer">
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" onclick="location.href='bookingSearch'">
                        <i class="fa fa-search"></i> Search Booking
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddOrderPage'">
                        <i class="fa fa-book"></i> New Booking
                    </button>
                </span>
            </div>

        </div>
    </div>
    <!-- /.row -->
</div>

<script>

$(document).ready(function() {
    /*color coding of rows*/
    var tbl = document.getElementById("order");
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {

            if (tbl.rows[i].cells[6].innerHTML == "PENDING") {
                /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                    tbl.rows[i].cells[j].style.backgroundColor = "#fcf8e3";
                }
            }

            if (tbl.rows[i].cells[6].innerHTML == "DISAPPROVED" || tbl.rows[i].cells[6].innerHTML == "CANCELLED") {
                /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                    tbl.rows[i].cells[j].style.backgroundColor = "#f2dede";
                }
            }

            if (tbl.rows[i].cells[6].innerHTML == "APPROVED" || tbl.rows[i].cells[6].innerHTML == "SERVICE ACCOMPLISHED") {
                /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                    tbl.rows[i].cells[j].style.backgroundColor = "#dff0d8";
                }
            }
        }
    }

});

</script>

