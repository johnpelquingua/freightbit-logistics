<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building-o"></i> Vendor Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewVessels' />"> Vessels</a></li>
            <li class="active"> Add Vessel</li>
        </ol>

    </div>
</div>
<%--start--%>
<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;"><i class="fa fa-info-circle"></i> Vendor Shipping Profile</h3>
                <%--<span class="pull-right">
                    <s:url var="editVendorUrl" action="loadEditVendorPage">
                        <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                    </s:url>
                        <s:a cssClass="btn btn-success new-booking" href="%{editVendorUrl}" rel="tooltip"
                             title="Edit this vendor">
                            <i class="fa fa-pencil"></i> Edit Vendor
                        </s:a>
                </span>--%>
            </div>

            <div class="panel-body">
                <%--<s:set name="vendorId" value="%{vendor.vendorId}" scope="session"/>--%>
                <s:hidden value="%{vendor.vendorId}"></s:hidden>
                <div class="row">
                    <div class=" col-lg-6 col-lg-offset-3">
                        <div class="panel panel-info ">

                            <%--<div align="center" style="margin-top: 10px;">
                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                            </div>--%>
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <div align="center" style="margin-top: 10px;">
                                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-9">

                                        <table class="table table-user-information profile" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Company Name</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="vendor.vendorName"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Company Code</td>
                                                <td><s:property value="vendor.vendorCode"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Type</td>
                                                <td><s:property value="vendor.vendorType"/></td>
                                            </tr>

                                            <tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Classification</td>
                                                <td><s:property value="vendor.vendorClass"/></td>
                                            </tr>
                                            <%--<tr>--%>
                                            <%--<td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Status</td>--%>
                                            <%--<td><s:property value="vendor.vendorStatus"/></td>--%>
                                            <%--</tr>--%>

                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>

                    <%--<div class="col-lg-2 col-lg-offset-2">
                        <div class="panel panel-info" >
                            &lt;%&ndash;<div class="panel-heading">&ndash;%&gt;
                            &lt;%&ndash;<h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>&ndash;%&gt;
                            &lt;%&ndash;</div>&ndash;%&gt;
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <a href="viewInfoVendor" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                        <a href="#" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                        <a href="viewVendorShippingContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>
                                        <a href="viewVessels" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-anchor fa-fw"></i> <br/>Vessels</a>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>--%>

                </div>

            </div>

        </div>

        <%--main content here--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-plus"></i> Add Vessel</h3>
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive list-table">
                            <s:form cssClass="form-horizontal" action="addVessels" theme="bootstrap">
                                <%--<div class="form-group">

                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Vessel</label>

                                    <div class="col-lg-10"><span class="asterisk_input"></span>
                                        <s:textfield cssClass="form-control" placeholder="Vessel Number"
                                                     name="vessel.vesselNumber"
                                                     id="vessel.vesselNumber" pattern="[A-Za-z0-9]+" title="No special characters allowed"/>
                                    </div>

                                </div>--%>

                            <div class="form-group">

                                <label class="col-lg-2 control-label" style="padding-top:0px;">Vessel Name<span class="asterisk_red"></span></label>

                                <div class="col-lg-10">
                                    <s:textfield cssClass="form-control" placeholder="Vessel Name" name="vessel.vesselName"
                                                 id="vessel.vesselName" pattern="^[a-z0-9_-,./]{3,15}$" title="No special characters allowed" required="true" maxlength="50"/>
                                </div>

                            </div>

                            <div class="form-group">

                                    <%--<label class="col-lg-2 control-label" style="padding-top:0px;">Model</label>

                                    <div class="col-lg-10"><span class="asterisk_input"></span>
                                        <s:textfield cssClass="form-control" placeholder="Model Number"
                                                     name="vessel.modelNumber"
                                                     id="vessel.modelNumber" pattern="[A-Za-z0-9]+" title="No special characters allowed"/>
                                    </div>--%>

                                <label class="col-lg-2 control-label" style="padding-top:0px;">Vessel Type<span class="asterisk_red"></span></label>

                                <div class="col-lg-10">
                                    <s:select cssClass="form-control" placeholder="Vessel Type" name="vessel.vesselType"
                                              listKey="key" listValue="value" list="vesselTypeList" id="vessel.vesselType" pattern="[A-Za-z]+" title="No special characters allowed"/>
                                </div>

                            </div>

                                <%--<div class="form-group">

                                    <label class="col-lg-2 control-label" style="padding-top:0px;">Year Model</label>

                                    <div class="col-lg-10"><span class="asterisk_input"></span>
                                        <s:textfield cssClass="form-control" placeholder="Year Model" name="vessel.modelYear"
                                                     id="vessel.modelYear" maxLength="4" pattern="\d{4}"/>
                                    </div>

                                </div>--%>
                        </div>
                    </div>

                    <div class="panel-footer">
                        <div class="pull-right">
                            <a href="viewVessels" class="btn btn-danger" id ="groups-btn">Cancel</a>

                            <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                        </div>
                    </div>
                    </s:form>

                </div>
            </div>

        </div>
    </div>
</div>
<%--end--%>
