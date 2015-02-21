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
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Contact Type<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                      listKey="key" listValue="value" cssClass="form-control"
                                      value="contact.contactType"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Position<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" placeholder="Position" name="contact.position" required="true" maxlength="45"
                                             pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                             title="Title should not contain special characters and/or numbers."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Last Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName" maxLength="30"
                                         id="contact.lastName" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Last Name should not contain special characters and/or numbers." required="true"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">First Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName" maxLength="30"
                                         id="contact.firstName" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="First Name should not contain special characters and/or numbers." required="true"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Middle Name</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName" maxLength="30"
                                         id="contact.middleName" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                         title="Middle Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Phone<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="(XXX)XXX-XXXX" name="contact.phone" maxLength="14" required="true"
                            id="shipping_phone" title="Phone number should contain 10 digits including local city code." pattern=".{14,}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Mobile<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="(+639XX)(XXX-XXXX)" name="contact.mobile" maxLength="18"
                            id="shipping_mobile" required="true" pattern=".{18,}"
                            title="Mobile number should contain 11 digits."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Fax</label>
                            <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.fax" maxLength="14" pattern=".{14,}"
                                         id="shipping_fax" title="Fax number should contain 10 digits including local city codes."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">E-mail<span class="asterisk_red"></span></label>
                            <div class="col-lg-10">

                            <%--<s:textfield cssClass="form-control" placeholder="E-mail" name="contact.email" type="email" id="emailfield" />--%>

                            <s:textfield cssClass="form-control" placeholder="E-mail" name="contact.email" maxLength="50" required="true"
                                         pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
                                         title="Example: example@domain.com"/>

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
//        var emailbean = document.getElementById('emailfield').value;
//        var emailf = document.getElementById('emailfield');
//        var emailformat = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,3})+$/ ;
//        function validateEmail(){
//            if(!emailformat.test(emailf.value)){
//                alert("Invalid email use the format: email@yahoo.com");
//                emailf.focus();
//            }
//        }
//
//        var emailf2 = document.getElementById('emailfield');
//        emailf2.onchange= function(){
//            validateEmail();
//        };

//jquery for masking telephone numbers
                $(document).ready(function(){

                    $("#shipping_phone").mask("(999) 999-9999");
                    $("#shipping_mobile").mask("(+63999)(999-9999)");
                    $("#shipping_fax").mask("(999) 999-9999");

                });
    </script>



