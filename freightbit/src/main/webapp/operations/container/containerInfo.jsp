<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 11/12/2014
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building"></i> Container Management </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Container Management </li>
        </ol>

    </div>
</div>

<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Container Information</h3>
                <span class="pull-right">

                        <s:a cssClass="btn btn-success new-booking" href="#" rel="tooltip"
                             title="Edit this vendor">
                            <%--<img src="../includes/images/edit-user.png" class="icon-action circ-icon">--%>
                            <i class="fa fa-pencil"></i> Edit Container
                        </s:a>
                </span>
            </div>

            <div class="panel-body">

                <s:set name="containerId" value="%{container.containerId}" scope="session"/>

                <div class="row">

                    <div class=" col-lg-6 col-lg-offset-2">

                        <div class="panel panel-info ">

                            <%--<div align="center" style="margin-top: 10px;">
                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                            </div>--%>
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <div align="center" style="margin-top: 10px;">
                                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-9">

                                        <table class="table table-user-information profile" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Container Number</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.containerNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Container Size</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.containerSize"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Container Type</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.containerType"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">EIR 1</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.eirNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">EIR 2</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.eirNumber2"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Shipping Line</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.shipping"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Van Number</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.vanNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Van Location</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.vanLocation"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Trucking</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.trucking"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Plate Number</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.plateNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Driver</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.driver"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Order Number</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.orderNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Seal Number</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.sealNumber"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Remarks</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.remarks"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Laden / Empty</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.ladenEmpty"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Van To</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.vanTo"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important; border-top: none;">Van From</td>
                                                <td style="border-top: none; text-align: left !important;"><s:property value="container.vanFrom"/></td>
                                            </tr>

                                            </tbody>
                                        </table>

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