<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<style>
    label {
        display: inline-block !important;
    }
    .checkbox{
        width: 15%;

    }
    label.checkbox {
        margin: 0 !important;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> Booking List </a></li>
            <li class="active"> New Booking</li>
        </ol>
        <%--<div id="ajaxResponse"></div>--%>
    </div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="panel panel-primary">
<div class="panel-heading">
     <i class="fa fa-book"></i>
    <span class="panel-title">Booking Information</span>
</div>
<div class="panel-body">

<div class="container">

    <div class="row setup-content" id="step-1">
        <div class="col-lg-12">

            <div class="col-lg-12 text-center">

                <div class="well">
                    <fieldset class="inputs">
                        <legend style="text-align: left;">
                            <span >
                                Basic Information
                            </span>
                        </legend>
                        <s:form action="addOrder" theme="bootstrap" cssClass="addOrderForm" >

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Freight Type<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="order_freightType"
                                          cssClass="basicInfoInput freightTypeField form-control bookingInput"
                                          style="margin-bottom: 15px !important;"
                                          name="order.freightType"
                                          list="freightTypeList"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                        />

                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 15px;">
                            <label class="col-lg-2 control-label">Service Requirement <span class="asterisk_red"></span> </label>

                            <div class="col-lg-10">

                                <s:select cssClass="basicInfoInput form-control bookingInput"
                                          style="margin-bottom: 15px !important;"
                                          name="order.serviceRequirement"
                                          list="serviceRequirementList"
                                          id="order_serviceRequirement"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Service Mode<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="order_modeOfService"
                                          cssClass="basicInfoInput serviceModeDropdown form-control bookingInput"
                                          style="margin-bottom: 15px !important;"
                                          name="order.modeOfService"
                                          list="modeOfServiceList"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                />

                            </div>
                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label">Customer Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="customerName"
                                          cssClass="basicInfoInput form-control bookingInput"
                                          style="margin-bottom: 15px !important;"
                                          name="order.customerId"
                                          list="customerList"
                                          listKey="customerId"
                                          listValue="customerName"
                                          emptyOption="true"
                                          required="true"
                                        />

                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Payment Mode<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="order_modeOfPayment"
                                          cssClass="basicInfoInput form-control bookingInput"
                                          style="margin-bottom: 15px !important;"
                                          name="order.modeOfPayment"
                                          list="modeOfPaymentList"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                />

                            </div>
                        </div>

                        <div class="form-group" style="clear: both;">

                            <label class="col-lg-3 control-label" style="margin-top: 5px;">Phone</label>
                            <div class="col-lg-3" >

                                <s:select cssClass="form-control"
                                          id="customerPhone"
                                          list="#{customerPhone}"
                                          value="%{customerPhone}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             id="customerPhone_textfield"
                                             disabled="true"
                                        />
                            </div>

                            <label class="col-lg-3 control-label" style="margin-top: 5px;">Mobile</label>
                            <div class="col-lg-3" >
                                <s:select cssClass="form-control"
                                          id="customerMobile"
                                          list="#{customerMobile}"
                                          value="%{customerMobile}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             id="customerMobile_textfield"
                                             disabled="true"
                                        />
                            </div>
                        </div>

                        <div class="form-group" style="padding-top: 25px; clear: both;">

                            <label class="col-lg-3 control-label" style="margin-top: 5px;">Email Address</label>
                            <div class="col-lg-3" >
                                <s:select cssClass="form-control"
                                          id="customerEmail"
                                          list="#{customerEmail}"
                                          value="%{customerEmail}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             id="customerEmail_textfield"
                                             disabled="true"
                                        />
                            </div>

                            <label class="col-lg-3 control-label" style="margin-top: 5px;">Fax</label>
                            <div class="col-lg-3" >
                                <s:select cssClass="form-control"
                                          id="customerFax"
                                          list="#{customerFax}"
                                          value="%{customerFax}"
                                          style="display:none"
                                        />
                                <s:textfield cssClass="form-control"
                                             id="customerFax_textfield"
                                             disabled="true"
                                        />
                            </div>

                        </div>

                        <div class="form-group" style="padding-top: 25px; clear: both;">
                            <div class="col-lg-2 col-lg-offset-10">
                                <div class="pull-right">
                                    <a data-toggle="modal" data-target="#editContactInfo" class="btn btn-info" id="id_Customer" style="width: 151px !important; margin-bottom: 5px;"> Edit Contact Info</a>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                </div>

                <legend style="text-align: left;">
                            <span >
                                Booking Information
                            </span>
                </legend>

                <div class="form-group">

                    <label class="pickupDateLabel col-lg-3 control-label" style="margin-top: 5px;">Pickup Date<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >
                        <input type="text" class="pickupDateInput from_date form-control" id="datepicker1" name="order.pickupDate" required="true" placeholder="Select Pickup date" contenteditable="false" style="margin-bottom: 15px !important;" readonly="true">
                    </div>

                    <label class="col-lg-3 control-label deliveryDateLabel" style="margin-top: 5px;">Delivery Date<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >
                        <input type="text" class="deliveryDateInput to_date form-control" id="datepicker2" name="order.deliveryDate" required="true" placeholder="Select Delivery date" contenteditable="false" style="margin-bottom: 15px !important;" readonly="true">
                    </div>

                </div>

                <div class="form-group">

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Origin Port<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >

                        <s:select cssClass="bookingInput form-control" style="margin-bottom: 15px !important;"
                                  id="select1" name="order.originationPort" list="portsList" listKey="key"
                                  listValue="value" required="true"/>

                    </div>

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Destination Port<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >

                        <s:select cssClass="bookingInput form-control" style="margin-bottom: 15px !important;"
                                  id="select2" name="order.destinationPort" list="portsList" listKey="key"
                                  listValue="value" required="true"/>

                    </div>

                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Notification Type<span class="asterisk_red"></span></label>

                    <div class="col-lg-9" style="text-align:left !important;">
                        <%--<s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                  name="order.notifyBy" list="notifyByList" listKey="key" listValue="value" id ="notification_type"/>--%>
                        <s:checkboxlist cssClass="notifBox" list="notifyByList" listKey="key" listValue="value" name="order.notifyBy" id="notifyBy" />

                    </div>

                </div>

                <div class="form-group">

                    <label class="col-lg-3 control-label" style="margin-top: 5px; clear:both;">Comments </label>

                    <div class="col-lg-9">
                        <s:textarea  name="order.comments" cssClass="form-control" cssStyle="resize: none; margin-bottom: 15px !important; height: 100px;" id="Comments"  maxLength="255"/>
                    </div>

                </div>


                <div id="2ndPartOnLoad" style="clear:both;">

                    <legend style="text-align: left;">
                            <span >
                                Customer Information </span>
                    </legend>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">

                                <s:select cssClass="bookingInput form-control" style="margin-bottom: 15px !important;" id="shipperContact" name="order.shipperContactId"
                                          list="contactsList" listKey="contactId" listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
                        </div>

                        <div class="col-lg-2">

                            <div class="pull-right">
                                <a data-toggle="modal" data-target="#createContact"  class="btn btn-info" id="idCustomer"> Add Contact Person</a>
                            </div>

                        </div>

                    </div>

                    <div class="form-group" style="clear: both;">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Address<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">
                            <s:select cssClass="bookingInput form-control addAddressItems" style="margin-bottom: 15px !important;" id="shipperAddress" name="order.shipperAddressId"
                                      list="addressList" listKey="addressId" listValue="addressLine1 + ' ' + addressLine2" required="true"/>
                        </div>

                        <div class="col-lg-2">

                            <div class="pull-right">
                                <a data-toggle="modal" data-target="#createAddress" class="addAddressItems btn btn-info" id="idAddress" style="width: 151px !important;"> Add Address</a>
                            </div>

                        </div>

                    </div>

                    <legend style="text-align: left;">
                            <span >
                                Consignee Information
                            </span>
                    </legend>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Consignee Name<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">
                            <s:select cssClass="bookingInput form-control" style="margin-bottom: 15px !important;" id="shipperConsignee" name="order.consigneeContactId"
                                      list="consigneeList" listKey="contactId"
                                      listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
                        </div>

                        <div class="col-lg-2">

                            <div class="pull-right">
                                <a data-toggle="modal" data-target="#createConsignee" class="btn btn-info" id="idConsignee" style="width: 151px !important;"> Add Consignee</a>
                            </div>

                        </div>

                    </div>

                    <div class="form-group" style="clear:both;">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Address</label>

                        <div class="col-lg-7">

                            <s:select cssClass="bookingInput form-control" style="margin-bottom: 15px !important; display:none;" name="order.consigneeAddressId" id="consigneeAddress"
                                      list="consigneeAddressList" listKey="addressId"
                                      listValue="addressLine1 + ' ' + addressLine2" required="true" />

                            <s:textfield cssClass="bookingInput form-control" style="margin-bottom: 15px !important;" id="consigneeAddress_textfield" readonly="true"/>

                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">

                            <s:select cssClass="bookingInput form-control" style="margin-bottom: 15px !important;" id="consigneeContact" name="order.consigneeContactPersonId"
                                      list="consigneeContactsList" listKey="contactId" listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
                        </div>

                        <div class="col-lg-2">

                            <div class="pull-right">
                                <a data-toggle="modal" data-target="#createConsigneeContact"  class="btn btn-info" id="id_Consignee"> Add Contact Person</a>
                            </div>

                        </div>

                    </div>

                <div style="clear: both;">

                </div>

                </div>

            </div>

        </div>
    </div>

</div>

</div>

<div class="panel-footer">

    <div class="pull-right">
        <button type="button" id="Cancel" class="btn btn-danger" data-toggle="modal" data-target="#cancelBooking">
            Cancel
        </button>

        <%--<s:submit name="submit" cssClass="btn btn-primary nextBtn" value="Next" />--%>
        <button class="btn btn-primary nextBtn" type="button">Next</button>
        </s:form>
    </div>

</div>

</div>
</div>
</div>

<!-- Cancel Booking Modal -->
<div class="modal fade" id="cancelBooking" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><i class="fa fa-warning" style="color: red;"></i> Cancel Booking</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel the booking?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>
                <%--<s:property value="order.orderId"/>
                <s:url var="deleteOrderUrl" action="deleteOrder">
                    <s:param name="orderIdParam" value="order.orderId"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip">
                    <button type="button" class="btn btn-danger">Yes</button>
                </s:a>--%>
            </div>
        </div>
    </div>
</div>

<%--start add contact person--%>
<div class="modal fade" id="createContact" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Contact Person</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form action="addCustomerContact" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="contact.referenceId" id="custIdHolder"/>

                        <div class="form-group">
                            <label class="col-lg-3">Position<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="Position" name="contact.position"
                                             type="text" required="true" maxlength="45" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3">Last Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                             id="contact.lastName" required="true" maxLength="30" autofocus="true"
                                             pattern="^(\s*[a-zA-Z\xD1-\xF1]+(([\'\-\+\s]\s*[a-zA-Z\xD1-\xF1])?[a-zA-Z\xD1-\xF1]*)\s*)+$"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3">First Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                             id="contact.firstName" maxLength="30" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                             title="Name should not contain special characters and/or numbers."
                                             required="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3">Middle Name</label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                             id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s ]+"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3">Phone<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.phone"
                                         maxLength="14" required="true" id="contact_phone" pattern=".{14,}"
                                         title="Phone number should contain 10 digits including local city code."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3">Mobile<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="(+639XX)(XXX-XXXX)" name="contact.mobile"
                                         maxLength="18" required="true" id="contact_mobile" pattern=".{18,}"
                                         title="Mobile number should contain 11 digits."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3">Email Address<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="Email Address" name="contact.email"
                                              required="true" pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{3,})$"
                                              maxLength="50" title="Example: example@domain.com"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3">Fax</label>
                            <div class="col-lg-9">
                                <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.fax"
                                     maxLength="14" id="contact_fax" pattern=".{14,}"
                                     title="Fax number should contain 10 digits including local city codes."/>
                            </div>
                        </div>


                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
                </div>
        </div>
    </div>
