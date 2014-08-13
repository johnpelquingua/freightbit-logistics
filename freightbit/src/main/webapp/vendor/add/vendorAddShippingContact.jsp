<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewVendorShippingContacts' />">
                Contact Persons</a></li>
            <li class="active"> Add New Contact Person</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-user"></i> Add New Contact Person</h3>
            </div>

            <div class="panel-body">

                <s:form role="form" action="addShippingContact" theme="bootstrap">

                    <div class="form-group">
                        <label for="contact.contactType">Contact Type</label>
                        <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                  listKey="key" listValue="value" cssClass="form-control"
                                  value="contact.contactType"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.lastName">Last Name</label>
                        <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                     id="contact.lastName" patttern="[A-Za-z\s]+" title="Must be letters only"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">First Name</label>
                        <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                     id="contact.firstName" patttern="[A-Za-z\s]+" title="Must be letters only"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">Middle Name</label>
                        <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                     id="contact.middleName" patttern="[A-Za-z\s]+" title="Must be letters only"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">Phone</label>
                        <s:textfield cssClass="form-control" placeholder="Phone" name="contact.phone" maxLength="7" pattern="\d{7}"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">Mobile</label>
                        <s:textfield cssClass="form-control" placeholder="Mobile" name="contact.mobile" maxLength="11" pattern="\d{11}"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">Fax</label>
                        <s:textfield cssClass="form-control" placeholder="Fax" name="contact.fax" pattern="[0-9]+"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">E-Mail</label>
                        <s:textfield cssClass="form-control" placeholder="E-Mail" name="contact.email" type="email"/>

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
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li class="active"><a href="#"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>
            </ul>
        </div>
    </div>

</div>