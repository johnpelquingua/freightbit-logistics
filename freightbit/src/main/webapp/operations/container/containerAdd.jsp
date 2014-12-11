<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 11/17/2014
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<link rel="stylesheet" href="../includes/css/DateTimePicker.css">
<script type='text/javascript' src='../includes/js/DateTimePicker.js'></script>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Container List </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> <a href="<s:url action='../operations/viewContainerList' />"> Container Management </a></li>
            <li class="active"> Container List </li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> EIR Form</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" theme="bootstrap" action="containerAdd" id="addForm">
                        <s:hidden name="container.containerId" value="%{container.containerId}" />
                        <s:hidden name="container.createdBy" value="%{container.createdBy}"/>
                        <s:hidden name="container.createdTimestamp" value="%{container.createdTimestamp}"/>
                        <s:hidden name="container.eirType" value="EIR FORM 1"/>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Container Van Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="container.containerNumber" cssClass="containerInput form-control" id="container.containerNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size: <span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                    <s:select cssClass="containerInput form-control"
                                              id="container.containerSize"
                                              name="container.containerSize"
                                              list="containerSizeList"
                                              listKey="key"
                                              listValue="value"
                                              emptyOption="true"
                                              required="true"
                                            />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Shipping Line: <span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:select cssClass="containerInput form-control"
                                          id="container.shipping"
                                          name="container.shipping"
                                          list="vendorShippingList"
                                          listKey="vendorName"
                                          listValue="vendorName"
                                          emptyOption="true"
                                          required="true"
                                        />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Receipt Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="container.receiptNumber" cssClass="containerInput form-control" id="container.receiptNumber" />
                            </div>
                        </div>
                        <%--<div id="dtBox"></div>&lt;%&ndash;This is for the datetimepicker&ndash;%&gt;--%>
                            <div class="form-group">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Date/Time: <span class="asterisk_red"></span></label>
                                <div class="col-lg-9" >
                                    <s:textfield readonly="true" required="true" name="container.gateInTime" cssClass="containerInput form-control" id="gateInTime" />
                                </div>
                                <script type="text/javascript">
                                    $(function () {
                                        var fromDatePickUp = $('#gateInTime');
                                        fromDatePickUp.datetimepicker({
                                            timeFormat: 'h:mm TT',
                                            minDate: 0
                                        });
                                    });
                                </script>
                            </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">EIR Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="container.eirNumber" cssClass="containerInput form-control" id="container.eirNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Van Location: <span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="container.vanLocation" cssClass="containerInput form-control" id="container.vanLocation" />
                            </div>
                        </div>
                    </div>
                </div>
            <%--</div>--%>
            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewContainerList" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary submitBtn" action="save" value="Save" disabled="true"/>
                </div>
            </div>
        </div>
        </s:form>
    </div>
</div>
<script>
    $(document).ready(function(){
        validationForm('containerInput', 'submitBtn');
    })
</script>
<%--
<script>
    function finalAlter(){
        var time = $('#falsegateInTime').val()+':00';
        $('#gateInTime').val(time);
        alert($('#gateInTime').val());
        $('#addForm').submit();
    }
    $(document).ready(function(){ $("#dtBox").DateTimePicker(); }); // FUNCTION FOR THE DATETIME PICKER REFER TO : DateTimePicker.js and DateTimePicker.css for styles
</script>--%>
