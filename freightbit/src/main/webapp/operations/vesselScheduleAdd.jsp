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
            <li class="active"><a href="<s:url action='../operations/viewVesselSchedules'/>"> Vessel Schedules </a></li>
            <li class="active"> Add Vessel Schedule</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
				<span class="panel-title"><i class="fa fa-plus"></i> Add Vessel Schedule</span>
            </div>

            <div class="panel-body">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addVesselSchedule">

                        <div class="form-group">

                            <label for="vesselSchedule.voyageNumber" class="col-lg-2 control-label" style="padding-top:0px;">Voyage Number</label>

                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" name="vesselSchedule.voyageNumber" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.vendorId" class="col-lg-2 control-label" style="padding-top:0px;"> Vendor</label>

                            <div class="col-lg-9">
                                <s:select emptyOption="true" id="vesselSchedule.vendorId"
                                          value="vvesselSchedule.vendorId"
                                          name="vesselSchedule.vendorId"
                                          list="vendorList" listValue="vendorName" listKey="vendorId"
                                          cssClass="form-control"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.departureDate" class="col-lg-2 control-label" style="padding-top:0px;"> Departure Date</label>

                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" id="departureDate" name="vesselSchedule.departureDate" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.departureTime" class="col-lg-2 control-label" style="padding-top:0px;"> Departure Time</label>

                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" id="departureTime" name="vesselSchedule.departureTime" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.arrivalDate" class="col-sm-2 control-label" style="padding-top:0px;">Arrival Date</label>

                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" id="arrivalDate" name="vesselSchedule.arrivalDate" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.arrivalTime" class="col-lg-2 control-label" style="padding-top:0px;"> Arrival Time</label>

                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" id="arrivalTime" name="vesselSchedule.arrivalTime" />
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.originPort" class="col-lg-2 control-label" style="padding-top:0px;">Origin Pier</label>

                            <div class="col-lg-9">
                                <s:select emptyOption="true" id="vesselSchedule_originPort"
                                          value="vesselSchedule.originPort"
                                          name="vesselSchedule.originPort"
                                          list="portsList" listValue="value" listKey="key"
                                          cssClass="form-control"/>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vesselSchedule.destinationPort" class="col-lg-2 control-label" style="padding-top:0px;">Destination Pier</label>

                            <div class="col-lg-9">
                                <s:select emptyOption="true" id="vesselSchedule_destinationPort"
                                          value="vesselSchedule.destinationPort"
                                          name="vesselSchedule.destinationPort"
                                          list="portsList" listValue="value" listKey="key"
                                          cssClass="form-control"/>
                            </div>

                        </div>

            </div>

            <div class="panel-footer">

                <div class="pull-right">
                    <button type="button" id="Cancel" class="btn" data-toggle="modal" data-target="#cancelBooking">
                        Cancel
                    </button>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                    </s:form>
                </div>

            </div>

        </div>

    </div>
</div><!-- /.row -->

<script type="text/javascript">

    var departureDate = $('#departureDate');
    var arrivalDate = $('#arrivalDate');
    // departure date
    departureDate.datepicker({

        dateFormat: 'yy-dd-mm',
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
        dateFormat: 'yy-dd-mm',
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


</script>