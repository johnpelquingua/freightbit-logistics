<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- MIDDLE -->
<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header" style="margin-left:-40px;">Vendor Profile</h1>
    <!-- EDIT HERE -->
    <div class="main-box" style="margin-left:-40px;">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="../includes/images/account.png" class="box-icon">
                <span class="panel-title">Trucking Information</span>
            </div>
            <div class="panel-body">
                <div style="float:left; width:50%;">
                    <img src="../includes/images/default-image.png" style="width:150px;margin:6px;">
                </div>
                <h2><s:property value="vendor.vendorName"/></h2>
                <br/>
                <b>Code:</b> <s:property value="vendor.vendorCode"/>
                <br/>
                <b>Type:</b> <s:property value="vendor.vendorType"/>
                <br/>
                <b>Class:</b> <s:property value="vendor.vendorClass"/>
                <br/>
                <b>Status:</b> <s:property value="vendor.vendorStatus"/>

                <s:set name="vendorId" value="%{vendor.vendorId}" scope="session"/>
            </div>
        </div>
    </div>
    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="../includes/images/calendar.png" class="box-icon">
                <span class="panel-title">Process</span>
            </div>
            <div class="panel-body" style="height: 195px;">
                <ul class="nav" style="margin-top: -10px;">

                    <li>
                        <a href="viewTrucks" class="side-help" style="font-size: 15px;">
                            <img src="../includes/images/1.png" class="img-sidehelp">List of Trucks
                        </a>
                    </li>
                    <li><a href="viewDrivers" class="side-help" style="font-size: 15px;">
                        <img src="../includes/images/2.png" class="img-sidehelp">Driver Information</a>
                    </li>
                    <li>
                        <a href="viewVendorTruckingContacts" class="side-help" style="font-size: 15px;">
                            <img src="../includes/images/3.png" class="img-sidehelp">Contact Information
                        </a>
                    </li>
                    <li>
                        <a href="viewTruckingAddress" class="side-help" style="font-size: 15px;">
                            <img src="../includes/images/4.png" class="img-sidehelp">Address</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
--%>


<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor Info Trucking</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><i class="fa fa-info-circle"></i> Vendor Profile</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">

    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Vendor Trucking Profile</h3>
            </div>

            <div class="panel-body" style=" margin-bottom: -20px; ">

                <s:set name="vendorId" value="%{vendor.vendorId}" scope="session"/>

                <div class="row">
                    <div class="col-md-3 col-lg-3 " align="center"><img alt="User Pic" src="../includes/images/photo.png"
                                                                        class="img-circle"></div>

                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td style="font-weight: bold;">Company Name</td>
                                <td><s:property value="vendor.vendorName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Company Code</td>
                                <td><s:property value="vendor.vendorCode"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Type</td>
                                <td><s:property value="vendor.vendorType"/></td>
                            </tr>

                            <tr>
                            <tr>
                                <td style="font-weight: bold;">Classification</td>
                                <td><s:property value="vendor.vendorClass"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Status</td>
                                <td><s:property value="vendor.vendorStatus"/></td>
                            </tr>

                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li <%--class="active"--%>><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>


            </ul>
        </div>
    </div>

</div>

