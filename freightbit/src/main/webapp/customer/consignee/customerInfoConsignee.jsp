<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 6/25/14
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->

    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><s:property value="consignee.lastName" />, <s:property value="consignee.firstName" /></h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 " align="center">
                                <img alt="User Pic" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100" class="img-circle">
                            </div>
                            <div class=" col-md-9 col-lg-9 ">
                                <table class="table table-user-information">
                                    <tbody>
                                    <tr>
                                        <td>First Name:</td>
                                        <td><s:property value="consignee.firstName" /></td>
                                    </tr>
                                    <tr>
                                        <td>Middle Name:</td>
                                        <td><s:property value="consignee.middleName" /></td>
                                    </tr>
                                    <tr>
                                        <td>Last Name:</td>
                                        <td><s:property value="consignee.lastName" /></td>
                                    </tr>
                                    <tr>
                                        <td>Phone:</td>
                                        <td><s:property value="consignee.phone" /></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile:</td>
                                        <td><s:property value="consignee.mobile" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><a href="mailto:info@support.com"><s:property value="consignee.email" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>Fax:</td>
                                        <td><s:property value="consignee.fax" /></td>
                                    </tr>
                                    <tr>
                                        <td>Address 1:</td>
                                        <td><s:property value="consignee.addressLine1" /></td>
                                    </tr>
                                    <tr>
                                        <td>Address 2:</td>
                                        <td><s:property value="consignee.addressLine2" /></td>
                                    </tr>
                                    <tr>
                                        <td>City:</td>
                                        <td><s:property value="consignee.city" /></td>
                                    </tr>
                                    <tr>
                                        <td>State:</td>
                                        <td><s:property value="consignee.state" /></td>
                                    </tr>
                                    <tr>
                                        <td>ZIP:</td>
                                        <td><s:property value="consignee.zip" /></td>
                                    </tr>

                                    </tbody>
                                    &lt;%&ndash;<s:set name="customerId" value="%{customer.customerId}" scope="session"/>&ndash;%&gt;

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
								<span class="pull-right">
								<a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
								<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
								</span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>--%>


<!-- END OF MAIN BOX -->


<!-- END OF THE MIDDLE -->


<div class="row">
    <div class="col-lg-12">
        <h1>Customer Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewConsignees' />"><i class="fa fa-list"></i> Consignee List</a>
            </li>
            <li class="active"><i class="fa fa-info-circle"></i> Consignee Profile</li>
        </ol>

    </div>
</div>
<!-- /.row -->

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

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

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
<!-- /.row -->




