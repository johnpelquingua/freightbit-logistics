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
            <li class="active"> Edit Booking</li>
        </ol>

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
        <s:form action="editOrder" theme="bootstrap">
        <%--<s:property value="%{order.orderId}"/>--%>
        <s:hidden name="order.orderId" id="order_orderId" value="%{order.orderId}"/>
        <%--<s:property value="%{order.orderNumber}"/>--%>
        <s:hidden name="order.orderNumber" value="%{order.orderNumber}"/>
        <s:hidden name="order.orderStatus" value="%{order.orderStatus}"/>
        <div class="form-group">
            <label class="col-lg-2 control-label">Freight Type<span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.freightType}" />--%>
                <s:hidden name="order.freightType" value="%{order.freightType}" />
                <s:select id="order.freightType"
                          cssClass="form-control"
                          style="margin-bottom: 15px !important;"
                          name="order.freightType"
                          list="freightTypeList"
                          listKey="key"
                          listValue="value"
                          value="order.freightType"
                          disabled="true"
                        />

            </div>
        </div>

        <div class="form-group" style="margin-top: 15px;">
            <label class="col-lg-2 control-label">Service Requirement <span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.serviceRequirement}" />--%>
                <s:hidden name="order.serviceRequirement" value="%{order.serviceRequirement}" />
                <s:select cssClass="form-control"
                          style="margin-bottom: 15px !important;"
                          name="order_serviceRequirement"
                          list="serviceRequirementList"
                          id="order.serviceRequirement"
                          listKey="key"
                          listValue="value"
                          disabled="true"
                          value="order.serviceRequirement"
                        />

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-2 control-label">Service Mode <span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.modeOfService}" />--%>
                <%--<s:hidden name="order.modeOfService" value="%{order.modeOfService}" />--%>
                <s:select id="order_modeOfService"
                          cssClass="form-control"
                          style="margin-bottom: 15px !important;"
                          name="order.modeOfService"
                          list="modeOfServiceList"
                          listKey="key"
                          listValue="value"
                          value="order.modeOfService"
                        />

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-2 control-label">Payment Mode<span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <%--<s:property value="%{order.modeOfPayment}" />--%>
                <%--<s:hidden name="order.modeOfPayment" value="%{order.modeOfPayment}" />--%>
                <s:select id="order.modeOfPayment"
                          cssClass="form-control step1"
                          style="margin-bottom: 15px !important;"
                          name="order.modeOfPayment"
                          list="modeOfPaymentList"
                          listKey="key"
                          listValue="value"
                          value="order.modeOfPayment"
                        />

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-2 control-label">Customer Name<span class="asterisk_red"></span></label>

            <div class="col-lg-10">
                <s:hidden name="order.customerId" value="%{order.customerId}" />
                <s:select id="customerName"
                          cssClass="form-control step1"
                          style="margin-bottom: 15px !important;"
                          list="customerList"
                          listKey="customerId"
                          listValue="customerName"
                          emptyOption="true"
                          required="true"
                          value="order.customerId"
                          disabled="true"
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
                             value="%{customerPhone}"
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
                             value="%{customerMobile}"
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
                             value="%{customerEmail}"
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
                             value="%{customerFax}"
                             disabled="true"
                        />
            </div>
        </div>

        <div class="form-group" style="padding-top: 25px; clear: both;">
            <div class="col-lg-2 col-lg-offset-10">
                <div class="pull-right">
                    <a data-toggle="modal" data-target="#editContactInfo" class="btn btn-info" id="id_Customer" style="width: 151px !important; margin-bottom: 5px;"> Edit Contact</a>
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

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Date<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.pickupDate}" />--%>
        <s:textfield type="text" class="from_date form-control" id="datepicker1" name="order.pickupDate" value="%{order.pickupDate}" required="true" placeholder="Select Pick-up date" contenteditable="false" style="margin-bottom: 15px !important;" />
    </div>

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Date<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.deliveryDate}" />--%>
        <s:textfield type="text" class="to_date form-control" id="datepicker2" name="order.deliveryDate" value="%{order.deliveryDate}" required="true" placeholder="Select Deliver date" contenteditable="false" style="margin-bottom: 15px !important;" />
    </div>

</div>

<div class="form-group">

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Origin Port<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.originationPort}" />--%>
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  id="select1" name="order.originationPort" list="portsList" listKey="key"
                  listValue="value" required="true" value="order.originationPort"/>

    </div>

    <label class="col-lg-3 control-label" style="margin-top: 5px;">Destination Port<span class="asterisk_red"></span></label>
    <div class="col-lg-3" >
        <%--<s:property value="%{order.destinationPort}" />--%>
        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                  id="select2" name="order.destinationPort" list="portsList" listKey="key"
                  listValue="value" required="true" value="order.destinationPort"/>

    </div>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Notification Type<span class="asterisk_red"></span></label>

        <div class="col-lg-9" style="text-align:left !important;">
            <%--<s:property value="%{order.notifyBy}" />
            <s:property value="%{notificationList}" />--%>
            <s:checkboxlist list="notifyByList" listKey="key" listValue="value" name="order.notifyBy" value="%{notificationList}"/>
        </div>

    </div>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px; clear:both;">Comments </label>
        <%--<s:property value="%{order.comments}" />--%>
        <div class="col-lg-9">
            <s:textarea  name="order.comments" cssClass="form-control" cssStyle="resize: none; margin-bottom: 15px !important; height: 100px;" id="Comments"/>
        </div>
    </div>

