<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<%--
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

                    <s:form action="editShippingAddress" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden value="%{addressIdParam}" name="address.addressId"/>
                    <div class="form-group">

                        <label for="address.addressType" class="col-sm-2 control-label" style="width:25%;">Address
                            Type</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:select name="address.addressType" list="addressTypeList" listValue="value" listKey="key"
                                      cssClass="form-control" id="address.addressType"/>
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
                        <label class="col-sm-2 control-label" style="width:25%;">Zip Code</label>

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

    <div class="sidebar-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="includes/images/calendar.png" class="box-icon">
                <span class="booking panel-title">Process</span>
            </div>

            <div class="panel-body">

                <ul class="nav">
                    <li><a href="viewVessels" class="side-help" style="font-size: 15px;"><img src="includes/images/1.png"
                                                                                              class="img-sidehelp" >List of Vessels</a>
                    </li>
                    <li><a href="viewVendorShippingContacts" class="side-help" style="font-size: 15px;"><img src="includes/images/2.png" class="img-sidehelp">Contact Persons</a>
                    </li>
                    <li><a href="viewShippingAddress" class="side-help" style="font-size: 15px;"><img src="includes/images/3.png"
                                                                                                      class="img-sidehelp">Address</a>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</div>
--%>


<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> <i class="fa fa-info-circle"></i> Vendor
                Profile</a></li>
            <li class="active"><i class="fa fa-home"></i> Address</li>
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
                    <s:form action="editShippingAddress" cssClass="form-horizontal" theme="bootstrap">
                        <div class="form-group">

                            <label for="address.addressType" class="col-sm-2 control-label" style="width:25%;">Address
                                Type</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:select name="address.addressType" list="addressTypeList" listValue="value"
                                          listKey="key" cssClass="form-control" id="address.addressType"
                                          emptyOption="true"/>
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
                        <s:property value="%{vendorIdParam}"/>
                        <s:hidden name="vendorIdParam" id="vendorIdParam" value="%{vendorIdParam}"/>
                        <s:hidden name="address.createdTimeStamp" value="%{address.createdTimeStamp}" />
                        <s:hidden name="address.createdBy" value="%{address.createdBy}" />
                        <div class=" pull-right">
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
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li class="active"><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li <%--class="active"--%>><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>


            </ul>
        </div>
    </div>
</div>
<!-- /.row -->

