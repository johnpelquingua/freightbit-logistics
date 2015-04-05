<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Consolidation </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
            <li class="active"> Yard Management</li>
            <li class="active"> Consolidation Container List </li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Consolidation Container List</h3>
                <span class="pull-right">
                    <%--<s:url var="loadQRFormPageUrl" action="loadQRFormPage">
                    </s:url>
                    <s:a class="icon-action-link" href="%{loadQRFormPageUrl}" rel="tooltip" title="Create QR Code">
                        <button type="button" class="btn btn-primary">
                            <i class="fa fa-qrcode"> </i> Create QR Code
                        </button>
                    </s:a>--%>
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="showSearchFields();">
                        <i class="fa fa-search"></i> Search Container
                    </button>
                </span>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="container" name="containers"
                                   requestURI="viewConsolidationContainerList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="empty-cells: hide;margin-top: 15px;">
                        <s:hidden name="container.eirNumber" value="%{container.eirNumber}"/>
                        <tr><td><display:column property="containerNumber" title="Container Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td></tr>
                        <tr><td><display:column property="containerSize" title="Container Size <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td></tr>
                        <tr><td><display:column property="portCode" title="Port Code <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td></tr>
                        <tr><td><display:column property="containerStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td></tr>

                        <tr></tr><td><display:column title="Action">
                            <s:if test="#attr.container.containerStatus == 'OPEN' || #attr.container.containerStatus == 'CONSOLIDATED' || #attr.container.containerStatus == 'FINAL'">
                            <s:url var="viewConsolidationItemListUrl" action="viewConsolidationItemList">
                                <s:param name="containerIdParam" value="%{#attr.container.containerId}"></s:param>
                                <s:param name="containerSizeParam" value="%{#attr.container.containerSize}"></s:param>
                                <s:param name="containerStatusParam" value="%{#attr.container.containerStatus}"></s:param>
                                <s:param name="containerPortCodeParam" value="%{#attr.container.portCode}"></s:param>
                            </s:url>
                            <s:a href="%{viewConsolidationItemListUrl}" title="Consolidate Items" rel="tooltip"><i class="fa fa-cubes"></i></s:a>
                            </s:if>
                            <s:url var="viewConsolidationContainerInfoUrl" action="viewConsolidationContainerInfo">
                                <s:param name="containerIdParam" value="#attr.container.containerId"></s:param>
                            </s:url>
                            <s:if test="#attr.container.containerStatus == 'OPEN' || #attr.container.containerStatus == 'CONSOLIDATED' || #attr.container.containerStatus == 'FINAL'">
                            <s:a href="%{viewConsolidationContainerInfoUrl}" title="Container Info" rel="tooltip" ><i class="fa fa-info-circle"></i></s:a>
                            </s:if>
                            <%--<a href="#" onclick="generateReport(${document.documentId}, 'EIR 2')"><i class="fa fa-print"></i></a> &lt;%&ndash;for EIR 1&ndash;%&gt;
                            <a href="#" onclick="generateReport(${document.documentId}, 'EIR 1')"><i class="fa fa-print"></i></a> &lt;%&ndash;for EIR 2&ndash;%&gt;--%>
                        </display:column></td></tr>
                    </display:table>
                </div>
            </div>
            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <table class="col-lg-12">
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class='fa fa-info-circle' ></i> Information</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><i class='fa fa-cubes' ></i> Consolidate</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<script>
    function generateReport(id, name){
        var win;
        if(name == 'EIR 1'){
            win = window.open('documentations/generateEIR1?documentIdParam=' + id, 'EIR 1', 'width2=910,height=800');
        }else if(name == 'EIR 2'){
            win = window.open('documentations/generateEIR2?documentIdParam=' + id, 'EIR 2', 'width2=910,height=800');
        }
        win.onload = function(){
            this.document.title = name;
        }
    }

    function showSearchFields() {
        $.ajax({
            url: 'loadConsolidationContainerSearch',
            type: 'POST',
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
                /*window.location.href = '#sixth';*/
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });

    }

    var rows = document.getElementsByTagName('tr');
    for (var i=0;i<rows.length;i++) {
        var t = rows[i].innerText || rows[i].textContent;
        if (t.trim().length==0) rows[i].style.display='none';
    }

</script>
