<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<head>
    <sj:head compressed='false'/>
    <style type="text/css">
        #reportmenu {
            border-bottom: 3px #FFCC00 solid;
        }

        #reportmenu:hover, #transactionmenu:hover, #statisticsmenu:hover {
            border-bottom: 3px #FFCC00 solid;
        }

    </style>
    <script src="../main/js/jquery.js"></script>
</head>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <!-- EDIT HERE -->

    <div style="height:100%;" class="panel booking panel-info">
        <div style="height:55px;" class="booking panel-heading">
            <img src="includes/images/booking.png" class="box-icon">
            <span id="FullContainerLoad" class="booking panel-title"><strong>Full Container Load</strong></span>
            <span id="LessContainerLoad" style="display:none" class="booking panel-title"><strong>Less Container
                Load</strong></span>
            <img id="containerNext" src="includes/images/right.png" height="25" class="box-icon"
                 style="margin-left:10px;"/>
        </div>

        <div class="panel-body">

            <ul class="nav nav-tabs nav-justified">
                <li class="active"><a id="reportmenu" href="#"><strong>Reports</strong></a></li>
                <li class="active"><a id="transactionmenu" href="#"><strong>Transaction</strong></a></li>
                <li class="active"><a id="statisticsmenu" href="#"><strong>Statistics</strong></a></li>
            </ul>
            <hr>

            <!-- FTL REPORT -->
            <div id="div_report">
                <strong>Search by date : </strong><sj:datepicker/>
                <hr>
                <table class="table table-striped table-bordered text-center" id="groups-list">
                    <thead>
                    <tr class="header_center">

                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    </tbody>
                </table>
                <!-- table -->
                <hr>
                <div id="chart_div" style="width: 1000px; height: 300px;"></div>
                <hr>
            </div>
            <!-- FTL REPORT END -->
            <!-- FTL TRANSACTION -->
            <div style="display:none" id="div_transaction">
                <strong>Search by date : </strong><sj:datepicker/>
                <hr>
                <table class="table table-striped table-bordered text-center" id="groups-list">
                    <thead>
                    <tr class="header_center">

                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    </tbody>
                </table>
                <!-- table -->
                <hr>
                <div id="calendar_basic" style="width: 1000px; height: 350px;"></div>
            </div>
            <!--FTL TRANSACTION END -->
            <!-- FTL STATISTICS-->
            <div style="display:none" id="div_statistics">
                <strong>Search by date : </strong><sj:datepicker/>
                <hr>
                <table class="table table-striped table-bordered text-center" id="groups-list">
                    <thead>
                    <tr class="header_center">

                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                        <th class="tb-font-black">Sample</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    <tr>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                        <td class="tb-font-black">Sample</td>
                    </tr>
                    </tbody>
                </table>
                <!-- table -->

                <hr>
            </div>
            <!--FTL STATISTICS END -->
            <!-- END OF EDIT -->
        </div>
        <script src="./jquery.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script>

            $('#transactionmenu').click(function () {
                $('#div_report').hide('fast');
                $('#div_statistics').hide('fast');
                $('#div_transaction').slideDown('fast');
                $('#reportmenu').css("border-bottom-color", "#ffffff");
                $('#statisticsmenu').css("border-bottom-color", "#ffffff");
                $('#transactionmenu').css("border-bottom-color", "#FFCC00");
            });

            $('#reportmenu').click(function () {
                $('#div_transaction').hide('fast');
                $('#div_statistics').hide('fast');
                $('#div_report').slideDown('fast');
                $('#transactionmenu').css("border-bottom-color", "#ffffff");
                $('#statisticsmenu').css("border-bottom-color", "#ffffff");
                $('#reportmenu').css("border-bottom-color", "#FFCC00");
            });

            $('#statisticsmenu').click(function () {
                $('#div_transaction').hide('fast');
                $('#div_report').hide('fast');
                $('#div_statistics').slideDown('fast');
                $('#reportmenu').css("border-bottom-color", "#ffffff");
                $('#transactionmenu').css("border-bottom-color", "#ffffff");
                $('#statisticsmenu').css("border-bottom-color", "#FFCC00");
            });

            $('#containerNext').click(function () {

                $('#FullContainerLoad').toggle("slide");
                $('#LessContainerLoad').toggle("slide");
            });
        </script>

        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Year', 'Sample1', 'Sample'],
                    ['2004', 1000, 400],
                    ['2005', 1170, 460],
                    ['2006', 660, 1120],
                    ['2007', 1030, 540]
                ]);

                var options = {
                    title: 'Company Performance'
                };

                var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
