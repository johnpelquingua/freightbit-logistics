<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<sj:head compressed='true' jquerytheme="ui-darkness"/>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="booking page-header">
    New Booking
    </h1>

    <s:form cssClass="form-horizontal" action="Booking-Validate" method="POST" theme="bootstrap">

    <div class="row">
        <div class="col-md-12">
            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="includes/images/booking.png" class="box-icon">
                    <span class="booking panel-title">Booking Details</span>
                </div>
                <div class="panel-body">

    <div class="panel panel-info" style="padding-top: 15px !important;">

                <div class="row">

                    <div class="form-group" style="margin-bottom: 0px !important;">

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Booking Date :</label>
                        <div class="col-md-2">
                            <sj:datepicker id="datepicker1"
                               displayFormat="mm-dd-yy"
                               imageUrl="includes/images/datepicker.gif"
                               imageTooltip="Select Your Birthdate"
                               showButton="true"
                               changeYear="true"
                               changeMonth="true"
                               style="width: 78% !important;"
                             />
                        </div>

                        <label for="servReqt" class="col-md-2 control-label tb-font-black" style="width: 15% !important;">Service Requirement :</label>
                        <div class="col-md-2">
                            <select class="form-control" style="width: 105% !important;">
                                <option>Full Cargo Load</option>
                                <option>Less Cargo Load</option>
                                <option>Rolling Cargo</option>

                            </select>
                        </div>

                        <div id="service-mode" class="form-group">
                            <label for="servMode" class="col-md-2 control-label tb-font-black">Service Mode :</label>
                            <div class="col-md-2">
                                <select class="form-control">
                                    <option>Door to Door</option>
                                    <option>Door to Pier</option>
                                    <option>Pier to Door</option>
                                    <option>Pier to Pier</option>
                                </select>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="row">

                    <div class="form-group">

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Customer :</label>
                        <div class="col-md-3">
                            <select class="form-control">

                            </select>
                        </div>

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Booking Number :</label>
                        <div class="col-md-4">
                            <input class="form-control" />
                        </div>

                    </div>

                </div>

                <div class="row">

                    <div class="form-group">

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Contact Person :</label>
                        <div class="col-md-3">
                            <select class="form-control">

                            </select>
                        </div>

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Number :</label>
                        <div class="col-md-4">
                            <input class="form-control" />
                        </div>

                    </div>

                </div>

    </div>

    <div class="panel panel-info" style="padding-top: 15px !important;">

                <div class="row">

                    <div class="form-group">

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Consignee :</label>
                        <div class="col-md-3">
                            <select class="form-control">

                            </select>
                        </div>

                    </div>

                </div>

                <div class="row">

                    <div class="form-group">

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Contact Person :</label>
                        <div class="col-md-3">
                            <select class="form-control">

                            </select>
                        </div>

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Notification :</label>
                        <div class="col-md-3">
                            <div class="btn-group btn-group-sm" data-toggle="buttons">
                              <label class="btn btn-primary">
                                  <input type="checkbox"> Phone
                                </label>
                                <label class="btn btn-primary">
                                  <input type="checkbox"> Mobile
                                </label>
                                <label class="btn btn-primary">
                                  <input type="checkbox"> SMS
                                </label>
                                <label class="btn btn-primary">
                                  <input type="checkbox"> E-Mail
                                </label>
                                <label class="btn btn-primary">
                                  <input type="checkbox"> Fax
                                </label>
                            </div>
                        </div>

                        <label for="payMode" class="col-md-1 control-label tb-font-black">Number :</label>
                        <div class="col-md-1">
                            <input class="form-control" />
                        </div>

                    </div>

                </div>

    </div>

    <div class="panel panel-info" style="padding-top: 15px !important;">

                <div class="row">

                    <div class="form-group">

                    <label for="payMode" class="col-md-1 control-label tb-font-black">Class :</label>
                    <div class="col-md-2">
                        <select class="form-control">

                        </select>
                    </div>

                    <label for="payMode" class="col-md-1 control-label tb-font-black">QTY :</label>
                    <div class="col-md-2">
                        <select class="form-control">

                        </select>
                    </div>

                    <label for="payMode" class="col-md-1 control-label tb-font-black">Size :</label>
                    <div class="col-md-2">
                        <select class="form-control">

                        </select>
                    </div>

                    <label for="payMode" class="col-md-1 control-label tb-font-black">Weight :</label>
                    <div class="col-md-2">
                        <div class="input-group">
                        <input type="text" class="form-control">
                        <span class="input-group-addon">cm&#179;</span>
                        </div>
                    </div>

                    </div>

                </div>

                <div class="row">

                    <div class="form-group">

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Payment Mode :</label>
                        <div class="col-md-2">
                            <select class="form-control" style="width: 103% !important;">
                                <option>Freight Prepaid</option>
                                <option>Freight Collect</option>
                                <option>Account Origin</option>
                                <option>Account Destination</option>
                            </select>
                        </div>

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Declared Value :</label>
                        <div class="col-md-2">
                            <div class="input-group">
                            <span class="input-group-addon">&#8369;</span>
                            <input type="text" class="form-control">
                            </div>
                        </div>

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Commodity :</label>
                        <div class="col-md-2">
                            <input class="form-control" />
                        </div>

                    </div>

                </div>

                <div class="row">

                    <div class="form-group">

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Comments :</label>
                        <div class="col-md-2">
                            <textarea class="form-control" style="resize:none; width: 250px; height: 120px;"></textarea>
                        </div>

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Status :</label>
                        <div class="col-md-2">
                            <select class="form-control">
                                <option>Active</option>
                                <option>Inactive</option>
                            </select>
                        </div>

                        <label for="payMode" class="col-md-2 control-label tb-font-black">Processed By :</label>
                        <div class="col-md-2">
                            <input class="form-control" />
                        </div>

                    </div>

                </div>

    </div>

					<div class="row">
						<div class="col-md-12" id="cargo_listing">
							<div class="panel panel-info">
							  <div class="panel-heading">
								<h3 class="panel-title">Order Stops</h3>
							  </div>
									<br />
										<div class="table-responsive">
										<table class="table table-striped text-center">
										  <thead>
											<tr class="header_center">
											  <th class="tb-font-black">Stop Number</th>
											  <th class="tb-font-black">Stop Type</th>
											  <th class="tb-font-black">Stop Name</th>
											  <th class="tb-font-black">Address</th>
											  <th class="tb-font-black">Appointment Date / Time</th>
											  <th class="tb-font-black">Rate</th>
											  <th class="tb-font-black">Action</th>

											</tr>
										  </thead>
										  <tbody>

											<tr>
											  <td class="tb-font-black"><input class="form-control" /></td>
											  <td class="tb-font-black">
											    <select class="form-control">
                                                    <option>Pick-Up</option>
                                                    <option>Deliver</option>
                                                </select>
                                              </td>
											  <td class="tb-font-black"><input class="form-control" /></td>
											  <td class="tb-font-black">
											    <select class="form-control">
                                                    <option>Address 1</option>
                                                    <option>Address 2</option>
                                                </select>
											  </td>
											  <td class="tb-font-black">
											    <sj:datepicker id="datepicker2"
                                                   displayFormat="mm-dd-yy"
                                                   imageUrl="includes/images/datepicker.gif"
                                                   imageTooltip="Select Your Birthdate"
                                                   showButton="true"
                                                   changeYear="true"
                                                   changeMonth="true"
                                                   style="width: 78% !important;"
                                                 />
											  </td>
											  <td class="tb-font-black">
                                                 <input class="form-control" />
											  </td>
											  <td>
											    <img src="includes/images/arrow-up.png" />
                                                <img src="includes/images/arrow-down.png" />
                                                <img src="includes/images/edit-booking.png" />
                                                <img src="includes/images/delete-booking.png" />
											  </td>
											</tr>

											<tr>
                                              <td class="tb-font-black"><input class="form-control" /></td>
                                              <td class="tb-font-black">
                                                <select class="form-control">
                                                    <option>Pick-Up</option>
                                                    <option>Deliver</option>
                                                </select>
                                              </td>
                                              <td class="tb-font-black"><input class="form-control" /></td>
                                              <td class="tb-font-black">
                                                <select class="form-control">
                                                    <option>Address 1</option>
                                                    <option>Address 2</option>
                                                </select>
                                              </td>
                                              <td class="tb-font-black">
                                                <sj:datepicker id="datepicker3"
                                                   displayFormat="mm-dd-yy"
                                                   imageUrl="includes/images/datepicker.gif"
                                                   imageTooltip="Select Your Birthdate"
                                                   showButton="true"
                                                   changeYear="true"
                                                   changeMonth="true"
                                                   style="width: 78% !important;"
                                                 />
                                              </td>
                                              <td class="tb-font-black">
                                                 <input class="form-control" />
                                              </td>
                                              <td>
                                                <img src="includes/images/arrow-up.png" />
                                                <img src="includes/images/arrow-down.png" />
                                                <img src="includes/images/edit-booking.png" />
                                                <img src="includes/images/delete-booking.png" />
                                              </td>
                                            </tr>

                                            <tr>
                                              <td class="tb-font-black"><input class="form-control" /></td>
                                              <td class="tb-font-black">
                                                <select class="form-control">
                                                    <option>Pick-Up</option>
                                                    <option>Deliver</option>
                                                </select>
                                              </td>
                                              <td class="tb-font-black"><input class="form-control" /></td>
                                              <td class="tb-font-black">
                                                <select class="form-control">
                                                    <option>Address 1</option>
                                                    <option>Address 2</option>
                                                </select>
                                              </td>
                                              <td class="tb-font-black">
                                                <sj:datepicker id="datepicker4"
                                                   displayFormat="mm-dd-yy"
                                                   imageUrl="includes/images/datepicker.gif"
                                                   imageTooltip="Select Your Birthdate"
                                                   showButton="true"
                                                   changeYear="true"
                                                   changeMonth="true"
                                                   class="form-control"
                                                   style="width: 78% !important;"
                                                 />
                                              </td>
                                              <td class="tb-font-black">
                                                 <input class="form-control" />
                                              </td>
                                              <td>
                                                <img src="includes/images/arrow-up.png" />
                                                <img src="includes/images/arrow-down.png" />
                                                <img src="includes/images/edit-booking.png" />
                                                <img src="includes/images/delete-booking.png" />
                                              </td>
                                            </tr>

										  </tbody>
										</table>
										</div>
								<div class="panel-footer">
								    <button type="button" class="btn btn-info">
                                          Add New Stop
                                    </button>
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
                        <button type="button" class="btn new-booking" onclick="location.href='bookingList'">
                              Cancel
                        </button>
                        <button type="button" class="btn btn-info" onclick="location.href='bookingList'">
                              Save
                        </button>

                    </span>
                </div>
            </div>
        </div>
    </div>

    </s:form>

