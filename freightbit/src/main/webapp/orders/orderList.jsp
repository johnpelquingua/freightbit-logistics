<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
    /*.fa:hover {*/
        /*font-size: 180%; !important;*/
        /*margin-top: -7px; !important;*/
        /*margin-bottom: -7px; !important;*/
        /*margin-right: -4px; !important;*/
        /*margin-left: -4px; !important;*/
    /*}*/
    .cancelBookingIcon {
        cursor: pointer;
        color: red;
    }
    .approveBookingIcon {
        cursor: pointer;
        color: #2ECC71;
    }
    .deleteBookingIcon {
        cursor: pointer;
    }
</style>
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
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                        <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal1" onclick="showSearchFields();">
                            <i class="fa fa-search"></i> Search Booking
                        </button>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                        <button type="button" class="btn btn-primary new-booking"
                                onclick="location.href='loadAddOrderPage'">
                            <i class="fa fa-book"></i> New Booking
                        </button>
                    </sec:authorize>
                </span>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                        <display:table id="order" name="orders" requestURI="viewOrders.action" class="table table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="orderDate" title="Order Dates <i class='fa fa-sort' />" class="tb-font-black"
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

                            <%--<td><display:column property="documentCheck" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color"--%>
                                                <%--style="text-align: center;"> </display:column></td>--%>

                            <td class="tb-font-black" style="text-align: center;">
                                <display:column title="Actions">

                                        <%--edit booking--%>
                                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                                        <s:url var="editOrderUrl" action="loadEditOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editOrderUrl}" rel="tooltip" title ="Edit Booking">
                                            <i class="fa fa-pencil table-action-icons"></i>
                                        </s:a>

                                        <s:if test=" #attr.order.orderStatus == 'CANCELLED' || #attr.order.orderStatus == 'PENDING' || #attr.order.orderStatus == 'INCOMPLETE' ">
                                            <%--delete booking--%>
                                            <s:url var="deleteOrderUrl" action="deleteOrder">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip" title="Delete Booking" onclick="return confirm('Do you really want to delete?');">
                                            </s:a>
                                            <i class="fa fa-trash-o deleteBookingIcon table-action-icons"></i>
                                        </s:if>
                                    </sec:authorize>

                                        <%--info booking--%>
                                        <s:url var="viewInfoOrderUrl" action="viewInfoOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                            <i class="fa fa-info-circle table-action-icons"></i>
                                        </s:a>

                                    <s:if test=" #attr.order.documentCheck == 'AVAILABLE' ">
                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                                            <a id="print-icon" title="Print Booking Form" rel="tooltip" href="#" onclick="generateReport(${order.documentId},'BOOKING REQUEST FORM');">
                                                <i class="fa fa-print table-action-icons"></i>
                                            </a>
                                        </sec:authorize>
                                    </s:if>

                                    <%--approve booking--%>
                                    <%--<s:property value="%{#attr.order.orderId}"/>--%>
                                    <s:if test=" #attr.order.orderStatus == 'CANCELLED' || #attr.order.orderStatus == 'PENDING'">
                                        | <%--separator--%>
                                        <s:url var="approveOrderUrl" action="approveOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{approveOrderUrl}" rel="tooltip" title="Approve Booking" onclick="return confirm('Approve Booking?');">
                                        </s:a>
                                        <i class="fa fa-check approveBookingIcon table-action-icons"></i>
                                    </s:if>
                                    <s:if test=" #attr.order.orderStatus == 'APPROVED' || #attr.order.orderStatus == 'INCOMPLETE' || #attr.order.orderStatus == 'ON GOING'">
                                        | <%--separator--%>
                                        <%--cancel booking--%>
                                        <s:url var="cancelOrderUrl" action="cancelOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{cancelOrderUrl}" rel="tooltip" title="Cancel Booking" onclick="return confirm('Cancel Booking?');">
                                        </s:a>
                                        <i class="fa fa-times cancelBookingIcon table-action-icons"></i>
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
                                <td><i class='fa fa-info-circle' ></i> Information</td>
                                <td><i class='fa fa-trash-o'></i> Delete</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i class='fa fa-pencil' ></i> Edit</td>
                                <td><i class='fa fa-print' ></i> Print</td>
                                <td><i class='fa fa-check' style="color: #2ECC71;"></i> Approve</td>
                                <td><i class='fa fa-times' style="color: red"></i> Cancel</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /.row -->
</div>

<div class="modal fade" id="inputModal1" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%--<div class="modal-header">
                <center><h4 class="modal-title" id="alertlabel"><li class="fa fa-info"/> Warning</h4></center>
            </div>--%>
            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv1"> <%--Area where input fields will appear--%> </div>
            </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>--%>
        </div>
    </div>
</div>

<div class="modal fade" id="cancelBookingModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Cancel Booking</span>
            </div>
            <div class="modal-body">
                This booking might have items, containers, vendors, customers and such associated to it. Please confirm cancellation. Are you sure you want to cancel the booking?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmCancelModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="approveBookingModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-check" style="color: #2ECC71;"></i> Approve Booking</span>
            </div>
            <div class="modal-body">
                Do you want to approve this booking? Please confirm.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                <a href="" class="btn btn-primary confirmApproveModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteBookingModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Delete Booking</span>
            </div>
            <div class="modal-body">
                This booking might have items, containers, vendors, customers and such associated to it. Please confirm cancellation. Are you sure you want to delete the booking?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmDeleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function() {
        tableProp('NONE', 'order', 8, 5, 6, 7, 0, 0, 1);
        actionConfirmation($('.cancelBookingIcon'), $('.confirmCancelModalBtn'), $('#cancelBookingModal'));
        actionConfirmation($('.approveBookingIcon'), $('.confirmApproveModalBtn'), $('#approveBookingModal'));
        actionConfirmation($('.deleteBookingIcon'), $('.confirmDeleteModalBtn'), $('#deleteBookingModal'));


//        $('.cancelBookingIcon').click(function(){
//            $('.confirmCancelModalBtn').attr('href', $(this).prev().attr('href'));
//            $('#cancelBookingModal').modal('show');
//        });

//        $('.approveBookingIcon').click(function(){
//            $('.confirmApproveModalBtn').attr('href', $(this).prev().attr('href'));
//            $('#approveBookingModal').modal('show');
//        });
//
//        $('.deleteBookingIcon').click(function(){
//            $('.confirmDeleteModalBtn').attr('href', $(this).prev().attr('href'));
//            $('#deleteBookingModal').modal('show');
//        });
        <%--var tbl = document.getElementById("order");--%>
        <%--&lt;%&ndash;var ctr = <s:property value="%{Booking}"/>;&ndash;%&gt;--%>

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

    function showSearchFields() {
        $.ajax({
            url: 'bookingSearch',
            type: 'POST',
            dataType: 'html',
            success: function (html) {
                $('#inputDiv1').html(html);
                /*window.location.href = '#sixth';*/
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });

    }

</script>

