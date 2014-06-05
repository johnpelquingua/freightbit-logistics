<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>

        <%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h1 class="page-header">Customer Profile</h1>

		<!-- MAIN BOX -->

		<div class="main-box">
			<div class="panel booking panel-info">
				<div class="booking panel-heading">
					  <img src="images/add-user.png" class="box-icon">
						<span class="booking panel-title">Add Customer - Items</span>
				</div>
				<div class="panel-body">
				<div class="table-responsive list-table">

				<form class="form-horizontal" role="form">
				  <div class="form-group">
					<label for="iname" class="col-sm-2 control-label" style="width:25%;">Item Name</label>
					<div class="col-sm-10" style="width:70%;">
						<input type="text" class="form-control" id="iname" placeholder="Item Name">
					</div>
				  </div>
				  <div class="form-group">
					<label for="icode" class="col-sm-2 control-label" style="width:25%;">Item Code</label>
					<div class="col-sm-10" style="width: 31%;">
						<input type="text" class="form-control" id="icode" placeholder="Item Code">
					</div>
					<label for="srp" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">SRP</label>
					<div class="col-sm-10" style="width: 34.5%;">
						<input type="text" class="form-control" id="srp" placeholder="SRP">
					</div>
				  </div>
				  <div class="form-group">
					<label for="length" class="col-sm-2 control-label" style="width:25%;">Length</label>
					<div class="col-sm-10" style="width: 31%;">
						<input type="text" class="form-control" id="length" placeholder="Length">
					</div>
					<label for="width" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">Width</label>
					<div class="col-sm-10" style="width: 32.8%;">
						<input type="text" class="form-control" id="width" placeholder="Width">
					</div>
				  </div>
				  <div class="form-group">
					<label for="cquality" class="col-sm-2 control-label" style="width:25%;">Critical Quality</label>
					<div class="col-sm-10" style="width: 31%;">
						<input type="text" class="form-control" id="cquality" placeholder="Critical Quality">
					</div>
					<label for="height" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">Height</label>
					<div class="col-sm-10" style="width: 31.8%;">
						<input type="text" class="form-control" id="height" placeholder="Height">
					</div>
				  </div>
				  <div class="form-group">
					<label for="bprice" class="col-sm-2 control-label" style="width:25%;">Base Price</label>
					<div class="col-sm-10" style="width:70%;">
						<input type="text" class="form-control" id="bprice" placeholder="Base Price">
					</div>
				  </div>
				  <div class="form-group">
					<label for="note" class="col-sm-2 control-label" style="width:25%;">Note</label>
					<div class="col-sm-10" style="width:70%;">
						<input type="text" class="form-control" id="note" placeholder="Note">
					</div>
				  </div>
				  <div class="form-group">
					<label for="desc" class="col-sm-2 control-label" style="width:25%;">Description</label>
					<div class="col-sm-10" style="width:70%;">
						<textarea class="form-control" id="desc" placeholder="Description of the Item"></textarea>
					</div>
				  </div>
				  <span class="pull-right" style="margin-right:32px;">
					<a href="customer-add3.html" class="btn btn-default" id ="groups-btn" style="width:70px;">Back</a>
					<button href="#" class="btn btn-default" id="groups-btn" style="width:70px;">Save</button>
					<a href="customer-add5.html" class="btn btn-default" id="groups-btn" style="width:70px;">Next</a>
				  </span>
				</form>

				</div>
				</div>
			</div>
		</div>
