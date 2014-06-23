<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style=" margin-left: -40px; ">Add - Drivers</h1>

    <!-- EDIT HERE -->
    <div class="main-box" style=" margin-left: -40px; ">
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="panel-title">Add - Driver Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="addDriver" theme="bootstrap">
                    <div class="form-group">

                        <label for="driver.driverCode" class="col-sm-2 control-label">Code:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Driver Code" name="driver.driverCode"
                                         id="driver.driverCode"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.licenseNumber" class="col-sm-2 control-label">License:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="License Number"
                                         name="driver.licenseNumber" id="driver.licenseNumber"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.lastName" class="col-sm-2 control-label">Last Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="driver.lastName"
                                         id="driver.lastName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.firstName" class="col-sm-2 control-label">First Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="driver.firstName"
                                         id="driver.firstName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.middleName" class="col-sm-2 control-label">Middle Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="driver.middleName"
                                         id="driver.middleName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="driver.title" class="col-sm-2 control-label">Title:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Title" name="driver.title"
                                         id="driver.title"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-sm-2 control-label" for="driver.status">Status:</label>

                        <div class="col-sm-10">
                            <s:select list="statusList" listKey="key" listValue="value" name="driver.status"
                                      cssClass="form-control"/>
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
</div>

<!-- END OF THE MIDDLE -->
