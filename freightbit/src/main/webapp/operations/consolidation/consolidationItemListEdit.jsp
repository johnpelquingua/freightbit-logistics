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
                    <div style="box-shadow: 3px 3px 3px #888888; position: fixed; background-color: #ECF0F1; border-radius: 5px; padding: 15px; width: 80%; margin-top: 26em; margin-left: -1.2em; z-index: 100;">
                        Total weight (kg) : <b><p id="result" style="display: inline">0</p></b> / <p style="display: inline" id="maxWt"></p> kg<br/>
                        Total volume (cbm) : <b><p id="result-vol" style="display: inline">0</p></b> / <p style="display: inline" id="maxVol"></p> cbm
                        <div style="float: right; margin-top: -1.2em;">
                            <button class="btn btn-success" id="submitBtn">Save</button>
                            <button type="button" class="btn btn-danger" onclick="resetBox()">Reset</button>

                            <s:url var="finalizeContainerUrl" action="finalizeContainer">
                                <s:param name="containerIdParam" value="#attr.container.containerId"></s:param>
                            </s:url>
                            <s:a id="finalBtn" cssClass="btn btn-primary" href="%{finalizeContainerUrl}" title="Container Info" rel="tooltip" >Final</s:a>

                            <%--<button class="btn btn-primary" disabled>Final</button>--%>
                        </div>
                    </div>
                    <display:table id="orderItems" name="orderItemsBeans"
                                   requestURI="viewConsolidationItemList.action"
                                   class="mainTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Container Items</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <display:table id="orderItemsUnderContainer" name="orderItemsBeansUnderContainer" requestURI="viewConsolidationItemList.action"
                                   class="containerItems table table-striped table-hover table-bordered text-center tablesorter table-condensed"
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

                        <td><display:column title="Action">
                            <s:url var="removeItemOnContainerUrl" action="removeItemOnContainer">
                                <s:param name="containerIdParam" value="containerIdParam"></s:param>
                                <s:param name="containerSizeParam" value="containerSizeParam"></s:param>
                                <s:param name="containerStatusParam" value="containerStatusParam"></s:param>
                                <s:param name="orderItemIdParam" value="%{#attr.orderItemsUnderContainer.orderItemId}"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{removeItemOnContainerUrl}" rel="tooltip" title ="Edit Booking" onclick="return confirm('Do you really want to delete?');">
                                <i class="fa fa-times"></i> Remove
                            </s:a>
                        </display:column></td>
                    </display:table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // AUTHORED BY Jan Sarmiento -- START
    $(document).ready(function(){
        var conVol, conWt, maxWt, maxVol,
                checkBox = $('.mainTable tbody td input[type="checkbox"]'),
                child4 = $('.mainTable tbody tr td:nth-child(4)'),
                child5 = $('.mainTable tbody tr td:nth-child(5)'),
                weight = $('#result'),
                volume = $('#result-vol'),
                container = $('#containerType'),
                submitBtn = $('#submitBtn'),
                containedWt = $('.containerItems tbody tr td:nth-child(3)'),
                containedVol = $('.containerItems tbody tr td:nth-child(4)'),
                volContainer,
                wtContainer;

        // this automatically measures the dimension of the table
        // and appends id(for the 4th and 5th td) and value(for the checkbox)
        for(var i = 0; i < $('.mainTable tbody tr').size(); i++){
            child4.eq(i).attr('id', 'val'+(i+1));
            child5.eq(i).attr('id', 'val'+(i+1)+'-vol');
            checkBox.eq(i).attr('class', 'val'+(i+1));
            if(checkBox.eq(i).is(':checked')){
                conWt = parseInt(weight.text())+parseInt(child4.eq(i).text());
                conVol = parseInt(volume.text())+parseInt(child5.eq(i).text());
                weight.empty().append(conWt);
                volume.empty().append(conVol);
            }
        }

        for(var x=0; x < $('.containerItems tbody tr').size(); x++){
            volContainer = parseFloat(containedVol.eq(x).text())+parseFloat($('#result-vol').text());
            wtContainer = parseFloat(containedWt.eq(x).text())+parseFloat($('#result').text());

            $('#result').empty().append(wtContainer);
            $('#result-vol').empty().append(volContainer);
        }

        /*
         10 Footer = 14 cubic meter / 9 Tons
         20 Footer = 28 cubic meter / 18 Tons
         40 Standard Footer = 56 cubic meter / 20 Tons
         40 High-Capacity = 78 cubic meter / 22 Tons
         */

        if(container.val() == '10 FOOTER'){
            maxWt = 9000;
            maxVol = 14;
        }else if(container.val() == '20 FOOTER'){
            maxWt = 18000;
            maxVol = 28;
        }else if(container.val() == '40 STD FOOTER'){
            maxWt = 20000;
            maxVol = 56;
        }else if(container.val() == '40 HC FOOTER'){
            maxWt = 22000;
            maxVol = 78;
        }

        $('#maxVol').empty().append(maxVol);
        $('#maxWt').empty().append(maxWt);

        // This function listens for change of the checkboxes within the tbody of the mainTable class
        checkBox.change(function(){
            var wt, vol;
            if($.isNumeric($('#'+this.className).text()) && $.isNumeric($('#'+this.className+'-vol').text())){
                if(this.checked){
                    wt = parseInt(weight.text())+parseInt($('#'+this.className).text());
                    vol = parseInt(volume.text())+parseInt($('#'+this.className+'-vol').text());
                }else{
                    wt = parseInt(weight.text())-parseInt($('#'+this.className).text());
                    vol = parseInt(volume.text())-parseInt($('#'+this.className+'-vol').text());
                }
            }

            if(wt > maxWt || vol > maxVol){
                submitBtn.prop('disabled',true);
                $('#finalBtn').addClass('disabled');
            }else{
                submitBtn.prop('disabled',false);
                $('#finalBtn').removeClass('disabled');
            }

            if(wt > maxWt){ wt = '<font color="red">'+wt+'</font>'; }
            if(vol > maxVol){ vol = '<font color="red">'+vol+'</font>'; }
            if(wt == 0 || vol == 0){
                submitBtn.prop('disabled',true);
                $('#finalBtn').addClass('disabled');
            }

            weight.empty().append(wt);
            volume.empty().append(vol);
        });
    });

    function resetBox(){
        $('.mainTable tbody td input[type="checkbox"]').removeAttr('checked');
        $('#result').empty().append(0);
        $('#result-vol').empty().append(0);
    }
    // AUTHORED BY Jan Sarmiento -- END
</script>
