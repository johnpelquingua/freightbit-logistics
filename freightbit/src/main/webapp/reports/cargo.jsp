	<%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

       <head>
          <sj:head compressed='false'/>
          <style type="text/css">
          </style>

           <script src="./jquery.js"></script>
           <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY5btBzW_s-TajCW-arvjYbUJzVJTmen8&sensor=false">
           </script>
<script>
function initialize()
{
var mapProp = {
  center:new google.maps.LatLng(14.5833,120.9667),
  zoom:15,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };


var map=new google.maps.Map(document.getElementById("googleMap")
  ,mapProp);

marker=new google.maps.Marker({

  position: new google.maps.LatLng(14.5833,120.9667),
  animation:google.maps.Animation.BOUNCE
  });

var infowindow = new google.maps.InfoWindow({
  content:"Hello World!"
  });
marker.setMap(map)
infowindow.open(map, marker);

}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

<script>

</script>
       </head>

               <div id="googleMap" style="width:1366px; height: 500px;"></div><br>

        <div style="height:100px; width:100px; margin-left:1000px;">

            <h1><a href="#" id="minimize">minimize</a></h1>
        </div>



