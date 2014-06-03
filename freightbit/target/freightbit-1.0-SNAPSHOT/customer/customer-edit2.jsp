<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>

        <%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
        
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Customer Profile</h1>
		
		<!-- MAIN BOX -->
		
		<div class="main-box">
			<div class="panel booking panel-info">
				<div class="booking panel-heading">
					  <img src="includes/images/add-user.png" class="box-icon">
						<span class="booking panel-title">Edit Customer - Contact Person</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">
				
				<s:form cssClass="form-horizontal" theme="bootstrap">
				  <div class="form-group">
					<label for="fname" class="col-sm-2 control-label" style="width:25%;">First Name</label>
					<div class="col-sm-10" style="width:70%;">
					    <s:textfield name="fname" cssClass="form-control" id="fname" value="Ariel"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="lname" class="col-sm-2 control-label" style="width:25%;">Last Name</label>
					<div class="col-sm-10" style="width:70%;">
					    <s:textfield name="lname" cssClass="form-control" id="lname" value="Torres"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="cnumber" class="col-sm-2 control-label" style="width:25%;">Contact Number</label>
					<div class="col-sm-10" style="width:70%;">
					    <s:textfield name="cnumber" cssClass="form-control" id="cnumber" value="09061234567"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="eaddress" class="col-sm-2 control-label" style="width:25%;">Email Address</label>
					<div class="col-sm-10" style="width:70%;">
					    <s:textfield name="eaddress" cssClass="form-control" id="eaddress" value="ariel@solutionsresource.com"/>
					</div>
				  </div>
				  <span class="pull-right" style="margin-right:32px;">
					<a href="customer-list.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Cancel</a>
					<a href="customer-list.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Save</a>
				  </span>
				</s:form>
				
				</div>
				</div>
			</div>
		</div>	
			
		
		
		<!-- END OF MAIN BOX -->
		
		<!-- SIDEBAR -->
		
		<div class="sidebar-box">
				  <div class="panel booking panel-info">
					  <div class="booking panel-heading">
					  <img src="includes/images/calendar.png" class="box-icon">
						<span class="booking panel-title">Calendar</span>
						
					  </div>
					  <div class="panel-body">
						<div class="table-responsive list-table">
					
						  </div>
					  </div>
				  </div>
			    </div>	
			</div>
		
		<!-- END SIDEBAR -->
		
		<!-- END OF THE MIDDLE -->
		
