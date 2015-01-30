<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1><i class="fa fa-user"></i> User Profile </h1>
    </div>
</div>
<hr/>


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
                        <button class="btn btn-success" type="submit"><i class="fa fa-edit"></i> Edit</button>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-md-2"><img alt="User Pic" src="../includes/images/photo.png" class="img-circle"></div>
                    <div class="col-md-6">
                        <h4><s:property value="user.firstName"/> <s:property value="user.lastName"/></h4>
                        <s:hidden name="user.userId" value="%{user.userId}"/>
                        <table class="table table-user-information profile">
                            <tr>
                                <td style="border-top: none; width: 30%"><i class="fa fa-user"></i> Username</td>
                                <td style="border-top: none;"><s:property value="user.userName"/></td>
                            </tr>
                            <tr>
                                <td style="border-top: none;"><i class="fa fa-institution"></i> Company</td>
                                <td style="border-top: none;"><s:property value="user.companyName"/></td>
                            </tr>
                            <tr>
                                <td style="border-top: none;"><i class="fa fa-tag"></i> Title</td>
                                <td style="border-top: none;"><s:property value="user.title"/></td>
                            </tr>
                            <tr>
                                <td style="border-top: none;"><i class="fa fa-at"></i> Email</td>
                                <td style="border-top: none;"><s:property value="user.emailAddress"/></td>
                            </tr>
                            <tr>
                                <td style="border-top: none;"><i class="fa fa-phone"></i> Contact Number</td>
                                <td style="border-top: none;"><s:property value="user.contactNumber"/></td>
                            </tr>
                        </table>
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