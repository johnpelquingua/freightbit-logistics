<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Shipment Monitoring </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
            <li class="active"> Operations</li>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                <li class="active"><a href="<s:url action='../operations/viewStatusList' />"> On-Going Booking List </a></li>
            </sec:authorize>

            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                <li class="active"> Booking <s:property value="bookingNumber"/> Container List</li>
            </s:if>
            <s:else>
                <li class="active"> Booking <s:property value="bookingNumber"/>Item List</li>
            </s:else>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-book"></i>
                <span class="panel-title">Booking Information</span>
            </div>
            <div class="panel-body form-horizontal">
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Booking Number</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Freight Type</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.freightType}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Requirement</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.consigneeName}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>

            </div>

        </div>

        <s:if test="hasActionMessages()">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
            </div>
        </s:if>

        <s:if test="hasActionErrors()">
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
            </div>
        </s:if>

        <div class="panel panel-primary">

            <div class="panel-heading">
                <%--<h3 class="panel-title"><i class="fa fa-list"></i> List of Items of <s:property value="%{orderNoParam}"/> </h3>--%>
                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                    <span class="active"><i class="fa fa-list"></i> Container List</span>
                </s:if>
                <s:else>
                    <span class="active"><i class="fa fa-list"></i> Item List</span>
                </s:else>
            </div>

            <div class="panel-body">

                <div class="table-responsive" id="focusHere">
                        <s:form name="myform" action="setBulkItemStatus" theme="bootstrap" cssClass="setStatusForm">
                        <s:hidden name="orderItem.editItem" id="edit"></s:hidden>
                        <s:hidden value="%{#attr.order.orderId}" name="orderStatusLogsBean.orderId"/>
                        <s:hidden value="%{orderItemIdParam}" name="orderStatusLogsBean.orderItemId"/>
                        <s:property value="#attr.orderItem.orderItemId"></s:property>
                    <display:table id="orderItem" name="orderItems"
                                   requestURI="viewStatusListItems.action" pagesize="10"
                                   class="bulkItemStatus table table-striped table-hover table-bordered text-center tablesorter tabled-condensed"
                                   style="margin-top: 15px;">
                    <tr>

                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                        <td>
                            <display:column title="<input type='checkbox' id='mainCheckBox' name='mainCheckBox'/>">
                                <s:checkbox theme="simple" name="check" fieldValue="%{#attr.orderItem.orderItemId}"/>
                            </display:column>
                        </td>
                        </sec:authorize>

                        <td>
                            <display:column property="createdTimestamp" title="Actual Date/Time <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;" format="{0,date,dd-MMM-yyyy hh:mm a}"></display:column>
                        </td>

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

                        <td>
                            <display:column property="containerNumber" title="Container Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <display:column property="sealNumber" title="Seal Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <display:column property="bulletSeal" title="Bullet Seal <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <display:column property="status" title="Current Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <%--<td>
                            <display:column property="createdBy" title="Updated By <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>--%>

                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER', 'ROLE_CUSTOMER')">
                        <td>
                            <display:column title="Action">
                                <%--<s:if test="#attr.orderItem.status != 'PLANNING 1' && #attr.orderItem.status != 'PLANNING 2' && #attr.orderItem.status != 'PLANNING 3'">--%>
                                <s:url var="loadUpdateStatusUrl" action="loadUpdateStatus">
                                    <s:param name="orderItemIdParam" value="#attr.orderItem.orderItemId">
                                    </s:param>
                                </s:url>
                                    <s:a class="icon-action-link" href="%{loadUpdateStatusUrl}" rel="tooltip" title="View Shipment History">
                                    <i class="fa fa-edit"></i>
                                    </s:a>
                                <%--</s:if>--%>
                                <s:else>
                                    <i style="color: red;" class="fa fa-ban"></i>
                                </s:else>
                                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                                    <a data-toggle="modal" data-target="#updateContainerDetails" id="createContainer" href="#" rel="tooltip" title="Set container details" onclick="showContainerDetails(${orderItem.orderItemId});">
                                        <i class="fa fa-clipboard"></i>
                                    </a>
                                </sec:authorize>
                            </display:column>
                        </td>
                        </sec:authorize>
                    </tr>
                    </display:table>
                            <%--<s:property value="order.orderId"></s:property>--%>
                        <div class="pull-right">
                            <s:url var="accStatus" action="serviceAccomplishedStatus">
                                <s:param name="orderIdParam"
                                         value="order.orderId"></s:param>
                            </s:url>
                           <%-- 'ROLE_CUSTOMER_RELATIONS'--%>
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER', 'ROLE_CUSTOMER_RELATIONS')">
                                <s:a href="%{accStatus}" rel="tooltip" title="Service Accomplished">
                                <a id="Complete" class="btn btn-primary serviceCompleteBtn">
                                    Set Service Complete
                                </a>
                            </s:a>
                            </sec:authorize>
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                            <s:submit cssClass="btn btn-success" value="Set Status" onclick="addText();"></s:submit>
                            </sec:authorize>

                        </div>
                            <span class="pull-right" style="margin-right: 5px;">
                                <a href="../operations/viewStatusList" class="btn btn-danger" id ="groups-btn"><i class="fa fa-chevron-left"></i> On-Going Booking List</a>
                            </span>
                </div>
            </div>
            <div class="panel-footer">

                <div class="table-responsive" >
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>Legend:</label></td>
                                <td><i class="fa fa-edit"></i> View Shipment History</td>
                                <td><i class="fa fa-clipboard"></i> Set container details</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> QUEUE FOR PICK-UP</strong> <br>The pick-up requirement is lined-up for service action.</td>
                                <td><strong> CONSOLIDATION</strong> <br>The shipment is for consolidation at Ernest warehouse.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> POSITIONED</strong> <br>The container was positioned at the area of the shipper for stuffing.</td>
                                <td><strong> QUEUE FOR DEPARTURE</strong> <br>The shipment is at the port of origin waiting for departure.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> IN TRANSIT TO PICK-UP</strong> <br>The truck is in-transit to pick-up area.</td>
                                <td><strong> IN-TRANSIT</strong> <br>The shipment is on board the cargo vessel and is in-transit to port of destination.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> PICKED-UP</strong> <br>The shipment was pulled out from the area of the shipper.</td>
                                <td><strong> ARRIVED</strong> <br>The shipment has arrived at the port of destination.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> QUEUE FOR DELIVERY</strong> <br>The delivery requirement is lined-up for service action.</td>
                                <td><strong> RETURNED TO ORIGIN</strong> <br>The shipment was not successfully delivered and is to return to origin.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> IN TRANSIT TO DELIVERY</strong> <br>The truck is in-transit to delivery area.</td>
                                <td><strong> PENDING</strong> <br>The booking request is pending for action.</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><strong> DELIVERED</strong> <br>The shipment was delivered to the consignee.</td>
                                <td><strong> CANCELLED</strong> <br>The booking was cancelled.</td>
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

