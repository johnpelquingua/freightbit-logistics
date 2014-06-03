<%@ taglib prefix="s" uri="/struts-tags" %>

		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Vendor Module</h1>
		
		
		<!-- EDIT HERE -->
		<div class="row alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  			<strong>Success!</strong> The data has been successfully saved.
		</div>

		<div class="row">			
				<div class="col-md-12">
				  <div class="panel panel-info">

					  <div class="panel-heading">

					  	<img src="includes/images/listofusers.png" class="box-icon" />
						<span class="panel-title">List of Vendors</span>

					  </div>

					  <div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"><input type="checkbox" /></th>
								  <th class="tb-font-black">Company Code</th>
								  <th class="tb-font-black">Company Name</th>
								  <th class="tb-font-black">Email Address</th>
								  <th class="tb-font-black">Contact Number</th>
								  <th class="tb-font-black">Action</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">SRI</td>
								  <td class="tb-font-black" align="center">Solutions Resource</td>
								  <td class="tb-font-black">info@solutionsreource.com</td>
								  <td class="tb-font-black">123-4567</td>
								  <td class="tb-font-black">
									<a href="vendorEdit.jsp" class="icon-action-link" rel="tooltip" title="Edit this vendor"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
									<a href="#myModal" data-toggle="modal" class="icon-action-link" rel="tooltip" title="Delete this vendor"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
									<a href="vendor-list-info.jsp" class="icon-action-link" rel="tooltip" title="View this vendor"><img src="includes/images/info-b.png" class="icon-action circ-icon"> </a>
								  </td>
								</tr>
							  </tbody>
							</table>
						  </div>
					  </div>

					  <div class="panel-footer">
							<span class="pull-right">
								<a href="vendorAdd.jsp" class="icon-action-link" rel="tooltip" title="Add Vendor"><img src="includes/images/add-user.png" class="icon-action circ-icon"> </a>
							</span>

							<ul class="pagination">
							  <li class="disabled"><a href="#">&laquo;</a></li>
							  <li class="active"><a href="#">1</a></li>
							  <li class="disabled"><a href="#">&raquo;</a></li>
							</ul>
							
					  </div>

				  </div>
			    </div>	
			</div>
		
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
					<span>Do you really want to delete <em>'SRI, Solutions Resource, info@solutionsresource.com, 123-4567'</em> ? This action is irreversible.</span>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- SIDEBAR GOES HERE -->
		
		
		<!-- END OF EDIT -->
		
        
		
		<!-- END OF THE MIDDLE -->
