<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script type="text/javascript">
    function move(tr) {
        alert("here");

        while (tr.parentNode && tr.nodeName.toUpperCase() != 'TR') {
            tr = tr.parentNode
        }

        var table1 = document.getElementById('users-list');
        if (!this.rows) {
            var rows = table1.getElementsByTagName('TR');
            this.rows = [];
            for (var z0 = 0; z0 < rows.length; z0++) {
                this.rows[z0] = rows[z0];
            }
        }

        var table2 = document.getElementById('members-list');
        if (tr.parentNode != table2) {
            table2.appendChild(tr);
        } else {
            table1.appendChild(tr);
            for (var z0 = 0; z0 < this.rows.length; z0++) {
                if (this.rows[z0].parentNode == table1) {
                    table1.appendChild(this.rows[z0]);
                }
            }
        }

    }
</script>

<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Accounts</li>
            <li class="active"> Group</li>
            <li class="active"><a href="<s:url action='viewGroups' />"> Group List</a></li>
            <li class="active"> Edit Group</li>
        </ol>

    </div>
</div>
<!-- /.row -->

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
        <div class="col-lg-6 col-lg-offset-3">
            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Group</h3>
                </div>

                <div class="panel-body">
                    <s:form action="editGroup" method="post" cssClass="form-horizontal" theme="bootstrap">
                    <div class="form-group">
                        <label for="code" class="col-lg-2 control-label" style="width:20%;">Code</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield required="true" name="groupBean.groupCode" cssClass="form-control" pattern="^[A-Z]{3,}$" id="groupCode"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-lg-2 control-label" style="width:20%;">Name</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield required="true" name="groupBean.groupName" cssClass="form-control" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" maxlength="50"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="Description" class="col-lg-2 control-label" style="width:20%;">Description</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="groupBean.description" cssClass="form-control" maxLength="255" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"/>
                        </div>
                    </div>

                    <s:hidden name="groupBean.groupId" value="%{groupBean.groupId}"/>

                <span class="pull-right">
                    <a href="viewGroups" class="btn btn-danger ">Cancel</a>
                    <s:submit name="submit" value="Save" cssClass="btn btn-primary"/>
                </span>

                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->

    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-group"></i> Users</h3>
                </div>

                <div class="panel-body">

                    <div class="table-responsive list-table">

                        <tbody>
                        <table>
                            <tr>

                                <display:table id="user" name="users" requestURI="/loadEditGroupPage.action"
                                               pagesize="5"
                                               class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px;">
                                    <td><display:column property="userId" title="User ID" class="tb-font-black"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="username" title="User Name" class="tb-font-black"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="client.clientName" title="Company"
                                                        class="tb-font-black"
                                                        style="text-align: center;"> </display:column></td>
                                    <td class="tb-font-black" style="text-align: center;">
                                        <display:column title="Actions">

                                            <s:url var="addUserToGroupUrl" action="addUserToGroupForEdit">
                                                <s:param name="userNameParam" value="#attr.user.username"></s:param>
                                                <s:set name="groupCode" value="%{#attr.groupBean.groupCode}"
                                                       scope="session"/>
                                                <s:set name="groupName" value="%{#attr.groupBean.groupName}"
                                                       scope="session"/>
                                                <s:set name="groupDesc" value="%{#attr.groupBean.description}"
                                                       scope="session"/>
                                                <s:set name="groupId" value="%{#attr.groupBean.groupId}"
                                                       scope="session"/>
                                            </s:url>
                                            <s:a href="%{addUserToGroupUrl}" class="icon-action-link"
                                                 title="Add this user"><img src="../includes/images/plus-16.png"> </s:a>


                                        </display:column>
                                    </td>
                                </display:table>

                            </tr>
                        </table>
                        </tbody>

                    </div>

                </div>

            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-group"></i> Group Members</h3>
                </div>

                <div class="panel-body">

                    <div class="panel-body">

                        <div class="table-responsive list-table">
                            <tbody>
                            <table>
                                <tr>
                                    <display:table id="groupMember" name="groupMembers"
                                                   requestURI="/loadEditGroupPage.action" pagesize="5"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="userId" title="User ID" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="username" title="User Name" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="client.clientName" title="Company"
                                                            class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">
                                                <s:url var="removeUserFromGroupUrl" action="removeUserFromGroupForEdit">
                                                    <s:param name="userNameParam"
                                                             value="#attr.groupMember.username"></s:param>
                                                    <s:set name="groupCode" value="%{#attr.groupBean.groupCode}"
                                                           scope="session"/>
                                                    <s:set name="groupName" value="%{#attr.groupBean.groupName}"
                                                           scope="session"/>
                                                    <s:set name="groupDesc" value="%{#attr.groupBean.description}"
                                                           scope="session"/>
                                                    <s:set name="groupId" value="%{#attr.groupBean.groupId}"
                                                           scope="session"/>
                                                </s:url>
                                                <s:a href="%{removeUserFromGroupUrl}" class="icon-action-link"
                                                     title="Remove this user"><img
                                                        src="../includes/images/delete-16.png"> </s:a>
                                            </display:column>
                                        </td>
                                    </display:table>
                                </tr>
                            </table>
                            </tbody>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

</s:form>
<script>
    $("#groupCode").keyup(function(){
        this.value=this.value.toUpperCase();
    });

</script>

