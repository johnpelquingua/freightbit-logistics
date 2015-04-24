<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>


<!-- EDIT HERE -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<title>HELP</title>
<div class="container">
    <h2>Booking Module</h2>
    <div class="panel-group" id="accordion-booking">

        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-search">Searching for a Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-search" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To search for a booking, click Booking on Main menu. <br>
                        2.	Click Search Booking. <br>
                        3.	Fill up all necessary information. <br>
                        4. Click Search.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-create">Create a Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-create" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To create a new booking, click Booking on Main Menu. <br>
                        2.	Click new booking. <br>
                        3.	Fill out all necessary information to create a new booking. All required fields are marked with an asterisk (*). <br>
                        4.	Click Next to proceed. <br>
                        5.	The booking summary page will be displayed.  From there, you can add items. <br>
                        6.	Click Save Booking to create a new booking.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-editContactInfo">Edit Contact Information</a>
                </h4>
            </div>
            <div id="collapse-booking-editContactInfo" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	On creating a new booking or editing an existing booking, you can edit the contact info by clicking the Edit Contact Info button. <br>
                        2.	A modal containing all the current contact information of the customer will appear. User shall fill up all necessary changes. <br>
                        3.	Click Save to finalize the changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-addContactPerson">Add Contact Person</a>
                </h4>
            </div>
            <div id="collapse-booking-addContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	In creating a new or editing an existing booking, user can add Contact Person by clicking the Add Contact Person button. <br>
                        2.	On the modal, the user needs to fill out all the necessary information to add a new Contact person. All required fields are marked with an asterisk (*) . <br>
                        3.	Click Save to create a new contact person.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-addAddress">Add Address</a>
                </h4>
            </div>
            <div id="collapse-booking-addAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	On creating a new or editing an existing booking, you can add a new Address by clicking the Add Address button. <br>
                        2.	On the modal, the user needs to fill out all the necessary information to add a new Address. All required fields are marked with an asterisk (*). <br>
                        3.	Click Save to create a new address.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-addConsignee">Add Consignee</a>
                </h4>
            </div>
            <div id="collapse-booking-addConsignee" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	On creating a new or editing an existing booking, user can add a new Consignee by clicking the Add Consignee button. <br>
                        2.	On the modal, user needs to fill out all the necessary information to add a new Consignee. All required fields are marked with an asterisk (*). <br>
                        3.	Click Save to create a new Consignee.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-addConsigneeContact">Add Contact person for Consignee</a>
                </h4>
            </div>
            <div id="collapse-booking-addConsigneeContact" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	On creating a new or editing an existing booking, user can add a new Contact Person for Consignee by clicking the Add Contact Person button. <br>
                        2.	On the modal, a user needs to fill out all the necessary information to add a new Consignee. All required fields are marked with an asterisk (*). <br>
                        3.	Click Save to create a new Contact Person for Consignee.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-addContainerFCL">Add Container (Full Container Load)</a>
                </h4>
            </div>
            <div id="collapse-booking-addContainerFCL" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	On second page of creating or editing a booking, you can add container to the list. <br>
                        2.	Fill up all necessary information to add container to the list. Required fields are marked with an asterisk (*). <br>
                        3.	Click Add Container to the List to finalize.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-addItemLCL">Add Item (Less Container Load)</a>
                </h4>
            </div>
            <div id="collapse-booking-addItemLCL" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	On the second page of creating or editing a booking, user can add an item to the list. <br>
                        2.	Fill up all necessary information to add container to the list. Required field are marked with an asterisk (*). <br>
                        3.	Click Add Item to List to finalize.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-edit">Edit Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-edit" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit booking, click Booking on Main Menu. <br>
                        2.	Click the Pencil Icon on Actions Column. <br>
                        3.	Fill up all necessary changes on first page. <br>
                        4.	Click Next to proceed to next page. <br>
                        5.	Click Save to finalize the changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-delete">Delete Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-delete" class="panel-collapse collapse">
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
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-view">View Booking Information</a>
                </h4>
            </div>
            <div id="collapse-booking-view" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view booking information, Click Booking on Main Menu. <br>
                        2.	Click the Information Icon on Actions Column. <br>
                        3.	You will be redirected to a page where you can see all the information about the booking.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-printForm">Print Booking Form</a>
                </h4>
            </div>
            <div id="collapse-booking-printForm" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To print booking form, Click Booking on Main Menu. <br>
                        2.	Click the Printer icon on Actions Column. <br>
                        3.	A new window will open to proceed with the printing.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-approve">Approve Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-approve" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To approve booking, Click Booking on Main Menu. <br>
                        2.	Click the Check icon on Actions Column. <br>
                        3.	A prompt will appear to confirm the process. <br>
                        4.	Click OK to approve booking.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-booking-cancel">Cancel Booking</a>
                </h4>
            </div>
            <div id="collapse-booking-cancel" class="panel-collapse collapse">
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

    </div>
