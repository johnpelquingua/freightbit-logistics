<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Accounts</li>
            <li class="active"> User</li>
            <li class="active"><a href="<s:url action='viewUsers' />"> User List</a></li>
            <li class="active"> Add New User</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add New User</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">

                    <s:form action="addUser" theme="bootstrap" cssClass="form-horizontal" method="post" name="addForm">
                    <div class="form-group">
                        <label for="uType" class="col-lg-3 control-label" id="users-add-label"> User Type:</label>

                        <div class="col-lg-9">
                            <s:select name="user.userType" id="uType" list="userTypeList" listKey="key"
                                      listValue="value" cssClass="form-control" value="user.userType"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uCompanyName" class="col-lg-3 control-label" id="users-add-label">Company:</label>

                        <div class="col-lg-9">
                            <s:textfield disabled="true" required="true" name="user.companyName" cssClass="form-control"
                                         placeholder="Company Name"/>
                            <s:hidden name="user.companyName" value="%{user.companyName}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstName" class="col-lg-3 control-label" id="users-add-label">First Name:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.firstName" id="firstName" cssClass="form-control"
                                         placeholder="First Name"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="LastName" class="col-lg-3 control-label" id="users-add-label">Last Name:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.lastName" id="lastName" cssClass="form-control"
                                         placeholder="Last Name"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="uUserName" class="col-lg-3 control-label" id="users-add-label">User Name:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.userName" id="uUserName" cssClass="form-control"
                                         placeholder="User Name"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uPassword" class="col-lg-3 control-label" id="users-add-label">Password:</label>

                        <div class="col-lg-9">
                            <s:password required="true" name="user.password" id="uPassword" cssClass="form-control"
                                         placeholder="Password"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="uPassword" class="col-lg-3 control-label" id="users-add-label">Re-enter Password:</label>

                        <div class="col-lg-9">
                            <s:password required="true" name="user.reenterPassword" id="uReenterPassword" cssClass="form-control"
                                         placeholder="Re-enter Password"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uTitle" class="col-lg-3 control-label" id="users-add-label">Title:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.title" id="uTitle" cssClass="form-control"
                                         placeholder="Title"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uEmailAddress" class="col-lg-3 control-label" id="users-add-label">Email
                            Address:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.emailAddress" id="uEmailAddress"
                                         cssClass="form-control" placeholder="Email Address"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uContactNumber" class="col-lg-3 control-label" id="users-add-label">Contact
                            Number:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.contactNumber" id="uContactNumber"
                                         cssClass="form-control" placeholder="Contact Number"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uStatus" class="col-lg-3 control-label" id="users-add-label">Status:</label>

                        <div class="col-lg-9">
                            <s:select required="true" name="user.status" id="uStatus" list="statusList" listKey="key"
                                      listValue="value" cssClass="form-control" value="user.status"/>
                        </div>
                    </div>
                </div>


            </div>

            <div class="panel-footer">
                            <span class="pull-right">
                              <a href="viewUsers" class="btn btn-default" id="users-add-btn">Cancel</a>
                              <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                            </span>
            </div>
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </s:form>
        </div>
    </div>
</div>