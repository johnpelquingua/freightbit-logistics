<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<sj:head compressed='true' jquerytheme="ui-darkness"/>


<div class="col-md-10 col-md-offset-2">

    <h1 class="booking page-header">
    New Booking
    </h1>

    <s:form cssClass="form-horizontal" action="Booking-Validate" method="POST" theme="bootstrap">

    <div class="row">
        <div class="col-md-12">
            <div class="panel booking panel-info">
                <div class="booking panel-heading" style="margin-bottom: 20px! important;">
                    <img src="includes/images/booking.png" class="box-icon">
                    <span class="booking panel-title">Booking Details</span>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <div class="panel panel-primary">
                              <div class="panel-heading">
                                <h3 class="panel-title">Order Details</h3>
                              </div>

                              <form class="form-horizontal">

                                    <div class="col-md-6">
                                        <br/>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label tb-font-black">Booking Date :</label>
                                            <div class="col-sm-6">

                                                <input class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Order Number :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" />
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black">Date of Booking :</label>
                                            <div class="col-md-6">
                                                <sj:datepicker id="datepicker1"

                                              <sj:datepicker id="datepicker1"

                                                 displayFormat="mm-dd-yy"
                                                 imageUrl="includes/images/datepicker.gif"
                                                 imageTooltip="Select Your Birthdate"
                                                 showButton="true"
                                                 changeYear="true"
                                                 changeMonth="true"
                                                 style="width: 88% !important;"
                                               />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Service Requirement :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Full Cargo Load</option>
                                                    <option>Less Cargo Load</option>
                                                    <option>Rolling Cargo</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black">Notification :</label>
                                            <div class="col-md-6">
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
                                        </div>
                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Classification :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Premium A</option>
                                                    <option>Premium B</option>
                                                    <option>Economy</option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <br />
                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Booking Number :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Service Mode :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Door to Door</option>
                                                    <option>Door to Pier</option>
                                                    <option>Pier to Door</option>
                                                    <option>Pier to Pier</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Status :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Pending</option>
                                                    <option>Approved</option>
                                                    <option>Deny</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Payment Mode :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Freight Prepaid</option>
                                                    <option>Freight Collect</option>
                                                    <option>Account Origin</option>
                                                    <option>Account Destination</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Processed By :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" />
                                            </div>
                                        </div>

                                    </div>

                              </form>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-6 ">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                            <h3 class="panel-title">Shipper Details</h3>
                          </div>

                            <form class="form-horizontal">
                                <br />

                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Customer :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Contact Person :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Contact Number :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                    <div class="col-md-6">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                            <h3 class="panel-title">Consignee Details</h3>
                          </div>

                            <form class="form-horizontal">
                                <br />

                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Consignee :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Contact Person :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Contact Number :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-12">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                            <h3 class="panel-title">Cargo Details</h3>
                          </div>

                            <form class="form-horizontal">

                                <div class="col-md-6">

                                    <br />

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label tb-font-black">Quantity :</label>
                                        <div class="col-sm-6">
                                          <select class="form-control">
                                              <option>1</option>
                                              <option>2</option>
                                              <option>3</option>
                                              <option>4</option>
                                              <option>5</option>
                                          </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label tb-font-black">Estimated Weight :</label>
                                        <div class="col-sm-6">
                                            <div class="input-group">
                                              <input type="text" class="form-control">
                                              <span class="input-group-addon">cm&#179;</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label tb-font-black">Commodity Description :</label>
                                        <div class="col-sm-6">
                                            <input type="email" class="form-control">
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-6">

                                    <br />

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label tb-font-black">Size :</label>
                                        <div class="col-sm-6">
                                          <input type="email" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label tb-font-black">Declared Value :</label>
                                        <div class="col-sm-6">
                                            <div class="input-group">
                                              <span class="input-group-addon"> 	&#8369; </span>
                                              <input type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label tb-font-black">Comments :</label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" rows="3" style="resize:none;"></textarea>
                                        </div>
                                    </div>

                                </div>

                            </form>

                            <div class="panel-footer">
                                <button type="button" class="btn btn-info">
                                      Add New Item
                                </button>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-12">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                            <h3 class="panel-title">Cargo Listing</h3>
                          </div>

                            <form class="form-horizontal">
                                <br />
                                  <div class="table-responsive">
                                    <table class="table table-striped text-center">
                                      <thead>
                                        <tr class="header_center">
                                          <th class="tb-font-black">Quantity</th>
                                          <th class="tb-font-black">Size</th>
                                          <th class="tb-font-black">Weight</th>
                                          <th class="tb-font-black">Value</th>
                                          <th class="tb-font-black">Description</th>
                                          <th class="tb-font-black">Comments</th>
                                          <th class="tb-font-black">Action</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td class="tb-font-black"></td>
                                          <td class="tb-font-black"></td>
                                          <td class="tb-font-black"></td>
                                          <td class="tb-font-black"></td>
                                          <td class="tb-font-black"></td>
                                          <td class="tb-font-black"></td>
                                          <td><img src="includes/images/delete.png" /></td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                            </form>

                            <div class="panel-footer">

                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12" id="cargo_listing">
                        <div class="panel panel-primary">
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

                                      </tbody>
                                    </table>
                                    </div>
                            <div class="panel-footer">
                                <button type="button" class="btn btn-info">
                                      Add New Stop
                                </button>
                                <span class="col-md-offset-6">
                                    <b>Charge Rate :</b>
                                </span>
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

    </s:form>

</div>




