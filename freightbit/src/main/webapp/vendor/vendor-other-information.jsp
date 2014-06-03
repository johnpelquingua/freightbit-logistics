<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Other Information</h1>
		
		<!-- EDIT HERE -->

			<div class="main-box">
				<div class="panel booking panel-info">
					<div class="booking panel-heading">
						<img src="includes/images/add-user.png" class="box-icon">
						<span class="booking panel-title">Other Information</span>
					</div>
					<div class="panel-body">

						<form class="form-horizontal" role="form">
                            <div class="table-responsive list-table">
                            <s:form cssClass="form-horizontal" action="vendor-address" theme="bootstrap">
							  <div class="form-group">

							    <label for="CLASS" class="col-sm-2 control-label">Class:</label>

							    	<div class="col-sm-10">
							    		
							    	<s:select list="otherInfoClassList" cssClass="form-control" id="CLASS" name="CLASS"/>

							    	</div>

							  </div>

							  <div class="form-group">

							    <label for="STATUS" class="col-sm-2 control-label">Status:</label>

							    <div class="col-sm-10">

							      <s:select list="statusList" cssClass="form-control" id="STATUS" name="STATUS"/>

							    </div>

							  </div>
							  
						<%--</form>--%>

                        </div>
					</div>

				<div class="panel-footer">
					<div class="btn-group" style="float: right;">
						<button class="btn btn-default" onclick="this.form.action='vendor-contact-person'">Back</button>
						<button class="btn btn-default" onclick="this.form.action='vendor-address'" type="submit">Next</button>
					</div>
				</div>
                    </s:form>
				</div>

			</div>
			<div class="sidebar-box">
			  <div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/calendar.png" class="box-icon">
						<span class="panel-title">Process</span>
					</div>
					
				  <div class="panel-body">
					
						<ul class="nav">		  
							<li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
							<li><a href="vendor-trucks" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Trucks Information</a></li>
							<li><a href="vendor-driver" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Driver Information</a></li>
							<li><a href="vendor-contact-person" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Contact Person</a></li>
							<li><a href="vendor-other-information" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Other Information</a></li>
							<li><a href="vendor-address" class="side-help"><img src="includes/images/6.png" class="img-sidehelp">Address</a></li>
						</ul>
					
				  </div>
			  </div>
		    </div>

		<!-- SIDEBAR GOES HERE -->
		
		<!-- END OF EDIT -->
		
        </div>
		
		<!-- END OF THE MIDDLE -->
