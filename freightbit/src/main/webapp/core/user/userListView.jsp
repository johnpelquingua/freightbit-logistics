<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .userDeleteAction {
        cursor: pointer;
    }
</style>

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
            <li class="active"> User List</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>
<s:if test="hasActionErrors()">
   <div class="col-lg-12">
	   <div class="alert alert-errors">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
   			<strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
		</div>
   </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> User List
                </h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="showSearchFields();">
                        <i class="fa fa-search"></i> Search User
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddUserPage'">
                        <i class="fa fa-male"></i> New User
                    </button>
                </span>
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
                                <td><display:column property="lastName" title="Last Name <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="firstName" title="First Name <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="finalCompanyName" title="Company Name <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="userName" title="Username <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="userType" title="User Type <i class='fa fa-sort' />" class="tb-font-black"/></td>

                                <td class="tb-font-black">
                                    <display:column title="Actions">
                                        <s:url var="loadEditUserUrl" action="loadEditUserPage">
                                            <s:param name="userNameParam" value="#attr.user.userName"></s:param>
                                        </s:url>
                                        <s:a href="%{loadEditUserUrl}" class="icon-action-link" rel="tooltip" title="Edit this user">
                                        <!-- <img src="../includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>--><i class="fa fa-pencil"></i>

                                        <s:url var="deleteUserUrl" action="deleteUser">
                                            <s:param name="userNameParam" value="#attr.user.userName"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteUserUrl}" rel="tooltip" title="Delete this user" onclick="return confirm('Do you really want to delete?');">
                                        </s:a>
                                        <i class="fa fa-trash-o userDeleteAction"></i>

                                        <s:url var="viewUserInfoUrl" action="viewUserInfo">
                                            <s:param name="userNameParam" value="#attr.user.userName"></s:param>
                                        </s:url>
                                        <s:a href="%{viewUserInfoUrl}" class="icon-action-link" rel="tooltip" title="View this user">
                                        <!-- <img src="../includes/images/info-b.png" class="icon-action circ-icon"> </s:a> -->
                                        <i class="fa fa-info-circle"></i>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>
                </div>
            </div>
            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <label>LEGEND:</label>
                        </div>
                        <div class="col-lg-4">
                            <i class="fa fa-pencil"></i> Edit
                        </div>
                        <div class="col-lg-4">
                            <i class="fa fa-trash-o"></i> Delete
                        </div>
                        <div class="col-lg-4">
                            <i class="fa fa-info-circle"></i> Information
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="userDeleteModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="font-size: 1.5em;"><i class="fa fa-warning" style="color: red;"></i> Confirm User Deletion</div>
            <div class="modal-body">
                Are you sure you want to delete this user?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <a class="userDeleteBtn btn btn-danger" href="#">Delete</a>
            </div>
        </div>
    </div>
</div>

<script>
    function showSearchFields() {
        $.ajax({
            url: 'loadSearchUserPage',
            type: 'POST',
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
                /*window.location.href = '#sixth';*/
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    }

    $(document).ready(function(){
        actionConfirmation($('.userDeleteAction'), $('.userDeleteBtn'), $('#userDeleteModal'));
    })
</script>