<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 6/25/14
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Consignee Module</h1>

    <div class="col-md-12">
        <div class="panel panel-info">

            <div class="panel-heading">

                <img src="../includes/images/listofusers.png" class="box-icon"/> <span
                    class="panel-title">List of Consignees</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black">First Name</th>
                            <th class="tb-font-black">Last Name</th>
                            <th class="tb-font-black">Phone</th>
                            <th class="tb-font-black">Mobile</th>
                            <th class="tb-font-black">Email</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="consignees" var="consignee">
                            <tr>
                                <td class="tb-font-black"><s:property value="firstName"/></td>
                                <td class="tb-font-black"><s:property value="LastName"/></td>
                                <td class="tb-font-black"><s:property value="Phone"/></td>
                                <td class="tb-font-black"><s:property value="Mobile"/></td>
                                <td class="tb-font-black"><s:property value="Email"/></td>

                                <td>

                                    <s:url var="loadEditConsigneeUrl" action="loadEditConsignee">
                                        <s:param name="contactCodeParam" value="%{contactId}"></s:param>
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a href="%{loadEditConsigneeUrl}" class="icon-action-link" rel="tooltip"
                                         title="Edit this Vendor Address"><img src="../includes/images/edit-user.png"
                                                                               class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteConsigneeUrl" action="deleteConsignee">
                                        <s:param name="contactCodeParam" value="%{contactId}"></s:param>
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteConsigneeUrl}" rel="tooltip"
                                         title="Delete this Consignee"
                                         onclick="return confirm('Do you really want to delete?');"><img
                                            src="../includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                    <s:url var="consigneeInfoUrl" action="consigneeInfo">
                                        <s:param name="contactCodeParam" value="%{contactId}"></s:param>
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{consigneeInfoUrl}" rel="tooltip"><img
                                            src="../includes/images/info-b.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="panel-footer">

                <ul class="pagination">
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li class="disabled"><a href="#">&raquo;</a></li>
                </ul>

            <span class="pull-right">
                <s:url var="loadAddConsigneeUrl" action="loadAddConsignee">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddConsigneeUrl}" rel="tooltip" title="Add Contact">
                    <img src="../includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>
        </div>
    </div>
</div>--%>


<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer List Consignee </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer
                Profile</a></li>
            <li class="active"><i class="fa fa-list"></i> Consignee List</li>
        </ol>

    </div>
</div>
<!-- /.row -->

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
                <h3 class="panel-title" style="position: relative; top: 2px;"><i class="fa fa-list"></i> Consignee List
                </h3>

            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <%--<table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black" style="text-align: center;">First Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Last Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Phone <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Mobile <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Email <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="consignees" var="consignee">
                            <tr>
                                <td class="tb-font-black"><s:property value="firstName"/></td>
                                <td class="tb-font-black"><s:property value="LastName"/></td>
                                <td class="tb-font-black"><s:property value="Phone"/></td>
                                <td class="tb-font-black"><s:property value="Mobile"/></td>
                                <td class="tb-font-black"><s:property value="Email"/></td>

                                <td>

                                    <s:url var="loadEditConsigneeUrl" action="loadEditConsignee">
                                        <s:param name="contactCodeParam" value="%{contactId}"></s:param>
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a href="%{loadEditConsigneeUrl}" class="icon-action-link" rel="tooltip"
                                         title="Edit this Vendor Address"><img src="../includes/images/edit-user.png"
                                                                               class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteConsigneeUrl" action="deleteConsignee">
                                        <s:param name="contactCodeParam" value="%{contactId}"></s:param>
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteConsigneeUrl}" rel="tooltip"
                                         title="Delete this Consignee"
                                         onclick="return confirm('Do you really want to delete?');"><img
                                            src="../includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                    <s:url var="consigneeInfoUrl" action="consigneeInfo">
                                        <s:param name="contactCodeParam" value="%{contactId}"></s:param>
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{consigneeInfoUrl}" rel="tooltip"><img
                                            src="../includes/images/info-b.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>--%>

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="consignee" name="consignees" requestURI="/viewConsignees.action"
                                           pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="firstName" title="First Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="lastName" title="Last Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="phone" title="Phone" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="mobile" title="Mobile" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="email" title="E-mail" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="loadEditConsigneeUrl" action="loadEditConsignee">
                                            <s:param name="contactCodeParam"
                                                     value="%{#attr.consignee.contactId}"></s:param>
                                            <s:param name="addressIdParam"
                                                     value="%{#attr.consignee.addressId}"></s:param>
                                        </s:url>
                                        <s:a href="%{loadEditConsigneeUrl}" class="icon-action-link" rel="tooltip"
                                             title="Edit this Vendor Address"><img src="../includes/images/edit-user.png"
                                                                                   class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteConsigneeUrl" action="deleteConsignee">
                                            <s:param name="contactCodeParam"
                                                     value="%{#attr.consignee.contactId}"></s:param>
                                            <s:param name="addressIdParam"
                                                     value="%{#attr.consignee.addressId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteConsigneeUrl}" rel="tooltip"
                                             title="Delete this Consignee"
                                             onclick="return confirm('Do you really want to delete?');"><img
                                                src="../includes/images/remove-user.png"
                                                class="icon-action circ-icon"> </s:a>
                                        <s:url var="consigneeInfoUrl" action="consigneeInfo">
                                            <s:param name="contactCodeParam"
                                                     value="%{#attr.consignee.contactId}"></s:param>
                                            <s:param name="addressIdParam"
                                                     value="%{#attr.consignee.addressId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{consigneeInfoUrl}" rel="tooltip"><img
                                                src="../includes/images/info-b.png" class="icon-action circ-icon"> </s:a>
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
                <s:url var="loadAddConsigneeUrl" action="loadAddConsignee">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddConsigneeUrl}" rel="tooltip" title="Add Contact">
                    <img src="../includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>

        </div>
    </div>
    <div class="col-lg-2">
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



