<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script type="text/javascript">
    /*<![CDATA[*/

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

    /*]]>*/
</script>

<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h1 class="page-header">Groups</h1>

		<!-- MAIN BOX -->
        <s:form action="editGroup" method="post" cssClass="form-horizontal" theme="bootstrap">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
				  <div class="panel-heading">
				  	<img src="../includes/images/groups.png" class="box-icon">
					<span class="panel-title">Edit Group</span>
				  </div>

				  <div class="panel-body">
				  <div style="margin-left:90px">
<!-- HERE -->

		            <div class="form-group">
		                <label for="code" class="col-sm-2 control-label">Code:</label>
		                <s:textfield required="true" cssStyle="margin-bottom:5px;margin-right:5px" name="groupBean.groupCode"  size="80"   />
		             </div>

		            <div class="form-group">
		                <label for="name" class="col-sm-2 control-label">Name:</label>
		                <s:textfield required="true" cssStyle="margin-bottom:5px;margin-right:5px" name="groupBean.groupName"   size="80"/>
		            </div>

		            <div class="form-group">
		                <label for="Description" class="col-sm-2 control-label">Description:</label>
		                <s:textfield cssStyle="margin-bottom:5px; margin-right:5px" name="groupBean.description" size="80"  />
		            </div>
		            
		            <s:hidden name="groupBean.groupId" value="%{groupBean.groupId}"/>
		            
		            <span class="pull-right">
		              <s:submit  name="submit" value="Save" cssStyle="margin:20px 0px 6px 6px;"/>
		              <a href = "viewGroups" class="btn btn-default" style="margin:20px 0px 6px 6px;">Cancel</a>
            		</span>
		            
        			<!-- HERE -->
				</div>
				</div>

				<div class="panel panel-info" style="float: left; width: 50%">
					 <div class="panel-heading">
						<img src="../includes/images/listofusers.png" class="box-icon">
						<span class="panel-title">Staff</span>
					  </div>
		
					<div class="panel-body">
					<div class="table-responsive list-table">
						<table class="table table-striped table-bordered text-center" id="members-list">
							  <thead>
								<tr class="header_center">
							<!-- 	  <th class="tb-font-black"><input type="checkbox" /></th> -->
								  <th class="tb-font-black">User ID</th>
								  <th class="tb-font-black">User Name</th>
								  <th class="tb-font-black">Company</th>
								  <th class="tb-font-black">Action</th>
								</tr>
							  </thead>
							  
							  <tbody>
							  	 <!--<s:if test="groupMembers != null && groupMembers.size > 0">  
							  	 <s:iterator value="groupMembers" status="m">
								 <tr>
								 
								  <td class="tb-font-black"><s:label value="groupMembers[%{#m.index}].username"/><input type="checkbox" /></td>
								  <td class="tb-font-black"><s:property value="userId"/><s:set name="groupMembers[%{#m.index}].userId" value="%{userId}"/></td>
								  <td class="tb-font-black" align="center"><s:property value="username"/><s:set name="groupMembers[%{#m.index}].username" value="%{username}"/></td>
								  <td class="tb-font-black"><s:property value="client.clientName"/><s:set name="groupMembers[%{#m.index}].client.clientName" value="%{client.clientName}"/></td>
								  <td class="tb-font-black">
									<a href="#" class="icon-action-link">
										<img src="../includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>
								   </td>
								 </tr>
								</s:iterator>
								</s:if>-->
								<s:iterator value="groupMembers" status="m">
								 <tr>
								 
							 <!-- 	  <td class="tb-font-black"><input type="checkbox" /></td> -->
								  <td class="tb-font-black"><s:property value="userId"/></td>
								  <td class="tb-font-black" align="center"><s:property value="username"/></td>
								  <td class="tb-font-black"><s:property value="client.clientName"/></td>
								  <td class="tb-font-black">
									<!-- <a href="#" class="icon-action-link">
										<img src="../includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>-->
									<s:url var="removeUserFromGroupUrl" action="removeUserFromGroupForEdit">
								    	<s:param name="userNameParam" value="username"></s:param>
								    	<s:set name="groupCode" value="%{groupBean.groupCode}" scope="session"/>
								    	<s:set name="groupName" value="%{groupBean.groupName}" scope="session"/>
								    	<s:set name="groupDesc" value="%{groupBean.description}" scope="session"/>
								    	<s:set name="groupId" value="%{groupBean.groupId}" scope="session"/>
								    </s:url>
								    <s:a href="%{removeUserFromGroupUrl}"  class="icon-action-link" title="Remove this user"><img src="../includes/images/delete-16.png"> </s:a>
								   </td>
								 </tr>
								</s:iterator>
							  </tbody>
							</table>
						<!-- 	<span class="pull-right">
								<a href="#" class="icon-action-link">
									<img src="../includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
								</a>
							</span> -->
					</div>
					</div>
				</div>

				<div class="panel panel-info" style="width:49%; float:right;">
				    <div class="panel-heading">
						<img src="../includes/images/listofusers.png" class="box-icon">
						<span class="panel-title">Users</span>
					</div>
					
					<div class="panel-body">
					<div class="table-responsive list-table">
						<table class="table table-striped table-bordered text-center" id="users-list">
						  <thead>
							<tr class="header_center">
							<!-- 	<th class="tb-font-black"><input type="checkbox" /></th> -->
							    <th class="tb-font-black">User ID</th>
							    <th class="tb-font-black">User Name</th>
							    <th class="tb-font-black">Company</th>
							    <th class="tb-font-black">Action</th>
							</tr>
					      </thead>
					      
					      <tbody>
					         <s:iterator value="users" var="user">
								<tr>
							<!-- 	  <td class="tb-font-black"><input type="checkbox" /></td> -->
								  <td class="tb-font-black"><s:property value="userId"/></td>
								  <td class="tb-font-black" align="center"><s:property value="username"/></td>
								  <td class="tb-font-black"><s:property value="client.clientName"/></td>
								  <td class="tb-font-black">
								<!-- 	<a href="#" class="icon-action-link">
										<img src="../includes/images/plus-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a> -->
									<s:url var="addUserToGroupUrl" action="addUserToGroupForEdit">
								    	<s:param name="userNameParam" value="username"></s:param>
								    	<s:set name="groupCode" value="%{groupBean.groupCode}" scope="session"/>
								    	<s:set name="groupName" value="%{groupBean.groupName}" scope="session"/>
								    	<s:set name="groupDesc" value="%{groupBean.description}" scope="session"/>
								    	<s:set name="groupId" value="%{groupBean.groupId}" scope="session"/>
								    </s:url>
								    <s:a href="%{addUserToGroupUrl}"  class="icon-action-link" title="Add this user"><img src="../includes/images/plus-16.png"> </s:a>
									</td>
								</tr>
							 </s:iterator>	
						  </tbody>
						</table>
						<!--<s:hidden name="groupMembers" value="%{groupMembers}"/>-->
					<!-- 	<div class="pull-right">
							<a href="#" class="icon-action-link">
								<img src="../includes/images/plus-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
							</a>
						</div> -->
					</div>
					</div>
				</div>

