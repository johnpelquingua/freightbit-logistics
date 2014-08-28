<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a></li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer Profile</a></li>
            <li class="active"><a href="<s:url action='viewCustomerContacts' />"> Contact Person List</a></li>
            <li class="active"> Edit Contact Person</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Contact Person</h3>
            </div>

            <div class="panel-body">

                <s:form action="editCustomerContact" cssClass="form-horizontal" theme="bootstrap">
                <s:hidden name="contact.contactId" value="%{contact.contactId}" />
                <s:hidden name="contact.createdTimestamp" value="%{contact.createdTimestamp}" />
                <s:hidden name="contact.createdBy" value="%{contact.createdBy}" />
                    <div class="form-group">
                        <label for="contact.contactType" class="col-lg-2 control-label" style="padding-top:0px;">Contact Type</label>
                        <div class="col-lg-10" >
                            <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                      listKey="key" listValue="value" cssClass="form-control"
                                      value="contact.contactType" emptyOption="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.lastName" class="col-lg-2 control-label" style="padding-top:0px;">Last Name</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                         id="contact.lastName" required="true" maxLength="30" autofocus="true"
                                         pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.firstName" class="col-lg-2 control-label" style="padding-top:0px;">First Name</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                         id="contact.firstName" maxLength="30" pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."
                                         required="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.middleName" class="col-lg-2 control-label" style="padding-top:0px;">Middle Name</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.phone" class="col-lg-2 control-label" style="padding-top:0px;">Phone</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="contact.phone" name="contact.phone"
                                         maxLength="14" required="true" 
										 pattern="\([0-9]{2,3}\) ?[0-9]{3}-[0-9]{4}" title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.mobile" class="col-lg-2 control-label" style="padding-top:0px;">Mobile</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="contact.mobile" name="contact.mobile"
                                         maxLength="19" required="true"
                                         pattern="\(\+63[0-9]{3}\) ?\([0-9]{3}-[0-9]{4}\)"
                                         title="(+639XX) (XXX-XXXX) Mobile should not contain special characters and/or letters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.fax" class="col-lg-2 control-label" style="padding-top:0px;">Fax</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="contact.fax" name="contact.fax"
                                         maxLength="14"  
                                         pattern="\([0-9]{2,3}\) ?[0-9]{3}-[0-9]{4}" title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.email" class="col-lg-2 control-label" style="padding-top:0px;">E-Mail</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="contact.email" name="contact.email"
                                         type="email" required="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact.email" class="col-lg-2 control-label" style="padding-top:0px;">Position</label>
                        <div class="col-lg-10" >
                            <s:textfield cssClass="form-control" placeholder="Position  " name="contact.position"
                                         type="text" required="true"/>
                        </div>
                    </div>

            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewCustomerContacts" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>

    <%--<div class="col-lg-2 col-lg-offset-2">
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
    </div>--%>

</div>