</div>

<div id="2ndPartOnLoad" style="clear:both;">

    <legend style="text-align: left;">
        <span >
            Customer Information
        </span>
    </legend>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person<span class="asterisk_red"></span></label>

        <div class="col-lg-7">
            <%--<s:property value="%{order.shipperContactId}" />--%>
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="shipperContact" name="order.shipperContactId" value="%{order.shipperContactId}"
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
            <%--<s:property value="%{order.shipperAddressId}" />--%>
            <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;" id="shipperAddress" name="order.shipperAddressId" value="order.shipperAddressId"
                      list="addressList" listKey="addressId" listValue="addressLine1 + ' ' + addressLine2" required="true"/>
        </div>

        <div class="col-lg-2">

            <div class="pull-right">
                <a data-toggle="modal" data-target="#createAddress" class="btn btn-info" id="idAddress" style="width: 151px !important;"> Add Address</a>
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
            <%--<s:property value="%{order.consigneeContactId}" />--%>
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="shipperConsignee" name="order.consigneeContactId" value="order.consigneeContactId"
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
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Address<span class="asterisk_red"></span></label>

        <div class="col-lg-7">
            <%--<s:property value="%{order.consigneeAddressId}" />--%>
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="consigneeAddress" name="order.consigneeAddressId" value="order.consigneeAddressId"
                      list="consigneeAddressList" listKey="addressId"
                      listValue="addressLine1 + ' ' + addressLine2" required="true"/>
        </div>

    </div>

    <div class="form-group">
        <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person<span class="asterisk_red"></span></label>

        <div class="col-lg-7">
            <%--<s:property value="%{order.consigneeContactName}" />
            <s:property value="%{order.consigneeContactPersonId}" />--%>
            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="consigneeContact" name="order.consigneeContactPersonId" value="order.consigneeContactPersonId"
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
        <button type="button" id="Cancel" class="btn" data-toggle="modal" data-target="#cancelBooking">
            Cancel
        </button>

        <s:submit name="submit" cssClass="btn btn-primary" value="Next" />
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
                <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
                <h4 class="modal-title" id="myModalLabel">Cancel Edit Booking</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel edit booking?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>
                <%--<s:property value="order.orderId"/>--%>
                <%--<s:url var="deleteOrderUrl" action="deleteOrder">--%>
                    <%--<s:param name="orderIdParam" value="order.orderId"></s:param>--%>
                <%--</s:url>--%>
                <%--<s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip">--%>
                    <%--<button type="button" class="btn btn-primary">Yes</button>--%>
                <%--</s:a>--%>
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

                        <s:form action="addCustomerContactEditOrder" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="orderIdParam" id="orderIdHolder"/>
                    <s:hidden name="contact.referenceId" id="custIdHolder"/>
                    <div class="form-group">
                        <label class="col-lg-3">Position<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Position" name="contact.position" maxLength="30"
                                         type="text" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Last Name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                         id="contact.lastName`" required="true" maxLength="30" autofocus="true"
                                         pattern="[a-zA-Z\s\xD1-\xF1 ]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">First Name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                         id="contact.firstName" maxLength="30" pattern="[a-zA-Z\s\xD1-\xF1 ]+"
                                         title="Name should not contain special characters and/or numbers."
                                         required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Middle Name</label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s\xD1-\xF1 ]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Phone<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.phone"
                                         maxLength="14" required="true" id="contact_phone"
                                         title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."
                                         pattern=".{14}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Mobile<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(+639XX)(XXX-XXXX)" name="contact.mobile"
                                         maxLength="19" required="true" id="contact_mobile"
                                         title="(+639XX)(XXX-XXXX) Mobile should not contain special characters and/or letters."
                                         pattern=".{18}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Email Address<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Email Address" name="contact.email"
                                         id="contact_email" type="email" required="true" pattern="^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{3,})$"/>
                        </div>
                    </div>
                    <div class="form-group">
                    <label class="col-lg-3">Fax</label>
                    <div class="col-lg-9">
                        <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.fax"
                                     maxLength="14" id="contact_fax"
                                     title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
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
                    <s:form action="addCustomerAddressEditOrder" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="orderIdParam" id="orderIdHolder"/>
                    <s:hidden name="address.referenceId" id="custAddIdHolder"/>
                    <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Address Type<span class="asterisk_red"></span></label>
                        <div class="col-lg-9" style="width: 74%;">
                            <s:select name="address.addressType" list="addressTypeList" listValue="value"
                                      listKey="key"
                                      cssClass="form-control" id="address.addressType" emptyOption="true" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Address Line 1<span class="asterisk_red"></span></label>
                        <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.addressLine1" id="address.addressLine1" cssClass="form-control" required="true"
                                    pattern="[a-zA-Z\#\.\d\s\,\- ]+" maxLength="50"
                                    title="Address Line 1 should not contain special characters."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Address Line 2</label>
                        <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.addressLine2" id="address.addressLine2" cssClass="form-control"
                                    pattern="[a-zA-Z\#\.\d\s\,\- ]+" maxLength="50"
                                    title="Address Line 2 should not contain special characters."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">City<span class="asterisk_red"></span></label>
                        <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.city" id="address.city" cssClass="form-control" required="true"
                                    pattern="[a-zA-Z\s ]+" title="City should not contain special characters." maxLength="30"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Region</label>
                        <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.state" id="address.state" cssClass="form-control"
                                    pattern="[a-zA-Z\s ]+" title="Region should not contain special characters." maxLength="30"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3" style="width: 26%;">Zip<span class="asterisk_red"></span></label>
                        <div class="col-lg-9" style="width: 74%;">
                            <s:textfield name="address.zip" id="address.zip" cssClass="form-control" required="true"
                                    pattern="[0-9]{4}" title="Please match the requested format."/>
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
                        <s:form action="addConsigneeBookingEditOrder" cssClass="form-horizontal" theme="bootstrap">
                        <s:hidden name="orderIdParam" id="orderIdHolder"/>
                        <s:hidden name="consignee.referenceId1" id="consigneeAddIdHolder"/>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Last Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.lastName" cssClass="form-control" id="consignee.lastName"
                                             placeholder="Last Name" maxLength="30" required="true"
                                             pattern="[a-zA-Z\s ]+[ -~]"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">First name<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.firstName" cssClass="form-control" id="consignee.firstName"
                                             placeholder="First Name" maxLength="30" autofocus="true" required="true"
                                             pattern="[a-zA-Z\s ]+"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Middle Name</label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.middleName" cssClass="form-control"
                                             id="consignee.middleName"
                                             placeholder="Middle Name" maxLength="30" pattern="[a-zA-Z\s ]+"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Phone<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.phone" cssClass="form-control" id="consignee_phone"
                                             placeholder="(XXX) XXX-XXXX" maxLength="14" required="true"
                                             title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."
                                             pattern=".{14}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Mobile<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.mobile" cssClass="form-control" id="consignee_mobile"
                                             placeholder="(+639XX) (XXX-XXXX)" maxLength="19" required="true"
                                             title="(+639XX) (XXX-XXXX) Mobile should not contain special characters and/or letters."
                                             pattern=".{18}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Email Address<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.email" cssClass="form-control" id="consignee.email"
                                             placeholder="Email Address" type="email" required="true" maxLength="50"
                                             pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Fax</label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.fax" cssClass="form-control" id="consignee_fax"
                                             placeholder="(XXX) XXX-XXXX" maxLength="14"
                                             title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Address Line 1<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.addressLine1" cssClass="form-control"
                                             id="consignee.addressLine1" placeholder="Address Line 1" required="true"
                                             maxLength="50"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Address Line 2</label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.addressLine2" cssClass="form-control"
                                             id="consignee.addressLine2" placeholder="Address Line 2" maxLength="50"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">City<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.city" cssClass="form-control"
                                             id="consignee.city" placeholder="City" required="true"
                                             pattern="[a-zA-Z ]+" maxLength="50"
                                             title="City should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Region</label>
                            <div class="col-lg-8" style="width: 74%;">
                                <s:textfield name="consignee.state" cssClass="form-control"
                                             id="consignee.state" placeholder="Region" maxLength="50" pattern="[a-zA-Z ]+"
                                             title="State should not contain special characters and/or numbers."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3" style="width: 26%;">Zip<span class="asterisk_red"></span></label>
                            <div class="col-lg-8" style="width: 74%;">
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
                    <s:form action="editCustomerContactInfoEditOrder" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="customer.customerId" id="customerIdHolder"/>
                    <s:hidden name="orderIdParam" id="orderIdHolder"/>
                    <div class="form-group">
                        <label class="col-lg-3">Phone <span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.phone" id="customer_phone" cssClass="form-control" required="true"
                                         placeholder="(XXX) XXX-XXXX" pattern=".{14,}"
                                         title="Phone number should contain 10 digits including local city code." />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3">Mobile <span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.mobile" id="customer_mobile" cssClass="form-control" required="true"
                                         placeholder="(+639XX)(XXX-XXXX)" pattern=".{18,}"
                                         title="Mobile number should contain 11 digits." />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3">Email Address<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.email" id="customer_email" cssClass="form-control" required="true"
                                         pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{3,})$"
                                         placeholder="Email Address" type="email" maxLength="50" title="Example: abcdefg@yahoo.com"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3">Fax </label>
                        <div class="col-lg-9">
                            <s:textfield name="customer.fax" id="customer_fax" cssClass="form-control" pattern=".{14,}"
                                         placeholder="(XXX) XXX-XXXX" title="Fax number should contain 10 digits including local city codes." />
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
                    <s:form action="addConsigneeContactEditOrder" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="contact.referenceId" id="consigneeIdHolder"/>
                    <s:hidden name="orderIdParam" id="orderIdHolder"/>

                    <div class="form-group">
                        <label class="col-lg-3">Position<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Position" name="contact.position" maxLength="30"
                                         type="text" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Last Name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                         id="consignee_contact_lastName" required="true" maxLength="30" autofocus="true"
                                         pattern="[a-zA-Z\s ]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">First Name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                         id="consignee_contact_firstName" maxLength="30" pattern="[a-zA-Z\s ]+"
                                         title="Name should not contain special characters and/or numbers."
                                         required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Middle Name</label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="consignee_contact_middleName" maxLength="30" pattern="[a-zA-Z\s ]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Phone<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.phone"
                                         maxLength="14" required="true" id="consignee_contact_phone"
                                         title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."
                                         pattern=".{14}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Mobile<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(+639XX)(XXX-XXXX)" name="contact.mobile"
                                         maxLength="19" required="true" id="consignee_contact_mobile"
                                         title="(+639XX)(XXX-XXXX) Mobile should not contain special characters and/or letters."
                                         pattern=".{18}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Email Address<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Email Address" name="contact.email" id="consignee_contact_email"
                                         type="email" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3">Fax</label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.fax"
                                         maxLength="14" id="consignee_contact_fax"
                                         title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
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

