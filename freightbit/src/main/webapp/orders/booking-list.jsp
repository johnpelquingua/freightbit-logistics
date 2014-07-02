<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>



<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="booking page-header">
    Booking
    </h1>

    <div class="row">
        <div class="col-md-12">
            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="includes/images/booking.png" class="box-icon">
                    <span class="booking panel-title">List of Bookings</span>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered text-center">
                            <thead>
                                <tr class="header_center active">
                                  <th class="tb-font-black">Booking Date</th>
                                  <th class="tb-font-black">Booking Number</th>
                                  <th class="tb-font-black">Customer</th>
                                  <th class="tb-font-black">Consignee</th>
                                  <th class="tb-font-black">Destination</th>
                                  <th class="tb-font-black">Date / Time</th>
                                  <th class="tb-font-black">Status</th>
                                  <th class="tb-font-black">Processed By</th>
                                  <th class="tb-font-black">Action</th>
                                </tr>
                            </thead>
                        <tbody>

                            <tr>
                              <td class="tb-font-black">5-26-2014 </td>
                              <td class="tb-font-black">MTY-123 </td>
                              <td class="tb-font-black">Mighty Corp.</td>
                              <td class="tb-font-black">Palawan Co.</td>
                              <td class="tb-font-black">Palawan, Puerto Princesa</td>
                              <td class="tb-font-black">5-28-2014 / 7:45:00</td>
                              <td class="tb-font-black">Active</td>
                              <td class="tb-font-black">Merlin</td>

                              <td class="tb-font-black">
                                  <a href="#"><img src="includes/images/edit-booking.png" title="Edit Booking"> </a>
                                  <a href="#"><img src="includes/images/delete-booking.png" title="Delete Booking"> </a>
                                  <a href="#"><img src="includes/images/info-booking.png" title="Booking Info"> </a>
                              </td>

                            </tr>

                        </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel-footer">

                    <span class="pull-right">
                        <button type="button" class="btn btn-info new-booking" onclick="location.href='bookingSearch'">
                              Search Booking
                        </button>
                        <button type="button" class="btn btn-info new-booking" onclick="location.href='loadAddOrderPage'">
                              New Booking
                        </button>
                    </span>
                </div>
            </div>
        </div>

    </div>

</div>
--%>

<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Booking Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-list"></i> Booking List</li>
        </ol>

    </div>
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Booking List</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered text-center">
                        <thead>
                        <tr class="header_center active">
                            <th class="tb-font-black" style="text-align: center">Booking Date</th>
                            <th class="tb-font-black" style="text-align: center">Booking Number</th>
                            <th class="tb-font-black" style="text-align: center">Shipper</th>
                            <th class="tb-font-black" style="text-align: center">Consignee</th>
                            <th class="tb-font-black" style="text-align: center">Service Requirement</th>
                            <th class="tb-font-black" style="text-align: center">Service Mode</th>
                            <th class="tb-font-black" style="text-align: center">Status</th>
                            <th class="tb-font-black" style="text-align: center">Processed By</th>
                            <th class="tb-font-black" style="text-align: center">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr class="warning">
                            <td class="tb-font-black">10/21/2013 </td>
                            <td class="tb-font-black">MTY-123 </td>
                            <td class="tb-font-black">Mighty Corp.</td>
                            <td class="tb-font-black">Palawan Co.</td>
                            <td class="tb-font-black">Full Cargo Load</td>
                            <td class="tb-font-black">Door to Door</td>
                            <td class="tb-font-black">Pending</td>
                            <td class="tb-font-black">Merlin</td>

                            <td class="tb-font-black">
                                <%--<a href="#"><img src="includes/images/edit-booking.png" title="Edit Booking"> </a>
                                <a href="#"><img src="includes/images/delete-booking.png" title="Delete Booking"> </a>
                                <a href="#"><img src="includes/images/info-booking.png" title="Booking Info"> </a>--%>
                                <a href="#"><i class="fa fa-edit"></i></a>
                                <a href="#"><i class="fa fa-minus-circle"></i></a>
                                <a href="#"><i class="fa fa-times-circle"></i></a>
                                <a href="#"><i class="fa fa-info-circle"></i></a>
                            </td>

                        </tr>

                        <tr class="success">
                            <td class="tb-font-black">10/21/2013 </td>
                            <td class="tb-font-black">MTY-123 </td>
                            <td class="tb-font-black">Mighty Corp.</td>
                            <td class="tb-font-black">Palawan Co.</td>
                            <td class="tb-font-black">Full Cargo Load</td>
                            <td class="tb-font-black">Door to Door</td>
                            <td class="tb-font-black">Approved</td>
                            <td class="tb-font-black">Michelle</td>

                            <td class="tb-font-black">
                                <%--<a href="#"><img src="includes/images/edit-booking.png" title="Edit Booking"> </a>
                                <a href="#"><img src="includes/images/delete-booking.png" title="Delete Booking"> </a>
                                <a href="#"><img src="includes/images/info-booking.png" title="Booking Info"> </a>--%>
                                <a href="#"><i class="fa fa-edit"></i></a>
                                <a href="#"><i class="fa fa-minus-circle"></i></a>
                                <a href="#"><i class="fa fa-times-circle"></i></a>
                                <a href="#"><i class="fa fa-info-circle"></i></a>
                            </td>

                        </tr>

                        </tbody>
                    </table>


                </div>
            </div>

            <div class="panel-footer">

                    <span class="pull-right">
                        <button type="button" class="btn btn-info new-booking" onclick="location.href='bookingSearch'">
                            <i class="fa fa-search"></i> Search Booking
                        </button>
                        <button type="button" class="btn btn-info new-booking" onclick="location.href='loadAddOrderPage'">
                            <i class="fa fa-book"></i> New Booking
                        </button>
                    </span>
            </div>
    </div>
</div><!-- /.row -->


