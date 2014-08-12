<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Users</h1>

    <div class="row alert alert-success alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Success!</strong> The data has been successfully saved.
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">

                <div class="panel-heading">
                    <img src="../includes/images/listofusers.png" class="box-icon"/>
						<span class="panel-title">Edit User</h3>
                </div>

                <div class="panel-body">


                    <div class="form-group">
                        <label for="uType" class="col-sm-2 control-label">User Type:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uUserType" name="user.userType"
                                         placeholder="User type"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uName" class="col-sm-2 control-label">First Name:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uFirstName" name="user.firstName"
                                         placeholder="First Name"></s:textfield>
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="form-group">
                            <label for="uName" class="col-sm-2 control-label">Last Name:</label>

                            <div class="col-sm-10">
                                <s:textfield disabled="true" cssClass="form-control" id="uLastName" name="user.LastName"
                                             placeholder="Last Name"></s:textfield>
                            </div>
                        </div>

                        <label for="uCompanyName" class="col-sm-2 control-label">Company:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uCompanyName"
                                         name="user.companyName" placeholder="Company Name"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uUserName" class="col-sm-2 control-label">User Name:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uUserName" name="user.userName"
                                         placeholder="User Name"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uPassword" class="col-sm-2 control-label">Password:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uPassword" name="user.password"
                                         placeholder="Password"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uTitle" class="col-sm-2 control-label">Title:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uTitle" name="user.title"
                                         placeholder="Title"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uEmailAddress" class="col-sm-2 control-label">Email Address:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uEmailAddress"
                                         name="user.emailAddress" placeholder="Email Address"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uContactNumber" class="col-sm-2 control-label">Contact Number:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uContactNumber"
                                         name="user.contactNumber" placeholder="Contact Number"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uStatus" class="col-sm-2 control-label">Status:</label>

                        <div class="col-sm-10">
                            <s:textfield disabled="true" cssClass="form-control" id="uStatus" name="user.status"
                                         placeholder="Status"></s:textfield>
                        </div>
                    </div>
                </div>
            </div>


        </div>

    </div>
</div>