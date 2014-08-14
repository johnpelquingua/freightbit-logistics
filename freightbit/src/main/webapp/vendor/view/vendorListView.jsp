<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor List</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><i class="fa fa-list"></i> Vendor List</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Vendor List</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" onclick="location.href='loadSearchVendorPage'">
                        <i class="fa fa-search"></i> Search Vendor
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddVendorPage'">
                        <i class="fa fa-book"></i> New Vendor
                    </button>
                </span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="vendor" name="vendors" requestURI="viewVendors.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="vendorCode" title="Vendor Code" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="vendorName" title="Company Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="vendorType" title="Type" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="vendorClass" title="Class" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">

                                        <s:url var="editVendorUrl" action="loadEditVendorPage">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVendorUrl}" rel="tooltip"
                                             title="Edit this vendor">
                                            <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
                                        </s:a>

                                        <s:url var="deleteVendorUrl" action="deleteVendor">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVendorUrl}" rel="tooltip"
                                             title="Delete this Vendor"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="../includes/images/remove-user.png" class="icon-action circ-icon">
                                        </s:a>

                                        <s:url var="viewInfoVendorUrl" action="viewInfoVendor">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoVendorUrl}" rel="tooltip"
                                             title="View Vendor Info">
                                            <img src="../includes/images/info-b.png" class="icon-action circ-icon">
                                        </s:a>
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
                    <button type="button" class="btn btn-success new-booking" onclick="location.href='loadSearchVendorPage'">
                        <i class="fa fa-search"></i> Search Vendor
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddVendorPage'">
                        <i class="fa fa-book"></i> New Vendor
                    </button>
                </span>
            </div>
        </div>
    </div>
</div>