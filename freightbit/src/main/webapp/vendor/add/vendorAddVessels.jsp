<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

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
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewVessels' />"> Vessels</a></li>
            <li class="active"> Add Vessel</li>
        </ol>

    </div>
</div>
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

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Vessel Number"
                                             name="vessel.vesselNumber"
                                             id="vessel.vesselNumber" pattern="[A-Za-z0-9]+" title="No special characters allowed"/>
                            </div>

                        </div>--%>

                        <div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Vessel Name</label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Vessel Name" name="vessel.vesselName"
                                             id="vessel.vesselName" pattern="[A-Za-z]+" title="No special characters allowed"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <%--<label class="col-lg-2 control-label" style="padding-top:0px;">Model</label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Model Number"
                                             name="vessel.modelNumber"
                                             id="vessel.modelNumber" pattern="[A-Za-z0-9]+" title="No special characters allowed"/>
                            </div>--%>

                                <label class="col-lg-2 control-label" style="padding-top:0px;">Vessel Type</label>

                                <div class="col-lg-10">
                                    <s:select cssClass="form-control" placeholder="Vessel Type" name="vessel.vesselType"
                                              listKey="key" listValue="value" list="vesselTypeList" id="vessel.vesselType" pattern="[A-Za-z]+" title="No special characters allowed"/>
                                </div>

                        </div>

                        <%--<div class="form-group">

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Year Model</label>

                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Year Model" name="vessel.modelYear"
                                             id="vessel.modelYear" maxLength="4" pattern="\d{4}"/>
                            </div>

                        </div>--%>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewVessels" class="btn btn-default" id ="groups-btn">Cancel</a>

                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>

        </div>
    </div>

</div>