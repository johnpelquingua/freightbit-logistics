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
    <h2>Vendor Module</h2>
    <div class="panel-group" id="accordion-vendor">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-add">Adding a Vendor</a>
                </h4>
            </div>
            <div id="collapse-vendor-add" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\056_AddVendor.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To add a new vendor, click on new vendor in the vendor page. <br>
                        2.	You&#39;ll be redirected to the Add Vendor page. Fill in the required fields then click save. <br>
                        3.	A message will appear indicating the success in adding a vendor.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-edit">Editing Vendor Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-edit" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\057_EditVendor.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To edit a vendor&#39;s details, click on edit this vendor under the Actions. <br>
                        2.	You&#39;ll be redirected to the edit vendor page, update the current vendor details then click save. <br>
                        3.	You&#39;ll be redirected to the updated vendor profile and a success message will appear.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-delete">Deleting a Vendor</a>
                </h4>
            </div>
            <div id="collapse-vendor-delete" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\058_DeleteVendor.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
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
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-search">Searching for a Vendor</a>
                </h4>
            </div>
            <div id="collapse-vendor-search" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\059_SearchVendor.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To search for a vendor, click on the search vendor button in the vendor page.<br>
                        2.	A pop-up box will appear. Choose a search credential, type in the keyword then click search. <br>
                        3.	You will be redirected to a page containing the list of results matching your search.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info" id="vendor">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-view">Viewing Vendor Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-view" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\060_ViewVendorDetails.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To view a vendor&#39;s details, click on a vendor&#39;s corresponding view vendor info button under the actions column.<br>
                        2.	You&#39;ll be redirected to the vendor profile where you&#39;ll see the basic information of the vendor. <br>
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-viewVendorAddress">Viewing Vendor Addresses</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewVendorAddress" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\061_ViewVendorAddress.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To view the list of vendor addresses, navigate to the vendor profile and click address from the sidebar.<br>
                        2.	You&#39;ll be redirected to the address list page where you&#39;ll see the list of addresses a vendor has.<br>
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-addVendorAddress">Adding a Vendor Address</a>
                </h4>
            </div>
            <div id="collapse-vendor-addVendorAddress" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\077_AddVendorAddress.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	Navigate to the address list page (see Viewing Vendor Addresses).<br>
                        2.	Click on the new address button.<br>
                        3.	You&#39;ll be redirected to the add address page. Fill out the required fields then click save. Note:Saving will not proceed until required fields are filled up. <br>
                        4.	You&#39;ll return to the address list with the updated address list and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-editVendorAddress">Editing Vendor Address</a>
                </h4>
            </div>
            <div id="collapse-vendor-editVendorAddress" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\062_EditVendorAddress.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	Navigate to the address list page (see Viewing Vendor Addresses).<br>
                        2.	Click on the edit this vendor address button under the actions column.<br>
                        3.	You&#39;ll be redirected to the edit address page. Update the information then click save. Note: Saving will not proceed until all required fields are filled up. <br>
                        4.	You&#39;ll be redirected to the updated address list and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-deleteVendorAddress">Deleting a Vendor Address</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteVendorAddress" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\063_DeleteVendorAddress.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
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
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-viewContactPerson">Viewing list of Contact Persons</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewContactPerson" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\064_ViewListContactPerson.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To view the list of contact persons a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click contacts from the sidebar.<br>
                        2.	You&#39;ll be redirected to the contact persons list page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-addContactPerson">Adding a Contact Person</a>
                </h4>
            </div>
            <div id="collapse-vendor-addContactPerson" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\078_AddContactPerson.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To add a contact person, navigate to the contact person list page (see Viewing list of Contact Persons) and click new contact person button. <br>
                        2.	You&#39;ll be redirected to the add contact person page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-editContactPerson">Editing Contact Person Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editContactPerson" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\065_EditContactPerson.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To edit a contact person&#39;s details, navigate to the contact persons list page (see Viewing list of Contact Persons) then click edit this contact person button under the action column. <br>
                        2.	You&#39;ll be redirected to the edit contact person page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You&#39;ll be redirected to the updated contact persons list page and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-deleteContactPerson">Deleting a Contact Person</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteContactPerson" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\079_DeleteContactPerson.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
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
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-viewDrivers">Viewing list of Drivers</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewDrivers" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\067_ViewDriverList.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To view the list of drivers a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click drivers from the sidebar. <br>
                        2.	You&#39;ll be redirected to the drivers list page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-addDriver">Adding a Driver</a>
                </h4>
            </div>
            <div id="collapse-vendor-addDriver" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\068_AddDriver.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To add a driver, navigate to the driver list page (see Viewing list of Drivers) and click new driver button. <br>
                        2.	You&#39;ll be redirected to the add driver page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                        3.	You&#39;ll be redirected to the updated driver list page and a success message will be displayed on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-editDriver">Editing a Driver Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editDriver" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\069_EditDriver.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To edit a driver&#39;s details, navigate to the driver list page (see Viewing list of Drivers) then click edit this driver button under the action column. <br>
                        2.	You&#39;ll be redirected to the edit driver page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You&#39;ll be redirected to the updated driver list page and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-deleteDriver">Deleting a Driver</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteDriver" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\070_DeleteDriver.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
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
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-viewTruckInformation">Viewing Truck Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewTruckInformation" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\083_ViewingTruckDetails.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To view the list of trucks a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click trucks from the sidebar. <br>
                        2.	You&#39;ll be redirected to the trucks list page. <br>
                        3.	Click view truck info button under the action column. <br>
                        4.	You&#39;ll be redirected to the truck information page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-addingTruck">Adding a Truck</a>
                </h4>
            </div>
            <div id="collapse-vendor-addingTruck" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\071_AddTruck.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To add a truck, navigate to the trucks list page (see Viewing Truck Details, step 1-2) and click new truck button. <br>
                        2.	You&#39;ll be redirected to the add truck page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                        3.	You&#39;ll be redirected to the updated trucks list page and a success message will be displayed on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-editTruck">Editing Truck Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editTruck" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\072_EditTruck.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To edit a truck&#39;s details, navigate to the trucks list page (see Viewing Truck Details, step 1-2) then click edit truck button under the action column. <br>
                        2.	You&#39;ll be redirected to the edit truck page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You&#39;ll be redirected to the updated trucks information page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-deleteTruck">Deleting a Truck</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteTruck" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\073_DeleteTruck.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
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
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-viewVesselList">Viewing list of Vessels</a>
                </h4>
            </div>
            <div id="collapse-vendor-viewVesselList" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\074_ViewVesselList.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To view the list of vessels a vendor has, navigate to the vendor profile page (see Viewing Vendor Details) then click vessels from the sidebar. <br>
                        2.	You&#39;ll be redirected to the vessels list page.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-addingVessel">Adding a Vessel</a>
                </h4>
            </div>
            <div id="collapse-vendor-addingVessel" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\084_AddVessel.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To add a vessels, navigate to the vessels list page (see Viewing list of Vessels) and click new vessel button. <br>
                        2.	You&#39;ll be redirected to the add vessel page. Fill in the required fields then click save. Note: Adding will not proceed until all required fields are filled up. <br>
                        3.	You&#39;ll be redirected to the updated vessel list page and a success message will be displayed on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-editVessel">Editing Vessel Details</a>
                </h4>
            </div>
            <div id="collapse-vendor-editVessel" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\075_EditVessel.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To edit a vessel&#39;s details, navigate to the vessel list page (see Viewing list of Contact Persons) then click edit this vessel button under the action column. <br>
                        2.	You&#39;ll be redirected to the edit vessel page. Update the information then click save. Note: Required fields need to be filled up to continue saving. <br>
                        3.	You&#39;ll be redirected to the updated vessels list page and a success message will appear on top of the list.
                    </p>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-vendor" href="#collapse-vendor-deleteVessel">Deleting a Vessel</a>
                </h4>
            </div>
            <div id="collapse-vendor-deleteVessel" class="panel-collapse collapse">
                <%-- IMAGE HELP HERE--%>
                <div class="panel-body" style="background-color: #ff0000; width: 640px; height: 480px; margin:auto; padding:0px; !important">
                    <img src="..\help\images\076_DeleteVessel.gif"/>
                </div>
                <%-- END OF IMAGE HELP HERE--%>
                <div class="panel-body">
                    <p>
                        1.	To delete a vessel&#39;s details, navigate to the vessel list page (see Viewing list of Contact Persons) then click delete this vessel button under the action column. <br>
                        2.	A confirmation message will appear. Click ok to continue, otherwise click cancel. <br>
                        3.	A success message will appear and the vessels list is updated.
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>
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
