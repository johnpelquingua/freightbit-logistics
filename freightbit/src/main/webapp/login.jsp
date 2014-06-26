<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>Ernest Login Page</title>
    <link rel='stylesheet' href='includes/css/bootstrap.css'>
    <link rel='stylesheet" href="includes/css/main.css'>
    <s:head />
</head>
<body style="background:url('includes/images/ernest1.jpg') no-repeat center center fixed; background-size:cover;">
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner" style="height: 80px; background: url('includes/images/background.jpg'); filter: none;">
        <div class="container">
            <brand>
                <img src="includes/images/reallogo.png" style="margin-top: 20px; ">
            </brand>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="margin-top: 250px;">
            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: 24px;">
                    Sign-In
                </div>
                <s:actionerror />
                <div class="panel-body">
                    <s:form class="form-horizontal" role="form" action="login" method="post" theme="bootstrap">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" style="padding-top: 6px;">
                                Username</label>
                            <div class="col-sm-9" style="margin-bottom: 15px;">
                                <s:textfield name="username" cssClass="form-control" placeholder="Username"  />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" style="padding-top: 6px;">
                                Password</label>
                            <div class="col-sm-9">
                                <s:password name="password" type="password" cssClass="form-control" placeholder="Password"  />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"/>
                                        Remember me
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group last">
                            <div class="col-sm-offset-9 ">
                                <s:submit cssClass="btn btn-info btn-sm" method="execute" value="Login" />
                            </div>
                        </div>
                    </s:form>
                </div>
                <div class="white navbar-fixed-bottom" style="padding-top: 20px; height: 80px; background: url('includes/images/background.jpg');">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>