</div>
<%--end add contact person---%>

<%--START OF MODAL ADD ADDRESS--%>

<div class="modal fade" id="createAddress" role="form" aria-labelledby="myModalLabel2" >
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">Add Address</h4>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                    <s:form action="addCustomerAddress" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="address.referenceId" id="custAddIdHolder"/>
                        <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Address Type<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                            <s:select name="address.addressType" list="addressTypeList" listValue="value"
                                      listKey="key" required="true"
                                      cssClass="form-control" id="address.addressType" emptyOption="true"/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Address Line 1<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.addressLine1" id="address.addressLine1" cssClass="form-control" required="true" maxLength="50"
                                    pattern="^(\s*[a-zA-Z0-9]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$" title="Address Line 1 should not contain special characters."/>
                                </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Address Line 2</label>
                            <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.addressLine2" id="address.addressLine2" cssClass="form-control" maxLength="50"
                                         pattern="^(\s*[a-zA-Z0-9]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$" title="Address Line 2 should not contain special characters."/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">City<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.city" id="address.city" cssClass="form-control" required="true" maxLength="30"
                                         pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" title="City should not contain special characters."/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Region</label>
                            <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.state" id="address.state" cssClass="form-control" maxLength="30"
                                         pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" title="Region should not contain special characters." />
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Zip<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.zip" id="address.zip" cssClass="form-control" required="true" maxLength="4"
                                    pattern="^[0-9]{4,}$" title="Zip Code should not contain letters or special characters."/>
                        </div>
                            </div>
                </div>
            </div>
            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
                </s:form>
            </div>
        </div>
    </div>
