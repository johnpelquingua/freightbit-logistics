<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

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
            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
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

                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Size: <s:property value="orderItem.nameSize"/> </label>
                </s:if>
                <s:else>
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Item: <s:property value="orderItem.nameSize"/> </label>
                </s:else>
                <br />
                <br />
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="orderStatusLogs" name="orderStatusLogs"
                                           requestURI="loadUpdateStatus.action" pagesize="10"
                                           class="shipmentMonitoringTable table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="actualDate" title="Actual Date/Time <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;" format="{0,date,dd-MMM-yyyy hh:mm a}"></display:column></td>

                                <td><display:column property="status" title="Shipment History <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="createdBy" title="Updated By <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <%--<td>
                                    <display:column title="Action">
                                    <a id="edit-icon" href="#" data-toggle="modal" data-target="#actualModal" onclick="showActualDateFields(${orderStatusLogs.statusId});" title="Set Actual Date of this status" rel="tooltip">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    </display:column>
                                </td>--%>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>
                </div>

                <s:form cssClass="form-horizontal" theme="bootstrap" action="updateStatus" >
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
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                        <s:param name="orderIdParam"
                                 value="order.orderId"></s:param>
                        <s:param name="orderNoParam"
                                 value="order.orderNo"></s:param>
                    </s:url>

                    <s:a href="%{viewStatusListItemsUrl}" rel="tooltip" title="Update Status">
                        <button type="button" id="Cancel" class="btn btn-danger">
                            Back to Booking Item List
                        </button>
                    </s:a>
                    <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" value="Update Status" />
<%--                        <button type="button" class="btn btn-primary" onclick="checkUpStatus()">Update Status</button>
                        <button id="modalTrigger" style="display: none" data-toggle="modal"></button>--%>
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
</s:form>
<script type="text/javascript">
    /*function checkUpStatus(){
     if($('.statusDropdown').val() == 'DELIVERED'){
     $('#actualModal').modal('toggle');
     $('#modalTrigger').click()
     }
     else if($('.statusDropdown').val() == 'PICKUP'){
     $('#actualModal').modal('toggle');
     $('#modalTrigger').click()
     }
     else if($('.statusDropdown').val() == 'ARRIVED'){
     $('#actualModal').modal('toggle');
     $('#modalTrigger').click()
     }
     else if($('.statusDropdown').val() == 'IN-TRANSIT'){
     $('#actualModal').modal('toggle');
     $('#modalTrigger').click()
     }
     else{
     $('form').submit()
     }
     }*/
    $(document).ready(function() {
        var shipTable = $('.shipmentMonitoringTable tbody tr td:nth-child(2)');
        if (shipTable.size()) {
            for (var i = 0; i < shipTable.size(); i++) {
                if(shipTable.eq(i).text() != 'CANCELLED' && shipTable.eq(i).text() != 'PENDING'){
                    $('.statusDropdown option[value="' + shipTable.eq(i).text() + '"]').remove();
                }
            }
        }
    });

/*    function sendOkStatus(){
        $('form').submit()
    }*/
</script>
