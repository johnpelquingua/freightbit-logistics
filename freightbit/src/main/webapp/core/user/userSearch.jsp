<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">User Module</h1>
		
		<!-- EDIT HERE -->
		<div class="main-box" >
			<div class="col-md-12">
				<div class="panel panel-info">

					<div class="panel-heading">
						<img src="../includes/images/search.png" class="box-icon">
						<span class="panel-title">Search User</span>
					</div>

					<div class="panel-body">
                        <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="viewUsers" theme="bootstrap">


							  	<div class="form-group">

								    <label for="user.userSearchCriteria" class="col-sm-2 control-label">Search by:</label>

								    <div class="col-sm-10">
                                        <s:select emptyOption="true" list="userSearchList" listValue="value" listKey="key" cssClass="form-control" name="user.userSearchCriteria" value="user.userSearchCriteria"/>
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
			  <img src="../includes/images/chat.png" class="box-icon">
				<span class="panel-title">Online Chat</span>
				
			  </div>
			  <div class="panel-body">
				<div class="table-responsive list-table">
			
				  </div>
			  </div>
		  </div>
	    </div>	
		<!-- END OF EDIT -->
		

</div>--%>
<!-- END OF THE MIDDLE -->


<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-user"></i> User</li>
            <li class="active"><i class="fa fa-search"></i> Search User</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search User</h3>
            </div>

            <div class="panel-body">

                <s:form cssClass="form-horizontal" action="viewUsers" theme="bootstrap">


                <div class="form-group">

                    <label for="user.userSearchCriteria" class="col-sm-2 control-label">Search By:</label>

                    <div class="col-sm-10">
                        <s:select emptyOption="true" list="userSearchList" listValue="value" listKey="key"
                                  cssClass="form-control" name="user.userSearchCriteria"
                                  value="user.userSearchCriteria"/>
                    </div>
                </div>

                <div class="form-group">

                    <label for="user.userSearchCriteria" class="col-sm-2 control-label">Search:</label>

                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" placeholder="Keyword" name="user.userKeyword"/>
                    </div>

                </div>

            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button type="button" class="btn" onclick="location.href='viewUsers'">
                        Cancel
                    </button>
                    <button class="btn btn-info pull-right">Search</button>
                </div>
            </div>
            </s:form>

        </div>
    </div>
</div>
</div><!-- /.row -->



