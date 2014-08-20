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

<div class="panel-body">
<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-info">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> User Profile</h3>
            </div>

             <div align="center" style="margin-top: 10px;">
                     <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
             </div>
                                   
             <table class="table table-user-information profile">
                 <tbody>
                 <tr>
                     <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">User Type</td>
                      <td style="border-top: none;"><s:property value="user.userType"/></td>
                 </tr>
                 <tr>
                      <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Last Name</td>
                      <td style="border-top: none;"><s:property value="user.lastName"/></td>
                 </tr>
                 <tr>
                     <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">First Name</td>
                      <td style="border-top: none;"><s:property value="user.firstName"/></td>
                 </tr>

                 <tr>
                 <tr>
                      <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Company</td>
                      <td style="border-top: none;"><s:property value="user.companyName"/></td>
                 </tr>
                 <tr>
                      <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Username</td>
                      <td style="border-top: none;"><s:property value="user.userName"/></td>
                 </tr>
                 <tr>
                      <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Title</td>
                      <td style="border-top: none;"><s:property value="user.title"/></td>
                 </tr>
                 <tr>
                      <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">E-mail</td>
                      <td style="border-top: none;"><s:property value="user.emailAddress"/></td>
                 </tr>
                 <tr>
                      <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Contact Number</td>
                     <td style="border-top: none;"><i class="fa fa-phone"></i><s:property value="user.contactNumber"/></td>
                 </tr>
                 <tr>
                      <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Status</td>
                      <td style="border-top: none;"><s:property value="user.status"/></td>
                 </tr>
                 <tr>
                 	 <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Permissions</td>                          	
                 	 <td style="border-top: none;"><table><s:iterator value="preSelectedPermissionNames" var="permName">
                 		<tr><td><i class="fa fa-check-square-o"></i><s:property value="permName"/></td></tr>
                 	</s:iterator></table></td>
                 </tr>
                 </tbody>
             </table>

                   
            </div>

            </div>
        </div>
    </div>
</div>