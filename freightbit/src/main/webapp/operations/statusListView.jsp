<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Update Status</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i>Status</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i>List of On-going Bookings</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="/viewStatusList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                   style="margin-top: 15px;">

                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="shipperCode" title="Customer" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="consigneeCode" title="Consignee" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="serviceRequirement" title="Service Requirement"
                                            class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="serviceMode" title="Service Mode" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column title="Action">
                            <s:url var="editVesselScheduleUrl" action="loadEditVesselSchedule">
                                <s:param name="vesselScheduleIdParam"
                                         value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{editVesselScheduleUrl}" rel="tooltip"
                                 title="Edit this vendor">
                                <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
                            </s:a>

                            <s:url var="deleteVesselScheduleUrl" action="deleteVesselSchedule">
                                <s:param name="vesselScheduleIdParam"
                                         value="#attr.vesselSchedule.vesselScheduleId"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{deleteVesselScheduleUrl}" rel="tooltip"
                                 title="Delete this Vendor"
                                 onclick="return confirm('Do you really want to delete?');">
                                <img src="../includes/images/remove-user.png" class="icon-action circ-icon">
                            </s:a>
                        </display:column></td>

                    </display:table>
                </div>


            </div>

            <div class="panel-footer">


    <span class="pull-right">
    <a href="vessel-schedule-add.html" class="icon-action-link"><img
            src="../includes/images/add-sched.png" class="icon-action circ-icon"> </a>
    </span>
            </div>

        </div>
    </div>
</div>
<!-- /.row -->