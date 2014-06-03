<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" />
</title>
<link rel='stylesheet' href='includes/css/bootstrap.css'>
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
</html>