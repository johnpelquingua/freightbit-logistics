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
                <s:form cssClass="form-horizontal" action="editVendorShipping" method="POST" theme="bootstrap">
                <s:hidden name="vendor.vendorId" value="%{vendor.vendorId}" />
                <div class="form-group">
                    <label for="vendor.vendorName" class="col-sm-2 control-label">Name:</label>

                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" id="vendor.vendorName" placeholder="Vendor Name"
                                     name="vendor.vendorName"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorCode" class="col-sm-2 control-label">Code:</label>

                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" id="vendor.vendorCode" placeholder="Vendor Code"
                                     name="vendor.vendorCode"></s:textfield>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorType" class="col-sm-2 control-label">Type:</label>

                    <div class="col-sm-10">
                        <s:select cssClass="form-control" id="vendor.vendorType" list="vendorTypeList" listValue="value"
                                  listKey="key"
                                  name="vendor.vendorType"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorClass" class="col-sm-2 control-label">Name:</label>

                    <div class="col-sm-10">
                        <s:select cssClass="form-control" id="vendor.vendorClass" list="vendorClassList" listKey="key"
                                  listValue="value"
                                  name="vendor.vendorClass"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vendor.vendorStatus" class="col-sm-2 control-label">Status:</label>

                    <div class="col-sm-10">
                        <s:select cssClass="form-control" id="vendor.vendorStatus" list="statusList"
                                  listKey="key" listValue="value"
                                  name="vendor.vendorStatus"/>
                    </div>
                </div>

            </div>

            <div class="panel-footer">
                <div class="btn-group" style="float: right;">
                    <s:submit cssClass="btn btn-default" value="Save" type="submit"/>
                    <button class="btn btn-default" onclick="this.form.action='viewVendors'"/>
                    Cancel</button>
                </div>

                </s:form>
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
