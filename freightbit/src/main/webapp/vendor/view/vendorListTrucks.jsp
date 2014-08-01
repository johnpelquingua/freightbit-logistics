<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left:-40px;">Trucks Module</h1>

    <div class="row">
        <div class="col-md-12" style="margin-left:-25px;">
            <div class="panel panel-info">

                <div class="panel-heading">

                    <img src="../includes/images/listofusers.png" class="box-icon"/> <span
                        class="panel-title">List of Trucks</span>

                </div>

                <div class="panel-body">
                    <div class="table-responsive list-table">
                        <table class="table table-striped table-bordered text-center">
                            <thead>
                            <tr class="header_center">
                                <th class="tb-font-black"><input type="checkbox"/></th>
                                <th class="tb-font-black">Truck Code</th>
                                <th class="tb-font-black">Plate Number</th>
                                <th class="tb-font-black">Type</th>
                                <th class="tb-font-black">Model Number</th>
                                <th class="tb-font-black">Engine Number</th>
                                <th class="tb-font-black">Gross Weight</th>
                                <th class="tb-font-black">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <s:iterator value="trucks" var="truck">

                                <tr>
                                        &lt;%&ndash;<input type="checkbox" />&ndash;%&gt;
                                    <td class="tb-font-black"><s:checkbox name="a" theme="simple"/></td>
                                    <td class="tb-font-black"><s:property value="truckCode"/></td>
                                    <td class="tb-font-black"><s:property value="plateNumber"/></td>
                                    <td class="tb-font-black"><s:property value="truckType"/></td>
                                    <td class="tb-font-black"><s:property value="modelNumber"/></td>
                                    <td class="tb-font-black"><s:property value="engineNumber"/></td>
                                    <td class="tb-font-black"><s:property value="grossWeight"/></td>
                                    <td class="tb-font-black">

                                        <s:url var="editTruckUrl" action="loadEditTrucksPage">
                                            <s:param name="truckCodeParam" value="truckCode"></s:param>

                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editTruckUrl}" rel="tooltip"
                                             title="Edit this vendor">
                                            <img src="../includes/images/edit-user.png"
                                                 class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteTruckUrl" action="deleteTrucks">
                                            <s:param name="truckCodeParam" value="truckCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteTruckUrl}" rel="tooltip"
                                             title="Delete this Vendor"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="../includes/images/remove-user.png"
                                                 class="icon-action circ-icon"> </s:a>
                                    </td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel-footer">
                        <span class="pull-right">
                            <s:url var="addTrucksUrl" action="loadAddTrucksPage">
                                <s:param name="vendorIdParam" value="vendorIdParam"></s:param>
                            </s:url>
                        <s:a href="%{addTrucksUrl}" cssClass="side-help" style="font-size: 15px;"><img
                                src="../includes/images/add-user.png" class="icon-action circ-icon"></s:a>
                        </span>

                    <ul class="pagination">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li class="disabled"><a href="#">&raquo;</a></li>
                    </ul>

                </div>

            </div>
        </div>
    </div>

</div>--%>


<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor List Trucks</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> <i class="fa fa-info-circle"></i> Vendor
                Profile</a></li>
            <li class="active"><i class="fa fa-truck"></i> Trucks</li>
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
    <div class="col-lg-9" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-truck"></i> Trucks</h3>

            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">
                    <%--<table class="table table-striped table-bordered text-center table-hover">
                        <thead>
                        <tr class="header_center">

                            <th class="tb-font-black" style="text-align: center;">Truck Code <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Plate Number <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Type <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Model Number <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Engine Number <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Gross Weight <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <s:iterator value="trucks" var="truck">

                            <tr>

                                <td class="tb-font-black"><s:property value="truckCode"/></td>
                                <td class="tb-font-black"><s:property value="plateNumber"/></td>
                                <td class="tb-font-black"><s:property value="truckType"/></td>
                                <td class="tb-font-black"><s:property value="modelNumber"/></td>
                                <td class="tb-font-black"><s:property value="engineNumber"/></td>
                                <td class="tb-font-black"><s:property value="grossWeight"/></td>
                                <td class="tb-font-black">

                                    <s:url var="editTruckUrl" action="loadEditTrucksPage">
                                        <s:param name="truckCodeParam" value="truckCode"></s:param>

                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editTruckUrl}" rel="tooltip"
                                         title="Edit this vendor">
                                        <img src="../includes/images/edit-user.png"
                                             class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteTruckUrl" action="deleteTrucks">
                                        <s:param name="truckCodeParam" value="truckCode"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteTruckUrl}" rel="tooltip"
                                         title="Delete this Vendor"
                                         onclick="return confirm('Do you really want to delete?');">
                                        <img src="../includes/images/remove-user.png"
                                             class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>--%>

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="truck" name="trucks" requestURI="/viewTrucks.action" pagesize="10"
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
<!-- /.row -->
