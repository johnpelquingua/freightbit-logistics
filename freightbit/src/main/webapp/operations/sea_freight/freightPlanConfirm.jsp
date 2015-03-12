<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
  .pagebanner {
      display: none;
  }
  .pagelinks {
      display: none;
  }
</style>


<div class="panel-body">

    <h4>Are you sure you want to assign container(s) to this vessel schedule?</h4><br />

    <div class="well">

        <h4 style="text-align:center;"><i class="fa fa-tasks"></i> CONTAINER(S)</h4>

        <display:table id="orderItem" name="orderItems"
                       requestURI="/getConfirmModalAction.action"
                       class="table table-striped table-hover table-bordered text-center tablesorter table-condensed simple"
                       style="margin-top: 15px;">
            <tr>
                <td>
                    <display:column property="quantity" title="QTY <i class='fa fa-sort' />"
                                    class="tb-font-black"
                                    style="text-align: center;"></display:column>
                </td>
                <td>
                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                        <display:column property="nameSize" title="Size <i class='fa fa-sort' />"
                                        class="tb-font-black"
                                        style="text-align: center;">
                        </display:column>
                    </s:if>
                    <s:else>
                        <display:column property="nameSize" title="Name <i class='fa fa-sort' />"
                                        class="tb-font-black"
                                        style="text-align: center;">
                        </display:column>
                    </s:else>
                </td>

                <%--<td>
                    <display:column property="containerId" title="Container Number <i class='fa fa-sort' />"
                                    class="tb-font-black"
                                    style="text-align: center;">
                    </display:column>
                </td>

                <td>
                    <display:column property="containerId" title="Seal Number <i class='fa fa-sort' />"
                                    class="tb-font-black"
                                    style="text-align: center;">
                    </display:column>
                </td>

                <td>
                    <display:column property="containerId" title="Bullet Seal Number <i class='fa fa-sort' />"
                                    class="tb-font-black"
                                    style="text-align: center;">
                    </display:column>
                </td>--%>

            </tr>

        </display:table>

    </div>

    <h4 style="text-align:center;"><i class="fa fa-arrow-down fa-3x"></i></h4>

    <div class="well">

        <h4 style="text-align:center;"><i class="fa fa-anchor"></i> VESSEL SCHEDULE</h4>

        <display:table id="vesselSchedule" name="vesselSchedule"
                       requestURI="/getConfirmModalAction.action" pagesize="10"
                       class="table table-striped table-hover table-bordered text-center tablesorter currentSchedulesTable"
                       style="margin-top: 15px;">
            <td><display:column property="vendorName" title="Vendor" class="tb-font-black"
                                style="text-align: center;"> </display:column></td>
            <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                style="text-align: center;"> </display:column></td>
            <td><display:column property="vesselName" title="Vessel" class="tb-font-black"
                                style="text-align: center;"> </display:column></td>
            <td><display:column property="originPort" title="ORI" class="tb-font-black"
                                style="text-align: center;"> </display:column></td>
            <td><display:column property="destinationPort" title="DES" class="tb-font-black"
                                style="text-align: center;"> </display:column></td>
            <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                style="text-align: center;"> </display:column></td>
            <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                style="text-align: center;"> </display:column></td>
        </display:table>

    </div>

    <s:hidden value="%{#attr.orderItem.orderItemId}" />
    <s:hidden value="%{#attr.vesselSchedule.vesselScheduleId}" />

    <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>

        <%--<button type="button" class="btn btn-primary freightPlanSaveBtn">Save</button>--%>

        <s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
            <s:param name="orderItemIdParam"
                     value="#attr.orderItem.orderItemId">
            </s:param>
            <s:param name="vesselScheduleIdParam"
                     value="#attr.vesselSchedule.vesselScheduleId">
            </s:param>
        </s:url>
        <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip" title="Set Schedule">
            <button type="button" class="btn btn-primary freightPlanSaveBtn">Save</button>
        </s:a>

    </div>

</div>


