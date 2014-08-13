<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Inland Freight Planning</h1>

    <div class="main-box">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <img src="images/add-user.png" class="box-icon">
                    <span class="panel-title">Inland Operation</span>
                </div>
                <div class="panel-body">

                    <form class="form-horizontal" role="form">

                        <div class="form-group">

                            <label for="booknum" class="col-sm-2 control-label">Booking Number:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="booknum" value="MTY-1035" disabled>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="vendor" class="col-sm-2 control-label">Vendor:</label>

                            <div class="col-sm-10">
                                <div style="width:90%;float:left;padding-right:10px;">
                                    <s:select list="vendorTruckingList" name="operationsBean.vendorList"
                                              id="operationsBean.vendorList"
                                              listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
                                </div>
                                <div style="width:5%;float:left;">
                                    <a href="#.html" class="icon-action-link">
                                        <img src="images/add-sched.png" class="icon-action circ-icon">
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="driver" class="col-sm-2 control-label">Driver:</label>

                            <div class="col-sm-10">
                                <div style="width:90%;float:left;padding-right:10px;">
                                    <select class="form-control" id="driver">
                                        <option>Driver 1</option>
                                        <option>Driver 2</option>
                                        <option>Driver 3</option>
                                    </select>
                                </div>
                                <div style="width:5%;float:left;">
                                    <a href="#.html" class="icon-action-link">
                                        <img src="images/add-sched.png" class="icon-action circ-icon">
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="truck" class="col-sm-2 control-label">Truck:</label>

                            <div class="col-sm-10">
                                <div style="width:90%;float:left;padding-right:10px;">
                                    <select class="form-control" id="truck">
                                        <option>Truck 1 - Plate Number 1</option>
                                        <option>Truck 2 - Plate Number 2</option>
                                        <option>Truck 3 - Plate Number 3</option>
                                    </select>
                                </div>
                                <div style="width:5%;float:left;">
                                    <a href="#.html" class="icon-action-link">
                                        <img src="images/add-sched.png" class="icon-action circ-icon">
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="pickup" class="col-sm-2 control-label">Pickup Date:</label>

                            <div class="col-sm-10">
                                <input type="text" class="from_date form-control step2" id="pickup" name="pickup" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;">
                            </div>

                        </div>

                        <div class="form-group">

                            <label for="dropoff" class="col-sm-2 control-label">Drop off Date:</label>

                            <div class="col-sm-10">
                                <input type="text" class="from_date form-control step2" id="dropoff" name="dropoff" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;">
                            </div>

                        </div>

                    </form>

                    <div style="float: right;">
                        <button class="btn btn-default" onclick="location.href='inland-operation.html'">Save</button>
                        <button class="btn btn-default" onclick="location.href='inland-operation.html'">Cancel</button>
                    </div>

                </div>

            </div>

        </div>


    </div>

    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="images/chat.png" class="box-icon">
                <span class="panel-title">Booking Information</span>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center">
                        <tbody>
                        <tr>
                            <td class="tb-font-black">Shipper</td>
                            <td class="tb-font-black">Solutions Resource</td>
                        </tr>
                        <tr>
                            <td class="tb-font-black">Consignee</td>
                            <td class="tb-font-black">Solutions Resource</td>
                        </tr>
                        <tr>
                            <td class="tb-font-black">Pick up Address</td>
                            <td class="tb-font-black">Luzon</td>
                        </tr>
                        <tr>
                            <td class="tb-font-black">Delivery Address</td>
                            <td class="tb-font-black">Davao</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

</div>
</div>

<script type="text/javascript">

        var pickup = $('#pickup');
        var dropoff = $('#dropoff');


        //pick up date validation
        pickup.datetimepicker({

            // on 5:00pm
            timeFormat: 'h:mm TT',
            minDate: 0,
            onClose: function(dateText, inst) {

                if (dropoff.val() != '') {
                    var testStartDate = pickup.datetimepicker('getDate');
                    var testEndDate = dropoff.datetimepicker('getDate');

                    if (testStartDate > testEndDate)
                        dropoff.datetimepicker('setDate', testStartDate);

                }

                else {
                    dropoff.val(dateText);
                }
            },

            onSelect: function (selectedDateTime){
                dropoff.datetimepicker('option', 'minDate', pickup.datetimepicker('getDate') );
            }

        });

        // delivery date validation -jp
        dropoff.datetimepicker({

            // on 6:00pm
            timeFormat: 'h:mm TT',
            minDate: 0,
            onClose: function(dateText, inst) {

                if (pickup.val() != '') {
                    var testStartDate = pickup.datetimepicker('getDate');
                    var testEndDate = dropoff.datetimepicker('getDate');

                    if (testStartDate > testEndDate)
                        pickup.datetimepicker('setDate', testEndDate);

                }

                else {
                    pickup.val(dateText);
                }
            },

            onSelect: function (selectedDateTime){
                pickup.datetimepicker('option', 'maxDate', dropoff.datetimepicker('getDate') );
            }

        });

</script>