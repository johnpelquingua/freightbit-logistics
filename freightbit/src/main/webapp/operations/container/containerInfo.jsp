<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> EIR Form </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Container Management </li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> EIR Forms</h3>
                <span class="pull-right">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                    <button type="button" class="btn btn-primary new-booking"
                    <%--onclick="location.href='viewContainerList'">--%>
                    <input type=button onClick="parent.location='http://localhost:8080/freightbit/operations/viewContainerList.action'">
                    <i class="fa fa-male"></i> Create New EIR Form
                    </button>
                </sec:authorize>
                </span>
            </div>
            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="container" name="containers"
                                   requestURI="viewContainerListTest.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>
                        <td><display:column property="eirNumber" title="EIR Type<i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--Order Number--%>
                        <td><display:column property="receiptNumber" title="Receipt Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="shipping" title="Shipping Line <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="vanNumber" title="Van Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="eirNumber2" title="EIR Number<i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="vanLocation" title="Van Location <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="trucking" title="Trucking <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="plateNumber" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="driver" title="Driver <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="bookingNum" title="Booking No. <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="sealNumber" title="Seal Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="remarks" title="Remarks <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="ladenEmpty" title="Laden / Empty <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="vanTo" title="Van To <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="vanFrom" title="Van From <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="forkliftOperator" title="Forklift Operator <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        
                        <td><display:column property="operationsDept" title="Operations Department <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td>
                            <display:column title="Action">
                                <s:url var="viewContainerInfoUrl" action="viewContainerInfo">
                                    <s:param name="containerIdParam" value="#attr.container.containerId"></s:param>
                                </s:url>
                                <s:a href="%{viewContainerInfoUrl}" title="Container Info" rel="tooltip" ><i class="fa fa-info-circle"></i></s:a>

                                <s:url var="deleteContainerUrl" action="deleteContainer">
                                    <s:param name="containerIdParam" value="#attr.container.containerId"></s:param>
                                </s:url>
                                <s:a href="%{deleteContainerUrl}" title="Delete Container" onclick="return confirm('Do you really want to delete?');" rel="tooltip"><i class="fa fa-trash-o"></i></s:a>
                            </display:column>
                        </td>
                    </display:table>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-right">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='viewContainerList'">
                        <i class="fa fa-male"></i> Create New EIR Form
                    </button>
                </sec:authorize>
                </span>
            </div>
        </div>
    </div>
</div>