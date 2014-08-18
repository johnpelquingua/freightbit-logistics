<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor List Drivers </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"> Drivers</li>
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

<!-- /.row -->
<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-group"></i> Drivers</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddDriverPage'">
                        <i class="fa fa-book"></i> New Driver
                    </button>
                </span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="driver" name="drivers" requestURI="viewDrivers.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="driverCode" title="Driver Code <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="licenseNumber" title="License Number <i class='fa fa-sort' />"
                                                    class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="title" title="Title <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="lastName" title="Last Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="firstName" title="First Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="middleName" title="Middle Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editVendorDriverUrl" action="loadEditDriverPage">
                                            <s:param name="driverCodeParam" value="#attr.driver.driverCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVendorDriverUrl}" rel="tooltip"
                                             title="Edit this Driver">
                                            <img src="../includes/images/edit-user.png"
                                                 class="icon-action circ-icon">
                                        </s:a>
                                        <s:url var="deleteVendorDriverUrl" action="deleteDriver">
                                            <s:param name="driverCodeParam" value="#attr.driver.driverCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVendorDriverUrl}" rel="tooltip"
                                             title="Delete this Driver"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="../includes/images/remove-user.png"
                                                 class="icon-action circ-icon">
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
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddDriverPage'">
                        <i class="fa fa-book"></i> New Driver
                    </button>
                </span>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li class="active"><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>
</div>