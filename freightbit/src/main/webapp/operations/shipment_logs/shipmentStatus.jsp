<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .pagebanner, .pagelinks {
        display: none;
    }
</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Shipment Monitoring</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='../operations/viewShipmentMonitoringList' />">  Shipment Monitoring List </a></li>
            <li class="active"> Shipment Status</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">

        <div class="panel panel-primary">

            <div class="panel-body horizontal">

                <div class="table-responsive TableContainer">

                            <display:table id="shipmentLogs" name="shipmentLogss"
                                           requestURI="viewShipmentStatus.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="createdDate" title="Date" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="createdTime" title="Time" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="createdBy" title="Updated By" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="activity" title="Shipment History" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                            </display:table>

                </div>

                <div class="col-lg-2" style="text-align: center">
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Current Date</label>
                    <s:textfield cssClass="form-control" />
                </div>

                <div class="col-lg-2" style="text-align: center">
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Current Time</label>
                    <s:textfield cssClass="form-control" />
                </div>

                <div class="col-lg-8" style="text-align: center">
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Shipment Update</label>

                </div>

            </div>
        </div>

    </div>
</div>