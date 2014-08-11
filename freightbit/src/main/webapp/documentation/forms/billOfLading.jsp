<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 8/11/14
  Time: 2:50 PM
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
                <span class="booking panel-title">Bill of Lading</span>
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
                            <label for="origin" class="col-sm-2 control-label" style="width:25%;">Origin</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="pu-address"
                                       value="123 Biglang Liko St. Quezon City" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="destination" class="col-sm-2 control-label"
                                   style="width:25%;">Destination</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="da-address"
                                       value="123 Biglang Liko St. Dagupan" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ref-num" class="col-sm-2 control-label" style="width:25%;">Reference
                                Number</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="ref-num" value="691123123" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="vessel" class="col-sm-2 control-label" style="width:25%;">Vessel</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="vessel" value="GGG123" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="voyage" class="col-sm-2 control-label" style="width:25%;">Voyage</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="voyage"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trucker" class="col-sm-2 control-label" style="width:25%;">Trucker</label>

                            <div class="col-sm-10" style="width:70%;">
                                <input type="text" class="form-control" id="trucker"/>
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
                    <li><a href="#" class="balak">Way Bill Destination</a></li>
                    <li><a href="#" class="balak">Acceptance Receipt</a></li>
                    <li><a href="#" class="balak">Bill of Lading</a></li>
                    <li><a href="#" class="balak">Load Manifest</a></li>
                    <li><a href="#" class="balak">Authority to Load</a></li>
                    <li><a href="#" class="balak">Authority to Withdraw</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
