<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
/*Style for scrollable table*/

html,body{width:100%;height:100%;}
div.horizontal{display:block;width:100%;height:100%;overflow:hidden;position:static}
div.scroller{display:block;width:100%;height:100%;overflow:hidden;position:static}
.table{display:table;width:500% !important;height:100%}
.table > section{width:3600px;height:100%;display:table-cell;background:#e3e3e3;vertical-align:middle;text-align:center}
.TableContainer{overflow:scroll;overflow-x: overlay;}
article{width:800px;height:400px;display:table-cell;background:#e3e3e3;vertical-align:middle;text-align:center}
article:nth-child(2n+2){background:#d1d1d1}
.table-bordered > thead > tr > th{padding: 10px;}

</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-file-text"></i> Documents Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"> Pending Documents List</li>
        </ol>

    </div>
</div>

<!-- MAIN BOX -->

<div class="row">
    <div class="col-lg-12">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>
                    Pending Documents List
                </h3>
            </div>

            <div class="panel-body horizontal">
                <div class="table-responsive TableContainer">
                    <section>
                        <div id="scroller horizontal">

                            <display:table id="order" name="orders"
                                           requestURI="viewPendingDocuments.action" pagesize="10"
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
                                <%--Freight Type--%>
                                <td><display:column property="freightType" title="Freight Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Service Requirement--%>
                                <td><display:column property="serviceRequirement" title="Freight Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Service Mode--%>
                                <td><display:column property="modeOfService" title="Service Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                               <%-- Date of Documents Returned (INBOUND)--%>
                                <td><display:column title="Date of Documents Returned (INBOUND) <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Sales Invoice / Delivery Receipt Number--%>
                                <td><display:column title="Sales Invoice / Delivery Receipt Number <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Date of Documents Sent (OUTBOUND)--%>
                                <td><display:column title="Date of Documents Sent (OUTBOUND) <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--LBC Reference Number--%>
                                <td><display:column title="LBC Reference Number <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Date of Documents Returned (FINAL INBOUND)--%>
                                <td><display:column title="Date of Documents Returned (FINAL INBOUND) <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Received By--%>
                                <td><display:column title="Received By <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Date of Documents forwarded to Accounting--%>
                                <td><display:column title="Date of Documents forwarded to Accounting (BILLING) <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column title="Action">
                                    <s:url var="viewDocumentsUrl" action="../documentation/viewOrderDocuments">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{viewDocumentsUrl}" rel="tooltip" title="View Documents">
                                        <i class="fa fa-eye"></i>
                                    </s:a>
                                </display:column></td>

                            </display:table>

                        </div>
                    </section>
                </div>
            </div>

            <%--<div class="panel-body">
                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="viewPendingDocuments.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;empty-cells: hide;">

                        <td><display:column title="Booking Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Ernest Reference # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Date of Docs Returned <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Consignee <i class='fa fa-sort' />"
                                            class="tb-font-black" style="text-align: center;"> </display:column></td>
                        <td><display:column title="Invoice DR No. <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Master Waybill <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Date forwarded to acct.<i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <s:url var="viewDocumentsUrl" action="../documentation/viewOrderDocuments">
                                <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewDocumentsUrl}" rel="tooltip" title="View Documents">
                                <i class="fa fa-eye"></i>
                            </s:a>
                        </display:column></td>

                    </display:table>
                </div>
            </div>--%>

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