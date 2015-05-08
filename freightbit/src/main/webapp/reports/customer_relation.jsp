<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<h1><i class="fa fa-clipboard"></i> Reports : Customer Relations</h1>
<hr/>
<div class="panel panel-primary">
    <div class="panel-heading">
        Customer Relations Report
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

                        <div class="form-group">
                            <label class="col-lg-1 control-label">Data :</label>
                            <div class="col-lg-6">
                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                          id="dataIdStat" list="statisticsList" listKey="key"
                                          listValue="value" name="dataParam" emptyOption="true" required="true" />

                            </div>
                            <label class="col-lg-2 control-label">Date From :</label>
                            <div class="col-lg-2">
                                <s:textfield required="true" name="dateFromParam" cssClass="form-control" id="dateFromIdStat"/>
                                <script>
                                    $(function () {
                                        var dateFromStat = $('#dateFromIdStat');
                                        dateFromStat.datepicker({
                                            minDate: 0
                                        });
                                    });
                                </script>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-9 control-label">Date To :</label>
                            <div class="col-lg-2">
                                <s:textfield required="true" name="dateToParam" cssClass="form-control" id="dateToIdStat"/>
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

                        <div class="form-group">
                            <label class="col-lg-1 control-label">Data :</label>
                            <div class="col-lg-6">
                                <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                          id="dataIdReports" list="reportsList" listKey="key"
                                          listValue="value" name="dataParam" emptyOption="true" required="true" />

                            </div>
                            <label class="col-lg-2 control-label">Date From :</label>
                            <div class="col-lg-2">
                                <s:textfield required="true" name="dateFromParam" cssClass="form-control" id="dateFromIdReports"/>
                                <script>
                                    $(function () {
                                        var dateFromReports = $('#dateFromIdReports');
                                        dateFromReports.datepicker({
                                            minDate: 0
                                        });
                                    });
                                </script>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-9 control-label">Date To :</label>
                            <div class="col-lg-2">
                                <s:textfield required="true" name="dateToParam" cssClass="form-control" id="dateToIdReports"/>
                                <script>
                                    $(function () {
                                        var dateToIdReports = $('#dateToIdReports');
                                        dateToIdReports.datepicker({
                                            minDate: 0
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    <%--</div>
                </div>--%>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        var randomScalingFactor = function(){ return Math.round(Math.random()*1000)};
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
        }
    })
</script>
