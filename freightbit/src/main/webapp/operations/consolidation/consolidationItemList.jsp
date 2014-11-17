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
                    <display:table id="orderItems" name="orderItemsBeans"
                                   requestURI="viewConsolidationItemList.action"
                                   class="mainTable table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>
                        <td>
                            <display:column>
                                <s:checkbox theme="simple" name="check"
                                            fieldValue="%{#attr.orderItem.orderItemId}"/>
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
                </div>
            </div>
        </div>

        <div style="position: fixed; background-color: #ECF0F1; border-radius: 5px; padding: 15px; width: 40em; margin-top: 15em;">
            Total weight (kg) : <b><p id="result" style="display: inline">0</p></b><br/>
            Total volume (cbm) : <b><p id="result" style="display: inline">0</p></b>
            <div style="float: right;">
                <button class="btn btn-success">Save</button>
                <button class="btn btn-danger">Reset</button>
            </div>
        </div>
    </div>
</div>

<script>
    // AUTHORED BY Jan Sarmiento -- START
    $(document).ready(function(){
        // alert($('.mainTable tbody tr').size());
        var control, row = ($('tbody td').length/$('tbody tr').length), checkBox = $('.mainTable tbody td input[type="checkbox"]');
        for(var i = 0; i < $('.mainTable tbody tr').size(); i++){
            $('.mainTable tbody tr td:nth-child(4)').eq(i).attr('id', 'val'+(i+1)).append(Math.floor((Math.random() * 15) + 1));
            checkBox.eq(i).attr('value', 'val'+(i+1));
            if(checkBox.eq(i).is(':checked'))
            {
                control = parseInt($('#result').text())+parseInt($('.mainTable tbody tr td:nth-child(4)').eq(i).text());
                $('#result').empty().append(control);
            }
        }
    })

    $('.mainTable tbody input[type="checkbox"]').change(function(){
        var test;
        if($.isNumeric($('#'+this.value).text())){
            if(this.checked)
                test = parseInt($('#result').text())+parseInt($('#'+this.value).text());
            else
                test = parseInt($('#result').text())-parseInt($('#'+this.value).text());

            if(test > 30){
                test = '<font style="color: #C0392B;">'+test+'</font>';
                $('#submitBtn').prop('disabled', true);
            }
            else
                $('#submitBtn').prop('disabled', false);
        }
        else
            test = '<font style="color: red;">Content is a non numeric value</font>';

        $('#result').empty().append(test);
    });
    // AUTHORED BY Jan Sarmiento -- END
</script>
