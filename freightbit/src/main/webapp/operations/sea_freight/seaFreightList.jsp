
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT', 'ROLE_SALES','ROLE_DOCUMENT_SPECIALIST')">
<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Freight Plan : Orders </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Freight Plan : Orders </li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>
                    Freight Plan List
                </h3>
            </div>
            <center style="padding-top: 15px; padding-bottom: 10px;"><i><span style="color: red;">*</span> Service Freight Type: <b>Shipping and Trucking</b> and <b>Shipping</b> only</i></center>
            <div class="col-md-12 form-group" style="margin-top: 0.8em; margin-bottom: 0.5em;">
                <s:form action="changeOrigin" theme="bootstrap">
                    <label class="col-lg-2 control-label">Filter by Origin :</label>
                    <div class="col-lg-3">
                        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                  id="select1" list="portsList" listKey="key"
                                  listValue="value" name="originCity" emptyOption="true" required="true" />
                                  <%--onchange="$(this).closest('form').submit()"
                                  />--%>
                    </div>
                    <label class="col-lg-2 control-label">Filter by Destination :</label>
                    <div class="col-lg-3">
                        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                  id="select2" list="portsList" listKey="key"
                                  listValue="value" name="destinationCity" emptyOption="true" required="true" />

                    </div>
                    <s:submit name="submit" cssClass="btn btn-primary" value="Filter" />
                    <a href="viewSeaFreightList" class="btn btn-primary" id ="groups-btn">Display All</a>
                </s:form>
            </div>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs center-text padding-0-bot padding-10-lr" role="tablist" style="clear:both;" id="myTab">
                <li class="active col-md-3 zeroPadding" id="fcl">
                    <a href="#fclTab" role="tab" data-toggle="tab">Full Container Load (FCL)</a>
                </li>
                <li class="col-md-3 zeroPadding" id="lcl">
                    <a href="#lclTab" role="tab" data-toggle="tab">Less Container Load (LCL)</a>
                </li>
                <li class="col-md-3 zeroPadding" id="lcu">
                    <a href="#lcuTab" role="tab" data-toggle="tab">Loose Cargo Load (LCU)</a>
                </li>
                <li class="col-md-3 zeroPadding" id="rcu">
                    <a href="#rcuTab" role="tab" data-toggle="tab">Rolling Cargo Load (RCU)</a>
                </li>
            </ul>

            <div class="tab-content">

                <div class="tab-pane fade in active" id="fclTab">

                    <div class="panel-body">
                        <div class="table-responsive" id="no-more-tables">
                            <display:table id="order" name="fclTable"
                                           requestURI="viewSeaFreightList.action" pagesize="10"
                                           class="fclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black" scope="Order #"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black" scope="Customer"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black" scope="Consignee"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black" scope="ORI"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black" scope="DES"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black" scope="Type"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black" scope="Mode"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black" scope="Status"
                                                    style="text-align: center;"> </display:column></td>
                                <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                <td><display:column title="Action">
                                    <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                        <i style="color: red;" class="fa fa-ban"></i>
                                    </s:if>
                                    <s:else>
                                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                            <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                                             title="Set Vessel Schedule">
                                            <i class="fa fa-tasks" id="status"></i>
                                        </s:a>

                                        <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                            <i class="fa fa-info-circle"></i>
                                        </s:a>
                                    </s:else>
                                </display:column></td>
                                </sec:authorize>

                            </display:table>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="lclTab">

                    <div class="panel-body">
                        <div class="table-responsive" id="no-more-tables">
                        <s:form name="myform" action="checkOrderConsolidate" theme="bootstrap">
                            <div class="lclMainLoadingDiv" style="text-align: center; margin: 1.6em;">
                                Processing LCL orders. Please Wait.<br/>
                                <i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-circle-o-notch fa-spin"></i>
                            </div>
                            <div class="lclMainTable" style="display: none;">
                                <display:table id="order" name="lclTable"
                                               requestURI="viewSeaFreightList.action" pagesize="10"
                                               class="lclTable table table-hover table-bordered text-center tablesorter table-condensed"
                                               style="margin-top: 15px;empty-cells: hide;">

                                    <td>
                                            <%--<display:column title="<input type='checkbox' class='lclCheckbox' id='mainCheckBox' name='mainCheckBox'/>">--%>
                                        <display:column title="">
                                            <s:checkbox theme="simple" name="check" cssClass="lclCheckbox"
                                                        fieldValue="%{#attr.order.orderId}"/>
                                        </display:column>
                                    </td>

                                    <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black" scope="Order #"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black" scope="Customer"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black" scope="Consignee"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black" scope="Type"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black" scope="ORI"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black" scope="DES"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black" scope="Mode"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black" scope="Status"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="orderWeight" title="Weight  <i class='fa fa-sort' />" class="tb-font-black" scope="Weight"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="orderVolume" title="Volume  <i class='fa fa-sort' />" class="tb-font-black" scope="Volume"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="pickupDate" title="PICKUP  <i class='fa fa-sort' />" class="tb-font-black" scope="PICKUP"
                                                        style="text-align: center;"> </display:column></td>
                                    <td><display:column property="deliveryDate" title="DELIVERY  <i class='fa fa-sort' />" class="tb-font-black" scope="DELIVERY"
                                                        style="text-align: center;"> </display:column></td>
                                    <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                    <td>
                                        <display:column title="Action">
                                            <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                                <i class="fa fa-ban"></i>
                                            </s:if>
                                            <s:else>
                                                <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                                    <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                                                     title="Direct Load">
                                                    <i class="fa fa-tasks" id="status"></i>
                                                </s:a>

                                                <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                                    <i class="fa fa-info-circle"></i>
                                                </s:a>
                                            </s:else>
                                        </display:column>
                                    </td>
                                    </sec:authorize>
                                    <td><display:column property="orderId" title="HIDE_ME" class="tb-font-black"
                                                        style="text-align: center;"> </display:column></td>
                                </display:table>
                            </div>

                            <div class="col-md-6 pull-right well wellDiv" style="display: none;">
                                <p>Total Weight (kg) : <font id="wellTotalWeight">0</font></p>
                                <p>Total Volume  (cbm) : <font id="wellTotalVolume">0</font></p>
                                <hr/>
                                <h4>
                                    <i style="color: #3498DB;" class="fa fa-gears"></i>
                                    Recommended container
                                </h4>
                                <div id="mainReco">
                                    <div id="recommendedContent">
                                        Choose item(s) first
                                    </div>
                                </div>
                                <hr/>
                                <div class="warningMsg"><i class="fa fa-warning" style="color: #E74C3C"></i> <i style="color: #E74C3C; font-size: 0.9em;">Bookings must have the same ORIGIN and DESTINATION to initialize consolidation</i></div>
                                <br/><button style="margin-top: 1em;" disabled type="button" class="consolidateBtn btn btn-default" data-toggle="modal" data-target="#consolidateModal"><i class="fa fa-cubes"></i> Consolidate</button>
                            </div>

                        </s:form>
                        <s:hidden cssClass="consolidateModalTextfield" id="consolidatedOrders" />
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="lcuTab">

                    <div class="panel-body">
                        <div class="table-responsive" id="no-more-tables">
                            <display:table id="order" name="lcuTable"
                                           requestURI="viewSeaFreightList.action" pagesize="10"
                                           class="lcuTable table table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black" scope="Order #"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black" scope="Customer"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black" scope="Consignee"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black" scope="Type"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black" scope="ORI"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black" scope="DES"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black" scope="Mode"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black" scope="Status"
                                                    style="text-align: center;"> </display:column></td>
                                <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                <td><display:column title="Action">
                                    <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED' ">
                                        <i class="fa fa-ban"></i>
                                    </s:if>
                                    <s:else>
                                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                            <s:param name="orderIdParam" value="#attr.order.orderId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                                             title="Set Vessel Schedule">
                                            <i class="fa fa-tasks" id="status"></i>
                                        </s:a>

                                        <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                            <i class="fa fa-info-circle"></i>
                                        </s:a>
                                    </s:else>
                                </display:column></td>
                                </sec:authorize>
                            </display:table>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="rcuTab">

                    <div class="panel-body">
                        <div class="table-responsive" id="no-more-tables">
                            <display:table id="order" name="rcuTable"
                                           requestURI="viewSeaFreightList.action" pagesize="10"
                                           class="rcuTable table table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">

                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black" scope="Order #"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black" scope="Customer"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black" scope="Consignee"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black" scope="Type"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black" scope="ORI"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black" scope="DES"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black" scope="Mode"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black" scope="Status"
                                                    style="text-align: center;"> </display:column></td>
                                <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                <td><display:column title="Action">
                                    <s:if test="#attr.order.orderStatus=='PENDING' || #attr.order.orderStatus=='INCOMPLETE' || #attr.order.orderStatus=='CANCELLED'">
                                        <i class="fa fa-ban"></i>
                                    </s:if>
                                    <s:else>
                                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                                             title="Set Vessel Schedule">
                                            <i class="fa fa-tasks" id="status"></i>
                                        </s:a>

                                        <s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">
                                            <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">
                                            <i class="fa fa-info-circle"></i>
                                        </s:a>
                                    </s:else>
                                </display:column></td>
                                </sec:authorize>
                            </display:table>
                        </div>
                    </div>

                </div>

            </div>

            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class="fa fa-stop" style="color: #d9534f;"></i> Cancelled</td>
                                <td><i class="fa fa-stop" style="color: #428bca;"></i> On Going</td>
                                <td style="width: 20%;"><i class="fa fa-stop" style="color: #f0ad4e;"></i> Pending / Incomplete</td>
                                <td><i class="fa fa-stop" style="color: #5cb85c;"></i> Approved / Newly Added</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i class='fa fa-anchor'></i> Shipping</td>
                                <td><i class='fa fa-truck' ></i> Trucking</td>
                                <td><i class='fa fa-info-circle' ></i> Information</td>
                                <td><i class='fa fa-trash-o'></i> Delete</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i class='fa fa-tasks' ></i> Set Vessel Schedule</td>
                                <td><i class='fa fa-print' ></i> Print</td>
                                <td><i class='fa fa-check' ></i> Approve</td>
                                <td><i class='fa fa-times' ></i> Cancel</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i style="color: red;" class='fa fa-ban'></i> Actions Disabled</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<%--LARGE MODAL FOR CONSOLIDATION >> START--%>

