<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="images/reallogo.png" width="300px"></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Welcome, SuperUser</a></li>
                <li><a href="#"><img src="images/setting2.png" width="25px"></a></li>
            </ul>
            <!--
            <form class="navbar-form navbar-right">
              <input type="text" class="form-control" placeholder="Search...">
            </form>
            -->
        </div>
    </div>
</div>


<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">

            <ul class="nav nav-sidebar">

                <ul id="css3menu1" class="topmenu" style="padding:0;">
                    <li class="topfirst"><a href="home2.html" class="icon-home"><span class="icon-font">Dashboard</span></a></li>
                    <li class="topmenu"><a href="booking.html" class="icon-booking"><span class="icon-font">Booking</span></a></li>
                    <li class="topmenu"><a href="#" class="icon-operation"><span class="icon-font">Operations</span></a></li>
                    <li class="topmenu activebooking" ><a href="documentation.html" class="icon-document"><span class="icon-font">Documentations</span></a>
                        <ul>
                            <li class="subfirst"><a href="documentation.html" class="icon-document"><span class="icon-font">Pending Docs</span></a></li>
                            <li class="subfirst"><a href="documentation-new.html" class="icon-document"><span class="icon-font">Plain Docs</span></a></li>
                            <li class="subfirst"><a href="documentation-archive.html" class="icon-document"><span class="icon-font">Archive Docs</span></a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="vendor.html" class="icon-vendor"><span class="icon-font">Vendor</span></a>
                        <ul>
                            <li class="subfirst"><a href="vendor.html" class="icon-vendor"><span class="icon-font">Search Vendor</span></a></li>
                            <li class="subfirst"><a href="vendor-addvendor.html" class="icon-vendor"><span class="icon-font">Add Vendor</span></a></li>
                        </ul>
                    </li>

                    <li class="topmenu"><a href="customer.html" class="icon-customer "><span class="icon-font">Customer</span></a>
                        <ul>
                            <li class="subfirst"><a href="customer.html" class="icon-customer"><span class="icon-font">Search Customer</span></a></li>
                            <li class="subfirst"><a href="customer-add.html" class="icon-customer"><span class="icon-font">Add Customer</span></a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" class="icon-account"><span class="icon-font">Accounts</span></a>
                        <ul>
                            <li class="subfirst"><a href="users-list.html" class="icon-user"><span class="icon-font">Users</span></a></li>
                            <li class="subfirst"><a href="groups.html" class="icon-group"><span class="icon-font">Groups</span></a></li>
                            <li class="subfirst"><a href="permissions.html" class="icon-permission"><span class="icon-font">Permissions</span></a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" class="icon-report"><span class="icon-font">Reports</span></a></li>
                    <li class="topmenu"><a href="#" class="icon-finance"><span class="icon-font">Finance</span></a></li>
                    <li class="topmenu"><a href="#" class="icon-help"><span class="icon-font">Help</span></a></li>

                </ul>

            </ul>

        </div>

        <!-- MIDDLE -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <h1 class="page-header">On-Going Bookings</h1>

            <!-- MAIN BOX -->

            <div class="row">
                <div class="col-md-12">

                    <div class="panel booking panel-info">
                        <div class="booking panel-heading">
                            <img src="images/listofusers.png" class="box-icon">
                            <span class="booking panel-title">List of Current Transactions</span>

                        </div>
                        <div class="panel-body">
                            <div class="table-responsive list-table">
                                <table class="table table-striped table-bordered text-center" id="customer-list">
                                    <thead>
                                    <tr class="header_center">
                                        <th class="tb-font-black"><input type="checkbox" /></th>
                                        <th class="tb-font-black">Booking Code</th>
                                        <th class="tb-font-black">Company Code</th>
                                        <th class="tb-font-black">Status</th>
                                        <th class="tb-font-black">Service Type</th>
                                        <th class="tb-font-black">Service Mode</th>
                                        <th class="tb-font-black">Date of Pick up</th>
                                        <th class="tb-font-black">Date of Delivery</th>
                                        <th class="tb-font-black">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="tb-font-black"><input type="checkbox" /></td>
                                        <td class="tb-font-black">MTY-0001</td>
                                        <td class="tb-font-black">MTY</td>
                                        <td class="tb-font-black">At Port</td>
                                        <td class="tb-font-black" align="center">Trucking - Shipping</td>
                                        <td class="tb-font-black" align="center">D/D</td>
                                        <td class="tb-font-black">Jan 7, 2014</td>
                                        <td class="tb-font-black">Jan 10, 2014</td>
                                        <td class="tb-font-black">
                                            <a href="documentation-view.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tb-font-black"><input type="checkbox" /></td>
                                        <td class="tb-font-black">MTY-0002</td>
                                        <td class="tb-font-black">MTY</td>
                                        <td class="tb-font-black">At Port</td>
                                        <td class="tb-font-black" align="center">Trucking - Shipping</td>
                                        <td class="tb-font-black" align="center">D/P</td>
                                        <td class="tb-font-black">Jan 7, 2014</td>
                                        <td class="tb-font-black">Jan 10, 2014</td>
                                        <td class="tb-font-black">
                                            <a href="documentation-view2.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tb-font-black"><input type="checkbox" /></td>
                                        <td class="tb-font-black">MTY-0003</td>
                                        <td class="tb-font-black">MTY</td>
                                        <td class="tb-font-black">At Port</td>
                                        <td class="tb-font-black" align="center">Trucking - Shipping</td>
                                        <td class="tb-font-black" align="center">P/D</td>
                                        <td class="tb-font-black">Jan 7, 2014</td>
                                        <td class="tb-font-black">Jan 10, 2014</td>
                                        <td class="tb-font-black">
                                            <a href="documentation-view3.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tb-font-black"><input type="checkbox" /></td>
                                        <td class="tb-font-black">MTY-0004</td>
                                        <td class="tb-font-black">MTY</td>
                                        <td class="tb-font-black">At Port</td>
                                        <td class="tb-font-black" align="center">Trucking - Shipping</td>
                                        <td class="tb-font-black" align="center">P/P</td>
                                        <td class="tb-font-black">Jan 7, 2014</td>
                                        <td class="tb-font-black">Jan 10, 2014</td>
                                        <td class="tb-font-black">
                                            <a href="documentation-view4.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <ul class="pagination">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</div>
