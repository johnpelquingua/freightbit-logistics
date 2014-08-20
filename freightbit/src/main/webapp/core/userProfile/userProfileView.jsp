<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1>User Profile </h1>
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
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> User Profile</h3>
            </div>

            <div class="panel-body">
                <div class="row">
                	<s:form action="loadEditUserProfile" theme="bootstrap" cssClass="form-horizontal" method="post" name="userProfileViewForm">
                    <s:hidden name="user.userId" value="%{user.userId}"/>
                    <div class="col-md-3 col-lg-3 " align="center"><img alt="User Pic" src="../includes/images/photo.png" class="img-circle"></div>
                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td style="font-weight: bold;">Last Name:</td>
                                <td><s:property value="user.lastName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">First Name:</td>
                                <td><s:property value="user.firstName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Company:</td>
                                <td><s:property value="user.companyName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Username:</td>
                                <td><s:property value="user.userName"/></td>
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
                            </tbody>
                        </table>
                    </div>
                </div>
	            <div class="panel-footer">
                      <span class="pull-right">
                        <a href="../login.action" class="btn btn-default" id="users-add-btn">Cancel</a>
                        <s:submit cssClass="btn btn-info" name="submit" value="Edit"/>
                      </span>
	            </div>
	            </s:form>
            </div>
        </div>
    </div>
</div>