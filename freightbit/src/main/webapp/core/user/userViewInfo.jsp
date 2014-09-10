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

<%--
<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-info">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> User Profile</h3>
            </div>--%>

<div class="row">
    <div class="col-lg-12" >
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> User Information</h3>
                <span class="pull-right">

                    <s:url var="loadEditUser" action="loadEditUserPage">
                        <s:param name="userNameParam" value="user.userName"></s:param>
                    </s:url>

                    <s:a href="%{loadEditUser}">
                        <button type="button" class="btn btn-success">
                            <i class="fa fa-pencil"></i> Edit User Info
                        </button>
                    </s:a>
                </span>
            </div>

            <div class="panel-body">

                 <%--<div align="center" style="margin-top: 10px;">
                         <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                 </div>--%>

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
                                                 <tr>
                                                     <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Permissions</td>
                                                     <td><table><s:iterator value="preSelectedPermissionNames" var="permName">
                                                        <tr><td><i class="fa fa-check-square-o"></i><s:property value="permName"/></td></tr>
                                                    </s:iterator></table></td>
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

<%--
            </div>
        </div>
    </div>
</div>--%>