</s:form>--%>


<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-user"></i> Accounts</li>
            <li class="active"><i class="fa fa-group"></i> Group</li>
            <li class="active"><a href="<s:url action='viewGroups' />"><i class="fa fa-list"></i> Group List</a></li>
            <li class="active"><i class="fa fa-pencil"></i> Edit Group</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<s:form action="editGroup" method="post" cssClass="form-horizontal" theme="bootstrap">

    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Group</h3>
                </div>

                <div class="panel-body">

                    <div class="form-group">
                        <label for="code" class="col-lg-2 control-label" style="width:20%;">Code:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield required="true" name="groupBean.groupCode" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-lg-2 control-label" style="width:20%;">Name:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield required="true" name="groupBean.groupName" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="Description" class="col-lg-2 control-label" style="width:20%;">Description:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="groupBean.description" cssClass="form-control"/>
                        </div>
                    </div>

                    <s:hidden name="groupBean.groupId" value="%{groupBean.groupId}"/>

                <span class="pull-right">
                    <a href="viewGroups" class="btn btn-default ">Cancel</a>
                    <s:submit name="submit" value="Save" cssClass="btn btn-info"/>
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

                                <%--<table class="table table-striped table-bordered text-center" id="members-list">
                                    <thead>
                                        <tr class="header_center">
                                            <th class="tb-font-black">User ID</th>
                                            <th class="tb-font-black">User Name</th>
                                            <th class="tb-font-black">Company</th>
                                            <th class="tb-font-black">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <s:iterator value="groupMembers" status="m">

                                            <tr>

                                                <td class="tb-font-black"><s:property value="userId"/></td>
                                                <td class="tb-font-black" align="center"><s:property value="username"/></td>
                                                <td class="tb-font-black"><s:property value="client.clientName"/></td>
                                                <td class="tb-font-black">
                                                    <s:url var="removeUserFromGroupUrl" action="removeUserFromGroupForEdit">
                                                        <s:param name="userNameParam" value="username"></s:param>
                                                        <s:set name="groupCode" value="%{groupBean.groupCode}" scope="session"/>
                                                        <s:set name="groupName" value="%{groupBean.groupName}" scope="session"/>
                                                        <s:set name="groupDesc" value="%{groupBean.description}" scope="session"/>
                                                        <s:set name="groupId" value="%{groupBean.groupId}" scope="session"/>
                                                    </s:url>
                                                    <s:a href="%{removeUserFromGroupUrl}"  class="icon-action-link" title="Remove this user"><img src="../includes/images/delete-16.png"> </s:a>
                                                </td>

                                            </tr>

                                        </s:iterator>

                                    </tbody>
                                </table>--%>

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

