<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer List </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"> Customer List</li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Customer List
                </h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking"
                            onclick="location.href='loadSearchCustomerPage'">
                        <i class="fa fa-search"></i> Search Customer
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddCustomerPage'">
                        <i class="fa fa-male"></i> New Customer
                    </button>
                </span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="customer" name="customers" requestURI="customerList.action"
                                           pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="customerName" title="Customer Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerType" title="Customer Type" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="email" title="E-mail Address" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="website" title="Website" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="phone" title="Contact Number" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editCustomerUrl" action="loadEditCustomerPage">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <sec:authorize
                                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <s:a href="%{editCustomerUrl}" class="icon-action-link" rel="tooltip"
                                                 title="Edit this Customer">
                                                <%--<img src="../includes/images/edit-user.png"
                                                     class="icon-action circ-icon"> --%>
                                                <i class="fa fa-pencil"></i>
                                            </s:a>
                                        </sec:authorize>

                                        <s:url var="deleteCustomerUrl" action="deleteCustomer">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <sec:authorize
                                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <s:a class="icon-action-link" href="%{deleteCustomerUrl}" rel="tooltip"
                                                 title="Delete this Customer"
                                                 onclick="return confirm('Do you really want to delete?');">
                                                <%--<img src="../includes/images/remove-user.png" class="icon-action circ-icon">--%>
                                                <i class="fa fa-trash-o"></i>
                                            </s:a>
                                        </sec:authorize>

                                        <s:url var="customerInfoUrl" action="customerInfo">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <sec:authorize
                                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                                            <s:a class="icon-action-link" href="%{customerInfoUrl}" rel="tooltip">
                                                <%--<img src="../includes/images/info-b.png" class="icon-action circ-icon">--%>
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </sec:authorize>
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
                    <button type="button" class="btn btn-success new-booking"
                            onclick="location.href='loadSearchCustomerPage'">
                        <i class="fa fa-search"></i> Search Customer
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddCustomerPage'">
                        <i class="fa fa-male"></i> New Customer
                    </button>
                </span>
            </div>
        </div>
    </div>
</div>