<script type="text/javascript">

    var ctr = "N";

$(document).ready(function() {

    $( window ).load(function() {

        /*alert((localStorage.getItem("ctr")));*/

        $("#contact_phone").val('');
        $("#contact_mobile").val('');
        $("#contact_fax").val('');
        $("#contact_email").val('');
        $("#consignee_contact_phone").val('');
        $("#consignee_contact_mobile").val('');
        $("#consignee_contact_fax").val('');
        $("#consignee_contact_email").val('');

        if((localStorage.getItem("ctr")) == "Y"){
            setThis();
        }

        var custId = $("#customerName").val();
        /*alert(custId);*/

        $.getJSON('customerAction', {
                    customerID : custId
                },
                function(jsonResponse) {
                    /*alert(jsonResponse.dummyMsg);*/

                    $('#ajaxResponse').text(jsonResponse.dummyMsg);

                    var select = $('#shipperContact').val();

                    select.find('option').remove();

                    var select2 = $('#shipperAddress').val();

                    select2.find('option').remove();

                    var select3 = $('#shipperConsignee').val();

                    select3.find('option').remove();

                    var select4 = $('#consigneeAddress').val();

                    select4.find('option').remove();

                    var select5 = $('#customerPhone');

                    select5.find('option').remove();

                    var select6 = $('#customerMobile');

                    select6.find('option').remove();

                    var select7 = $('#customerEmail');

                    select7.find('option').remove();

                    var select8 = $('#customerFax');

                    select8.find('option').remove();

                    var select9 = $('#consigneeContact');

                    select9.find('option').remove();

                    // populate customer contacts list
                    $.each(jsonResponse.customerContactsMap, function(key, value) {

                        $('<option>').val(key).text(value).appendTo(select);

                    });
                    // populate customer address list
                    $.each(jsonResponse.customerAddressMap, function(key, value) {

                        if($("#order_modeOfService").val() == 'DOOR TO PIER') {
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }else if ($("#order_modeOfService").val() == 'PIER TO DOOR') {
                            $("#shipperAddress").prop('disabled', true);
                            $("#consigneeAddress").prop('disabled', false);
                        }else if ($("#order_modeOfService").val() == 'PIER TO PIER'){
                            $("#consigneeAddress").prop('disabled', true);
                            $("#shipperAddress").prop('disabled', true);
                        }else if ($("#order_modeOfService").val() == 'PICKUP') {
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }else if ($("#order_modeOfService").val() == 'DELIVERY'){
                            $("#consigneeAddress").prop('disabled', false);
                            $("#shipperAddress").prop('disabled', true);
                        }else{
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', false);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }

                    });
                    // populate customer consignee list
                    $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                        //alert($("#shipperConsignee").val());

                        $('<option>').val(key).text(value).appendTo(select3);

                    });

                    // populate customer consignee address list
                    $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                        //alert($("#consigneeAddress").val());

                        if($("#consigneeAddress").val() != ''){
                            if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER'){
                                $('<option>').val(null).text("").appendTo(select4);
                            }
                            $('<option>').val(key).text(value).appendTo(select4);
                        }else{
                            $('<option>').val(key).text(value).appendTo(select4);
                        }

                        /*var consignAdd = $("#consigneeAddress").val();
                        document.getElementById("order_consigneeAddressId_textfield").value = consignAdd;*/

                    });

                    // populate customer phone
                    $.each(jsonResponse.customerPhoneMap, function(key, value) {
                        $('<option>').val(key).text(value).appendTo(select5);
                        var customerPhone = $("#customerPhone").val();
                        alert(customerPhone);
                        document.getElementById("customerPhone_textfield").value = customerPhone;
                    });

                    // populate customer mobile
                    $.each(jsonResponse.customerMobileMap, function(key, value) {
                        $('<option>').val(key).text(value).appendTo(select6);
                        var customerMobile = $("#customerMobile").val();
                        alert(customerMobile);
                        document.getElementById("customerMobile_textfield").value = customerMobile;
                    });

                    // populate customer email
                    $.each(jsonResponse.customerEmailMap, function(key, value) {
                        $('<option>').val(key).text(value).appendTo(select7);
                        var customerEmail = $("#customerEmail").val();
                        document.getElementById("customerEmail_textfield").value = customerEmail;
                    });

                    // populate customer fax
                    $.each(jsonResponse.customerFaxMap, function(key, value) {
                        $('<option>').val(key).text(value).appendTo(select8);
                        var customerFax = $("#customerFax").val();
                        document.getElementById("customerFax_textfield").value = customerFax;
                    });

                    // populate consignee contacts
                    $.each(jsonResponse.consigneeContactMap, function(key, value) {
                        $('<option>').val(key).text(value).appendTo(select9);
                    });

                localStorage.clear();
        });

        /* BEGIN EDIT WIP ------------------------------------------------------------------------*/

        /*Filters Service Mode Dropdown on page load for edit*/

        var order_freightType = $("#editOrder_order_freightType").val();
        var sReq = select = document.getElementById('order_serviceRequirement');
        var sType = select = document.getElementById('order_freightType');
        var sMode = select = document.getElementById('order_modeOfService');
        var sModeValue = $("#order_modeOfService").val();

        if(order_freightType == 'SHIPPING AND TRUCKING') {

            /*$("#select1").val('');
            $("#select2").val('');*/
            $("#order_modeOfService").val('');
            for (var i = 0; i < sMode.options.length; i++) {
                /*$("#order_modeOfService").val('');*/
                if(sMode != '') {
                    sMode.value = sModeValue;
                    if (sMode.options[i].value == "DOOR TO DOOR" || sMode.options[i].value == "DOOR TO PIER" || sMode.options[i].value == "PIER TO DOOR") {
                        sMode.options[i].style.display = "block";
                    } else {
                        sMode.options[i].style.display = "none";
                    }
                }else{

                }
            }

//            for (var i = 0; i < sReq.options.length; i++){
//                $("#order_serviceRequirement").val('');
//                if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
//                    sReq.options[i].style.display = "none";
//                }else{
//                    sReq.options[i].style.display = "block";
//                }
//            }

        } else if (order_freightType == 'SHIPPING'){

            /*$("#select1").val('');
            $("#select2").val('');*/
            for (var i = 0; i < sMode.options.length; i++){
                /*$("#order_modeOfService").val('');*/
                if(sMode.options[i].value == "PIER TO PIER"){
                    sMode.options[i].style.display = "block";
                    sMode.options[i].selected = true;
                }else{
                    sMode.options[i].style.display = "none";
                }
            }

            for (var i = 0; i < sReq.options.length; i++){
                $("#order_serviceRequirement").val('');
                if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                    sReq.options[i].style.display = "none";
                }else{
                    sReq.options[i].style.display = "block";
                }
            }

        }else {
        /*For Trucking*/
            $("#select1").prop('disabled', true);
            $("#select2").prop('disabled', true);
            for (var i = 0; i < sMode.options.length; i++){
                /*$("#order_modeOfService").val('');*/
                if(sMode.options[i].value == "PICKUP" || sMode.options[i].value == "DELIVERY" || sMode.options[i].value == "INTER-WAREHOUSE"){
                    sMode.options[i].style.display = "block";
                }else{
                    sMode.options[i].style.display = "none";
                }
            }

            for (var i = 0; i < sReq.options.length; i++){
                $("#order_serviceRequirement").val('');
                if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                    sReq.options[i].style.display = "block";
                }else{
                    sReq.options[i].style.display = "none";
                }
            }

        }

        /* END EDIT WIP --------------------------------------------------------------------------*/


    });

    // Customer Dropdown
    $('#customerName').change(function(event) {
        var custId = $("#customerName").val();
        /*alert(custId);*/

        $.getJSON('customerAction', {
                    customerID : custId
                },
                function(jsonResponse) {
                    /*alert(jsonResponse.dummyMsg);*/

                    $('#ajaxResponse').text(jsonResponse.dummyMsg);

                    var select = $('#shipperContact');

                    select.find('option').remove();

                    var select2 = $('#shipperAddress');

                    select2.find('option').remove();

                    var select3 = $('#shipperConsignee');

                    select3.find('option').remove();

                    var select4 = $('#consigneeAddress');

                    select4.find('option').remove();

                    // populate customer consignee list
                    $.each(jsonResponse.customerContactsMap, function(key, value) {

                        $('<option>').val(key).text(value).appendTo(select);

                    });
                    // populate customer address list
                    $.each(jsonResponse.customerAddressMap, function(key, value) {

                        if($("#order_modeOfService").val() == 'DOOR TO PIER') {
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }else if ($("#order_modeOfService").val() == 'PIER TO DOOR') {
                            $("#shipperAddress").prop('disabled', true);
                            $("#consigneeAddress").prop('disabled', false);
                        }else if ($("#order_modeOfService").val() == 'PIER TO PIER'){
                            $("#consigneeAddress").prop('disabled', true);
                            $("#shipperAddress").prop('disabled', true);
                        }else{
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', false);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }

                    });
                    // populate customer consignee list
                    $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                        //alert($("#shipperConsignee").val());

                        $('<option>').val(null).text("").appendTo(select3);
                        $('<option>').val(key).text(value).appendTo(select3);
                    });

                    // populate customer address list
                    $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                        //alert($("#consigneeAddress").val());

                        $('<option>').val(null).text("").appendTo(select4);
                        $('<option>').val(key).text(value).appendTo(select4);
                    });

                });

    });

    //Consignee on Select
    $('#shipperConsignee').change(function(event) {
        var custId = $("#customerName").val();
        var consignee_Id = $("#shipperConsignee").val();
        /*alert("TEST");*/
        $.getJSON('consigneeAction', {
                    customerID : custId,
                    consigneeId : consignee_Id
                },
                function(jsonResponse) {
                    /*alert(consignee_Id);*/
                    var select4 = $('#consigneeAddress');

                    select4.find('option').remove();

                    // populate consignee address
                    $.each(jsonResponse.consigneeAddressMap, function(key, value) {

                        if($("#order_modeOfService").val() == 'DOOR TO DOOR' || $("#order_modeOfService").val() == 'PIER TO DOOR' || $("#order_modeOfService").val() == 'PICKUP' || $("#order_modeOfService").val() == 'DELIVERY' || $("#order_modeOfService").val() == 'INTER-WAREHOUSE' ) {

                            if ($("#shipperConsignee").val() != '') {
                                $('<option>').val(key).text(value).appendTo(select4);
                            } else {
                                if ($("#consigneeAddress").val() != '') {
                                    $('<option>').val(null).text("").appendTo(select4);
                                }
                                $('<option>').val(key).text(value).appendTo(select4);
                            }

                        }else{
                            $('<option>').val(key).text(value).appendTo(select4);
                        }

                    });

                });

    });

    //Consignee Address on Select
    $('#consigneeAddress').change(function(event) {
        var custId = $("#customerName").val();
        var address_Id = $("#consigneeAddress").val();
        /*alert(address_Id);*/
        $.getJSON('addressAction', {
                    customerID : custId,
                    addressId: address_Id
                },
                function (jsonResponse) {
                    /*alert(address_Id);*/
                    var select3 = $('#shipperConsignee');

                    select3.find('option').remove();

                    // populate consignee field
                    $.each(jsonResponse.customerConsigneeMap, function (key, value) {

                        if($("#consigneeAddress").val() != ''){
                            $('<option>').val(key).text(value).appendTo(select3);
                        }else{
                            if($("#shipperConsignee").val() != ''){
                                //$('<option>').val(null).text("").appendTo(select3);
                            }
                            $('<option>').val(key).text(value).appendTo(select3);
                        }

                    });

                });

    });


    // Date Time Picker
    var fromDatePickUp = $('#datepicker1');
    var toDateDelivery = $('#datepicker2');
    var ServiceValue= $('#order_modeOfService');
    //pick up date validation
    fromDatePickUp.datepicker({

        // on 5:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {
            if(ServiceValue.val() !='PICKUP'){
            if (toDateDelivery.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    toDateDelivery.datetimepicker('setDate', testStartDate);
            }

            else {
                toDateDelivery.val(dateText);
            }
        }},

        onSelect: function (selectedDateTime){
            toDateDelivery.datetimepicker('option', 'minDate', fromDatePickUp.datetimepicker('getDate') );
        }

    });

    // delivery date validation -jp
    toDateDelivery.datepicker({

        // on 6:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {
            if(ServiceValue.val() !='DELIVERY'){
            if (fromDatePickUp.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    fromDatePickUp.datetimepicker('setDate', testEndDate);
            }

            else {
                fromDatePickUp.val(dateText);
            }
        }},

        onSelect: function (selectedDateTime){
            fromDatePickUp.datetimepicker('option', 'maxDate', toDateDelivery.datetimepicker('getDate') );
        }

    });

});

