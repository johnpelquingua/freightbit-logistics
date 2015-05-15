<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<legend style="text-align: left;">
    <span >
       <h1><i class="fa fa-clipboard"></i> Reports Module </h1>
    </span>
</legend>

<div class="panel panel-primary">

    <div class="panel-body">
        <div class="form-group">
            <%--<label class="col-lg-1 control-label" style="padding-top: 0px !important;">Data :</label>
            <div class="col-lg-6">
                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                          id="dataIdStat" list="statisticsList" listKey="key"
                          listValue="value" name="dataParam" emptyOption="true" required="true" />

            </div>--%>

            <div class="col-lg-12 container">
                <div class="well well-lg">
                    <div class="row">
                        <div class="col-lg-4">
                            Select Department
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      id="reportsDept" list="reportsDept" listKey="key"
                                      listValue="value" emptyOption="true"/>
                        </div>
                        <div class="col-lg-4">
                            Select (Reports/Statistics)
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      id="reportsType" list="reportsType" listKey="key"
                                      listValue="value" emptyOption="true" />
                        </div>
                        <div class="col-lg-4">
                            Data
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      id="reportsStatisticsList" list="reportsStatisticsList" listKey="key"
                                      listValue="value" name="dataParam" emptyOption="true" />
                        </div>

                        <div class="col-lg-4">
                            From
                            <s:textfield required="true" name="dateFromParam" cssClass="dateFromClass form-control" id="dateFromIdStat"/>
                            <script>
                                $(function () {
                                    var dateFromStat = $('#dateFromIdStat');
                                    dateFromStat.datepicker({
                                    });
                                });
                            </script>
                        </div>
                        <div class="col-lg-4">
                            To
                            <s:textfield required="true" name="dateToParam" cssClass="dateToClass form-control" id="dateToIdStat"/>
                            <script>
                                $(function () {
                                    var dateToIdStat = $('#dateToIdStat');
                                    dateToIdStat.datepicker({
                                    });
                                });
                            </script>
                        </div>

                    </div>
                </div>

                <div class="pull-right" style="margin-top: 15px;">
                    <a class="viewBtnReports btn btn-info" title="View Reports" href="#"> <i class="fa fa-print"></i> View Reports</a>
                </div>

            </div>

            <%--<div class="col-lg-12 container">
                <div class="well well-lg">
                    <div class="row">
                        <div id="reportDiv">
                        </div>
                    </div>
                </div>
            </div>--%>

            <%--<div class="col-lg-12 container">
                <div class="well well-lg">
                    <div class="row">
                        <div class="col-lg-2" style="padding-top: 7px;">
                            Department
                        </div>
                        <div class="col-lg-4">
                            <s:textfield cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2" style="padding-top: 7px;">
                            Service Type
                        </div>
                        <div class="col-lg-4">
                            <s:textfield cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2" style="padding-top: 7px;">
                            Type of Data
                        </div>
                        <div class="col-lg-4">
                            <s:textfield cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2" style="padding-top: 7px;">
                            Period From
                        </div>
                        <div class="col-lg-4">
                            <s:textfield cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2" style="padding-top: 7px;">
                            Period To
                        </div>
                        <div class="col-lg-4">
                            <s:textfield cssClass="form-control"/>
                        </div>
                    </div>
                </div>
            </div>--%>

        </div>
    </div>

</div>

