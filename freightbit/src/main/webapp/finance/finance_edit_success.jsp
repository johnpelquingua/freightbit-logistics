	<%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

       <head>
          <sj:head compressed='false'/>
       </head>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h1 class="page-header">Finance</h1>

		<!-- EDIT HERE -->

<div style="height:100%;" class="panel booking panel-info">
	<div class="booking panel-heading">
		<img src="includes/images/booking.png" class="box-icon">
		<span class="booking panel-title">Finance</span>
	</div>
<div class="panel-body" >
	<div class="row alert alert-success alert-dismissable">
        			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          			<strong>Success!</strong> The data has been successfully updated.</div>
<table class="table table-striped table-bordered text-center" id ="users-list">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black">Username</th>
								  <th class="tb-font-black">Name</th>
								  <th class="tb-font-black">Company</th>
								  <th class="tb-font-black">Email Address</th>
								  <th class="tb-font-black">Contact Number</th>
								  <th class="tb-font-black">Action</th>

								</tr>
								</thead>
								<tr>
								  <td class="tb-font-black">Sample Username</td>
								  <td class="tb-font-black" align="center">Sample Name</td>
								  <td class="tb-font-black">Sample Company</td>
								  <td class="tb-font-black">Sample Email</td>
								  <td class="tb-font-black">Sample Contact</td>

								  <td class="tb-font-black">
									<a href="edit-finance" class="icon-action-link" rel="tooltip" title="Edit this user"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
									<img onclick="javascript: confirm('Do want to delete sample user?');" src="includes/images/remove-user.png" class="icon-action circ-icon">
                                  </td>
								</tr>

							</table>

                                <a href="#"  class="pull-right">Back</a>
</div>
</div>
</div>



		<!-- END OF EDIT -->

        </div>
