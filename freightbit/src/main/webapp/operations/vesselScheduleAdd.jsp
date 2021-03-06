<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Vessel Schedule </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Operations</li>
            <li class="active"><a href="<s:url action='../operations/viewVesselSchedules'/>"> Vessel Schedules </a></li>
            <li class="active"> Add Vessel Schedule</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-pencil"></i> Add Vessel Schedule</span>
            </div>

            <div class="panel-body">

                <s:form cssClass="form-horizontal vesselScheduleForm" theme="bootstrap" action="addVesselSchedule">
                <s:hidden value="%{vesselSchedule.vesselScheduleId}" name="vesselSchedule.vesselScheduleId"/>
                <%--<s:hidden value="%{vesselSchedule.createdBy}" name="vesselSchedule.createdBy"/>--%>
                <%--<s:hidden value="%{vesselSchedule.createdTimestamp}" name="vesselSchedule.createdTimestamp"/>--%>
                <div class="form-group">
                    <label for="vesselSchedule.voyageNumber" class="col-lg-2 control-label" style="padding-top:0px;">Voyage Number<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                        <s:textfield placeholder="Alphanumeric input only e.g. a-z, A-Z, 0-9" cssClass="form-control voyageNumber" required="true"
                                     name="vesselSchedule.voyageNumber" maxlength="10" title="Voyage Number will only accept alphanumeric input only e.g. a-z, A-Z, 0-9"
                                     pattern="[a-zA-Z0-9\-]+"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vesselSchedule.vendorId" class="col-lg-2 control-label" style="padding-top:0px;"> Vendor<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                        <s:select emptyOption="true" id="vendorId"
                                  value="%{vesselSchedule.vendorId}"
                                  name="vesselSchedule.vendorId"
                                  list="vendorList" listValue="vendorName" listKey="vendorId"
                                  cssClass="form-control vesselInput"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vesselSchedule.vesselName" class="col-sm-2 control-label" style="padding-top:0px;">Vessel Name:<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:select list="listVessel" name="vesselSchedule.vesselName"
                                      id="vesselList"
                                      listKey="vesselName" listValue="vesselName" cssClass="form-control vesselInput"
                                      emptyOption="true" value="%{vesselSchedule.vesselName}" required="true"></s:select>
                        </div>
                </div>

                <div class="form-group">
                    <label for="vesselSchedule.originPort" class="col-lg-2 control-label" style="padding-top:0px;">Origin Pier<span class="asterisk_red"></span></label>
                    <div class="col-lg-3">
                        <s:select emptyOption="true" id="vesselSchedule_originPort"
                                  value="vesselSchedule.originPort"
                                  name="vesselSchedule.originPort"
                                  list="portsList" listValue="value" listKey="key"
                                  cssClass="form-control vesselInput" />
                    </div>
                    <label for="vesselSchedule.destinationPort" class="col-lg-2 control-label" style="padding-top:0px;">Destination Pier<span class="asterisk_red"></span></label>
                    <div class="col-lg-3">
                        <s:select emptyOption="true" id="vesselSchedule_destinationPort"
                                  value="vesselSchedule.destinationPort"
                                  name="vesselSchedule.destinationPort"
                                  list="portsList" listValue="value" listKey="key"
                                  cssClass="form-control vesselInput" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="vesselSchedule.departureDate" class="col-lg-2 control-label" style="padding-top:0px;"> Departure Date<span class="asterisk_red"></span></label>
                    <div class="col-lg-3">
                        <s:textfield cssClass="form-control vesselInput departureDate" id="departureDate"
                                     name="vesselSchedule.departureDate" readonly="true" placeholder="Click here to set Departure Date"/>
                    </div>
                    <label for="vesselSchedule.arrivalDate" class="col-lg-2 control-label" style="padding-top:0px;">Arrival Date<span class="asterisk_red"></span></label>
                    <div class="col-lg-3">
                        <s:textfield cssClass="form-control vesselInput arrivalDate"
                                     id="arrivalDate"
                                     name="vesselSchedule.arrivalDate"
                                     readonly="true"
                                     placeholder="Click here to set Arrival Date" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="vesselSchedule.departureTime" class="col-lg-2 control-label" style="padding-top:0px;"> Departure Time<span class="asterisk_red"></span></label>
                    <div class="col-lg-3">
                        <s:textfield cssClass="form-control vesselInput" id="departureTime"
                                     name="vesselSchedule.departureTime" readonly="true" placeholder="Click here to set Departure Time"/>
                    </div>
                    <label for="vesselSchedule.arrivalTime" class="col-lg-2 control-label" style="padding-top:0px;"> Arrival Time<span class="asterisk_red"></span></label>
                    <div class="col-lg-3">
                        <s:textfield cssClass="form-control vesselInput" id="arrivalTime"
                                     name="vesselSchedule.arrivalTime"
                                     readonly="true"
                                     placeholder="Click here to set Arrival Time" />
                    </div>
                </div>

            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <button type="button" id="Cancel" class="btn btn-danger" data-toggle="modal" data-target="#cancelBooking">
                        Cancel
                    </button>
                    <%--<button class="btn btn-primary" name="submit" type="button" onclick="validateInputContent()">Save</button>--%>
                    <%--<s:submit cssClass="btn btn-primary submitBtn" name="submit" value="Save" disabled="true"/>--%>
                    <button class="btn btn-primary submitBtn" type="button" disabled>Save</button>
                    </s:form>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Cancel Vessel Schedule Modal -->
