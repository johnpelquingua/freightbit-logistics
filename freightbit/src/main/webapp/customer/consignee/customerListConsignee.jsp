<%@ taglib prefix="s" uri="/struts-tags" %>
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
            <li class="active"> Consignee </li>
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
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Consignee List
                </h3>
                <span class="pull-right">
                    <s:url var="loadAddConsigneeUrl" action="loadAddConsignee">
                        <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                    </s:url>
                    <s:a class="icon-action-link" href="%{loadAddConsigneeUrl}" rel="tooltip" title="Add Contact">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-male"> </i> New Consignee
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
                                    <display:table id="consignee" name="consignees" requestURI="viewConsignees.action"
                                                   pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="firstName" title="First Name <i class='fa fa-sort'" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="lastName" title="Last Name <i class='fa fa-sort'" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="phone" title="Phone <i class='fa fa-sort'" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="mobile" title="Mobile <i class='fa fa-sort'" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="email" title="E-mail <i class='fa fa-sort'" class="tb-font-black"
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
                                                     title="Edit this Vendor Address">
                                                    <%--<img src="../includes/images/edit-user.png" class="icon-action circ-icon">--%>
                                                    <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteConsigneeUrl" action="deleteConsignee">
                                                    <s:param name="contactCodeParam"
                                                             value="%{#attr.consignee.contactId}"></s:param>
                                                    <s:param name="addressIdParam"
                                                             value="%{#attr.consignee.addressId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteConsigneeUrl}" rel="tooltip"
                                                     title="Delete this Consignee"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                    <%--<img src="../includes/images/remove-user.png" class="icon-action circ-icon">--%>
                                                    <i class="fa fa-trash-o"></i>
                                                </s:a>
                                                <s:url var="consigneeInfoUrl" action="consigneeInfo">
                                                    <s:param name="contactCodeParam"
                                                             value="%{#attr.consignee.contactId}"></s:param>
                                                    <s:param name="addressIdParam"
                                                             value="%{#attr.consignee.addressId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{consigneeInfoUrl}" rel="tooltip">
                                                    <%--<img src="../includes/images/info-b.png" class="icon-action circ-icon">--%>
                                                    <i class="fa fa-info-circle"></i>
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
                            <%--<div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>
                            </div>--%>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="customerInfo" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                            <a href="viewAddress" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                            <a href="viewCustomerContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>


                                            <a href="viewItem" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list-ol fa-fw"></i> <br/>Items</a>
                                        </sec:authorize>

                                        <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">--%>
                                            <%--<a href="viewRates" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-money fa-fw"></i> <br/>Rates</a>--%>
                                        <%--</sec:authorize>--%>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="#" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list fa-fw"></i> <br/>Consignee</a>
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
                <s:url var="loadAddConsigneeUrl" action="loadAddConsignee">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddConsigneeUrl}" rel="tooltip" title="Add Contact">
                    <button type="button" class="btn btn-primary">
                        <i class="fa fa-male"> </i> New Consignee
                    </button>
                </s:a>
            </span>

            </div>

        </div>
    </div>

</div>