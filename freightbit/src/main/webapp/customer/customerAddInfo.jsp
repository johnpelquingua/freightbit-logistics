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
						<span class="booking panel-title">Add Customer - Personal Information</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">

				 <s:form cssClass="form-horizontal" theme="bootstrap" action="addCustomer">
				  <div class="form-group">

				  <div class="form-group">
					<label for="ctype" class="col-sm-2 control-label" style="width:25%;">Customer Name</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield required="true" name="customer.customerName" cssClass="form-control" id="customer.customerName" />
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
					  <s:textfield required="true" name="customer.phone" cssClass="form-control" id="customer.phone" maxLength="7"/>
					</div>
				  </div>

				  <div class="form-group">
					<label for="cnum" class="col-sm-2 control-label" style="width:25%;">Mobile No.</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="customer.mobile" maxLength="11"/>
					</div>
				  </div>

				  <div class="form-group">
					<label for="cnum" class="col-sm-2 control-label" style="width:25%;">Fax  No.</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield  required="true" name="customer.fax" cssClass="form-control" id="customer.fax" maxLength="11"/>
					</div>
				  </div>

				  <div class="form-group">
					<label for="eadd" class="col-sm-2 control-label" style="width:25%;">Email Address</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" type="email"/>
					</div>
				  </div>

				  <div class="form-group">
					<label for="eadd" class="col-sm-2 control-label" style="width:25%;">Website</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield name="customer.website" cssClass="form-control" id="customer.website"/>
					</div>
				  </div>
            <hr>
				<div class="col-xs-6    ">
						<label>
						  <input required="true" type="checkbox" id="customer.dit" name="customer.dti"> DTI / SEC Certificate
						</label>
		        </div>
					<div class="col-xs-6">
						<label>
							<input required="true" type="checkbox"  id="customer.mayorsPermit" name="customer.mayorsPermit"> Mayor's Permit
						</label>
					</div>
					<div class="col-xs-6">
						<label>
						  <input required="true" type="checkbox" id="customer.aaf" name="customer.aaf"> Account Application Form
						</label>
					</div>
					<div class="col-xs-6">
						<label>
							<input required="true" type="checkbox"id="customer.signatureCard" name="customer.signatureCard"> Signature Specimen Card
						</label>
					</div>
            <a href="customerList" class="btn btn-default" id ="groups-btn">Cancel</a>
            <s:submit name="submit" cssClass="btn btn-default" value="Next" />

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
			</div>

		<!-- END SIDEBAR -->

		<!-- END OF THE MIDDLE -->