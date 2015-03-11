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
            <li class="active"> Add Truck</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add Truck</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="addTrucks" method="post" theme="bootstrap">


                        <div class="col-lg-6">
                                <%--Plate Number = plateNumber--%>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number<span class="asterisk_red"></span></label>

                                <div class="col-lg-8">
                                    <s:textfield cssClass="vendorAddTruckInput form-control" placeholder="e.g. ABC-123, XYZ-7890, etc." name="truck.plateNumber"
                                                 id="truck_plateNumber" required="true" pattern=".{7,8}" title="Example: ABC-123,XYZ-7890"/>
                                </div>

                            </div>


                                <%--LTO Certificate Number = code--%>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">LTO Certificate Number<span class="asterisk_red"></span></label>

                                <div class="col-lg-8">
                                    <s:textfield cssClass="vendorAddTruckInput form-control" placeholder="LTO Certificate Number" name="truck.truckCode"
                                                 id="truck.truckCode" required="true" maxlength="10" title="Input your LTO Certificate Number"/>
                                </div>

                            </div>

                                        <%--MV File Number--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">MV File Number<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="vendorAddTruckInput form-control" placeholder="MV File Number" name="truck.motorVehicleNumber" onkeypress="return isNumberKey(event)"
                                                         id="truck_motorVehicleNumber" required="true" title="Input your MV File Number" />
                                        </div>
                                    </div>


                                        <%--Model = modelNumber--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Model<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="vendorAddTruckInput form-control" placeholder="e.g. 4Runner, Yukon, Silverado, etc." name="truck.modelNumber"
                                                         id="truck.modelNumber" required="true" title="Example: 4Runner, Yukon, Silverado"/>
                                        </div>

                                    </div>


                                        <%--Owner's Name = ownerName--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Owner's Name<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="vendorAddTruckInput form-control" placeholder="Owner's Name" name="truck.ownerName"
                                                         id="truck.ownerName" required="true" pattern="^(\s*[a-zA-Z\xD1-\xF1]+(([\'\-\+\s]\s*[a-zA-Z\xD1-\xF1])?[a-zA-Z\xD1-\xF1]*)\s*)+$"
                                                         title="Owner's Name should not contain special characters and/or numbers." maxLength="50"/>
                                        </div>
                                    </div>

                                        <%--Owner's Address = ownerAddress--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Owner's Address<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control vendorAddTruckInput" placeholder="Owner's Address" name="truck.ownerAddress"
                                                         id="truck.ownerAddress" required="true" pattern="^(\s*[a-zA-Z0-9]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$"
                                                         title="Owner's Address should not contain special characters."/>
                                        </div>
                                    </div>


                                        <%--O.R. Number = officialReceipt--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">O.R. Number<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control vendorAddTruckInput" placeholder="O.R. Number" name="truck.officialReceipt" onkeypress="return isNumberKey(event)"
                                                         id="truck.officialReceipt" required="true" title="Please Input Valid O.R. Number" maxlength="15" pattern="[0-9]+"/>
                                        </div>
                                    </div>

                        </div>


                        <div class="col-lg-6">

                                <%--CR Date of Issue--%>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">CR Date of Issue<span class="asterisk_red"></span></label>

                                <div class="col-lg-8">
                                    <s:textfield cssClass="form-control" placeholder="CR Date of Issue" name="truck.issueDate"
                                                 id="issueDate" required="true" readonly="true"/>
                                </div>
                            </div>

                                        <%--Make = engineNumber--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Make<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="vendorAddTruckInput form-control" placeholder="e.g. Toyota, GMC, Chevrolet, etc."
                                                         name="truck.engineNumber" title="Example: Toyota, GMC, Chevrolet."
                                                         id="truck.engineNumber" required="true"/>
                                        </div>

                                    </div>

                                        <%--Type of Body = truckType--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Type of Body<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:select list="truckTypeList" name="truck.truckType" listKey="key" listValue="value"
                                                      cssClass="form-control vendorAddTruckInput"/>

                                        </div>
                                    </div>

                                        <%--Year Model = modelYear--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Year Model<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="vendorAddTruckInput form-control" placeholder=" e.g. 1999, 2012, etc." name="truck.modelYear" onkeypress="return isNumberKey(event)"
                                                         id="truck_modelYear" required="true" maxLength="4" title="Example: 1999, 2012"/>
                                        </div>

                                    </div>

                                        <%--Gross Weight = grossWeight--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Gross Weight (kg.)<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control vendorAddTruckInput" placeholder="Gross Weight" name="truck.grossWeight" onkeypress="return isNumberKey(event)"
                                                         id="truck_grossWeight" required="true" pattern="^[0-9]*$" maxLength="9"
                                                         title="Gross Weight will not accept letters or special characters."/>
                                        </div>
                                    </div>

                                        <%--Net Weight = netWeight--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Net Weight (kg.)<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control vendorAddTruckInput" placeholder="Net Weight" name="truck.netWeight" onkeypress="return isNumberKey(event)"
                                                         id="truck_netWeight" required="true" pattern="^[0-9]*$" maxLength="9"
                                                         title="Gross Weight will not accept letters or special characters."/>
                                        </div>
                                    </div>



                                        <%--Net Capacity = netCapacity--%>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Net Capacity<span class="asterisk_red"></span></label>

                                        <div class="col-lg-8">
                                            <s:textfield cssClass="form-control vendorAddTruckInput" placeholder="Net Capacity" name="truck.netCapacity"
                                                         id="truck_netCapacity" required="true" maxLength="9" onkeypress="return isNumberKey(event)"
                                                         title="Net Capacity will not accept letters or special characters."/>
                                        </div>
                                    </div>


                        </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewTrucks" class="btn btn-danger" id ="groups-btn">Cancel</a>
                    <s:submit cssClass="btn btn-primary vendorAddTruckBtn" name="submit" value="Save" disabled="true"/>
                </div>
            </div>
            </s:form>

        </div>
    </div>

    <%--<div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li class="active"><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>--%>


</div>

<script type="text/javascript">

    var issueDate = $('#issueDate');

    issueDate.datepicker({

        dateFormat: 'mm/dd/yy',
        startDate: 2

    });


    $(document).ready(function(){
        validationForm('vendorAddTruckInput', 'vendorAddTruckBtn');
        $("#truck_motorVehicleNumber").mask("9999-99999999999");
        $("#truck_plateNumber").mask("AAA-9999");
        $("#truck_modelYear").mask("9999");
        $("#truck_grossWeight").mask("999999999");
        $("#truck_netWeight").mask("999999999");
        $("#truck_netCapacity").mask("999999999");
//        $("#shipping_fax").mask("(999) 999-9999");
    });
    $("#truck_plateNumber").keyup(function(){
        this.value=this.value.toUpperCase();
    });
    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57) || (charCode == 46 && $(this).val().indexOf('.') != -1))
            return false;

        return true;
    }


</script>