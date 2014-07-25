<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

<h1 class="page-header">Users</h1>

<!-- MAIN BOX -->

    <div class="row">
        <div class="col-md-12">


            <div>
                <div class="panel booking panel-info"  style="float:left; width:50%;">
                    <div class="booking panel-heading">
                        <img src="../includes/images/account.png" class="box-icon">
                        <span class="booking panel-title">User Information</span>
                    </div>
                    <div class="panel-body">
                    <s:form action="User-Info" theme="bootstrap" cssClass="form-horizontal" >
                    <div style="float:left; width:50%;">
                        <img src="../includes/images/default-image.png" style="width:150px;margin:6px;">
                    </div>
                    <div style="float:left; width:50%;">
                        <h2><s:property value="user.name"></s:property></h2>
                        <span>Email Address : <s:property value="user.emailAddress"></s:property> </span>
                        <br>
                        <span>Contact Number : <s:property value="user.contactNumber"></s:property> </span>
                    </div>
                    </div>
                </div>

            </s:form>


        </div>
    </div>
</div>
--%>

<!-- END OF MAIN BOX -->


<!-- END OF THE MIDDLE -->


<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-user"></i> Accounts</li>
            <li class="active"><i class="fa fa-user"></i> User</li>
            <li class="active"><a href="<s:url action='viewUsers' />"> <i class="fa fa-list"></i> User List</a></li>
            <li class="active"><i class="fa fa-info-circle"></i> User Profile</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> User Profile</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-3 col-lg-3 " align="center"><img alt="User Pic" src="../includes/images/photo.png"
                                                                        class="img-circle"></div>

                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td style="font-weight: bold;">User Type:</td>
                                <td><s:property value="user.userType"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Last Name:</td>
                                <td><s:property value="user.lastName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">First Name:</td>
                                <td><s:property value="user.firstName"/></td>
                            </tr>

                            <tr>
                            <tr>
                                <td style="font-weight: bold;">Company:</td>
                                <td><s:property value="user.companyName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Username:</td>
                                <td><s:property value="user.userName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Password:</td>
                                <td><s:property value="user.password"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Title:</td>
                                <td><s:property value="user.title"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">E-mail:</td>
                                <td><s:property value="user.emailAddress"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Contact Number:</td>
                                <td><s:property value="user.contactNumber"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Status:</td>
                                <td><s:property value="user.status"/></td>
                            </tr>

                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- /.row -->


