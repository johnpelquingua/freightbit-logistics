<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Customer Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a></li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer Profile</a></li>
            <li class="active"><a href="<s:url action='viewCustomerContacts' />"> Contact Persons</a></li>
            <li class="active"> Add New Contact Person</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Contact Person</h3>
            </div>

            <div class="panel-body">

                <s:form action="editCustomerContact" cssClass="form" theme="bootstrap">
                <s:hidden name="contact.contactId" value="%{contact.contactId}" />
                <s:hidden name="contact.createdTimestamp" value="%{contact.createdTimestamp}" />
                <s:hidden name="contact.createdBy" value="%{contact.createdBy}" />
                    <div class="form-group">
                        <label for="contact.contactType">Contact Type</label>
                        <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                  listKey="key" listValue="value" cssClass="form-control"
                                  value="contact.contactType" emptyOption="true"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.lastName">Last Name</label>
                        <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                     id="contact.lastName" required="true" maxLength="30" autofocus="true"
                                     pattern="[a-zA-Z\s]+"
                                     title="Name should not contain special characters and/or numbers."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">First Name</label>
                        <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                     id="contact.firstName" maxLength="30" pattern="[a-zA-Z\s]+"
                                     title="Name should not contain special characters and/or numbers."
                                     required="true"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.middleName">Middle Name</label>
                        <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                     id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s]+"
                                     title="Name should not contain special characters and/or numbers."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.phone">Phone</label>
                        <s:textfield cssClass="form-control" placeholder="contact.phone" name="contact.phone"
                                     maxLength="7" required="true" pattern="\d{7}"
                                     title="Phone should not contain special characters and/or letters. Must be 7 digits."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.mobile">Mobile</label>
                        <s:textfield cssClass="form-control" placeholder="contact.mobile" name="contact.mobile"
                                     maxLength="11" required="true"
                                     pattern="\d{11}"
                                     title="Mobile should not contain special characters and/or letters."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.fax">Fax</label>
                        <s:textfield cssClass="form-control" placeholder="contact.fax" name="contact.fax"
                                     maxLength="11" pattern="[0-9]+"
                                     title="Fax should not contain special characters and/or letters."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.email">E-Mail</label>
                        <s:textfield cssClass="form-control" placeholder="contact.email" name="contact.email"
                                     type="email" required="true"/>

                    </div>

                    <div class="pull-right">
                        <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                    </div>

                </s:form>

            </div>
        </div>
    </div>
    <div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">

            <ul class="nav nav-pills nav-stacked">
           	   <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li class="active"><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</div>