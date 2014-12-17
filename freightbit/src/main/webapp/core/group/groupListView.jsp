<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
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
            <li class="active"> Group</li>
            <li class="active"> Group List</li>
        </ol>

    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Group List
                </h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddGroupPage'">
                        <i class="fa fa-group"></i> New Group
                    </button>
                </span>
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
                                        <s:a href="%{loadEditGroupUrl}" class="icon-action-link" rel="tooltip" title="Edit this group">
                                        <!-- <img src="../includes/images/edit-user.png" class="icon-action circ-icon"> </s:a> --><i class="fa fa-pencil"></i>
                                        <s:url var="deleteGroupUrl" action="deleteGroup">
                                            <s:param name="groupCodeParam" value="#attr.group.groupCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteGroupUrl}" rel="tooltip" title="Delete this group" onclick="return confirm('Do you really want to delete?');">
                                        <!-- <img src="../includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>--><i class="fa fa-trash-o"></i>
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
                        <table class="col-lg-12">
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class='fa fa-pencil' ></i> Edit</td>
                                <td><i class='fa fa-trash' ></i> Delete</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <%--<div class="panel-footer">

                <span class="pull-right">
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddGroupPage'">
                        <i class="fa fa-group"></i> New Group
                    </button>
                </span>

            </div>--%>

        </div>
    </div>
</div>



