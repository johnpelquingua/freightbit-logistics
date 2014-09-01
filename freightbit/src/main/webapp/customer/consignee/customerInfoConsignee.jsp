<%@ taglib prefix="s" uri="/struts-tags" %>
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
            <li class="active"> Consignee Profile</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12" >
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Consignee Profile</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success" onclick="location.href=''">
                        <i class="fa fa-pencil"></i> Edit Consignee
                    </button>
                </span>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-lg-6 col-lg-offset-2">

                        <div class="panel panel-info">
                            <%--<div class="panel-heading">--%>
                                <%--<h3 class="panel-title"><i class="fa fa-info-circle"></i> Details</h3>--%>
                            <%--</div>--%>

                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                        </div>
                                    </div>

                                    <div class="col-lg-9">
                                        <table class="table table-user-information" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; border-top: none; text-align: left !important;">First Name</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="consignee.firstName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Middle Name</td>
                                                <td style="text-align: left !important"><s:property value="consignee.middleName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Last Name</td>
                                                <td style="text-align: left !important"><s:property value="consignee.lastName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Phone</td>
                                                <td style="text-align: left !important"><s:property value="consignee.phone"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Mobile</td>
                                                <td style="text-align: left !important"><s:property value="consignee.mobile"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Email</td>
                                                <td style="text-align: left !important"><s:property value="consignee.email"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Fax</td>
                                                <td style="text-align: left !important"><s:property value="consignee.fax"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Address Line 1</td>
                                                <td style="text-align: left !important"><s:property value="consignee.addressLine1"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Address Line 2</td>
                                                <td style="text-align: left !important"><s:property value="consignee.addressLine2"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">City</td>
                                                <td style="text-align: left !important"><s:property value="consignee.city"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">Region</td>
                                                <td style="text-align: left !important"><s:property value="consignee.state"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:Bold; font-size: 12px; text-align: left !important;">ZIP</td>
                                                <td style="text-align: left !important"><s:property value="consignee.zip"/></td>
                                            </tr>

                                            </tbody>
                                            <%--<s:set name="customerId" value="%{customer.customerId}" scope="session"/>--%>
                                            <s:set name="customerId" value="%{consignee.referenceId1}" scope="session"/>
                                            <%--<s:property value="%{consignee.referenceId1}" />--%>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-2 col-lg-offset-2">
                        <div class="panel panel-info" >
                            <%--<div class="panel-heading">--%>
                                <%--<h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>--%>
                            <%--</div>--%>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="customerInfo" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                            <a href="viewAddress" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                            <a href="viewCustomerContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>


                                            <a href="viewItem" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list-ol fa-fw"></i> <br/>Items</a>
                                        </sec:authorize>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                                            <a href="viewRates" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-money fa-fw"></i> <br/>Rates</a>
                                        </sec:authorize>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="viewConsignees" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list fa-fw"></i> <br/>Consignee</a>
                                        </sec:authorize>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>


    <%--<div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">

            <ul class="nav nav-pills nav-stacked">
           	   <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="customerInfo"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
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