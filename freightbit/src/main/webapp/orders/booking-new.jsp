<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<sj:head compressed='true' jquerytheme="ui-darkness"/>
<sx:head debug="true" extraLocales="en-us,nl-nl,de-de"/>

<div class="col-md-10 col-md-offset-2">

    <h1 class="booking page-header">
    New Booking
    </h1>
<s:form action="addOrder" theme="bootstrap" method="post">
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


                              <div cssClass="form-horizontal" theme="bootstrap">
                                    <div class="col-md-6">
                                        <br/>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Customer :</label>
                                            <div class="col-sm-6">
                                                <s:select class="form-control" style="margin-bottom: 15px !important;" name="orderBean.customerList" list="customerList" value="orderBean.customerList"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Order Number :</label>
                                            <div class="col-md-6">
                                                <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Date of Booking :</label>
                                            <div class="col-md-6">
                                                <sj:datepicker id="datepicker1"
                                                displayFormat="mm-dd-yy"
                                                imageUrl="includes/images/datepicker.gif"
                                                imageTooltip="Select Your Birthdate"
                                                showButton="true"
                                                changeYear="true"
                                                changeMonth="true"
                                                style="width: 88% !important; margin-bottom: 15px !important; display: initial!important; border: 1px solid #ccc; border-radius: 4px; height: 34px;"
                                                name="orderBean.bookingDate"
                                                value="%{orderBean.bookingDate}"
                                                />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Freight Type :</label>
                                            <div class="col-md-6">
                                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;" name="orderBean.freightType" list="freightTypeList" listKey="key" listValue="value" value="orderBean.freightType" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Pick-Up Date :</label>
                                        	 <div class="col-md-6">
                                             	<sj:datepicker id="datepicker2"
                                             	 displayFormat="mm-dd-yy"
                                             	 imageUrl="includes/images/datepicker.gif"
                                             	 imageTooltip="Select Your Birthdate"
                                             	 showButton="true"
                                             	 changeYear="true"
                                             	 changeMonth="true"
                                             	 style="width: 88% !important; margin-bottom: 15px !important;"
                                             	/>
                                             </div>
                                        </div>
                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Pick-Up Time :</label>
                                        	 <div class="col-md-6">
                                        		  <input class="form-control" style="margin-bottom: 15px !important;"/>
                                        	 </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Port of Origin :</label>
                                             <div class="col-md-6">
                                                  <input class="form-control" style="margin-bottom: 15px !important;"/>
                                             </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Comments :</label>
                                             <div class="col-md-6">
                                                  <textarea class="form-control" rows="6" style="resize:none; margin-bottom: 15px !important;"></textarea>
                                             </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <br />
                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Notification Type :</label>
                                        	<div class="col-md-6">
                                        	<s:select cssClass="form-control" style="margin-bottom: 15px !important;" name="orderBean.notifyBy" list="notifyByList" listKey="key" listValue="value" value="orderBean.notifyBy" />
                                        	</div>
                                        </div>
                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Service Type : </label>
                                        	<div class="col-md-6">
                                        	<s:select cssClass="form-control" style="margin-bottom: 15px !important;" name="orderBean.serviceRequirement" list="serviceRequirementList" listKey="key" listValue="value" value="orderBean.serviceRequirement" />
                                        	</div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Service Mode :</label>
                                            <div class="col-md-6">
                                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" name="orderBean.modeOfService" list="modeOfServiceList" listKey="key" listValue="value" value="orderBean.modeOfService" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Payment Mode :</label>
                                        	<div class="col-md-6">
                                        	<s:select cssClass="form-control" style="margin-bottom: 15px !important;" name="orderBean.modeOfPaymentList" list="modeOfPaymentList" listKey="key" listValue="value" value="orderBean.modeOfPayment" />
                                        	</div>
                                        </div>
                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Delivery Date :</label>
                                        	 <div class="col-md-6">
                                        		<sj:datepicker id="datepicker3"
                                        		 displayFormat="mm-dd-yy"
                                        		 imageUrl="includes/images/datepicker.gif"
                                        		 imageTooltip="Select Your Birthdate"
                                        		 showButton="true"
                                        		 changeYear="true"
                                        		 changeMonth="true"
                                        		 style="width: 88% !important; margin-bottom: 15px !important;"
                                        		/>
                                        	 </div>
                                        </div>
                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Delivery Time :</label>
                                        	 <div class="col-md-6">
                                        		  <input class="form-control" style="margin-bottom: 15px !important;"/>
                                        	 </div>
                                        </div>
                                        <div class="form-group">
                                        	<label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Port of Destination :</label>
                                        	 <div class="col-md-6">
                                        		  <input class="form-control" style="margin-bottom: 15px !important;"/>
                                        	 </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Rate :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" style="margin-bottom: 15px !important;"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Status :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" style="margin-bottom: 15px !important;"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label tb-font-black" style="text-align: right; padding-top: 7px;">Booked By :</label>
                                            <div class="col-md-6">
                                                <input class="form-control" style="margin-bottom: 15px !important;"/>
                                            </div>
                                        </div>
                                    </div>

                              </div>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-6 ">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                            <h3 class="panel-title">Shipper Information</h3>
                          </div>

                            <div class="form-horizontal">
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
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                            <h3 class="panel-title">Consignee Information</h3>
                          </div>

                            <div class="form-horizontal">
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
                            </div>
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
                				  <th>Commodity</th>
                				  <th>Declared Value</th>
                				  <th>Height</th>
                				  <th>Width</th>
                				  <th>Lenght</th>
                				  <th>Weight</th>
                                  <th>Comments</th>

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
                                          <input type="text" placeholder="commodity">
                                      </div>
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
                				  <td>
                                      <div class="span1">
                                          <input type="text" placeholder="comments">
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



