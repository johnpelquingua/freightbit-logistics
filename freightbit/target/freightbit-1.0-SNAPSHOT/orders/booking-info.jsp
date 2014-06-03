<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
        
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Booking Info</h1>
		
		<!-- MAIN BOX -->
		
			<div class="row">
				
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-info" >
						<div class="panel-heading">
							<img src="includes/images/booking.png" class="box-icon">
							<span class="panel-title">Booking Details</span>
						</div>
						<div class="panel-body">
							<s:form action="Booking-Info" theme="bootstrap" cssClass="form-horizontal" >
								<br />	
								<div class="form-group">
									<label for="serviceReqt" class="col-sm-5 control-label tb-font-black">Service Requirement:</label>
									<div class="col-sm-5">
									  <s:textfield cssClass="form-control" id="serviceReqt" name="serviceReqt" placeholder="Service Requirement" ></s:textfield>
									</div>
								</div>							
								<div class="form-group">
									<label for="serviceMode" class="col-sm-5 control-label tb-font-black">Service Mode:</label>
									<div class="col-sm-5">
									  <s:textfield cssClass="form-control" id="serviceMode" name="serviceMode" placeholder="Service Mode" ></s:textfield>
									</div>
								</div>						
								<div class="form-group">
									<label for="bookingDate" class="col-sm-5 control-label tb-font-black">Booking Date:</label>
									<div class="col-sm-5">
									  <s:textfield cssClass="form-control" id="bookingDate" name="bookingDate" placeholder="Booking Date" ></s:textfield>
									</div>
								</div>
								<div class="form-group">
									<label for="bookingNumber" class="col-sm-5 control-label tb-font-black">Booking Number:</label>
									<div class="col-sm-5">
									  <s:textfield cssClass="form-control" id="bookingNumber" name="bookingNumber" placeholder="Booking Number" ></s:textfield>
									</div>
								</div>								
							</form>
						</div>
					</div>
				</div>	
				
			</div>
		
			<div class="row">
			  <div class="col-md-6">
				<div class="panel panel-info" >
					<div class="panel-heading">
						<img src="includes/images/account.png" class="box-icon">
						<span class="panel-title">Shipper Information</span>
					</div>
					<div class="panel-body">
						<div style="float:left; width:40%;">
							<img src="includes/images/default-image.png" style="width:150px;margin:6px;">
						</div>
						<div style="float:left; width:60%;">
							<h2><s:property value="bookings[0].bookingCompany"></s:property></h2>
							<span><b>Email Address :</b> <s:property value="bookings[0].status"></s:property></span>
							<br>
							<span><b>Contact Number :</b> <s:property value="bookings[0].bookingNumber"></s:property></span>
						</div>
					</div>
				</div>
			  </div>
			  <div class="col-md-6">
				<div class="panel panel-info" >
					<div class="panel-heading">
						<img src="includes/images/account.png" class="box-icon">
						<span class="panel-title">Consignee Information</span>
					</div>
					<div class="panel-body">
						<div style="float:left; width:40%;">
							<img src="includes/images/default-image.png" style="width:150px;margin:6px;">
						</div>
						<div style="float:left; width:60%;">
							<h2><s:property value="bookings[1].bookingCompany"></s:property></h2>
							<span><b>Email Address :</b> <s:property value="bookings[1].status"></s:property></span>
							<br>
							<span><b>Contact Number :</b> <s:property value="bookings[1].bookingNumber"></s:property></span>
						</div>
					</div>
				</div>
			  </div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-info" >
						<div class="panel-heading">
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="panel-title">Shipper Details</span>
						</div>
						<div class="panel-body">
							<form class="form-horizontal">
								<br />	
								<div class="form-group">
									<label for="bAddress" class="col-sm-4 control-label tb-font-black">Address:</label>
									<div class="col-sm-6">
									  <s:textfield cssClass="form-control" id="bAddress" name="bAddress" placeholder="Address" ></s:textfield>
									</div>
								</div>							
								<div class="form-group">
									<label for="contactPerson" class="col-sm-4 control-label tb-font-black">Contact Person:</label>
									<div class="col-sm-6">
									  <s:textfield cssClass="form-control" id="contactPerson" name="contactPerson" placeholder="Contact Person" ></s:textfield>
									</div>
								</div>						
								<div class="form-group">
									<label for="originPort" class="col-sm-4 control-label tb-font-black">Port of Origin:</label>
									<div class="col-sm-6">
									  <s:textfield cssClass="form-control" id="originPort" name="originPort" placeholder="Port of Origin" ></s:textfield>
									</div>
								</div>
								<div class="form-group">
									<label for="pickupAddress" class="col-sm-4 control-label tb-font-black">Pick-up Address:</label>
									<div class="col-sm-6">
									  <s:textfield cssClass="form-control" id="pickupAddress" name="pickupAddress" placeholder="Pick-up Address" ></s:textfield>
									</div>
								</div>
								<div class="form-group">
									<label for="pickupDate" class="col-sm-4 control-label tb-font-black">Pick-up Date:</label>
									<div class="col-sm-6">
										<s:textfield cssClass="form-control" id="pickupDate" name="pickupDate" placeholder="Pick-up Date" ></s:textfield>
									</div>
								</div>
							</form>
						</div>
					</div>
			    </div>
			    <div class="col-md-6">
					<div class="panel panel-info" >
						<div class="panel-heading">
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="panel-title">Consignee Details</span>
						</div>
						<div class="panel-body">
								<form class="form-horizontal">
									<br />	
									<div class="form-group">
										<label for="bAddress" class="col-sm-4 control-label tb-font-black">Address:</label>
										<div class="col-sm-6">
										  <s:textfield cssClass="form-control" id="bAddress" name="bAddress" placeholder="Address" ></s:textfield>
										</div>
									</div>							
									<div class="form-group">
										<label for="contactPerson" class="col-sm-4 control-label tb-font-black">Contact Person:</label>
										<div class="col-sm-6">
										  <s:textfield cssClass="form-control" id="contactPerson" name="contactPerson" placeholder="Contact Person" ></s:textfield>
										</div>
									</div>						
									<div class="form-group">
										<label for="destinationPort" class="col-sm-4 control-label tb-font-black">Port of Destination:</label>
										<div class="col-sm-6">
										  <s:textfield cssClass="form-control" id="destinationPort" name="destinationPort" placeholder="Port of Destination" ></s:textfield>
										</div>
									</div>
									<div class="form-group">
										<label for="deliveryAddress" class="col-sm-4 control-label tb-font-black">Delivery Address:</label>
										<div class="col-sm-6">
										  <s:textfield cssClass="form-control" id="deliveryAddress" name="deliveryAddress" placeholder="Delivery Address" ></s:textfield>
										</div>
									</div>
									<div class="form-group">
										<label for="deliveryDate" class="col-sm-4 control-label tb-font-black">Delivery Date:</label>
										<div class="col-sm-6">
											<s:textfield cssClass="form-control" id="deliveryDate" name="deliveryDate" placeholder="Delivery Date" ></s:textfield>
										</div>
									</div>
								</form>
						</div>
					</div>
			    </div>
			
			</div>
			
			<div class="row">
					
				<div class="col-md-12">
				  <div class="panel panel-info">
					  <div class="panel-heading">
						<img src="includes/images/listofusers.png" class="box-icon">
						<span class="panel-title">Cargo Listing</span>
					  </div>
		  
						<form class="form-horizontal">
							<br />									
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
									  <th class="tb-font-black">Rates</th>											  											  
									</tr>
								  </thead>
								  <tbody>
								  <s:iterator value="bookings" var="booking">
									<tr>
									  <td class="tb-font-black"><s:property value="#booking.bookingDate"/></td>
									  <td class="tb-font-black"><s:property value="bookingid"/></td>
									  <td class="tb-font-black"><s:property value="#booking.bookingCompany"/></td>
									  <td class="tb-font-black"><s:property value="#booking.origin"/></td>
									  <td class="tb-font-black"><s:property value="#booking.destination"/></td>
									  <td class="tb-font-black"><s:property value="#booking.status"/></td>
									  <td class="tb-font-black"><s:property value="#booking.bookingNumber"/></td>
									</tr>
                                  </s:iterator>
								  </tbody>								  
								</table>								
							  </div>							  

						<div class="panel-footer">							

							<span class="pull-right">								
								<button type="button" class="btn btn-info new-booking" href="Booking-List">
									  Booking List
								</button>	
								<button type="button" class="btn btn-info new-booking" href="#">
									  Edit Booking
								</button>								
							</span>
						</div>
                        </s:form>
					</div>
				</div>						
			</div>
		
		<!-- END OF MAIN BOX -->
		
	
		
		<!-- END OF THE MIDDLE -->
		
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="edit-booking" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			
			<h4 class="modal-title" id="myModalLabel"><span><img src="includes/images/edit-booking-b.png" />&nbsp;</span>Edit Booking</h4>
		  </div>
		  <div class="modal-body">
			
			        <div class="row">
					
						<div class="col-md-8 col-md-offset-2">
							<div class="panel panel-info">
							  <div class="panel-heading">
								<h3 class="panel-title">Service Details</h3>
							  </div>
								
								  <form class="form-horizontal">
										<br />										
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Service Requirement :</label>
											<div class="col-sm-6">
												<div class="btn-group">
													<button type="button" class="btn btn-default fcl">FCL</button>
													<button type="button" class="btn btn-default lcl">LCL</button>
													<button type="button" class="btn btn-default rcu">RCU</button>
													<button type="button" class="btn btn-default lcu">LCU</button>
												</div>
											</div>
										</div>								
										<div id="service-mode" class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Service Mode :</label>
											<div class="col-sm-6">
											    <div class="btn-group">
													<button type="button" class="btn btn-default d-d">D/D</button>
													<button type="button" class="btn btn-default d-p">D/P</button>
													<button type="button" class="btn btn-default p-d">P/D</button>
													<button type="button" class="btn btn-default p-p">P/P</button>
												</div>
											</div>
										</div>										
									</form>								
							</div>
						</div>
						
					</div>
					
