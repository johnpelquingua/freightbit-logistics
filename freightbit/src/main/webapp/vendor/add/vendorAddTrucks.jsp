<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewTrucks' />"> Trucks</a></li>
            <li class="active"> Add New Truck</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add New Truck</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="addTrucks" method="post" theme="bootstrap">
                        <div class="form-group">

                            <label class="col-sm-2 control-label" for="truck.truckType">Type:</label>

                            <div class="col-sm-10">
                                <s:select list="truckTypeList" name="truck.truckType" listKey="key" listValue="value"
                                          cssClass="form-control"/>

                            </div>
                        </div>

                        <div class="form-group">

                            <label for="truck.plateNumber" class="col-sm-2 control-label">Plate:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Plate Number" name="truck.plateNumber"
                                             id="truck.plateNumber" required="true" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="truck.modelNumber" class="col-sm-2 control-label">Model:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Model Number" name="truck.modelNumber"
                                             id="truck.modelNumber" required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="truck.modelYear" class="col-sm-2 control-label">Year Model:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Year Model" name="truck.modelYear"
                                             id="truck.modelYear" required="true" maxLength="4"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="truck.engineNumber" class="col-sm-2 control-label">Engine:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Engine Number"
                                             name="truck.engineNumber"
                                             id="truck.engineNumber" required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="truck.truckCode" class="col-sm-2 control-label">Code:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Truck Code" name="truck.truckCode"
                                             id="truck.truckCode" required="true"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="truck.grossWeight" class="col-sm-2 control-label">Weight:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Gross Weight" name="truck.grossWeight"
                                             id="truck.grossWeight" required="true"/>
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
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li class="active"><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>
</div>