</div>

<%--END OF MODAL ADD ADDRESS--%>

<%--START OF Third modal Consignee--%>

<div class="modal fade" id="createConsignee" role="form" aria-labelledby="myModalLabel3" >
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel3">Add Consignee</h4>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                    <div class="form-group">
                    <s:form action="addConsigneeBooking" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="consignee.referenceId1" id="consigneeAddIdHolder"/>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Last Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.lastName" cssClass="form-control" id="consignee.lastName"
                                         placeholder="Last Name" maxLength="30" required="true"
                                         pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">First Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.firstName" cssClass="form-control" id="consignee.firstName"
                                             placeholder="First Name" maxLength="30" autofocus="true" required="true"
                                             pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Middle Name</label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.middleName" cssClass="form-control"
                                     id="consignee.middleName"
                                     placeholder="Middle Name" maxLength="30" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                     title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Phone<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.phone" cssClass="form-control" id="consignee_phone"
                                 placeholder="(XXX) XXX-XXXX" maxLength="14" required="true" pattern=".{14,}"
                                 title="Phone number should contain 10 digits including local city code."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Mobile<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.mobile" cssClass="form-control" id="consignee_mobile"
                                 placeholder="(+639XX) (XXX-XXXX)" maxLength="18" required="true" pattern=".{18,}"
                                 title="Mobile number should contain 11 digits."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Email Address<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.email" cssClass="form-control" id="consignee.email"
                                 placeholder="Email Address" required="true" maxLength="50"
                                 pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{3,})$"
                                 title="Example: example@domain.com"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Fax</label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.fax" cssClass="form-control" id="consignee_fax"
                                 placeholder="(XXX) XXX-XXXX" maxLength="14" pattern=".{14,}"
                                 title="Fax number should contain 10 digits including local city codes."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Address Line 1<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.addressLine1" cssClass="form-control"
                                 id="consignee.addressLine1" placeholder="Address Line 1" required="true"
                                 maxLength="50" pattern="^(\s*[a-zA-Z0-9]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Address Line 2</label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.addressLine2" cssClass="form-control"
                                 id="consignee.addressLine2" placeholder="Address Line 2" maxLength="50"
                                 pattern="^(\s*[a-zA-Z0-9]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">City<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.city" cssClass="form-control"
                                 id="consignee.city" placeholder="City" required="true"
                                 pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" maxLength="50"
                                 title="City should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Region</label>
                            <div class="col-lg-9" style="width: 74%;">
                                <s:textfield name="consignee.state" cssClass="form-control"
                                 id="consignee.state" placeholder="Region" maxLength="50" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                 title="State should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Zip<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="consignee.zip" cssClass="form-control"
                                 id="consignee.zip" placeholder="Zip" required="true"
                                 pattern="[0-9]+" maxLength="4"
                                 title="ZIP should not contain special characters and/or letters."/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
