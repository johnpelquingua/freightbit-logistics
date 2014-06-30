<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

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
							  <tbody>
							  	<table>
									<tr>
									<display:table id="user" name="users" requestURI="/viewUsers.action" pagesize="2" class="table table-striped table-bordered text-center">
										<td><display:column property="title" title="Title" class="tb-font-black"/></td>	   
									  	<td><display:column property="firstName" title="First Name"  sortable="true" class="tb-font-black"/></td>
										<td><display:column property="lastName" title="Last Name"  sortable="true" class="tb-font-black"/></td>
										<td><display:column property="companyName" title="Company Name" class="tb-font-black"/></td>
										<td><display:column property="userName" title="User Name" class="tb-font-black"/></td>
										<td><display:column property="userType" title="User Type" class="tb-font-black"/></td>
								
										<td class="tb-font-black">
											<display:column title="Actions">
											  <s:url var="loadEditUserUrl" action="loadEditUserPage">
											  	<s:param name="userNameParam" value="#attr.user.userName"></s:param>
											  </s:url>
											  <s:a href="%{loadEditUserUrl}" class="icon-action-link" rel="tooltip" title="Edit this user"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>
											  <s:url var="deleteUserUrl" action="deleteUser">
											     <s:param name="userNameParam" value="#attr.user.userName"></s:param>
											  </s:url>
											  <s:a class="icon-action-link" href="%{deleteUserUrl}" rel="tooltip" title="Delete this user" onclick="return confirm('Do you really want to delete?');"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>								
											  <s:url var="viewUserInfoUrl" action="viewUserInfo">
											  	<s:param name="userNameParam" value="#attr.user.userName"></s:param>
											  </s:url>
											  <s:a href="%{viewUserInfoUrl}" class="icon-action-link" rel="tooltip" title="View this user"><img src="includes/images/info-b.png" class="icon-action circ-icon"> </s:a>
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
								<a href="loadAddUserPage" class="icon-action-link" rel="tooltip" title="Add User"><img src="includes/images/add-user.png" class="icon-action circ-icon"> </a>
							</span>

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