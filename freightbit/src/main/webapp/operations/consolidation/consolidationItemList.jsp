<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 11/4/2014
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Consolidation </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
            <li class="active"> Available Item List </li>
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
                <h3 class="panel-title"><i class="fa fa-list"></i> Available Item List</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive">

                    <s:form action="updateStatusOfContainers" theme="bootstrap">

                        <div style="box-shadow: 3px 3px 3px #888888; position: fixed; background-color: #ECF0F1; border-radius: 5px; padding: 15px; width: 80%; margin-top: 25.5em; margin-left: -1.4em;  z-index: 100;">
                            Total weight (kg) : <b><p id="result" style="display: inline">0</p></b> / <p style="display: inline" id="maxWt"></p> kg<br/>
                            Total volume (cbm) : <b><p id="result-vol" style="display: inline">0</p></b> / <p style="display: inline" id="maxVol"></p> cbm
                            <div style="float: right; margin-top: -1.2em;">
                                <button class="btn btn-success" id="submitBtn" disabled>Save</button>
                                <button type="button" class="btn btn-danger" onclick="resetBox()">Reset</button>

                                <s:url var="finalizeContainerUrl" action="finalizeContainer">
                                    <s:param name="containerIdParam" value="#attr.container.containerId"></s:param>
                                </s:url>
                                <s:a id="finalBtn" cssClass="btn btn-primary disabled" href="%{finalizeContainerUrl}" title="Container Info" rel="tooltip" >Final</s:a>

                                <%--<button class="btn btn-primary" id="finalBtn" disabled>Final</button>--%>
                            </div>
                        </div>

                    <display:table id="orderItems" name="orderItemsBeans"
                                   requestURI="viewConsolidationItemList.action"
                                   class="mainTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;"> <%--Booking Date--%>
                        <td>
                            <display:column>
                                <s:checkbox theme="simple" name="check" id="check"
                                            fieldValue="%{#attr.orderItems.orderItemId}"/>
                            </display:column>
                        </td>
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
                    <%--<s:hidden id="containerType" value="%{containerSizeParam}"></s:hidden>--%>
                        <input type="hidden" id="containerType" value="<c:out value='${sessionScope.containerSizeParam}'/>" />
                </div>
            </div>
        </div>
        </s:form>
    </div>
</div>

<script>
    // AUTHORED BY Jan Sarmiento -- START
    $(document).ready(function(){
        initValidationScript('NONE');
    });
    // AUTHORED BY Jan Sarmiento -- END
</script>
