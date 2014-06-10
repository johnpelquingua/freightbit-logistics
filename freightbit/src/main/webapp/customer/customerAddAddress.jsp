<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h1 class="page-header">Customer Profile</h1>

		<!-- MAIN BOX -->

		<div class="main-box">
			<div class="panel booking panel-info">
				<div class="booking panel-heading">
					  <img src="includes/images/add-user.png" class="box-icon">
						<span class="booking panel-title">Add Customer - Address</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">

				<s:form cssClass="form-horizontal" theme="bootstrap" action="addressAdd">

				  <div class="form-group">
                  	<label for="address.addressType" class="col-sm-2 control-label" style="width:25%;">Address Type</label>
                    <div class="col-sm-10" style="width:70%;">
                  	    <s:select name="address.addressType" list="addressTypeList" listKey="key" listValue="value" cssClass="form-control" id="address.addressType"/>
                  	</div>
                  </div>
				  <div class="form-group">
                    <label for="address.addressLine1" class="col-sm-2 control-label" style="width:25%;">Address Line 1</label>
                    <div class="col-sm-10" style="width:70%;">
                  	    <s:textfield name="address.addressLine1" cssClass="form-control" id="address.addressLine1" placeholder="Address Line 1"/>
                  	</div>
                  </div>
                  <div class="form-group">
                    <label for="address.addressLine2" class="col-sm-2 control-label" style="width:25%;">Address Line 2</label>
                     <div class="col-sm-10" style="width:70%;">
                        <s:textfield name="address.addressLine2" cssClass="form-control" id="address.addressLine2" placeholder="Address Line 2"/>
                     </div>
                  </div>
				  <div class="form-group">
					<label for="address.city" class="col-sm-2 control-label" style="width:25%;">City</label>
					<div class="col-sm-10" style="width:70%;">
						<s:textfield name="address.city" cssClass="form-control" id="address.city" placeholder="City"/>
					</div>
				  </div>
				  <div class="form-group">
                  	<label for="address.state" class="col-sm-2 control-label" style="width:25%;">State</label>
                  	<div class="col-sm-10" style="width:70%;">
                  	    <s:textfield name="address.state" cssClass="form-control" id="address.state" placeholder="State"/>
                    </div>
                  </div>
				  <div class="form-group">
					<label for="address.zip" class="col-sm-2 control-label" style="width:25%;">Zip Code</label>
					<div class="col-sm-10" style="width:70%;">
					    <s:textfield name="address.zip" cssClass="form-control" id="address.zip" placeholder="Zip"/>
					</div>
				  </div>
				  <span class="pull-right" style="margin-right:32px;">
					<a href="customer-add2.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Back</a>
					<s:submit cssClass="btn btn-default" value="Add" type="submit" />
					<a href="customer-add4.jsp" class="btn btn-default" id="groups-btn" style="width:70px;">Next</a>
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
						<span class="booking panel-title">Process</span>

					  </div>
					  <div class="panel-body">
						<ul class="nav">
							<li><a href="customer-add.jsp" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
							<li><a href="customer-add2.jsp" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Contact Person</a></li>
							<li><a href="customer-add3.jsp" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Address</a></li>
							<li><a href="customer-add4.jsp" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Items</a></li>
							<li><a href="customer-add5.jsp" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Documents</a></li>
							<li><a href="customer-add7.jsp" class="side-help"><img src="includes/images/6.png" class="img-sidehelp">Rates</a></li>
							<li><a href="customer-add6.jsp" class="side-help"><img src="includes/images/7.png" class="img-sidehelp">Consignee Infomation</a></li>
						</ul>
					  </div>
				  </div>
			    </div>
			    <div style="clear:both;"></div>
        <div>
		<div class="panel booking panel-info">
	        <div class="booking panel-heading">
		        <img src="includes/images/add-user.png" class="box-icon">
				<span class="booking panel-title">Add Customer - Address</span>
		    </div>
			<div class="panel-body">
			    <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center">
                    <thead>
                    <tr class="header_center">
                        <th class="tb-font-black"><input type="checkbox" /></th>
                        <th class="tb-font-black">Address ID</th>
                        <th class="tb-font-black">Address Line 1</th>
                        <th class="tb-font-black">Address Line 2</th>
                        <th class="tb-font-black">City</th>
                        <th class="tb-font-black">State</th>
                        <th class="tb-font-black">Zip Code</th>
                        <th class="tb-font-black">Action</th>
                    </tr>
                    </thead>
                    <tbody>

                    <s:iterator value="trucks" var="truck">
                        <tr>
                            <td class="tb-font-black"><s:checkbox name="a" theme="simple" /></td>
                            <td class="tb-font-black"><s:property value="addressId" /></td>
                            <td class="tb-font-black"><s:property value="addressLine1" /></td>
                            <td class="tb-font-black"><s:property value="addressLine2" /></td>
                            <td class="tb-font-black"><s:property value="city" /></td>
                            <td class="tb-font-black"><s:property value="state" /></td>
                            <td class="tb-font-black"><s:property value="zip" /></td>
                            <td class="tb-font-black">
                                UNDER CONSTRUCTION
                            </td>
                        </tr>

                    </s:iterator>
                    </tbody>
                    </table>
                </div>
			</div>
        </div>
        </div>