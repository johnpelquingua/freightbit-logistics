<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success" id="alert">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Shipment Monitoring</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='../operations/viewStatusList' />"> On-Going Booking List </a></li>

            <%--<li class="active"> On-Going Booking List</li>--%>
            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                <%--<li class="active"> Booking <s:property value="bookingNumber"/> Container List</li>--%>
                <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                    <s:param name="orderIdParam"
                             value="order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="order.orderNo"></s:param>
                </s:url>
                <li class="active">
                <s:a href="%{viewStatusListItemsUrl}" rel="tooltip" title="Update Status">
                    Booking <s:property value="bookingNumber"/> Container List
                </s:a>
                </li>
            </s:if>
            <s:else>
                <%--<li class="active"> Booking <s:property value="bookingNumber"/>Item List</li>--%>
                <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                    <s:param name="orderIdParam"
                             value="order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="order.orderNo"></s:param>
                </s:url>
                <li class="active">
                <s:a href="%{viewStatusListItemsUrl}" rel="tooltip" title="Update Status">
                     Booking <s:property value="bookingNumber"/>Item List
                </s:a>
                </li>
            </s:else>
            <li class="active"><s:property value="orderItem.nameSize"/>  Shipment History</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">

        <div class="panel panel-primary">

            <div class="panel-body horizontal">

                <div class="form-group">
                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                    <label class="col-lg-1 control-label" style="padding-top:0px;font-size: 14px;font-weight: bold;">Size: </label>
                </s:if>
                <s:else>
                    <label class="col-lg-1 control-label" style="padding-top:0px;font-size: 14px;font-weight: bold;">Item: </label>
                </s:else>
                    <br/>
                    <div class="col-lg-12">
                        <ol>
                        <s:iterator value="nameSizeList" >
                            <li><s:property /></li>
                        </s:iterator>
                        </ol>
                    </div>
                </div>

                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="orderStatusLogs" name="orderStatusLogs"
                                           requestURI="setBulkItemStatus.action" pagesize="10"
                                           class="shipmentMonitoringTable table table-striped table-hover table-bordered text-center tablesorter"
                                            style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="actualDate" title="Actual Date/Time <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;" format="{0,date,dd-MMM-yyyy HH:mm:ss a}"></display:column></td>

                                <td>
                                    <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                                        <display:column property="nameSize" title="Size <i class='fa fa-sort' />" class="tb-font-black"
                                                        style="text-align: center;"> </display:column>
                                    </s:if>
                                    <s:else>
                                        <display:column property="nameSize" title="Name <i class='fa fa-sort' />" class="tb-font-black"
                                                        style="text-align: center;"> </display:column>
                                    </s:else>
                                </td>

                                <td><display:column property="status" title="Shipment History <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="createdBy" title="Updated By <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <td>
                                    <display:column title="Action">
                                        <a id="edit-icon" href="#" data-toggle="modal" data-target="#actualModal" onclick="showActualDateFields(${orderStatusLogs.statusId});" title="Set Actual Date of this status" rel="tooltip">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                    </display:column>
                                </td>
                                </sec:authorize>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>
                </div>

                <s:form cssClass="form-horizontal statusForm" theme="bootstrap" action="updateBulkStatus" >
                <s:if test="orderItemIdParam != null">
                    <s:hidden value="%{orderItemIdParam}" name="orderStatusLogsBean.orderItemId"/>
                </s:if>
                <s:else>
                    <s:hidden value="%{orderStatusLogsBean.orderItemId}" name="orderStatusLogsBean.orderItemId"/>
                </s:else>


                    <div class="col-lg-3" style="text-align: center">
                        <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Actual Date/Time <span class="asterisk_red"></span></label>
                            <%--<s:textfield name="orderStatusLogsBean.createdTimestamp" cssClass="form-control" id="createdTimestamp">
                                <s:param name="value">
                                    <s:date name="new java.util.Date()" format="dd-MMM-yyyy hh:mm a"/>
                                </s:param>
                            </s:textfield>--%>
                        <s:textfield required="true" name="orderStatusLogsBean.actualDate" cssClass="form-control" id="actualDate"/>
                        <script>
                            $(function () {
                                var actDate = $('#actualDate');
                                actDate.datetimepicker({
                                    timeFormat: 'h:mm TT',
                                    minDate: 0
                                });
                            });
                        </script>
                    </div>
                <div class="col-lg-9" style="text-align: center">
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Shipment Update <span class="asterisk_red"></span></label>
                    <s:select cssClass="statusDropdown form-control"
                              id="planningStatus"
                              name="orderStatusLogsBean.status"
                              list="allFreightStatusList"
                              emptyOption="true"
                              required="true"
                            />
                </div>
                    <div class="pull-right">
                        <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                            <s:param name="orderIdParam"
                                     value="order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="order.orderNo"></s:param>
                        </s:url>

                        <s:a href="%{viewStatusListItemsUrl}" rel="tooltip" title="Update Status">
                            <button type="button" id="Cancel" class="btn btn-danger">
                                <i class="fa fa-chevron-left"></i>Back to Booking Item List
                            </button>
                        </s:a>
                            <%--<s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" value="Update Status" onclick="return confirm('Are you sure you want to update this status?');"/>--%>
                        <button class="btn btn-primary submitBtn" type="button" disabled="true">Update Status</button>
                            <%--<button type="button" class="btn btn-primary" onclick="checkUpStatus()">Update Status</button>
                                <button id="modalTrigger" style="display: none" data-toggle="modal"></button>--%>
                    </div>
            </div>

            <div class="panel-footer">
                <div class="table-responsive" >
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>Legend: </label></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> PICK UP</strong> <br>The shipment was pulled out from the area of the shipper.</td>
                                <td><strong> POSITIONED</strong> <br>The container was positioned at the area of the shipper for stuffing.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> QUEUE FOR DEPARTURE</strong> <br>The shipment is at the port of origin waiting for departure.</td>
                                <td><strong> IN-TRANSIT</strong> <br>The shipment is on board the cargo vessel and is in-transit to port of destination.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> RETURNED TO ORIGIN</strong> <br>The shipment was not successfully delivered and is to return to origin.</td>
                                <td><strong> ARRIVED</strong> <br>The shipment has arrived at the port of destination.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> DELIVERED</strong> <br>The shipment was delivered to the consignee.</td>
                                <td><strong> IN TRANSIT TO DELIVERY</strong> <br>The truck is in-transit to delivery area.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> QUEUE FOR DELIVERY</strong> <br>The delivery requirement is lined-up for service action.</td>
                                <td><strong> QUEUE FOR PICK UP</strong> <br>The pick-up requirement is lined-up for service action.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> CANCELED</strong> <br>The booking was cancelled.</td>
                                <td><strong> PENDING</strong> <br>The booking request is pending for action.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> CONSOLIDATION</strong> <br>The shipment is for consolidation at Ernest warehouse.</td>
                                <td><strong> IN TRANSIT TO PICK UP</strong> <br>The truck is in-transit to pickup area.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> SERVICE ACCOMPLISHED</strong> <br>The booking request has been accomplished.</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="actualModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%--<div class="modal-header">
                <center><h4 class="modal-title" id="alertlabel"><li class="fa fa-info"/> Warning</h4></center>
            </div>--%>
            <div class="modal-body">
                <div id="actualInput">
                    <%--<label id="actualLabel" class="control-label header">Actual Date/Time: <span class="asterisk_red"></span></label>
                    <div class="pull-center" style="padding-top:0px;">
                        <s:textfield required="true" name="orderStatusLogsBean.actualDate" cssClass="form-control" id="actualDate" />
                    </div>--%>
                </div>
            </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="sendOkStatus()">Ok</button>
            </div>--%>
        </div>
    </div>
