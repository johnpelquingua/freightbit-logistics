<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="true" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>ERNEST Logistics Corporation</title>
    <link rel="stylesheet" href="../includes/css/bootstraps.css">
    <link rel="stylesheet" href="../includes/css/404.css">
    <link rel="shortcut icon" href="http://www.ernest.com.ph/sites/default/files/favicon.ico"/>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand"><img src="../includes/images/reallogo.png" width="300px"></a>
        </div>
    </nav>

    <div class="wrap">
        <div class="header">
            <div class="logo">
                <h1><a href="#">Ohh</a></h1>
            </div>
        </div>
        <div class="content">
            <img src="../includes/images/error-img-404.png" title="error" />
            <p><span><label>Hi, </label><c:out value="${sessionScope.loggedinUser}"/></span> you do not have permission to accesss this page!</p>
        </div>
    </div>

</body>
</html>

