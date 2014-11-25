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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Checkout Form </h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive list-table">
          <s:form cssClass="form-horizontal" theme="bootstrap" action="checkoutContainer">
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
                        />
              </div>
            </div>

            <s:hidden name="container.containerId" value="%{container.containerId}" />
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Container Number: </label>
              <div class="col-lg-8" >
                  <%--The "readonly=true" is equivalent to "disabled=true" but it retrieves the value it gets from the existing values inputted.
                  This attribute works only for textfields.--%>
                <s:textfield name="container.containerNumber" cssClass="form-control" id="container.containerNumber" readonly="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Container Size: </label>
              <div class="col-lg-8" >
                  <%--The code "onfocus" below disabled the dropdown menus in the same way as how "disabled="true"" works
                  but this attribute still retrieves the value it gets from the existing value inputted. This attribute works only in "select"--%>
                <s:select cssClass="form-control"
                          id="container.containerSize"
                          name="container.containerSize"
                          list="containerSizeList"
                          listKey="key"
                          listValue="value"
                          emptyOption="true"
                          required="false"
                          headerKey="0"
                          headerValue="container.containerSize"
                          onfocus="this.defaultIndex=this.selectedIndex;"
                          onchange="this.selectedIndex=this.defaultIndex;"
                        />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Container Status: </label>
              <div class="col-lg-8" >
                <%--<s:property value="%{container.containerStatus}" />--%>
                <s:select cssClass="form-control"
                          id="container.containerStatus"
                          name="container.containerStatus"
                          list="containerStatusList"
                          listKey="key"
                          listValue="value"
                          emptyOption="true"
                          required="false"
                          headerKey="0"
                          headerValue="container.containerStatus"
                          onfocus="this.defaultIndex=this.selectedIndex;"
                          onchange="this.selectedIndex=this.defaultIndex;"
                        />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Shipping Line: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.shipping" cssClass="form-control" id="container.shipping" readonly="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Port Code: </label>
              <div class="col-lg-8" >
                  <s:select cssClass="form-control"
                            id="container.portCode"
                            name="container.portCode"
                            list="containerPortCode"
                            listKey="key"
                            listValue="value"
                            emptyOption="true"
                            required="false"
                            headerKey="0"
                            headerValue="container.portCode"
                            onfocus="this.defaultIndex=this.selectedIndex;"
                            onchange="this.selectedIndex=this.defaultIndex;"
                          />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Receipt Number: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.receiptNumber" cssClass="form-control" id="container.receiptNumber" readonly="true" />
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
                <s:textfield name="container.eirNumber" cssClass="form-control" id="container.eirNumber" readonly="true" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Van Location:</label>
              <div class="col-lg-8" >
                <s:textfield name="container.vanLocation" cssClass="form-control" id="container.vanLocation" readonly="true" />
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Trucking: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.trucking" cssClass="form-control" id="container.trucking" readonly="true" />
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Plate Number: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.plateNumber" cssClass="form-control" id="container.plateNumber" readonly="true" />
              </div>

            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Driver: </label>
              <div class="col-lg-8" >
                <s:textfield name="container.driver" cssClass="form-control" id="container.driver" readonly="true" />
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