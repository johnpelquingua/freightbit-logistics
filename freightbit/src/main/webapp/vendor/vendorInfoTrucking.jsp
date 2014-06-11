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

                <div class="form-group">
                    <label for="vendor.vendorName" class="col-sm-2 control-label">Name:</label>
                    <div class="col-sm-10">
                        <s:textfield disabled="true" cssClass="form-control" id="vendor.vendorName" name="vendor.vendorName"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorCode" class="col-sm-2 control-label">Code:</label>
                    <div class="col-sm-10">
                        <s:textfield disabled="true" cssClass="form-control" id="vendor.vendorCode" name="vendor.vendorCode"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorType" class="col-sm-2 control-label">Type:</label>
                    <div class="col-sm-10">
                        <s:textfield disabled="true" cssClass="form-control" id="vendor.vendorType" name="vendor.vendorType" ></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorClass" class="col-sm-2 control-label">Name:</label>
                    <div class="col-sm-10">
                        <s:textfield disabled="true" cssClass="form-control" id="vendor.vendorClass" name="vendor.vendorClass" ></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorStatus" class="col-sm-2 control-label">Status:</label>
                    <div class="col-sm-10">
                        <s:textfield disabled="true" cssClass="form-control" id="vendor.vendorStatus" name="vendor.vendorStatus" ></s:textfield>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/calendar.png" class="box-icon">
                <span class="panel-title">Process</span>
            </div>

            <div class="panel-body">

                <ul class="nav">
                    <li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png"
                                                                          class="img-sidehelp">Personal
                        Information</a></li>
                    <li><a href="vendor-trucks" class="side-help"><img src="includes/images/2.png"
                                                                       class="img-sidehelp">Trucks
                        Information</a></li>
                    <li><a href="vendor-driver" class="side-help"><img src="includes/images/3.png"
                                                                       class="img-sidehelp">Driver
                        Information</a></li>
                    <li><a href="vendor-contact-person" class="side-help"><img src="includes/images/4.png"
                                                                               class="img-sidehelp">Contact
                        Person</a></li>
                    <li><a href="vendor-other-information" class="side-help"><img
                            src="includes/images/5.png"
                            class="img-sidehelp">Other
                        Information</a></li>
                    <li><a href="vendor-address" class="side-help"><img src="includes/images/6.png"
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
