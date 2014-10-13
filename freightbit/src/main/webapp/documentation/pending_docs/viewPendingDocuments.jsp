<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    /*table#order {
        width: 100%;
    }
    div.TableContainer {
        width: 100%;
        height: 100%;
        overflow-x:scroll;
        overflow-y:auto;
        overflow:scroll;
    }*/
    /*#scroller {
        width: 1500px;
        overflow-x: scroll;
    }
    #scroller table {
        *//* just a quick hack to make the table overflow the containing div
           your method may differ *//*
        width: 3000px;
    }

    #scroller .table.fixedCol {
        width: auto;
        position: absolute;
        *//* below styles are specific for borderd Bootstrap tables
           to remove rounded corners on cloned table *//*
        -webkit-border-top-right-radius: 0px;
        -webkit-border-bottom-right-radius: 0px;
        -moz-border-radius-topright: 0px;
        -moz-border-radius-bottomright: 0px;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
    }
    .table.fixedCol th,
    .table.fixedCol td {
        *//* background is set to white to hide underlaying column
           of original table *//*
        background: white;
    }*/
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
                    <div id="scroller">
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
                        <%--Date of Documents Returned (INBOUND)
                        <td><display:column title="Date of Documents Returned (INBOUND) <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        &lt;%&ndash;Sales Invoice / Delivery Receipt Number&ndash;%&gt;
                        <td><display:column title="Sales Invoice / Delivery Receipt Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        &lt;%&ndash;Date of Documents Sent (OUTBOUND)&ndash;%&gt;
                        <td><display:column title="Date of Documents Sent (OUTBOUND) <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        &lt;%&ndash;LBC Reference Number&ndash;%&gt;
                        <td><display:column title="LBC Reference Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        &lt;%&ndash;Date of Documents Returned (FINAL INBOUND)&ndash;%&gt;
                        <td><display:column title="Date of Documents Returned (FINAL INBOUND) <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        &lt;%&ndash;Received By&ndash;%&gt;
                        <td><display:column title="Received By <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        &lt;%&ndash;Date of Documents forwarded to Accounting&ndash;%&gt;
                        <td><display:column title="Date of Documents forwarded to Accounting (BILLING) <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>--%>
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

    /*$('#scroller table').each(function(){
        var table = $(this),
                fixedCol = table.clone(true),
                fixedWidth = table.find('th').eq(0).width(),
                tablePos = table.position();

        // Remove all but the first column from the cloned table
        fixedCol.find('th').not(':eq(0)').remove();
        fixedCol.find('tbody tr').each(function(){
            $(this).find('td').not(':eq(0)').remove();
        });

        // Set positioning so that cloned table overlays
        // first column of original table
        fixedCol.addClass('fixedCol');
        fixedCol.css({
            left: tablePos.left,
            top: tablePos.top
        });

        // Match column width with that of original table
        fixedCol.find('th,td').css('width',fixedWidth+'px');

        $('#scroller').append(fixedCol);
    });*/

</script>