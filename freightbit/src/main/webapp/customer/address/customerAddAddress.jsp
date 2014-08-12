<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Customer Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewAddress' />"> Address </a></li>
            <li class="active"> Add New Address</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add New Address</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form action="addAddress" cssClass="form-horizontal" theme="bootstrap">
                        <div class="form-group">

                            <label for="address.addressType" class="col-sm-2 control-label" style="width:25%;">Address
                                Type</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:select name="address.addressType" list="addressTypeList" listValue="value"
                                          listKey="key"
                                          cssClass="form-control" id="address.addressType" emptyOption="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Address Line 1</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.addressLine1" id="address.addressLine1"
                                             cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Address Line 2</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.addressLine2" id="address.addressLine2"
                                             cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">City</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.city" id="address.city" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">State</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.state" id="address.state" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Zip Code</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="address.zip" id="address.zip" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="pull-right">
                            <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">

            <ul class="nav nav-pills nav-stacked">
                <sec:authorize
                        access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                    <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                    <li class="active"><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                    <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                    <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>

                <sec:authorize
                        access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                    <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>

                <sec:authorize
                        access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                    <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</div>