<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor List Vessels</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />">  Vendor
                Profile</a></li>
            <li class="active">< Vessels</li>
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

<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-anchor"></i> Vessels</h3>

            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="vessel" name="vessels" requestURI="viewVessels.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="vesselNumber" title="Vessel Number <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="vesselName" title="Vessel Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="modelNumber" title="Model Number <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="modelYear" title="Model Year <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editVesselUrl" action="loadEditVesselsPage">
                                            <s:param name="vesselNameParam" value="#attr.vessel.vesselName"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVesselUrl}" rel="tooltip"
                                             title="Edit this vessel">
                                            <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
                                        </s:a>

                                        <s:url var="deleteVesselUrl" action="deleteVessels">
                                            <s:param name="vesselNameParam" value="#attr.vessel.vesselName"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVesselUrl}" rel="tooltip"
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
                <span class="pull-right">
                    <a href="loadAddVesselsPage" class="side-help" style="font-size: 15px;"><img
                            src="../includes/images/add-user.png" class="icon-action circ-icon"></a>
                </span>

            </div>
        </div>
    </div>

    <div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorShippingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li class="active"><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>
            </ul>
        </div>
    </div>
</div>