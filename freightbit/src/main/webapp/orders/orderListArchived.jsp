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
            <li class="active"> Booking</li>
            <li class="active"> Archived Booking List</li>
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Archived Booking List </h3>
                <span class="pull-right">
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                        <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal1" onclick="showSearchFields();">
                            <i class="fa fa-search"></i> Search Booking
                        </button>
                    </sec:authorize>
                    <button type="button" class="btn btn-primary"
                            onclick="location.href='viewArchivedOrders'">
                        <i class="fa fa-list"></i> Display All
                    </button>
                </span>
            </div>

            <div class="panel-body">
                <div class="table-responsive table-responsive-scroll list-table" id="no-more-tables">
                        <display:table id="order" name="orders" requestURI="viewArchivedOrders.action" pagesize="10" class="table table-scroll table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="orderDate" title="Order Dates <i class='fa fa-sort' />" class="tb-font-black" scope="Order Dates"
                                                style="text-align: center; width: 135px;"> </display:column></td>
                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black" scope="Order #"
                                                style="text-align: center; width: 105px;" > </i></display:column></td>
                            <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black" scope="Customer"
                                                style="text-align: center; width: 350px;"> </display:column></td>
                            <td><display:column property="consigneeName" title="Consignee <i class='fa fa-sort' />" class="tb-font-black" scope="Consignee"
                                                style="text-align: center; width: 350px;"> </display:column></td>
                            <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black" style="text-align: center; width: 75px;" scope="Type">
                                                </display:column></td>
                            <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />" class="tb-font-black" scope="Req't"
                                                style="text-align: center; width: 75px;"> </display:column></td>
                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black" scope="Mode"
                                                style="text-align: center; width: 75px;"> </display:column></td>
                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color" scope="Status"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="createdBy" title="Booked By <i class='fa fa-sort' />" class="tb-font-black status-color" scope="Created By"
                                                style="text-align: center; width: 180px;"> </display:column></td>
                            <td><display:column property="orderCompleted" title="Completed <i class='fa fa-sort' />" class="tb-font-black status-color" scope="Aging"
                                                style="text-align: center; width: 100px;"> </display:column></td>
                            <%--<td><display:column property="documentCheck" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color"--%>
                                                <%--style="text-align: center;"> </display:column></td>--%>
                            <td class="tb-font-black" style="text-align: center;">
                                <display:column title="Actions" scope="Actions" style="text-align: center; width: 140px;">

                                    <%--info booking--%>
                                    <s:url var="viewInfoArchivedOrderUrl" action="viewInfoArchivedOrder">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{viewInfoArchivedOrderUrl}" rel="tooltip" title="View Booking Information">
                                        <i class="fa fa-info-circle table-action-icons"></i>
                                    </s:a>

                                </display:column>
                            </td>

                        </display:table >

                </div>
            </div>

        </div>
    </div>

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
    });

    function generateReport(documentId,documentName) {
        var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Booking Request Form";
        }
    }

    function showSearchFields() {
        $.ajax({
            url: 'archivedBookingSearch',
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

</script>

