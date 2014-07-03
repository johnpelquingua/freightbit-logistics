<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>Vessel Schedules</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstraps-min.css" rel="stylesheet">

    <link href="css/mains.css" rel="stylesheet">

    <link href="css/jojo.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style id="holderjs-style" type="text/css"></style>
</head>

<body style="">

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
                    <li class="topfirst "><a href="home2.html" class="icon-home"><span
                            class="icon-font">Dashboard</span></a></li>
                    <li class="topmenu"><a href="booking.html" class="icon-booking"><span
                            class="icon-font">Booking</span></a></li>
                    <li class="topmenu activeoperation"><a href="#" class="icon-operation"><span class="icon-font">Operations</span></a>
                        <ul>
                            <li class="subfirst">
                                <a href="inland-operation.html" class="icon-vendor"><span class="icon-font">Inland Freight</span></a>
                            </li>
                            <li class="subfirst"><a href="seafreight-operation.html" class="icon-sea"><span
                                    class="icon-font">Sea Freight</span></a></li>
                            <li class="subfirst">
                                <a href="vessel-schedule.html" class="icon-vessel"><span class="icon-font">Vessel Schedule</span></a>
                            </li>
                            <li class="subfirst"><a href="updateStatusList.html" class="icon-operation"><span
                                    class="icon-font">Status</span></a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" class="icon-document"><span class="icon-font">Documentations</span></a></a>
                    </li>
                    <li class="topmenu"><a href="vendor.html" class="icon-vendor"><span class="icon-font">Vendor</span></a>
                        <ul>
                            <li class="subfirst"><a href="vendor.html" class="icon-vendor"><span class="icon-font">Search Vendor</span></a>
                            </li>
                            <li class="subfirst"><a href="vendor-addvendor.html" class="icon-vendor"><span
                                    class="icon-font">Add Vendor</span></a></li>
                        </ul>
                    </li>

                    <li class="topmenu"><a href="customer.html" class="icon-customer "><span
                            class="icon-font">Customer</span></a>
                        <ul>
                            <li class="subfirst"><a href="customer.html" class="icon-customer"><span class="icon-font">Search Customer</span></a>
                            </li>
                            <li class="subfirst"><a href="customer-add.html" class="icon-customer"><span
                                    class="icon-font">Add Customer</span></a></li>
                        </ul>
                    </li>
                    <li class="topmenu"><a href="#" class="icon-account"><span class="icon-font">Accounts</span></a>
                        <ul>
                            <li class="subfirst"><a href="users-list.html" class="icon-user"><span class="icon-font">Users</span></a>
                            </li>
                            <li class="subfirst"><a href="groups.html" class="icon-group"><span
                                    class="icon-font">Groups</span></a></li>
                            <li class="subfirst"><a href="permissions.html" class="icon-permission"><span
                                    class="icon-font">Permissions</span></a></li>
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

            <h1 class="booking page-header">
                Vessel Schedules
            </h1>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel booking panel-info">
                        <div class="booking panel-heading">
                            <img src="images/booking.png" class="box-icon">
                            <span class="booking panel-title" style="color:white;">List of Vessel Schedules</span>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered text-center">
                                    <thead>
                                    <tr class="header_center active">
                                        <th class="tb-font-black"><input type="checkbox"></th>
                                        <th class="tb-font-black">Voyage Number</th>
                                        <th class="tb-font-black">Estimated Date of Departure</th>
                                        <th class="tb-font-black">Estimated Date of Arrival</th>
                                        <th class="tb-font-black">Pier Origin</th>
                                        <th class="tb-font-black">Pier Destination</th>
                                        <th class="tb-font-black">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="success">
                                        <td class="tb-font-black"><input type="checkbox"></td>
                                        <td class="tb-font-black">MTY-1035</td>
                                        <td class="tb-font-black">2/14/2014</td>
                                        <td class="tb-font-black">2/14/2014</td>
                                        <td class="tb-font-black">Bacolod City</td>
                                        <td class="tb-font-black">Compostela Valley, Davao City</td>
                                        <td class="tb-font-black">
                                            <a href="vessel-schedule-edit.html"
                                               class="icon-action-link edit-booking"><img src="images/edit-booking.png"
                                                                                          class="icon-action circ-icon"
                                                                                          title="Edit Schedule"> </a>
                                            <a href="#delete-Schedule" class="icon-action-link delete-booking"><img
                                                    src="images/delete-sched.png" class="icon-action circ-icon"
                                                    title="Delete Schedule"> </a>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <ul class="pagination">
                                <li><a href="#">&laquo;</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="booking2.html">2</a></li>
                                <li><a href="booking2.html">&raquo;</a></li>
                            </ul>
							
							<span class="pull-right">
							<a href="vessel-schedule-add.html" class="icon-action-link"><img src="images/add-sched.png"
                                                                                             class="icon-action circ-icon">
                            </a>
							</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!-- END OF MAIN BOX -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/tooltip.js"></script>
        <script src="js/docs.min.js"></script>

</body>
</html>