// For Service Mode Dropdown selection

function dynamicDropdown(select, index) {


    var opt = select.options,
            lent = opt.length;

    while ( lent-- ){
        opt[ lent ].disabled = false;
    }

    /*alert(select.options[ index ].value);*/


    // If Service Requirement is Rolling Cargo
    if (select.options[ index ].value === 'ROLLING CARGO LOAD') {

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].disabled = false;
                sMode.options[i].selected = true;
            }else{
                sMode.options[i].disabled = true;
            }
        }

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value != "SHIPPING"){
                sType.options[i].disabled = true;
            }else{
                sType.options[i].disabled = false;
                sType.options[i].selected = true;
            }
        }

    } else {

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "DOOR TO DOOR"){
                sMode.options[i].disabled = false;
                //sMode.options[i].selected = true;
            }else{
                sMode.options[i].disabled = false;

            }
        }

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value == "SHIPPING AND TRUCKING"){
                sType.options[i].disabled = false;
                //sType.options[i].selected = true;
            }else{
                sType.options[i].disabled = false;

            }
        }
    }
    // if service mode is Door to Door, Door to Pier and Pier to Door
    if (select.options[ index ].value === 'DOOR TO DOOR' || select.options[ index ].value === 'DOOR TO PIER' || select.options[ index ].value === 'PIER TO DOOR') {

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value == "SHIPPING" ){
                sType.options[i].disabled = true;

            }else {
                if(sType.options[i].value == "SHIPPING AND TRUCKING"){
                    sType.options[i].disabled = false;
                    /*sType.options[i].selected = true;*/
                }else{
                    sType.options[i].disabled = false;

                }
            }
        }

        if (select.options[ index ].value === 'DOOR TO PIER'){

            /*$("#customerName").val('');
            $("#shipperContact").val('');*/
            $("#shipperAddress").prop('disabled', false);
            /*$("#shipperAddress").val('');*/
            /*$("#shipperConsignee").val('');*/
            $("#consigneeAddress").prop('disabled', true);
            $("#consigneeAddress").val('');
        }else if (select.options[ index ].value === 'PIER TO DOOR'){

            /*$("#customerName").val('');
            $("#shipperContact").val('');*/
            $("#shipperAddress").prop('disabled', true);
            $("#shipperAddress").val('');
            /*$("#shipperConsignee").val('');*/
            $("#consigneeAddress").prop('disabled', false);
            /*$("#consigneeAddress").val('');*/

        }else{
            /*  $("#customerName").val('');
             $("#shipperContact").val('');*/
            $("#shipperAddress").prop('disabled', false);
            /* $("#shipperAddress").val('');
             $("#shipperConsignee").val('');*/
            $("#consigneeAddress").prop('disabled', false);
            /*$("#consigneeAddress").val('');*/
        }

    }

    // If Service Mode is Pier to Pier
    if (select.options[ index ].value === 'PIER TO PIER') {

        for (var i = 0; i < sType.options.length; i++){

            if(sType.options[i].value != "SHIPPING"){
                sType.options[i].disabled = true;
            }else{
                sType.options[i].disabled = false;
                sType.options[i].selected = true;
            }
        }

        /*$("#customerName").val('');
        $("#shipperContact").val('');*/
        $("#shipperAddress").prop('disabled', true);
        $("#shipperAddress").val('');
        /*$("#shipperConsignee").val('');*/
        $("#consigneeAddress").prop('disabled', true);
        $("#consigneeAddress").val('');

    }
    // If Service Type is Shipping
    if (select.options[ index ].value === 'SHIPPING'){

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].disabled = false;
                sMode.options[i].selected = true;
            }else{
                sMode.options[i].disabled = true;
            }
        }

    }
    // If Service Type is Trucking or Shipping and Trucking
    if (select.options[ index ].value === 'TRUCKING' || select.options[ index ].value === 'SHIPPING AND TRUCKING') {

        for (var i = 0; i < sMode.options.length; i++){

            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].disabled = true;
            }else{
                if(sMode.options[i].value == "DOOR TO DOOR"){
                    sMode.options[i].disabled = false;
                    //sMode.options[i].selected = true;
                }else{
                    sMode.options[i].disabled = false;

                }
            }
        }

    }

    if(select.options[index].value === 'PICKUP'){
        $("#datepicker1").prop('disabled', false);
        $("#datepicker2").prop('disabled', true);
        $("#datepicker2").val('');
        $("#shipperAddress").prop('disabled', false);
        $("#consigneeAddress").prop('disabled', true);
        $("#consigneeAddress").val('');
        $("#select1").val('');
        $("#select2").val('');
    }else if(select.options[index].value === 'DELIVERY'){
        $("#datepicker1").prop('disabled', true);
        $("#datepicker1").val('');
        $("#datepicker2").prop('disabled', false);
        $("#shipperAddress").prop('disabled', true);
        $("#consigneeAddress").prop('disabled', false);
        $("#shipperAddress").val('');
        $("#select1").val('');
        $("#select2").val('');
    }else if(select.options[index].value === 'INTER-WAREHOUSE'){
        $("#datepicker1").prop('disabled', false);
        $("#datepicker2").prop('disabled', false);
        $("#select1").val('');
        $("#select2").val('');
        $("#shipperAddress").prop('disabled', false);
        $("#consigneeAddress").prop('disabled', false);
    }


}


