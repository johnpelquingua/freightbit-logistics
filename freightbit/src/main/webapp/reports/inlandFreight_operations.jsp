<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<head>
    <sj:head compressed='false'/>
    <style type="text/css">
        .divbox {
            height: 150px;
            width: 300px;
            padding: 20px;
            background-color: #FFFF66;

            /* outer shadows  (note the rgba is red, green, blue, alpha) */
            -webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);
            -moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);

            /* rounded corners */
            -webkit-border-radius: 12px;
            -moz-border-radius: 7px;
            border-radius: 7px;

        }

        .selection {
            width: 300px;
            height: 120px;

            margin-top: 20px;
            margin-bottom: 20px;

            /* rounded corners */
            -webkit-border-radius: 12px;
            -moz-border-radius: 7px;
            border-radius: 7px;

            /* outer shadows  (note the rgba is red, green, blue, alpha) */
            -webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);
            -moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);

        }


    </style>
    <script src="../main/js/jquery.js"></script>
</head>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


<br>
<!-- EDIT HERE -->

<div style="height:100%;" class="panel booking panel-info">
<div class="booking panel-heading">
    <img src="../includes/images/booking.png" class="box-icon">
    <span class="booking panel-title">Reports</span>
</div>
<div class="panel-body">

<div style="float:left;">
    <div style=" width:250px;float:left;margin-left:70px; ">
        <div id="FullTruckLoad" class="divbox" style="float:left">
            <center style="margin-top:-10px; margin-bottom:20px;">
                <h5><strong>Full Truck Load</strong><h5>
            </center>
            <img style="margin-left:75px; margin-top:-40px;" src="../includes/images/ftl.png">
        </div>

        <div id="RollingCargo" class="divbox" style="float:left; margin-bottom:20px; margin-top:20px;">
            <div style="margin-left:70px; padding-top:30px">
                <img src="../includes/images/booking.png" class="box-icon">
                <span><strong>Rolling Cargo</strong></span>
            </div>
        </div>

        <div id="LooseCargo" class="divbox" style="float:left">
            <div style="margin-left:70px; padding-top:30px">
                <img src="../includes/images/booking.png" class="box-icon">
                <span><strong>Loose Cargo</strong></span>
            </div>
        </div>
    </div>
</div>

<div style="float:left;">
    <div style=" width:250px;float:left;margin-left:70px; ">
        <div id="FullContainerLoad" class="divbox" style="float:left;">
            <div style="margin-left:70px; padding-top:30px">
                <img src="../includes/images/booking.png" class="box-icon">
                <span><strong>Full Container Load</strong></span>
            </div>
        </div>

        <div id="LessContainerLoad" class="divbox" style="float:left; margin-bottom:20px; margin-top:20px;">
            <div style="margin-left:70px; padding-top:30px">
                <img src="../includes/images/booking.png" class="box-icon">
                <span><strong>Less Container Load</strong></span>
            </div>
        </div>
    </div>
</div>

<div style="float:left;">
    <div style=" width:250px;;margin-left:70px; ">
        <div id="Sales" class="divbox" style="float:left">
            <center style="margin-top:-15px; margin-bottom:25px;">
                <h5><strong>Sales</strong><h5>
            </center>
            <img height="100" style="margin-left:80px; margin-top:-15px;" src="../includes/images/sales.png">
        </div>

        <div id="CustomerRelations" class="divbox" style="float:left; margin-bottom:20px; margin-top:20px;">
            <center style="margin-top:-10px; margin-bottom:20px;">
                <h5><strong>Customer Relation</strong><h5>
            </center>
            <img height="100" style="margin-left:80px; margin-top:-15px;" src="../includes/images/customer-relation.png">
        </div>

    </div>
</div>

<!-- report,transaction,statistics -->
<!-- FTL -->
<div class="menu2" id="FTL" style="display:none; height:200px; margin-top:-20px;">
    <h2 style="margin-left:10px;">Full Truck Load</h2> <a class="btn btn-default back"
                                                          style="float:left; margin-left:10px;" href="#">Back</a>
    <hr>
    <div class="selection" style=" background-color: #f1eb49;margin-left:10px; float:left">
        <div id="ftlsearchreport">
            <a href="FTL_Report" class="btn-group" style="margin-left:10px"><strong>view the latest reports</strong></a>
        </div>
    </div>
    <div class="selection" style="background-color: #6599FF; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Transactions</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #FF9900; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Statistics</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
</div>
<!-- RCargo -->
<div class="menu2" id="RCargo" style="display:none; height:200px; margin-top:-20px;">
    <h2 style="margin-left:10px;">Rolling Cargo</h2> <a class="btn btn-default back"
                                                        style="float:left; margin-left:10px;" href="#">Back</a>
    <hr>
    <div class="selection" style=" background-color: #f1eb49;margin-left:10px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Reports</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #6599FF; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Transactions</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #FF9900; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Statistics</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
