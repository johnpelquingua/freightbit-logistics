<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Vendor Info Shipping</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"> Vendor Shipping Profile</li>
        </ol>

    </div>
</div>
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
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Vendor Shipping Profile</h3>
            </div>

            <div class="panel-body" style="margin-bottom:-20px;">

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
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorShippingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>
            </ul>
        </div>
    </div>

</div>