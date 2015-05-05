<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

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
            <s:url var="loadEditUserUrl" action="loadEditUserPage">
                  <s:param name="userNameParam" value="#attr.user.userName"></s:param>
            </s:url>
            <li class="active"><s:a href="%{loadEditUserUrl}" class="btn btn-default" id="users-add-btn">Edit User</s:a></li>
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
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Change User Password</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">

                    <s:form action="changePassword" theme="bootstrap" cssClass="form-horizontal" method="post" name="addForm">
                    <s:hidden name="user.userId" value="%{user.userId}"/>
                    <s:hidden name="user.userName" value="%{user.userName}"/>
                    
                    <s:if test="!hasActionMessages()">
                    
                    <div class="form-group">
                        <label class="col-lg-4 control-label" id="users-add-label" style="padding-top: 0px;">New Password:</label>

                        <div class="col-lg-8">
                            <s:password required="true" name="passwordBean.newPassword" cssClass="form-control" maxlength="25"
                                        pattern="[^\s]{4,25}" title="Password must have minimum 6 characters without spaces." placeholder="New Password"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-lg-4 control-label" id="users-add-label" style="padding-top: 0px;">Re-type New Password:</label>

                        <div class="col-lg-8">
                            <s:password required="true" name="passwordBean.retypeNewPassword" cssClass="form-control" maxlength="25"
                                        pattern="[^\s]{4,25}" title="Password must have minimum 6 characters without spaces."  placeholder="Re-type New Password"/>
                        </div>
                </div>
                    </s:if>
            </div>

        </div>

        <s:if test="!hasActionMessages()">
            <div class="panel-footer">
                <span class="pull-right">
                    <s:url var="loadEditUserPageUrl" action="loadEditUserPage">
                        <s:param name="userNameParam"
                                 value="user.userName"></s:param>
                    </s:url>
                    <s:a href="%{loadEditUserPageUrl}">
                        <button type="button" id="Cancel" class="btn btn-danger">
                            Cancel
                        </button>
                    </s:a>
                    <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                </span>
            </div>
        </s:if>

        <s:if test="hasActionMessages()">
            <s:a href="%{loadEditUserUrl}" class="btn btn-default" id="users-add-btn"><< Back</s:a>

        </s:if>

        </s:form>

        </div>
    </div>
</div>