<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <h1>Vessel Schedules </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
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
                            <td class="tb-font-black" style="text-align: center;">
                                <display:column title="Actions">

                                <s:url var="editVesselScheduleUrl" action="loadEditVesselSchedule">
                                    <s:param name="vesselScheduleIdParam" value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editVesselScheduleUrl}" rel="tooltip"
                                     title="Edit this vendor">
                                <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
                                </s:a>

                                <s:url var="deleteVesselScheduleUrl" action="deleteVesselSchedule">
                                    <s:param name="vesselScheduleIdParam" value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{deleteVesselScheduleUrl}" rel="tooltip"
                                     title="Delete this Vendor"
                                     onclick="return confirm('Do you really want to delete?');">
                                <img src="../includes/images/remove-user.png" class="icon-action circ-icon">
                                </s:a>

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
            							<a href="loadAddVesselSchedule" class="icon-action-link"><img
                                                src="../includes/images/add-sched.png" class="icon-action circ-icon"> </a>
            							</span>
                            </div>

        </div>
    </div>
</div><!-- /.row -->