<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Contact Person</h1>

    <!-- EDIT HERE -->
    <div class="main-box">

        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="../includes/images/add-user.png" class="box-icon">
                <span class="panel-title">Contact Person Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form action="editShippingContact" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="contact.contactId" value="%{contact.contactId}"/>

                    <div class="form-group">

                        <label for="contact.contactType" class="col-sm-2 control-label"> Contact Type:</label>

                        <div class="col-sm-10">
                            <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                      listKey="key" listValue="value" cssClass="form-control"
                                      value="contact.contactType"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="contact.lastName" class="col-sm-2 control-label">Last Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                         id="contact.lastName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="contact.firstName" class="col-sm-2 control-label">First Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                         id="contact.firstName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="contact.middleName" class="col-sm-2 control-label">Middle Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="contact.middleName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="contact.phone" class="col-sm-2 control-label">Phone:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.phone" name="contact.phone"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="contact.mobile" class="col-sm-2 control-label">Mobile:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.mobile" name="contact.mobile"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="contact.fax" class="col-sm-2 control-label">Fax:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.fax" name="contact.fax"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="contact.email" class="col-sm-2 control-label">E-mail:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.email" name="contact.email"/>
                        </div>

                    </div>

                </div>
            </div>

            <div class="panel-footer">

                <div class="btn-group pull-right">
                    <button class="btn btn-default">Cancel</button>
                    <s:submit cssClass="btn btn-default" name="submit" value="Save"/>

                </div>
            </div>
            </s:form>
        </div>

    </div>

    <div class="sidebar-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/calendar.png" class="box-icon">
                <span class="booking panel-title">Process</span>
            </div>

            <div class="panel-body">

                <ul class="nav">
                    <li><a href="viewVessels" class="side-help" style="font-size: 15px;"><img src="../includes/images/1.png"
                                                                                              class="img-sidehelp" >List of Vessels</a>
                    </li>
                    <li><a href="viewVendorShippingContacts" class="side-help" style="font-size: 15px;"><img src="../includes/images/2.png" class="img-sidehelp">Contact Persons</a>
                    </li>
                    <li><a href="viewShippingAddress" class="side-help" style="font-size: 15px;"><img src="../includes/images/3.png"
                                                                                                      class="img-sidehelp">Address</a>
                    </li>
                </ul>

            </div>
        </div>
    </div>

</div>
--%>

<!-- END OF THE MIDDLE -->

<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> <i class="fa fa-info-circle"></i> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewVendorTruckingContacts' />"><i class="fa fa-group"></i>
                Contact Persons</a></li>
            <li class="active"><i class="fa fa-user"></i> Edit Contact Person</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-user"></i> Edit Contact Person</h3>
            </div>

            <div class="panel-body">

                <s:form role="form" action="editShippingContact" theme="bootstrap">
                    <s:hidden name="contact.contactId" value="%{contact.contactId}"/>
                    <s:hidden name="contact.createdTimestamp" value="%{contact.createdTimestamp}" />
                    <s:hidden name="contact.createdBy" value="%{contact.createdBy}" />
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


                    <%--<button class="btn btn-default">Cancel</button>--%>
                    <div class="pull-right">
                        <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                    </div>
                    <%--<button type="submit" class="btn btn-default">Cancel</button>
                    <button type="reset" class="btn btn-default">OK</button>--%>


                </s:form>

            </div>
        </div>
    </div>


    <div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li class="active"><a href="#"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>


            </ul>
        </div>
    </div>
</div>
<!-- /.row -->
