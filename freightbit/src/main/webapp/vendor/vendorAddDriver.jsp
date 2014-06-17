<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header" style=" margin-left: -40px; ">Edit - Drivers</h1>
		
		<!-- EDIT HERE -->
			<div class="main-box" style=" margin-left: -40px; ">
				<div class="panel panel-info">

					<div class="panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="panel-title">Edit - Driver Information</span>
					</div>

					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="editDriver" theme="bootstrap">
                            <s:hidden name="driver.driverId" value="%{driver.driverId}"/>
                            <div class="form-group">

                                <label for="driver.driverCode" class="col-sm-2 control-label">Code:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Driver Code" name="driver.driverCode" id="driver.driverCode"/>
                                </div>

                            </div>

                            <div class="form-group">

                                <label for="driver.licenseNumber" class="col-sm-2 control-label">License:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="License Number" name="driver.licenseNumber" id="driver.licenseNumber" />
                                </div>

                            </div>

                            <div class="form-group">

                                <label for="driver.lastName" class="col-sm-2 control-label">Last Name:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Last Name" name="driver.lastName" id="driver.lastName" />
                                </div>

                            </div>

                            <div class="form-group">

                                <label for="driver.firstName" class="col-sm-2 control-label">First Name:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="First Name" name="driver.firstName" id="driver.firstName" />
                                </div>

                            </div>

                            <div class="form-group">

                                <label for="driver.middleName" class="col-sm-2 control-label">Middle Name:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Middle Name" name="driver.middleName" id="driver.middleName" />
                                </div>

                            </div>

                            <div class="form-group">

                                <label for="driver.title" class="col-sm-2 control-label">Title:</label>

                                <div class="col-sm-10">
                                    <s:textfield cssClass="form-control" placeholder="Title" name="driver.title" id="driver.title" />
                                </div>

                            </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label" for="driver.status">Status:</label>

                                <div class="col-sm-10">
                                  <s:select list="statusList" listKey="key" listValue="value" name="driver.status" cssClass="form-control" />
                                </div>

                            </div>

                        </div>
					</div>

					<div class="panel-footer">
						<button class="btn btn-default pull-left">Add</button>

						<div class="btn-group pull-right">
							<button class="btn btn-default" onclick="this.form.action='vendor-trucks'">Back</button>
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
							<li><a href="vendor-trucks" class="side-help" style="font-size: 15px;"><img src="includes/images/1.png" class="img-sidehelp">List of Trucks</a></li>
							<li><a href="vendor-driver" class="side-help" style="font-size: 15px;"><img src="includes/images/2.png" class="img-sidehelp">List of Drivers</a></li>
							<li><a href="vendor-other-information" class="side-help" style="font-size: 15px;"><img src="includes/images/3.png" class="img-sidehelp">Contact Person</a></li>
							<li><a href="vendor-address" class="side-help" style="font-size: 15px;"><img src="includes/images/4.png" class="img-sidehelp">Address</a></li>
						</ul>
					
				  </div>
			  </div>
		    </div>

			<%--<div class="row col-md-12">
				  <div class="panel panel-info">

					  <div class="panel-heading">
					  	<img src="includes/images/listofusers.png" class="box-icon"/>
						<span class="panel-title">List of Drivers</span>
						
					  </div>

					  <div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"><input type="checkbox" /></th>
                                    <th class="tb-font-black">Code</th>
								  <th class="tb-font-black">License</th>
								  <th class="tb-font-black">Last Name</th>
								  <th class="tb-font-black">First Name</th>
								  <th class="tb-font-black">Middle Name</th>
                                    <th class="tb-font-black">Title</th>
								  <th class="tb-font-black">Status</th>
								  <th class="tb-font-black">Action</th>
								</tr>
							  </thead>
							  <tbody>
                            <s:iterator value="drivers" var="driver">
                                <tr>
                              <td class="tb-font-black"><s:checkbox name="a" theme="simple" /></td>
                              <td class="tb-font-black"><s:property value="driverCode" /></td>
                              <td class="tb-font-black"><s:property value="licenseNumber" /></td>
                              <td class="tb-font-black"><s:property value="lastName" /></td>
                              <td class="tb-font-black"><s:property value="firstName" /></td>
                              <td class="tb-font-black"><s:property value="middleName" /></td>
                              <td class="tb-font-black"><s:property value="title" /></td>
                              <td class="tb-font-black"><s:property value="status" /></td>
                              <td class="tb-font-black">
                                  <s:url var="editDriverUrl" action="loadEditDriverPage">
                                  <s:param name="driverCodeParam" value="driverCode"></s:param>
                                  </s:url>
                                  <s:a class="icon-action-link" href="%{editDriverUrl}" rel="tooltip" title="Edit this driver">
                                  <img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>
                                  <s:url var="deleteDriverUrl" action="deleteDriver">
                                      <s:param name="driverCodeParam" value="driverCode"></s:param>
                                  </s:url>
                                  <s:a class="icon-action-link" href="%{deleteDriverUrl}" rel="tooltip" title="Delete this Driver" onclick="return confirm('Do you really want to delete?');">
                                      <img src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
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
			    </div>--%>

		<!-- SIDBAR GOES HERE -->
		
		<!-- END OF EDIT -->
		
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
		      </div>
		      <div class="modal-body">
		        <div style="text-align:center;">
					<span>Do you really want to delete <em>'123456789, Victoria, Clarence, Columna, Active'</em> ? This action is irreversible.</span>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- END OF THE MIDDLE -->
