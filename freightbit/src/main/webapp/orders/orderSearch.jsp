<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--<sj:head compressed='true' jquerytheme="ui-darkness"/>--%>
        
		<!-- MIDDLE -->
		<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
		<h1 class="page-header">Search Booking</h1>
		
		<!-- EDIT HERE -->
		<div class="main-box" >
			<div class="col-md-12">
				<div class="panel booking panel-info">

					<div class="booking panel-heading">
						<img src="includes/images/search.png" class="box-icon">
						<span class="booking panel-title">Search Booking</span>
					</div>

					<div class="panel-body">

						<s:form action="BookingSearchValidate" theme="bootstrap" cssClass="form-horizontal" >

							  	<div class="form-group">

								    <label class="col-sm-2 control-label">Search by:</label>

								    <div class="col-sm-10">

								        <select class="form-control">
                                            <option>Booking Number</option>
                                            <option>Company</option>
                                        </select>
								    </div>
							    </div>

							    <div class="form-group">

							    	<label for="keyword" class="col-sm-2 control-label">Search:</label>

								    <div class="col-sm-10">
								      <s:textfield cssClass="form-control" id="keyword" name="keyword" placeholder="Keyword"></s:textfield>
								    </div>

							  	</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label ">Date From:</label>
									<div class="col-sm-4">
										<sj:datepicker id="datepicker1"
                                           displayFormat="mm-dd-yy"
                                           imageUrl="includes/images/datepicker.gif"
                                           imageTooltip="Select Your Birthdate"
                                           showButton="true"
                                           changeYear="true"
                                           changeMonth="true"
                                         />
									</div>
									<label class="col-sm-2 control-label">Date To:</label>
									<div class="col-sm-4">
										<sj:datepicker id="datepicker2"
                                           displayFormat="mm-dd-yy"
                                           imageUrl="includes/images/datepicker.gif"
                                           imageTooltip="Select Your Birthdate"
                                           showButton="true"
                                           changeYear="true"
                                           changeMonth="true"
                                         />
									</div>
								</div>

						    	<div class="form-group">

								    <label for="inputCHECKBOX"class="col-sm-2 control-label">Filter by:</label>

								    <div class="col-sm-10">
								      	<label class="checkbox-inline" id="inputCHECKBOX">
										  <s:checkbox name="inlineCheckbox1"/> Booking Number
										</label>
										<label class="checkbox-inline">
										  <s:checkbox name="inlineCheckbox2"/> Company
										</label>

								    </div>

							  	</div>
						
						<div>
							<span class="pull-right">
								<button type="button" class="btn" onclick="location.href='bookingList'">
                                      Cancel
                                </button>
                                <button type="button" class="btn btn-info" onclick="location.href='bookingList'">
                                      Search
                                 </button>
							</span>
						</div>

						</s:form>

					</div>

					

				</div>
				
			</div>


		</div>

		

		<!-- SIDBAR GOES HERE -->
		<div class="sidebar-box">
		  <div class="panel booking panel-info">
			  <div class="booking panel-heading">
			  <img src="includes/images/calendar.png" class="box-icon">
				<span class="booking panel-title">Calendar</span>
				
			  </div>
			  <div class="panel-body">
				<div class="table-responsive list-table">
			
				  </div>
			  </div>
		  </div>
	    </div>	
		<!-- END OF EDIT -->
		
        </div>
		--%>
		<!-- END OF THE MIDDLE -->


<div class="row">
    <div class="col-lg-12">
        <h1>Booking Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> <i class="fa fa-list"></i> Booking List </a></li>
            <li class="active"><i class="fa fa-search"></i> Search Booking</li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search Booking</h3>
            </div>
            <div class="panel-body">
                <s:form action="viewOrders" theme="bootstrap" cssClass="form-horizontal" >
                <div class="form-group">
                    <label class="col-sm-2 control-label">Search by:</label>
                    <div class="col-sm-10">
                        <s:select emptyOption="true" id="order.orderSearchCriteria"
                                  value="order.orderSearchCriteria"
                                  name="order.orderSearchCriteria"
                                  list="orderSearchList" listValue="value" listKey="key"
                                  cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="orderBean.orderKeyword" class="col-sm-2 control-label">Search:</label>
                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" id="order.orderKeyword" name="order.orderKeyword" placeholder="Keyword"></s:textfield>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button type="button" class="btn" onclick="location.href='viewOrders'">
                        Cancel
                    </button>
                    <s:submit value="Submit" type="submit" cssClass="btn btn-info"></s:submit>

                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
<!-- /.row -->