<div id="consolidateModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="font-size: 1.6em;">
                <i class="fa fa-cubes"></i> Consolidate
            </div>
                <div class="modal-body">
                    <div id="consolidatedModalDiv"> <%--Area where input fields will appear--%> </div>
                </div>
            <div class="modal-footer" style="margin-top: 100px;" >
                <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<%--LARGE MODAL FOR CONSOLIDATION >> END--%>

<script>
    $(document).ready(function(){
        // START
        $('#myTab').tabCollapse();

        if($('.lclTable tbody tr').size() >= 1){ filterLclTable(); }
        else{$('.lclMainLoadingDiv').hide();}

        $('.consolidateBtn').click(function(){

            var checkedItems = $('.lclCheckbox:checked');

            for(var i=0; i < checkedItems.size(); i++){
                var itemId = checkedItems.eq(i).closest('tr').find('td').eq(14).text()
                if(i == 0){
                    $('.consolidateModalTextfield').val(itemId);
                }else{
                    $('.consolidateModalTextfield').val($('.consolidateModalTextfield').val()+','+itemId);
                }
            }

            $.ajax({
                url: 'getConsolidateAction',
                async: false,
                type: 'POST',
                data: { checkLCL: $('#consolidatedOrders').val() },
                dataType: 'html',
                success: function (html) {
                    $('#consolidatedModalDiv').html(html);
//                    $('#consolidateModal').modal().show();
                },
                error: function(xhr, ajaxOptions, thrownError){
                    alert('An error occurred! ' + thrownError);
                }
            });

            lclHideVesselSchedule();

        });

        $('.lclCheckbox').change(function(){
            lclCheckboxFilter($(this));
        });

        // END

        if($('.lclTable').size() != 0){
            $('.wellDiv').show('fast');
            seaFreightLclComputation('lclTable', 'wellTotalWeight', 'wellTotalVolume');
        }

        var freightStatus = $('#order tbody tr td:nth-child(7)'),
            freightAction = $('#order tbody tr td:nth-child(8)');

        for(var i=0; i < $('#order tbody tr').size(); i++){
            if(freightStatus.eq(i).text() == 'INCOMPLETE'){
                freightAction.eq(i).empty().append('<i style="color: red;" class="fa fa-ban"></i>')
            }
        }

        $('#mainCheckBox').click(function(){
            var allCheckbox = $('.lclTable tbody tr td input[type="checkbox"]');
            if(allCheckbox.is(':checked')){
                allCheckbox.prop('checked', false);
                computeAll('lclTable', 'wellTotalWeight', 'wellTotalVolume', 'SUBTRACT');
            }else{
                allCheckbox.prop('checked', true);
                computeAll('lclTable', 'wellTotalWeight', 'wellTotalVolume', 'ADD');
            }
        })

        tablePropClass('DESTI_ORIG','fclTable', 8, 6, 0, 7, 4, 5);
        tablePropClass('DESTI_ORIG','lclTable', 9, 5, 0, 8, 6, 7);
        tablePropClass('DESTI_ORIG','lcuTable', 8, 4, 0, 7, 5, 6);
        tablePropClass('DESTI_ORIG','rcuTable', 8, 4, 0, 7, 5, 6);

    })

    $(function () {
        $('#myTab a:first').tab('show')
    });

    $(function() {
        $('a[data-toggle="tab"]').on('click', function (e) { localStorage.setItem('lastTab', $(e.target).attr('href')); });
        var lastTab = localStorage.getItem('lastTab');
        if (lastTab) { $('a[href="'+lastTab+'"]').click(); }
    });

    /*$('#select1').change(function(){ preventSamePort($(this), $('#select2')); })
    $('#select2').change(function(){ preventSamePort($(this), $('#select1')); })*/

    // Avoid selecting duplicate ports

    function preventDuplicatePort(select, index) {

        var options = select.options,
                len = options.length;

        while ( len-- ){
            options[ len ].disabled = false;
        }

            select.options[index].disabled = true;

        if( index === select.selectedIndex ){
            alert('You already selected the same port "' + select.options[index].text + '". Please choose another' );
            /*this.selectedIndex = 0;*/
            select2.value = '';
        }

    }

    var select1 = select = document.getElementById('select1');
    var select2 = select = document.getElementById('select2');

//    select2.value = '';

    select1.onchange = function() {
        preventDuplicatePort.call(this, select2, this.selectedIndex);
    };

    select2.onchange = function() {
        preventDuplicatePort.call(this, select1, this.selectedIndex);
    };
</script>
</sec:authorize>