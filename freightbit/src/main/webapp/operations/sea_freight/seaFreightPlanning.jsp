<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Sea Freight Planning</h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i>List of Bookings</li>
			<li class="active"><i class="fa fa-male"></i>List of Items / Containers</li>
			<li class="active"><i class="fa fa-male"></i>Sea Freight Planning</li>
        </ol>

    </div>
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i><s:property value="nameSizeParam" /> </h3>
            </div>

            <div class="panel-body">
				
				<form class="form-horizontal" role="form">

							  <div class="form-group">

							    <label for="operations.nameSizeParam" class="col-sm-2 control-label">Container Number:</label>

							    <div class="col-sm-10">
							      <s:textfield cssClass="form-control" id="operations.nameSizeParam" name="operations.nameSizeParam"  value="%{nameSizeParam}" disabled="true" />
							    </div>

							  </div>
							  
							  <div class="form-group">

							    <label for="operations.vendorList" class="col-sm-2 control-label">Vendor:</label>

							    <div class="col-sm-10">
									<div style="width:90%;float:left;padding-right:10px;">
                                        <s:select list="vendorList" name="operations.vendorList" id="operations.vendorList"
                                                  listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                                ></s:select>
									</div>
									<div style="width:5%;float:left;">
									<a href="#.html" class="icon-action-link">
										<img src="images/add-sched.png" class="icon-action circ-icon">
									</a>
									</div>
							    </div>

							  </div>
							  
							  <div class="form-group">

							    <label for="operations.date" class="col-sm-2 control-label">Select Date:</label>

							    <div class="col-sm-10">
								
							      <input type="date" class="form-control" name="operations.date" id="operations.date" >
								
							    </div>

							  </div>
							  
							  <div class="form-group">

							    <hr>
								<center><h4>List of Schedules</h4></center>
								<hr>

							  </div>

								<table class="table table-striped table-bordered text-center">
									<thead>
										<tr class="header_center active">
										  <th class="tb-font-black">Select</th>
										  <th class="tb-font-black">Vendor Name</th>
										  <th class="tb-font-black">Voyage Number</th>
										  <th class="tb-font-black">Date of Departure</th>
										  <th class="tb-font-black">Date of Arrival</th>
										  <th class="tb-font-black">Pier Origin</th>
										  <th class="tb-font-black">Pier Destination</th>
										  
										</tr>
									</thead>
								<tbody>
									<tr class="success">
									  <td class="tb-font-black"><input type="radio"></td>
									  <td class="tb-font-black">Vendor 1</td>
									  <td class="tb-font-black">V-283</td>
									  <td class="tb-font-black">2/14/2014</td>
									  <td class="tb-font-black">2/14/2014</td>
									  <td class="tb-font-black">Batangas</td>
									  <td class="tb-font-black">Davao</td>
									</tr>
									<tr class="success">
									  <td class="tb-font-black"><input type="radio"></td>
									  <td class="tb-font-black">Vendor 2</td>
									  <td class="tb-font-black">V-284</td>
									  <td class="tb-font-black">2/14/2014</td>
									  <td class="tb-font-black">2/14/2014</td>
									  <td class="tb-font-black">Manila</td>
									  <td class="tb-font-black">Davao</td>
									</tr>
									<tr class="success">
									  <td class="tb-font-black"><input type="radio"></td>
									  <td class="tb-font-black">Vendor 3</td>
									  <td class="tb-font-black">V-285</td>
									  <td class="tb-font-black">2/14/2014</td>
									  <td class="tb-font-black">2/14/2014</td>
									  <td class="tb-font-black">Bacolod</td>
									  <td class="tb-font-black">Davao</td>
									</tr>
													
								</tbody>
								</table>
							
							  
						</form>
				

					<div style="float: right;">
						<button class="btn btn-default" onclick="location.href='inland-operation.html'">Save</button>
						<button class="btn btn-default" onclick="location.href='inland-operation.html'">Cancel</button>
					</div>

            </div>

        </div>
    </div>
</div><!-- /.row -->