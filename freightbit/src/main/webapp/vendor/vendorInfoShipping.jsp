<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left:-40px;">Vendor Profile</h1>

    <!-- EDIT HERE -->

    &lt;%&ndash;<s:hidden name="vendor.vendorId" id="vendor.vendorId" value="%{vendor.vendorId}"/>&ndash;%&gt;

    <s:if test="hasActionMessages()">
        &lt;%&ndash;<div class="row alert alert-success alert-dismissable">
            <s:actionmessage/>
        </div>&ndash;%&gt;
        <div class="col-lg-10">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                    ×</button>
                <span class="fa fa-check"></span> <strong>Success Message</strong>
                <hr class="message-inner-separator">
                <s:actionmessage/>
            </div>
        </div>
    </s:if>

    <div class="main-box" style="margin-left:-40px;">

        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/account.png" class="box-icon">
                <span class="panel-title">Shipping Information</span>
            </div>
            <div class="panel-body">
                <div style="float:left; width:50%;">
                    <img src="includes/images/default-image.png" style="width:150px;margin:6px;">
                </div>

                <h2><s:property value="vendor.vendorName"/></h2>
                <br/>
                <b>Code: </b><s:property value="vendor.vendorCode"/>
                <br/>
                <b>Type: </b><s:property value="vendor.vendorType"/>
                <br/>
                <b>Class: </b><s:property value="vendor.vendorClass"/>
                <br/>
                <b>Status: </b><s:property value="vendor.vendorStatus"/>


            </div>
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

    <!-- SIDEBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->--%>


<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><i class="fa fa-info-circle"></i> Vendor Profile</li>
        </ol>

    </div>
</div><!-- /.row -->

<s:if test="hasActionMessages()">
    <%--<div class="row alert alert-success alert-dismissable">
        <s:actionmessage/>
    </div>--%>
    <div class="col-lg-10">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                ×</button>
            <span class="fa fa-check"></span> <strong>Success Message</strong>
            <hr class="message-inner-separator">
            <s:actionmessage/>
        </div>
    </div>
</s:if>

<div class="row">

    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Vendor Profile</h3>
            </div>

            <div class="panel-body">

                <s:set name="vendorId" value="%{vendor.vendorId}" scope="session"/>

                <div class="row">
                    <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="includes/images/photo.png" class="img-circle"> </div>

                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td>Company Name:</td>
                                <td><s:property value="vendor.vendorName"/></td>
                            </tr>
                            <tr>
                                <td>Company Code:</td>
                                <td><s:property value="vendor.vendorCode"/></td>
                            </tr>
                            <tr>
                                <td>Type:</td>
                                <td><s:property value="vendor.vendorType"/></td>
                            </tr>

                            <tr>
                            <tr>
                                <td>Classification:</td>
                                <td><s:property value="vendor.vendorClass"/></td>
                            </tr>
                            <tr>
                                <td>Status:</td>
                                <td><s:property value="vendor.vendorStatus"/></td>
                            </tr>

                            </tbody>
                        </table>

                    </div>
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
                <li class="active"><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorShippingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>


            </ul>
        </div>
    </div>

</div>