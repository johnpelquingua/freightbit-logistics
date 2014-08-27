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
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-user"></i> Add New Contact Person</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">

                    <s:form role="form" action="addShippingContact" cssClass="form-horizontal" theme="bootstrap">

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Contact Type</label>
                            <div class="col-lg-10">
                            <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                      listKey="key" listValue="value" cssClass="form-control"
                                      value="contact.contactType"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Last Name</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                         id="contact.lastName" patttern="[A-Za-z\s]+" title="Must be letters only"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">First Name</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                         id="contact.firstName" patttern="[A-Za-z\s]+" title="Must be letters only"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Middle Name</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="contact.middleName" patttern="[A-Za-z\s]+" title="Must be letters only"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Phone</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Phone" name="contact.phone" maxLength="7" pattern="\d{7}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Mobile</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Mobile" name="contact.mobile" maxLength="11" pattern="\d{11}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Fax</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Fax" name="contact.fax" pattern="[0-9]+"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">E-Mail</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="E-Mail" name="contact.email" type="email" id="emailfield" />
                            </div>
                        </div>

                        <%--<div class="pull-right">
                            <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                        </div>
                    </s:form>--%>

                </div>

            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewVendorShippingContacts" class="btn btn-default" id ="groups-btn">Cancel</a>

                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>

        </div>
    </div>

    <%--<div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li class="active"><a href="#"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>
            </ul>
        </div>
    </div>--%>
    <script type="text/javascript">
        var emailbean = document.getElementById('emailfield').value;
        var emailf = document.getElementById('emailfield');
        var emailformat = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,3})+$/ ;
        function validateEmail(){
            if(!emailformat.test(emailf.value)){
                alert("Invalid email use the format: email@yahoo.com");
                emailf.focus();
            }
        }

        var emailf2 = document.getElementById('emailfield');
        emailf2.onchange= function(){
            validateEmail();
        };
    </script>

</div>