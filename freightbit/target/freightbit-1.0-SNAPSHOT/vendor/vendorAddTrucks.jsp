<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Trucks</h1>
		
		<!-- EDIT HERE -->
			<div class="main-box">
				<div class="panel panel-info">

					<div class="panel-heading">
						<img src="includes/images/truck.png" class="box-icon">
						<span class="panel-title">Truck Information</span>
					</div>

					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="truckValidation" theme="bootstrap">


							  	<div class="form-group">

								    <label class="col-sm-2 control-label" for="truck.truckType">Type:</label>

								    <div class="col-sm-10">
                                        <s:select list="truckTypeList" name="truck.truckType" listKey="key" listValue="value" cssClass="form-control"/>

								    </div>
							    </div>

							    <div class="form-group">

							    	<label for="truck.truckPlateNumber" class="col-sm-2 control-label">Plate:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Plate Number" name="truck.truckPlateNumber" id="truck.truckPlateNumber" />
								    </div>

							  	</div>

							  	<div class="form-group">

							    	<label for="truck.truckModelNumber" class="col-sm-2 control-label">Model:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Model Number" name="truck.truckModelNumber" id="truck.truckModelNumber" />
								    </div>

							  	</div>

							  	<div class="form-group">

							    	<label for="truck.truckModelYear" class="col-sm-2 control-label">Year Model:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Year Model" name="truck.truckModelYear" id="truck.truckModelYear"/>
								    </div>

							  	</div>

							  	<div class="form-group">

							    	<label for="truck.truckEngineNumber" class="col-sm-2 control-label">Engine:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Engine Number" name="truck.truckEngineNumber" id="truck.truckEngineNumber" />
								    </div>

							  	</div>

                            <div class="form-group">

                                <label for="truck.truckCode" class="col-sm-2 control-label">Code:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Truck Code" name="truck.truckCode" id="truck.truckCode" />
                                </div>

                            </div>

                            <div class="form-group">

                                <label for="truck.truckGrossWeight" class="col-sm-2 control-label">Weight:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Gross Weight" name="truck.truckGrossWeight" id="truck.truckGrossWeight" />
                                </div>

                            </div>

                        </div>
					</div>

					<div class="panel-footer">
						<button class="btn btn-default pull-left">Add</button>

						<div class="btn-group pull-right">
							<button class="btn btn-default" onclick="this.form.action='vendor-addvendor'">Back</button>
							<button class="btn btn-default">Next</button>
						</div>
					</div>
                    </s:form>
				</div>
				
			</div>

			<div class="sidebar-box">
			  <div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/calendar.png" class="box-icon">
						<span class="panel-title">Process</span>
					</div>
					
				  <div class="panel-body">
					
						<ul class="nav">		  
							<li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
							<li><a href="vendor-trucks" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Trucks Information</a></li>
							<li><a href="vendor-driver" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Driver Information</a></li>
							<li><a href="vendor-contact-person" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Contact Person</a></li>
							<li><a href="vendor-other-information" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Other Information</a></li>
							<li><a href="vendor-address" class="side-help"><img src="includes/images/6.png" class="img-sidehelp">Address</a></li>
						</ul>
					
				  </div>
			  </div>
		    </div>

			<div class="row col-md-12">
				  <div class="panel panel-info">

					  <div class="panel-heading">
					  	<img src="includes/images/listofusers.png" class="box-icon"/>
						<span class="panel-title">List of Trucks</span>
						
					  </div>

					  <div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"><input type="checkbox" /></th>
								  <th class="tb-font-black">Type</th>
								  <th class="tb-font-black">Plate</th>
								  <th class="tb-font-black">Model</th>
								  <th class="tb-font-black">Year</th>
								  <th class="tb-font-black">Engine</th>
								  <th class="tb-font-black">Action</th>
								</tr>
							  </thead>
							  <tbody>

                              <s:iterator value="trucks" var="truck">
								<tr>
								  <td class="tb-font-black"><s:checkbox name="a" theme="simple" /></td>
								  <td class="tb-font-black"><s:property value="truckType" /></td>
								  <td class="tb-font-black"><s:property value="truckPlateNumber" /></td></td>
								  <td class="tb-font-black"><s:property value="truckModelNumber" /></td></td>
								  <td class="tb-font-black"><s:property value="truckModelYear" /></td></td>
								  <td class="tb-font-black"><s:property value="truckEngineNumber" /></td></td>
								  <td class="tb-font-black">
									<a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
									<a href="#myModal" data-toggle="modal" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
								  </td>
								</tr>

                              </s:iterator>
							  </tbody>
							</table>
						  </div>
					  </div>

					  <div class="panel-footer">

							<ul class="pagination">
							  <li class="disabled"><a href="#">&laquo;</a></li>
							  <li class="active"><a href="#">1</a></li>
							  <li class="disabled"><a href="#">&raquo;</a></li>
							</ul>

					  </div>

				  </div>
			    </div>

		<!-- SIDBAR GOES HERE -->
			</div>
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
		      </div>
		      <div class="modal-body">
		        <div style="text-align:center;">
					<span>Do you really want to delete <em>'Closed Van, ABC-123, Isuzu Elf Dropside, 1991, 4HF1'</em> ? This action is irreversible.</span>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>

		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
		      </div>
		      <div class="modal-body">
		        <div style="text-align:center;">
					<span>Do you really want to delete <em>'Closed Van, ZXC-321, Isuzu GHL, 2013, M03737'</em> ? This action is irreversible.</span>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
