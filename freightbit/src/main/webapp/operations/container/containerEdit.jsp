<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 11/17/2014
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> EIR Form </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> <a href="<s:url action='../containerInfo' />"> Container Management </a></li>
            <li class="active"> Container Lists </li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit EIR Form</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" theme="bootstrap" action="editContainer">

                    <s:hidden name="container.containerId" value="%{container.containerId}"></s:hidden>
                    <s:hidden name="container.eirType" value="%{container.eirType}"></s:hidden>
                    <s:hidden name="container.containerStatus" value="%{container.containerStatus}"></s:hidden>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Type: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.eirType" cssClass="form-control" id="container.eirType" disabled="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Container Number: <span class="asterisk_red"></span></label>
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
                                              list="containerList"
                                              listKey="key"
                                              listValue="value"
                                              emptyOption="true"
                                              required="true"
                                            />
                            </div>
                        </div>

                        <%--<div class="form-group">--%>
                            <%--<label class="col-lg-4 control-label" style="padding-top:0px;">Container Status: <span class="asterisk_red"></span></label>--%>
                            <%--<div class="col-lg-8" >--%>
                                <%--<select name="container.containerStatus" id="container.containerStatus" class="form-control" required="true">--%>
                                    <%--<option value="Direct Load">Direct Load</option>--%>
                                    <%--<option value="Consolidated">Consolidated</option>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Shipping Line: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.shipping" cssClass="form-control" id="container.shipping" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Port Code: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.portCode" cssClass="form-control" id="container.portCode" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Receipt Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.receiptNumber" cssClass="form-control" id="container.receiptNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Date: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.dateTime" cssClass="form-control" id="dateTime" />
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.eirNumber" cssClass="form-control" id="container.eirNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Van Location: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.vanLocation" cssClass="form-control" id="container.vanLocation" />
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Trucking: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.trucking" cssClass="form-control" id="container.trucking" />
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.plateNumber" cssClass="form-control" id="container.plateNumber" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Driver: </label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.driver" cssClass="form-control" id="container.driver" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewContainerList" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" action="save" value="Save"/>
                </div>
            </div>
        </div>


        </s:form>
    </div>
</div>

<script type="text/javascript">
    $('#dateTime').datetimepicker({
        timeFormat: 'h:mm TT'
    });
</script>
