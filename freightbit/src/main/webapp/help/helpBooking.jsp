<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--<!-- EDIT HERE -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>--%>

<style>
    .panel-heading {
        color: white !important;
        text-shadow: 0 1px 1px #000;
        border-color: #eee;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        -webkit-box-shadow: 0 2px 3px rgba(0, 0, 0, 0.14), 0 0 0 1px rgba(0, 0, 0, 0.07);
        -moz-box-shadow: 0 2px 3px rgba(0, 0, 0, 0.14), 0 0 0 1px rgba(0, 0, 0, 0.07);
        box-shadow: 0 2px 3px rgba(0, 0, 0, 0.14), 0 0 0 1px rgba(0, 0, 0, 0.07);
        background: -moz-linear-gradient(top, #5d6167 0%, #393939 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #5d6167), color-stop(100%, #393939));
        background: -webkit-linear-gradient(top, #5d6167 0%, #393939 100%);
        background: -o-linear-gradient(top, #5d6167 0%, #393939 100%);
        background: -ms-linear-gradient(top, #5d6167 0%, #393939 100%);
    }
</style>
<title>Help Center</title>
<div class="container">
    <h2>Booking Module</h2>
    <div class="panel-group" id="accordion-booking">
    <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_CUSTOMER', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_FREIGHT_OPERATIONS_OFFICER', 'ROLE_SALES')">--%>
        <div class="panel panel-info" id="booking_search">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-search">Searching for a Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-search" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\001_SearchForBooking.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To search for a booking, click Booking > Active Bookings on Main menu. <br>
                        2.	Click the Search Booking button. <br>
                        3.	Fill up all criteria and keyword to search. <br>
                        4. Click Search.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_add">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-create">Create a Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-create" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\002_CreateABooking.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To create a new booking, click Booking > Active Bookings on Main Menu. <br>
                        2.	Click on New booking button. <br>
                        3.	Fill out all necessary information to create a new booking. All required fields are marked with an asterisk (*). <br>
                        4.	Click Next to proceed. <br>
                        5.	The booking summary page will be displayed.  From there, you can add items. <br>
                        6.	Add container/items then click the Save Booking button.<br>
                        7.  The Confirm Booking Details prompt will appear. Click Save to create booking.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_edit">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-edit">Edit Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-edit" class="panel-collapse collapse">
               <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\003_EditBooking.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To edit booking, click Booking on Main Menu. <br>
                        2.	Click the Pencil Icon on Actions Column. <br>
                        3.	Fill up all necessary changes on first page. <br>
                        4.	Click Next to proceed to next page. <br>
                        5.	The booking summary page will be displayed.  From there, you can add items. <br>
                        6.	Edit container/items then click the Save Booking button.<br>
                        7.  The Confirm Booking Details prompt will appear. Click Save to create booking.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_delete">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-delete">Delete Booking</a>
                </h4>
            </div>

            <div id="collapse-booking-delete" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\004_DeleteBooking.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To delete booking, click Booking on Main Menu <br>
                        2.	Click the Trash Icon on Actions Column. <br>
                        3.	A prompt will appear to confirm the deletion. <br>
                        4.	Click OK to finalize deletion.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_view">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-view">View Booking Information</a>
                </h4>
            </div>
            <div id="collapse-booking-view" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\005_ViewBookingInformation.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To view booking information, Click Booking on Main Menu. <br>
                        2.	Click the Information Icon on Actions Column. <br>
                        3.	You will be redirected to a page where you can see all the information about the booking.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_print">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-printForm">Print Booking Form</a>
                </h4>
            </div>
            <div id="collapse-booking-printForm" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\006_PrintBookingForm.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To print booking form, Click Booking on Main Menu. <br>
                        2.	Click the Printer icon on Actions Column. <br>
                        3.	A new window will open to proceed with the  <br>
                        4.  Find the Printer icon in the bottom right toolbar to print the booking form.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_approve">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-approve">Approve Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-approve" class="panel-collapse collapse">
               <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\007_ApproveBooking.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To approve booking, Click Booking on Main Menu. <br>
                        2.	Click the Check icon on Actions Column. <br>
                        3.	A prompt will appear to confirm the process. <br>
                        4.	Click OK to approve booking. The status of the booking will be updated to "APPROVED".
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_cancel">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-cancel">Cancel Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-cancel" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\008_CancelBooking.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p><p>
                    1.	To cancel booking, Click Booking on Main Menu. <br>
                    2.	Click the Cross icon on Actions Column. <br>
                    3.	A prompt will appear to confirm the process. <br>
                    4.	Click OK to cancel booking.
                </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_editContactInfo">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-editContactInfo">Edit Contact Information</a>
                </h4>
            </div>
            <div id="collapse-booking-editContactInfo" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\009_EditContactInformation.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	On creating a new booking or editing an existing booking, you can edit the contact info by clicking the Edit Contact Info button. <br>
                        2.	A modal containing all the current contact information of the customer will appear. User shall fill up all necessary changes. <br>
                        3.	Click Save to finalize the changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_addContactPerson">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-addContactPerson">Add Contact Person</a>
                </h4>
            </div>
            <div id="collapse-booking-addContactPerson" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\010_AddContactPerson.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	In creating a new or editing an existing booking, user can add Contact Person by clicking the Add Contact Person button. <br>
                        2.	On the modal, the user needs to fill out all the necessary information to add a new Contact person. All required fields are marked with an asterisk (*) . <br>
                        3.	Click Save to create a new contact person.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_addAddress">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-addAddress">Add Address</a>
                </h4>
            </div>
            <div id="collapse-booking-addAddress" class="panel-collapse collapse">
            <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\011_AddAddress.gif"/>
                </div>
            <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	On creating a new or editing an existing booking, you can add a new Address by clicking the Add Address button. <br>
                        2.	On the modal, the user needs to fill out all the necessary information to add a new Address. All required fields are marked with an asterisk (*). <br>
                        3.	Click Save to create a new address.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_addConsignee">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-addConsignee">Add Consignee</a>
                </h4>
            </div>
            <div id="collapse-booking-addConsignee" class="panel-collapse collapse">
                    <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\012_AddConsignee.gif"/>
                </div>
                    <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	On creating a new or editing an existing booking, user can add a new Consignee by clicking the Add Consignee button. <br>
                        2.	On the modal, user needs to fill out all the necessary information to add a new Consignee. All required fields are marked with an asterisk (*). <br>
                        3.	Click Save to create a new Consignee.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_addConsigneeContactPerson">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-addConsigneeContact">Add Contact person for Consignee</a>
                </h4>
            </div>
            <div id="collapse-booking-addConsigneeContact" class="panel-collapse collapse">
                    <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\013_AddContactPersonConsignee.gif"/>
                </div>
                    <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	On creating a new or editing an existing booking, user can add a new Contact Person for Consignee by clicking the Add Contact Person button. <br>
                        2.	On the modal, a user needs to fill out all the necessary information to add a new Consignee. All required fields are marked with an asterisk (*). <br>
                        3.	Click Save to create a new Contact Person for Consignee.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_addContainer">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-addContainerFCL">Add Container (Full Container Load)</a>
                </h4>
            </div>
            <div id="collapse-booking-addContainerFCL" class="panel-collapse collapse">
                    <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\014_AddContainerFCL.gif"/>
                </div>
                    <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	On second page of creating or editing a booking, you can add container to the list. <br>
                        2.	Fill up all necessary information to add container to the list. Required fields are marked with an asterisk (*). <br>
                        3.	Click Add Container to the List to finalize.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="booking_addItems">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-booking" href="#collapse-booking-addItemLCL">Add Item (Less Container Load)</a>
                </h4>
            </div>
            <div id="collapse-booking-addItemLCL" class="panel-collapse collapse">
                    <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\015_AddItemLCL.gif"/>
                </div>
                    <%-- END OF IMAGE HELP HERE--%>

                <div class="panel-body">
                    <p>
                        1.	On the second page of creating or editing a booking, user can add an item to the list. <br>
                        2.	Fill up all necessary information to add container to the list. Required field are marked with an asterisk (*). <br>
                        3.	Click Add Item to List to finalize.
                    </p>
                </div>
            </div>
        </div>
    <%--</sec:authorize>--%>
    </div>
</div>
<hr>
<script>

</script>


<%--
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

&lt;%&ndash;
<div style="height:1300px;" class="panel booking panel-info">
    <div class="booking panel-heading">
        <img src="../includes/images/booking.png" class="box-icon">
        <span class="booking panel-title"><strong>Help Menu</strong></span>
    </div>
    <div class="panel-body">
        <div class="input-group">
            <div class="input-group-btn">
                <button id="searchbtn" type="button" class="btn btn-primary">Search</button>
            </div>
            <input id="searchtext" type="text" class="input-lg ">
            <img id="infoimg" src="../includes/images/info-help.png" class="box-icon pull-right">
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
                    <span>
                        <h3>Contact Our Technical Support</h3>
                    </span>
                    <hr>
                    <small>lfiahfelfiahflifhifhe</small>
                    <hr>
                    <span>
                        <h3>Email us</h3>
                    </span>
                    <hr>
                    <small>lfiahfelfiahflifhifhe</small>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
&ndash;%&gt;

&lt;%&ndash;------------------------------------------------------------------------------------------------------------&ndash;%&gt;

<div class="row">
    <div class="col-lg-12">
        <h1>User Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-question"></i> Help</li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
<div class="col-lg-12">
<div class="panel panel-primary">
<div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-question"></i> Help</h3>
</div>
<div class="panel-body">
<div style="height:1000px;" class="panel booking panel-info">
<div class="booking panel-heading">
    <img src="../includes/images/booking.png" class="box-icon">
    <span class="booking panel-title"><strong>Help Menu</strong></span>
</div>
<div class="panel-body">
<div class="input-group">
    <div class="input-group-btn">
        <button id="searchbtn" type="button" class="btn btn-primary">Search</button>
    </div>
    <input id="searchtext" type="text" class="input-lg ">
    <img id="infoimg" src="../includes/images/info-help.png" class="box-icon pull-right">
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
        <li class="list-group-item"><strong><a href="#" id="dashboard">The DashBoard</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="side_menu">Side Menu</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="searching">Searching</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="chatting">Chatting</a></strong></li>
    </ul>
</div>
<div id="booking" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Booking And Operations</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong><a href="#" id="planning_ship">Planning a shipment</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="booking_custom">Booking a customer</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="select_op">Select an operation</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="setting_or">Setting up origin and destination</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="setting_cons">Setting up consolidated van</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="updating">Updating shipment status</a></strong></li>
    </ul>
</div>
<div id="user" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Customer, Vendor And Account</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong><a href="#" id="register">Register new account</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="user_types">User types</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="account_privacy">Account privacy</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="updating_account">Updating account</a></strong></li>
    </ul>
</div>
<div id="reports" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Reports And Documentations</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong><a href="#" id="a">Content 1</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="b">Content 2</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="c">Content 3</a></strong></li>
        <li class="list-group-item"><strong><a href="#" id="d">Content 4</a></strong></li>
    </ul>
</div>
<div id="dash" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>The Dashboard</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="side" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Side Menu</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="search" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Searching</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="chat" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Chatting</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="planShip" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Planning a Shipment</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="bookCust" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Booking a Customer</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="selectOpt" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Select an Operation</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="setOrigin" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Setting up Origin and Destination</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="setConso" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Setting up Consodilated Van</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="updateShip" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Updating Shipment Status</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="regNew" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Register New Account</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="userTypes" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>User Types</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="accPriv" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Account Privacy</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="updateAcc" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Updating Account</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="aa" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Content 1</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="bb" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Content 2</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="cc" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Content 3</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
    </ul>
</div>
<div id="dd" style="display:none"  class="panel panel-info">
    <!-- Default panel contents -->
    <div class="panel-heading"><strong>Content 4</strong></div>
    <!-- List group -->
    <ul class="list-group">
        <li class="list-group-item"><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></li>
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
<div id="browse_div" style="position:absolute; width:90%; top:250px; left:1500px">
    <div class="panel panel-info">
        <!-- Default panel contents -->
        <div class="panel-heading"><strong>Getting To Know Ernest</strong></div>
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item"><strong><a href="#" id="dashboard1">The DashBoard</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="side_menu1">Side Menu</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="searching1">Searching</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="chatting1">Chatting</a></strong></li>
        </ul>
    </div>
    <div class="panel panel-info">
        <!-- Default panel contents -->
        <div class="panel-heading"><strong>Booking And Operations</strong></div>
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item"><strong><a href="#" id="planning_ship1">Planning a shipment</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="booking_custom1">Booking a customer</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="select_op1">Select an operation</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="setting_or1">Setting up origin and destination</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="setting_cons1">Setting up consolidated van</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="updating1">Updating shipment status</a></strong></li>
        </ul>
    </div>
    <div class="panel panel-info">
        <!-- Default panel contents -->
        <div class="panel-heading"><strong>Customer, Vendor and Accounts</strong></div>
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item"><strong><a href="#" id="register1">Register new account</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="user_types1">User types</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="account_privacy1">Account privacy</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="updating_account1">Updating account</a></strong></li>
        </ul>
    </div>
    <div style="absolute" id="report" class="panel panel-info">
        <!-- Default panel contents -->
        <div class="panel-heading"><strong>Reports And Documentation</strong></div>
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item"><strong><a href="#" id="a1">Content 1</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="b1">Content 2</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="c1">Content 3</a></strong></li>
            <li class="list-group-item"><strong><a href="#" id="d1">Content 4</a></strong></li>
        </ul>
    </div>

</div>



<!-- CONTACT -->
<div id="contact_div" style="position:absolute; width:90%; top:250px; left:1500px">
    <div  class="panel panel-info">
        <!-- Default panel contents -->
        <div class="panel-heading"><strong>Contact Support</strong></div>
        <div class="panel-body">
									<span>
										<h3>Contact Our Technical Support</h3>
									</span>
            <hr>
            <small>lfiahfelfiahflifhifhe</small>
            <hr>
									<span>
										<h3>Email us</h3>
									</span>
            <hr>
            <small>lfiahfelfiahflifhifhe</small>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div><!-- /.row -->
&lt;%&ndash;------------------------------------------------------------------------------------------------------------&ndash;%&gt;
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
        $('#dash').fadeOut('fast');
        $('#search').fadeOut('fast');
        $('#side').fadeOut('fast');
        $('#chat').fadeOut('fast');
        $('#planShip').fadeOut('fast');
        $('#bookCust').fadeOut('fast');
        $('#selectOpt').fadeOut('fast');
        $('#setOrigin').fadeOut('fast');
        $('#setConso').fadeOut('fast');
        $('#updateShip').fadeOut('fast');
        $('#regNew').fadeOut('fast');
        $('#userTypes').fadeOut('fast');
        $('#accPriv').fadeOut('fast');
        $('#updateAcc').fadeOut('fast');
        $('#aa').fadeOut('fast');
        $('#bb').fadeOut('fast');
        $('#cc').fadeOut('fast');
        $('#dd').fadeOut('fast');
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
    $('#dash').fadeOut('fast');
    $('#search').fadeOut('fast');
    $('#side').fadeOut('fast');
    $('#chat').fadeOut('fast');
    $('#planShip').fadeOut('fast');
    $('#bookCust').fadeOut('fast');
    $('#selectOpt').fadeOut('fast');
    $('#setOrigin').fadeOut('fast');
    $('#setConso').fadeOut('fast');
    $('#updateShip').fadeOut('fast');
    $('#regNew').fadeOut('fast');
    $('#userTypes').fadeOut('fast');
    $('#accPriv').fadeOut('fast');
    $('#updateAcc').fadeOut('fast');
    $('#aa').fadeOut('fast');
    $('#bb').fadeOut('fast');
    $('#cc').fadeOut('fast');
    $('#dd').fadeOut('fast');
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
        $('#dash').fadeOut('fast');
        $('#search').fadeOut('fast');
        $('#side').fadeOut('fast');
        $('#chat').fadeOut('fast');
        $('#planShip').fadeOut('fast');
        $('#bookCust').fadeOut('fast');
        $('#selectOpt').fadeOut('fast');
        $('#setOrigin').fadeOut('fast');
        $('#setConso').fadeOut('fast');
        $('#updateShip').fadeOut('fast');
        $('#regNew').fadeOut('fast');
        $('#userTypes').fadeOut('fast');
        $('#accPriv').fadeOut('fast');
        $('#updateAcc').fadeOut('fast');
        $('#aa').fadeOut('fast');
        $('#bb').fadeOut('fast');
        $('#cc').fadeOut('fast');
        $('#dd').fadeOut('fast');
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

$('#dashboard').click(function(){
    $('#ernest').fadeOut('fast');
    $('#dash').slideToggle();
});
$('#dashboard1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#dash').slideToggle();
});
$('#searching').click(function(){
    $('#ernest').fadeOut('fast');
    $('#search').slideToggle();
});
$('#searching1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#search').slideToggle();
});
$('#side_menu').click(function(){
    $('#ernest').fadeOut('fast');
    $('#side').slideToggle();
});
$('#side_menu1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#side').slideToggle();
});
$('#chatting').click(function(){
    $('#ernest').fadeOut('fast');
    $('#chat').slideToggle();
});
$('#chatting1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#chat').slideToggle();
});
$('#planning_ship').click(function(){
    $('#booking').fadeOut('fast');
    $('#planShip').slideToggle();
});
$('#planning_ship1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#planShip').slideToggle();
});
$('#booking_custom').click(function(){
    $('#booking').fadeOut('fast');
    $('#bookCust').slideToggle();
});
$('#booking_custom1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#bookCust').slideToggle();
});
$('#select_op').click(function(){
    $('#booking').fadeOut('fast');
    $('#selectOpt').slideToggle();
});
$('#select_op1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#selectOpt').slideToggle();
});
$('#setting_or').click(function(){
    $('#booking').fadeOut('fast');
    $('#setOrigin').slideToggle();
});
$('#setting_or1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#setOrigin').slideToggle();
});
$('#setting_cons').click(function(){
    $('#booking').fadeOut('fast');
    $('#setConso').slideToggle();
});
$('#setting_cons1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#setConso').slideToggle();
});
$('#updating').click(function(){
    $('#booking').fadeOut('fast');
    $('#updateShip').slideToggle();
});
$('#updating1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#updateShip').slideToggle();
});
$('#register').click(function(){
    $('#user').fadeOut('fast');
    $('#regNew').slideToggle();
});
$('#register1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#regNew').slideToggle();
});
$('#user_types').click(function(){
    $('#user').fadeOut('fast');
    $('#userTypes').slideToggle();
});
$('#user_types1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#userTypes').slideToggle();
});
$('#account_privacy').click(function(){
    $('#user').fadeOut('fast');
    $('#accPriv').slideToggle();
});
$('#account_privacy1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#accPriv').slideToggle();
});
$('#updating_account').click(function(){
    $('#user').fadeOut('fast');
    $('#updateAcc').slideToggle();
});
$('#updating_account1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#updateAcc').slideToggle();
});
$('#a').click(function(){
    $('#reports').fadeOut('fast');
    $('#aa').slideToggle();
});
$('#a1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#aa').slideToggle();
});
$('#b').click(function(){
    $('#reports').fadeOut('fast');
    $('#bb').slideToggle();
});
$('#b1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#bb').slideToggle();
});
$('#c').click(function(){
    $('#reports').fadeOut('fast');
    $('#cc').slideToggle();
});
$('#c1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#cc').slideToggle();
});
$('#d').click(function(){
    $('#reports').fadeOut('fast');
    $('#dd').slideToggle();
});
$('#d1').click(function(){
    $('#browse_div').fadeOut('fast');
    $('#dd').slideToggle();
});


</script>
--%>
