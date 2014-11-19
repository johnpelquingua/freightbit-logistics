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
      <li class="active"> <a href="<s:url action='../viewContainerList' />"> Container Management </a></li>
      <li class="active"> Container Lists </li>
    </ol>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Checkout Form </h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive list-table">
          <s:form cssClass="form-horizontal" theme="bootstrap" action="editContainer">
          <div class="col-lg-6">
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Type: <span class="asterisk_red"></span></label>
              <div class="col-lg-8" >
                <s:select cssClass="form-control"
                          id="container.eirType"
                          name="container.eirType"
                          list="containerEirTypeList"
                          listKey="key"
                          listValue="value"
                          emptyOption="true"
                          required="false"
                        />
              </div>
            </div>

            <s:hidden name="container.containerId" value="%{container.containerId}" />
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Container Number: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.containerNumber" cssClass="form-control" id="container.containerNumber" disabled="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Container Size: </label>
              <div class="col-lg-8" >
                <s:select cssClass="form-control"
                          id="container.containerSize"
                          name="container.containerSize"
                          list="containerSizeList"
                          listKey="key"
                          listValue="value"
                          emptyOption="true"
                          required="false"
                          disabled="true"
                        />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Container Status: </label>
              <div class="col-lg-8" >
                <s:select cssClass="form-control"
                          id="container.containerStatus"
                          name="container.containerStatus"
                          list="containerStatusList"
                          listKey="key"
                          listValue="value"
                          emptyOption="true"
                          required="false"
                          disabled="true"
                        />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Shipping Line: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.shipping" cssClass="form-control" id="container.shipping" disabled="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Port Code: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.portCode" cssClass="form-control" id="container.portCode" disabled="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Receipt Number: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.receiptNumber" cssClass="form-control" id="container.receiptNumber" disabled="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Date: </label>
              <div class="col-lg-8" >
                <s:textfield required="true" name="container.dateTime" cssClass="form-control" id="dateTime" />
              </div>
              <script type="text/javascript">
                $(function () {
                  var fromDatePickUp = $('#dateTime');
                  fromDatePickUp.datetimepicker({
                    timeFormat: 'h:mm TT',
                    minDate: 0
                  });
                });
              </script>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">EIR Number: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.eirNumber" cssClass="form-control" id="container.eirNumber" disabled="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Van Location:</label>
              <div class="col-lg-8" >
                <s:textfield name="container.vanLocation" cssClass="form-control" id="container.vanLocation" disabled="true" />
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Trucking: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.trucking" cssClass="form-control" id="container.trucking" disabled="true" />
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.plateNumber" cssClass="form-control" id="container.plateNumber" disabled="true" />
              </div>

            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Driver: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.driver" cssClass="form-control" id="container.driver" disabled="true" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Seal Number: </label>
              <div class="col-lg-8" >
                <s:textfield required="true" name="container.sealNumber" cssClass="form-control" id="container.sealNumber" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-footer">
        <div class="pull-right">
          <a href="viewContainerList" class="btn btn-default" id ="groups-btn">Cancel</a>
          <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" value="Save"/>
        </div>
      </div>
      </s:form>
    </div>
  </div>
</div>