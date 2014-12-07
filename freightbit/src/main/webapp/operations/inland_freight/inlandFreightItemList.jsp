<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >

                <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
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
            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
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
                                    <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num"
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
                            <s:form name="myform" action="checkItemStatus" theme="bootstrap">
                        </div>
                        <s:hidden name="orderItem.editItem" id="edit"></s:hidden>
                        <display:table id="orderItem" name="orderItems"
                                       requestURI="/viewSeaFreightItemList.action"
                                       class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                       style="margin-top: 15px;">

                            <td><display:column title="<input type='checkbox' id='mainCheckBox' name='mainCheckBox'/>">
                                <s:checkbox theme="simple" name="check" fieldValue="%{#attr.orderItem.orderItemId}"/>
                            </display:column></td>

                            <td><display:column property="nameSize" title="Name <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="vendorSea" title="Shipping <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="vesselScheduleId" title="Voyage # <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="vesselName" title="Vessel Name <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="vendorOrigin" title="ORI <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="vendorDestination" title="DES <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="status" title="Status <i class='fa fa-sort' />"
                                                class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column title="Action">
                                <s:if test="#attr.orderItem.status=='ON GOING'">
                                    <s:url var="viewInfoUrl" action="viewSeaFreightInfo">
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
                                </s:if>
                                <s:else>
                                    <s:url var="viewFreightPlanningUrl" action="viewFreightPlanning">
                                        <s:param name="orderItemIdParam"
                                                 value="#attr.orderItem.orderItemId">
                                        </s:param>
                                        <s:param name="nameSizeParam"
                                                 value="#attr.orderItem.nameSizeParam">
                                        </s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{viewFreightPlanningUrl}" rel="tooltip"
                                         title="Update Status" >
                                        <i class="fa fa-edit"></i>
                                    </s:a>

                                    <s:url var="viewInfoUrl" action="viewSeaFreightInfo">
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
                        <div class="row">
                            <div class="col-md-6 pull-right" style="margin-right: -17em;">
                                <s:submit cssClass="col-lg-3 btn btn-default" value="Set Vendor"
                                          onclick="deleteText()"></s:submit>
                                <s:submit cssClass="col-lg-3 btn btn-default" value="Edit Vendor"
                                          onclick="addText()"></s:submit>
                            </div>
                        </div>
                        </s:form>
                    </div>
                </div>
            </div>

            <div class="panel-footer">

                <div class="table-responsive">
                    <div class="col-lg-12">
                        <%--<span class="pull-left">--%>
                        <table class="col-lg-12" >
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class='fa fa-anchor'></i> PLANNING 1 = Set Shipping Vessel</td>
                                <td><i class='fa fa-truck'></i> PLANNING 2 = Set Trucking Origin</td>
                                <td><i class='fa fa-truck'></i> PLANNING 3 = Set Trucking Destination</td>
                            </tr>
                        </table>
                    </div>
                    <%--</span>--%>
                </div>
            </div>
        </div>
        <div class="pull-right">
            <s:url var="createdDocumentOriginUrl" action="createdDocumentOrigin">
                <s:param name="orderIdParam"
                         value="#attr.order.orderId"></s:param>

            </s:url>
            <s:a cssClass="btn btn-primary" href="%{createdDocumentOriginUrl}" rel="tooltip"
                 title="Create Documents">
                Create House WayBill Origin
            </s:a>

            <s:url var="createdDocumentDestinationUrl" action="createdDocumentDestination">
                <s:param name="orderIdParam"
                         value="#attr.order.orderId"></s:param>

            </s:url>
            <s:a cssClass="btn btn-primary" href="%{createdDocumentDestinationUrl}" rel="tooltip"
                 title="Create Documents">
                Create House Waybill Destination
            </s:a>



            <s:url var="viewDocumentListUrl" action="viewDocumentList">
                <s:param name="orderIdParam"
                         value="%{orderIdParam}">
                </s:param>

            </s:url>
            <s:a cssClass="btn btn-default" href="%{viewDocumentListUrl}" rel="tooltip"
                 title="Go to Documents Page">
                Go to Documents page
            </s:a>
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

        $('#mainCheckBox').click(function(){
            if($('#orderItem [type="checkbox"]:checked').length == $('#orderItem [type="checkbox"]').size()){
                $('#orderItem [type="checkbox"]').prop('checked', false);
            }else{
                $('#orderItem [type="checkbox"]').prop('checked', true);
            }
        })
        
    });

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

    function addText() {
        document.getElementById("edit").value = "edit";
    }

    function deleteText() {
        document.getElementById("edit").value = "";
    }

</script>