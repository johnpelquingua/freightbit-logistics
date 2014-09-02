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
            <li class="active"><a href="<s:url action='viewInfoVendor' />">  Vendor
                Profile</a></li>
            <li class="active"> Vessels</li>
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
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Vessels List</h3>
                <span class="pull-right">
                    <a href="loadAddVesselsPage" class="side-help" style="font-size: 15px;">
                        <%--<img src="../includes/images/add-user.png" class="icon-action circ-icon">--%>
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-anchor"> </i> New Vessel
                        </button>
                    </a>
                </span>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-lg-10">

                        <div class="table-responsive list-table">

                            <tbody>
                            <table>
                                <tr>
                                    <display:table id="vessel" name="vessels" requestURI="viewVessels.action" pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <%--<td><display:column property="vesselNumber" title="Vessel Number <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <td><display:column property="vesselName" title="Vessel Name <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="vesselType" title="Vessel Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <%--<td><display:column property="modelYear" title="Model Year <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>--%>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">
                                                <s:url var="editVesselUrl" action="loadEditVesselsPage">
                                                    <s:param name="vesselNameParam" value="#attr.vessel.vesselName"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{editVesselUrl}" rel="tooltip"
                                                     title="Edit this vessel">
                                                    <%--<img src="../includes/images/edit-user.png" class="icon-action circ-icon">--%>
                                                    <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteVesselUrl" action="deleteVessels">
                                                    <s:param name="vesselNameParam" value="#attr.vessel.vesselName"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteVesselUrl}" rel="tooltip"
                                                     title="Delete this Vendor"
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
                                        <a href="viewShippingAddress" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                        <a href="viewVendorShippingContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>
                                        <a href="" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-anchor fa-fw"></i> <br/>Vessels</a>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="panel-footer">
                <span class="pull-right">
                    <a href="loadAddVesselsPage" class="side-help" style="font-size: 15px;">
                        <%--<img src="../includes/images/add-user.png" class="icon-action circ-icon">--%>
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-anchor"> </i> New Vessel
                        </button>
                    </a>
                </span>

            </div>
        </div>
    </div>

</div>