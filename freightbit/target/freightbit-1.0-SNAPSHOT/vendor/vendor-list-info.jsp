<%@ taglib prefix="s" uri="/struts-tags" %>

		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Vendor Profile</h1>
		
		<!-- EDIT HERE -->

		<div class="row" >
			<div class="col-md-12">
				<div>
					<div class="panel panel-info"  style="float:left; width:50%;">
						<div class="panel-heading">
							<img src="includes/images/account.png" class="box-icon">
							<span class="panel-title">Personal Information</span>
						</div>
						<div class="panel-body">
							<div style="float:left; width:50%;">
								<img src="includes/images/default-image.png" style="width:150px;margin:6px;">
							</div>
							<div style="float:left; width:50%;">
								<h2>Solutions Resource (SRI)</h2>
								<span>Email Address : info@solutionsresource.com</span>
								<br>
								<span>Contact Number : 6915661</span>
							</div>
						</div>
					</div>

					<div style="float:left; margin:0px 20px;width:45%;">
							
						<div class="panel panel-info">
						  <div class="panel-heading"> 
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="panel-title">List of Address</span>
						  </div>
							<div class="panel-body">
								<div class="table-responsive list-table">
									<table class="table table-striped table-bordered text-center" id="customer-list">
									  <thead>
										<tr class="header_center">
										  <th class="tb-font-black"><input type="checkbox" /></th>
										  <th class="tb-font-black">Address</th>
										</tr>
									  </thead>
									  <tbody>
										<tr>
										  <td class="tb-font-black"><input type="checkbox" /></td>
										  <td class="tb-font-black">Suite 4, UP Ayala Technopark, Katipunan Ave., Quezon City 1101</td>
										</tr>
										<tr>
										  <td class="tb-font-black"><input type="checkbox" /></td>
										  <td class="tb-font-black">14040 NE 8th Street Suite 226 Bellevue, Washington, 98007</td>
										</tr>
									  </tbody>
									</table>
									<span class="pull-right">
										<a href="#" class="icon-action-link">
											<img src="includes/images/edit-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
										</a>
										<a href="#" class="icon-action-link">
											<img src="includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
										</a>
										<a href="#" class="icon-action-link">
											<img src="includes/images/plus-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
										</a>
										<a href="#" class="icon-action-link">
											<img src="includes/images/view-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
										</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="clear:both;"></div>
				<div>
					<div class="panel panel-info" style="width:50%;float:left;">
					  <div class="panel-heading">
						<img src="includes/images/listofusers.png" class="box-icon">
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
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td class="tb-font-black"><input type="checkbox" /></td>
									  <td class="tb-font-black">Closed Van</td>
									  <td class="tb-font-black" align="center">ABC-123</td>
									  <td class="tb-font-black">Isuzu Elf Dropside</td>
									  <td class="tb-font-black">1991</td>
								  	  <td class="tb-font-black">4HF1</td>
									</tr>
									<tr>
									  <td class="tb-font-black"><input type="checkbox" /></td>
									  <td class="tb-font-black">Closed Van</td>
									  <td class="tb-font-black" align="center">ZXC-321</td>
									  <td class="tb-font-black">Isuzu 6HL</td>
									  <td class="tb-font-black">2013</td>
								  	  <td class="tb-font-black">M03737</td>
									</tr>
								  </tbody>
								</table>
								<span class="pull-right">
									<a href="customer-edit6.html" class="icon-action-link">
										<img src="includes/images/edit-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>
									<a href="#" class="icon-action-link">
										<img src="includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>
									<a href="#" class="icon-action-link">
										<img src="includes/images/plus-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>
								</span>
							</div>
						</div>
					</div>
					<div class="panel panel-info" style="width:45%;float:left; margin: 0px 20px;">
							  <div class="panel-heading">
								<img src="includes/images/listofusers.png" class="box-icon">
								<span class="panel-title">List of Drivers</span>
								
							  </div>
							<div class="panel-body">
							<div class="table-responsive list-table">
								<table class="table table-striped table-bordered text-center">
								  <thead>
									<tr class="header_center">
									  <th class="tb-font-black"><input type="checkbox" /></th>
									  <th class="tb-font-black">License</th>
									  <th class="tb-font-black">Last Name</th>
									  <th class="tb-font-black">First Name</th>
									  <th class="tb-font-black">Middle Name</th>
									  <th class="tb-font-black">Status</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td class="tb-font-black"><input type="checkbox" /></td>
									  <td class="tb-font-black">123456789</td>
									  <td class="tb-font-black">Victoria</td>
									  <td class="tb-font-black">Clarence</td>
									  <td class="tb-font-black">Columna</td>
									  <td class="tb-font-black">Active</td>
									</tr>
								  </tbody>
								</table>
								<span class="pull-right">
									<a href="customer-edit6.html" class="icon-action-link">
										<img src="includes/images/edit-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>
									<a href="#" class="icon-action-link">
										<img src="includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>
									<a href="#" class="icon-action-link">
										<img src="includes/images/plus-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
									</a>
								</span>
							</div>
							</div>
						</div>
					</div>
				<div style="clear:both"></div>
			</div>
		</div>
							      
		<!-- SIDEBAR GOES HERE -->
		
		<!-- END OF EDIT -->
		
        </div>

		<!-- END OF THE MIDDLE -->
