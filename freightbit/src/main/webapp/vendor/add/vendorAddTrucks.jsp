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

<%--start--%>
<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;"><i class="fa fa-info-circle"></i> Vendor Trucking Profile</h3>

            </div>

            <div class="panel-body">

                <s:hidden value="%{vendor.vendorId}"></s:hidden>
                <div class="row">

                    <div class=" col-lg-6 col-lg-offset-3">

                        <div class="panel panel-info ">

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

                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>
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
                    <s:form cssClass="form-horizontal customerForm" action="addTrucks" method="post" theme="bootstrap">


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
                    <%--<button type="button" name="submit" value="Save" disabled="true" class="btn btn-primary vendorAddTruckBtn">Save</button>--%>
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

    $(document).ready(function(){
        $(".customerForm").on("submit", function(e) {
            var year = new Date().getFullYear()+1;
            if($('#truck_grossWeight').val() == 0){
                alert('Warning : Gross Weight cannot be 0');
                e.preventDefault();
            }else if($('#truck_netWeight').val() == 0){
                alert('Warning : Net Weight cannot be 0');
                e.preventDefault();
            }else if($('#truck_netCapacity').val() == 0){
                alert('Warning : Net Capactiy cannot be 0');
                e.preventDefault();
            }else if($('#truck_modelYear').val() > year){
                alert('Warning : Year model cannot exceed current production year ('+year+')');
                e.preventDefault();
            }
        });

//        $('.vendorAddTruckBtn').click(function(){
//            if($('#truck_grossWeight').val() == 0){
//                alert('Warning : Gross Weight cannot be 0');
//            }else if($('#truck_netWeight').val() == 0){
//                alert('Warning : Net Weight cannot be 0');
//            }else if($('#truck_netCapacity').val() == 0){
//                alert('Warning : Net Capactiy cannot be 0');
//            }else if($('#truck_modelYear').val() > (new Date().getFullYear())+1){
//                alert('Warning : Year model cannot exceed current production year.');
//            }else{
//                $('.customerForm').submit();
//            }
//        });

        validationForm('vendorAddTruckInput', 'vendorAddTruckBtn');
        $("#truck_motorVehicleNumber").mask("9999-99999999999");
        $("#truck_plateNumber").mask("AAA-9999");
        $("#truck_modelYear").mask("9999");
        $("#truck_grossWeight").mask("999999999");
        $("#truck_netWeight").mask("999999999");
        $("#truck_netCapacity").mask("999999999");

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