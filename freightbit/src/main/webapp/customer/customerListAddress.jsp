<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Vendor Module</h1>

    <div class="col-md-12">
        <div class="panel panel-info">

            <div class="panel-heading">

                <img src="includes/images/listofusers.png" class="box-icon"/> <span
                    class="panel-title">List of Vendors</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black">Address Type</th>
                            <th class="tb-font-black">Address 1</th>
                            <th class="tb-font-black">Address 2</th>
                            <th class="tb-font-black">City</th>
                            <th class="tb-font-black">State</th>
                            <th class="tb-font-black">Zip</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="addresss" var="address">
                            <tr>
                                <td class="tb-font-black"><s:property value="addressType"/></td>
                                <td class="tb-font-black"><s:property value="addressLine1"/></td>
                                <td class="tb-font-black"><s:property value="addressLine2"/></td>
                                <td class="tb-font-black"><s:property value="city"/></td>
                                <td class="tb-font-black"><s:property value="state"/></td>
                                <td class="tb-font-black"><s:property value="zip"/></td>

                                <td>

                                    <s:url var="loadEditAddressUrl" action="loadEditAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a href="%{loadEditAddressUrl}" class="icon-action-link" rel="tooltip"
                                         title="Edit this Vendor Address"><img src="includes/images/edit-user.png"
                                                                               class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteAddressUrl" action="deleteAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                         title="Delete this Vendor Address"
                                         onclick="return confirm('Do you really want to delete?');"><img
                                            src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
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
                <s:url var="loadAddAddressUrl" action="loadAddAddress">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>
        </div>
    </div>
</div>
--%>





<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer List Address </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a></li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer Profile</a></li>
            <li class="active"><i class="fa fa-home"></i> Address</li>
        </ol>

    </div>
</div><!-- /.row -->

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
                    <%--<table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black" style="text-align: center;">Address Type <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Address 1 <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Address 2 <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">City <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">State <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Zip <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action </th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="addresss" var="address">
                            <tr>
                                <td class="tb-font-black"><s:property value="addressType"/></td>
                                <td class="tb-font-black"><s:property value="addressLine1"/></td>
                                <td class="tb-font-black"><s:property value="addressLine2"/></td>
                                <td class="tb-font-black"><s:property value="city"/></td>
                                <td class="tb-font-black"><s:property value="state"/></td>
                                <td class="tb-font-black"><s:property value="zip"/></td>

                                <td>

                                    <s:url var="loadEditAddressUrl" action="loadEditAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a href="%{loadEditAddressUrl}" class="icon-action-link" rel="tooltip"
                                         title="Edit this Vendor Address"><img src="includes/images/edit-user.png"
                                                                               class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteAddressUrl" action="deleteAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                         title="Delete this Vendor Address"
                                         onclick="return confirm('Do you really want to delete?');"><img
                                            src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>--%>

                        <tbody>
                            <table>
                                <tr>
                                    <display:table id="address" name="addresss" requestURI="/viewAddress.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter" style="margin-top: 15px;">
                                        <td><display:column property="addressType" title="Address Type" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="addressLine1" title="Address 1" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="addressLine2" title="Address 2" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="city" title="City" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="state" title="State" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="zip" title="Zip" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td class="tb-font-black" style="text-align: center;">
                                                <display:column title="Actions">
                                                    <s:url var="loadEditAddressUrl" action="loadEditAddress">
                                                        <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                                    </s:url>
                                                    <s:a href="%{loadEditAddressUrl}" class="icon-action-link" rel="tooltip"
                                                         title="Edit this Vendor Address"><img src="includes/images/edit-user.png"
                                                                                               class="icon-action circ-icon"> </s:a>

                                                    <s:url var="deleteAddressUrl" action="deleteAddress">
                                                        <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                                         title="Delete this Vendor Address"
                                                         onclick="return confirm('Do you really want to delete?');"><img
                                                            src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
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
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
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
                <li><a href="customerInfo"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li class="active"><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>

            </ul>
        </div>
    </div>
</div><!-- /.row -->
