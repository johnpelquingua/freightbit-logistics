<div class="row">
    <div class="col-lg-12">
        <h1>Vessel Schedules </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i>Vessel Schedules</li>
        </ol>

    </div>
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i>List of Vessel Schedules</h3>
            </div>

            <div class="panel-body">
				
				<div class="table-responsive">
                        <display:table id="vesselSchedule" name="vesselSchedules"
                                       requestURI="/viewVesselsSchedules.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td>

                                <display:column title="Actions">
                            <a href="vessel-schedule-edit.html" class="icon-action-link edit-booking"><img
                                    src="includes/images/edit-booking.png" class="icon-action circ-icon"
                                    title="Edit Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                            </a>
                            <a href="#delete-Schedule" class="icon-action-link delete-booking"><img
                                    src="includes/images/delete-sched.png" class="icon-action circ-icon"
                                    title="Delete Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                            </a>
                                </display:column>
                            </td>

                        </display:table>
                </div>
				



            </div>

            <div class="panel-footer">
                                <ul class="pagination">
                                    <li><a href="#">&laquo;</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="booking2.html">2</a></li>
                                    <li><a href="booking2.html">&raquo;</a></li>
                                </ul>

            							<span class="pull-right">
            							<a href="vessel-schedule-add.html" class="icon-action-link"><img
                                                src="includes/images/add-sched.png" class="icon-action circ-icon"> </a>
            							</span>
                            </div>

        </div>
    </div>
</div><!-- /.row -->