<div class="modal fade" id="cancelBooking" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
                <h4 class="modal-title" id="myModalLabel">Cancel Schedule</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel adding vessel schedule?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-danger" onclick="location.href='viewVesselSchedules'">Yes</button>
            </div>
        </div>
    </div>
</div>

<%-- MODAL FOR SAME DATE WARNING  -- START --%>
<div class="modal fade" id="dateWarningModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel" style="color: red"><i class="fa fa-warning"></i> WARNING</h4>
            </div>
            <div class="modal-body" id="dateWarningModalBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%-- MODAL FOR SAME DATE WARNING  -- END --%>

<script type="text/javascript">

    var departureDate = $('#departureDate');
    var arrivalDate = $('#arrivalDate');
    // departure date
    departureDate.datepicker({

        dateFormat: 'mm-dd-yy',
        minDate: 0,

        onClose: function(dateText, inst) {
            if (arrivalDate.val() != '') {
                var testStartDate = departureDate.datepicker('getDate');
                var testEndDate = departureDate.datepicker('getDate');

                if (testStartDate > testEndDate)
                    arrivalDate.datepicker('setDate', testStartDate);
            }
            else {
                arrivalDate.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            arrivalDate.datepicker('option', 'minDate', departureDate.datepicker('getDate') );
        }
    }

    );
    // arrival date
    arrivalDate.datepicker(
            {
        dateFormat: 'mm-dd-yy',
        minDate: 0,

        onClose: function(dateText, inst) {

            if (departureDate.val() != '') {
                var testStartDate = departureDate.datepicker('getDate');
                var testEndDate = arrivalDate.datepicker('getDate');

                if (testStartDate > testEndDate)
                    departureDate.datepicker('setDate', testEndDate);
            }

            else {
                departureDate.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            departureDate.datepicker('option', 'maxDate', arrivalDate.datepicker('getDate') );
        }
    });

    $('#arrivalTime').timepicker( {
        timeFormat: 'h:mm TT'
    });

    $('#departureTime').timepicker( {
        timeFormat: 'h:mm TT'
    });

    // Avoid selecting duplicate ports

    function preventDuplicatePort(select, index) {

        var options = select.options,
                len = options.length;

        while ( len-- ){
            options[ len ].disabled = false;
        }

        select.options[ index ].disabled = true;

        if( index === select.selectedIndex ){
            alert('You already selected the same port "' + select.options[index].text + '". Please choose another' );
            /*this.selectedIndex = 0;*/
            select2.value = '';
        }

    }

    var select1 = select = document.getElementById('vesselSchedule_originPort');
    var select2 = select = document.getElementById('vesselSchedule_destinationPort');

    select2.value = '';

    select1.onchange = function() {
        preventDuplicatePort.call(this, select2, this.selectedIndex);
    };

    select2.onchange = function() {
        preventDuplicatePort.call(this, select1, this.selectedIndex);
    };

    $(document).ready(function() {

        sameDateValidationInit();

        $('#vendorId').change(function(event) {
            var vendorId = $("#vendorId").val();

            $.getJSON('listVesselName', {
                        vendorId : vendorId
                    },

                    function(jsonResponse) {

                        var vessel = $('#vesselList');

                        vessel.find('option').remove();

                        $.each(jsonResponse.vesselMap, function(key, value) {
                            $('<option>').val(key).text(value).appendTo(vessel);
                        });

                    });
        });

        validationForm('vesselInput', 'submitBtn');
        restrictField_Numbers('inputNumbersOnly');
    });

</script>