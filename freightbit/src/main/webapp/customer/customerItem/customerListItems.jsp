<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->

    <div class="panel panel-info">

        <div class="panel-heading">
            <img src="../includes/images/listofusers.png" class="box-icon"/>
            <span class="panel-title">List of Items</span>

        </div>

        <div class="panel-body">
            <div class="table-responsive list-table">
                <table class="table table-striped table-bordered text-center">
                    <thead>
                    <tr class="header_center">
                        <th class="tb-font-black">Item Name</th>
                        <th class="tb-font-black">Item Code</th>
                        <th class="tb-font-black">Length</th>
                        <th class="tb-font-black">Width</th>
                        <th class="tb-font-black">Height</th>
                        <th class="tb-font-black">SRP</th>
                        <th class="tb-font-black">Critical Quality</th>
                        <th class="tb-font-black">Base Price</th>
                        <th class="tb-font-black">Note</th>
                        <th class="tb-font-black">Description</th>
                        <th class="tb-font-black">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="items" var="item">
                        <tr>
                            <td class="tb-font-black"><s:property value="itemName"/></td>
                            <td class="tb-font-black"><s:property value="itemCode"/></td>
                            <td class="tb-font-black"><s:property value="length"/></td>
                            <td class="tb-font-black"><s:property value="width"/></td>
                            <td class="tb-font-black"><s:property value="height"/></td>
                            <td class="tb-font-black"><s:property value="srp"/></td>
                            <td class="tb-font-black"><s:property value="criticalQuality"/></td>
                            <td class="tb-font-black"><s:property value="basePrice"/></td>
                            <td class="tb-font-black"><s:property value="Note"/></td>
                            <td class="tb-font-black"><s:property value="Description"/></td>
                            <td class="tb-font-black">

                                <s:url var="editItemUrl" action="loadEditItem">
                                    <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editItemUrl}" rel="tooltip"
                                     title="Edit this driver">
                                    <img src="../includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>

                                <s:url var="deleteItemUrl" action="deleteItem">
                                    <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                     title="Delete this Item?"
                                     onclick="return confirm('Do you really want to delete?');">
                                    <img src="../includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
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
                <s:url var="loadAddItemUrl" action="loadAddItem">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddItemUrl}" rel="tooltip" title="Add Contact">
                    <img src="../includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>
        </div>

    </div>

</div>--%>

<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer List Items </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer
                Profile</a></li>
            <li class="active"><i class="fa fa-list-ol"></i> Items</li>
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
                <h3 class="panel-title" style="position: relative; top: 2px;"><i class="fa fa-list-ol"></i> Items</h3>

            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">
                    <%--<table class="table table-striped table-bordered text-center table-hover">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black" style="text-align: center;">Item Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Item Code <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Length <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Width <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Height <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">SRP <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Critical Quality <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Base Price <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Note <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Description <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="items" var="item">
                            <tr>
                                <td class="tb-font-black"><s:property value="itemName"/></td>
                                <td class="tb-font-black"><s:property value="itemCode"/></td>
                                <td class="tb-font-black"><s:property value="length"/></td>
                                <td class="tb-font-black"><s:property value="width"/></td>
                                <td class="tb-font-black"><s:property value="height"/></td>
                                <td class="tb-font-black"><s:property value="srp"/></td>
                                <td class="tb-font-black"><s:property value="criticalQuality"/></td>
                                <td class="tb-font-black"><s:property value="basePrice"/></td>
                                <td class="tb-font-black"><s:property value="Note"/></td>
                                <td class="tb-font-black"><s:property value="Description"/></td>
                                <td class="tb-font-black">

                                    <s:url var="editItemUrl" action="loadEditItem">
                                        <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editItemUrl}" rel="tooltip"
                                         title="Edit this driver">
                                        <img src="../includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteItemUrl" action="deleteItem">
                                        <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                         title="Delete this Item?"
                                         onclick="return confirm('Do you really want to delete?');">
                                        <img src="../includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>--%>

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="item" name="items" requestURI="/viewItem.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="itemName" title="Item Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="itemCode" title="Item Code" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="length" title="Length" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="width" title="Width" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="height" title="Height" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="srp" title="SRP" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="criticalQuality" title="Critical Quality"
                                                    class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="basePrice" title="Base Price" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="note" title="Note" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="description" title="Description" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editItemUrl" action="loadEditItem">
                                            <s:param name="customersItemIdParam"
                                                     value="%{#attr.item.customerItemsId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editItemUrl}" rel="tooltip"
                                             title="Edit this driver">
                                            <img src="../includes/images/edit-user.png"
                                                 class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteItemUrl" action="deleteItem">
                                            <s:param name="customersItemIdParam"
                                                     value="%{#attr.item.customerItemsId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                             title="Delete this Item?"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="../includes/images/remove-user.png"
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
                <s:url var="loadAddItemUrl" action="loadAddItem">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddItemUrl}" rel="tooltip" title="Add Contact">
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
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li class="active"><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</div>
<!-- /.row -->