<!----------------------------------------- DOOR TO DOOR BEGIN ------------------------------------------->					
					<div id="door-to-door">
					
						<div class="row">
						
							<div class="col-md-6">
							  <div class="panel panel-info">
								  <div class="panel-heading">
									<h3 class="panel-title">Shipper Details</h3>
								  </div>
					  
									<form class="form-horizontal">
										<br />
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Booking Number:</label>
											<div class="col-sm-6">
											  <input type="email" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Shipper:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																							  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Contact Person:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																																		  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Contact Number:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																																		  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Address:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																							  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Pick-up Address:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																							  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Pick-up Date:</label>
											<div class="col-sm-6">
												<div class='input-group date' id='datetimepicker1'>
													<input type='text' class="form-control" />
													<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>										    											
											</div>
										</div>
									</form>
									
								</div>
							</div>
							
							<div class="col-md-6">
							  <div class="panel panel-info">
								  <div class="panel-heading">
									<h3 class="panel-title">Consignee Details</h3>
								  </div>
					  
									<form class="form-horizontal">
										<br />
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Booking Date:</label>
											<div class="col-sm-6">
												<div class='input-group date' id='datetimepicker1'>
													<input type='text' class="form-control"/>
													<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>	
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Consignee:</label>
											<div class="col-sm-6">
											  <select class="form-control">
												  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Contact Person:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																																		  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Contact Number:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																																	  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Address:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																						  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Delivery Address:</label>
											<div class="col-sm-6">
											  <select class="form-control">
																							  
											  </select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-5 control-label tb-font-black">Delivery Date:</label>
											<div class="col-sm-6">
												<div class='input-group date' id='datetimepicker1'>
													<input type='text' class="form-control"/>
													<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>										    											
											</div>
										</div>
									</form>
									
								</div>
							</div>
							
						</div>	

				    </div>
