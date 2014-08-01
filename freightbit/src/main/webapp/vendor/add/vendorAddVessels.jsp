<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Vessels</h1>

    <!-- EDIT HERE -->
    <div class="main-box">
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="../includes/images/anchor-3-24.png" class="box-icon">
                <span class="panel-title">Vessel Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="addVessels" theme="bootstrap">

                    <div class="form-group">

                        <label for="vessel.vesselNumber" class="col-sm-2 control-label">Vessel:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Vessel Number" name="vessel.vesselNumber"
                                         id="vessel.vesselNumber"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="vessel.vesselName" class="col-sm-2 control-label">Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Vessel Name" name="vessel.vesselName"
                                         id="vessel.vesselName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="vessel.modelNumber" class="col-sm-2 control-label">Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Model Number" name="vessel.modelNumber"
                                         id="vessel.modelNumber"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="vessel.modelYear" class="col-sm-2 control-label">Year Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Year Model" name="vessel.modelYear"
                                         id="vessel.modelYear"/>
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
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/calendar.png" class="box-icon">
                <span class="booking panel-title">Process</span>
            </div>

            <div class="panel-body">

                <ul class="nav">
                    <li><a href="viewVessels" class="side-help" style="font-size: 15px;"><img src="../includes/images/1.png"
                                                                                              class="img-sidehelp" >List of Vessels</a>
                    </li>
                    <li><a href="viewVendorShippingContacts" class="side-help" style="font-size: 15px;"><img src="../includes/images/2.png" class="img-sidehelp">Contact Persons</a>
                    </li>
                    <li><a href="viewShippingAddress" class="side-help" style="font-size: 15px;"><img src="../includes/images/3.png"
                                                                                                      class="img-sidehelp">Address</a>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <!-- SIDBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->
--%>


<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> <i class="fa fa-info-circle"></i> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewVessels' />"> <i class="fa fa-anchor"></i> Vessels</a></li>
            <li class="active"><i class="fa fa-plus"></i> Add New Vessel</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add New Vessel</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="addVessels" theme="bootstrap">
                        <div class="form-group">

                            <label for="vessel.vesselNumber" class="col-sm-2 control-label">Vessel:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Vessel Number"
                                             name="vessel.vesselNumber"
                                             id="vessel.vesselNumber" pattern="[A-Za-z0-9]+" title="No special characters allowed"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vessel.vesselName" class="col-sm-2 control-label">Name:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Vessel Name" name="vessel.vesselName"
                                             id="vessel.vesselName" pattern="[A-Za-z]+" title="No special characters allowed"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vessel.modelNumber" class="col-sm-2 control-label">Model:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Model Number"
                                             name="vessel.modelNumber"
                                             id="vessel.modelNumber" pattern="[A-Za-z0-9]+" title="No special characters allowed"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vessel.modelYear" class="col-sm-2 control-label">Year Model:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Year Model" name="vessel.modelYear"
                                             id="vessel.modelYear" maxLength="4" pattern="\d{4}"/>
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
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="#"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li class="active"><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>


            </ul>
        </div>
    </div>
</div>
<!-- /.row -->
