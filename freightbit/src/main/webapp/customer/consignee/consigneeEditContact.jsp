<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewConsignees' />"> Consignee List</a>
            </li>
            <li class="active">
                <s:url var="cancelConsigneeAddContactUrl" action="consigneeInfo">
                    <s:param name="contactCodeParam" value="contactCodeParam"></s:param>
                    <s:param name="addressIdParam" value="addressIdParam"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{cancelConsigneeAddContactUrl}" rel="tooltip">
                    <%--<button type="button" class="btn btn-primary">Cancel</button>--%>
                    Consignee Profile
                </s:a>
            </li>
            <li class="active"> Edit Contact Person</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12" >
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" ><i class="fa fa-info-circle"></i> Consignee Profile</h3>
                <%--<span class="pull-right">
                        <s:url var="loadEditConsginee" action="loadEditConsignee">
                            <s:param name="contactCodeParam"
                                     value="#attr.consignee.contactId"></s:param>
                            <s:param name="addressIdParam"
                                     value="%{#attr.consignee.addressId}"></s:param>
                        </s:url>
                        <sec:authorize
                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                            <s:a href="%{loadEditConsginee}" cssClass="btn btn-success new-booking" rel="tooltip"
                                 title="Edit this Customer">
                                <i class="fa fa-pencil"></i> Edit Consignee
                            </s:a>
                        </sec:authorize>

                </span>--%>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-lg-6 col-lg-offset-3">

                        <div class="panel panel-info">
                            <%--<div class="panel-heading">--%>
                                <%--<h3 class="panel-title"><i class="fa fa-info-circle"></i> Details</h3>--%>
                            <%--</div>--%>

                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                        </div>
                                    </div>

                                    <div class="col-lg-9">
                                        <table class="table table-user-information" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; border-top: none; text-align: left !important;">First Name</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="consignee.firstName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Middle Name</td>
                                                <td style="text-align: left !important"><s:property value="consignee.middleName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Last Name</td>
                                                <td style="text-align: left !important"><s:property value="consignee.lastName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Phone</td>
                                                <td style="text-align: left !important"><s:property value="consignee.phone"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Mobile</td>
                                                <td style="text-align: left !important"><s:property value="consignee.mobile"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Email Address</td>
                                                <td style="text-align: left !important"><s:property value="consignee.email"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Fax</td>
                                                <td style="text-align: left !important"><s:property value="consignee.fax"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Address Line 1</td>
                                                <td style="text-align: left !important"><s:property value="consignee.addressLine1"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Address Line 2</td>
                                                <td style="text-align: left !important"><s:property value="consignee.addressLine2"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">City</td>
                                                <td style="text-align: left !important"><s:property value="consignee.city"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Region</td>
                                                <td style="text-align: left !important"><s:property value="consignee.state"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">ZIP</td>
                                                <td style="text-align: left !important"><s:property value="consignee.zip"/></td>
                                            </tr>

                                            </tbody>
                                            <%--<s:set name="customerId" value="%{customer.customerId}" scope="session"/>--%>
                                            <s:set name="customerId" value="%{consignee.referenceId1}" scope="session"/>
                                            <%--<s:property value="%{consignee.referenceId1}" />--%>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">

                            <div class="panel-heading">
                                <h3 class="panel-title" style="float:left;top: 10px;">
                                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Contact Person</h3>
                                </h3>
                                <%--<span class="pull-right">
                                    <s:url var="loadAddContactUrl" action="loadAddCustomerContact">
                                        <s:param name="CustomerCodeParam" value="CustomerCodeParam"> </s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{loadAddContactUrl}" rel="tooltip" title="Add Contact">
                                        <button type="button" class="btn btn-primary">
                                            <i class="fa fa-group"> </i> New Contact Person
                                        </button>
                                    </s:a>
                                </span>--%>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="panel-body">

                                            <s:form action="editConsigneeContact" cssClass="form-horizontal" theme="bootstrap">
                                            <s:hidden name="consigneeContact.contactId" value="%{consigneeContact.contactId}" />
                                            <s:hidden name="consigneeContact.createdTimestamp" value="%{consigneeContact.createdTimestamp}" />
                                            <s:hidden name="consigneeContact.createdBy" value="%{consigneeContact.createdBy}" />
                                            <s:hidden name="consigneeContact.contactType" value="%{consigneeContact.contactType}" />
                                            <%--<div class="form-group">
                                                <label for="contact.contactType" class="col-lg-2 control-label" style="padding-top:0px;">Contact Type<span class="asterisk_red"></span></label>
                                                <div class="col-lg-10" >
                                                    <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                                              listKey="key" listValue="value" cssClass="form-control"
                                                              value="contact.contactType" emptyOption="true"/>
                                                </div>
                                            </div>--%>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" style="padding-top:0px;">Position<span class="asterisk_red"></span></label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="Position  " name="consigneeContact.position"
                                                                 type="text" required="true"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="contact.lastName" class="col-lg-2 control-label" style="padding-top:0px;">Last Name<span class="asterisk_red"></span></label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="Last Name" name="consigneeContact.lastName"
                                                                 id="contact.lastName" required="true" maxLength="30" autofocus="true"
                                                                 pattern="[a-zA-Z\s]+"
                                                                 title="Name should not contain special characters and/or numbers."/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="contact.firstName" class="col-lg-2 control-label" style="padding-top:0px;">First Name<span class="asterisk_red"></span></label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="First Name" name="consigneeContact.firstName"
                                                                 id="contact.firstName" maxLength="30" pattern="[a-zA-Z\s]+"
                                                                 title="Name should not contain special characters and/or numbers."
                                                                 required="true"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="contact.middleName" class="col-lg-2 control-label" style="padding-top:0px;">Middle Name</label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="Middle Name" name="consigneeContact.middleName"
                                                                 id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s]+"
                                                                 title="Name should not contain special characters and/or numbers."/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" style="padding-top:0px;">Phone<span class="asterisk_red"></span></label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="consigneeContact.phone"
                                                                 maxLength="14" required="true"
                                                                 id="contact_phone" title="(XXX)XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" style="padding-top:0px;">Mobile<span class="asterisk_red"></span></label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="(+639XX) XXX-XXXX" name="consigneeContact.mobile"
                                                                 maxLength="19" required="true" id="contact_mobile"
                                                                 title="(+639XX) XXX-XXXX Mobile should not contain special characters and/or letters."/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" style="padding-top:0px;">Email Address<span class="asterisk_red"></span></label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="E-mail" name="consigneeContact.email"
                                                                 type="email" required="true"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" style="padding-top:0px;">Fax</label>
                                                <div class="col-lg-10" >
                                                    <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="consigneeContact.fax"
                                                                 maxLength="14"  id="contact_fax"
                                                                 title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-footer">
                                <div class="pull-right">
                                    <s:url var="cancelConsigneeAddContactUrl" action="consigneeInfo">
                                        <s:param name="contactCodeParam" value="contactCodeParam"></s:param>
                                        <s:param name="addressIdParam" value="addressIdParam"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{cancelConsigneeAddContactUrl}" rel="tooltip">
                                        <button type="button" class="btn">Cancel</button>
                                    </s:a>
                                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                                </div>
                            </div>
                            </s:form>

                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>



</div>