<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<h1><i class="fa fa-truck"></i> Reports : Trucks</h1>
<hr/>
<div class="panel panel-primary">
    <div class="panel-heading">
        Truck Reports
    </div>
    <div class="panel-body">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
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

                </div>
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
