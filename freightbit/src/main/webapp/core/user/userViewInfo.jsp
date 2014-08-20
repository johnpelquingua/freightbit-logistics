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
            <li class="active"> User Profile</li>
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
                            <tr>
                            	<td style="font-weight: bold;">Permissions:</td>
                            	<!--  <td><s:property value="preSelectedPermissionDesc"/></td>-->
                            	
                            	<td><table><s:iterator value="preSelectedPermissionNames" var="permName">
                            		<tr><td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<s:property value="permName"/></td></tr>
                            	</s:iterator></table></td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>