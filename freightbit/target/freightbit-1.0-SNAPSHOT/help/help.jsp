	<%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<!-- EDIT HERE -->
   <head>
      <sj:head compressed='true'/>
      <style>
        #menu1:hover ,#menu2:hover ,#menu3:hover ,#menu4:hover
        {
                background-color:#F5FAFA;

        }
        #helphome:hover,#browse:hover, #contact:hover
        {
            border-bottom: 2px #0099CC solid;
        }
        #info
        {
            display:none;
            position:absolute;
            height:70px;
            width:400px;
            top:-10px;
            left:1680px;
        }
      </style>
   </head>
<div style="height:1300px;" class="panel booking panel-info">
	<div class="booking panel-heading">
		<img src="includes/images/booking.png" class="box-icon">
		<span class="booking panel-title"><strong>Help Menu</strong></span>
	</div>
                <div class="panel-body">
        <div class="input-group">
          <div class="input-group-btn">
          <button id="searchbtn" type="button" class="btn btn-primary">Search</button>
          </div>
          <input id="searchtext" type="text" class="input-lg ">
           <img id="infoimg" src="includes/images/info-help.png" class="box-icon pull-right">
          <div id="info" class="alert alert-success pull-right">
          <strong>Ernest Logistics Application v1.0</strong><br>
          <strong>Ernest Logistics Application v1.0</strong>
          </div>

        </div>
<hr>
                                <ul class="nav nav-tabs nav-justified">
                                    <li class="active"><a id="helphome" href="#" ><strong>Home</strong></a></li>
                                    <li class="active" ><a id="browse"  href="#"><strong>Browse Help</strong></a></li>
                                    <li class="active" ><a id="contact" href="#"><strong>Contact Support</strong></a></li>
                                </ul>
<hr>
<!-- HOME MENU -->
 <div id="ernest" style="display:none"  class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading"><strong>Getting To Know Ernest</strong></div>
              <!-- List group -->
              <ul class="list-group">
                <li class="list-group-item"><strong><a href="#">The DashBoard</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Side Menu</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Searching</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Chatting</a></strong></li>
              </ul>
            </div>
 <div id="booking" style="display:none"  class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading"><strong>Booking And Operations</strong></div>
              <!-- List group -->
              <ul class="list-group">
                <li class="list-group-item"><strong><a href="#">Planning a shipment</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Booking a customer</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Select an operation</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Setting up origin and destination</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Setting up consolidated van</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Updating shipment status</a></strong></li>
              </ul>
            </div>
 <div id="user" style="display:none"  class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading"><strong>Customer, Vendor And Account</strong></div>
              <!-- List group -->
              <ul class="list-group">
                <li class="list-group-item"><strong><a href="#">Register new account</a></strong></li>
                <li class="list-group-item"><strong><a href="#">User types</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Account privacy</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Updating account</a></strong></li>
              </ul>
            </div>
<div id="reports" style="display:none"  class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading"><strong>Reports And Documentations</strong></div>
              <!-- List group -->
              <ul class="list-group">
                <li class="list-group-item"><strong><a href="#">The DashBoard</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Side Menu</a></strong></li>
                <li class="list-group-item"><strong><a href="#">Searching</a></strong></li>
                <li class="list-group-item">Porta ac consectetur ac</li>
                <li class="list-group-item">Vestibulum at eros</li>
              </ul>
            </div>
<!-- HOME -->
<div id="home">
    <div class="list-group">
      <a  style="border-bottom: 4px #51A5BA solid;" id="menu1" href="#" class="list-group-item">
        <br>
        <h3 class="list-group-item-heading">Getting To Know The Ernest</h3>
        <br>
        <p class="list-group-item-text"><strong>Learn how to use the application</strong></p>
        <br>
      </a>

      <a style="border-bottom: 4px #FE8402 solid;" id="menu2" href="#" class="list-group-item">
        <br>
        <h3 class="list-group-item-heading">Booking And Operations</h3>
         <br>
        <p class="list-group-item-text"><strong>Learn how to add bookings and view the ongoing operations</strong></p>
        <br><br>
      </a>

     <a style="border-bottom: 4px #41924B solid;" id="menu3" href="#" class="list-group-item">
        <br>
        <h3 class="list-group-item-heading">Customer, Vendor And Accounts</h3>
         <br>
        <p class="list-group-item-text"><strong>Learn how to manage any accounts and view the users list</strong></p>
        <br><br>
      </a>

      <a style="border-bottom: 4px #FFDE00 solid;"  id="menu4" href="#" class="list-group-item">
        <br>
        <h3 class="list-group-item-heading">Reports And Documentations</h3>
        <br>
        <p class="list-group-item-text"><strong>Review latest reports and documentations</strong></p>
        <br><br>
      </a>
    </div>
