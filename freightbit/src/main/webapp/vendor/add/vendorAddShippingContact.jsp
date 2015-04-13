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
<%--start--%>
<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;"><i class="fa fa-info-circle"></i> Vendor Shipping Profile</h3>
                <%--<span class="pull-right">
                    <s:url var="editVendorUrl" action="loadEditVendorPage">
                        <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                    </s:url>
                        <s:a cssClass="btn btn-success new-booking" href="%{editVendorUrl}" rel="tooltip"
                             title="Edit this vendor">
                            <i class="fa fa-pencil"></i> Edit Vendor
                        </s:a>
                </span>--%>
            </div>

            <div class="panel-body">
                <%--<s:set name="vendorId" value="%{vendor.vendorId}" scope="session"/>--%>
                <s:hidden value="%{vendor.vendorId}"></s:hidden>
                <div class="row">
                    <div class=" col-lg-6 col-lg-offset-3">
                        <div class="panel panel-info ">

                            <%--<div align="center" style="margin-top: 10px;">
                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                            </div>--%>
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <div align="center" style="margin-top: 10px;">
                                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-9">

                                        <table class="table table-user-information profile" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Company Name</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="vendor.vendorName"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Company Code</td>
                                                <td><s:property value="vendor.vendorCode"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Type</td>
                                                <td><s:property value="vendor.vendorType"/></td>
                                            </tr>

                                            <tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Classification</td>
                                                <td><s:property value="vendor.vendorClass"/></td>
                                            </tr>
                                            <%--<tr>--%>
                                            <%--<td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Status</td>--%>
                                            <%--<td><s:property value="vendor.vendorStatus"/></td>--%>
                                            <%--</tr>--%>

                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>

                    <%--<div class="col-lg-2 col-lg-offset-2">
                        <div class="panel panel-info" >
                            &lt;%&ndash;<div class="panel-heading">&ndash;%&gt;
                            &lt;%&ndash;<h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>&ndash;%&gt;
                            &lt;%&ndash;</div>&ndash;%&gt;
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <a href="viewInfoVendor" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                        <a href="#" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                        <a href="viewVendorShippingContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>
                                        <a href="viewVessels" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-anchor fa-fw"></i> <br/>Vessels</a>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>--%>

                </div>

            </div>

        </div>

        <%--main content here--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-user"></i> Add New Contact Person</h3>
                    </div>

                    <div class="panel-body">

                        <div class="table-responsive list-table">

                            <s:form role="form" action="addShippingContact" cssClass="form-horizontal" theme="bootstrap">

                            <div class="form-group" style="display: none;">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Contact Type<span class="asterisk_red"></span></label>
                                <div class="col-lg-10">
                                    <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                              listKey="key" listValue="value" cssClass="form-control"
                                              value="contact.contactType"/>
                                        <%--<s:textfield cssClass="form-control" name="contact.contactType" value="VENDOR"/>--%>
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

                        </div>

                    </div>

                    <div class="panel-footer">
                        <div class="pull-right">
                            <a href="viewVendorShippingContacts" class="btn btn-danger" id ="groups-btn">Cancel</a>

                            <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                        </div>
                    </div>
                    </s:form>

                </div>
            </div>
        </div>
    </div>
</div>
<%--end--%>


<script type="text/javascript">
//jquery for masking telephone numbers
    $(document).ready(function(){

        $("#shipping_phone").mask("(999) 999-9999");
        $("#shipping_mobile").mask("(+63999)(999-9999)");
        $("#shipping_fax").mask("(999) 999-9999");

    });
</script>



