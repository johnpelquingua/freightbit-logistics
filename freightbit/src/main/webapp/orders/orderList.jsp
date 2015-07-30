<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .cancelBookingIcon {
        cursor: pointer;
        color: red;
    }
    .approveBookingIcon {
        cursor: pointer;
        color: #2ECC71;
    }
    .deleteBookingIcon, .archiveBookingIcon{
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
            <li class="active"> Booking</li>
            <li class="active"> Active Booking List</li>
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
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Active Booking List </h3>
                <span class="pull-right">
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                        <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal1" onclick="showSearchFields();">
                            <i class="fa fa-search"></i> Search Booking
                        </button>
                    </sec:authorize>
                    <button type="button" class="btn btn-primary"
                            onclick="location.href='viewOrders'">
                        <i class="fa fa-list"></i> Display All
                    </button>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_FREIGHT_OPERATIONS_OFFICER', 'ROLE_SALES')">
                        <button type="button" class="btn btn-primary new-booking"
                                onclick="location.href='loadAddOrderPage'">
                            <i class="fa fa-book"></i> New Booking
                        </button>
                    </sec:authorize>
                </span>
            </div>

            <div class="panel-body">
                <div class="table-responsive table-responsive-scroll" id="no-more-tables">
                        <display:table id="order" name="orders" requestURI="viewOrders.action" pagesize="10" class="table table-scroll table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="orderDate" title="Order Dates <i class='fa fa-sort' />" class="tb-font-black" scope="Order Dates"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black" scope="Order #"
                                                style="text-align: center;" > </i></display:column></td>
                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black" scope="Customer"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black" scope="Consignee"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black" style="text-align: center; width: 75px;" scope="Type">
                                                </display:column></td>
                            <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />" class="tb-font-black" scope="Req't"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black" scope="Mode"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color" scope="Status"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="createdBy" title="Booked By <i class='fa fa-sort' />" class="tb-font-black status-color" scope="Created By"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="aging" title="Aging <i class='fa fa-sort' />" class="tb-font-black status-color" scope="Aging"
                                                style="text-align: center;"> </display:column></td>
                            <%--<td><display:column property="documentCheck" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color"--%>
                                                <%--style="text-align: center;"> </display:column></td>--%>
                            <td class="tb-font-black" style="text-align: center;">
                                <display:column title="Actions" scope="Actions" style="text-align: center;">

                                        <%--edit booking--%>
                                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                                        <s:if test=" #attr.order.orderStatus != 'SERVICE ACCOMPLISHED' ">
                                            <s:url var="editOrderUrl" action="loadEditOrder">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{editOrderUrl}" rel="tooltip" title ="Edit Booking">
                                                <i class="fa fa-pencil table-action-icons"></i>
                                            </s:a>
                                        </s:if>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                        <s:if test=" #attr.order.orderStatus == 'CANCELLED' || #attr.order.orderStatus == 'PENDING' || #attr.order.orderStatus == 'INCOMPLETE' ">
                                            <%--delete booking--%>
                                            <%--|--%> <%--separator--%>
                                            <s:url var="deleteOrderUrl" action="deleteOrder">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip" title="Delete Booking" onclick="return confirm('Do you really want to delete?');">
                                            </s:a>
                                            <i class="fa fa-trash-o deleteBookingIcon table-action-icons"></i>
                                        </s:if>
                                        </sec:authorize>
                                    </sec:authorize>

                                        <%--info booking--%>
                                        <%--|--%> <%--separator--%>
                                        <s:url var="viewInfoOrderUrl" action="viewInfoOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                            <i class="fa fa-info-circle table-action-icons"></i>
                                        </s:a>

                                    <s:if test=" #attr.order.documentCheck == 'AVAILABLE' ">
                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                                            <%--|--%> <%--separator--%>
                                            <a id="print-icon" title="Print Booking Form" rel="tooltip" href="#" onclick="generateReport(${order.documentId},'BOOKING REQUEST FORM');">
                                                <i class="fa fa-print table-action-icons"></i>
                                            </a>
                                        </sec:authorize>
                                    </s:if>

                                    <%--approve booking--%>
                                    <%--<s:property value="%{#attr.order.orderId}"/>--%>
                                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES')">
                                    <s:if test=" #attr.order.orderStatus == 'CANCELLED' || #attr.order.orderStatus == 'PENDING'">
                                        <%--|--%> <%--separator--%>
                                        <s:url var="approveOrderUrl" action="approveOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <%--<s:a class="icon-action-link" href="%{approveOrderUrl}" rel="tooltip" title="Approve Booking" onclick="return confirm('Approve Booking?');">--%>
                                        <s:a class="icon-action-link" href="%{approveOrderUrl}" rel="tooltip" title="Approve Booking">
                                            <i class="fa fa-check approveBookingIcon"></i>
                                        </s:a>

                                    </s:if>
                                    <s:if test=" #attr.order.orderStatus == 'APPROVED' || #attr.order.orderStatus == 'INCOMPLETE' || #attr.order.orderStatus == 'ON GOING'">
                                        <%--|--%> <%--separator--%>
                                        <%--cancel booking--%>
                                        <s:url var="cancelOrderUrl" action="cancelOrder">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <%--<s:a class="icon-action-link" href="%{cancelOrderUrl}" rel="tooltip" title="Cancel Booking" onclick="return confirm('Cancel Booking?');">--%>
                                        <s:a class="icon-action-link" href="%{cancelOrderUrl}" rel="tooltip" title="Cancel Booking">
                                            <i class="fa fa-times cancelBookingIcon"></i>
                                        </s:a>

                                    </s:if>
                                    </sec:authorize>
                                    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                        <%--<s:if test=" #attr.order.orderStatus == 'SERVICE ACCOMPLISHED' ">--%>
                                            <%--|--%> <%--separator--%>
                                            <s:url var="archiveOrderUrl" action="archiveOrder">
                                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                            </s:url>
                                            <%--<s:a class="icon-action-link" href="%{archiveOrderUrl}" rel="tooltip" title="Move to Archive" onclick="return confirm('Archive Booking?');">--%>
                                            <s:a class="icon-action-link" href="%{archiveOrderUrl}" rel="tooltip" title="Move to Archive">
                                                <i class="fa fa-sign-out archiveBookingIcon"></i>
                                            </s:a>

                                        <%--</s:if>--%>
                                    </sec:authorize>
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
                        <div class="col-lg-12">
                            <label>LEGEND:</label>
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #d9534f;"></i> Cancelled <br>
                            <i class='fa fa-anchor'></i> Shipping<br>
                            <i class='fa fa-print' ></i> Print
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #428bca;"></i> On Going<br>
                            <i class='fa fa-truck' ></i> Trucking<br>
                            <i class='fa fa-check' style="color: #2ECC71;"></i> Approve
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #f0ad4e;"></i> Pending / Incomplete<br>
                            <i class='fa fa-info-circle' ></i> Information<br>
                            <i class='fa fa-times' style="color: red"></i> Cancel
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #5cb85c;"></i> Approved / Newly Added<br>
                            <i class='fa fa-trash-o'></i> Delete<br>

                        </div>

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

            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv1"> <%--Area where input fields will appear--%> </div>
            </div>

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
                <button href="" id="cancelBooking" class="btn btn-danger confirmCancelModalBtn">Yes</button>
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
                <button href="" id="approveBooking" class="btn btn-primary confirmApproveModalBtn">Yes</button>
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

<div class="modal fade" id="archiveBookingModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Archive Booking</span>
            </div>
            <div class="modal-body">
                Are you sure you want to archive this booking?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmArchiveModalBtn">Yes</a>
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
        actionConfirmation($('.archiveBookingIcon'), $('.confirmArchiveModalBtn'), $('#archiveBookingModal'));

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
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    }


    $("#cancelBooking").click(
        function(){
            var a = $("#cancelBooking").attr('href');
            $("a[href='"+a+"']").parents("tr").css("background-color","rgb(242, 222, 222)");
            $("a[href='"+a+"']").parents("tr").children("td[scope='Status']").text("CANCELLED");
            $("a[href='"+a+"']").html("<i class='fa fa-check approveBookingIcon'></i>");
            $("#cancelBookingModal").modal("hide");
            $.ajax({
                url: $("#cancelBooking").attr('href'),
                type: 'GET',
                success:function (data){
                    $("a[href='"+a+"']").attr("href", a.replace("cancelOrder","approveOrder"));
                },
                error:function(xhr, ajaxOptions, thrownError){
                    alert('An error occurred! ' + thrownError);
                }
            });
        }
    );

    $("#approveBooking").click(
            function(){
                var b = $("#approveBooking").attr('href');
                $("a[href='"+b+"']").parents("tr").css("background-color","rgb(223, 240, 216)");
                $("a[href='"+b+"']").parents("tr").children("td[scope='Status']").text("APPROVED");
                $("a[href='"+b+"']").html("<i class='fa fa-times cancelBookingIcon'></i>");
                $("#approveBookingModal").modal("hide");
                $.ajax({
                    url: $("#approveBooking").attr('href'),
                    type: 'GET',
                    success:function (data){
                        $("a[href='"+b+"']").attr("href", b.replace("approveOrder","cancelOrder"));
                    },
                    error:function(xhr, ajaxOptions, thrownError){
                        alert('An error occurred! ' + thrownError);
                    }
                });
            }
    );

</script>

