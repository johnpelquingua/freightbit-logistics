<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >

                <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                    <h1><i class="fa fa-truck"></i> Dispatch Plan : Containers</h1>
                </s:if>
                <s:else>
                    <h1><i class="fa fa-truck"></i> Dispatch Plan : Items</h1>
                </s:else>

            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewInlandFreightList' />"> Dispatch Plan : Orders  </a></li>
            <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD'">
                <li class="active"> Dispatch Plan : Containers </li>
            </s:if>
            <s:else>
                <li class="active"> Dispatch Plan : Items</li>
            </s:else>
        </ol>
    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
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
                <h3 class="panel-title">
                    <i class="fa fa-list"></i> Dispatch Plan
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
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Booking
                                    Number</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Freight Type</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.freightType}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service
                                    Req't</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.serviceRequirement}"
                                                 name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service
                                    Mode</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="serviceModeInput form-control" value="%{order.modeOfService}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>

                            </div>

                            <div class="form-group">
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer
                                    Name</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee
                                    Name</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Origin Port</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.originationPort}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Destination Port</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.destinationPort}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.pickupDate}"
                                                 disabled="true"></s:textfield>
                                </div>
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Delivery Date</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.deliveryDate}"
                                                 disabled="true"></s:textfield>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Pickup Address</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.shipperInfoAddress.address}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Destination Address</label>
                                <div class="col-lg-4">
                                    <s:textfield cssClass="form-control" value="%{order.consigneeInfoAddress.address}" name="book-num"
                                                 disabled="true"></s:textfield>
                                </div>
                            </div>
                        </div>
                    </div>

                    <s:hidden value="%{orderNoParam}" />
                    <div class="table-responsive">
                        <div class="row">
                            <s:form name="myform" action="checkItemStatusInland" theme="bootstrap">
                        </div>
                        <s:hidden name="orderItem.editItem" id="edit"></s:hidden>
                        <display:table id="orderItem" name="orderItems"
                                       requestURI="/viewSeaFreightItemList.action"
                                       class="inlandOrderItemsTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                       style="margin-top: 15px;">

                            <%--<td><display:column title="<input type='checkbox' id='mainCheckBox' name='mainCheckBox'/>">
                                <s:checkbox theme="simple" name="check" fieldValue="%{#attr.orderItem.orderItemId}"/>
                            </display:column></td>--%>
                            <td><display:column title="<input type='checkbox' id='mainCheckBox' name='mainCheckBox'/>">
                                <s:checkbox theme="simple" name="check" fieldValue="%{#attr.orderItem.orderItemId}"/>
                            </display:column></td>
                            <%--Change Header based on Service Requirement--%>

                            <td><display:column property="quantity" title="QTY <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"></display:column></td>

                            <td>
                                <s:if test="#attr.order.serviceRequirement=='FULL CONTAINER LOAD'">
                                    <display:column property="nameSize" title="Size <i class='fa fa-sort' />"
                                                    class="tb-font-black"
                                                    style="text-align: center;">
                                    </display:column>
                                </s:if>
                                <s:else>
                                    <display:column property="nameSize" title="Name <i class='fa fa-sort' />"
                                                    class="tb-font-black"
                                                    style="text-align: center;">
                                    </display:column>
                                </s:else>
                            </td>

                            <td><display:column property="vendorOriginName" title="Origin Vendor <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="finalPickupDate" title="Pick-up Date <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="vendorDestinationName" title="Destination Vendor <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="finalDeliveryDate" title="Delivery Date <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="status" title="Status <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column title="Action">

                                <s:if test="#attr.orderItem.status=='ON GOING' || #attr.orderItem.status=='PLANNING 1'">
                                    <i style="color: red;" class="fa fa-ban"></i>                                </s:if>
                                <s:else>
                                    <s:url var="viewFreightPlanningUrl" action="viewFreightPlanningInland">
                                        <s:param name="orderItemIdParam"
                                                 value="#attr.orderItem.orderItemId">
                                        </s:param>
                                        <s:param name="nameSizeParam"
                                                 value="#attr.orderItem.nameSizeParam">
                                        </s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{viewFreightPlanningUrl}" rel="tooltip"
                                         title="Set Vendor" >
                                        <i class="fa fa-tasks"></i>
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
                                </s:else>

                            </display:column></td>

                        </display:table>
                            <div class="pull-right">
                                <s:submit cssClass="btn btn-primary" value="Set Vendor"
                                          onclick="deleteText()"></s:submit>
                                <s:submit cssClass="btn btn-success" value="Edit Vendor"
                                          onclick="addText()"></s:submit>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>

            <div class="panel-footer">

                <div class="table-responsive">
                    <div class="col-lg-12">

                        <table class="col-lg-12" >
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class='fa fa-anchor'></i> PLANNING 1 = Set Shipping Vessel</td>
                                <td><i class='fa fa-truck'></i> PLANNING 2 = Set Trucking Origin</td>
                                <td><i class='fa fa-truck'></i> PLANNING 3 = Set Trucking Destination</td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <div class="pull-right">

            <%--<s:url var="createdDocumentOriginUrl" action="createdDocumentOrigin">
                <s:param name="orderIdParam"
                         value="#attr.order.orderId"></s:param>
            </s:url>
            <s:a cssClass="btn btn-primary houseWaybillOriginBtn" href="%{createdDocumentOriginUrl}" rel="tooltip"
                 title="Create Documents">
                Create House WayBill Origin
            </s:a>

            <s:if test="#attr.order.freightType!='TRUCKING'">
                <s:url var="createdDocumentDestinationUrl" action="createdDocumentDestination">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                </s:url>
                <s:a cssClass="btn btn-primary houseWaybillDestinationBtn" href="%{createdDocumentDestinationUrl}" rel="tooltip"
                     title="Create Documents">
                    Create House Waybill Destination
                </s:a>
            </s:if>--%>

            <s:url var="createdInlandDocumentUrl" action="createdInlandDocument">
                <s:param name="orderIdParam"
                         value="#attr.order.orderId"></s:param>
            </s:url>
            <s:a cssClass="btn btn-primary houseWaybillOriginBtn" href="%{createdInlandDocumentUrl}" rel="tooltip"
                 title="Create Inland Document(s)">
                Create Inland Document(s)
            </s:a>

            <s:url var="viewDocumentListUrl" action="viewDocumentListInland">
                <s:param name="orderIdParam"
                         value="%{orderIdParam}">
                </s:param>
            </s:url>
            <s:a cssClass="btn btn-warning" href="%{viewDocumentListUrl}" rel="tooltip"
                 title="Go to Documents Page">
                Proceed to Documents page <i class="fa fa-chevron-right"></i>
            </s:a>

        </div>
    </div>
</div>

<script>

    $(document).ready(function() {
        buttonControl();
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

        $('#mainCheckBox').click(function(){
            if($('#orderItem [type="checkbox"]:checked').length == $('#orderItem [type="checkbox"]').size()){
                $('#orderItem [type="checkbox"]').prop('checked', false);
            }else{
                $('#orderItem [type="checkbox"]').prop('checked', true);
            }
        })

        var check = document.getElementById("check");
        for (i = 0; i < check.length; i++)
            check[i].checked = true ;
    });

    function addText() {
        document.getElementById("edit").value = "edit";
    }

    function deleteText() {
        document.getElementById("edit").value = "";
    }

</script>