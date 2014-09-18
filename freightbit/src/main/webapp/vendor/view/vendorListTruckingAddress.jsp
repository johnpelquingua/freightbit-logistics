<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

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
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Address List</h3>
                <span class="pull-right">
                <s:url var="loadAddAddressUrl" action="loadAddTruckingAddress">
                    <s:param name="vendorIdParam" value="vendorIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="Add Contact">
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

                                    <display:table id="address" name="addresss" requestURI="viewTruckingAddress.action"
                                                   pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="addressType" title="Address Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="addressLine1" title="Address 1 <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="addressLine2" title="Address 2 <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="city" title="City <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="state" title="Region <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="zip" title="Zip <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">

                                                <s:url var="loadEditTruckingAddressUrl" action="loadEditTruckingAddress">
                                                    <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                                </s:url>
                                                <s:a href="%{loadEditTruckingAddressUrl}" class="icon-action-link" rel="tooltip"
                                                     title="Edit this Vendor Address">
                                                    <%--<img src="../includes/images/edit-user.png" class="icon-action circ-icon">--%>
                                                    <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteAddressUrl" action="deleteTruckingAddress">
                                                    <s:param name="addressIdParam" value="%{#attr.address.addressId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                                     title="Delete this Vendor Address"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                    <%--<img src="../includes/images/remove-user.png" class="icon-action circ-icon">--%>
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
                            <%--<div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>
                            </div>--%>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <a href="viewInfoVendor" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                        <a href="#" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                        <a href="viewVendorTruckingContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>
                                        <a href="viewDrivers" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Drivers</a>
                                        <a href="viewTrucks" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-truck fa-fw"></i> <br/>Trucks</a>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="panel-footer">
            <span class="pull-right">
                <s:url var="loadAddAddressUrl" action="loadAddTruckingAddress">
                    <s:param name="vendorIdParam" value="vendorIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="Add Contact">
                    <button type="button" class="btn btn-primary">
                        <i class="fa fa-home"> </i> New Address
                    </button>
                </s:a>
            </span>

            </div>
        </div>
    </div>

    <%--<div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li class="active"><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>--%>

</div>