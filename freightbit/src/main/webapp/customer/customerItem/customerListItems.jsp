<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer
                Profile</a></li>
            <li class="active"> Items</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Items List</h3>
                <span class="pull-right">
                    <s:url var="loadAddItemUrl" action="loadAddItem">
                        <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                    </s:url>
                    <s:a class="icon-action-link" href="%{loadAddItemUrl}" rel="tooltip" title="Add Contact">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-list-ol"> </i> New Item
                        </button>
                    </s:a>
               </span>
            </div>

            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-10">

                        <div class="table-responsive list-table">
                            <tbody>
                            <table>
                                <tr>
                                    <display:table id="item" name="items" requestURI="viewItem.action" pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="itemName" title="Name" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="itemCode" title="Code" class="tb-font-black"
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
                                                    <%--<img src="../includes/images/edit-user.png"
                                                         class="icon-action circ-icon"> --%>
                                                    <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteItemUrl" action="deleteItem">
                                                    <s:param name="customersItemIdParam"
                                                             value="%{#attr.item.customerItemsId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                                     title="Delete this Item?"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                    <%--<img src="../includes/images/remove-user.png"
                                                         class="icon-action circ-icon"> --%>
                                                    <i class="fa fa-trash-o"></i>
                                                </s:a>
                                            </display:column>
                                        </td>
                                    </display:table>
                                </tr>
                            </table>
                            </tbody>
                        </div>

                    </div>

                    <div class="col-lg-2">
                        <div class="panel panel-info" >
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="customerInfo" class="btn btn-primary" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                            <a href="viewAddress" class="btn btn-warning" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                            <a href="viewCustomerContacts" class="btn btn-violet" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>


                                            <a href="#" class="btn btn-success" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list-ol fa-fw"></i> <br/>Items</a>
                                        </sec:authorize>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                                            <a href="viewRates" class="btn btn-info" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-money fa-fw"></i> <br/>Rates</a>
                                        </sec:authorize>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="viewConsignees" class="btn btn-danger" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list fa-fw"></i> <br/>Consignee</a>
                                        </sec:authorize>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="panel-footer">

               <span class="pull-right">
                    <s:url var="loadAddItemUrl" action="loadAddItem">
                        <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                    </s:url>
                    <s:a class="icon-action-link" href="%{loadAddItemUrl}" rel="tooltip" title="Add Contact">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-list-ol"> </i> New Item
                        </button>
                    </s:a>
                </span>
            </div>

        </div>
    </div>

    <%--<div class="col-lg-2">
        <div class="panel panel-primary">

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
    </div>--%>

</div>