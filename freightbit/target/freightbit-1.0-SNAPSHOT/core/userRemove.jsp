<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
        
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Users</h1>
		
		<!-- EDIT HERE -->
		
		<!-- MAIN BOX -->
		
		<div class="row">			
				<div class="col-md-12">
					<div class="panel booking panel-info">
						<div class="booking panel-heading">
							<h3 class="booking panel-title">Edit User</h3>
						</div>
					  
						<div class="panel-body">
							<div class="table-responsive list-table">

									<s:form action="deleteUser" theme="bootstrap" cssClass="form-horizontal" >
									<div class="form-group">
										<label for="uType" class ="col-sm-2 control-label" id ="users-add-label"> User Type:</label>
											<div class="col-sm-10">
											    <s:select name="uType" id="uType" list="userType" cssClass="form-control" />
											</div>
									</div>
									
									<div class="form-group">
										<label for="uCompanyName" class ="col-sm-2 control-label" id ="users-add-label">Company:</label>
											<div class="col-sm-10">
											<s:textfield cssClass="form-control" id="uCompanyName" name="uCompanyName" placeholder="Company Name"></s:textfield>
											</div>
									</div>
			  
									<div class="form-group">
										<label for="uName" class ="col-sm-2 control-label" id ="users-add-label">Name:</label>
											<div class="col-sm-10">
											<s:textfield cssClass="form-control" id="uName" name="uName" placeholder="Name"></s:textfield>
											</div>
									</div>
									
								   <div class="form-group">
										<label for="uUserName" class ="col-sm-2 control-label" id ="users-add-label">User Name:</label>
											<div class="col-sm-10">
											<s:textfield cssClass="form-control" id="uUserName" name="uUserName" placeholder="User Name"></s:textfield>
											</div>
									</div>
									
								   <div class="form-group">
										<label for="uPassword" class ="col-sm-2 control-label" id ="users-add-label">Password:</label>
											<div class="col-sm-10">
											<s:textfield cssClass="form-control" id="uPassword" name="uPassword" placeholder="Password"></s:textfield>
											</div>
									</div>
									
								   <div class="form-group">
										<label for="utitle" class ="col-sm-2 control-label" id ="users-add-label">Title:</label>
											<div class="col-sm-10">
											<s:textfield cssClass="form-control" id="uTitle" name="uTitle" placeholder="Title"></s:textfield>
											</div>
									</div>
									
									<div class="form-group">
											<label for="uEmailAddress" class ="col-sm-2 control-label" id ="users-add-label">Email Address:</label>
												<div class="col-sm-10">
												<s:textfield cssClass="form-control" id="uEmailAddress" name="uEmailAddress" placeholder="Email Address"></s:textfield>
											</div>
									</div>
									
								   <div class="form-group">
										<label for="uContactNumber" class ="col-sm-2 control-label" id ="users-add-label">Contact Number:</label>
											<div class="col-sm-10">
											<s:textfield cssClass="form-control" id="uContactNumber" name="uContactNumber" placeholder="Contact Number"></s:textfield>
											</div>
									</div>
									
								   <div class="form-group">
										<label for="uStatus" class ="col-sm-2 control-label" id ="users-add-label">Status:</label>
											<div class="col-sm-10">
											<s:textfield cssClass="form-control" id="uStatus" name="uStatus" placeholder="Status"></s:textfield>
											</div>
									</div>
							</div>
						</div>
			  <span class="pull-right">
			  <a href = "User-Add" class="btn btn-default" id = "users-add-btn" style="margin:20px 0px 6px 6px;">Cancel</a>
			  
			  <a href ="User-List" class="btn btn-default" id = "users-add-btn" style="margin:20px 10px 6px 6px;">Save</a>
			  </span>
			  </s:form>

						  </div>
					  </div>
				  </div>
				</div>
			 
		
		<!-- END OF MAIN BOX -->
		
	
		
		<!-- END OF THE MIDDLE -->
		
