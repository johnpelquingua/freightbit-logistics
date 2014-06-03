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
						<span class="booking panel-title">Edit Customer - Consignee Information</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">
				
				<s:form cssClass="form-horizontal" theme="bootstrap">
				  <div class="form-group">
					<label for="cname" class="col-sm-2 control-label" style="width:25%;">Company Name</label>
					<div class="col-sm-10" style="width:70%;">
						<s:textfield name="cname" cssClass="form-control" id="cname" value="RUSSEL'S"/>
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
					  <s:textfield name="eaddress" cssClass="form-control" id="eaddress" value="email@address.com"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="add1" class="col-sm-2 control-label" style="width:25%;">Address 1</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield name="add1" cssClass="form-control" id="add1" value="Morong Rizal"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="add2" class="col-sm-2 control-label" style="width:25%;">Address 2</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield name="add2" cssClass="form-control" id="add2" value="Quezon City"/>
					</div>
				  </div>
				  <span class="pull-right" style="margin-right:32px;">
					<a href="customer-info.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Cancel</a>
					<a href="customer-info.jsp" class="btn btn-default" id="groups-btn" style="width:70px;">Save</a>
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
