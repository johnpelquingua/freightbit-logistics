<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Accounts</li>
            <li class="active"> Group</li>
            <li class="active"> Permissions</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Permissions</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="permission" name="permissions" requestURI="/viewUsers.action"
                                           pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="permissionName" title="Permissions"
                                                    class="tb-font-black"/></td>
                                <td><display:column property="userGroups" title="Users/Groups"
                                                    class="tb-font-black"/></td>
                                <td class="tb-font-black">
                                    <display:column title="Actions">
                                        <a href="<s:url value='loadEditPermissions' />" class="icon-action-link"><img
                                                src="../includes/images/edit-user.png" class="icon-action circ-icon">
                                        </a>
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
                    <a href="<s:url value='loadEditPermissions' />" class="icon-action-link"><img
                            src="../includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                </span>

            </div>
        </div>
    </div>
</div>


