<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Vessels</h1>
		
		<!-- EDIT HERE -->
			<div class="main-box">
				<div class="panel panel-info">

					<div class="panel-heading">
						<img src="includes/images/anchor-3-24.png" class="box-icon">
						<span class="panel-title">Vessel Information</span>
					</div>

					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="vesselValidation" theme="bootstrap">

							    <div class="form-group">

							    	<label for="number" class="col-sm-2 control-label">Vessel:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Vessel Number" name="number"/>
								    </div>

							  	</div>

							  	<div class="form-group">

							    	<label for="name" class="col-sm-2 control-label">Name:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Vessel Name" name="name"/>
								    </div>

							  	</div>

							  	<div class="form-group">

							    	<label for="modelNumber" class="col-sm-2 control-label">Model:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Model Number" name="modelNumber"/>
								    </div>

							  	</div>

							  	<div class="form-group">

							    	<label for="yearModel" class="col-sm-2 control-label">Year Model:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Year Model" name="yearModel"/>
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
			  <div class="panel booking panel-info">
					<div class="booking panel-heading">
						<img src="includes/images/calendar.png" class="box-icon">
						<span class="booking panel-title">Process</span>
					</div>
					
				  <div class="panel-body">
					
						<ul class="nav">		  
						<li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
						<li><a href="vendor-vessel" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Vessel</a></li>
						<li><a href="vendor-contact-person2" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Contact Person</a></li>
						<li><a href="vendor-other-information2" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Other Information</a></li>
						<li><a href="vendor-address2" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Address</a></li>
						</ul>
					
				  </div>
			  </div>
		    </div>	

			<div class="row col-md-12">
				  <div class="panel panel-info">

					  <div class="panel-heading">
					  	<img src="includes/images/listofusers.png" class="box-icon"/>
						<span class="panel-title">List of Vessels</span>
						
					  </div>

					  <div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"><input type="checkbox" /></th>
								  <th class="tb-font-black">Vessel</th>
								  <th class="tb-font-black">Name</th>
								  <th class="tb-font-black">Model</th>
								  <th class="tb-font-black">Year</th>
								  <th class="tb-font-black">Action</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">RUSE</td>
								  <td class="tb-font-black" align="center">RUSSEL'S</td>
								  <td class="tb-font-black">russel@russel.com</td>
								  <td class="tb-font-black">123-4567</td>
								  <td class="tb-font-black">
									<a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
									<a href="" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
								  </td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">SRI</td>
								  <td class="tb-font-black" align="center">SolutionssResource</td>
								  <td class="tb-font-black">sr@sr.com</td>
								  <td class="tb-font-black">123-4567</td>
								  <td class="tb-font-black">
									<a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
									<a href="" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
								  </td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">MTY</td>
								  <td class="tb-font-black" align="center">Migthy Corporation</td>
								  <td class="tb-font-black">mty@mty.com</td>
								  <td class="tb-font-black">123-4567</td>
								  <td class="tb-font-black">
									<a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
									<a href="" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
								  </td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">MTY</td>
								  <td class="tb-font-black" align="center">Migthy Corporation</td>
								  <td class="tb-font-black">mty@mty.com</td>
								  <td class="tb-font-black">123-4567</td>
								  <td class="tb-font-black">
									<a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
									<a href="" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
								  </td>
								</tr>
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
		
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->