<%--END OF Third modal Consignee--%>

<%--START OF EDIT CUSTOMER CONTACT INFO--%>

<div class="modal fade" id="editContactInfo" role="form" aria-labelledby="myModalLabel4" >
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel4">Edit Contact Information</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">
                    <s:form action="editCustomerContactInfo" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="customer.customerId" id="customerIdHolder"/>
                    <div class="form-group">
                        <label class="col-lg-3">Phone<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.phone" id="customer_phone" cssClass="form-control" required="true"
                                         pattern=".{14,}" placeholder="(XXX) XXX-XXXX"
                                         title="Phone number should contain 10 digits including local city code." />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3">Mobile<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.mobile" id="customer_mobile" cssClass="form-control" required="true"
                                         placeholder="(+639XX)(XXX-XXXX)" pattern=".{18,}"
                                         title="Mobile number should contain 11 digits."  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3">Email Address<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.email" id="customer_email" cssClass="form-control" required="true"
                                         pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{3,})$"
                                         placeholder="Email Address" maxLength="50" title="Example: example@domain.com" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3">Fax</label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.fax" id="customer_fax" cssClass="form-control"
                                         pattern=".{14,}" placeholder="(XXX) XXX-XXXX"
                                         title="Fax number should contain 10 digits including local city codes." />
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
                </s:form>
            </div>

        </div>
    </div>
