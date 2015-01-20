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
                    <%--Has elitr legendos at, te qui vidit reprimique, eum mollis dolorum no. Vis cu vidit option partiendo. Nam quas civibus recteque at, te sea perpetua urbanitas. Quo dicta partem cotidieque ea, equidem accusata ne per, ex meis tempor petentium mel. Audire aperiam equidem ius et. Eos prompta reprehendunt ne, cum fabulas tacimates ne.--%>
                    <%--Ei usu commodo omittam. Te nihil ignota efficiendi vix, ne atqui delectus suavitate qui. Nostro mediocritatem usu te, eos et pertinax expetendis contentiones. Cu eam esse molestie comprehensam, debet detraxit mei in, no justo dolorem postulant sea. Mei epicuri probatus no, at vim ipsum possit pericula.--%>
                    <%--Ex vim facer veniam, et altera maiorum mei. Novum exerci latine nam ut. Mutat epicurei facilisi usu ut, illum noluisse eum ex, ne dicit omnium moderatius ius. Nec et vide modus saperet, per no ancillae eligendi conclusionemque. Has at agam vituperata, sale ipsum complectitur et vel, inimicus reprimique reformidans cu sit.--%>
                    <%--Omnis labitur no vim, vim semper accusamus in. Duo ex quod eripuit dissentiet, oportere tincidunt abhorreant ei sea. Id mea postea dolores deterruisset, ne sed audiam fastidii, no usu tibique perpetua ullamcorper. Sed equidem consequat eu, cu mazim viderer gloriatur ius.--%>
                </div>
            </div>
        </div>
    </div>
</div>


<%--<a href="#">--%>
<%--</a>--%>


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
//                {
//                    label: "##",
//                    fillColor : "rgba(151,187,205,0.2)",
//                    strokeColor : "rgba(151,187,205,1)",
//                    pointColor : "rgba(151,187,205,1)",
//                    pointStrokeColor : "#fff",
//                    pointHighlightFill : "#fff",
//                    pointHighlightStroke : "rgba(151,187,205,1)",
//                    data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
//                },
//                {
//                    label: "My Second dataset",
//                    fillColor : "rgba(10,0,220,0.2)",
//                    strokeColor : "rgba(10,0,220,1)",
//                    pointColor : "rgba(10,0,220,1)",
//                    pointStrokeColor : "#fff",
//                    pointHighlightFill : "#fff",
//                    pointHighlightStroke : "rgba(151,187,205,1)",
//                    data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
//                }
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
