<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building"></i> Vendor Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewDrivers' />"> Drivers</a></li>
            <li class="active"> Edit Driver</li>
        </ol>

    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Driver</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="editDriver" theme="bootstrap">
                        <s:hidden name="driver.driverId" value="%{driver.driverId}"/>
                        <s:hidden name="driver.createdTimeStamp" value="%{driver.createdTimeStamp}" />
                        <s:hidden name="driver.createdBy" value="%{driver.createdBy}" />

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">License<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="License Number"
                                             name="driver.licenseNumber" id="driver_licenseNumber"  required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Last Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Last Name" name="driver.lastName"
                                             id="driver.lastName" pattern="[A-Za-z\s]+" required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">First Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="First Name" name="driver.firstName"
                                             id="driver.firstName" pattern="[A-Za-z\s]+" required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Middle Name</label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Middle Name" name="driver.middleName"
                                             id="driver.middleName" pattern="[A-Za-z\s]+"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Title<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Title" name="driver.title"
                                             id="driver.title" pattern="[A-Za-z .]+" required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Status</label>

                            <div class="col-lg-10">
                                <s:select list="statusList" listKey="key" listValue="value" name="driver.status"
                                          cssClass="form-control"/>
                            </div>

                        </div>

                        <%--<div class="pull-right">

                            <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                        </div>

                    </s:form>--%>

                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewDrivers" class="btn btn-default" id ="groups-btn">Cancel</a>

                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>

        </div>
    </div>

    <%--<div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li class="active"><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>--%>

</div>

<script type="text/javascript">
    $(document).ready(function(){

        $("#driver_licenseNumber").mask("A99-99-9999999");
//        $("#shipping_mobile").mask("(+63999)(999-9999)");
//        $("#shipping_fax").mask("(999) 999-9999");

    });
</script>