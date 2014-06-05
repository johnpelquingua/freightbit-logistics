<%@ taglib prefix="s" uri="/struts-tags" %>

		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Edit Vendor</h1>
		
		<!-- EDIT HERE -->


		<div class="row" >
			<div class="col-md-12">

                <s:form >

				<div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="panel-title">Personal Information</span>
					</div>
					<div class="panel-body">

							  <div class="form-group">

							    <label class="col-sm-2 control-label">Type:</label>

							    <div class="col-sm-10">
                                      <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType" listKey="key" listValue="value" cssClass="form-control" onchange="EventChanged(this);" ></s:select>
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="COMPANY_NAME" class="col-sm-2 control-label">Company:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="COMPANY_NAME" value="Solutions Resource" placeholder="Company Name">
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="COMPANY_CODE" class="col-sm-2 control-label">Code:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="COMPANY_CODE" value="SRI" placeholder="Code">
							    </div>

							  </div>

					</div>

				</div>
				
			</div>

			<div class="col-md-12">
				<div class="panel booking panel-info">
					<div class="booking panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="booking panel-title">Contact Person Information</span>
					</div>
					<div class="panel-body">

						<form class="form-horizontal" role="form">

							  <div class="form-group">

							    <label for="CONTACT_LAST_NAME" class="col-sm-2 control-label">Last Name:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="CONTACT_LAST_NAME" value="Victoria" placeholder="Last Name">
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="CONTACT_FIRST_NAME" class="col-sm-2 control-label">First Name:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="CONTACT_LAST_NAME" value="Clarence" placeholder="First Name">
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="CONTACT_MIDDLE_NAME" class="col-sm-2 control-label">Middle Name:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="CONTACT_MIDDLE_NAME" placeholder="Middle Name" value="Columna">
							    </div>

							  </div>

							  <div class="form-group">

							    <label for="CONTACT_NUMBER" class="col-sm-2 control-label">Number:</label>

							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="CONTACT_NUMBER" placeholder="Number" value="123-4567">
							    </div>

							  </div>
							  
						</form>

					</div>

				</div>
				
			</div>

			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="panel-title">Other Information</span>
					</div>
					<div class="panel-body">

						<form class="form-horizontal" role="form">

							  <div class="form-group">

							    <label for="inputCLASS" class="col-sm-2 control-label">Class:</label>

							    	<div class="col-sm-10">
							    		
							    	<select class="form-control">
							    		<option disabled="" value=""></option>
							    		<option selected="">Premium</option>
							      		<option>Class A</option>
							      		<option>Class B</option>
							      		<option>Class C</option>
							      		<option>Economy</option>
							      	</select>

							    	</div>

							  </div>

							  <div class="form-group">

							    <label for="inputSTATUS" class="col-sm-2 control-label">Status:</label>

							    <div class="col-sm-10">

							      <select class="form-control">
							      	<option disabled="" value=""></option>
						      		<option selected="">Active</option>
						      		<option>Inactive</option>
							      </select>

							    </div>

							  </div>
							  
						</form>

					</div>

				</div>

                </s:form>

			</div>

		</div>

		<div class="btn-group" style="float: right;">
			<button class="btn btn-default" onclick="location.href='vendor-save-complete.jsp'">Save</button>
			<button class="btn btn-default" onclick="location.href='vendorListView.jsp'">Cancel</button>
		</div>

		<div class="btn-group" style="float: left;" id="shipping-option">
			<button class="btn btn-default" onclick="location.href='vendorAddVessels.jsp'">Vessel</button>
			<button class="btn btn-default" onclick="location.href='vendor-address.jsp'">Address</button>
		</div>

		<div class="btn-group" style="float: left;" id="trucking-option">
			<button class="btn btn-default" onclick="location.href='vendorAddTrucks.jsp'">Trucks</button>
			<button class="btn btn-default" onclick="location.href='vendorAddDriver.jsp'">Driver</button>
			<button class="btn btn-default" onclick="location.href='vendor-address.jsp'">Address</button>
		</div>

		<div class="btn-group" style="float: left;" id="selectType">
			<button class="btn btn-default" onclick="location.href='vendor-address.jsp'">Address</button>
		</div>
							      
		<!-- SIDEBAR GOES HERE -->
		
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->

  	<script>

  		$("#shipping-option").hide();
		$("#trucking-option").show();
		$("#selectType").hide();

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
