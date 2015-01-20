<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

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
                <div class="table-responsive">
                    <%--<section>
                        <div id="scroller horizontal">--%>

                            <display:table id="order" name="orders"
                                           requestURI="viewPendingDocuments.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                           style="margin-top: 15px;empty-cells: hide;">
                                <%--Booking Date--%>
                                <td><display:column property="orderDate" title="Order Date <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Booking Number--%>
                                <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Customer Name--%>
                                <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Consignee Name--%>
                                <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Freight Type--%>
                                <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Service Requirement--%>
                                <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--Service Mode--%>
                                <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="aging" title="Aging <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column title="Action">
                                    <s:url var="viewDocumentsUrl" action="../documentation/viewOrderDocuments">
                                        <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{viewDocumentsUrl}" rel="tooltip" title="View Documents">
                                        <i class="fa fa-list-alt"></i>
                                    </s:a>
                                </display:column></td>

                            </display:table>

                        <%--</div>
                    </section>--%>
                </div>
            </div>
            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class='fa fa-anchor' ></i> Shipping</td>
                                <td><i class='fa fa-truck' ></i> Trucking</td>
                            </tr>
                        </table>
                    </div>
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
    $(document).ready(function(){
        tableProp('DESTI_ORIG', 'order', 0, 7, 8, 9, 5, 6, 1);
    });
</script>