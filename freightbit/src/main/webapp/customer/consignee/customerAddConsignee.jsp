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
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewConsignees' />"> Consignee List</a>
            </li>
            <li class="active">Add Consignee</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add Consignee</h3>
            </div>

            <div class="panel-body">

                <s:form cssClass="form-horizontal" action="addConsignee" theme="bootstrap">

                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Company Name<span class="asterisk_red"></span>
                        </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.companyName" cssClass="form-control" id="consignee.companyName"
                                         placeholder="Company Name" maxLength="40" required="true" style="width:95%"
                                         pattern="^(\s*[\"\#a-zA-Z0-9\.\,\-\&]+(([\"\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\"\.\,\-\&\#]*)\s*)+$" autofocus="true"
                                         title="Company Name should not contain special characters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.lastName" class="col-lg-2 control-label" style="padding-top:0px;">Last Name<span class="asterisk_red"></span>
                        </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.lastName" cssClass="addConsigneeInput form-control" id="consignee.lastName"
                                         placeholder="Last Name" maxLength="30" required="true" style="width:95%"
                                         pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" autofocus="true"
                                         title="Last Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>


                    <div class="form-group">

                        <label for="consignee.firstName" class="col-lg-2 control-label " style="padding-top:0px;">First Name<span class="asterisk_red"></span></label>
                                 <div class="col-sm-10 " >
                                     <s:textfield name="consignee.firstName" cssClass="addConsigneeInput form-control" id="consignee.firstName"
                                                  placeholder="First Name" maxLength="30" required="true" style="width:95%"
                                                  pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$"
                                                  title="First Name should not contain special characters and/or numbers." />
                                 </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.middleName" class="col-lg-2 control-label" style="padding-top:0px;">Middle Name </label>
                        <div class="col-lg-10" >

                            <s:textfield name="consignee.middleName" cssClass="form-control"
                                         id="consignee.middleName"
                                         placeholder="Middle Name" maxLength="30" pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" style="width:95%"
                                         title="Middle Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.email" class="col-lg-2 control-label" style="padding-top:0px;">Email Address <span class="asterisk_red"></span>
                        </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.email" cssClass="addConsigneeInput form-control" id="consignee.email" style="width:95%"
                                         placeholder="Email Address" required="true" maxLength="50" title="Example: example@domain.com"
                                         pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{3,})$"
                                    />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.phone" class="col-lg-2 control-label" style="padding-top:0px;">Phone<span class="asterisk_red"></span>
                        </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.phone" cssClass="addConsigneeInput form-control" id="consignee_phone"
                                         placeholder="(XXX) XXX-XXXX" maxLength="14" required="true" style="width:95%" pattern=".{14,}"
                                         title="Phone number should contain 10 digits including local city code."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.mobile" class="col-lg-2 control-label" style="padding-top:0px;">Mobile<span class="asterisk_red"></span>
                        </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.mobile" cssClass="addConsigneeInput form-control" id="consignee_mobile"
                                         placeholder="(+639XX) (XXX-XXXX)" maxLength="18" required="true" style="width:95%" pattern=".{18,}"
                                         title="Mobile number should contain 11 digits."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.fax" class="col-lg-2 control-label" style="padding-top:0px;">Fax </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.fax" cssClass="form-control" id="consignee_fax"
                                         placeholder="(XXX) XXX-XXXX" maxLength="14" style="width:95%" pattern=".{14,}"
                                         title="Fax number should contain 10 digits including local city codes."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.addressLine1" class="col-lg-2 control-label" style="padding-top:0px;">Address
                            Line 1<span class="asterisk_red"></span></label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.addressLine1" cssClass="addConsigneeInput form-control"
                                         id="consignee.addressLine1" placeholder="Address 1" required="true" style="width:95%"
                                         maxLength="100" pattern="^(\s*[\#a-zA-Z0-9\.\,]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\#]*)\s*)+$"
                                         title="Address Line 1 will only accept alphanumeric and will only allow # , and . as special characters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.addressLine2" class="col-lg-2 control-label" style="padding-top:0px;">Address
                            Line 2</label>

                        <div class="col-lg-10" >
                            <s:textfield name="consignee.addressLine2" cssClass="form-control" style="width:95%"
                                         id="consignee.addressLine2" placeholder="Address 2" maxLength="100"
                                         pattern="^(\s*[\#a-zA-Z0-9\.\,]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\#]*)\s*)+$"
                                         title="Address Line 2 will only accept alphanumeric and will only allow # , and . as special characters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.city" class="col-lg-2 control-label" style="padding-top:0px;">City<span class="asterisk_red"></span>
                        </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.city" cssClass="addConsigneeInput form-control"
                                         id="consignee.city" placeholder="City" required="true" style="width:95%"
                                         pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" maxLength="50"
                                         title="City should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Region
                        </label>

                        <div class="col-lg-10" >
                            <s:textfield name="consignee.state" cssClass="form-control"
                                         id="consignee.state" placeholder="Region" maxLength="50"
                                         pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" style="width:95%"
                                         title="Region should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.zip" class="col-lg-2 control-label" style="padding-top:0px;">ZIP<span class="asterisk_red"></span>
                        </label>

                        <div class="col-lg-10" >

                            <s:textfield name="consignee.zip" cssClass="addConsigneeInput form-control"
                                         id="consignee.zip" placeholder="ZIP" required="true"
                                         pattern="^[0-9]{4}$" maxLength="4" style="width:95%"

                                         title="ZIP should not contain special characters and/or letters."
                                         onkeypress="return isNumberKey(event)"/>
                        </div>
                    </div>

            </div>

            <div class="panel-footer">
                <div class= "pull-right">
                    <%--<button type="button" class="btn" onclick="location.href='customerList'">
                        Cancel
                    </button>--%>
                    <a href="viewConsignees" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit name="submit" cssClass="addConsigneeBtn btn btn-primary" value="Save" disabled="true"/>
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
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li class="active"><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>--%>

</div>

<script type="text/javascript">
    $(document).ready(function(){
        validationForm('addConsigneeInput', 'addConsigneeBtn');
        $("#consignee_phone").mask("(999) 999-9999");
        $("#consignee_mobile").mask("(+63999)(999-9999)");
        $("#consignee_fax").mask("(999) 999-9999");
    });

    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }

</script>