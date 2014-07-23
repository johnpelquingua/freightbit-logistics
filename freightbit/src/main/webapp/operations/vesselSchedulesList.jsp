<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="booking page-header">
        Vessel Schedules
    </h1>

    <div class="row">
        <div class="col-md-12">
            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="includes/images/booking.png" class="box-icon">
                    <span class="booking panel-title" style="color:white;">List of Vessel Schedules</span>
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

    </div>

</div>