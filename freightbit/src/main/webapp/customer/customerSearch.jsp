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
                        <s:form cssClass="form-horizontal" action="customerSearchExecute" theme="bootstrap">


							  	<div class="form-group">

								    <label  class="col-sm-2 control-label">Search by:</label>

								    <div class="col-sm-10">
                                      	 &lt;%&ndash;<s:select name="searchType" id="searchType" listKey="key" listValue="value" list="customerSearchList" cssClass="form-control"/>&ndash;%&gt;
                                        <s:select emptyOption="true" id="customer.customerSearchCriteria"
                                                  value="customer.customerSearchCriteria"
                                                  name="customer.customerSearchCriteria"
                                                  list="customerSearchList" listValue="value" listKey="key"
                                                  cssClass="form-control"/>
								    </div>
							    </div>

							    <div class="form-group">

							    	<label  class="col-sm-2 control-label">Search:</label>

								    <div class="col-sm-10">
                                           <s:textfield name="customer.customerKeyword"  cssClass="form-control" placeholder="Keyword"/>
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


<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Search Customer </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><i class="fa fa-search"></i> Search Customer</li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search </h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="customerSearchExecute" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Search By</label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" id="customer.customerSearchCriteria"
                                      value="customer.customerSearchCriteria"
                                      name="customer.customerSearchCriteria"
                                      list="customerSearchList" listValue="value" listKey="key"
                                      cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Search</label>

                        <div class="col-sm-10">
                            <s:textfield name="customer.customerKeyword" cssClass="form-control" placeholder="Keyword"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button type="button" class="btn" onclick="location.href='customerList'">
                        Cancel
                    </button>
                    <s:submit name="submit" cssClass="btn btn-info pull-right" value="Search"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
</div><!-- /.row -->