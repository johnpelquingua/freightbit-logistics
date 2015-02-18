<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .deleteCustomerAddressIcon {
        cursor: pointer;
    }
</style>


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
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer Profile</a></li>
            <li class="active"> Address</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>
<s:if test="hasActionErrors()">
   <div class="col-lg-12">
	   <div class="alert alert-errors">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
   			<strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
		</div>
   </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Address List</h3>
                <span class="pull-right">
                    <s:url var="loadAddAddressUrl" action="loadAddAddress">
                        <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                    </s:url>
                    <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="New Address">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-home"> </i> New Address
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
                                    <display:table id="address" name="addresss" requestURI="viewAddress.action" pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="addressType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="addressLine1" title="Address Line 1 <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="addressLine2" title="Address Line 2 <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="city" title="City <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="state" title="Region <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="zip" title="Zip <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">
                                                <s:url var="loadEditAddressUrl" action="loadEditAddress">
                                                    <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                                </s:url>
                                                <s:a href="%{loadEditAddressUrl}" class="icon-action-link" rel="tooltip"
                                                     title="Edit Address">
                                                    <%--<img src="../includes/images/edit-user.png" class="icon-action circ-icon">--%>
                                                    <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteAddressUrl" action="deleteAddress">
                                                    <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                                     title="Delete Address"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                    <%--<img src="../includes/images/remove-user.png" class="icon-action circ-icon">--%>
                                                </s:a>
                                                <i class="fa fa-trash-o deleteCustomerAddressIcon"></i>
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
                                            <a href="#" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                            <a href="viewCustomerContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>


                                            <a href="viewItem" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list-ol fa-fw"></i> <br/>Items</a>
                                        </sec:authorize>

                                        <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">--%>
                                            <%--<a href="viewRates" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-money fa-fw"></i> <br/>Rates</a>--%>
                                        <%--</sec:authorize>--%>

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

            <div class="panel-footer">

            <span class="pull-right">
                <s:url var="loadAddAddressUrl" action="loadAddAddress">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                    <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="New Address">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-home"> </i> New Address
                        </button>
                    </s:a>
            </span>

                <div class="table-responsive" >
                    <div class="col-lg-12" style="position:relative;margin-top: -28px;">
                        <table class="col-lg-6">
                            <tr>
                                <td><label>Legend:</label></td>
                                <td><i class="fa fa-pencil"></i> Edit</td>
                                <td><i class="fa fa-trash-o"></i> Delete</td>
                                <td><i class="fa fa-info-circle"></i> Information</td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <%--<div class="col-lg-2">
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
    </div>--%>

</div>

<div class="modal fade" id="deleteCustomerAddressModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Delete Customer Address</span>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this customer address ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmDeleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        actionConfirmation($('.deleteCustomerAddressIcon'), $('.confirmDeleteModalBtn'), $('#deleteCustomerAddressModal'));
    });
</script>