</div>
<!-- LCargo -->
<div class="menu2" id="LCargo" style="display:none; height:200px; margin-top:-20px;">
    <h2 style="margin-left:10px;">Loose Cargo</h2> <a class="btn btn-default back" style="float:left; margin-left:10px;"
                                                      href="#">Back</a>
    <hr>
    <div class="selection" style=" background-color: #f1eb49;margin-left:10px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Reports</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #6599FF; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Transactions</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #FF9900; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Statistics</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
</div>
<!-- FCL -->
<div class="menu2" id="FCL" style="display:none; height:200px; margin-top:-20px;">
    <h2 style="margin-left:10px;">Full Container Load</h2> <a class="btn btn-default back"
                                                              style="float:left; margin-left:10px;" href="#">Back</a>
    <hr>
    <div class="selection" style=" background-color: #f1eb49;margin-left:10px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Reports</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #6599FF; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Transactions</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #FF9900; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Statistics</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
</div>
<!-- LCL -->
<div class="menu2" id="LCL" style="display:none; height:200px; margin-top:-20px;">
    <h2 style="margin-left:10px;">Less Container Load</h2> <a class="btn btn-default back"
                                                              style="float:left; margin-left:10px;" href="#">Back</a>
    <hr>
    <div class="selection" style=" background-color: #f1eb49;margin-left:10px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Reports</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #6599FF; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Transactions</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #FF9900; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Statistics</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
</div>
<!-- CR -->
<div class="menu2" id="CR" style="display:none; height:200px; margin-top:-20px;">
    <h2 style="margin-left:10px;">Customer Relations</h2> <a class="btn btn-default back"
                                                             style="float:left; margin-left:10px;" href="#">Back</a>
    <hr>
    <div class="selection" style=" background-color: #f1eb49;margin-left:10px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Reports</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #6599FF; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Transactions</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #FF9900; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Statistics</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
</div>
<!-- Sales -->
<div style="display:none; height:200px; margin-top:-20px;" id="Sale" class="menu2">
    <h2 style="margin-left:10px;">Sales</h2> <a class="btn btn-default back" style="float:left; margin-left:10px;"
                                                href="#">Back</a>
    <hr>
    <div class="selection" style=" background-color: #f1eb49;margin-left:10px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Reports</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #6599FF; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Transactions</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
    <div class="selection" style="background-color: #FF9900; margin-left:20px; float:left">
        <div style="margin-left:10px; padding-top:15px">
            <img src="../includes/images/booking.png" class="box-icon">
            <span><strong>Statistics</strong></span>
            <hr>
            <a href="FTL_Report" class="btn btn-default">View the latest reports</a>
            <hr>
            <strong>Search:</strong> <sj:datepicker cssClass="input input-default"/>
        </div>
    </div>
</div>
<!-- end -->

</div>

</div>
<!-- END OF EDIT -->

</div>

<script src="./jquery.js"></script>
<script>

    $('#FullTruckLoad').click(function () {
        $('.divbox').slideToggle('fast', function () {
            $('#FTL').animate({ "opacity": "show"});
        });

    });

    $('#RollingCargo').click(function () {
        $('.divbox').slideToggle('fast', function () {
            $('#RCargo').animate({ "opacity": "show"});
        });

    });

    $('#LooseCargo').click(function () {
        $('.divbox').slideToggle('fast', function () {
            $('#LCargo').animate({ "opacity": "show"});
        });

    });

    $('#FullContainerLoad').click(function () {
        $('.divbox').slideToggle('fast', function () {
            $('#FCL').animate({ "opacity": "show"});
        });

    });


    $('#LessContainerLoad').click(function () {
        $('.divbox').slideToggle('fast', function () {
            $('#LCL').animate({ "opacity": "show"});
        });

    });

    $('#CustomerRelations').click(function () {
        $('.divbox').slideToggle('fast', function () {
            $('#CR').animate({ "opacity": "show"});
        });

    });

    $('#Sales').click(function () {
        $('.divbox').slideToggle('fast', function () {
            $('#Sale ').animate({ "opacity": "show"});
        });

    });
    $('.back').click(function () {

        $('.menu2').slideUp('fast', function () {
            $('.divbox').slideDown('fast');

        });

    });

    <!-- search buttons -->
    $('#ftlsearchreport').click(function () {
        $('#ftlsearchreport').fadeOut('fast', function () {
            $('#ftlreportdatepicker').slideToggle('fast');
        });
    });

    $('#cancel').click(function () {
        $('#ftlsearchreport').slideToggle('fast');
        $('#ftlreportdatepicker').fadeOut('fast');
    });
</script>
