<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" />
</title>
<link rel='stylesheet' href='includes/css/bootstrap-x.css'>
<link rel='stylesheet' href='includes/css/main.css'>
<script type='text/javascript' src='includes/js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='includes/js/bootstrap.min.js'></script>
<script type='text/javascript' src='includes/js/bootstrap-datepicker.js'></script>

    <sb:head/>
    <sx:head />
</head>

<body>

   <tiles:insertAttribute name="banner" />
   <div class="container-fluid">
    <div class="row">
        <tiles:insertAttribute name="menu" />
        <tiles:insertAttribute name="body" />
    </div>
   </div>
</body>
</html>--%>








<!DOCTYPE html>

<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><tiles:insertAttribute name="title" ignore="true" />
    </title>

    <!-- Bootstrap core CSS -->

    <link href="includes/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->

    <link rel='stylesheet' href='includes/css/main.css'>
    <link href="includes/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="includes/font-awesome/css/font-awesome.min.css">

</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><img src="includes/images/reallogo.png" width="300px"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">

            <tiles:insertAttribute name="menu" />

            <tiles:insertAttribute name="banner" />


        </div><!-- /.navbar-collapse -->
    </nav>

    <tiles:insertAttribute name="body" />

</div><!-- /#wrapper -->

<!-- JavaScript -->

<script type='text/javascript' src='includes/js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='includes/js/bootstrap.js'></script>

<!-- Page Specific Plugins -->

<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> -->
<!-- <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script> -->
<!-- <script src="js/morris/chart-data-morris.js"></script> -->
<!-- <script src="js/tablesorter/jquery.tablesorter.js"></script> -->
<!-- <script src="js/tablesorter/tables.js"></script> -->

</body>
</html>
