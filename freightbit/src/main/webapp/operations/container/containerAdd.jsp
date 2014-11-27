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
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Create EIR Form</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" theme="bootstrap" action="containerAdd" id="addForm">
                        <s:hidden name="container.containerId" value="%{container.containerId}" />
                        <s:hidden name="container.createdBy" value="%{container.createdBy}"/>
                        <s:hidden name="container.createdTimestamp" value="%{container.createdTimestamp}"/>
                        <s:hidden name="container.eirType" value="EIR FORM 1"/>
                    <div class="col-lg-6">
                        <%--<div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Type: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:select cssClass="form-control"
                                          id="container.eirType"
                                          name="container.eirType"
                                          list="containerEirTypeList"
                                          listKey="key"
                                          listValue="value"
                                          emptyOption="true"
                                          required="true"
                                        />
                            </div>
                        </div>--%>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Container Van Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.containerNumber" cssClass="form-control" id="container.containerNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Container Size: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                    <s:select cssClass="form-control"
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
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Shipping Line: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:select cssClass="form-control"
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
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Port Code: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:select cssClass="form-control"
                                          id="container.portCode"
                                          name="container.portCode"
                                          list="containerPortCode"
                                          listKey="key"
                                          listValue="value"
                                          emptyOption="true"
                                          required="true"
                                        />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Receipt Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.receiptNumber" cssClass="form-control" id="container.receiptNumber" />
                            </div>
                        </div>
                        <div id="dtBox"></div><%--This is for the datetimepicker--%>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Date: <span class="asterisk_red"></span></label>
                                <div class="col-lg-8" >
                                    <s:textfield required="true" name="container.dateTime" cssClass="form-control" id="dateTime" />
                                </div>
                                <script type="text/javascript">
                                    $(function () {
                                        var fromDatePickUp = $('#dateTime');
                                        fromDatePickUp.datepicker({
                                            timeFormat: 'h:mm TT',
                                            minDate: 0
                                        });
                                    });
                                </script>
                            </div>

                        <div class="form-group">


                            <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.eirNumber" cssClass="form-control" id="container.eirNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Van Location: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.vanLocation" cssClass="form-control" id="container.vanLocation" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Remarks: </label>
                            <div class="col-lg-8" >
                                <s:textarea name="container.remarks" cssClass="form-control" cssStyle="resize: none; margin-bottom: 15px !important; height: 100px;" id="container.remarks" />
                            </div>
                        </div>


                    </div>
                        <div class="col-lg-6">

                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Trucking: <span class="asterisk_red"></span></label>
                                <div class="col-lg-8" >
                                    <s:select cssClass="form-control"
                                              id="container.trucking"
                                              name="container.trucking"
                                              list="vendorTruckingList"
                                              listKey="vendorName"
                                              listValue="vendorName"
                                              emptyOption="true"
                                              required="true"
                                            />
                                </div>
                            </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.plateNumber" cssClass="form-control" id="container.plateNumber" />

                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Driver: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.driver" cssClass="form-control" id="container.driver" />
                            </div>
                        </div>

                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Forklift Operator: </label>
                                <div class="col-lg-8" >
                                    <s:textfield name="container.forkliftOperator" cssClass="form-control" id="container.forkliftOperator" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Operations Department: </label>
                                <div class="col-lg-8" >
                                    <s:textfield name="container.operationsDept" cssClass="form-control" id="container.operationsDept" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Laden / Empty: </label>
                                <div class="col-lg-8" >
                                    <s:textfield name="container.ladenEmpty" cssClass="form-control" id="container.ladenEmpty" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Van To: </label>
                                <div class="col-lg-8" >
                                    <s:textfield name="container.vanTo" cssClass="form-control" id="container.vanTo" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Van From: </label>
                                <div class="col-lg-8" >
                                    <s:textfield name="container.vanFrom" cssClass="form-control" id="container.vanFrom" />
                                </div>
                            </div>

                    </div>
                </div>
            </div>\
            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewContainerList" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" action="save" value="Save"/>
<%--
                    <button type="button" class="btn btn-primary" onclick="finalAlter()">Save</button>
--%>
                </div>
            </div>
        </div>
        </s:form>
    </div>
</div>
<%--
<script>
    function finalAlter(){
        var time = $('#falsedateTime').val()+':00';
        $('#dateTime').val(time);
        alert($('#dateTime').val());
        $('#addForm').submit();
    }
    $(document).ready(function(){ $("#dtBox").DateTimePicker(); }); // FUNCTION FOR THE DATETIME PICKER REFER TO : DateTimePicker.js and DateTimePicker.css for styles
</script>--%>
