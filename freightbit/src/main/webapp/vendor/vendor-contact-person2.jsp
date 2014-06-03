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
                        <s:form cssClass="form-horizontal" action="#" theme="bootstrap">

							  <div class="form-group">

							    <label for="LAST_NAME" class="col-sm-2 control-label">Last Name:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" id="LAST_NAME" placeholder="Last Name" name="LAST_NAME"/>
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="FIRST_NAME" class="col-sm-2 control-label">First Name:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" id="FIRST_NAME" placeholder="First Name" name="FIRST_NAME"/>
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="MIDDLE_NAME" class="col-sm-2 control-label">Middle Name:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" id="MIDDLE_NAME" placeholder="Middle Name" name="MIDDLE_NAME"/>
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="NUMBER" class="col-sm-2 control-label">Number:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" id="NUMBER" placeholder="Number" name="NUMBER"/>
							    </div>

							  </div>
							  
						<%--</form>--%>

                      </div>
					</div>

				<div class="panel-footer">
					<div class="btn-group" style="float: right;">
						<button class="btn btn-default" onclick="location.href='vendor-vessel'">Back</button>
						<button class="btn btn-default" onclick="location.href='vendor-other-information2'">Next</button>
					</div>
				</div>
                    </s:form>
				</div>
				
			</div>

			<div class="sidebar-box">
				  <div class="panel booking panel-info">
						<div class="booking panel-heading">
							<img src="includes/images/calendar.png" class="box-icon">
							<span class="booking panel-title">Process</span>
						</div>
						
					  <div class="panel-body">
						
							<ul class="nav">		  
							<li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
							<li><a href="vendor-vessel" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Vessel</a></li>
							<li><a href="vendor-contact-person2" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Contact Person</a></li>
							<li><a href="vendor-other-information2" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Other Information</a></li>
							<li><a href="vendor-address2" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Address</a></li>
							</ul>
						
					  </div>
				  </div>
			    </div>	
			</div>
   
		<!-- SIDEBAR GOES HERE -->
		
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->
		
  	<script>

  		$("#shipping-option").hide();
		$("#trucking-option").hide();
		$("#selectType").show();

		function EventChanged(selectEl) {

 		 var text = selectEl.options[selectEl.selectedIndex].text;

 		if (text == "Shipping"){					
			$("#shipping-option").show();
			$("#trucking-option").hide();
			$("#selectType").hide();
		} else if (text == "Trucking") {
			$("#shipping-option").hide();
			$("#trucking-option").show();
			$("#selectType").hide();
	 	} else {
	 		$("#shipping-option").hide();
			$("#trucking-option").hide();
			$("#selectType").hide();
	 	}
	 }

	</script>
