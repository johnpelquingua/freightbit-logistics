<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

<h1 class="page-header">DashboardAction</h1>

<!-- EDIT HERE -->


    <div style="width:48%; float:left;margin-right:36px;">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/booking.png" class="box-icon">
                <span class="booking panel-title">New Booking</span>

              </div>
              <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                      <thead>
                        <tr class="header_center">
                          <th class="tb-font-black">Company Code</th>
                          <th class="tb-font-black">Date Booked</th>
                          <th class="tb-font-black">Date of Pick-up</th>
                          <th class="tb-font-black">Container</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">2-12-2014</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">LCL</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">2-12-2014</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">FCL</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">2-12-2014</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">FCL</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">2-12-2014</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">LCL</td>
                        </tr>
                    </table>
                    </div>
            </div>
        </div>
    </div>

    <div style="width:48%; float:left;">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/booking.png" class="box-icon">
                <span class="booking panel-title">On-Going</span>

              </div>
              <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                      <thead>
                        <tr class="header_center">
                          <th class="tb-font-black">Company Code</th>
                          <th class="tb-font-black">From</th>
                          <th class="tb-font-black">To</th>
                          <th class="tb-font-black">Type</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">MANILA</td>
                          <td class="tb-font-black">CEBU</td>
                          <td class="tb-font-black">D/D</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">MANILA</td>
                          <td class="tb-font-black">CEBU</td>
                          <td class="tb-font-black">D/D</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">MANILA</td>
                          <td class="tb-font-black">CEBU</td>
                          <td class="tb-font-black">D/D</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">MANILA</td>
                          <td class="tb-font-black">CEBU</td>
                          <td class="tb-font-black">D/D</td>
                        </tr>
                    </table>
                    </div>
            </div>
        </div>
    </div>


<div style="clear:both;"></div>

<div style="width:48%; float:left;margin-right:36px;">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/account.png" class="box-icon">
                <span class="booking panel-title">New Accounts</span>

              </div>
              <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                      <thead>
                        <tr class="header_center">
                          <th class="tb-font-black">Company Code</th>
                          <th class="tb-font-black">Username</th>
                          <th class="tb-font-black">Date Created</th>
                          <th class="tb-font-black">Group</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">jojo123</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">Customer</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">ERN</td>
                          <td class="tb-font-black">janjan123</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">Operations</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">SRI</td>
                          <td class="tb-font-black">jojo123</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">Customer</td>
                        </tr>
                        <tr>
                          <td class="tb-font-black">ERN</td>
                          <td class="tb-font-black">janjan123</td>
                          <td class="tb-font-black">2-14-2014</td>
                          <td class="tb-font-black">Operations</td>
                        </tr>
                      </tbody>
                    </table>
                    </div>
            </div>
        </div>
    </div>

    <div style="width:48%; float:left;">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/report.png" class="box-icon">
                <span class="booking panel-title">Monthly Report</span>
            </div>
            <div class="panel-body" style="text-align:center;">
                <img src="../includes/images/graph.png" style="width:170px;">
                <p style="margin:0;font-weight:bold;">September 2014</p>
            </div>
        </div>
    </div>



<!-- END OF EDIT -->

</div>--%>

<!-- END OF THE MIDDLE -->


<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Dashboard </h1>
        <%-- <ol class="breadcrumb">
             <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>

         </ol>--%>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-book"></i> New Booking</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped tablesorter">
                        <thead>
                        <tr>
                            <th>Booking # <i class="fa fa-sort"></i></th>
                            <th>Booking Date <i class="fa fa-sort"></i></th>
                            <th>Pick-up Date <i class="fa fa-sort"></i></th>
                            <th>Processed By <i class="fa fa-sort"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>MTY-001</td>
                            <td>10/21/2013</td>
                            <td>10/23/2013</td>
                            <td>Michelle</td>
                        </tr>
                        <tr>
                            <td>MTY-002</td>
                            <td>10/21/2013</td>
                            <td>10/23/2013</td>
                            <td>Michelle</td>
                        </tr>
                        <tr>
                            <td>MTY-003</td>
                            <td>10/21/2013</td>
                            <td>10/23/2013</td>
                            <td>Michelle</td>
                        </tr>
                        <tr>
                            <td>MTY-004</td>
                            <td>10/21/2013</td>
                            <td>10/23/2013</td>
                            <td>Michelle</td>
                        </tr>
                        <tr>
                            <td>MTY-005</td>
                            <td>10/21/2013</td>
                            <td>10/23/2013</td>
                            <td>Michelle</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-clock-o"></i> Recent Activity</h3>
            </div>
            <div class="panel-body" style=" margin-bottom: 18px; ">
                <div class="list-group">
                    <a href="#" class="list-group-item" style="border-radius:0px; ">
                        <span class="badge">just now</span>
                        <i class="fa fa-calendar"></i> Vessel Schedule updated
                    </a>

                    <a href="#" class="list-group-item">
                        <span class="badge">23 minutes ago</span>
                        <i class="fa fa-truck"></i> Order MTY-392 shipped
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">46 minutes ago</span>
                        <i class="fa fa-money"></i> Invoice 653 has been paid
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">1 hour ago</span>
                        <i class="fa fa-user"></i> A new user has been added
                    </a>
                    <a href="#" class="list-group-item" style="border-radius:0px; ">
                        <span class="badge">2 hours ago</span>
                        <i class="fa fa-book"></i> 6 New Bookings
                    </a>
                    <%--  <a href="#" class="list-group-item">
                          <span class="badge">2 hours ago</span>
                          <i class="fa fa-file-text"></i> 3 Pending Documents
                      </a>--%>

                </div>
                <div class="text-right">
                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>

    <div clear="both"></div>


    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-spin fa-spinner"></i> On-Going Transactions</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped tablesorter">
                        <thead>
                        <tr>
                            <th>Booking # <i class="fa fa-sort"></i></th>
                            <th>Consignee <i class="fa fa-sort"></i></th>
                            <th>Destination <i class="fa fa-sort"></i></th>
                            <th> &nbsp; &nbsp;Status <i class="fa fa-sort"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>XYZ-123</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Truck at warehouse for pick-up</td>
                        </tr>
                        <tr>
                            <td>XYZ-124</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>
                        <tr>
                            <td>XYZ-125</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>
                        <tr>
                            <td>XYZ-126</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>
                        <tr>
                            <td>XYZ-127</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>


                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>





