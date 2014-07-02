 <html lang="en"><head>
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

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  <style id="holderjs-style" type="text/css"></style></head>

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
				<li class="topfirst "><a href="home2.html" class="icon-home"><span class="icon-font">Dashboard</span></a></li>
				<li class="topmenu"><a href="booking.html" class="icon-booking"><span class="icon-font">Booking</span></a></li>
				<li class="topmenu activeoperation"><a href="#" class="icon-operation"><span class="icon-font">Operations</span></a>
					<ul>
						<li class="subfirst">
							<a href="inland-operation.html" class="icon-vendor"><span class="icon-font">Inland Freight</span></a>
						</li>
						<li class="subfirst"><a href="seafreight-operation.html" class="icon-sea"><span class="icon-font">Sea Freight</span></a></li>
						<li class="subfirst">
							<a href="vessel-schedule.html" class="icon-vessel"><span class="icon-font">Vessel Schedule</span></a>
						</li>
						<li class="subfirst"><a href="updateStatusList.html" class="icon-operation"><span class="icon-font">Status</span></a></li>
					</ul>
				</li>
				<li class="topmenu"><a href="#" class="icon-document"><span class="icon-font">Documentations</span></a></a></li>
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
        
		<h1 class="page-header">Edit Vessel Schedule</h1>
		
		<!-- EDIT HERE -->

		<div class="row" >
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<img src="images/add-user.png" class="box-icon">
						<span class="panel-title">Vessel Schedule</span>
					</div>
					<div class="panel-body">

						<form class="form-horizontal" role="form">

							  <div class="form-group">

							    <label for="voyagenum" class="col-sm-2 control-label">Voyage Number:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="voyagenum">
							    </div>

							  </div>
							  
							  <div class="form-group">

							    <label for="timeOfdep" class="col-sm-2 control-label"> Time of Departure:</label>

							    <div class="col-sm-10">
							      <input type="time" class="form-control" id="timeOfdep" >
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="dateOfdep" class="col-sm-2 control-label"> Date of Departure:</label>

							    <div class="col-sm-10">
							      <input type="date" class="form-control" id="dateOfdep" >
							    </div>

							  </div>
							  
							  <div class="form-group">

							    <label for="dateOfarv" class="col-sm-2 control-label">Date of Arrival:</label>

							    <div class="col-sm-10">
							      <input type="date" class="form-control" id="dateOfarv" >
							    </div>

							  </div>
							  
							  <div class="form-group">

							    <label for="Origin" class="col-sm-2 control-label">Pier Origin:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="Origin" >
							    </div>

							  </div>
							  
							  <div class="form-group">

							    <label for="Origin" class="col-sm-2 control-label">Pier Destination:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="Origin" >
							    </div>

							  </div>
							  
						</form>
						
						<div style="float: right;">
							<button class="btn btn-default" onclick="location.href='vessel-schedule-list.html'">Save</button>
							<button class="btn btn-default" onclick="location.href='vessel-schedule-list.html'">Cancel</button>
						</div>

					</div>

				</div>
				
			</div>



		</div>

		
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->
		
		</div>
	  </div>
	</div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
  

</body>
</html>