<script>

    $(document).ready(function(){

        $('.viewBtnReports').click(function(){
            var dateFromVal = $('.dateFromClass').val(),
                dateToVal = $('.dateToClass').val(),
                dataVal = $('#reportsStatisticsList').val(),
                dateRegEx = /^(0[1-9]|1[012]|[1-9])[- /.](0[1-9]|[12][0-9]|3[01]|[1-9])[- /.](19|20)\d\d$/;

            if(dateFromVal.match(dateRegEx) === null){
                alert('ERROR! Date From input is not a valid date (MM/DD/YYYY)');
                return false;
            }
            else if(dateToVal.match(dateRegEx) === null){
                alert('ERROR! Date To input is not a valid date (MM/DD/YYYY)');
                return false;
            }
            else{
                /*$.ajax({
                    url: 'getReportAction',
                    async: false,
                    type: 'POST',
                    data: { dateFromParam: dateFromVal  ,dateToParam: dateToVal, dataParam: dataVal },
                    dataType: 'html',
                    success: function () {
                        window.open('reports/viewStatistics?dateFromParam=' + dateFromVal + '&dateToParam=' + dateToVal + '&dataParam=' + dataVal, 'totalBookings', 'width=910,height=800');
                    },
                    error: function(xhr, ajaxOptions, thrownError){
                        alert('An error occurred! ' + thrownError);
                    }
                });*/
                window.open('reports/viewStatistics?dateFromParam=' + dateFromVal + '&dateToParam=' + dateToVal + '&dataParam=' + dataVal, 'totalBookings', 'width=910,height=800');
                return true;
            }
        });

        /*function generateReports() {
            var dataVal = $('#dataIdReports').val();
            var dateFromVal = $('#dateFromIdReports').val();
            var dateToVal = $('#dateToIdReports').val();

            <%------------------------------------------CUSTOMER RELATIONS-----------------------------------------------%>
            var win = window.open('reports/viewReports?dateFromParam=' + dateFromVal + '&dateToParam=' + dateToVal + '&dataParam=' + dataVal, 'totalBookings', 'width=910,height=800');
            win.onload = function () {
                if (dataVal == "AVERAGE NUMBER OF BOOKINGS PER SHIPPER") {
                    this.document.title = "Average Number of Bookings per Shipper";
                }
                else if (dataVal == "AVERAGE NUMBER OF BOOKINGS PER CONSIGNEE") {
                    this.document.title = "Average Number of Bookings per Consignee";
                }
                else if (dataVal == "TOTAL CANCELLATION PERCENTAGE") {
                    this.document.title = "Total Cancellation Percentage";
                }
                else if (dataVal == "TOTAL CANCELLATION PERCENTAGE PER SHIPPER") {
                    this.document.title = "Total Cancellation Percentage per Shipper";
                }
                else if (dataVal == "AVERAGE CANCELLATION OF BOOKINGS") {
                    this.document.title = "Average Cancellation of Bookings";
                }
                else if (dataVal == "AVERAGE CUBIC METER (CBM) PER BOOKINGS") {
                    this.document.title = "Average Cubic Meter (CBM) per Bookings";
                }
                else if (dataVal == "AVERAGE CONTAINERS PER BOOKINGS") {
                    this.document.title = "Average Containers per Bookings";
                }
                else if (dataVal == "TOTAL NUMBER OF ON-TIME BOOKING") {
                    this.document.title = "Total Number of On-Time Booking";
                }
                else if (dataVal == "TOTAL NUMBER OF BOOKINGS BEYOND RDD") {
                    this.document.title = "Total Number of Bookings Beyond RDD";
                }
                else if (dataVal == "ARCHIVE OF BOOKINGS") {
                    this.document.title = "Archive of Bookings";
                }
            }
        }*/

        $('#reportsDept').change(function () {
            var deptName = $("#reportsDept").val(),
                typeName = $("#reportsType").val() ;

            if(typeName != ''){

                $.getJSON('deptTypeDataList', {
                    deptNameParam: deptName,
                    typeNameParam: typeName
                },

                function (jsonResponse) {
                    var reportsStatisticsList = $('#reportsStatisticsList');

                    reportsStatisticsList.find('option').remove();

                    $.each(jsonResponse.statReportMap, function (key, value) {
                        $('<option>').val(key).text(value).appendTo(reportsStatisticsList);
                    });

                    sortSelect(reportsStatisticsList, 'text', 'asc');

                });
            }

        });

        $('#reportsType').change(function () {
            var deptName = $("#reportsDept").val(),
                typeName = $("#reportsType").val() ;

            if(deptName != ''){

                $.getJSON('deptTypeDataList', {
                    deptNameParam: deptName,
                    typeNameParam: typeName
                },

                function (jsonResponse) {
                    var reportsStatisticsList = $('#reportsStatisticsList');

                    reportsStatisticsList.find('option').remove();

                    $.each(jsonResponse.statReportMap, function (key, value) {
                        $('<option>').val(key).text(value).appendTo(reportsStatisticsList);
                    });

                    sortSelect(reportsStatisticsList, 'text', 'asc');

                });
            }

        });

        var sortSelect = function (select, attr, order) {
            if(attr === 'text'){
                if(order === 'asc'){
                    $(select).html($(select).children('option').sort(function (x, y) {
                        return $(x).text().toUpperCase() < $(y).text().toUpperCase() ? -1 : 1;
                    }));
                    $(select).get(0).selectedIndex = 0;
                    e.preventDefault();
                }// end asc
                if(order === 'desc'){
                    $(select).html($(select).children('option').sort(function (y, x) {
                        return $(x).text().toUpperCase() < $(y).text().toUpperCase() ? -1 : 1;
                    }));
                    $(select).get(0).selectedIndex = 0;
                    e.preventDefault();
                }// end desc
            }
        };

    });

</script>