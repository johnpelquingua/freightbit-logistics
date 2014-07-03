<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

<div class="row alert alert-success alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>Success!</strong> The data has been successfully saved.
</div>

<h1 class="booking page-header">
    Add New Booking
</h1>

<s:form cssClass="form-horizontal" action="Booking-New" method="POST" theme="bootstrap">

<div class="row">
<div class="col-md-12">
<div class="panel booking panel-info">
<div class="booking panel-heading">
    <img src="includes/images/booking.png" class="box-icon">
    <span class="booking panel-title">Booking Details</span>
</div>
<div class="panel-body">

<div class="row">

    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Service Details</h3>
            </div>


            <br/>

            <div class="form-group">
                <label for="servReqt" class="col-sm-5 control-label tb-font-black">Service Requirement :</label>

                <div class="col-sm-6">
                    <s:select list="serviceReqt" name="servReqt" id="servReqt" cssClass="form-control"
                              onchange="EventChanged(this)"/>
                </div>
            </div>
            <div id="service-mode" class="form-group">
                <label for="servMode" class="col-sm-5 control-label tb-font-black">Service Mode :</label>

                <div class="col-sm-6">
                    <s:select list="serviceMode" name="servMode" id="servMode" cssClass="form-control"
                              onchange="EventChanged(this)"/>
                </div>
            </div>


        </div>
    </div>

</div>

<div class="row">

    <div class="col-md-6">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Shipper Details</h3>
            </div>


            <br/>

            <div class="form-group">
                <label for="bookingNumber" class="col-sm-5 control-label tb-font-black">Booking Number:</label>

                <div class="col-sm-6">
                    <s:textfield name="bookingNumber" cssClass="form-control" id="bookingNumber"
                                 placeholder="Booking Number"/>
                </div>
            </div>
            <div class="form-group">
                <label for="shipperName" class="col-sm-5 control-label tb-font-black">Shipper:</label>

                <div class="col-sm-6">
                    <s:textfield name="shipperName" cssClass="form-control" id="shipperName" placeholder="Shipper"/>
                </div>
            </div>
            <div class="form-group">
                <label for="shipperPerson" class="col-sm-5 control-label tb-font-black">Contact Person:</label>

                <div class="col-sm-6">
                    <s:textfield name="shipperPerson" cssClass="form-control" id="shipperPerson"
                                 placeholder="Contact Person"/>
                </div>
            </div>
            <div class="form-group">
                <label for="shipperNumber" class="col-sm-5 control-label tb-font-black">Contact Number:</label>

                <div class="col-sm-6">
                    <s:textfield name="shipperNumber" cssClass="form-control" id="shipperNumber"
                                 placeholder="Contact Number"/>
                </div>
            </div>
            <div class="form-group">
                <label for="shipperAddress" class="col-sm-5 control-label tb-font-black">Address:</label>

                <div class="col-sm-6">
                    <s:textfield name="shipperAddress" cssClass="form-control" id="shipperAddress"
                                 placeholder="Address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="originPort" class="col-sm-5 control-label tb-font-black">Port of Origin:</label>

                <div class="col-sm-6">
                    <s:textfield name="originPort" cssClass="form-control" id="originPort"
                                 placeholder="Port of Origin"/>
                </div>
            </div>
            <div class="form-group">
                <label for="pickupAddress" class="col-sm-5 control-label tb-font-black">Pick-up Address:</label>

                <div class="col-sm-6">
                    <s:textfield name="pickupAddress" cssClass="form-control" id="pickupAddress"
                                 placeholder="Pick-up Address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="pickupDate" class="col-sm-5 control-label tb-font-black">Pick-up Date:</label>

                <div class="col-sm-6">
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control"/>
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <div class="col-md-6">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Consignee Details</h3>
            </div>


            <br/>

            <div class="form-group">
                <label for="bookingDate" class="col-sm-5 control-label tb-font-black">Booking Date:</label>

                <div class="col-sm-6">
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control"/>
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="consigneeName" class="col-sm-5 control-label tb-font-black">Consignee:</label>

                <div class="col-sm-6">
                    <s:textfield name="consigneeName" cssClass="form-control" id="consigneeName"
                                 placeholder="Consignee"/>
                </div>
            </div>
            <div class="form-group">
                <label for="consigneePerson" class="col-sm-5 control-label tb-font-black">Contact Person:</label>

                <div class="col-sm-6">
                    <s:textfield name="consigneePerson" cssClass="form-control" id="consigneePerson"
                                 placeholder="Contact Person"/>
                </div>
            </div>
            <div class="form-group">
                <label for="consigneeNumber" class="col-sm-5 control-label tb-font-black">Contact Number:</label>

                <div class="col-sm-6">
                    <s:textfield name="consigneeNumber" cssClass="form-control" id="consigneeNumber"
                                 placeholder="Contact Number"/>
                </div>
            </div>
            <div class="form-group">
                <label for="consigneeAddress" class="col-sm-5 control-label tb-font-black">Address:</label>

                <div class="col-sm-6">
                    <s:textfield name="consigneeAddress" cssClass="form-control" id="consigneeAddress"
                                 placeholder="Address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="destinationPort" class="col-sm-5 control-label tb-font-black">Port of Destination:</label>

                <div class="col-sm-6">
                    <s:textfield name="destinationPort" cssClass="form-control" id="destinationPort"
                                 placeholder="Destination Port"/>
                </div>
            </div>
            <div class="form-group">
                <label for="deliveryAddress" class="col-sm-5 control-label tb-font-black">Delivery Address:</label>

                <div class="col-sm-6">
                    <s:textfield name="deliveryAddress" cssClass="form-control" id="deliveryAddress"
                                 placeholder="Delivery Address"/>
                </div>
            </div>
            <div class="form-group">
                <label for="deliveryDate" class="col-sm-5 control-label tb-font-black">Delivery Date:</label>

                <div class="col-sm-6">
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control"/>
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                    </div>
                </div>
            </div>


        </div>
    </div>

