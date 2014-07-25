<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>ERNEST Logistics Corporation</title>
    <link rel='stylesheet' href='includes/css/bootstraps.css'>
    <link rel='stylesheet" href="includes/css/mains.css'>
    <link rel="shortcut icon" href="http://www.ernest.com.ph/sites/default/files/favicon.ico"/>

    <s:head/>
</head>
<body style="background:url('includes/images/ernestlogo.jpg') no-repeat center center fixed; background-size:cover;">
<%--<div class="navbar navbar-fixed-top">
    <div class="navbar-inner" style="height: 80px; background: url('includes/images/background.jpg'); filter: none;">
        <div class="container">
            <brand>
                <img src="../includes/images/reallogo.png" style="margin-top: 20px; ">
            </brand>
        </div>
    </div>
</div>--%>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="margin-top: 165px;">
            <div class="panel panel-default" style="border-color:#000 !important;">
                <div class="panel-heading" style="font-size: 24px;background-color: #000;">
                    <img src="includes/images/ernest-logo_2.png"
                         style="display: block; margin-left: auto; margin-right: auto; width: 80%;">
                </div>
                <s:actionerror/>
                <div class="panel-body" style="margin-bottom: -30px;">
                    <form class="form-horizontal" role="form" theme="bootstrap"  action="<c:url value='j_spring_security_check' />" method='POST'>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" style="padding-top: 6px;">
                                Username</label>

                            <div class="col-sm-9" style="margin-bottom: 15px;">
                                <s:textfield name="username" cssClass="form-control" placeholder="Username" required="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" style="padding-top: 6px;">
                                Password</label>

                            <div class="col-sm-9">
                                <s:password name="password" type="password" cssClass="form-control" placeholder="Password" required="true"/>
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="j_spring_security_remember_me"/>
                                        Remember me
                                    </label>
                                </div>
                            </div>
                        </div>-->
                        <div class="form-group last">
                            <div class="col-sm-offset-9 ">
                                <s:submit cssClass="btn btn-info btn-sm" method="execute" value="Login"
                                          style=" color: #eac117; background-color: #000; border-color: #ddd; margin-left: 5px; padding: 5px 15px 5px 15px;"/>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>
                <%--<div class="white navbar-fixed-bottom" style="padding-top: 20px; height: 80px; background: url('includes/images/background.jpg');">

                </div>--%>
            </div>
        </div>
    </div>
</div>
</body>
</html>