<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<script src="includes/js/bootstrap.js"></script>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h1 class="page-header">Users</h1>

		<!-- EDIT HERE -->

		<div class="row">
				<div class="col-md-12">
				  <div class="panel panel-info">

					  <div class="panel-heading">

					  	<img src="includes/images/listofusers.png" class="box-icon" />
						<span class="panel-title">List of Users</span>
						</div>
						<div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center" id ="users-list">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black">User Code</th>
								  <th class="tb-font-black">First Name</th>
								  <th class="tb-font-black">Last Name</th>
								  <th class="tb-font-black">Company Name</th>
								  <th class="tb-font-black">User Name</th>
								  <th class="tb-font-black">User Type</th>
								  <th class="tb-font-black">Action</th>
								</tr>
							  </thead>
							  <tbody>
							    <s:iterator value="users" var="user">
								<tr>
								  <td class="tb-font-black"><s:property value="title"/></td>
								  <td class="tb-font-black" align="center"><s:property value="firstName"/></td>
								  <td class="tb-font-black" align="center"><s:property value="lastName"/></td>
								  <td class="tb-font-black"><s:property value="companyName"/></td>
								  <td class="tb-font-black"><s:property value="userName"/></td>
								  <td class="tb-font-black"><s:property value="userType"/></td>
								  <td class="tb-font-black">
								    <s:url var="loadEditUserUrl" action="loadEditUserPage">
								    	<s:param name="userNameParam" value="userName"></s:param>
								    </s:url>
								    <s:a href="%{loadEditUserUrl}" class="icon-action-link" rel="tooltip" title="Edit this user"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>
									<s:url var="deleteUserUrl" action="deleteUser">
                                            <s:param name="userNameParam" value="userName"></s:param>
                                    </s:url>
									<s:a class="icon-action-link" href="%{deleteUserUrl}" rel="tooltip" title="Delete this user" onclick="return confirm('Do you really want to delete?');"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>

								<!-- 	<a href="#delete-user" data-toggle="modal" data-controls-modal="#delete-user" data-backdrop="static" data-keyboard="false" class="icon-action-link" rel="tooltip" title="Delete this user"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>-->									
									<s:url var="viewUserInfoUrl" action="viewUserInfo">
								    	<s:param name="userNameParam" value="userName"></s:param>
								    </s:url>
									<s:a href="%{viewUserInfoUrl}" class="icon-action-link" rel="tooltip" title="View this user"><img src="includes/images/info-b.png" class="icon-action circ-icon"> </s:a>
								  </td>
								</tr>
								</s:iterator>
							  </tbody>
							</table>
						  </div>
					  </div>


							<div class="panel-footer">
							<span class="pull-right">
								<a href="loadAddUserPage" class="icon-action-link" rel="tooltip" title="Add User"><img src="includes/images/add-user.png" class="icon-action circ-icon"> </a>
							</span>

							<ul class="pagination">
							  <li class="disabled"><a href="#">&laquo;</a></li>
							  <li class="active"><a href="#">1</a></li>
							  <li class="disabled"><a href="#">&raquo;</a></li>
							</ul>

					  </div>
					  </div>

				  </div>
			    </div>
			</div>

		</div>

		<div class="modal fade" id="delete-user" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<s:form action="deleteUser" method="post">
        	  <div class="modal-dialog">
        		<div class="modal-content">
        		  <div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        			<h4 class="modal-title" id="myModalLabel"> <img src="includes/images/delete-booking-b.png" /> &nbsp; Confirm Delete</h4>
        		  </div>
        		  <div class="modal-body">
        			<div style="text-align:center;">
        					<span>Do you really want to delete?</span>
        			</div>
        		  </div>
        		  <div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        			<button type="submit" class="btn btn-primary">Yes</button>
        		  </div>
        		</div>
        	  </div>
        	   <s:param name="userNameParam" value="%{userNameParam}"/> 
        	  </s:form>
        	</div>