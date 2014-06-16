<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left:-40px;">Vendor Profile</h1>

    <!-- EDIT HERE -->

    <%--<s:hidden name="vendor.vendorId" id="vendor.vendorId" value="%{vendor.vendorId}"/>--%>

    <div class="main-box" style="margin-left:-40px;">

        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/account.png" class="box-icon">
                <span class="panel-title">Personal Information</span>
            </div>
            <div class="panel-body">
                <div style="float:left; width:50%;">
                    <img src="includes/images/default-image.png" style="width:150px;margin:6px;">
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
            </div>
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
                    <li><a href="viewVendors" class="side-help" style="font-size: 15px;"><img src="includes/images/1.png"
                                                                       class="img-sidehelp">Trucks
                        Information</a></li>
                    <li><a href="vendor-driver" class="side-help" style="font-size: 15px;"><img src="includes/images/2.png"
                                                                       class="img-sidehelp">Driver
                        Information</a></li>
                    <li><a href="vendor-contact-person" class="side-help" style="font-size: 15px;"><img src="includes/images/3.png"
                                                                               class="img-sidehelp">Contact
                        Person</a></li>
                 <%--   <li><a href="vendor-other-information" class="side-help"><img
                            src="includes/images/5.png"
                            class="img-sidehelp">Other
                        Information</a></li>--%>
                    <li><a href="vendor-address" class="side-help" style="font-size: 15px;"><img src="includes/images/4.png"
                                                                        class="img-sidehelp">Address</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- SIDEBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->
