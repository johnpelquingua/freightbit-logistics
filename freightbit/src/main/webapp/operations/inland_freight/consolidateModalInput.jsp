<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="form-group col-lg-12">
    <div class="consolidateLoadingDiv center-text">
      Pulling up Schedules. Please Wait.<br/>
      <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
    </div>
    <div class="consolidateTableDiv" style="display: none;">
      <display:table id="vesselSchedule" name="vesselSchedules"
                     requestURI="/viewSeaFreightPlanning.action"
                     class="table table-striped table-hover table-bordered text-center tablesorter lclConsolidateSchedule"
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
        <%--<td><display:column property="vesselScheduleId" title="Arrival" class="tb-font-black"--%>
                            <%--style="text-align: center;"> </display:column></td>--%>
        <td>
          <display:column title="Action">
            <s:url var="setLCLBulkScheduleUrl" action="setLCLBulkSchedule">
              <s:param name="vesselScheduleIdParam"
                       value="#attr.vesselSchedule.vesselScheduleId">
              </s:param>
              <s:param name="vendorIdParam"
                       value="#attr.vesselSchedule.vendorId">
              </s:param>
              <s:param name="checkLCL"
                       value="%{vesselSchedule.ordersLCL}" >
              </s:param>
            </s:url>
            <s:a class="icon-action-link" href="%{setLCLBulkScheduleUrl}" rel="tooltip" title="Set Vessel Schedule">
                <i class="fa fa-arrow-circle-down setVesselIcon"></i>
            </s:a>
          </display:column>
        </td>

      </display:table>
    </div>
</div>

<s:hidden value="%{vesselSchedule.ordersLCL}"/>