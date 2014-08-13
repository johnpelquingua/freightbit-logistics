<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor List Trucks</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"> Trucks</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-9" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-truck"></i> Trucks</h3>

            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="truck" name="trucks" requestURI="viewTrucks.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="truckCode" title="Truck Code" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="plateNumber" title="Plate Number" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="truckType" title="Truck Type" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="modelNumber" title="Model Number" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="engineNumber" title="Engine Number" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="grossWeight" title="Gross Weight" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editTruckUrl" action="loadEditTrucksPage">
                                            <s:param name="truckCodeParam" value="#attr.truck.truckCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editTruckUrl}" rel="tooltip"
                                             title="Edit this vendor">
                                            <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
                                        </s:a>

                                        <s:url var="deleteTruckUrl" action="deleteTrucks">
                                            <s:param name="truckCodeParam" value="#attr.truck.truckCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteTruckUrl}" rel="tooltip"
                                             title="Delete this Vendor"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="../includes/images/remove-user.png" class="icon-action circ-icon">
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
            <span class="pull-right"> <a href="loadAddTrucksPage" class="icon-action-link" rel="tooltip"
                                         title="Add Vendor"><img
                    src="../includes/images/add-user.png" class="icon-action circ-icon">
            </a>
            </span>
            </div>

        </div>
    </div>

    <div class="col-lg-3">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li class="active"><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>
</div>