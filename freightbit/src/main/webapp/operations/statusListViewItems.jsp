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
            <li class="active"><a href="<s:url action='../operations/viewStatusList' />"> On-Going Booking List </a></li>
            <%--<li class="active"> On-Going Booking List</li>--%>
            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                <li class="active"> Booking <s:property value="bookingNumber"/> Container List</li>
            </s:if>
            <s:else>
                <li class="active"> Booking <s:property value="bookingNumber"/>Item List</li>
            </s:else>
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

<s:if test="hasActionErrors()">
    <div class="col-lg-12">
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

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
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer Name</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee Name</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
                    </div>
                </div>
            </div>
        </div>

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

                <div class="table-responsive">
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
                        <td><display:column title="<input type='checkbox' id='mainCheckBox' name='mainCheckBox'/>">
                            <s:checkbox theme="simple" name="check" fieldValue="%{#attr.orderItem.orderItemId}"/>
                        </display:column></td>

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
                            <display:column property="shippingSeal" title="Shipping Seal <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <display:column property="status" title="Current Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <display:column property="createdBy" title="Updated By <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                        <td>
                            <display:column title="Action">
                                <s:if test="#attr.orderItem.status != 'PLANNING 1' && #attr.orderItem.status != 'PLANNING 2' && #attr.orderItem.status != 'PLANNING 3'">
                                <s:url var="loadUpdateStatusUrl" action="loadUpdateStatus">
                                    <s:param name="orderItemIdParam" value="#attr.orderItem.orderItemId">
                                    </s:param>
                                </s:url>
                                    <s:a class="icon-action-link" href="%{loadUpdateStatusUrl}" rel="tooltip" title="View Shipment History">
                                    <i class="fa fa-edit"></i>
                                    </s:a>
                                </s:if>
                                <s:else>
                                    <i style="color: red;" class="fa fa-ban"></i>
                                </s:else>

                                <a data-toggle="modal" data-target="#updateContainerDetails" id="createContainer" rel="tooltip" title="Set container details">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </display:column>
                        </td>
                        </sec:authorize>
                    </tr>
                    </display:table>
                            <%--<s:textfield  style="display: none" cssClass="col-lg-6" name="orderItem.editItem" id="edit"></s:textfield>--%>
                        <div class="pull-right">
                            <s:url var="accStatus" action="serviceAccomplishedStatus">
                                <s:param name="orderIdParam"
                                         value="order.orderId"></s:param>
                            </s:url>
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                                    <s:a href="%{accStatus}" rel="tooltip" title="Service Accomplished" onclick="return confirm('Are you sure you really want to complete the service?');">
                                        <button type="button" id="Complete" class="btn btn-success">
                                            Set Service Complete
                                        </button>
                                    </s:a>
                            </sec:authorize>
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_FREIGHT_OPERATIONS_OFFICER')">
                            <s:submit cssClass="btn btn-success" value="Set Status" onclick="addText();"></s:submit>
                            </sec:authorize>
                        </div>
                    </s:form>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-right">
                    <a href="../operations/viewStatusList" class="btn btn-primary" id ="groups-btn">On-Going Booking List</a>
                </span>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="updateContainerDetails" role="form" aria-labelledby="containerModal">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="containerModal">Update Container Details</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="updateContainerDetails">

                    <s:hidden value="%{#attr.orderItem.orderId}" name="orderIdParam" />
                    <s:hidden value="%{#attr.orderItem.orderItemId}" name="orderItemIdParam" />

                    <label>Container Number<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control containerNumber" id="containerNumber" name="container.containerNumber" required="true"/>

                    <label>Seal Number<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control sealNumber" id="sealNumber" name="container.sealNumber" required="true"/>

                    <label>Bullet Seal<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control bulletSeal" id="bulletSeal" name="container.bulletSeal" required="true"/>

                    <label>Shipping Seal<span class="asterisk_red"></span></label>

                    <s:textfield cssClass="form-control shippingSeal" id="shippingSeal" name="container.shippingSeal" required="true"/>

                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#mainCheckBox').click(function () {
                if ($('#orderItem [type="checkbox"]:checked').length == $('#orderItem [type="checkbox"]').size()) {
                    $('#orderItem [type="checkbox"]').prop('checked', false);
                } else {
                    $('#orderItem [type="checkbox"]').prop('checked', true);
                }
        })

        /*var check = document.getElementById("check");
        for (var i = 0; i < check.length; i++)
            check[i].checked = true;*/
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
</script>