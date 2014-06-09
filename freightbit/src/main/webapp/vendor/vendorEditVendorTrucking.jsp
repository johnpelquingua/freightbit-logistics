<%@ taglib prefix="s" uri="/struts-tags" %>

		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Edit Vendor</h1>
		
		<!-- EDIT HERE -->


		<div class="row" >
			<div class="col-md-12">

                <s:form theme="bootstrap" cssClass="form-horizontal" action="editVendor">
                <s:hidden name="vendor.vendorId" value="%{vendor.vendorId}"/>
                <s:set name="vendorId" value="1" scope="session"/>
				<div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="panel-title">Personal Information</span>
					</div>
					<div class="panel-body">
                          <div class="form-group">
                            <label class="col-sm-2 control-label">Type:</label>
                            <div class="col-sm-10">
                                  <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType" listKey="key" listValue="value" cssClass="form-control" />
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="vendor.vendorName" class="col-sm-2 control-label">Company:</label>
                            <div class="col-sm-10">
                              <s:textfield type="text" cssClass="form-control" id="vendor.vendorName" name="vendor.vendorName" placeholder="Company Name" />
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="vendor.vendorCode" class="col-sm-2 control-label">Code:</label>
                            <div class="col-sm-10">
                              <s:textfield type="text" cssClass="form-control" id="vendor.vendorCode" name="vendor.vendorCode" placeholder="Code" />
                            </div>
                          </div>


                          <div class="form-group">
                            <label for="vendor.vendorClass" class="col-sm-2 control-label">Class:</label>
                                <div class="col-sm-10">
                                    <s:select list="vendorClassList" name="vendor.vendorClass" id="vendor.vendorClass" listKey="key" listValue="value" cssClass="form-control"  />
                                </div>
                          </div>

                          <div class="form-group">
                            <label for="vendor.vendorStatus" class="col-sm-2 control-label">Status:</label>
                            <div class="col-sm-10">
                                <s:select list="statusList" name="vendor.vendorStatus" id="vendor.vendorStatus" listKey="key" listValue="value" cssClass="form-control" />
                            </div>
                          </div>

					</div>

				</div>
			</div>

		</div>

		<div class="btn-group" style="float: right;">
			<%--<button class="btn btn-default" type="submit" >Save</button>--%>
            <s:submit cssClass="btn btn-default" name="submit" value="Save" />
			<button class="btn btn-default" onclick="location.href='viewVendors'">Cancel</button>
		</div>

            </s:form>

		<div class="btn-group" style="float: left;" id="trucking-option">
            <button class="btn btn-default" onclick="location.href='vendorAddTrucks.jsp'">Contacts</button>
			<button class="btn btn-default" onclick="location.href='loadEditVendorTrucksPage'">Trucks</button>

            <%--<s:form action="loadEditVendorTrucksPage">--%>
                <%--<s:hidden name="vendor.vendorId" value="%{vendor.vendorId}"/>--%>
                <%--<s:submit cssClass="btn btn-default" name="submit" value="Trucks" />--%>
            <%--</s:form>--%>

			<button class="btn btn-default" onclick="location.href='vendorAddDriver.jsp'">Driver</button>
			<button class="btn btn-default" onclick="location.href='vendor-address.jsp'">Address</button>
		</div>
		<!-- SIDEBAR GOES HERE -->
		
		<!-- END OF EDIT -->

        </div>
		
		<!-- END OF THE MIDDLE -->
