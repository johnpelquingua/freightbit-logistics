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

        <%--<div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="images/listofusers.png" class="box-icon">
                <span class="booking panel-title">Pending Documents List</span>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black"><input type="checkbox" /></th>
                            <th class="tb-font-black">Booking Code</th>
                            <th class="tb-font-black">Company Code</th>
                            <th class="tb-font-black">Status</th>
                            <th class="tb-font-black">Service Type</th>
                            <th class="tb-font-black">Service Mode</th>
                            <th class="tb-font-black">Date of Pick up</th>
                            <th class="tb-font-black">Date of Delivery</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0001</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">D/D</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0002</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">D/P</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view2.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0003</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">P/D</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view3.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0004</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">P/P</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view4.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>--%>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>
                    Pending Documents List
                </h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="viewPendingDocuments.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;empty-cells: hide;">

                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="serviceRequirement" title="Service Requirement <i class='fa fa-sort' />"
                                            class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="modeOfService" title="Service Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
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
            </div>
        </div>

    </div>
</div>
