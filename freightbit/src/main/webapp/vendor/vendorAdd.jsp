<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Add New Vendor</h1>
		
		<!-- EDIT HERE -->

			<div class="main-box">
				<div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="panel-title">Personal Information</span>
					</div>
					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="addVendor" method="POST" theme="bootstrap">
							
							  <div class="form-group">

							    <label class="col-sm-2 control-label" for="vendor.vendorType">Type:</label>

							    <div class="col-sm-10">
                                    <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType" listKey="key" listValue="value" cssClass="form-control" onchange="EventChanged(this);" ></s:select>
                                </div>

							  </div>

							  <div class="form-group">

							    <label for="vendor.vendorName" class="col-sm-2 control-label">Company:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Company Name" name="vendor.vendorName" id="vendor.vendorName" />

							    </div>

							  </div>

							  <div class="form-group">

							    <label for="vendor.vendorCode" class="col-sm-2 control-label">Code:</label>

							    <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" name="vendor.vendorCode" id="vendor.vendorCode" placeholder="Code"/>

							    </div>

							  </div>
                        </div>
					</div>


				<div class="panel-footer">
					<div class="btn-group" style="float: right;" id="shipping">
						<button class="btn btn-default" onclick="this.form.action='vendor-list'">Cancel</button>
						<%--<button class="btn btn-default">Next</button>--%>
                        <s:submit cssClass="btn btn-default" value="Next" type="submit" />
					</div>

					<div class="btn-group" style="float: right;" id="trucking">
						<button class="btn btn-default" onclick="this.form.action='viewVendors'">Cancel</button>
						<%--<button class="btn btn-default">Next</button>--%>
                        <s:submit cssClass="btn btn-default" value="Next" type="submit" />
					</div>

					<%--<div class="btn-group" style="float: right;" id="none">--%>
						<%--<button class="btn btn-default" onclick="this.form.action='vendor-list'">Cancel</button>--%>
					<%--</div>--%>

				</div>
                </s:form>
				</div>

			</div>

		<!-- SIDEBAR GOES HERE -->
		<div class="sidebar-box">
			  <div class="panel booking panel-info">
					<div class="booking panel-heading">
						<img src="includes/images/calendar.png" class="box-icon">
						<span class="booking panel-title">Process</span>
					</div>
					
				  <div class="panel-body">
					
						<ul class="nav">		  
						<li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
						</ul>
					
				  </div>
			  </div>
		    </div>	
		</div>
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->

<script>

  		$("#shipping").hide();
		$("#trucking").show();

		function EventChanged(selectEl) {

 		 var text = selectEl.options[selectEl.selectedIndex].text;

 		if (text == "Shipping"){
			$("#shipping").show();
			$("#trucking").hide();
			$("#none").hide();
		} else if (text == "Trucking") {
            $("#trucking").show();
			$("#shipping").hide();
			$("#none").hide();
        }
	 }

	</script>