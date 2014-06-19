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
					<label for="ctype" class="col-sm-2 control-label" style="width:25%;">Customer Code</label>
					<div class="col-sm-10" style="width:70%;">
					  <s:textfield  maxLength="3" cssStyle="text-transform:uppercase" required="true" name="customer.customerCode" cssClass="form-control" id="customer.customerCode" />
					</div>
				  </div>

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

              <div class="col-sm-10 pull-right" style="width:70%;">
                    <a href="customerList" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit name="submit" cssClass="btn btn-default" value="Save and Proceed" />
              </div>

				</s:form>

				</div>
				</div>
			</div>
		</div>

		<!-- END OF MAIN BOX -->

		<!-- END OF THE MIDDLE -->