<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 11/4/2014
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Container Management </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
            <li class="active"> Container List </li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Container List</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="container" name="containers"
                                   requestURI="viewContainerList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>
                        <td><display:column property="vanNumber" title="Number <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="containerSize" title="Size <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="eirNumber" title="EIR <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--Order Number--%>
                        <td><display:column property="dateTime" title="Date/Time <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column title="Action">
                            <s:a><i class="fa fa-info-circle"></i></s:a>
                            <s:url var="viewConsolidationItemListUrl" action="viewConsolidationItemList">
                                <s:param name="containerIdParam" value="%{#attr.container.containerId}"></s:param>
                                <s:param name="containerSizeParam" value="%{#attr.container.containerSize}"></s:param>
                            </s:url>
                            <s:a href="%{viewConsolidationItemListUrl}"><i class="fa fa-dropbox"></i></s:a>

                            <a href="#" onclick="generateReport(${document.documentId}, 'EIR 2')"><i class="fa fa-print"></i></a> <%--for EIR 1--%>
                            <a href="#" onclick="generateReport(${document.documentId}, 'EIR 1')"><i class="fa fa-print"></i></a> <%--for EIR 2--%>
                            <%--<s:a href="#" onclick="generateReport(%{container.containerId},'${container.documentName}');"><i class="fa fa-print"></i>--%>
                            <%--</s:a>--%>

                        </display:column></td>


                    </display:table>
                </div>
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
</script>