var sReq = select = document.getElementById('order.serviceRequirement');
var sType = select = document.getElementById('order.freightType');
var sMode = select = document.getElementById('order_modeOfService');

sReq.onchange = function() {
    dynamicDropdown.call(this, sReq ,this.selectedIndex);
};

sType.onchange = function() {
    dynamicDropdown.call(this, sType ,this.selectedIndex);
};

sMode.onchange = function() {
    dynamicDropdown.call(this, sMode, this.selectedIndex);
};

// Avoid selecting duplicate ports

function preventDuplicatePort(select, index) {

    var options = select.options,
            len = options.length;

    while ( len-- ){
        options[ len ].disabled = false;
    }

    select.options[ index ].disabled = true;

    if( index === select.selectedIndex ){
        alert('You already selected the same port "' + select.options[index].text + '". Please choose another' );
        /*this.selectedIndex = 0;*/
        select2.value = '';
    }

}

var select1 = select = document.getElementById('select1');
var select2 = select = document.getElementById('select2');

select1.onchange = function() {
    preventDuplicatePort.call(this, select2, this.selectedIndex);
};

select2.onchange = function() {
    preventDuplicatePort.call(this, select1, this.selectedIndex);
};

//to get the customer id
$(document).ready(function(){
    $("#idCustomer").click(function(){
        var custId = $("#customerName").val();
        var orderId = $("#order_orderId").val();
        /*alert(orderId);*/
        getThis();
        if (custId == "" || null ){
            alert("Select a customer first");
            $("#customerName").focus();
            return false;
        }
        $("#custIdHolder").val(custId);
        $("#orderIdHolder").val(orderId);
        ctr = "Y";
        localStorage.setItem("ctr",ctr);
        /*alert(ctr);*/
    });
});

