<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Accounts</li>
            <li class="active"> User</li>
            <li class="active"> User List</li>
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
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> User List</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="user" name="users" requestURI="viewUsers.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="title" title="Title <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="firstName" title="First Name <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="lastName" title="Last Name <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="companyName" title="Company Name <i class='fa fa-sort' />"
                                                    class="tb-font-black"/></td>
                                <td><display:column property="userName" title="User Name <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="userType" title="User Type <i class='fa fa-sort' />" class="tb-font-black"/></td>

                                <td class="tb-font-black">
                                    <display:column title="Actions">
                                        <s:url var="loadEditUserUrl" action="loadEditUserPage">
                                            <s:param name="userNameParam" value="#attr.user.userName"></s:param>
                                        </s:url>
                                        <s:a href="%{loadEditUserUrl}" class="icon-action-link" rel="tooltip"
                                             title="Edit this user"><img src="../includes/images/edit-user.png"
                                                                         class="icon-action circ-icon"> </s:a>
                                        <s:url var="deleteUserUrl" action="deleteUser">
                                            <s:param name="userNameParam" value="#attr.user.userName"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteUserUrl}" rel="tooltip"
                                             title="Delete this user"
                                             onclick="return confirm('Do you really want to delete?');"><img
                                                src="../includes/images/remove-user.png"
                                                class="icon-action circ-icon"> </s:a>
                                        <s:url var="viewUserInfoUrl" action="viewUserInfo">
                                            <s:param name="userNameParam" value="#attr.user.userName"></s:param>
                                        </s:url>
                                        <s:a href="%{viewUserInfoUrl}" class="icon-action-link" rel="tooltip"
                                             title="View this user"><img src="../includes/images/info-b.png"
                                                                         class="icon-action circ-icon"> </s:a>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-right">
                    <a href="loadAddUserPage" class="icon-action-link" rel="tooltip" title="Add User"><img
                            src="../includes/images/add-user.png" class="icon-action circ-icon"> </a>
                </span>
            </div>
        </div>
    </div>
</div>