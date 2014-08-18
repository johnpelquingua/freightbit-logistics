<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>ERNEST Logistics Corporation</title>
    <link rel='stylesheet' href='includes/css/bootstraps.css'>
    <link rel='stylesheet' href='includes/css/mains.css'>
    <link rel="shortcut icon" href="http://www.ernest.com.ph/sites/default/files/favicon.ico"/>

    <s:head/>
</head>

<body style="background:url('includes/images/ernestlogo.jpg') no-repeat center center fixed; background-size:cover;">
<%--<div class="navbar navbar-fixed-top">
    <div class="navbar-inner" style="height: 80px; background: url('..includes/images/background.jpg'); filter: none;">
        <div class="container">
            <brand>
                <img src="../..includes/images/reallogo.png" style="margin-top: 20px; ">
            </brand>
        </div>
    </div>
</div>--%>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="margin-top: 100px;">
            <div class="panel panel-default" style="border-color:#000 !important;">
                <div class="panel-heading" style="font-size: 24px;background-color: #000;">
                    <img src="includes/images/ernest-logo_2.png"
                         style="display: block; margin-left: auto; margin-right: auto; width: 80%;">
                </div>
                <s:actionerror/>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" theme="bootstrap"  action="<c:url value='j_spring_security_check' />" method='POST'>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						      <font color="red">
						        <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.
						      </font>
						</c:if>
                        <div class="form-group">
                            <label class="col-lg-12 control-label title-label" style="text-align: left">
                                Username</label>

                            <div class="col-lg-12">
                                <s:textfield name="username" cssClass="form-control" required="true" cssStyle="background: url('includes/images/asterisk.png'); background-attachment: scroll; background-position: 100% 50%; background-repeat: no-repeat;"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-12 control-label title-label" style="text-align: left">
                                Password</label>

                            <div class="col-lg-12">
                                <s:password name="password" type="password" cssClass="form-control" required="true" cssStyle="background: url('includes/images/asterisk.png'); background-attachment: scroll; background-position: 100% 50%; background-repeat: no-repeat;"/>
                            </div>
                        </div>

                        <div class="form-group" style="border-bottom: 1px solid #cdcdcd; padding-bottom: 15px;">
                            <div class="col-lg-12">
                                <div class="checkbox">
                                    <label style="font-size: 12px; font-weight: normal; line-height: 18px;">
                                        <input type="checkbox" name="j_spring_security_remember_me"/>
                                        Remember me on this computer
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group last" style="margin-bottom: -10px;">
                            <div class="col-sm-offset-6 ">
                                <s:submit cssClass="btn btn-primary btn-sm" method="execute" value="Log in" cssStyle="margin-right: 15px;"/>
                                          <%--style=" color: #eac117; background-color: #000; border-color: #ddd; margin-left: 5px; padding: 5px 15px 5px 15px;"/>--%>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>