// to get customer id for add address
$(document).ready(function(){
    $("#idAddress").click(function(){
        var custId1 = $("#customerName").val();
        var orderId = $("#order_orderId").val();
       /* alert (custId1);
        alert(orderId);*/
        getThis();
        if (custId1 == "" || null ){
            alert("Select a customer first");
            $("#customerName").focus();
            return false;
        }
        $("#custAddIdHolder").val(custId1);
        $("#orderIdHolder").val(orderId);
        ctr = "Y";
        localStorage.setItem("ctr",ctr);
        /*alert(ctr);*/
    });
});
// to get customer id for add consignee
$(document).ready(function(){
    $("#idConsignee").click(function(){
        var custId2 = $("#customerName").val();
        var orderId = $("#order_orderId").val();
        getThis();
        if (custId2 == "" || null ){
            alert("Select a customer first");
            $("#customerName").focus();
            return false;
        }
        $("#consigneeAddIdHolder").val(custId2);
        $("#orderIdHolder").val(orderId);
        ctr = "Y";
        localStorage.setItem("ctr",ctr);
        /*alert(ctr);*/
    });
});
// to get customer id for editing contact number information
$(document).ready(function(){
    $("#id_Customer").click(function() {
        var custId3 = $("#customerName").val();
        var custPhone = $("#customerPhone_textfield").val();
        var custMobile = $("#customerMobile_textfield").val();
        var custEmail = $("#customerEmail_textfield").val();
        var custFax = $("#customerFax_textfield").val();
        var orderId = $("#order_orderId").val();
        getThis();
        if (custId3 == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
            return false;
        }
        $("#customerIdHolder").val(custId3);
        $("#customer_phone").val(custPhone);
        $("#customer_mobile").val(custMobile);
        $("#customer_email").val(custEmail);
        $("#customer_fax").val(custFax);
        $("#orderIdHolder").val(orderId);
    });
});
//to get consignee id for adding consignee contact
$(document).ready(function(){

    $("#id_Consignee").click(function() {
        var consigneeId = $("#shipperConsignee").val();
        var orderId = $("#order_orderId").val();
        getThis();
        if (consigneeId == null ){
            alert("Select Consignee First");
            /*$("#shipperConsignee").focus();*/
            return false;
        }
        $("#consigneeIdHolder").val(consigneeId);
        $("#orderIdHolder").val(orderId);
    });

});
/*Mask input fields*/
$(document).ready(function(){
    $("#contact_phone").mask("(999) 999-9999");
    $("#customer_phone").mask("(999) 999-9999");
    $("#contact_mobile").mask("(+63999)(999-9999)");
    $("#customer_mobile").mask("(+63999)(999-9999)");
    $("#contact_fax").mask("(999) 999-9999");
    $("#consignee_phone").mask("(999) 999-9999");
    $("#consignee_mobile").mask("(+63999)(999-9999)");
    $("#consignee_fax").mask("(999) 999-9999");
    $("#customer_fax").mask("(999) 999-9999");
    $("#consignee_contact_phone").mask("(999) 999-9999");
    $("#consignee_contact_mobile").mask("(+63999)(999-9999)");
    $("#consignee_contact_fax").mask("(999) 999-9999");
});