</div>
<!-- BROWSE -->
<div id="browse_div" style="position:absolute; width:90%; top:250px; left:1250px">
    <div  class="panel panel-info">
      <!-- Default panel contents -->
      <div class="panel-heading"><strong>Getting To Know Ernest</strong></div>
      <!-- List group -->
      <ul class="list-group">
        <li class="list-group-item"><strong><a href="#">The DashBoard</a></strong></li>
        <li class="list-group-item"><strong><a href="#">Side Menu</a></strong></li>
        <li class="list-group-item"><strong><a href="#">Searching</a></strong></li>
        <li class="list-group-item">Porta ac consectetur ac</li>
        <li class="list-group-item">Vestibulum at eros</li>
      </ul>
    </div>

    <div id="booking" class="panel panel-info">
      <!-- Default panel contents -->
      <div class="panel-heading"><strong>Booking And Operations</strong></div>
      <!-- List group -->
      <ul class="list-group">
        <li class="list-group-item">Cras justo odio</li>
        <li class="list-group-item">Dapibus ac facilisis in</li>
        <li class="list-group-item">Morbi leo risus</li>
        <li class="list-group-item">Porta ac consectetur ac</li>
        <li class="list-group-item">Vestibulum at eros</li>
      </ul>
    </div>

    <div id="user" class="panel panel-info">
      <!-- Default panel contents -->
      <div class="panel-heading"><strong>Customer, Vendor and Accounts</strong></div>
      <!-- List group -->
      <ul class="list-group">
        <li class="list-group-item">Cras justo odio</li>
        <li class="list-group-item">Dapibus ac facilisis in</li>
        <li class="list-group-item">Morbi leo risus</li>
        <li class="list-group-item">Porta ac consectetur ac</li>
        <li class="list-group-item">Vestibulum at eros</li>
      </ul>
    </div>

    <div style="absolute" id="report" class="panel panel-info">
      <!-- Default panel contents -->
      <div class="panel-heading"><strong>Reports And Documentation</strong></div>
      <!-- List group -->
      <ul class="list-group">
        <li class="list-group-item">Cras justo odio</li>
        <li class="list-group-item">Dapibus ac facilisis in</li>
        <li class="list-group-item">Morbi leo risus</li>
        <li class="list-group-item">Porta ac consectetur ac</li>
        <li class="list-group-item">Vestibulum at eros</li>
      </ul>
    </div>
</div>
<!-- CONTACT -->
<div id="contact_div" style="position:absolute; width:90%; top:250px; left:1250px">
    <div  class="panel panel-info">
      <!-- Default panel contents -->
      <div class="panel-heading"><strong>Contact Support</strong></div>
      <div class="panel-body">
        <span><h3>Contact Our Technical Support</h3></span><hr>
            <small>lfiahfelfiahflifhifhe</small>
        <hr>
        <span><h3>Email us</h3></span><hr>
            <small>lfiahfelfiahflifhifhe</small>
      </div>
    </div>
</div>
<!-- END -->

		<!-- END OF EDIT -->
        </div>
        </div>

		<!-- END OF THE MIDDLE -->

<script src="./jquery.js"></script>
<script>
$(document).ready(function(){
    $('#contact_div').hide();
    $('#browse_div').hide();
});
$('#browse').click(function(){

    if ($('#browse_div').css('left') === "1250px") {
           $('#home').fadeOut('fast');
            $('#ernest').fadeOut('fast');
            $('#booking').fadeOut('fast');
            $('#user').fadeOut('fast');
            $('#reports').fadeOut('fast');
           $('#contact_div').animate({"left":"1250px"},"slow",function(){
           $('#contact_div').css("display", "none");
           });

           $('#browse_div').animate({"opacity":"show","left":"-=1190px"},"slow");
           }
});

$('#helphome').click(function(){

           $('#home').fadeOut('fast');
            $('#ernest').fadeOut('fast');
            $('#booking').fadeOut('fast');
            $('#user').fadeOut('fast');
            $('#reports').fadeOut('fast');
           $('#browse_div').animate({"left":"1250px"},"slow",function(){
           $('#browse_div').css("display", "none");
           });

           $('#contact_div').animate({"left":"1250px"},"slow",function(){
           $('#contact_div').css("display", "none");
           });

           $('#home').fadeIn('fast');
});

$('#contact').click(function(){

       if ($('#contact_div').css('left') === "1250px")
        {

           $('#home').fadeOut('fast');
            $('#ernest').fadeOut('fast');
            $('#booking').fadeOut('fast');
            $('#user').fadeOut('fast');
            $('#reports').fadeOut('fast');
                 $('#home').fadeOut('fast');

                   $('#browse_div').animate({"left":"1250px"},"slow",function(){
                   $('#browse_div').css("display", "none");
                   });

                 $('#contact_div').animate({"opacity":"show","left":"-=1190px"},"slow");
       }
});

$('#infoimg').hover(function(){
   $('#info').animate({"opacity":"show","left":"680px"},"slow");
});

$('#infoimg').mouseout(function(){
   $('#info').animate({"opacity":"hide","left":"1680px"},"slow");
});

$('#menu1').click(function(){
   $('#home').fadeOut('fast');
    $('#ernest').slideToggle();
});

$('#menu2').click(function(){
   $('#home').fadeOut('fast');
    $('#booking').slideToggle();
});
$('#menu3').click(function(){
   $('#home').fadeOut('fast');
    $('#user').slideToggle();
});
$('#menu4').click(function(){
   $('#home').fadeOut('fast');
    $('#reports').slideToggle();
});
</script>