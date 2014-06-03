<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
        
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Users</h1>
		
		<!-- MAIN BOX -->
		
			<div class="row">			
				<div class="col-md-12">
					
					
					<div>
						<div class="panel booking panel-info"  style="float:left; width:50%;">
							<div class="booking panel-heading">
								<img src="includes/images/account.png" class="box-icon">
								<span class="booking panel-title">User Information</span>
							</div>
							<div class="panel-body">
							<s:form action="User-Info" theme="bootstrap" cssClass="form-horizontal" >
							<div style="float:left; width:50%;">
								<img src="includes/images/default-image.png" style="width:150px;margin:6px;">
							</div>
							<div style="float:left; width:50%;">
								<h2><s:property value="user.name"></s:property></h2>
								<span>Email Address : <s:property value="user.emailAddress"></s:property> </span>
								<br>
								<span>Contact Number : <s:property value="user.contactNumber"></s:property> </span>
							</div>
							</div>
						</div>
						
					</s:form>

					
				</div>
			</div>	
		</div>
		
		
		<!-- END OF MAIN BOX -->
		
	
		
		<!-- END OF THE MIDDLE -->