</div>
<hr>
<div class="container">
    <h2>Operations Module</h2>
    <div class="panel-group" id="accordion-operations">
        <h3>Freight Plan</h3>
        <div class="panel-group" id="accordion-freightPlan">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-freightPlan-sortingOrders">Sorting Orders</a>
                    </h4>
                </div>
                <div id="collapse-operations-freightPlan-sortingOrders" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To sort for the order by its origin and destination, choose the name of the place under the Sort by Origin and Sort by Destination boxes then click sort. Note: sort by origin and sport by destination must be filled up in order to continue. <br>
                            2.	The page will reload and all sort results will be displayed. Note: Sort is classified based on service requirement namely FCL, LCL, LCU and RCU. Click on the service requirement tab to sort orders by service requirement.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-freightPlan-settingVesselSchedule">Setting Vessel Schedule</a>
                    </h4>
                </div>
                <div id="collapse-operations-freightPlan-settingVesselSchedule" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To set a vessel schedule, click the Set Vessel Schedule action under the actions column of the freight plan list. <br>
                            2.	You will be redirected to the Booking Information page. Choose container/s then click the Set Vessel Schedule button. Note: You can only select containers having a Planning 1 status. <br>
                            3.	Select a vessel schedule and click the set schedule button. <br>
                            4.	You will be redirected back to the Booking Information page and booking status will be changed to Planning 2.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-freightPlan-creatingFreightDocuments">Creating Freight Documents</a>
                    </h4>
                </div>
                <div id="collapse-operations-freightPlan-creatingFreightDocuments" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To create freight document/s, click the Set Vessel Schedule action under the actions column of the freight plan list (see Figure 6). <br>
                            2.	You will be redirected to the Booking Information page. Click the create freight document(s) button. <br>
                            3.	A success message will appear on top of the page and the document will be available under the Pending Documents of the Documentations module.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-freightPlan-consolidatingItems">Consolidating items</a>
                    </h4>
                </div>
                <div id="collapse-operations-freightPlan-consolidatingItems" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To consolidate items, navigate to the LCL by clicking the LCL tab. <br>
                            2.	Choose the items to be consolidated and click the consolidate button. Note: Only items with the same origin and destination may be checked. <br>
                            3.	A window will appear with the list of available schedules. Choose the schedule for the selected items and click the set vessel schedule. <br>
                            4.	The selected items’ statuses will be changed to on-going.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-freightPlan-directLoad">Direct Load</a>
                    </h4>
                </div>
                <div id="collapse-operations-freightPlan-directLoad" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To direct load an item, navigate to the LCL by clicking the LCL tab (see Figure 4). <br>
                            2.	Click on direct load button under actions column. <br>
                            3.	If the status of the item is Planning 1, you will need to set its vendor and shipping schedule (see Setting Vessel Schedule). <br>
                            4.	The status of the item will now be Planning 2.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-freightPlan-viewBoookingInformation">View Booking Information</a>
                    </h4>
                </div>
                <div id="collapse-operations-freightPlan-viewBoookingInformation" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To view booking information, click on the view booking information button under the actions column. <br>
                            2.	you will be redirected to the Booking Information page.
                        </p>
                    </div>
                </div>
            </div>

        </div>
        <h3>Dispatch Plan</h3>
        <div class="panel-group" id="accordion-dispatchPlan">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-sortingViaServicePorts">Sorting via Service Ports</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-sortingViaServicePorts" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To sort via service ports, choose the port under the sort by origin, sort by destination or sort by location (see Figure 3). <br>
                            2.	2.	The list you’re currently in will be updated accordingly.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-sortingViaRequirements">Sorting via Service Requirements</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-sortingViaRequirements" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To sort via service requirements, click on the tab of your desired service requirement. <br>
                            2.	Choose the port under the sort by origin or the sort by destination (see Figure 3). <br>
                            3.	The list you’re currently in will be updated accordingly.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-sortingViaTrucking">Sorting via Trucking</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-sortingViaTrucking" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To sort via trucking, click on the trucking tab (see Figure 4). <br>
                            2.	Choose the service requirement (see Figure 18). <br>
                            3.	Choose the port under sort by location (see Figure 3). <br>
                            4.	The list you’re currently in will be updated accordingly.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-viewBookingInformation">Viewing Booking Information</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-viewBookingInformation" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To view a booking information, click on the view booking information button under the actions column (see Figure 13). <br>
                            2.	you will be redirected to the Booking Information page.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-settingVendorSingleItem">Setting a Vendor(Single Item)</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-settingVendorSingleItem" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To set a vendor for a single item, click on the item’s checkbox then click the set vendor button (see Figure 22). <br>
                            2.	you will be redirected to the dispatch plan:origin page. Choose the vendor who’ll be picking up the order. <br>
                            3.	Set the pickup date then click save. <br>
                            4.	you will be redirected back to the booking information page, the status of the order will be set to planning 3 and a success message will appear.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-settingVendorMultipleItem">Setting a Vendor(Multiple Item)</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-settingVendorMultipleItem" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To set a vendor for multiple item, click on the item’s checkbox then click the set vendor button (see Figure 22). <br>
                            2.	you will be redirected to the dispatch plan page. Choose the vendor who’ll be picking up the order. <br>
                            3.	Set the pickup date then click save. <br>
                            4.	you will be redirected back to the booking information page, the status of the order will be set to planning 3 and a success message will appear (see Figure 25).
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-addingVendor">Adding a Vendor</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-addingVendor" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	Navigate to the dispatch plan page (follow Setting a Vendor). <br>
                            2.	Click the add vendor button. <br>
                            3.	A window will appear. Fill in the fields then click save. Note: Saving will not continue until required fields are filled up. <br>
                            4.	Vendor will now appear in the vendor drop down list.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-addDriver">Adding a Driver</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-addDriver" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	Navigate to the dispatch plan page (follow Setting a Vendor). <br>
                            2.	Click the add driver button. <br>
                            3.	A window will appear. Fill in the fields then click save. Note: Saving will not continue until required fields are filled up. <br>
                            4.	Driver will now appear in the driver drop down list.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-addingTruck">Adding a Truck</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-addingTruck" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	Navigate to the dispatch plan page (follow Setting a Vendor). <br>
                            2.	Click the add truck button. <br>
                            3.	A window will appear. Fill in the fields then click save. Note: Saving will not continue until required fields are filled up. <br>
                            4.	Truck will now appear in the driver drop down list.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-dispatchPlan-creatingInlandDocuments">Creating Inland Document(s)</a>
                    </h4>
                </div>
                <div id="collapse-operations-dispatchPlan-creatingInlandDocuments" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To create inland document/s, navigate to the dispatch plan page (follow Setting a Vendor). <br>
                            2.	Click create inland document(s) button. <br>
                            3.	A success message will appear and document will appear in documentations.
                        </p>
                    </div>
                </div>
            </div>

        </div>
        <h3>Vessel Schedule</h3>
        <div class="panel-group" id="accordion-vesselSchedule">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-vesselSchedule-search">Searching for a Vessel Schedule</a>
                    </h4>
                </div>
                <div id="collapse-operations-vesselSchedule-search" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To search for a vessel schedule, click on the search schedule button. <br>
                            2.	The search window will appear. Set the parameters of the search by selecting the criteria of the search and entering the keyword to be searched. <br>
                            3.	you will be redirected to the search results page.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-vesselSchedule-add">Adding a Vessel Schedule</a>
                    </h4>
                </div>
                <div id="collapse-operations-vesselSchedule-add" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To add a new vessel schedule, click on the new schedule button. <br>
                            2.	Fill up the form. Note: Adding will not proceed until required fields are filled up. <br>
                            3.	you will be redirected back to the updated list and a success message will appear.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-vesselSchedule-edit">Editing a Vessel Schedule</a>
                    </h4>
                </div>
                <div id="collapse-operations-vesselSchedule-edit" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To edit a vessel schedule, click the edit this vessel schedule button under the action column. <br>
                            2.	you will be redirected to the edit vessel page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                            3.	you will be redirected to the updated vessel schedules list page and a success message will appear on top of the list.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-vesselSchedule-delete">Deleting a Vessel Schedule</a>
                    </h4>
                </div>
                <div id="collapse-operations-vesselSchedule-delete" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To delete a vessel schedule, click on delete this vessel schedule under the actions column. <br>
                            2.	A confirmation message will appear. Click ok to continue, otherwise click cancel. <br>
                            3.	A success message will appear and the address list is updated.
                        </p>
                    </div>
                </div>
            </div>

        </div>
        <h3>Shipment Monitoring</h3>
        <div class="panel-group" id="accordion-shipmentMonitoring">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-shipmentMonitoring-searchBookingNumber">Searching for a Booking Number</a>
                    </h4>
                </div>
                <div id="collapse-operations-shipmentMonitoring-searchBookingNumber" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To search for a particular booking number, click on the search booking number button. <br>
                            2.	The search window will appear. Type in the keyword and click search. <br>
                            3.	you will be redirected to the search results page.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-shipmentMonitoring-setServiceComplete">Update Status(Set Service Complete)</a>
                    </h4>
                </div>
                <div id="collapse-operations-shipmentMonitoring-setServiceComplete" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To update an on-going booking to set service status, click the update status button of the booking under its actions column. <br>
                            2.	Choose the container from the container list by clicking its corresponding checkbox then click the set service complete button.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-operations-shipmentMonitoring-setStatus">Update Status(Set Status)</a>
                    </h4>
                </div>
                <div id="collapse-operations-shipmentMonitoring-setStatus" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>
                            1.	To update an on-going booking to specific status, click the update status button of the booking under its actions column. <br>
                            2.	Choose the container from the container list by clicking its corresponding checkbox then click the set status button. <br>
                            3.	you will be redirected to the container’s shipment history. Update the status by choosing the current status of the container under shipment update and setting the actual date/time of the status. <br>
                            4.	The status update will then be listed in the container’s shipment history and a success balloon will appear.
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<hr>
<div class="container">
    <h2>Customer Module</h2>
    <div class="panel-group" id="accordion-customer">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-add">Adding a new Customer</a>
                </h4>
            </div>
            <div id="collapse-customer-add" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To create a new customer, click Customer on the Main Menu. <br>
                        2.	Click New Customer. <br>
                        3.	Fill out all the necessary information to create a new costumer. All required fields are marked with an asterisk(*). <br>
                        4.	Click Save to create a new Customer.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-editCustomer">Editing Customer Information</a>
                </h4>
            </div>
            <div id="collapse-customer-editCustomer" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit a customer, click Customer on the Main Menu. <br>
                        2.	Click the Pencil icon on Actions column. <br>
                        3.	Update all necessary changes. <br>
                        4.	Click Save to apply all changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-deleteCustomer">Delete a Customer</a>
                </h4>
            </div>
            <div id="collapse-customer-deleteCustomer" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To delete a customer, click Customer on the Main Menu. <br>
                        2.	Click the Trash icon on Actions column. <br>
                        3.	A prompt will appear to confirm the deletion. <br>
                        4.	Click Ok to finalize deletion.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-viewCustomerInformation">Viewing Customer Information</a>
                </h4>
            </div>
            <div id="collapse-customer-viewCustomerInformation" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view customer information, click Customer on the Main Menu. <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-addCustomerAddress">Adding Address to a Customer</a>
                </h4>
            </div>
            <div id="collapse-customer-addCustomerAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add a new address to a customer, click Customer on the Main Menu. <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Address. <br>
                        5.	Click New Address <br>
                        6.	Complete the Add Address form. Required fields are marked with an asterisk (*). <br>
                        7.	Click Save to add a new address to customer.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-editAddress">Editing Customer Address</a>
                </h4>
            </div>
            <div id="collapse-customer-editAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit customer address, click Customer on the Main Menu. <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Address. <br>
                        5.	Click the Pencil icon on Actions column. <br>
                        6.	Update all necessary changes. <br>
                        7.	Click Save to apply all changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-deleteAddress">Deleting Customer Address</a>
                </h4>
            </div>
            <div id="collapse-customer-deleteAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To delete customer address, click Customer on the Main Menu. <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Address. <br>
                        5.	Click the Trash icon on Actions column. <br>
                        6.	A prompt will appear to confirm the deletion. <br>
                        7.	Click OK to finalize deletion.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-addingCustomerContactPerson">Adding a Contact Person to a Customer</a>
                </h4>
            </div>
            <div id="collapse-customer-addingCustomerContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add new contact person to customer, click Customer on the Main Menu. <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Contacts. <br>
                        5.	Click New Contact Person. <br>
                        6.	Fill up all necessary information to add new contact person to a customer. All required fields are marked with an asterisk (*). <br>
                        7.	Click Save to add new contact person to a customer.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-editCustomerContactPerson">Editing Customer Contact Person</a>
                </h4>
            </div>
            <div id="collapse-customer-editCustomerContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit customer contact person, click Customer on the Main Menu. <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Contacts. <br>
                        5.	Click the Pencil icon on Actions column. <br>
                        6.	Update all necessary changes. <br>
                        7.	Click Save to apply all changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-deleteCustomerContactPerson">Deleting Customer Contact Person</a>
                </h4>
            </div>
            <div id="collapse-customer-deleteCustomerContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To delete customer contact person, click Customer on the Main Menu.<br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Contacts. <br>
                        5.	Click The Trash icon on Actions column. <br>
                        6.	A prompt will appear to confirm the deletion. <br>
                        7.	Click OK to finalize deletion.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-addingCustomerItems">Adding Items to Customer</a>
                </h4>
            </div>
            <div id="collapse-customer-addingCustomerItems" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add new Item to a customer, click Customer on the Main Menu <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Items. <br>
                        5.	Click New Item. <br>
                        6.	Fill up all required fields to add new Item. Required fields are marked with an asterisk (*). <br>
                        7.	Click Save to add new contact person to a customer.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-editCustomerItem">Editing Customer Items</a>
                </h4>
            </div>
            <div id="collapse-customer-editCustomerItem" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit a customer item, click Customer on the Main Menu <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Items. <br>
                        5.	Click the Pencil icon on Actions column. <br>
                        6.	Update all necessary changes. <br>
                        7.	Click Save to apply all changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-deleteCustomerItem">Deleting Customer Items</a>
                </h4>
            </div>
            <div id="collapse-customer-deleteCustomerItem" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To delete a customer item, click Customer on the Main Menu <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Items. <br>
                        5.	Click The Trash icon on Actions column. <br>
                        6.	A prompt will appear to confirm the deletion. <br>
                        7.	Click OK to finalize deletion.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-addingCustomerConsignee">Adding Consignee to a Customer</a>
                </h4>
            </div>
            <div id="collapse-customer-addingCustomerConsignee" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add new consignee to customer, click Customer on the Main Menu <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Consignee. <br>
                        5.	Click New Consignee. <br>
                        6.	Fill up all necessary information to add new consignee to a customer. All required fields are marked with an asterisk (*).  <br>
                        7.	Click Save to add new consignee to a customer.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-editCustomerConsignee">Editing Customer Consignee</a>
                </h4>
            </div>
            <div id="collapse-customer-editCustomerConsignee" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit customer consignee, click Customer on the Main Menu <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Consignee. <br>
                        5.	Click the Pencil icon on the Actions column. <br>
                        6.	Update all necessary changes.  <br>
                        7.	Click Save to apply all changes.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-deleteCustomerConsignee">Deleting Customer Consignee</a>
                </h4>
            </div>
            <div id="collapse-customer-deleteCustomerConsignee" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To delete customer consignee, click Customer on the Main Menu <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Consignee. <br>
                        5.	Click The Trash icon on Actions column. <br>
                        6.	A prompt will appear to confirm the deletion.  <br>
                        7.	Click OK to accept the deletion.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-viewConsigneeInformation">View Consignee Information</a>
                </h4>
            </div>
            <div id="collapse-customer-viewConsigneeInformation" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view consignee information of a customer, click Customer on the Main Menu <br>
                        2.	Click the Information icon on Actions column. <br>
                        3.	The customer’s profile page will be displayed. <br>
                        4.	Click Consignee. <br>
                        5.	Click the Information icon on Actions column. <br>
                        6.	You will be redirected to a page where you can see all the information about the consignee.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-customer-search">Search customer</a>
                </h4>
            </div>
            <div id="collapse-customer-search" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To search for a customer, click Customer on Main Menu. <br>
                        2.	Click Search Customer. <br>
                        3.	Fill up all necessary information. <br>
                        4.	Click Search.
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>
<hr>
<div class="container">
    <h2>Vendor Module</h2>
    <div class="panel-group" id="accordion-vendor">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-add">Adding a Vendor</a>
                </h4>
            </div>
            <div id="collapse-vendor-add" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add a new vendor, click on new vendor in the vendor page. <br>
                        2.	You’ll be redirected to the Add Vendor page. Fill in the required fields then click save. <br>
                        3.	A message will appear indicating the success in adding a vendor.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-edit">Editing Vendor Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-edit" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit a vendor’s details, click on edit this vendor under the Actions. <br>
                        2.	You’ll be redirected to the edit vendor page, update the current vendor details then click save. <br>
                        3.	You’ll be redirected to the updated vendor profile and a success message will appear.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-delete">Deleting a Vendor</a>
                </h4>
            </div>
            <div id="collapse-vendor-delete" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To delete a vendor, click on delete this vendor under Actions.<br>
                        2.	A confirmation message will appear. Click ok to continue, otherwise click cancel. <br>
                        3.	A success message will appear.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-search">Searching for a Vendor</a>
                </h4>
            </div>
            <div id="collapse-vendor-search" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To search for a vendor, click on the search vendor button in the vendor page.<br>
                        2.	A pop-up box will appear. Choose a search credential, type in the keyword then click search. <br>
                        3.	You will be redirected to a page containing the list of results matching your search.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-view">Viewing Vendor Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-view" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view a vendor’s details, click on a vendor’s corresponding view vendor info button under the actions column.<br>
                        2.	You’ll be redirected to the vendor profile where you’ll see the basic information of the vendor. <br>
                        3.	You will be redirected to a page containing the list of results matching your search.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-viewVendorAddress">Viewing Vendor Addresses</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewVendorAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view the list of vendor addresses, navigate to the vendor profile and click address from the sidebar.<br>
                        2.	You’ll be redirected to the address list page where you’ll see the list of addresses a vendor has.<br>
                        3.	You will be redirected to a page containing the list of results matching your search.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-addVendorAddress">Adding a Vendor Address</a>
                </h4>
            </div>
            <div id="collapse-vendor-addVendorAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	Navigate to the address list page (see Viewing Vendor Addresses).<br>
                        2.	Click on the new address button.<br>
                        3.	You’ll be redirected to the add address page. Fill out the required fields then click save. Note:Saving will not proceed until required fields are filled up. <br>
                        4.	You’ll return to the address list with the updated address list and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-editVendorAddress">Editing Vendor Address</a>
                </h4>
            </div>
            <div id="collapse-vendor-editVendorAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	Navigate to the address list page (see Viewing Vendor Addresses).<br>
                        2.	Click on the edit this vendor address button under the actions column.<br>
                        3.	You’ll be redirected to the edit address page. Update the information then click save. Note: Saving will not proceed until all required fields are filled up. <br>
                        4.	You’ll be redirected to the updated address list and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-deleteVendorAddress">Deleting a Vendor Address</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteVendorAddress" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	Navigate to the address list page (see Viewing Vendor Addresses).<br>
                        2.	Click on delete this vendor address under the actions column.<br>
                        3.	A confirmation message will appear. Click ok to continue, otherwise click cancel. (see figure 8) <br>
                        4.	A success message will appear and the address list is updated.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-viewContactPerson">Viewing list of Contact Persons</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view the list of contact persons a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click contacts from the sidebar.<br>
                        2.	You’ll be redirected to the contact persons list page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-addContactPerson">Adding a Contact Person</a>
                </h4>
            </div>
            <div id="collapse-vendor-addContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add a contact person, navigate to the contact person list page (see Viewing list of Contact Persons) and click new contact person button. <br>
                        2.	You’ll be redirected to the add contact person page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                        3.	You’ll be redirected to the updated contact person list page and a success message will be displayed on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-editContactPerson">Editing Contact Person Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit a contact person’s details, navigate to the contact persons list page (see Viewing list of Contact Persons) then click edit this contact person button under the action column. <br>
                        2.	You’ll be redirected to the edit contact person page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You’ll be redirected to the updated contact persons list page and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-deleteContactPerson">Deleting a Contact Person</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteContactPerson" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	Navigate to the contact persons list page (see Viewing list of Contact Persons). <br>
                        2.	Click on delete this contact person under the actions column. <br>
                        3.	A confirmation message will appear. Click ok to continue, otherwise click cancel. (see figure 8) <br>
                        4.	A success message will appear and the address list is updated.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-viewDrivers">Viewing list of Drivers</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewDrivers" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view the list of drivers a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click drivers from the sidebar. <br>
                        2.	You’ll be redirected to the drivers list page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-addDriver">Adding a Driver</a>
                </h4>
            </div>
            <div id="collapse-vendor-addDriver" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add a driver, navigate to the driver list page (see Viewing list of Drivers) and click new driver button. <br>
                        2.	You’ll be redirected to the add driver page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                        3.	You’ll be redirected to the updated driver list page and a success message will be displayed on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-editDriver">Editing a Driver Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editDriver" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit a driver’s details, navigate to the driver list page (see Viewing list of Drivers) then click edit this driver button under the action column. <br>
                        2.	You’ll be redirected to the edit driver page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You’ll be redirected to the updated driver list page and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-deleteDriver">Deleting a Driver</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteDriver" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	Navigate to the driver list page (see Viewing list of Drivers). <br>
                        2.	Click on delete this driver under the actions column. <br>
                        3.	A confirmation message will appear. Click ok to continue, otherwise click cancel. (see figure 8) <br>
                        4.	A success message will appear and the drivers list is updated.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-viewTruckInformation">Viewing Truck Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewTruckInformation" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view the list of trucks a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click trucks from the sidebar. <br>
                        2.	You’ll be redirected to the trucks list page. <br>
                        3.	Click view truck info button under the action column. <br>
                        4.	You’ll be redirected to the truck information page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-addingTruck">Adding a Truck</a>
                </h4>
            </div>
            <div id="collapse-vendor-addingTruck" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add a truck, navigate to the trucks list page (see Viewing Truck Details, step 1-2) and click new truck button. <br>
                        2.	You’ll be redirected to the add truck page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                        3.	You’ll be redirected to the updated trucks list page and a success message will be displayed on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-editTruck">Editing Truck Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editTruck" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit a truck’s details, navigate to the trucks list page (see Viewing Truck Details, step 1-2) then click edit truck button under the action column. <br>
                        2.	You’ll be redirected to the edit truck page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You’ll be redirected to the updated trucks information page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-deleteTruck">Deleting a Truck</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteTruck" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	Navigate to the trucks list page (see Viewing Truck Details, step 1-2). <br>
                        2.	Click on delete truck under the actions column. <br>
                        3.	A confirmation message will appear. Click ok to continue, otherwise click cancel. <br>
                        4.	A success message will appear and the trucks list is updated.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-viewVesselList">Viewing list of Vessels</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewVesselList" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To view the list of vessels a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click vessels from the sidebar. <br>
                        2.	You’ll be redirected to the vessels list page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-addingVessel">Adding a Vessel</a>
                </h4>
            </div>
            <div id="collapse-vendor-addingVessel" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To add a vessels, navigate to the vessels list page (see Viewing list of Vessels) and click new vessel button. <br>
                        2.	You’ll be redirected to the add vessel page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                        3.	You’ll be redirected to the updated vessel list page and a success message will be displayed on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-editVessel">Editing Vessel Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editVessel" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To edit a vessel’s details, navigate to the vessel list page (see Viewing list of Contact Persons) then click edit this vessel button under the action column. <br>
                        2.	You’ll be redirected to the edit vessel page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You’ll be redirected to the updated vessels list page and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-vendor-deleteVessel">Deleting a Vessel</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteVessel" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>
                        1.	To delete a vessel’s details, navigate to the vessel list page (see Viewing list of Contact Persons) then click delete this vessel button under the action column. <br>
                        2.	A confirmation message will appear. Click ok to continue, otherwise click cancel. <br>
                        3.	A success message will appear and the vessels list is updated.
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>


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