</div>

<%--END OF EDIT CUSTOMER CONTACT INFO--%>

<%--START OF ADD CONSIGNEE CONTACT PERSON--%>

<div class="modal fade" id="createConsigneeContact" role="form" aria-labelledby="myModalLabel5" >
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel5">Add Consignee Contact Person</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">
                <s:form action="addConsigneeContact" cssClass="form-horizontal" theme="bootstrap">
                <s:hidden name="contact.referenceId" id="consigneeIdHolder"/>

                    <div class="form-group">
                        <label class="col-lg-3">Position<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Position" name="contact.position"
                                         type="text" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Last Name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                         id="consignee_contact_lastName" required="true" maxLength="30" autofocus="true"
                                         pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">First Name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                         id="consignee_contact_firstName" maxLength="30" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Name should not contain special characters and/or numbers."
                                         required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Middle Name</label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="consignee_contact_middleName" maxLength="30" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Phone<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.phone"
                                         maxLength="14" required="true" id="consignee_contact_phone" pattern=".{14,}"
                                         title="Phone number should contain 10 digits including local city code."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Mobile<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(+639XX)(XXX-XXXX)" name="contact.mobile"
                                         maxLength="18" required="true" id="consignee_contact_mobile" pattern=".{18,}"
                                         title="Mobile number should contain 11 digits."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Email Address<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Email Address" name="contact.email"
                                         required="true" pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{3,})$"
                                         title="Example: example@domain.com" maxLength="50"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Fax</label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.fax"
                                         maxLength="14" id="consignee_contact_fax" pattern=".{14,}"
                                         title="Fax number should contain 10 digits including local city codes."/>
                        </div>
                    </div>

                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
                </s:form>
            </div>

        </div>
    </div>
</div>

<%--END OF ADD CONSIGNEE CONTACT PERSON--%>

<%--alert modals--%>

<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
                <center><h4 class="modal-title" id="alertlabel"><li class="fa fa-info"/> Warning</h4></center>
            </div>
            <div class="modal-body">
                <center><p>Select a Customer first</p></center>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>

            </div>
        </div>
    </div>
</div>

<%-- MODAL FOR DATE SAME WARNING  -- START --%>
<div class="modal fade" id="dateSameWarningModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel" style="color: red"><i class="fa fa-warning"></i> WARNING</h4>
            </div>
            <div class="modal-body" id="dateSameWarningModalBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary btnNextSubmit">OK</button>
            </div>
        </div>
    </div>
</div>
<%-- MODAL FOR DATE SAME WARNING  -- END --%>

<script type="text/javascript" src="../includes/js/booking.js"></script>
<%--<script type="text/javascript" src="../includes/js/booking.min.js"></script>--%>