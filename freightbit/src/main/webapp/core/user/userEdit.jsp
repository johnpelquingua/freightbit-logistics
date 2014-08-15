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
            <li class="active"> Edit User</li>
        </ol>

    </div>
</div>


<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit User</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">

                    <s:form action="editUser" theme="bootstrap" cssClass="form-horizontal" method="post" name="addForm">
                    <s:hidden name="user.userId" value="%{user.userId}"/>
                    
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
                            <s:textfield required="true" name="user.firstName" id="firstName" cssClass="form-control" maxlength="25"
                                         placeholder="First Name"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="LastName" class="col-lg-3 control-label" id="users-add-label">Last Name:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.lastName" id="lastName" cssClass="form-control" maxlength="25"
                                         placeholder="Last Name"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="uUserName" class="col-lg-3 control-label" id="users-add-label">User Name:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.userName" id="uUserName" cssClass="form-control" maxlength="25" pattern="[^\s]{4,25}"
                                         placeholder="User Name" title="Username must have minimum 4 characters."/>
                        </div>
                    </div>

                 <div class="form-group">
                        <label for="uPassword" class="col-lg-3 control-label" id="users-add-label">Password:</label>

                        <div class="col-lg-9">
                            <s:url var="loadChangePasswordUrl" action="loadChangePassword">
                                <s:param name="userNameParam" value="%{user.userName}"></s:param>
                            </s:url>
                            <s:a href="%{loadChangePasswordUrl}" class="btn btn-default" id="users-add-btn">Change Password</s:a>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uTitle" class="col-lg-3 control-label" id="users-add-label">Title:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.title" id="uTitle" cssClass="form-control" maxlength="50"
                                         placeholder="Title"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uEmailAddress" class="col-lg-3 control-label" id="users-add-label">Email
                            Address:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.emailAddress" id="uEmailAddress" maxlength="50" 
                            pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
                                         cssClass="form-control" placeholder="Email Address"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uContactNumber" class="col-lg-3 control-label" id="users-add-label">Contact
                            Number:</label>

                        <div class="col-lg-9">
                            <s:textfield required="true" name="user.contactNumber" id="uContactNumber"
                                         cssClass="form-control" placeholder="Contact Number" maxLength="11" 
                                     	 pattern="\d{7,11}" title="Contact Number should not contain special characters and/or letters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="uStatus" class="col-lg-3 control-label" id="users-add-label">Status:</label>

                        <div class="col-lg-9">
                            <s:select required="true" name="user.status" id="uStatus" list="statusList" listKey="key"
                                      listValue="value" cssClass="form-control" value="user.status"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="uStatus" class="col-lg-3 control-label" id="users-add-label">Permissions:</label>

                        <div class="col-lg-9">
                        <s:checkboxlist list="permissionsList"  name="permissionsSelected" value="preSelectedPermissions" listKey="permissionId" listValue="permissionName"/>
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

            </s:form>
        </div>
    </div>
</div>
