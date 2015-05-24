<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_SALES','ROLE_DOCUMENT_SPECIALIST')">
<style>
    .deleteVesselScheduleIcon {
        cursor: pointer;
    }
</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Vessel Schedules </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Operations</li>
            <li class="active"> Vessel Schedules</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
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
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="showSearchFields();">
                        <i class="fa fa-search"></i> Search Schedule
                    </button>
                    <%--<a href="viewVesselSchedules" class="btn btn-primary" id ="groups-btn">Display All</a>--%>
                    <button type="button" class="btn btn-primary"
                            onclick="location.href='viewVesselSchedules'">
                        <i class="fa fa-list"></i> Display All
                    </button>
                    <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_SEA_FREIGHT')">
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddVesselSchedule'">
                        <i class="fa fa-anchor"></i> New Schedule
                    </button>
                    </sec:authorize>
                </span>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="vesselSchedule" name="vesselSchedules"
                                   requestURI="viewVesselSchedules.action" pagesize="10"
                                   class="table table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">

                        <td><display:column property="vendorCode" title="Shipping Company <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="voyageNumber" title="Voyage # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="vesselName" title="Vessel Name <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="originPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="departureDate" title="Departure <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="arrivalDate" title="Arrival <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_SEA_FREIGHT')">
                        <td class="tb-font-black" style="text-align: center;">
                            <display:column title="Actions">

                                <s:url var="editVesselScheduleUrl" action="loadEditVesselSchedule">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editVesselScheduleUrl}" rel="tooltip"
                                     title="Edit this Vessel Schedule">

                                    <i class="fa fa-pencil"></i>
                                </s:a>

                                <s:url var="deleteVesselScheduleUrl" action="deleteVesselSchedule">
                                    <s:param name="vesselScheduleIdParam"
                                             value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{deleteVesselScheduleUrl}" rel="tooltip"
                                     title="Delete this Vessel Schedule"
                                     onclick="return confirm('Do you really want to delete?');">

                                </s:a>
                                    <i class="fa fa-trash-o deleteVesselScheduleIcon"></i>

                            </display:column>
                        </td>
                        </sec:authorize>

                    </display:table>
                </div>
            </div>
            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">

                        <div class="col-lg-12">
                            <label>LEGEND:</label>
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #d9534f;"></i> Unavailable
                        </div>
                        <div class="col-lg-3">
                            <i class="fa fa-stop" style="color: #5cb85c;"></i> Available
                        </div>
                        <div class="col-lg-3">
                            <i class='fa fa-pencil' ></i> Edit
                        </div>
                        <div class="col-lg-3">
                            <i class='fa fa-trash-o'></i> Delete
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="deleteVesselScheduleModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Delete Vessel Schedule</span>
            </div>
            <div class="modal-body">
                This Vessel Schedule might have bookings associated to it. Please confirm deletion. Are you sure you want to delete this Vessel Schedule?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmDeleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {
        actionConfirmation($('.deleteVesselScheduleIcon'),$('.confirmDeleteModalBtn'),$('#deleteVesselScheduleModal'));
        tableProp('DESTI_ORIG', 'vesselSchedule', 0, 0, 0, 0, 4, 5, 0);
        vesselScheduleColor('vesselSchedule', 6);
        dateAbbrev_Format2('vesselSchedule', 6);
        dateAbbrev_Format2('vesselSchedule', 7);
        validateSearchModal('vesselSearchbtn', 'vesselSearchtext', 'vesselSearchDropdown');
    });

    function showSearchFields() {
        $.ajax({
            url: 'loadVesselScheduleSearch',
            type: 'POST',
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
                /*window.location.href = '#sixth';*/
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    }

</script>
</sec:authorize>