<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Ernest Login-In Page</title>
<link rel='stylesheet' href='includes/css/bootstrap.css'>
<link rel='stylesheet" href="includes/css/main.css'>
<s:head />

</head>
<body style="background:url('includes/images/ernest1.jpg') no-repeat center center fixed; background-size:cover;">

<%--<div class="container" style="position: relative; top: 85px; padding-left: 150px; padding-right: 150px;">
    <div class="form-signin" style="max-width: 380px; padding: 10px 35px 30px; margin: 0 auto; background-color: #fff; border: 1px solid rgba(0,0,0,0.1); border-radius: 10px;">

        <s:actionerror />
        <s:form action="login" method="post" theme="bootstrap">
            <h2 class="form-signin-heading" style="margin-bottom: 30px;" >Please Sign In</h2>
                <s:textfield name="username" cssClass="form-control" placeholder="Username" size="20" />
                <s:password name="password" cssClass="form-control" placeholder="Password" size="20" />
                <label class="checkbox">
                      <input type="checkbox" value="remember-me" style="font-weight: normal;" > Remember me
                </label>
                <s:submit method="execute" value="Sign-In" cssClass="btn btn-lg btn-primary btn-block"/>
        </s:form>

    </div>
</div>--%>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-7" style="margin-top: 100px;">
            <div class="panel panel-default" style="opacity: 0.9;   ">
                <div class="panel-heading">
                     Login</div>
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
                            <div class="col-sm-offset-3 col-sm-9 ">
                                <s:submit cssClass="btn btn-info btn-sm" method="execute" value="Sign-In" />

                            </div>
                        </div>
                    </s:form>
                </div>
                <div class="panel-footer">
                    <%--Not Registred? <a href="http://www.jquery2dotnet.com">Register here</a>--%></div>
            </div>
        </div>
    </div>
</div>


</body>
</html>