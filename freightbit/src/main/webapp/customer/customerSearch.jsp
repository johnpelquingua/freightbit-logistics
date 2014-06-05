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
                        <s:form cssClass="form-horizontal" action="customerSearchExecute" theme="bootstrap">


							  	<div class="form-group">

								    <label  class="col-sm-2 control-label">Search by:</label>

								    <div class="col-sm-10">
                                      	 <s:select name="searchType" id="searchType" listKey="key" listValue="value" list="customerSearchList" cssClass="form-control"/>
								    </div>
							    </div>

							    <div class="form-group">

							    	<label  class="col-sm-2 control-label">Search:</label>

								    <div class="col-sm-10">
                                           <s:textfield name="keyword"  cssClass="form-control" id="keyword"/>
								    </div>

							  	</div>

                        </div>
						<s:submit name="submit" cssClass="btn btn-default pull-right" value="Search" />
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
