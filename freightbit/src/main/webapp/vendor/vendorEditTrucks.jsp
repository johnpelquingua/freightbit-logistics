<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Trucks</h1>

    <!-- EDIT HERE -->
    <div class="main-box" style=" margin-left: -40px; ">
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/truck.png" class="box-icon">
                <span class="panel-title">Truck Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="editTrucks" method="post" theme="bootstrap">
                    <s:hidden name="truck.truckId" value="%{truck.truckId}"/>

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
                                         id="truck.plateNumber"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.modelNumber" class="col-sm-2 control-label">Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Model Number" name="truck.modelNumber"
                                         id="truck.modelNumber"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.modelYear" class="col-sm-2 control-label">Year Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Year Model" name="truck.modelYear"
                                         id="truck.modelYear"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.engineNumber" class="col-sm-2 control-label">Engine:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Engine Number" name="truck.engineNumber"
                                         id="truck.engineNumber"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.truckCode" class="col-sm-2 control-label">Code:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Truck Code" name="truck.truckCode"
                                         id="truck.truckCode"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.grossWeight" class="col-sm-2 control-label">Weight:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Gross Weight" name="truck.grossWeight"
                                         id="truck.grossWeight"/>
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

    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/calendar.png" class="box-icon">
                <span class="panel-title">Process</span>
            </div>
            <div class="panel-body" style="height: 195px;">
                <ul class="nav" style="margin-top: -10px;">

                    <li>
                        <a href="viewTrucks" class="side-help" style="font-size: 15px;">
                            <img src="includes/images/1.png" class="img-sidehelp">List of Trucks
                        </a>
                    </li>
                    <li><a href="viewDrivers" class="side-help" style="font-size: 15px;">
                        <img src="includes/images/2.png" class="img-sidehelp">Driver Information</a>
                    </li>
                    <li>
                        <a href="viewVendorTruckingContacts" class="side-help" style="font-size: 15px;">
                            <img src="includes/images/3.png" class="img-sidehelp">Contact Information
                        </a>
                    </li>
                    <li>
                        <a href="viewTruckingAddress" class="side-help" style="font-size: 15px;">
                            <img src="includes/images/4.png" class="img-sidehelp">Address</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <!-- SIDeBAR GOES HERE -->
</div>
<!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->