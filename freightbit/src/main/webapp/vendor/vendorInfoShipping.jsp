<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Vendor Profile</h1>

    <!-- EDIT HERE -->

    <%--<s:hidden name="vendor.vendorId" id="vendor.vendorId" value="%{vendor.vendorId}"/>--%>

    <div class="main-box">

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
                Code: <s:property value="vendor.vendorCode"/>
                <br/>
                Type: <s:property value="vendor.vendorType"/>
                <br/>
                Class: <s:property value="vendor.vendorClass"/>
                <br/>
                Status: <s:property value="vendor.vendorStatus"/>


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
                    <li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png"
                                                                          class="img-sidehelp">Personal Information</a>
                    </li>
                    <li><a href="vendor-vessel" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Vessel</a>
                    </li>
                    <li><a href="vendor-contact-person2" class="side-help"><img src="includes/images/3.png"
                                                                                class="img-sidehelp">Contact Person</a>
                    </li>
                    <li><a href="vendor-other-information2" class="side-help"><img src="includes/images/4.png"
                                                                                   class="img-sidehelp">Other
                        Information</a></li>
                    <li><a href="vendor-address2" class="side-help"><img src="includes/images/5.png"
                                                                         class="img-sidehelp">Address</a></li>
                </ul>

            </div>
        </div>
    </div>

    <!-- SIDEBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->