</div>

<div class="modal fade" id="confirmStatModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="alertlabe2">Update Status</h4><br/>
                <center><h4 class="modal-title" id="alertlabel"><li class="fa fa-info"/> Warning</h4></center>
            </div>
            <div class="modal-body">
                <div id="confirmStatId">
                        <%--<label id="actualLabel" class="control-label header">Actual Date/Time: <span class="asterisk_red"></span></label>
                        <div class="pull-center" style="padding-top:0px;">
                            <s:textfield required="true" name="orderStatusLogsBean.actualDate" cssClass="form-control" id="actualDate" />
                        </div>--%>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary submitFormStat" data-dismiss="modal">Yes</button>
            </div>
        </div>
    </div>
</div>
</s:form>
<script type="text/javascript">
    /*function checkUpStatus(){
        if($('.statusDropdown').val() == 'DELIVERED'){
            $('#deliveryModal').modal('toggle');
            $('#modalTrigger').click()
        }
        else if($('.statusDropdown').val() == 'PICKUP'){
            $('#pickupModal').modal('toggle');
            $('#modalTrigger').click()
        }
        else if($('.statusDropdown').val() == 'ARRIVED'){
            $('#inTransitModal').modal('toggle');
            $('#modalTrigger').click()
        }
        else if($('.statusDropdown').val() == 'IN-TRANSIT'){
            $('#arrivedModal').modal('toggle');
            $('#modalTrigger').click()
        }
        else{
            $('form').submit()
        }
    }*/
    $(document).ready(function() {
        var shipTable = $('.shipmentMonitoringTable tbody tr td:nth-child(3)');
        if (shipTable.size()) {
            for (var i = 0; i < shipTable.size(); i++) {
                if(shipTable.eq(i).text() != 'CANCELLED' && shipTable.eq(i).text() != 'PENDING'){
                    $('.statusDropdown option[value="' + shipTable.eq(i).text() + '"]').remove();
                }
            }
        }
    });

    $(document).ready(function(){
        confirmStatusMsg();
        validationForm('statusDropdown','submitBtn');
    });

    $(document).ready(function () {
        $('.submitFormStat').click(function(){
            $('.statusForm').submit();
        });

    });

    function sendOkStatus(){
        $('form').submit()
    }
</script>
