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
						<span class="booking panel-title">Edit Customer - Personal Information</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">
				
				<s:form cssClass="form-horizontal" action="editCustomer" theme="bootstrap">
                <s:hidden name="customer.customerId" value="%{customer.customerId}"/>
                <div class="form-group">
					<label for="ctype" class="col-sm-2 control-label" style="width:25%;">Customer Code</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield  maxLength="3" cssStyle="text-transform:uppercase" required="true" name="customer.customerCode" cssClass="form-control" id="customer.customerCode" />
					</div>
				  </div>

                        	  <div class="form-group">
            					<label for="ctype" class="col-sm-2 control-label" style="width:25%;">Customer Name</label>
            					<div class="col-sm-10" style="width:70%;">
            					  <s:textfield name="customer.customerName" required="true" cssClass="form-control"/>
            					</div>
            				  </div>

            				  <div class="form-group">
            					<label for="ctype" class="col-sm-2 control-label" style="width:25%;">Customer Type</label>
            					<div class="col-sm-10" style="width:70%;">
            					 <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
            					</div>
            				  </div>
            				  <div class="form-group">
            					<label for="cnum" class="col-sm-2 control-label" style="width:25%;">Phone No.</label>
            					<div class="col-sm-10" style="width:70%;">
            					  <s:textfield required="true" name="customer.phone" cssClass="form-control" id="phone" maxLength="7"/>
            					</div>
            				  </div>

            				  <div class="form-group">
            					<label for="cnum" class="col-sm-2 control-label" style="width:25%;">Mobile No.</label>
            					<div class="col-sm-10" style="width:70%;">
            					  <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="mobile" maxLength="11"/>
            					</div>
            				  </div>

            				  <div class="form-group">
            					<label for="cnum" class="col-sm-2 control-label" style="width:25%;">Fax  No.</label>
            					<div class="col-sm-10" style="width:70%;">
            					  <s:textfield  required="true" name="customer.fax" cssClass="form-control" id="fax" maxLength="11"/>
            					</div>
            				  </div>

            				  <div class="form-group">
            					<label for="eadd" class="col-sm-2 control-label" style="width:25%;">Email Address</label>
            					<div class="col-sm-10" style="width:70%;">
            					  <s:textfield required="true" name="customer.email" cssClass="form-control" id="email" type="email"/>
            					</div>
            				  </div>

            				  <div class="form-group">
            					<label for="eadd" class="col-sm-2 control-label" style="width:25%;">Website</label>
            					<div class="col-sm-10" style="width:70%;">
            					  <s:textfield name="customer.website" cssClass="form-control" id="website"/>
            					</div>
            				  </div>
            	<hr>
				  <span  style="margin-right:32px;">
					<a href="customerList" class="btn btn-default" id ="groups-btn">Cancel</a>
					<s:submit cssClass="btn btn-default" name="submit" value="Save" cssStyle="margin:20px 0px 6px 6px;" />
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
		
