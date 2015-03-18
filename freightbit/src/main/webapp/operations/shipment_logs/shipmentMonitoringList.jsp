<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    /*Style for scrollable table*/
    html,body{
        width:100%;height:100%;
    }
    div.horizontal{
        display:block;width:100%;height:100%;overflow:hidden;position:static
    }
    div.scroller{
        display:block;width:100%;height:100%;overflow:hidden;position:static
    }
    .table{
        display:table;width:130% !important; max-width:130% !important; height:100%
    }
    .table > section{
        width:3600px;height:100%;display:table-cell;background:#e3e3e3;vertical-align:middle;text-align:center
    }
    .TableContainer{
        overflow:scroll;
    }
    article{
        width:800px;height:400px;display:table-cell;background:#e3e3e3;vertical-align:middle;text-align:center
    }
    article:nth-child(2n+2){
        background:#d1d1d1
    }
    .table-bordered > thead > tr > th{
        padding: 10px;
    }

</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Shipment Monitoring </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"> Shipment Monitoring List</li>
        </ol>

    </div>
</div>

<!-- MAIN BOX -->

<div class="row">
    <div class="col-lg-12">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>
                    Shipment Monitoring List
                </h3>
            </div>

            <div class="panel-body horizontal">

                <div class="table-responsive TableContainer">
                    <section>
                        <div id="scroller horizontal">

                            <display:table id="order" name="orders"
                                           requestURI="viewShipmentMonitoringList.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">
                                <%--Booking Date--%>
                                <td><display:column property="orderDate" title="Booking Date <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Booking Number--%>
                                <td><display:column property="orderNumber" title="Ernest Reference Number <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Customer Name--%>
                                <td><display:column property="customerName" title="Customer Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Consignee Name--%>
                                <td><display:column property="consigneeCode" title="Consignee Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--ORIGIN--%>
                                <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--DESTINATION--%>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Freight Type--%>
                                <td><display:column property="freightType" title="Freight Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Service Requirement--%>
                                <td><display:column property="serviceRequirement" title="Freight Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Service Mode--%>
                                <td><display:column property="modeOfService" title="Service Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                <td><display:column title="Action">
                                    <s:url var="viewShipmentStatusUrl" action="../operations/viewShipmentStatus">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{viewShipmentStatusUrl}" rel="tooltip" title="View Shipment Status">
                                        <i class="fa fa-play-circle"></i>
                                    </s:a>
                                </display:column></td>
                                    </sec:authorize>

                            </display:table>

                        </div>
                    </section>

                </div>

            </div>
        </div>

    </div>
</div>

<script>
    /*Optional query for scrolling*/

    $(window).load(function() {
        var vWidth = $(window).width();
        var vHeight = $(window).height();
        $('.table > section').css('width', vWidth).css('height', vHeight);
    });

    $(window).resize(function() {
        var vWidth = $(window).width();
        var vHeight = $(window).height();
        $('.table > section').css('width', vWidth).css('height', vHeight);
    });
</script>