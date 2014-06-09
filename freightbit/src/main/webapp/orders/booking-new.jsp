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
                                <h3 class="panel-title">Order Information</h3>
                              </div>

                              <form class="form-horizontal">

                                    <div class="col-md-6">
                                        <br/>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label tb-font-black">Customer :</label>
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
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Freight Type :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Type A</option>
                                                    <option>Type B</option>
                                                    <option>Type C</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Mode of Service :</label>
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
                                            <label class="col-md-4 control-label tb-font-black">Mode of Payment :</label>
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
                                            <label class="col-md-4 control-label tb-font-black">Port of Origin :</label>
                                             <div class="col-md-6">
                                                  <select class="form-control">
                                                      <option>Manila</option>
                                                      <option>Navotas</option>
                                                      <option>Batangas</option>
                                                  </select>
                                             </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Comments :</label>
                                             <div class="col-md-6">
                                                  <textarea class="form-control" rows="3"></textarea>
                                             </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <br />
                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Notify By :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Phone</option>
                                                    <option>Mobile</option>
                                                    <option>SMS</option>
                                                    <option>Fax</option>
                                                    <option>Email</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Reference Number :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Original Ref. Number :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black">Container Number :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Seal Number :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Status :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Pending</option>
                                                    <option>Approve</option>
                                                    <option>Deny</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Port of Destination :</label>
                                            <div class="col-md-6">
                                                <select class="form-control">
                                                    <option>Cebu</option>
                                                    <option>Iloilo</option>
                                                    <option>Palawan</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="payMode" class="col-md-4 control-label tb-font-black" >Booked By :</label>
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
                            <h3 class="panel-title">Shipper Information</h3>
                          </div>

                            <form class="form-horizontal">
                                <br />

                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Name :</label>
                                    <div class="col-sm-6">
                                        <select class="form-control">

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Address :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Contact :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Phone :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Mobile :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Email :</label>
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
                            <h3 class="panel-title">Consignee Information</h3>
                          </div>

                            <form class="form-horizontal">
                                <br />

                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Name :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Address :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Contact :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Phone :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Mobile :</label>
                                    <div class="col-sm-6">
                                      <select class="form-control">

                                      </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label tb-font-black">Email :</label>
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
						<h3 class="panel-title">Order Items</h3>
					  </div>
					    <table class="table table-striped table-striped table-bordered">
						  <thead>
							<tr>
							  <th>Quantity</th>
							  <th>Classification</th>
							  <th>Declared Value</th>
							  <th>Height</th>
							  <th>Width</th>
							  <th>Lenght</th>
							  <th>Weight</th>

							</tr>
						  </thead>
						  <tbody>

							<tr>
							  <td>
								<select class="span1" style="height: 23px">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							  </td>
							  <td>
								<select class="span1" style="height: 23px">
									<option>Premium A</option>
									<option>Premium B</option>
									<option>Economy</option>
								</select>
							  </td>
							  <td>
								  <div class="span1">
									  <input type="text" placeholder=&#8369>
								  </div>
							  </td>
							  <td>
								 <div class="span1">
									<input type="text" placeholder="cm.">
								 </div>
							  </td>
							  <td>
								 <div class="span1">
									<input type="text" placeholder="cm.">
								 </div>
							  </td>
							  <td>
								<div class="span1">
									<input type="text"placeholder="cm.">
								</div>
							  </td>
							  <td>
								<div class="span1">
									<input type="text" placeholder="kg.">
								</div>
							  </td>
							</tr>

							<tr>
                              <td>
                                <select class="span1" style="height: 23px">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                              </td>
                              <td>
                                <select class="span1" style="height: 23px">
                                    <option>Premium A</option>
                                    <option>Premium B</option>
                                    <option>Economy</option>
                                </select>
                              </td>
                              <td>
                                 <div class="span1">
                                    <input type="text" placeholder="cm.">
                                 </div>
                              </td>
                              <td>
                                 <div class="span1">
                                    <input type="text" placeholder="cm.">
                                 </div>
                              </td>
                              <td>
                                <div class="span1">
                                    <input type="text"placeholder="cm.">
                                </div>
                              </td>
                              <td>
                                <div class="span1">
                                    <input type="text" placeholder="kg.">
                                </div>
                              </td>
                              <td>
                                    <div class="span1">
                                        <input type="text" placeholder=&#8369>
                                    </div>
                                </td>
                            </tr>

							<tr>
                              <td>
                            	<select class="span1" style="height: 23px">
                            		<option>1</option>
                            		<option>2</option>
                            		<option>3</option>
                            		<option>4</option>
                            		<option>5</option>
                            	</select>
                              </td>
                              <td>
                            	<select class="span1" style="height: 23px">
                            		<option>Premium A</option>
                            		<option>Premium B</option>
                            		<option>Economy</option>
                            	</select>
                              </td>
                              <td>
                            	  <div class="span1">
                            		  <input type="text" placeholder=&#8369>
                            	  </div>
                              </td>
                              <td>
                            	 <div class="span1">
                            		<input type="text" placeholder="cm.">
                            	 </div>
                              </td>
                              <td>
                            	 <div class="span1">
                            		<input type="text" placeholder="cm.">
                            	 </div>
                              </td>
                              <td>
                            	<div class="span1">
                            		<input type="text"placeholder="cm.">
                            	</div>
                              </td>
                              <td>
                            	<div class="span1">
                            		<input type="text" placeholder="kg.">
                            	</div>
                              </td>
                            </tr>

                            <tr>
                              <td>
                            	<select class="span1" style="height: 23px">
                            		<option>1</option>
                            		<option>2</option>
                            		<option>3</option>
                            		<option>4</option>
                            		<option>5</option>
                            	</select>
                              </td>
                              <td>
                            	<select class="span1" style="height: 23px">
                            		<option>Premium A</option>
                            		<option>Premium B</option>
                            		<option>Economy</option>
                            	</select>
                              </td>
                              <td>
                            	  <div class="span1">
                            		  <input type="text" placeholder=&#8369>
                            	  </div>
                              </td>
                              <td>
                            	 <div class="span1">
                            		<input type="text" placeholder="cm.">
                            	 </div>
                              </td>
                              <td>
                            	 <div class="span1">
                            		<input type="text" placeholder="cm.">
                            	 </div>
                              </td>
                              <td>
                            	<div class="span1">
                            		<input type="text"placeholder="cm.">
                            	</div>
                              </td>
                              <td>
                            	<div class="span1">
                            		<input type="text" placeholder="kg.">
                            	</div>
                              </td>
                            </tr>

                            <tr>
                              <td>
                            	<select class="span1" style="height: 23px">
                            		<option>1</option>
                            		<option>2</option>
                            		<option>3</option>
                            		<option>4</option>
                            		<option>5</option>
                            	</select>
                              </td>
                              <td>
                            	<select class="span1" style="height: 23px">
                            		<option>Premium A</option>
                            		<option>Premium B</option>
                            		<option>Economy</option>
                            	</select>
                              </td>
                              <td>
                            	  <div class="span1">
                            		  <input type="text" placeholder=&#8369>
                            	  </div>
                              </td>
                              <td>
                            	 <div class="span1">
                            		<input type="text" placeholder="cm.">
                            	 </div>
                              </td>
                              <td>
                            	 <div class="span1">
                            		<input type="text" placeholder="cm.">
                            	 </div>
                              </td>
                              <td>
                            	<div class="span1">
                            		<input type="text"placeholder="cm.">
                            	</div>
                              </td>
                              <td>
                            	<div class="span1">
                            		<input type="text" placeholder="kg.">
                            	</div>
                              </td>
                            </tr>

						  </tbody>
					    </table>
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



