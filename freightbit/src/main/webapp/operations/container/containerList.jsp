<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .deleteContainerIcon {
        cursor: pointer;
    }
</style>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Container Management </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Yard Management</li>
            <li class="active"> Container Management </li>
        </ol>
    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success" id="alert">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;">
                    <i class="fa fa-list"></i> Container Lists
                </h3>
                <span class="pull-right">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_FREIGHT_SPECIALIST', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="postAjaxHtml('loadSearchContainerPage', 'inputDiv');">
                        <i class="fa fa-search"></i> Search Container
                    </button>
                    <s:url var="loadAddFormPageUrl" action="loadAddFormPage">
                    </s:url>
                    <s:a class="icon-action-link" href="%{loadAddFormPageUrl}" rel="tooltip" title="New Container">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-truck"> </i> New Container
                        </button>
                    </s:a>
                </sec:authorize>
                </span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="container" name="containers" requestURI="viewContainerList.action"
                                           pagesize="10"
                                           class="containerTable table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <s:hidden name="container.eirType" value="%{container.eirType}"/>
                                <s:hidden name="container.containerId" value="%{container.containerId}"/>
                                <td><display:column property="containerNumber" title="Number <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="containerSize" title="Size <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="shipping" title="Shipping Line <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="portCode" title="Port Code <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="strGateInTime" title="Gate In <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="strGateOutTime" title="Gate Out <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="containerStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <%--<td><display:column property="documentId" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="documentCheck" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>--%>

                                <td>
                                    <display:column title="Action">
                                        <%--<s:if test="#attr.container.containerStatus == 'OPEN' || #attr.container.containerStatus == 'CONSOLIDATED' || #attr.container.containerStatus == 'FINAL'">--%>
                                        <s:url var="editContainerUrl" action="loadEditFormPage">
                                            <s:param name="containerIdParam"
                                                     value="#attr.container.containerId"></s:param>
                                        </s:url>
                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_FREIGHT_SPECIALIST', 'ROLE_SEA_FREIGHT', 'ROLE_INLAND_FREIGHT')">
                                            <s:a href="%{editContainerUrl}" class="icon-action-link" rel="tooltip"
                                                 title="Edit this Container">
                                                <i class="fa fa-pencil"></i>
                                            </s:a>
                                        </sec:authorize>
                                        <%--</s:if>--%>
                                        <s:url var="deleteContainerUrl" action="deleteContainer">
                                            <s:param name="containerIdParam" value="#attr.container.containerId"></s:param>
                                        </s:url>
                                        <s:a href="%{deleteContainerUrl}" title="Delete Container" onclick="return confirm('Do you really want to delete?');" rel="tooltip"></s:a>
                                        <i class="fa fa-trash-o deleteContainerIcon"></i>

                                        <s:url var="viewContainerInfoUrl" action="viewContainerInfo">
                                            <s:param name="containerIdParam" value="#attr.container.containerId"></s:param>
                                        </s:url>
                                        <s:a href="%{viewContainerInfoUrl}" title="Container Info" rel="tooltip" ><i class="fa fa-info-circle"></i></s:a>

                                        <s:if test="#attr.container.containerStatus == 'OPEN'">
                                            <a id="print-icon" href="#" onclick="generateReport(${container.documentId},'${container.eirType}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </s:if>
                                        <s:elseif test="#attr.container.containerStatus == 'CONSOLIDATED'">
                                            <a id="print-icon" href="#" onclick="generateReport(${container.documentId},'${container.eirType}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </s:elseif>
                                        <s:elseif test="#attr.container.containerStatus == 'FINAL'">
                                            <a id="print-icon" href="#" onclick="generateReport(${container.documentId},'${container.eirType}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <a id="edit-icon" href="#" data-toggle="modal" data-target="#inputModal" onclick="showGateOutFields(${container.containerId});">
                                                <i class="fa fa-sign-out"></i>
                                                <s:param name="containerIdParam"
                                                         value="#attr.container.containerId">
                                                </s:param>
                                            </a>
                                        </s:elseif>
                                        <s:elseif test="#attr.container.containerStatus == 'GATE OUT'">
                                            <a id="print-icon" href="#" onclick="generateReport(${container.documentId},'${container.eirType}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                        </s:elseif>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>

                </div>
            </div>
            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <label>LEGEND:</label>
                        </div>
                        <div class="col-lg-3">
                            <i class='fa fa-edit' ></i> Edit<br>
                            <i class="fa fa-sign-out"></i> Gate Out
                        </div>
                        <div class="col-lg-3">
                            <i class='fa fa-trash-o' ></i> Delete
                        </div>
                        <div class="col-lg-3">
                            <i class='fa fa-info-circle' ></i> Information
                        </div>
                        <div class="col-lg-3">
                            <i class='fa fa-print' ></i> Print EIR forms
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="deleteContainerModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Delete Container</span>
            </div>
            <div class="modal-body">
                This container might have items associated to it. Please confirm cancellation. Are you sure you want to delete the container?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmContainerDeleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<script>
    function generateReport(documentId,documentName) {
        alert(1);
        /*var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
        win.onload = function () {
            this.document.title = "Booking Request Form";
        }*/

        if(documentName == 'EIR FORM 1'){
            var win = window.open('documentations/generateEIR1RequestReport?documentIdParam=' + documentId, 'eir1', 'width=910,height=800');
            win.onload = function () {
                this.document.title = "Equipment Interchange Receipt 1";
            }
        }else{
            var win = window.open('documentations/generateEIR2RequestReport?documentIdParam=' + documentId, 'eir2', 'width=910,height=800');
            win.onload = function () {
                this.document.title = "Equipment Interchange Receipt 2";
            }
        }
    }

    $(document).ready(function(){
        /*initTimestampAbbrev('containerTable', 4);
        initTimestampAbbrev('containerTable', 5);*/
        actionConfirmation($('.deleteContainerIcon'), $('.confirmContainerDeleteModalBtn'), $('#deleteContainerModal'));
    });
</script>