</div>

<div class="row">

    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Cargo Details</h3>
            </div>


            <br/>

            <div class="form-group">
                <label for="payMode" class="col-sm-4 control-label tb-font-black">Mode of Payment:</label>

                <div class="col-sm-6">
                    <s:select list="paymentMode" name="payMode" id="payMode" cssClass="form-control"
                              onchange="EventChanged(this)"/>
                </div>
            </div>
            <div class="form-group">
                <label for="containQty" class="col-sm-4 control-label tb-font-black">Container Quantity:</label>

                <div class="col-sm-6">
                    <s:select list="containerQty" name="containQty" id="containQty" cssClass="form-control"
                              onchange="EventChanged(this)"/>
                </div>
            </div>
            <div class="form-group">
                <label for="containSize" class="col-sm-4 control-label tb-font-black">Container Size:</label>

                <div class="col-sm-6">
                    <s:select list="containerSize" name="containSize" id="containSize" cssClass="form-control"
                              onchange="EventChanged(this)"/>
                </div>
            </div>
            <div class="form-group">
                <label for="cargoClass" class="col-sm-4 control-label tb-font-black">Cargo Classification:</label>

                <div class="col-sm-6">
                    <s:textfield name="cargoClass" cssClass="form-control" id="cargoClass"
                                 placeholder="Cargo Classification"/>
                </div>
            </div>
            <div class="form-group">
                <label for="estWeight" class="col-sm-4 control-label tb-font-black">Estimated Weight:</label>

                <div class="col-sm-6">
                    <div class="input-group">
                        <s:textfield name="estWeight" cssClass="form-control" id="estWeight"
                                     placeholder="Estimated Weight"/>
                        <span class="input-group-addon">Kg.</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="declaredValue" class="col-sm-4 control-label tb-font-black">Declared Value:</label>

                <div class="col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon"> 	&#8369; </span>
                        <s:textfield name="declaredValue" cssClass="form-control" id="declaredValue"
                                     placeholder="Declared Value"/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="commDescription" class="col-sm-4 control-label tb-font-black">Commodity Description:</label>

                <div class="col-sm-6">
                    <s:textfield name="commDescription" cssClass="form-control" id="commDescription"
                                 placeholder="Commodity Description"/>
                </div>
            </div>
            <div class="form-group">
                <label for="remarks" class="col-sm-4 control-label tb-font-black">Remarks:</label>

                <div class="col-sm-6">
                    <s:textfield name="remarks" cssClass="form-control" id="remarks" placeholder="Remarks"/>
                </div>
            </div>
            <div class="form-group">
                <label for="rate" class="col-sm-4 control-label tb-font-black">Rate:</label>

                <div class="col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon"> 	&#8369; </span>
                        <s:textfield name="rate" cssClass="form-control" id="rate" placeholder="Rate"/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-sm-offset-8">
                    <button type="button" class="btn btn-primary">Add Cargo</button>
                </div>
            </div>


        </div>
    </div>

</div>

<div class="row">

    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Cargo Listing</h3>
            </div>


            <br/>

            <div class="table-responsive">
                <table class="table table-striped text-center">
                    <thead>
                    <tr class="header_center">
                        <th class="tb-font-black">QTY</th>
                        <th class="tb-font-black">Size</th>
                        <th class="tb-font-black">Classification</th>
                        <th class="tb-font-black">Weight</th>
                        <th class="tb-font-black">Value</th>
                        <th class="tb-font-black">Description</th>
                        <th class="tb-font-black">Rate</th>
                        <th class="tb-font-black">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="" var="">
                        <tr>
                            <td class="tb-font-black"><s:property value=""/></td>
                            <td class="tb-font-black"><s:property value=""/></td>
                            <td class="tb-font-black"><s:property value=""/></td>
                            <td class="tb-font-black"><s:property value=""/></td>
                            <td class="tb-font-black"><s:property value=""/></td>
                            <td class="tb-font-black"><s:property value=""/></td>
                            <td class="tb-font-black"><s:property value=""/></td>
                            <td><img src="includes/images/delete.png"/></td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>


            <div class="panel-footer">
                        									<span class="col-md-offset-8">
                        										<b>Charge Rate :</b>
                        									</span>
            </div>

        </div>
    </div>
</div>

</div>

<div class="panel-footer">

                    <span class="pull-right">
                        <button type="button" class="btn new-booking" data-toggle="modal" data-target="#booking-search"
                                onclick="location.href='Booking-Search'">
                            Cancel
                        </button>

                              <s:submit name="submit" value="Save"/>

                    </span>
</div>
</div>
</div>

</div>

</s:form>

</div>


