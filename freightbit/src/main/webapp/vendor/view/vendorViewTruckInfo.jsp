<%--
  Created by IntelliJ IDEA.
  User: JMXPSX
  Date: 8/28/2014
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

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
            <li class="active"><a href="<s:url action='viewTrucks' />"> Trucks</a></li>
            <li class="active">Truck Info</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12" >
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Truck Information</h3>
                <span class="pull-right">
                    <s:url var="loadEditTrucks" action="loadEditTrucksPage">
                        <s:param name="truckCodeParam" value="truck.truckCode"></s:param>
                    </s:url>
                    <s:a href="%{loadEditTrucks}">
                    <button type="button" class="btn btn-success">
                        <i class="fa fa-pencil"></i> Edit truck Info
                    </button>
                    </s:a>
                </span>
            </div>

            <div class="panel-body">
                <%--<s:property value="%{truck.truckId}"/>--%>
                <s:hidden name="truck.truckId" value="%{truck.truckId}"/>
                <s:hidden name="truck.createdTimeStamp" value="%{truck.createdTimeStamp}" />
                <s:hidden name="truck.createdBy" value="%{truck.createdBy}" />

                <div class="row">

                    <div class="col-lg-6 col-lg-offset-2">

                        <div class="panel panel-info">
                            <%--<div class="panel-heading">--%>
                                <%--<h3 class="panel-title"><i class="fa fa-info-circle"></i> Details</h3>--%>
                            <%--</div>--%>

                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <i class="fa fa-truck fa-fw icon-15e"></i>
                                        </div>
                                    </div>

                                    <div class="col-lg-9">
                                        <table class="table table-user-information" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; border-top: none; text-align: left !important;">Plate Number</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="truck.plateNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">LTO Certificate</td>
                                                <td style="text-align: left !important"><s:property value="truck.truckCode"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Motor Vehicle number</td>
                                                <td style="text-align: left !important"><s:property value="truck.motorVehicleNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Date of Issue</td>
                                                <td style="text-align: left !important"><s:property value="truck.issueDate"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Make</td>
                                                <td style="text-align: left !important"><s:property value="truck.engineNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Model</td>
                                                <td style="text-align: left !important"><s:property value="truck.modelNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Type of Body</td>
                                                <td style="text-align: left !important"><s:property value="truck.truckType"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Year Model</td>
                                                <td style="text-align: left !important"><s:property value="truck.modelYear"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Gross Weight</td>
                                                <td style="text-align: left !important"><s:property value="truck.grossWeight"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Net Weight</td>
                                                <td style="text-align: left !important"><s:property value="truck.netWeight"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Net Capacity</td>
                                                <td style="text-align: left !important"><s:property value="truck.netCapacity"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Owner Name</td>
                                                <td style="text-align: left !important"><s:property value="truck.ownerName"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">Owner's Address</td>
                                                <td style="text-align: left !important"><s:property value="truck.ownerAddress"/></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight:bold; font-size: 12px; text-align: left !important;">O.R. Number</td>
                                                <td style="text-align: left !important"><s:property value="truck.officialReceipt"/></td>
                                            </tr>
                                            </tbody>
                                            <%--<s:set name="customerId" value="%{customer.customerId}" scope="session"/>--%>
                                            <%--<s:set name="truck.truckId" value="%{truck.truckId}" scope="session"/>--%>
                                            <%--<s:property value="%{consignee.referenceId1}" />--%>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-2 col-lg-offset-2">
                        <div class="panel panel-info" >
                            <%--<div class="panel-heading">--%>
                                <%--<h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>--%>
                            <%--</div>--%>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <a href="" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                        <a href="viewTruckingAddress" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
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
        </div>
    </div>
    </div>