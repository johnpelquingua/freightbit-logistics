<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer List Address </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer
                Profile</a></li>
            <li class="active"> Address</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-10">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="position: relative; top: 2px;"><i class="fa fa-home"></i> Address</h3>

            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="address" name="addresss" requestURI="viewAddress.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="addressType" title="Address Type" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="addressLine1" title="Address 1" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="addressLine2" title="Address 2" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="city" title="City" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="state" title="State" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="zip" title="Zip" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="loadEditAddressUrl" action="loadEditAddress">
                                            <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                        </s:url>
                                        <s:a href="%{loadEditAddressUrl}" class="icon-action-link" rel="tooltip"
                                             title="Edit this Vendor Address"><img
                                                src="../includes/images/edit-user.png"
                                                class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteAddressUrl" action="deleteAddress">
                                            <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                             title="Delete this Vendor Address"
                                             onclick="return confirm('Do you really want to delete?');"><img
                                                src="../includes/images/remove-user.png"
                                                class="icon-action circ-icon"> </s:a>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>

                </div>

            </div>

            <div class="panel-footer">

            <span class="pull-right">
                <s:url var="loadAddAddressUrl" action="loadAddAddress">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="Add Contact">
                    <img src="../includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>

        </div>
    </div>

    <div class="col-lg-2">
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