<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

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
                    <div class="row">
                        <s:form name="myform" action="setBulkItemStatus" theme="bootstrap" cssClass="setStatusForm">
                        <s:hidden name="orderItem.editItem" id="edit"></s:hidden>
                        <s:hidden value="%{#attr.order.orderId}" name="orderStatusLogsBean.orderId"/>
                        <s:hidden value="%{orderItemIdParam}" name="orderStatusLogsBean.orderItemId"/>
                        <s:property value="#attr.orderItem.orderItemId"></s:property>
                    </div>
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
                            <display:column property="status" title="Current Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <display:column property="createdBy" title="Updated By <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>


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
                            </display:column>
                        </td>
                    </tr>
                    </display:table>
                            <%--<s:textfield  style="display: none" cssClass="col-lg-6" name="orderItem.editItem" id="edit"></s:textfield>--%>
                        <div class="pull-right">
                            <s:url var="accStatus" action="serviceAccomplishedStatus">
                                <s:param name="orderIdParam"
                                         value="order.orderId"></s:param>
                            </s:url>
                            <s:if test="#attr.orderItem.status == 'ARRIVED' || #attr.orderItem.status == 'DELIVERED'">
                                    <s:a href="%{accStatus}" rel="tooltip" title="Service Accomplished" onclick="return confirm('Are you sure you really want to complete the service?');">
                                <button type="button" id="Complete" class="btn btn-default">
                                    Complete The Service
                                </button>
                            </s:a>
                            </s:if>
                            <%--<button type="button" id="Complete" class="col-lg-4 btn btn-default setStatusBtn" value="Set All Status" onclick="addText();">
                                Set Status
                            </button>--%>
                                <s:submit cssClass="btn btn-success" value="Set Status" onclick="addText();"></s:submit>
                        </div>
                    </s:form>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-right">
                    <button type="button" class="btn btn-primary new-booking" onclick="location.href='viewStatusList'">
                        On-Going Booking List
                    </button>
                </span>
            </div>

        </div>
    </div>
</div>

<script>

    $('#mainCheckBox').click(function(){
        if($('#orderItem [type="checkbox"]:checked').length == $('#orderItem [type="checkbox"]').size()){
            $('#orderItem [type="checkbox"]').prop('checked', false);
        }else{
            $('#orderItem [type="checkbox"]').prop('checked', true);
        }
    })

    var check = document.getElementById("check");
    for (var i = 0; i < check.length; i++)
        check[i].checked = true ;

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