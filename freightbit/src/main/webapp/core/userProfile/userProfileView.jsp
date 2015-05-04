<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
        <h1><i class="fa fa-user"></i> User Profile </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Accounts</li>
            <li class="active"> User</li>
            <li class="active"><a href="<s:url action='viewUsers' />"> User List</a></li>
            <li class="active"> User Profile</li>
        </ol>
    </div>
</div>

<div class="row">
    <s:if test="hasActionMessages()">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </s:if>
</div>

<s:form action="loadEditUserProfile" theme="bootstrap" cssClass="form-horizontal" method="post" name="userProfileViewForm">
    <div class="row">
        <div class="panel-body">
            <div class="panel panel-primary">
                <div class="panel-heading"><h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-user"></i> User Profile</h3>
                    <div class="pull-right">
                        <button class="btn btn-success" type="submit"><i class="fa fa-edit"></i> Edit Profile</button>
                    </div>
                </div>
                <div class="panel-body">

                    <div class="row">

                        <div class="col-lg-6 col-lg-offset-3">

                            <div class="panel panel-info">

                                <div class="row">

                                    <div class="col-lg-12">

                                        <div class="col-lg-3">
                                            <div align="center" style="margin-top: 10px;">
                                                <div align="center" style="margin-top: 10px;">
                                                    <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-9">
                                            <table class="table table-user-information profile" style="margin-top: 10px;">
                                                <tbody>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; border-top: none;text-align: left !important;">User Type</td>
                                                    <td style="border-top: none;"><s:property value="user.userType"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Last Name</td>
                                                    <td><s:property value="user.lastName"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">First Name</td>
                                                    <td><s:property value="user.firstName"/></td>
                                                </tr>

                                                <tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Company</td>
                                                    <td><s:property value="user.companyName"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Username</td>
                                                    <td><s:property value="user.userName"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Title</td>
                                                    <td><s:property value="user.title"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">E-mail</td>
                                                    <td><s:property value="user.emailAddress"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Contact Number</td>
                                                    <td><i class="fa fa-phone"></i><s:property value="user.contactNumber"/></td>
                                                </tr>
                                                <tr>
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Status</td>
                                                    <td><s:property value="user.status"/></td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Permissions</td>
                                                    <td class="permissionsAlign">
                                                        <table>
                                                                <%--<s:iterator value="preSelectedPermissionNames" var="permName">
                                                                   <tr>
                                                                       <td>
                                                                           <i class="fa fa-check-square-o"></i>
                                                                           <s:property value="permName"/>
                                                                       </td>
                                                                   </tr>
                                                                </s:iterator>--%>
                                                            <div class="col-lg-9">
                                                                <s:checkboxlist list="permissionsList"  name="permissionsSelected" value="preSelectedPermissions" listKey="permissionId" listValue="permissionName"/>
                                                            </div>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    </row>

                                </div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
    </div>
</s:form>

<%--<div class="panel-body">--%>
<%--<div class="row">--%>
    <%--<div class="col-lg-6 col-lg-offset-2">--%>
        <%--<div class="panel panel-info">--%>

            <%--<div class="panel-heading">--%>
                <%--<h3 class="panel-title"><i class="fa fa-info-circle"></i> User Profile</h3>--%>
            <%--</div>--%>

             <%--<div align="center" style="margin-top: 10px;">--%>
                     <%--<img alt="User Pic" src="../includes/images/photo.png" class="img-circle">--%>
             <%--</div>--%>



                	<%--<s:form action="loadEditUserProfile" theme="bootstrap" cssClass="form-horizontal" method="post" name="userProfileViewForm">--%>
                    <%--<s:hidden name="user.userId" value="%{user.userId}"/>--%>

		             <%--<table class="table table-user-information profile">--%>
		                 <%--<tbody>--%>
		                 <%--<tr>--%>
		                      <%--<td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Last Name</td>--%>
		                      <%--<td style="border-top: none;"><s:property value="user.lastName"/></td>--%>
		                 <%--</tr>--%>
		                 <%--<tr>--%>
		                     <%--<td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">First Name</td>--%>
		                      <%--<td style="border-top: none;"><s:property value="user.firstName"/></td>--%>
		                 <%--</tr>--%>

		                 <%--<tr>--%>
		                 <%--<tr>--%>
		                      <%--<td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Company</td>--%>
		                      <%--<td style="border-top: none;"><s:property value="user.companyName"/></td>--%>
		                 <%--</tr>--%>
		                 <%--<tr>--%>
		                      <%--<td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Username</td>--%>
		                      <%--<td style="border-top: none;"><s:property value="user.userName"/></td>--%>
		                 <%--</tr>--%>
		                 <%--<tr>--%>
		                      <%--<td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Title</td>--%>
		                      <%--<td style="border-top: none;"><s:property value="user.title"/></td>--%>
		                 <%--</tr>--%>
		                 <%--<tr>--%>
		                      <%--<td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">E-mail</td>--%>
		                      <%--<td style="border-top: none;"><s:property value="user.emailAddress"/></td>--%>
		                 <%--</tr>--%>
		                 <%--<tr>--%>
		                      <%--<td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Contact Number</td>--%>
		                     <%--<td style="border-top: none;"><i class="fa fa-phone"></i><s:property value="user.contactNumber"/></td>--%>
		                 <%--</tr>--%>
		                 <%--</tbody>--%>
		                 <%--</table>--%>


			            <%--<div class="panel-footer">--%>
		                      <%--<span class="pull-right">--%>
		                        <%--<a href="../login.action" class="btn btn-default" id="users-add-btn">Cancel</a>--%>
		                        <%--<s:submit cssClass="btn btn-info" name="submit" value="Edit"/>--%>
		                      <%--</span>--%>
			            <%--</div>--%>
	            <%--</s:form>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>