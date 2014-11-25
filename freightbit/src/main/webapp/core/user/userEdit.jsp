<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-user"></i> Accounts Module </h1>
            </span>
        </legend>
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
    <div class="col-md-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit User</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

            <s:form action="editUser" theme="bootstrap" cssClass="form-horizontal" method="post" name="addForm">
                    <s:hidden name="user.userId" value="%{user.userId}"/>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;"> User Type<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:select name="user.userType" id="userTypeSelect" list="userTypeList" listKey="key"
                                          listValue="value" cssClass="form-control" value="user.userType"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Company <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield disabled="true" required="true" name="user.companyName" cssClass="form-control"
                                             placeholder="Company Name"/>
                                <s:hidden name="user.companyName" value="%{user.companyName}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">First Name <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield required="true" name="user.firstName" id="firstName" cssClass="form-control" maxlength="25"
                                             placeholder="First Name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Last Name <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield required="true" name="user.lastName" id="lastName" cssClass="form-control" maxlength="25"
                                             placeholder="Last Name"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">User Name <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield required="true" name="user.userName" id="uUserName" cssClass="form-control" maxlength="25" pattern="[^\s]{4,25}"
                                             placeholder="User Name" title="Username must have minimum 4 characters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Password <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:url var="loadChangePasswordUrl" action="loadChangePassword">
                                    <s:param name="userIdParam" value="%{user.userId}"></s:param>
                                </s:url>
                                <s:a href="%{loadChangePasswordUrl}" class="btn btn-default" id="users-add-btn">Change Password </s:a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Title <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield required="true" name="user.title" id="uTitle" cssClass="form-control" maxlength="50"
                                             placeholder="Title"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Email
                                Address <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield required="true" name="user.emailAddress" id="uEmailAddress" maxlength="50"
                                             pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
                                             cssClass="form-control" placeholder="Email Address"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Contact
                                Number <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:textfield required="true" name="user.contactNumber" id="uContactNumber"
                                             cssClass="form-control" placeholder="Contact Number" maxLength="14"
                                             pattern="\([0-9]{2,3}\) ?[0-9]{3}-[0-9]{4}" title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Status <span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:select required="true" name="user.status" id="uStatus" list="statusList" listKey="key"
                                          listValue="value" cssClass="form-control" value="user.status"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Customer<span class="asterisk_red"></span></label>

                            <div class="col-lg-9">
                                <s:select name="user.customerId" id="customerCodeTextBox" list="customerList" listKey="customerId"
                                          listValue="customerName" cssClass="form-control" value="user.customerId" disabled="true" emptyOption="true"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="users-add-label" style="padding-top:0px;">Permissions </label>

                            <div class="col-lg-9">
                                <s:checkboxlist list="permissionsList"  name="permissionsSelected" value="preSelectedPermissions" listKey="permissionId" listValue="permissionName"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-right">
                  <a href="viewUsers" class="btn btn-default" id="users-add-btn">Cancel</a>
                  <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </span>
            </div>
            </s:form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){

        $("#uContactNumber").mask("(999) 999-9999");

        //if default value of User Type is 'CUSTOMER'
        if ($('#userTypeSelect').val() == 'CUSTOMER') {
            $("#customerCodeTextBox").prop("disabled", false);
            $("#customerCodeTextBox").prop("required", true);
        } else {
            $("#customerCodeTextBox").prop("disabled", true);
            $("#customerCodeTextBox").prop("required", false);
        }
        
        $("#userTypeSelect").change(function() {
            if (this.value == "CUSTOMER") {
                $("#customerCodeTextBox").prop("disabled", false);
                $("#customerCodeTextBox").prop("required", true);
            } else {
                $("#customerCodeTextBox").prop("disabled", true);
                $("#customerCodeTextBox").prop("required", false);
            }
        }).change();

    });

</script>