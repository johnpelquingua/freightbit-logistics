<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
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
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Container: <s:property value="orderItem.nameSize"/> </label>
                </s:if>
                <s:else>
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Item: <s:property value="orderItem.nameSize"/> </label>
                </s:else>
                <br />
                <br />
                <div class="table-responsive TableContainer">
                            <display:table id="orderStatusLogs" name="orderStatusLogs"
                                           requestURI="loadItemShipmentHistory.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="createdTimestamp" title="Date/Time" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="createdBy" title="Updated By" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                                <td><display:column property="status" title="Shipment History" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>

                            </display:table>

                </div>
                <s:form cssClass="form-horizontal" theme="bootstrap" action="setItemStatus" >
                <s:hidden value="%{orderIdParam}" name="orderStatusLogsBean.orderId"/>
                <s:hidden value="%{orderItemIdParam}" name="orderStatusLogsBean.orderItemId"/>
                <div class="col-lg-3" style="text-align: center">
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Current Date/Time</label>
                    <s:textfield required="true" name="orderStatusLogsBean.createdTimestamp" cssClass="form-control" id="createdTimestamp" />

                </div>
                <div class="col-lg-9" style="text-align: center">
                    <label class="control-label header" style="padding-top:0px;font-size: 14px;font-weight: bold;">Shipment Update</label>
                    <s:if test="#attr.order.serviceRequirement == 'FULL CONTAINER LOAD' || #attr.order.serviceRequirement == 'LOOSE CARGO LOAD' || #attr.order.serviceRequirement == 'ROLLING CARGO LOAD'">

                    <s:select cssClass="form-control"
                              id="orderStatusLogs.status"
                              name="orderStatusLogsBean.status"
                              list="seaFreightList"
                              listKey="key"
                              listValue="value"
                              emptyOption="true"
                              required="true"
                            />
                    </s:if>
                    <s:elseif test="#attr.order.serviceRequirement == 'LESS CONTAINER LOAD'">
                    <s:select cssClass="form-control"
                              name="orderStatusLogsBean.status"
                              list="seaFreightLCLList"
                              listKey="key"
                              listValue="value"
                              emptyOption="true"
                              required="true"
                            />
                    </s:elseif>
                    <s:else>
                        <s:select cssClass="form-control"
                                  name="orderStatusLogsBean.status"
                                  list="inlandFreightList"
                                  listKey="key"
                                  listValue="value"
                                  emptyOption="true"
                                  required="true"
                                />
                    </s:else>

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
                            <button type="button" id="Cancel" class="btn">
                                Back to Sea Freight Planning : Orders
                            </button>
                        </s:a>
                    <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" value="Update Status"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        var curDate = $('#createdTimestamp');
        curDate.datetimepicker({
            timeFormat: 'h:mm TT',
            minDate: 0
        });
    });
</script>