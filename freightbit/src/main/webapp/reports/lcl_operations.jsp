<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--<h1><i class="fa fa-clipboard"></i> Reports : Customer Relations</h1>
<hr/>--%>
<legend style="text-align: left;">
    <span >
       <h1><i class="fa fa-clipboard"></i> Reports : LCL Operations </h1>
    </span>
</legend>

<div class="panel panel-primary">
    <div class="panel-heading">
        LCL Operations Report
    </div>

    <!-- Nav tabs -->
    <ul class="nav nav-tabs center-text " role="tablist" style="clear:both;" id="navTabs">
        <li class="active col-md-6 zeroPadding" id="stat">
            <a href="#statTab" role="tab" data-toggle="tab">Statistics</a>
        </li>
        <li class="col-md-6 zeroPadding" id="report">
            <a href="#reportTab" role="tab" data-toggle="tab">Report</a>
        </li>
    </ul>

    <div class="tab-content" tabindex="-1">
        <div class="tab-pane fade in active" id="statTab">
            <div class="panel-body">
                <%--<div class="container">
                    <div class="row">--%>
                <%--<div class="col-md-9">
                    <select class="form-control" style="width: 50%">
                        <option value="YEARLY">Stats by Year</option>
                        <option value="MONTHLY">Stats by Month</option>
                        <option value="WEEKLY">Stats by Week</option>
                    </select>
                    <br/>
                    <canvas id="canvasWeekly" height="300" width="600"></canvas>
                </div>
                <div class="col-md-3" style="word-wrap: break-word; overflow-y: auto; max-height: 31em;">
                    <h3>Stats for 2015 - 2016</h3>
                    <hr/>
                    Lorem ipsum dolor sit amet, dicant iisque iracundia nam cu. Ei natum feugiat has, esse soluta quaeque per at, quidam singulis et mea. Quo nonumy aliquam phaedrum eu, diceret labores vis eu, eu pri dictas oportere. An vide oportere vim. At mundi prompta eam.
                </div>--%>
                <s:form cssClass="submitForm form-horizontal" theme="bootstrap" action="viewStatistics">
                    <div class="form-group">
                        <label class="col-lg-1 control-label" style="padding-top: 0px !important;">Data :</label>
                        <div class="col-lg-6">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      id="dataIdStat" list="LCL_statisticsList" listKey="key"
                                      listValue="value" name="dataParam" emptyOption="true" required="true" />

                        </div>
                        <label class="col-lg-2 control-label" style="padding-top: 0px !important;">Date From :</label>
                        <div class="col-lg-2">
                            <s:textfield required="true" name="dateFromParam" cssClass="dateFromClass form-control" id="dateFromIdStat"/>
                            <script>
                                $(function () {
                                    var dateFromStat = $('#dateFromIdStat');
                                    dateFromStat.datepicker({
                                    });
                                });
                            </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-9 control-label" style="padding-top: 0px !important;">Date To :</label>
                        <div class="col-lg-2">
                            <s:textfield required="true" name="dateToParam" cssClass="dateToClass form-control" id="dateToIdStat"/>
                            <script>
                                $(function () {
                                    var dateToIdStat = $('#dateToIdStat');
                                    dateToIdStat.datepicker({
                                        minDate: 0
                                    });
                                });
                            </script>
                        </div>
                    </div>
                <%--</div>
            </div>--%>
            </div>
            <div class="panel-footer">
                <div class="pull-right" style="margin-top: 15px;">
                    <a class="viewBtnStatistics btn btn-info" title="View Statistics" href="#"> <i class="fa fa-print"></i> View Statistics</a>
                </div>
            </div>
            </s:form>
        </div>

        <div class="tab-pane fade in" id="reportTab">
            <div class="panel-body">
                <%--<div class="container">
                    <div class="row">--%>
                <%--<div class="col-md-9">
                    <select class="form-control" style="width: 50%">
                        <option value="YEARLY">Stats by Year</option>
                        <option value="MONTHLY">Stats by Month</option>
                        <option value="WEEKLY">Stats by Week</option>
                    </select>
                    <br/>
                    <canvas id="canvasWeekly" height="300" width="600"></canvas>
                </div>
                <div class="col-md-3" style="word-wrap: break-word; overflow-y: auto; max-height: 31em;">
                    <h3>Stats for 2015 - 2016</h3>
                    <hr/>
                    Lorem ipsum dolor sit amet, dicant iisque iracundia nam cu. Ei natum feugiat has, esse soluta quaeque per at, quidam singulis et mea. Quo nonumy aliquam phaedrum eu, diceret labores vis eu, eu pri dictas oportere. An vide oportere vim. At mundi prompta eam.
                </div>--%>
                <s:form cssClass="form-horizontal" theme="bootstrap" action="viewReports">
                    <div class="form-group">
                        <label class="col-lg-1 control-label" style="padding-top: 0px !important;">Data :</label>
                        <div class="col-lg-6">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                      id="dataIdReports" list="reportsList" listKey="key"
                                      listValue="value" name="dataParam" emptyOption="true" required="true" />

                        </div>
                        <label class="col-lg-2 control-label" style="padding-top: 0px !important;">Date From :</label>
                        <div class="col-lg-2">
                            <s:textfield required="true" name="dateFromParam" cssClass="dateFromClass form-control" id="dateFromIdReports"/>
                            <script>
                                $(function () {
                                    var dateFromReports = $('#dateFromIdReports');
                                    dateFromReports.datepicker({
                                    });
                                });
                            </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-9 control-label" style="padding-top: 0px !important;">Date To :</label>
                        <div class="col-lg-2">
                            <s:textfield required="true" name="dateToParam" cssClass="dateToClass form-control" id="dateToIdReports"/>
                            <script>
                                $(function () {
                                    var dateToIdReports = $('#dateToIdReports');
                                    dateToIdReports.datepicker({
                                    });
                                });
                            </script>
                        </div>
                    </div>
                <%--</div>
            </div>--%>
            </div>
            <div class="panel-footer">
                <div class="pull-right" style="margin-top: 15px;">
                    <a class="viewBtnReports btn btn-info" title="View Reports" href="#"> <i class="fa fa-print"></i> View Reports</a>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        /*var randomScalingFactor = function(){ return Math.round(Math.random()*1000)};
         var lineChartData = {
         labels : ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"],
         datasets : [
         {
         label: "My First dataset",
         fillColor : "rgba(120,120,120,0.2)",
         strokeColor : "rgba(120,120,120,1)",
         pointColor : "rgba(120,120,120,1)",
         pointStrokeColor : "#fff",
         pointHighlightFill : "#fff",
         pointHighlightStroke : "rgba(220,220,220,1)",
         data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
         },
         //
         ]

         };

         window.onload = function(){
         var ctx = document.getElementById("canvasWeekly").getContext("2d");
         window.myLine = new Chart(ctx).Line(lineChartData, {
         responsive: true
         });
         }*/

        $('.viewBtnStatistics').click(function(){
            var dateFromVal = $('.dateFromClass').val(),
                    dateToVal = $('.dateToClass').val(),
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
//                submitForm.submit();
                generateStatistics();
                return true;
            }
        });

        $('.viewBtnReports').click(function(){
            var dateFromVal = $('.dateFromClass').val(),
                    dateToVal = $('.dateToClass').val(),
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
//                submitForm.submit();
                generateReports();
                return true;
            }
        });

    });

    //The code below is for Statistics Reports

    function generateStatistics() {
        var dataVal = $('#dataIdStat').val();
        var dateFromVal = $('#dateFromIdStat').val();
        var dateToVal = $('#dateToIdStat').val();

        <%------------------------------------------CUSTOMER RELATIONS-----------------------------------------------%>
        var win = window.open('reports/viewStatistics?dateFromParam=' + dateFromVal + '&dateToParam=' + dateToVal + '&dataParam=' + dataVal, 'totalBookings', 'width=910,height=800');
        win.onload = function () {
            if (dataVal == "TOTAL LCL BOOKINGS") {
                this.document.title = "Total LCL Bookings";
            }
        }
    }

    // The code below is for Document Reports

    function generateReports() {
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
    }

</script>
