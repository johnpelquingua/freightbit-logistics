<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .vendorDeleteAction {
        cursor: pointer;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building"></i> Vendor Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"> Vendor List</li>
        </ol>
    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success" id="alert">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<s:if test="hasActionErrors()">
    <div class="col-lg-12">
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">

        <div class="panel panel-primary">

            <div class="panel-heading" style="margin-bottom: 1.5em;">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Vendor List</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="showSearchFields();">
                        <i class="fa fa-search"></i> Search Vendor
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddVendorPage'">
                        <i class="fa fa-building"></i> New Vendor
                    </button>
                </span>
            </div>

            <!-- Main Nav tabs -->
            <div class="row padding-12-lr">
                <ul class="nav nav-tabs center-text" role="tablist">
                    <li class="active col-md-6 padding-0-r" id="shipping">
                        <a href="#shippingTab" role="tab" data-toggle="tab"><i class="fa fa-anchor"></i> Shipping Vendors</a>
                    </li>
                    <li class="col-md-6 padding-0-lr" id="trucking">
                        <a href="#truckingTab" role="tab" data-toggle="tab"><i class="fa fa-truck"></i> Trucking Vendors</a>
                    </li>
                </ul>
            </div>

            <div class="tab-content">

                <%--SHIPPING TAB--%>
                <div class="tab-pane fade in active" id="shippingTab">
                    <div class="panel-body">

                        <div class="table-responsive list-table">
                            <tbody>
                            <table>
                                <tr>
                                    <display:table id="vendor" name="shippingVendors" requestURI="viewVendors.action" pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="vendorCode" title="Vendor Code <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="vendorName" title="Company Name <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="vendorType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="vendorClass" title="Class <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <%--<td><display:column property="serviceArea" title="Service Area <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">

                                                <s:url var="editVendorUrl" action="loadEditVendorPage">
                                                    <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                                    <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{editVendorUrl}" rel="tooltip"
                                                     title="Edit this vendor">
                                                    <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteVendorUrl" action="deleteVendor">
                                                    <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                                    <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteVendorUrl}" rel="tooltip"
                                                     title="Delete this Vendor"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                </s:a>
                                                <i class="fa fa-trash-o vendorDeleteAction"></i>

                                                <s:url var="viewInfoVendorUrl" action="viewInfoVendor">
                                                    <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                                    <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoVendorUrl}" rel="tooltip"
                                                     title="View Vendor Info">
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
                </div>

                <%--TRUCKING TABS--%>
                <div class="tab-pane fade" id="truckingTab">
                    <div class="panel-body">

                        <div class="table-responsive list-table">
                            <tbody>
                            <table>
                                <tr>
                                    <display:table id="vendor" name="truckingVendors" requestURI="viewVendors.action" pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="vendorCode" title="Vendor Code <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="vendorName" title="Company Name <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="vendorType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="vendorClass" title="Class <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="serviceArea" title="Service Area <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">

                                                <s:url var="editVendorUrl" action="loadEditVendorPage">
                                                    <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                                    <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{editVendorUrl}" rel="tooltip"
                                                     title="Edit this vendor">
                                                    <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteVendorUrl" action="deleteVendor">
                                                    <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                                    <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteVendorUrl}" rel="tooltip"
                                                     title="Delete this Vendor"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                </s:a>
                                                <i class="fa fa-trash-o vendorDeleteAction"></i>

                                                <s:url var="viewInfoVendorUrl" action="viewInfoVendor">
                                                    <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                                    <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoVendorUrl}" rel="tooltip"
                                                     title="View Vendor Info">
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
                </div>

            </div>

            <%--<div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="vendor" name="vendors" requestURI="viewVendors.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="vendorCode" title="Vendor Code <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="vendorName" title="Company Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="vendorType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="vendorClass" title="Class <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="serviceArea" title="Service Area <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">

                                        <s:url var="editVendorUrl" action="loadEditVendorPage">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                            <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVendorUrl}" rel="tooltip"
                                             title="Edit this vendor">
                                            <i class="fa fa-pencil"></i>
                                        </s:a>

                                        <s:url var="deleteVendorUrl" action="deleteVendor">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                            <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVendorUrl}" rel="tooltip"
                                             title="Delete this Vendor"
                                             onclick="return confirm('Do you really want to delete?');">
                                        </s:a>
                                        <i class="fa fa-trash-o vendorDeleteAction"></i>

                                        <s:url var="viewInfoVendorUrl" action="viewInfoVendor">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                            <s:param name="vendorIdParam" value="#attr.vendor.vendorId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoVendorUrl}" rel="tooltip"
                                             title="View Vendor Info">
                                            <i class="fa fa-info-circle"></i>
                                        </s:a>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>

                </div>
            </div>--%>

            <div class="panel-footer">
                <div class="table-responsive" >
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <label>LEGEND:</label>
                        </div>
                        <div class="col-lg-4">
                            <i class="fa fa-pencil"></i> Edit
                        </div>
                        <div class="col-lg-4">
                            <i class="fa fa-trash-o"></i> Delete
                        </div>
                        <div class="col-lg-4">
                            <i class="fa fa-info-circle"></i> Information
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="vendorDeleteModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="font-size: 1.5em;"><i class="fa fa-warning" style="color: red;"></i> Confirm Vendor Deletion</div>
            <div class="modal-body">
                Are you sure you want to delete this vendor?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <a class="vendorDeleteBtn btn btn-danger" href="#">Delete</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("vendor");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {
                if ($("#alert").length) {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[1].cells[j].style.backgroundColor = "#dff0d8";
                    }
                }
            }
        }

        actionConfirmation($('.vendorDeleteAction'), $('.vendorDeleteBtn'), $('#vendorDeleteModal'));
    });

    function showSearchFields() {
        $.ajax({
            url: 'loadSearchVendorPage',
            type: 'POST',
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
                /*window.location.href = '#sixth';*/
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    }
</script>