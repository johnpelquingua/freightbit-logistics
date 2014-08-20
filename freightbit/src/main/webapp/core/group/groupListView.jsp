<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Accounts</li>
            <li class="active"> Group</li>
            <li class="active"> Group List</li>
        </ol>

    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Group List</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="group" name="groups" requestURI="/viewGroups.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="groupCode" title="Group Code <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="groupName" title="Group Name <i class='fa fa-sort' />" class="tb-font-black"/></td>
                                <td><display:column property="membersNum" title="No. of Members <i class='fa fa-sort' />"
                                                    class="tb-font-black"/></td>
                                <td class="tb-font-black">
                                    <display:column title="Actions">
                                        <s:url var="loadEditGroupUrl" action="loadEditGroupPage">
                                            <s:param name="groupCodeParam" value="#attr.group.groupCode"></s:param>
                                        </s:url>
                                        <s:a href="%{loadEditGroupUrl}" class="icon-action-link" rel="tooltip"
                                             title="Edit this group"><img src="../includes/images/edit-user.png"
                                                                          class="icon-action circ-icon"> </s:a>
                                        <s:url var="deleteGroupUrl" action="deleteGroup">
                                            <s:param name="groupCodeParam" value="#attr.group.groupCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteGroupUrl}" rel="tooltip"
                                             title="Delete this group"
                                             onclick="return confirm('Do you really want to delete?');"><img
                                                src="../includes/images/remove-user.png"
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
                <a href="<s:url action='loadAddGroupPage'/>" class="icon-action-link"><img
                        src="../includes/images/add-user.png" class="icon-action circ-icon"> </a>
                </span>

            </div>

        </div>
    </div>
</div>



