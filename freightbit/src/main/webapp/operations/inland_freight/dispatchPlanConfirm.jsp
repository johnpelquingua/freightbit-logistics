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

  .dispatch-form {
      margin-bottom: 20px;
  }

  .control-label {
      font-weight: bold;
  }

</style>


<div class="panel-body">

    <h4>Are you sure you want to assign container(s) to this trucking vendor?</h4><br />

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

                    <td>
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
                    </td>

                </tr>

            </display:table>

        </div>

        <h4 style="text-align:center;"><i class="fa fa-arrow-down fa-3x"></i></h4>

        <h4 style="text-align:center; margin-bottom: 20px;"> <i class="fa fa-truck"></i> Trucking Vendor Origin </h4>

        <label class="col-lg-3 control-label" style="padding-top:0px; text-align: center;">Vendor</label>

        <div class="col-lg-9">
            <s:textfield cssClass="form-control dispatch-form" value="%{#attr.vendor.vendorName}" />
        </div>

        <label class="col-lg-3 control-label" style="padding-top:0px; text-align: center;">Driver</label>

        <div class="col-lg-9">
            <s:textfield cssClass="form-control dispatch-form" value="%{driverCodeParam}"  />
        </div>

        <label class="col-lg-3 control-label" style="padding-top:0px; text-align: center;">Truck</label>

        <div class="col-lg-9">
            <s:textfield cssClass="form-control dispatch-form" value="%{truckCodeParam}"  />
        </div>

        <label class="col-lg-3 control-label" style="padding-top:0px; text-align: center;">Truck Type</label>

        <div class="col-lg-9">
            <s:textfield cssClass="form-control dispatch-form" value="%{#attr.truck.truckType}"  />
        </div>

        <label class="col-lg-3 control-label" style="padding-top:0px; text-align: center;">Plate Number</label>

        <div class="col-lg-9">
            <s:textfield cssClass="form-control dispatch-form" value="%{#attr.truck.plateNumber}"  />
        </div>

        <label class="col-lg-3 control-label" style="padding-top:0px; text-align: center;">Gross Weight</label>

        <div class="col-lg-9">
            <s:textfield cssClass="form-control dispatch-form" value="%{#attr.truck.grossWeight}" />
        </div>

        <label class="col-lg-3 control-label" style="padding-top:0px; text-align: center;">Pickup Date</label>

        <div class="col-lg-9">
            <s:textfield cssClass="form-control dispatch-form" value="%{finalPickupParam}"  />
        </div>

        <%--<s:textfield value="%{#attr.truck.plateNumber}" />--%>

        <s:hidden value="%{originConfirmFlag}" />

        <div class="pull-right">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>

            <s:url var="editOrderItemsDispatchUrl" action="editOrderItemsOriginModal">

                <s:param name="originConfirmFlag"
                         value="originConfirmFlag">
                </s:param>
                <s:param name="vendorId"
                         value="#attr.vendor.vendorId">
                </s:param>
                <s:param name="driverCodeParam"
                         value="driverCodeParam">
                </s:param>
                <s:param name="truckCodeParam"
                         value="truckCodeParam">
                </s:param>
                <s:param name="finalPickupParam"
                         value="finalPickupParam">
                </s:param>

            </s:url>
            <s:a class="icon-action-link" href="%{editOrderItemsDispatchUrl}" rel="tooltip" title="Set Vendor">
                <button type="button" class="btn btn-primary">Save</button>
            </s:a>

        </div>

</div>


