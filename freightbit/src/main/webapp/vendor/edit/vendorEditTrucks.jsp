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
            <li class="active"><a href="<s:url action='viewTrucks' />"> Trucks</a></li>
            <li class="active"> Edit Truck</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Truck</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="editTrucks" method="post" theme="bootstrap">
                        <s:hidden name="truck.truckId" value="%{truck.truckId}"/>
                        <s:hidden name="truck.createdTimeStamp" value="%{truck.createdTimeStamp}" />
                        <s:hidden name="truck.createdBy" value="%{truck.createdBy}" />


                        <div class="col-lg-6">

                                <%--Plate Number = plateNumber--%>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number<span class="asterisk_red"></span></label>

                                <div class="col-lg-8">
                                    <s:textfield cssClass="form-control" placeholder=" e.g. ABC-123, XYZ-7890, etc." name="truck.plateNumber"
                                                 id="truck.plateNumber" required="true" pattern=".{7,8}" title="Example: ABC-123,XYZ-7890"/>
                                </div>
                            </div>

                                        <%--LTO Certificate Number = code--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">LTO Certificate Number<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="LTO Certificate Number" name="truck.truckCode"
                                                         id="truck.truckCode" required="true" title="Input your LTO Certificate Number"/>
                                        </div>

                                    </div>

                                        <%--MV File Number--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">MV File Number<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="MV File Number" name="truck.motorVehicleNumber"
                                                         id="truck.motorVehicleNumber" required="true" title="Input your MV File Number"/>
                                        </div>
                                    </div>




                                        <%--Model = modelNumber--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Model<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="Model" name="truck.modelNumber"
                                                         id="truck.modelNumber" required="true" title="Example: 4Runner, Yukon, Silverado"/>
                                        </div>


                                    </div>

                                        <%--Owner's Name = ownerName--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Owner's Name<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="Owner's Name" name="truck.ownerName"
                                                         id="truck.ownerName" required="true" pattern="^(\s*[a-zA-Z\xD1-\xF1]+(([\'\-\+\s]\s*[a-zA-Z\xD1-\xF1])?[a-zA-Z\xD1-\xF1]*)\s*)+$"
                                                         title="Owner's Name should not contain special characters and/or numbers." maxLength="50"/>
                                        </div>
                                    </div>
                                        <%--Owner's Address = ownerAddress--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Owner's Address<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="Owner's Address" name="truck.ownerAddress"
                                                         id="truck.ownerAddress" required="true" pattern="^(\s*[a-zA-Z0-9]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$"
                                                         title="Owner's Address should not contain special characters."/>
                                        </div>
                                    </div>
                                        <%--O.R. Number = officialReceipt--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">O.R. Number<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="O.R. Number" name="truck.officialReceipt"
                                                         id="truck.officialReceipt" required="true" title="Please Input Valid O.R. Number"/>
                                        </div>
                                    </div>

                        </div>


                        <div class="col-lg-6">

                                <%--CR Date of Issue--%>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">CR Date of Issue<span class="asterisk_red"></span></label>

                                <div class="col-lg-8">
                                    <s:textfield cssClass="form-control" placeholder="CR Date of Issue" name="truck.issueDate"
                                                 id="issueDate" required="true"/>

                                </div>
                            </div>

                                        <%--Make = engineNumber--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Make<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder=" e.g. Toyota, GMC, Chevrolet, etc."
                                                         name="truck.engineNumber" title="Example: Toyota, GMC, Chevrolet."
                                                         id="truck.engineNumber" required="true"/>
                                        </div>

                                    </div>

                                        <%--Type of Body = truckType--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Type of Body<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:select list="truckTypeList" name="truck.truckType" listKey="key" listValue="value"
                                                      cssClass="form-control"/>

                                        </div>
                                    </div>

                                        <%--Year Model = modelYear--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Year Model<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="e.g. 1999, 2012, etc." name="truck.modelYear"
                                                         id="truck.modelYear" required="true" maxLength="4" title="Example: 1999, 2012"/>
                                        </div>

                                    </div>

                                        <%--Gross Weight = grossWeight--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Gross Weight (kg.)<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="Gross Weight" name="truck.grossWeight"
                                                         id="truck.grossWeight" required="true" pattern="^[0-9]*$"
                                                         title="Gross Weight will not accept letters or special characters."/>
                                        </div>
                                    </div>
                                        <%--Net Weight = netWeight--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Net Weight (kg.)<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="Net Weight" name="truck.netWeight"
                                                         id="truck.netWeight" required="true" pattern="^[0-9]*$"
                                                         title="Gross Weight will not accept letters or special characters."/>
                                        </div>
                                    </div>
                                        <%--Net Capacity = netCapacity--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Net Capacity<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control" placeholder="Net Capacity" name="truck.netCapacity"
                                                         id="truck.netCapacity" required="true"/>
                                        </div>
                                    </div>

                       </div>
                </div>

            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewTrucks" class="btn btn-default" id ="groups-btn">Cancel</a>

                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>

        </div>
    </div>

</div>

<script type="text/javascript">

    var issueDate = $('#issueDate');

    issueDate.datepicker({

        dateFormat: 'mm/dd/yy',
        startDate: 2

    });

</script>