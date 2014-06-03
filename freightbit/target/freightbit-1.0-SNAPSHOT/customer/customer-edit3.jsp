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
						<span class="booking panel-title">Edit Customer - Address</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">
				
				<s:form cssClass="form-horizontal" theme="bootstrap">
				  <div class="form-group">
					<label for="addressType" class="col-sm-2 control-label" style="width:25%;">Address Type</label>
					<div class="col-sm-10" style="width:70%;">
					    <s:select name="addressType" list="addressType" cssClass="form-control" id="addressType"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="street" class="col-sm-2 control-label" style="width:25%;">Street</label>
					<div class="col-sm-10" style="width:70%;">
						<s:textfield name="street" cssClass="form-control" id="street" value="123 Biglang-Liko street"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="city" class="col-sm-2 control-label" style="width:25%;">City / Province</label>
					<div class="col-sm-10" style="width:70%;">
						<s:textfield name="city" cssClass="form-control" id="city" value="Quezon City"/>
					</div>
				  </div>
				  <div class="form-group">
					<label for="zcode" class="col-sm-2 control-label" style="width:25%;">Zip Code</label>
					<div class="col-sm-10" style="width:70%;">
					    <s:textfield name="zcode" cssClass="form-control" id="zcode" value="1100"/>
					</div>
				  </div>
				  <span class="pull-right" style="margin-right:32px;">
					<a href="customer-info.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Cancel</a>
					<a href="customer-info.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Save</a>
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
