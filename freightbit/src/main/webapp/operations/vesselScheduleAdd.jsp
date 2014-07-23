<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Edit Vessel Schedule</h1>

    <!-- EDIT HERE -->

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <img src="images/add-user.png" class="box-icon">
                    <span class="panel-title">Vessel Schedule</span>
                </div>
                <div class="panel-body">

                    <form class="form-horizontal" role="form">

                        <div class="form-group">

                            <label for="voyagenum" class="col-sm-2 control-label">Voyage Number:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="voyagenum">
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="timeOfdep" class="col-sm-2 control-label"> Time of Departure:</label>

                            <div class="col-sm-10">
                                <input type="time" class="form-control" id="timeOfdep">
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="dateOfdep" class="col-sm-2 control-label"> Date of Departure:</label>

                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="dateOfdep">
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="dateOfarv" class="col-sm-2 control-label">Date of Arrival:</label>

                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="dateOfarv">
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="Origin" class="col-sm-2 control-label">Pier Origin:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="Origin">
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="Origin" class="col-sm-2 control-label">Pier Destination:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="Origin">
                            </div>

                        </div>

                    </form>

                    <div style="float: right;">
                        <button class="btn btn-default" onclick="location.href='vessel-schedule-list.html'">
                            Save
                        </button>
                        <button class="btn btn-default" onclick="location.href='vessel-schedule-list.html'">
                            Cancel
                        </button>
                    </div>

                </div>

            </div>

        </div>


    </div>


    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->