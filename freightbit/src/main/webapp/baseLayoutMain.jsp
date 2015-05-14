<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>

<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><tiles:insertAttribute name="title" ignore="true"/>
    </title>

    <!-- Bootstrap core CSS -->
    <link href="includes/css/bootstraps.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link rel="stylesheet" href="includes/css/mains.css">
    <link rel="stylesheet" href="includes/css/sb-admin.css">
    <link rel="stylesheet" href="includes/css/datepicker.css">
    <link rel="stylesheet" href="includes/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="includes/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="includes/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">

    <link rel="stylesheet" href="includes/css/jquery-ui.css">
    <link rel="stylesheet" href="includes/css/jquery-ui.min.css">
    <link rel="stylesheet" href="includes/css/jquery-ui.structure.css">
    <link rel="stylesheet" href="includes/css/jquery-ui.structure.min.css">
    <link rel="stylesheet" href="includes/css/jquery-ui.theme.css">
    <link rel="stylesheet" href="includes/css/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="includes/css/jquery.autocomplete.css">

    <!--Javascript here -->
    <%--<script type='text/javascript' src='includes/js/jquery-1.11.1.js'></script>--%>
    <script type='text/javascript' src='includes/js/jquery-2.1.1.js'></script>
    <script type='text/javascript' src='includes/js/bootstrap.js'></script>

    <script type='text/javascript' src='includes/js/jquery-ui.js'></script>
    <script type='text/javascript' src='includes/js/jquery-ui-timepicker-addon.js'></script>
    <script type='text/javascript' src='includes/js/jquery.autocomplete.js'></script>

    <%--<script type='text/javascript' src='includes/js/bootstrap-datepicker.js'></script>--%>
    <%--<script type='text/javascript' src='includes/js/bootstrap-datetimepicker.min.js'></script>--%>

</head>

<body>

<div id="wrapper">

    <div id="page-wrapper">

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

                <tiles:insertAttribute name="menu"/>

                <tiles:insertAttribute name="banner"/>

            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <tiles:insertAttribute name="body"/>

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- JavaScript -->

<script type='text/javascript' src='includes/js/validate.min.js'></script>
<script type='text/javascript' src='includes/js/ernest.js'></script>

<!-- Page Specific Plugins -->

<script src="../includes/js/jquery.tablesorter.js"></script>
<script src="../includes/js/tables.js"></script>
<script src="../includes/js/mask.js"></script>
<script src="../includes/js/jquery.maskMoney.js"></script>
<script src="../includes/js/pdfobject.js"></script>

</body>
</html>
