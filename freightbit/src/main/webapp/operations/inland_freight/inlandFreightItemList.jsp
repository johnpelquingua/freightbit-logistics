<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
//
<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >

                <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                    <h1><i class="fa fa-truck"></i> Inland Freight Planning : Containers</h1>
                </s:if>
                <s:else>
                    <h1><i class="fa fa-truck"></i> Inland Freight Planning : Items</h1>
                </s:else>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewInlandFreightList' />"> Inland Freight Planning : Orders  </a></li>
            <%--<li class="active"> Inland Freight Planning : Containers / Items</li>--%>
            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                <li class="active"> Inland Freight Planning : Containers </li>
            </s:if>
            <s:else>
                <li class="active"> Inland Freight Planning : Items</li>
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
                <h3 class="panel-title">
                    <i class="fa fa-list"></i> Inland Freight Operations
                </h3>
            </div>

            <div class="panel-body">

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
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                                <div class="col-lg-10">
                                    <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Type</label>
                                <div class="col-lg-10">
                                    <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
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

                    <s:hidden value="%{orderNoParam}" />
                    <div class="table-responsive">
                        <display:table id="orderItem" name="orderItems"
                                       requestURI="/viewSeaFreightItemList.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                       style="margin-top: 15px;">

                            <td><display:column property="nameSize" title="Name <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="status" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column title="Action">

                                <s:url var="viewFreightPlanningUrl" action="viewFreightPlanning">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderItem.orderItemId">
                                            </s:param>
                                    <s:param name="orderNoParam"
                                             value="orderNoParam">
                                             </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewFreightPlanningUrl}" rel="tooltip"
                                     title="Update Status">
                                    <i class="fa fa-edit"></i>
                                </s:a>

                                <s:url var="viewInfoUrl" action="viewInlandFreightInfo">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderItem.orderItemId">
                                    </s:param>
                                    <s:param name="orderNoParam"
                                             value="orderNoParam">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewInfoUrl}" rel="tooltip"
                                     title="Show Information">
                                    <i class="fa fa-info-circle"></i>
                                </s:a>
                            </display:column></td>
                        </display:table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("orderItem");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {

                if (tbl.rows[i].cells[1].innerHTML == "PLANNING 1") {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#fcf8e3";
                    }
                }

                if (tbl.rows[i].cells[1].innerHTML == "PLANNING 2") {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#f2dede";
                    }
                }

                if (tbl.rows[i].cells[1].innerHTML == "PLANNING 3") {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#dff0d8";
                    }
                }
            }
        }

    });

</script>