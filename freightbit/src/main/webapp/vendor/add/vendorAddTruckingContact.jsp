<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building"></i> Vendor Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewVendorTruckingContacts' />">
                Contact Persons</a></li>
            <li class="active"> Add Contact Person</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-user"></i> Add Contact Person</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">

                    <s:form role="form" action="addTruckingContact" cssClass="form-horizontal" theme="bootstrap">

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Contact Type<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                      listKey="key" listValue="value" cssClass="addTruckingContactInput form-control"
                                      value="contact.contactType"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Position<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control addTruckingContactInput" placeholder="Position" name="contact.position" required="true" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" maxLength="45"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Last Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="addTruckingContactInput form-control" placeholder="Last Name" name="contact.lastName"
                                         id="contact.lastName" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Name should not contain special characters and/or numbers." required="true" maxlength="30"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">First Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control addTruckingContactInput" placeholder="First Name" name="contact.firstName"
                                         id="contact.firstName" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Name should not contain special characters and/or numbers." required="true" maxlength="30"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Middle Name</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="contact.middleName" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Name should not contain special characters and/or numbers." maxlength="30"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Telephone<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control addTruckingContactInput" placeholder="(XXX)XXX-XXXX" name="contact.phone" maxLength="14" required="true"
                                         id="trucking_phone" title="(XXX) XXX-XXXX Telephone Number should not contain special characters and/or letters." pattern=".{14,}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Mobile<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control addTruckingContactInput" placeholder="(+639XX)(XXX-XXXX)" name="contact.mobile" maxLength="18"
                                         id="trucking_mobile" required="true" pattern=".{18,}"
                                         title="(+639XX) (XXX-XXXX) Mobile should not contain special characters and/or letters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Fax</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="(XXX)XXX-XXXX" name="contact.fax" maxLength="14" pattern=".{14,}"
                                        id="trucking_fax" title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">E-mail<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control addTruckingContactInput" placeholder="E-mail" name="contact.email" maxLength="50" required="true"
                                         pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$" title="Example: example@domain.com" />
                            </div>
                        </div>


                        <%--<button class="btn btn-default">Cancel</button>--%>
                        <%--<div class="pull-right">
                            <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                        </div>

                    </s:form>--%>

                </div>

            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewVendorTruckingContacts" class="btn btn-danger" id ="groups-btn">Cancel</a>
                    <s:submit cssClass="addTruckingContactBtn btn btn-primary" name="submit" value="Save" disabled="true"/>
                </div>
            </div>
            </s:form>

        </div>
    </div>

    <%--<div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li class="active"><a href="#"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>--%>

</div>

<script type="text/javascript">
    $(document).ready(function(){
        validationForm('addTruckingContactInput', 'addTruckingContactBtn');
        $("#trucking_phone").mask("(999) 999-9999");
        $("#trucking_mobile").mask("(+63999)(999-9999)");
        $("#trucking_fax").mask("(999) 999-9999");
    });
</script>