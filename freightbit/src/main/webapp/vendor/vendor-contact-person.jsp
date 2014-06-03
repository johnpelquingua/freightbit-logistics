<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Contact Person</h1>
		
		<!-- EDIT HERE -->

			<div class="main-box">
				<div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="panel-title">Contact Person Information</span>
					</div>
					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="contactPersonValidation" theme="bootstrap">
						<%--<form class="form-horizontal" role="form">--%>

							  <div class="form-group">

							    <label for="lastName" class="col-sm-2 control-label">Last Name:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Last Name" name="lastName"/>
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="firstName" class="col-sm-2 control-label">First Name:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="First Name" name="firstName"/>
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="middleName" class="col-sm-2 control-label">Middle Name:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Middle Name" name="middleName"/>
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="number" class="col-sm-2 control-label">Number:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Number" name="number"/>
							    </div>

							  </div>
							  
						<%--</form>--%>

                        </div>
					</div>

				<div class="panel-footer">
					<div class="btn-group" style="float: right;">
						<button class="btn btn-default" onclick="this.form.action='vendor-driver'">Back</button>
						<button class="btn btn-default" >Next</button>
					</div>
				</div>
                    </s:form>
				</div>
				
			</div>

   			<div class="sidebar-box">
			  <div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/calendar.png" class="box-icon">
						<span class="panel-title">Process</span>
					</div>
					
				  <div class="panel-body">
					
						<ul class="nav">		  
							<li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
							<li><a href="vendor-trucks" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Trucks Information</a></li>
							<li><a href="vendor-driver" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Driver Information</a></li>
							<li><a href="vendor-contact-person" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Contact Person</a></li>
							<li><a href="vendor-other-information" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Other Information</a></li>
							<li><a href="vendor-address" class="side-help"><img src="includes/images/6.png" class="img-sidehelp">Address</a></li>
						</ul>
					
				  </div>
			  </div>
		    </div>
		<!-- SIDEBAR GOES HERE -->
		
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->