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
            <li class="active"><a href="<s:url action='viewAddress' />"> Address List</a></li>
            <li class="active"> Edit Address</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Address</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form action="editAddress" cssClass="form-horizontal" theme="bootstrap">
                        <s:hidden name="address.addressId" value="%{addressIdParam}"/>
                        <s:hidden name="address.createdTimeStamp" value="%{address.createdTimeStamp}" />
                        <s:hidden name="address.createdBy" value="%{address.createdBy}" />

                        <div class="form-group">

                            <label for="address.addressType" class="col-lg-2 control-label" style="padding-top:0px;">Address
                                Type<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">
                                <s:select name="address.addressType" list="addressTypeList" listValue="value"
                                          listKey="key" required="true"
                                          cssClass="form-control" id="address.addressType" emptyOption="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Address Line 1<span class="asterisk_red"></span></label>

                            <div class="col-lg-10" >
                                <s:textfield name="address.addressLine1" id="address.addressLine1"
                                             cssClass="form-control" maxlength="50" pattern="^(\s*[\#a-zA-Z0-9\.\,]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\#]*)\s*)+$"
                                             title="Address Line 1 will only accept alphanumeric and will only allow # , and . as special characters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Address Line 2</label>

                            <div class="col-lg-10" >
                                <s:textfield name="address.addressLine2" id="address.addressLine2"
                                             cssClass="form-control" maxlength="50" pattern="^(\s*[\#a-zA-Z0-9\.\,]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\#]*)\s*)+$"
                                             title="Address Line 2 will only accept alphanumeric and will only allow # , and . as special characters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">City<span class="asterisk_red"></span></label>

                            <div class="col-lg-10" >
                                <s:textfield name="address.city" id="address.city" cssClass="form-control" maxlength="50"
                                             pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" title="City should not contain special characters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Region<span class="asterisk_red"></label>

                            <div class="col-lg-10" >
                                <s:textfield name="address.state" id="address.state" cssClass="form-control" maxlength="50"
                                             pattern="^(\s*[a-zA-Z]+(([\'\-\+\s]\s*[a-zA-Z])?[a-zA-Z]*)\s*)+$" title="Region should not contain special characters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Zip Code<span class="asterisk_red"></span></label>

                            <div class="col-lg-10" >
                                <s:textfield name="address.zip" id="address.zip" cssClass="form-control" required="true" maxlength="4"
                                             title="Zip Code is required. Must be 4 digits only" pattern="^[0-9]{4,}$"/>
                            </div>
                        </div>

                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewAddress" class="btn btn-default" id ="groups-btn">Cancel</a>

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
                <li class="active"><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
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