</div>

<script>

    $("#cargo_details").show();
    $("#cargo_listing").show();
    $("#item_details").hide();
    $("#item_listing").hide();

    function EventChanged1(one) {

        var text = one.options[one.selectedIndex].text;

        if (text == "Full Cargo Load") {
             $("#cargo_details").show();
             $("#cargo_listing").show();
             $("#item_details").hide();
             $("#item_listing").hide();
        } else {
             $("#cargo_details").hide();
             $("#cargo_listing").hide();
             $("#item_details").show();
             $("#item_listing").show();
        }

    }

    function EventChanged2(one) {

                var text = one.options[one.selectedIndex].text;

                if (text = "Door To Pier") {
                     $("#pickupAddress").hide();
                     $("#datepicker1").hide();
                     $("#deliveryAddress").show();
                     $("#datepicker3").show();

                } else if  (text = "Pier To Door") {
                    $("#pickupAddress").attr("disabled","disabled");
                    $("#datepicker1").attr("disabled","disabled");
                    $("#deliveryAddress").removeAttr("disabled");
                    $("#datepicker3").removeAttr("disabled");
                } else if (text = "Pier To Pier") {
                    $("#pickupAddress").attr("disabled","disabled");
                    $("#datepicker1").attr("disabled","disabled");
                    $("#deliveryAddress").attr("disabled","disabled");
                    $("#datepicker3").attr("disabled","disabled");
                } else {
                    $("#pickupAddress").removeAttr("disabled");
                    $("#datepicker1").removeAttr("disabled");
                    $("#deliveryAddress").removeAttr("disabled");
                    $("#datepicker3").removeAttr("disabled");
                }



        }

</script>


