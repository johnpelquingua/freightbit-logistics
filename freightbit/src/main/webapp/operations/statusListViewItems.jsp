<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .pagebanner, .pagelinks {
        display: none;
    }
</style>

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
            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
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
                <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                    <span class="active"><i class="fa fa-list"></i> Container List</span>
                </s:if>
                <s:else>
                    <span class="active"><i class="fa fa-list"></i> Item List</span>
                </s:else>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <button onClick='CheckAll(document.myform.check)' class="btn btn-default">Select All</button>
                    <button onClick='UnCheckAll(document.myform.check)' class="btn btn-default">Deselect All</button>

                    <s:form name="myform" action="viewSeaFreightPlanningBulk">
                    <display:table id="orderItem" name="orderItems"
                                   requestURI="viewStatusListItems.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter tabled-condesed"
                                   style="margin-top: 15px;">

                        <td>
                            <display:column>
                            <s:checkbox theme="simple" name="check" fieldValue="%{#attr.orderItem.orderItemId}"/>
                            </display:column>
                        </td>

                        <td>
                            <display:column property="createdTimeStamp" title="Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <display:column property="createdTimeStamp" title="Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <td>
                            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                <display:column property="nameSize" title="Container <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column>
                            </s:if>
                            <s:else>
                                <display:column property="nameSize" title="Item <i class='fa fa-sort' />" class="tb-font-black"
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
                            <display:column property="orderItemId" title="Updated By <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>

                        <%--<td>
                            <display:column property="orderItemId" title="Updated By <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column>
                        </td>--%>

                        <%--<td>
                            <display:column title="Action">
                                <s:url var="loadUpdateStatusUrl" action="loadUpdateStatus">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderStatusLogs.orderItemId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{loadUpdateStatusUrl}" rel="tooltip"
                                     title="Update Status">
                                    <i class="fa fa-info-circle"></i>
                                </s:a>
                            </display:column>
                        </td>--%>

                        <td>
                            <display:column title="Action">
                                <s:url var="loadItemShipmentHistoryUrl" action="loadItemShipmentHistory">
                                    <s:param name="orderItemIdParam" value="#attr.orderItem.orderItemId">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{loadItemShipmentHistoryUrl}" rel="tooltip" title="View Shipment History">
                                    <i class="fa fa-info-circle"></i>
                                </s:a>
                            </display:column>
                        </td>

                    </display:table>

                    <s:submit value="Set Status"></s:submit>
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

    function CheckAll(check)
    {
        for (i = 0; i < check.length; i++)
            check[i].checked = true ;
    }

    function UnCheckAll(check)
    {
        for (i = 0; i < check.length; i++)
            check[i].checked = false ;
    }

</script>