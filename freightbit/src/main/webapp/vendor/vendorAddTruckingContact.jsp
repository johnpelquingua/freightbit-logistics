<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Contact Person</h1>
    <!-- EDIT HERE -->
    <div class="main-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="panel-title">Contact Person Information</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form action="addTruckingContact" cssClass="form-horizontal" theme="bootstrap">
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
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/calendar.png" class="box-icon">
                <span class="panel-title">Process</span>
            </div>
            <div class="panel-body" style="height: 195px;">
                <ul class="nav" style="margin-top: -10px;">

                    <li>
                        <a href="viewTrucks" class="side-help" style="font-size: 15px;">
                            <img src="includes/images/1.png" class="img-sidehelp">List of Trucks
                        </a>
                    </li>
                    <li><a href="viewDrivers" class="side-help" style="font-size: 15px;">
                        <img src="includes/images/2.png" class="img-sidehelp">Driver Information</a>
                    </li>
                    <li>
                        <a href="viewVendorTruckingContacts" class="side-help" style="font-size: 15px;">
                            <img src="includes/images/3.png" class="img-sidehelp">Contact Information
                        </a>
                    </li>
                    <li>
                        <a href="viewTruckingAddress" class="side-help" style="font-size: 15px;">
                            <img src="includes/images/4.png" class="img-sidehelp">Address</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


</div>

<!-- END OF THE MIDDLE -->
