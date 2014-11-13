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
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Create EIR Form</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" theme="bootstrap" action="containerAdd">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Type: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <select name="container.eirNumber" id="container.eirNumber" cssClass="form-control" required="true">
                                    <option value="1">EIR 1</option>
                                    <option value="2">EIR 2</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Receipt Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.receiptNumber" cssClass="form-control" id="container.receiptNumber" />
                            </div>
                        </div>

     <%--                       <div class="form-group">
                                <label class="col-lg-4 control-label" style="padding-top:0px;">Date / Time: <span class="asterisk_red"></span></label>
                                <div class="col-lg-8" >
                                    <s:textfield required="true" name="container.dateTime" cssClass="form-control" id="container.dateTime" />
                                </div>
                            </div>--%>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Shipping Line: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.shippinge" cssClass="form-control" id="container.shipping" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Van Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.vanNumber" cssClass="form-control" id="container.vanNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.eirNumber2" cssClass="form-control" id="container.eirNumber2" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Van Location: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.vanLocation" cssClass="form-control" id="container.vanLocation" />
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Trucking: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.trucking" cssClass="form-control" id="container.trucking" />
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.plateNumber" cssClass="form-control" id="container.plateNumber" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Driver: </label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.driver" cssClass="form-control" id="container.driver" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Booking No.: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.bookingNum" cssClass="form-control" id="container.bookingNum" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Seal Number: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.sealNumber" cssClass="form-control" id="container.sealNumber" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Remarks: </label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.remarks" cssClass="form-control" id="container.remarks" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Laden / Empty: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.ladenEmpty" cssClass="form-control" id="container.ladenEmpty" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Van To: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.vanTo" cssClass="form-control" id="container.vanTo" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Van From: <span class="asterisk_red"></span></label>
                            <div class="col-lg-8" >
                                <s:textfield required="true" name="container.vanFrom" cssClass="form-control" id="container.vanFrom" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Forklift Operator: </label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.forkliftOperator" cssClass="form-control" id="container.forkliftOperator" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label" style="padding-top:0px;">Operations Department:</label>
                            <div class="col-lg-8" >
                                <s:textfield name="container.operationsDept" cssClass="form-control" id="container.operationsDept" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <div class="pull-right">
                <a href="http://localhost:8080/freightbit/operations/viewContainerListTest.action" class="btn btn-default" id ="groups-btn">Cancel</a>
                <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" action="save" value="Submit"></s:submit>
                </s:form>
            </div>
        </div>
    </div>
</div>
</div>
