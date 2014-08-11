<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 8/11/14
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Document</h1>

    <!-- MAIN BOX -->

    <div class="main-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="images/document.png" class="box-icon">
                <span class="booking panel-title">Way Bill Destination</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="shipper" class="col-sm-2 control-label" style="width:25%;">Shipper</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="shipper" value="RUSSEL'S COMPANY" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="consignee" class="col-sm-2 control-label" style="width:25%;">Consignee</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="consignee" value="SOLUTIONS RESOURCE"
                                       disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pu-address" class="col-sm-2 control-label" style="width:25%;">Pick-Up
                                Address</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="pu-address"
                                       value="123 Biglang Liko St. Quezon City" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="da-address" class="col-sm-2 control-label" style="width:25%;">Delivery
                                Address</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="da-address"
                                       value="123 Biglang Liko St. Dagupan" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="type" class="col-sm-2 control-label" style="width:25%;">Type of Service</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="type" value="Door to Door" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cargo-details" class="col-sm-2 control-label" style="width:25%;">Cargo
                                Details</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="cargo-details"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="desc" class="col-sm-2 control-label" style="width:25%;">Description</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="desc"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="plate-no" class="col-sm-2 control-label" style="width:25%;">Truck Plate
                                Number</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="plate-no"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="remarks" class="col-sm-2 control-label" style="width:25%;">Remarks</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="remarks"/>
                            </div>
                        </div>
				  <span class="pull-right" style="margin-right:32px;">
					<a href="#" class="btn btn-default" id="groups-btn" style="width:70px;">Back</a>
					<button href="#" class="btn btn-default" id="groups-btn" style="width:70px;">Save</button>
					<a href="#" class="btn btn-default" id="groups-btn" style="width:70px;">Print</a>
				  </span>
                    </form>

                </div>
            </div>
        </div>
    </div>


    <!-- END OF MAIN BOX -->

    <!-- SIDEBAR -->

    <div class="sidebar-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="images/calendar.png" class="box-icon">
                <span class="booking panel-title">Other Documents</span>

            </div>
            <div class="panel-body">
                <ul class="nav">
                    <li><a href="#" class="balak">Way Bill Origin</a></li>
                    <li><a href="#" class="balak">Acceptance Order</a></li>
                    <li><a href="#" class="balak">Release Order</a></li>
                    <li><a href="#" class="balak">Bill of Lading</a></li>
                    <li><a href="#" class="balak">Load Manifest</a></li>
                    <li><a href="#" class="balak">Authority to Load</a></li>
                    <li><a href="#" class="balak">Authority to Withdraw</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

