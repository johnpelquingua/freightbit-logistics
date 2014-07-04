<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>--%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

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

                    <s:form  action="editAddress" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="address.addressId" value="%{addressIdParam}" />
                    <div class="form-group">

                        <label for="address.addressType" class="col-sm-2 control-label" style="width:25%;">Address Type</label>
                        <div class="col-sm-10" style="width:70%;">
                            <s:select name="address.addressType" list="addressTypeList" listValue="value" listKey="key" cssClass="form-control" id="address.addressType" emptyOption="true"/>
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
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button class="btn btn-default">Cancel</button>
                    <s:submit cssClass="btn btn-default" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
    <!-- END OF MAIN BOX -->

    <!-- SIDEBAR -->
</div>--%>

<div class="row">
    <div class="col-lg-12">
        <h1>Customer Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewAddress' />"> <i class="fa fa-home"></i> Address </a></li>
            <li class="active"><i class="fa fa-pencil"></i> Edit Address</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Address</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form action="editAddress" cssClass="form-horizontal" theme="bootstrap">
                        <s:hidden name="address.addressId" value="%{addressIdParam}"/>
                        <s:hidden name="address.createdTimeStamp" value="%{address.createdTimeStamp}" />
                        <s:hidden name="address.createdBy" value="%{address.createdBy}" />
                        <div class="form-group">

                            <label for="address.addressType" class="col-sm-2 control-label" style="width:25%;">Address
                                Type</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:select name="address.addressType" list="addressTypeList" listValue="value"
                                          listKey="key"
                                          cssClass="form-control" id="address.addressType" emptyOption="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Address Line 1</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.addressLine1" id="address.addressLine1"
                                             cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Address Line 2</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.addressLine2" id="address.addressLine2"
                                             cssClass="form-control"/>
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
                            <label class="col-sm-2 control-label" style="width:25%;">Zip Code</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.zip" id="address.zip" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="pull-right">
                            <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                        </div>
                    </s:form>
                </div>


            </div>
        </div>
    </div>

    <div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li class="active"><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>

            </ul>
        </div>
    </div>
</div>
<!-- /.row -->

