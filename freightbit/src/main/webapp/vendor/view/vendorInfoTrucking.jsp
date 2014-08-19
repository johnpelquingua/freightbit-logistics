<%@ taglib prefix="s" uri="/struts-tags" %>

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
            <li class="active"> Vendor Profile</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Vendor Trucking Profile</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" onclick="location.href=''">
                        <i class="fa fa-pencil"></i> Edit Vendor
                    </button>
                </span>
            </div>

            <div class="panel-body">

                <s:set name="vendorId" value="%{vendor.vendorId}" scope="session"/>

                <div class="row">

                    <%--<div class="col-md-3 col-lg-3 " align="center"><img alt="User Pic" src="../includes/images/photo.png" class="img-circle"></div>--%>

                    <div class=" col-lg-6 col-lg-offset-2">

                        <div class="panel panel-info ">

                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Details</h3>
                            </div>

                            <div align="center" style="margin-top: 10px;">
                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                            </div>

                            <table class="table table-user-information vendor-profile">
                                <tbody>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Company Name</td>
                                    <td><s:property value="vendor.vendorName"/></td>
                                </tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Company Code</td>
                                    <td><s:property value="vendor.vendorCode"/></td>
                                </tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Type</td>
                                    <td><s:property value="vendor.vendorType"/></td>
                                </tr>

                                <tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Classification</td>
                                    <td><s:property value="vendor.vendorClass"/></td>
                                </tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Status</td>
                                    <td><s:property value="vendor.vendorStatus"/></td>
                                </tr>

                                </tbody>
                            </table>

                        </div>

                    </div>

                    <div class="col-lg-2 col-lg-offset-2">
                        <div class="panel panel-info" >
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                            <a href="#" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                            <a href="viewTruckingAddress" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                            <a href="viewVendorTruckingContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>
                                            <a href="viewDrivers" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Drivers</a>
                                            <a href="viewTrucks" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-truck fa-fw"></i> <br/>Trucks</a>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <%--<div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>--%>

</div>

