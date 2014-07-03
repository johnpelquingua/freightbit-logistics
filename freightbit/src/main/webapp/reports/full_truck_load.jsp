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
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY5btBzW_s-TajCW-arvjYbUJzVJTmen8&sensor=false"></script>
    <script>
        var map;
        var myCenter = new google.maps.LatLng(51.508742, -0.120850);

        function initialize() {
            var mapProp = {
                center: myCenter,
                zoom: 5,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

            google.maps.event.addListener(map, 'click', function (event) {
                placeMarker(event.latLng);
            });
        }

        function placeMarker(location) {
            var marker = new google.maps.Marker({
                position: location,
                map: map,
            });
            var infowindow = new google.maps.InfoWindow({
                content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
            });
            infowindow.open(map, marker);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>


</head>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- EDIT HERE -->

<div style="height:100%;" class="panel booking panel-info">
<div class="booking panel-heading">
    <img src="includes/images/booking.png" class="box-icon">
    <span class="booking panel-title"><strong>Full Truck Load</strong></span>
</div>

<div class="panel-body">

<ul class="nav nav-tabs nav-justified">
    <li class="active"><a id="reportmenu" href="#"><strong>Reports</strong></a></li>
    <li class="active"><a id="transactionmenu" href="#"><strong>Transaction</strong></a></li>
    <li class="active"><a id="statisticsmenu" href="#"><strong>Statistics</strong></a></li>
</ul>

<br>

<div id="div_report"> <!-- FTL REPORT -->
<div class="btn-group">
    <button id="recentlybooked" type="button" class="btn btn-default active">Recently Booked</button>
    <button id="bookingstoplan" type="button" class="btn btn-default">Bookings to plan</button>
    <button id="finishtrans" type="button" class="btn btn-default">Finished transaction</button>
    <sj:datepicker placeholder="Search by date" cssClass="btn btn-default"/>
</div>
<p></p>
<table id="tblrecentlybooked" class="table table-hover table-bordered text-center">
    <tr class="warning">
        <th class="tb-font-black">Booking No.</th>
        <th class="tb-font-black">Type</th>
        <th class="tb-font-black">First Name</th>
        <th class="tb-font-black">Last Name</th>
        <th class="tb-font-black">Origin</th>
        <th class="tb-font-black">Destination</th>
        <th class="tb-font-black">Date Booked</th>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/14/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/04/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/14/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/10/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Pier</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Pier to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/24/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/04/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
</table>
<!-- Recently Booked -->
<table id="tblbookingstoplan" style="display:none" class="table table-hover table-bordered text-center">
    <tr class="info">
        <th class="tb-font-black">Booking No.</th>
        <th class="tb-font-black">Type</th>
        <th class="tb-font-black">First Name</th>
        <th class="tb-font-black">Last Name</th>
        <th class="tb-font-black">Origin</th>
        <th class="tb-font-black">Destination</th>
        <th class="tb-font-black">Date Booked</th>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/14/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/04/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/14/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/10/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Pier</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Pier to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/24/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/04/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
</table>
<!-- BOOKINGS TO PLAN -->
<table id="tblfinishtrans" style="display:none" class="table table-hover table-bordered text-center">
    <tr class="success">
        <th class="tb-font-black">Booking No.</th>
        <th class="tb-font-black">Type</th>
        <th class="tb-font-black">First Name</th>
        <th class="tb-font-black">Last Name</th>
        <th class="tb-font-black">Origin</th>
        <th class="tb-font-black">Destination</th>
        <th class="tb-font-black">Date Booked</th>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/14/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/04/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/14/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/10/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Pier</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">511235</td>
        <td class="tb-font-black">Pier to Door</td>
        <td class="tb-font-black">Loui</td>
        <td class="tb-font-black">Bous</td>
        <td class="tb-font-black">Caloocan City</td>
        <td class="tb-font-black">Davao City</td>
        <td class="tb-font-black">04/24/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">5A135</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Elena</td>
        <td class="tb-font-black">Tonra</td>
        <td class="tb-font-black">Zamboanga City</td>
        <td class="tb-font-black">Manila</td>
        <td class="tb-font-black">02/04/14</td>
    </tr>
    <tr>
        <td class="tb-font-black">90015</td>
        <td class="tb-font-black">Door to Door</td>
        <td class="tb-font-black">Matty</td>
        <td class="tb-font-black">Smith</td>
        <td class="tb-font-black">Malabon City</td>
        <td class="tb-font-black">Olonggapo City</td>
        <td class="tb-font-black">06/08/14</td>
    </tr>
</table>
<!-- FINISHED TRANS -->
<hr>
<div class="btn-group">
    <button type="button" class="btn btn-default active">Weekly</button>
    <button type="button" class="btn btn-default">Monthly</button>
    <button type="button" class="btn btn-default">Annual</button>
</div>
<div id="chart_div" style="background-color:transparent; margin-left:-15px; width: 1100px; height: 500px;"></div>
<!-- LINE GRAPH -->
</div>
<!-- FTL REPORT END -->


<div style="display:none" id="div_transaction">    <!-- FTL TRANSACTION -->
    <div id="googleMap" style="width:1015px; height: 500px;"></div>
    <hr>
    <div class="btn-group">
        <button id="ongoingtrans" type="button" class="btn btn-default active"> Ongoing Transaction</button>
        <button id="completetrans" type="button" class="btn btn-default">Completed Transaction</button>
        <sj:datepicker placeholder="Search by date" cssClass="btn btn-default"/>
    </div>
    <p></p>
    <table id="tblongoingtrans" class=" table table-hover table-bordered text-center">
        <tr class="info">
            <th class="tb-font-black">Transaction No.</th>
            <th class="tb-font-black">Booking No.</th>
            <th class="tb-font-black">Customer ID.</th>
            <th class="tb-font-black">Type</th>
            <th class="tb-font-black">Origin</th>
            <th class="tb-font-black">Destination</th>
            <th class="tb-font-black">Date Booked</th>
        </tr>
        <tr>
            <td class="tb-font-black">511235</td>
            <td class="tb-font-black">JCV-134</td>
            <td class="tb-font-black">CUSTOMER-124325</td>
            <td class="tb-font-black">Door to Door</td>
            <td class="tb-font-black">Caloocan City</td>
            <td class="tb-font-black">Davao City</td>
            <td class="tb-font-black">04/14/14</td>
        </tr>
        <tr>
            <td class="tb-font-black">19A12675</td>
            <td class="tb-font-black">QCX-333</td>
            <td class="tb-font-black">CUSTOMER-124325</td>
            <td class="tb-font-black">Pier to Door</td>
            <td class="tb-font-black">Quezon City</td>
            <td class="tb-font-black">Ilocos Sur</td>
            <td class="tb-font-black">06/24/14</td>
        </tr>
    </table>
    <table style="display:none" id="tblcompletetrans" class="table table-hover table-bordered text-center">
        <tr class="success">
            <th class="tb-font-black">Transaction No.</th>
            <th class="tb-font-black">Booking No.</th>
            <th class="tb-font-black">Customer ID.</th>
            <th class="tb-font-black">Type</th>
            <th class="tb-font-black">Origin</th>
            <th class="tb-font-black">Destination</th>
            <th class="tb-font-black">Date Booked</th>
        </tr>
        <tr>
            <td class="tb-font-black">511235</td>
            <td class="tb-font-black">JCV-134</td>
            <td class="tb-font-black">CUSTOMER-124325</td>
            <td class="tb-font-black">Door to Door</td>
            <td class="tb-font-black">Caloocan City</td>
            <td class="tb-font-black">Davao City</td>
            <td class="tb-font-black">04/14/14</td>
        </tr>
        <tr>
            <td class="tb-font-black">19A12675</td>
            <td class="tb-font-black">QCX-333</td>
            <td class="tb-font-black">CUSTOMER-124325</td>
            <td class="tb-font-black">Pier to Door</td>
            <td class="tb-font-black">Quezon City</td>
            <td class="tb-font-black">Ilocos Sur</td>
            <td class="tb-font-black">06/24/14</td>
        </tr>
    </table>
</div>
<!--FTL TRANSACTION END -->


<div style="display:none" id="div_statistics"> <!-- FTL STATISTICS-->
</div>
<!--FTL STATISTICS END -->

<!-- END OF EDIT -->
</div>
</div>

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
    <!-- MENU REPORT,TRANS,STATS -->
</script>


<script><!--
FTLREPORT
JQuery -->

$('#bookingstoplan').click(function () {
    $('#tblfinishtrans').fadeOut();
    $('#tblrecentlybooked').fadeOut("fast", function () {
        $('#tblbookingstoplan').fadeIn("slow");
        $('#bookingstoplan').addClass("active");
        $("#recentlybooked").removeClass("active");
        $("#finishtrans").removeClass("active");
    });
});

$('#recentlybooked').click(function () {
    $('#tblfinishtrans').fadeOut();
    $('#tblbookingstoplan').fadeOut("fast", function () {
        $('#tblrecentlybooked').fadeIn("slow");
        $('#recentlybooked').addClass("active");
        $("#bookingstoplan").removeClass("active");
        $("#finishtrans").removeClass("active");
    });
});

$('#finishtrans').click(function () {
    $('#tblrecentlybooked').fadeOut();
    $('#tblbookingstoplan').fadeOut("fast", function () {
        $('#tblfinishtrans').fadeIn("slow");
        $('#finishtrans').addClass("active");
        $("#bookingstoplan").removeClass("active");
        $("#recentlybooked").removeClass("active");
    });
});
</script>
<script>
    google.load("visualization", "1", {packages: ["corechart"]});
    google.setOnLoadCallback(drawMonthlyTransactionFTL);

    function drawMonthlyTransactionFTL() {
        // Create and populate the data table.
        var data = google.visualization.arrayToDataTable([
            ['x', 'All Transaction' , 'Door to Door' , 'Door to Port', 'Port to Door', 'Port to Port'],
            ['Jan', 1, 3, 2, 5, 11],
            ['Feb', 12, 33, 2, 5, 31],
            ['March', 61, 6, 76, 75, 5],
            ['April', 17, 43, 27, 55, 8],
            ['May', 12, 23, 24, 85, 5],
            ['June', 61, 13, 24, 15, 85],
            ['July', 11, 23, 24, 25, 5],
            ['Aug', 12, 33, 24, 65, 5],
            ['Sept', 21, 33, 24, 55, 5],
            ['Oct', 15, 33, 14, 35, 25],
            ['Nov', 51, 33, 24, 51, 35],
            ['Dec', 31, 13, 14, 45, 51],
        ]);

        var options = {
            curveType: "function",
            vAxis: {maxValue: 100},
            vAxis: {minValue: 1},
            width: "990",
            height: "300"
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>
<!-- FTLREPORT JQuery END -->

<!-- FTLTRANS JQuery -->
<script>
    $('#ongoingtrans').click(function () {
        $('#tblcompletetrans').fadeOut("fast", function () {
            $('#tblongoingtrans').fadeIn("fast");
            $('#ongoingtrans').addClass("active");
            $('#completetrans').removeClass("active");
        });
    });

    $('#completetrans').click(function () {
        $('#tblongoingtrans').fadeOut("fast", function () {
            $('#tblcompletetrans').fadeIn("fast");
            $('#completetrans').addClass("active");
            $('#ongoingtrans').removeClass("active");
        });
    });
</script>
<!-- FTLTRANS JQuery  END-->