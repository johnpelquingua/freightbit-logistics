<%@ taglib prefix="s" uri="/struts-tags" %>
        
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Customer Profile</h1>
		
		<!-- MAIN BOX -->
		
			<div class="row">			
				<div class="col-md-12">
					
					
					  <div>
						<div class="panel booking panel-info"  style="float:left; width:50%;">
							<div class="booking panel-heading">
								<img src="includes/images/account.png" class="box-icon">
								<span class="booking panel-title">Personal Information</span>
							</div>
							<div class="panel-body">

                                   Customer ID : <s:property value="customer.customerId" />  Customer Code: <s:property value="customer.customerCode" />  Customer Type : <s:property value="customer.customerType" />
                                   <hr>
                                   Customer Name : <s:property value="customer.customerName" />
                                   <hr>
                                    Tel No. : <s:property value="customer.phone" /> Mobile No : <s:property value="customer.mobile" />
                                   <hr>
                                    Email : <s:property value="customer.email" /> Website : <a href="%{customer.website}"><s:property value="customer.website" /></a>
                                   <hr>

							</div>
						</div>
						<div style="float:left; margin:0px 20px;width:45%;">
							
							<div class="panel booking panel-info">
						  <div class="booking panel-heading"> 
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="booking panel-title">List of Items</span>
							
						  </div>
						<div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center" id="customer-list">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"></th>
								  <th class="tb-font-black">Address</th>
								</tr>
							  </thead>
							  <tbody>
							    <tr>
							        <td><s:property value="items.itemName" /></td>
							        <td><s:property value="items.itemCode"</td>
							    </tr>
							  </tbody>
							</table>
							<span class="pull-right">
								<a href="customer-edit3.jsp" class="icon-action-link">
									<img src="includes/images/edit-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
								</a>
								<a href="#" class="icon-action-link">
									<img src="includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
								</a>

								<a href="customerAddItem"><img src="includes/images/delete-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;"> </a>
 	  						</span>
						</div>
						</div>
					</div>
						</div>
					  </div>
					  <div style="clear:both;"></div>
					<div class="panel booking panel-info" style="width:23.5%;float:left;margin:6px;">
						  <div class="booking panel-heading">
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="booking panel-title">List of Consignee</span>
							
						  </div>
						<div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center" id="customer-list">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"><input type="checkbox" /></th>
								  <th class="tb-font-black">Company Name</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">RUSE</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">PUREGOLD-CDO</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">SAVEMORE-MNL</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">PUREGOLD-MNL</td>
								</tr>
							  </tbody>
							</table>
							<span class="pull-right">
								<a href="customer-edit6.jsp" class="icon-action-link">
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
					
					<div class="panel booking panel-info" style="width:23.5%;float:left;margin:6px;">
						  <div class="booking panel-heading">
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="booking panel-title">List of Contact Person</span>
							
						  </div>
						<div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center" id="customer-list">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"><input type="checkbox" /></th>
								  <th class="tb-font-black">Contact Person</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Ariel Torres</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Tim Hintay</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Jojo Go</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Greg Hermo</td>
								</tr>
							  </tbody>
							</table>
							<span class="pull-right">
								<a href="customer-edit5.jsp" class="icon-action-link">
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
					
					<div class="panel booking panel-info" style="width:23.5%;float:left;margin:6px;">
						  <div class="booking panel-heading">
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="booking panel-title">List of Documents</span>
							
						  </div>
						<div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center" id="customer-list">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black">Status</th>
								  <th class="tb-font-black">Documents</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
								  <td class="tb-font-black"><img src="includes/images/check-16.png"></td>
								  <td class="tb-font-black">DTI / SEC</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><img src="includes/images/check-16.png"></td>
								  <td class="tb-font-black">Mayor's Permit</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><img src="includes/images/x-16.png"></td>
								  <td class="tb-font-black">AAF</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><img src="includes/images/check-16.png"></td>
								  <td class="tb-font-black">Signiture Card</td>
								</tr>
							  </tbody>
							</table>
							<span class="pull-right">
								<a href="customer-edit5.jsp" class="icon-action-link">
									<img src="includes/images/edit-16.png" style="border-radius:6px; border:2px solid #707070; padding:2px;">
								</a>
							</span>
						</div>
						</div>
					</div>
					
					<div class="panel booking panel-info" style="width:23.5%;float:left;margin:6px;">
						  <div class="booking panel-heading">
							<img src="includes/images/listofusers.png" class="box-icon">
							<span class="booking panel-title">List of Items</span>
							
						  </div>
						<div class="panel-body">
						<div class="table-responsive list-table">
							<table class="table table-striped table-bordered text-center" id="customer-list">
							  <thead>
								<tr class="header_center">
								  <th class="tb-font-black"><input type="checkbox" /></th>
								  <th class="tb-font-black">Items</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Rock</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Paper</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Scissors</td>
								</tr>
								<tr>
								  <td class="tb-font-black"><input type="checkbox" /></td>
								  <td class="tb-font-black">Gun</td>
								</tr>
							  </tbody>
							</table>
							<span class="pull-right">
								<a href="customer-edit4.jsp" class="icon-action-link">
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
			</div>	
		</div>
		
		
		<!-- END OF MAIN BOX -->
		
	
		
		<!-- END OF THE MIDDLE -->
		
