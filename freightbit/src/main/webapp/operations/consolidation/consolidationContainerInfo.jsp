<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Container Information</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='viewContainerList' />"> Container List </a>
            </li>
            <li class="active"> EIR Form Information</li>
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> EIR Form</h3>
                <span class="pull-right">
                    <s:url var="editContainerUrl" action="loadEditFormPage">
                        <s:param name="containerIdParam"
                                 value="#attr.container.containerId"></s:param>
                    </s:url>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                        <%--<s:a class="icon-action-link" href="%{loadEditFormPageUrl}" rel="tooltip" title="Edit Form">
                            <button type="button" class="btn btn-primary">
                                <i class="fa fa-home"> </i> Edit EIR Form
                            </button>--%>
                        <s:a href="%{editContainerUrl}" cssClass="btn btn-success new-booking" rel="tooltip"
                             title="Edit this EIR Form">
                            <i class="fa fa-pencil"></i> Edit EIR Form
                        </s:a>
                    </sec:authorize>
                    <s:url var="loadPrintFormPageUrl" action="loadPrintFormPage">
                    </s:url>
                    <s:a class="icon-action-link" href="%{loadPrintFormPageUrl}" rel="tooltip" title="Print Form">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-home"> </i> Print EIR Form
                        </button>
                    </s:a>

                </span>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-lg-6 col-lg-offset-2">

                        <div class="panel panel-info ">

                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <div align="center" style="margin-top: 10px;">
                                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-9">

                                        <table class="table table-user-information profile" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; border-top: none; text-align: left !important;">EIR Type</td>
                                                <td style="border-top: none;"><s:property value="container.eirType"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Container Number</td>
                                                <td style="text-transform:uppercase"><s:property value="container.containerNumber" /></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">ContainerSize</td>
                                                <td><s:property value="container.containerSize"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Container Status</td>
                                                <td><s:property value="container.containerStatus"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Shipping Line</td>
                                                <td><s:property value="container.shipping"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Port Code</td>
                                                <td><s:property value="container.portCode"/></td>
                                            </tr>
                                            </tbody>
                                            <s:set name="containerId" value="%{container.containerId}" scope="session"/>
                                        </table>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Container Items</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <display:table id="orderItemsUnderContainer" name="orderItemsBeansUnderContainer" requestURI="viewConsolidationItemList.action"
                                   class="mainTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <td><display:column property="nameSize" title="Item Name <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="orderNum" title="Order Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="weight" title="Weight (kg) <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="volume" title="Volume (cbm) <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="port" title="Port <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                    </display:table>
                </div>
            </div>
        </div>
    </div>
</div>