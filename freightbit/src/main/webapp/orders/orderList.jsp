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
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>
<s:if test="hasActionErrors()">
   <div class="col-lg-12">
	   <div class="alert alert-errors">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
   			<strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
		</div>
   </div>
</s:if>

<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Booking List </h3>
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

            <div class="panel-body">
                <div class="table-responsive">
                        <display:table id="order" name="orders" requestURI="viewOrders.action" pagesize="10" class="table table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="orderDate" title="Order Date <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;" > </i></display:column></td>
                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black" style="text-align: center;">
                                </display:column>
                            </td>

                            <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
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

                                    <s:if test=" #attr.order.orderStatus == 'CANCELLED' || #attr.order.orderStatus == 'PENDING' || #attr.order.orderStatus == 'INCOMPLETE' ">
                                        <%--delete booking--%>
                                        <s:url var="deleteOrderUrl" action="deleteOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip" title="Delete Booking" onclick="return confirm('Do you really want to delete?');">
                                            <i class="fa fa-trash-o"></i>
                                        </s:a>
                                    </s:if>

                                        <%--info booking--%>
                                        <s:url var="viewInfoOrderUrl" action="viewInfoOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                            <i class="fa fa-info-circle"></i>
                                        </s:a>

                                    <s:if test=" #attr.order.documentCheck == 'AVAILABLE' ">

                                        <a id="print-icon" href="#" onclick="generateReport(${order.documentId},'BOOKING REQUEST FORM');">
                                            <i class="fa fa-print"></i>
                                        </a>

                                    </s:if>

                                    | <%--separator--%>
                                    <%--approve booking--%>
                                    <%--<s:property value="%{#attr.order.orderId}"/>--%>
                                    <s:if test=" #attr.order.orderStatus == 'CANCELLED' || #attr.order.orderStatus == 'PENDING' ">
                                        <s:url var="approveOrderUrl" action="approveOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{approveOrderUrl}" rel="tooltip" title="Approve Booking" onclick="return confirm('Approve Booking?');">
                                            <i class="fa fa-check"></i>
                                        </s:a>
                                    </s:if>
                                    <s:if test=" #attr.order.orderStatus == 'APPROVED' || #attr.order.orderStatus == 'INCOMPLETE' ">
                                        <%--cancel booking--%>
                                        <s:url var="cancelOrderUrl" action="cancelOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{cancelOrderUrl}" rel="tooltip" title="Cancel Booking" onclick="return confirm('Cancel Booking?');">
                                            <i class="fa fa-times"></i>
                                        </s:a>
                                    </s:if>

                                </display:column>
                            </td>

                            <%--<td><display:column property="documentId" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color"
                                                style="text-align: center;"> </display:column></td>--%>

                        </display:table >

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
    <!-- /.row -->
</div>

<script>

    $(document).ready(function() {
        tableProp('NONE', 'order', 8, 5, 6, 7);

        <%--var tbl = document.getElementById("order");--%>
        <%--var ctr = <s:property value="%{Booking}"/>;--%>

        <%--if (tbl != null) {--%>
            <%--for (var i =1; i <= ctr; i++) {--%>
                <%--for (var j = 0; j < tbl.rows[i].cells.length; j++) {--%>
                    <%--tbl.rows[i].cells[j].style.backgroundColor=("#dff0d8") ;--%>

                <%--}--%>
            <%--}--%>
        <%--}--%>
    });

    function generateReport(documentId,documentName) {
        var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Booking Request Form";
        }
    }

</script>

