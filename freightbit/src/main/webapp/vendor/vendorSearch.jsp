<%@ taglib prefix="s" uri="/struts-tags" %>

		<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Vendor Module</h1>
		
		<!-- EDIT HERE -->
		<div class="main-box" >
			<div class="col-md-12">
				<div class="panel panel-info">

					<div class="panel-heading">
						<img src="includes/images/search.png" class="box-icon">
						<span class="panel-title">Search Vendor</span>
					</div>

					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="viewVendors" theme="bootstrap">


							  	<div class="form-group">

								    <label for="vendor.vendorSearchList" class="col-sm-2 control-label">Search by:</label>

								    <div class="col-sm-10">
                                        <s:select list="vendorSearchList" listValue="value" listKey="key" cssClass="form-control" name="vendor.vendorSearchList"/>
								    </div>
							    </div>

							    <div class="form-group">

							    	<label for="vendor.vendorKeyword" class="col-sm-2 control-label">Search:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Keyword" name="vendor.vendorKeyword"/>
								    </div>

							  	</div>

						    	<div class="form-group">

								    <label class="col-sm-2 control-label">Filter by:</label>

								    <div class="col-sm-10">
                                        <label class="checkbox-inline" for="Name">
                                            <s:checkbox name="Name" /> Name
                                        </label>
                                        <label class="checkbox-inline" for="Code">
                                            <s:checkbox name="Code" /> Code
                                        </label>
                                        <label class="checkbox-inline" for="Type">
                                            <s:checkbox name="Type" /> Type
                                        </label>
                                        <label class="checkbox-inline" for="Email">
                                            <s:checkbox name="Email" /> Email
                                        </label>
                                        <label class="checkbox-inline" for="Class">
                                            <s:checkbox name="Class" /> Class
                                        </label>
                                        <label class="checkbox-inline" for="Address">
                                            <s:checkbox name="Address" /> Address
                                        </label>
                                        <label class="checkbox-inline" for="City">
                                            <s:checkbox name="City" /> City
                                        </label>
                                        <label class="checkbox-inline" for="ZIP">
                                            <s:checkbox name="ZIP" /> ZIP
                                        </label>
								    </div>

							  	</div>

                        </div>
						<button class="btn btn-default pull-right">Search</button>
                        </s:form>
					</div>


				</div>
				
			</div>
		</div>



		

		<!-- SIDBAR GOES HERE -->
		<div class="sidebar-box">
		  <div class="panel panel-info">
			  <div class="panel-heading">
			  <img src="includes/images/chat.png" class="box-icon">
				<span class="panel-title">Online Chat</span>
				
			  </div>
			  <div class="panel-body">
				<div class="table-responsive list-table">
			
				  </div>
			  </div>
		  </div>
	    </div>	
		<!-- END OF EDIT -->
		

</div>
		<!-- END OF THE MIDDLE -->
