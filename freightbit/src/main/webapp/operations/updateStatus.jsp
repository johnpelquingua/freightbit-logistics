<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- END OF THE MIDDLE -->

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Update Status</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i>List of On-going Booking</li>
            <li class="active"><i class="fa fa-plus"></i> Update Status</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
				<span class="panel-title">Details</span>
            </div>

			<div class="panel-body">

                <form class="form-horizontal" role="form">

					<div class="form-group">

					  <label for="voyagenum" class="col-sm-2 control-label">Booking Number:</label>

					  <div class="col-sm-10">
					    <input type="text" class="form-control" id="voyagenum" value="MTY-1035" disabled>
					  </div>

					</div>

					<div class="form-group">

					  <label for="dateOfdep" class="col-sm-2 control-label"> Status</label>

					  <div class="col-sm-10">
						<select class="form-control">
							<option>SHIPPED</option>
							<option>AT THE PORT</option>
						</select>
					  </div>

					</div>
							  
				</form>
						
				<div style="float: right;">
					<button class="btn btn-default" onclick="location.href='updateStatusList.html'">Save</button>
					<button class="btn btn-default" onclick="location.href='updateStatusList.html'">Cancel</button>
				</div>

            </div>
            
            
        </div>

    </div>
</div><!-- /.row -->