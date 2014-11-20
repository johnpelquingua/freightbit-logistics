<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Vessel Schedules </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vessel Schedules</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Vessel Schedules List</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking"
                            onclick="location.href='loadVesselScheduleSearch'">
                        <i class="fa fa-search"></i> Search Schedule
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddVesselSchedule'">
                        <i class="fa fa-anchor"></i> New Schedule
                    </button>
                </span>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="vesselSchedule" name="vesselSchedules"
                                   requestURI="viewVesselSchedules.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">

                        <td><display:column property="vendorCode" title="Shipping Company <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="originPort" title="Origin <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="destinationPort" title="Destination <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="voyageNumber" title="Voyage # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="departureDate" title="Departure <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="arrivalDate" title="Arrival <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td class="tb-font-black" style="text-align: center;">
                            <display:column title="Actions">

                                <s:url var="editVesselScheduleUrl" action="loadEditVesselSchedule">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editVesselScheduleUrl}" rel="tooltip"
                                     title="Edit this vendor">
                                    <%--<img src="../includes/images/edit-booking.png" class="icon-action circ-icon"
                                         style="border-radius:25%;">--%>
                                    <i class="fa fa-pencil"></i>
                                </s:a>

                                <s:url var="deleteVesselScheduleUrl" action="deleteVesselSchedule">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{deleteVesselScheduleUrl}" rel="tooltip"
                                     title="Delete this Vendor"
                                     onclick="return confirm('Do you really want to delete?');">
                                    <%--<img src="../includes/images/delete-booking.png" class="icon-action circ-icon"
                                         style="border-radius:25%;">--%>
                                    <i class="fa fa-trash-o"></i>
                                </s:a>

                            </display:column>
                        </td>
                    </display:table>
                </div>


            </div>

            <div class="panel-footer">

                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking"
                            onclick="location.href='loadVesselScheduleSearch'">
                        <i class="fa fa-search"></i> Search Schedule
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddVesselSchedule'">
                        <i class="fa fa-anchor"></i> New Schedule
                    </button>
                </span>
            </div>
        </div>
    </div>
</div>

<script>
    tableProp('DESTI_ORIG', 'vesselSchedule', 0, 0, 0, 0, 2,3);
</script>