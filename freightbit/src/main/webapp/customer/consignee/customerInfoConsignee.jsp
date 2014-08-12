<%@ taglib prefix="s" uri="/struts-tags" %>
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
            <li class="active"><a href="<s:url action='viewConsignees' />"> Consignee List</a>
            </li>
            <li class="active"> Consignee Profile</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Consignee Profile</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-3 col-lg-3 " align="center">
                        <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                    </div>
                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td style="font-weight: bold;">First Name:</td>
                                <td><s:property value="consignee.firstName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Middle Name:</td>
                                <td><s:property value="consignee.middleName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Last Name:</td>
                                <td><s:property value="consignee.lastName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Phone:</td>
                                <td><s:property value="consignee.phone"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Mobile:</td>
                                <td><s:property value="consignee.mobile"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Email:</td>
                                <td><s:property value="consignee.email"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Fax:</td>
                                <td><s:property value="consignee.fax"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Address 1:</td>
                                <td><s:property value="consignee.addressLine1"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Address 2:</td>
                                <td><s:property value="consignee.addressLine2"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">City:</td>
                                <td><s:property value="consignee.city"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">State:</td>
                                <td><s:property value="consignee.state"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">ZIP:</td>
                                <td><s:property value="consignee.zip"/></td>
                            </tr>

                            </tbody>
                            <s:set name="customerId" value="%{customer.customerId}" scope="session"/>

                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="col-lg-3 col-lg-offset-2">
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
    </div>
</div>