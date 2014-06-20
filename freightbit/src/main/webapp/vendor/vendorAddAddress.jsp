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
                <span class="booking panel-title">Add Customer - Address</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form  action="vendorAddAddress" cssClass="form-horizontal" theme="bootstrap">
                        <div class="form-group">

                            <label for="addressType" class="col-sm-2 control-label" style="width:25%;">Address Type</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:select name="address.addressType" list="addressTypeList" listValue="value" listKey="key" cssClass="form-control" id="address.addressType"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Address Line 1</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.addressLine1" id="address.addressLine1" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Address Line 2</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.addressLine2" id="address.addressLine2" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">City</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.city" id="address.city" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">State</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.state" id="address.state" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label" style="width:25%;">Zip Code</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.zip" id="address.zip" cssClass="form-control"/>
                            </div>
                        </div>
                        <s:property value="%{vendorIdParam}" />
                        <s:hidden name="vendorIdParam" id="vendorIdParam"   value="%{vendorIdParam}" />

				  <span class="pull-right" style="margin-right:32px;">
					<a href="customer-add2.jsp" class="btn btn-default" id ="groups-btn" style="width:70px;">Back</a>
					<s:submit value="Save" name="submit" cssClass="btn btn-default" />

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
</div>

