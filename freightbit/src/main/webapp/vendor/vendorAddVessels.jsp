<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Vessels</h1>

    <!-- EDIT HERE -->
    <div class="main-box">
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/anchor-3-24.png" class="box-icon">
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

    <!-- SIDBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->