<div class="modal fade" id="updateContainerDetails" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">
                <div id="containerInput">
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="serviceCompleteModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-check" style="color: #2ECC71;"></i> Complete Booking</span>
            </div>
            <div class="modal-body">
                Do you want to complete this booking? Please confirm.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                <a href="" class="btn btn-primary confirmServiceCompleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

</s:form>

<script>

    $(document).ready(function() {
        $('#mainCheckBox').click(function () {
                if ($('#orderItem [type="checkbox"]:checked').length == $('#orderItem [type="checkbox"]').size()) {
                    $('#orderItem [type="checkbox"]').prop('checked', false);
                } else {
                    $('#orderItem [type="checkbox"]').prop('checked', true);
                }
        })

        actionConfirmation($('.serviceCompleteBtn'), $('.confirmServiceCompleteModalBtn'), $('#serviceCompleteModal'));

    });

    function addText() {
        document.getElementById("edit").value = "";
    }

    /*$(document).ready(function(){
        $('.setStatusBtn').click(function(){
            var bulkStatus = $('.bulkItemStatus tbody tr td:nth-child(4)'),
            sameStatus = $('.bulkItemStatus tbody tr td:nth-child(4)').eq(0).text(),
            flag = 0;
            for (var i = 0; i < bulkStatus.size(); i++) {
                if (bulkStatus.eq(i).text() != sameStatus) {
                    flag++;
                }
            }
            if(flag == 0){
                $('.setStatusForm').submit();
            }
            else{
                alert('Current statuses of both items should be the same.');
            }
        });
     });*/
    $( window ).load(function() {
        window.location.href = '#focusHere';
    });

</script>