<%@ taglib prefix="s" uri="/struts-tags" %>

		<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">User Module</h1>
		
		<!-- EDIT HERE -->
		<div class="main-box" >
			<div class="col-md-12">
				<div class="panel panel-info">

					<div class="panel-heading">
						<img src="includes/images/search.png" class="box-icon">
						<span class="panel-title">Search User</span>
					</div>

					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="viewUsers" theme="bootstrap">


							  	<div class="form-group">

								    <label for="user.userSearchCriteria" class="col-sm-2 control-label">Search by:</label>

								    <div class="col-sm-10">
                                        <s:select required="true" list="userSearchList" listValue="value" listKey="key" cssClass="form-control" name="user.userSearchCriteria" value="user.userSearchCriteria"/>
								    </div>
							    </div>

							    <div class="form-group">

							    	<label for="user.userSearchCriteria" class="col-sm-2 control-label">Search:</label>

								    <div class="col-sm-10">
                                        <s:textfield cssClass="form-control" placeholder="Keyword" name="user.userKeyword"/>
								    </div>

							  	</div>

						    	<div class="form-group">

								    <label class="col-sm-2 control-label">Filter by:</label>

								    <div class="col-sm-10">
                                        <label class="checkbox-inline" for="User Type">
                                            <s:checkbox name="userType" /> User Type
                                        </label>
                                        <label class="checkbox-inline" for="User Name">
                                            <s:checkbox name="userName" /> User Name
                                        </label>
                                        <label class="checkbox-inline" for="Email Address">
                                            <s:checkbox name="emailAddress" /> Email Address
                                        </label>
                                        <label class="checkbox-inline" for="contactNo">
                                            <s:checkbox name="Contact Number" /> Contact Number
                                        </label>
                                        <label class="checkbox-inline" for="Status">
                                            <s:checkbox name="Status" /> Status
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