function getThis(){
    var Pickdatefield = $("#datepicker1").val();
    var Deldatefield = $("#datepicker2").val();
    var OriginPortField = $("#select1").val();
    var DestinationPortField = $("#select2").val();
    var NotificationField = $("#notification_type").val();
    var CommentsField = $("#Comments").val();

    localStorage.setItem("Pickdatefield",Pickdatefield);
    localStorage.setItem("Deldatefield",Deldatefield);
    localStorage.setItem("OriginPortField",OriginPortField);
    localStorage.setItem("DestinationPortField",DestinationPortField);
    localStorage.setItem("NotificationField",NotificationField);
    localStorage.setItem("CommentsField",CommentsField);

}
function setThis(){
    $("#datepicker1").val(localStorage.getItem("Pickdatefield"));
    $("#datepicker2").val(localStorage.getItem("Deldatefield"));
    $("#select1").val(localStorage.getItem("OriginPortField"));
    $("#select2").val(localStorage.getItem("DestinationPortField"));
    $("#notification_type").val(localStorage.getItem("NotificationField"));
    $("#Comments").val(localStorage.getItem("CommentsField"));
}

    $(window).load(function(){

        if ($("#order_modeOfService").val() === 'PICKUP'){

            $("#datepicker2").prop('disabled', true);
            $("#datepicker1").prop('disabled', false);
            $("#datepicker2").val('');
            $("#datepicker1").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").val('');
            $("#consigneeAddress").prop('disabled', true);

        }else if ($("#order_modeOfService").val()  === 'DELIVERY'){

            $("#datepicker1").prop('disabled', true);
            $("#datepicker2").prop('disabled', false);
            $("#datepicker2").val('');
            $("#datepicker1").val('');
            $("#shipperAddress").prop('disabled', true);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');

        }else if ($("#order_modeOfService").val()  === 'INTER-WAREHOUSE'){

            $("#datepicker1").prop('disabled', false);
            $("#datepicker2").prop('disabled', false);
            $("#datepicker2").val('');
            $("#datepicker1").val('');

        }
    });

</script>