<!----------------------------------------- DOOR TO DOOR END ------------------------------------------->	

<!----------------------------------------- CARGO BEGIN ------------------------------------------->	
				<div id="cargo">	
					
					<div class="row">
					
						<div class="col-md-12">
						  <div class="panel panel-info">
							  <div class="panel-heading">
								<h3 class="panel-title">Cargo Details</h3>
							  </div>
				  
								<form class="form-horizontal">
									<br />
									
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Mode of Payment:</label>
										<div class="col-sm-6">
										  <select class="form-control">
											  <option>Freight Prepaid</option>
											  <option>Freight Collect</option>	
											  <option>Account Destination</option>
											  <option>Account Origin</option>
										  </select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Container Quantity:</label>
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
										<label class="col-sm-4 control-label tb-font-black">Container Size:</label>
										<div class="col-sm-6">
										  <select class="form-control">
											  <option>10 Footer</option>
											  <option>20 Footer</option>		
											  <option>40 Footer</option>	
										  </select>
										</div>
								    </div>
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Cargo Classification:</label>
										<div class="col-sm-6">										  
										  <input type="email" class="form-control">										
										</div>
								    </div>
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Estimated Weight:</label>
										<div class="col-sm-6">
										    <div class="input-group">
											  <input type="text" class="form-control">
											  <span class="input-group-addon">Kg.</span>
											</div>
										</div>
								    </div>
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Declared Value:</label>
										<div class="col-sm-6">
											<div class="input-group">
											  <span class="input-group-addon"> 	&#8369; </span>
											  <input type="text" class="form-control">
											</div>								    											
										</div>
								    </div>
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Commodity Description:</label>
										<div class="col-sm-6">
											<input type="email" class="form-control">							    											
										</div>										
								    </div>
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Remarks:</label>
										<div class="col-sm-6">
											<input type="email" class="form-control">							    											
										</div>										
								    </div>
									<div class="form-group">
										<label class="col-sm-4 control-label tb-font-black">Charge Rate:</label>
										<div class="col-sm-6">
											<div class="input-group">
											  <span class="input-group-addon"> 	&#8369; </span>
											  <input type="text" class="form-control">
											</div>								    											
										</div>
								    </div>
									<div class="form-group">
										<div class="col-sm-2 col-sm-offset-8">
										<button type="button" class="btn btn-primary">Add Cargo</button>	
										</div>
								    </div>
									
								</form>
								
							</div>
						</div>						
						
					</div>
					
					<div class="row">
					
						<div class="col-md-12">
						  <div class="panel panel-info">
							  <div class="panel-heading">
								<h3 class="panel-title">Cargo Listing</h3>
							  </div>
				  
								<form class="form-horizontal">
									<br />									
									  <div class="table-responsive">
										<table class="table table-striped text-center">
										  <thead>
											<tr class="header_center">
											  <th class="tb-font-black">QTY</th>
											  <th class="tb-font-black">Size</th>
											  <th class="tb-font-black">Service Mode</th>
											  <th class="tb-font-black">Weight</th>
											  <th class="tb-font-black">Destination</th>
											  <th class="tb-font-black">Rates</th>
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
							</div>
						</div>							
					</div>
	
				</div>
<!----------------------------------------- CARGO END ------------------------------------------->
			
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<button type="button" class="btn btn-primary">Save</button>
		  </div>
		</div>
	  </div>
	</div>
