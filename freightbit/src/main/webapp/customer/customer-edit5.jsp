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
						<span class="booking panel-title">Edit Customer - Documents</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">
				
				<s:form cssClass="form-horizontal" theme="bootstrap">
				  
					<div class="col-xs-6">
					    <s:checkbox name="DTI" id="DTI" label="DTI / SEC Certificate"/>
					</div>
					<div class="col-xs-6">
						<s:checkbox name="MayorsPermit" label="Mayor's Permit"/>
					</div>
					<div class="col-xs-6">
						<s:checkbox name="AAF" label="Account Application Form"/>
					</div>
					<div class="col-xs-6">
						<s:checkbox name="SSC" label="Signature Specimen Card"/>
					</div>
				  
				  <span class="pull-right" style="margin-top:20px;margin-right:32px;">
					<a href="customer-info.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Cancel</a>
					<button href="cusotomer4.jsp" class="btn btn-default" id="groups-btn" style="width:70px;">Save</button>
					
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
