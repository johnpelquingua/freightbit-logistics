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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Container</h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive list-table">
          <s:form cssClass="form-horizontal" theme="bootstrap" action="editContainer">
              <s:hidden name="container.containerId" value="%{container.containerId}" />
              <s:hidden name="container.modifiedBy" value="%{container.modifiedBy}"/>
              <s:hidden name="container.modifiedTimestamp" value="%{container.modifiedTimestamp}"/>
              <s:hidden name="container.eirType" value="%{container.eirType}"/>
              <s:hidden name="container.containerStatus" value="%{container.containerStatus}"/>
              <s:hidden name="container.gateOutTime" value="%{container.gateOutTime}"/>
              <s:hidden name="container.bulletSeal" value="%{container.bulletSeal}"/>
              <s:hidden name="container.shippingSeal" value="%{container.shippingSeal}"/>

                  <div class="form-group">
                      <label class="col-lg-2 control-label" style="padding-top:0px;">Container Van Number: <span class="asterisk_red"></span></label>
                      <div class="col-lg-9" >
                          <s:textfield required="true" name="container.containerNumber" cssClass="form-control" id="container.containerNumber" />
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size: <span class="asterisk_red"></span></label>
                      <div class="col-lg-9" >
                          <s:select cssClass="form-control"
                                    id="container.containerSize"
                                    name="container.containerSize"
                                    list="containerSizeList"
                                    listKey="key"
                                    listValue="value"
                                    required="true"
                                  />
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-lg-2 control-label" style="padding-top:0px;">Shipping Line: <span class="asterisk_red"></span></label>
                      <div class="col-lg-9" >
                          <s:select cssClass="form-control"
                                    id="container.shipping"
                                    name="container.shipping"
                                    list="vendorShippingList"
                                    listKey="vendorName"
                                    listValue="vendorName"
                                    emptyOption="false"
                                    required="true"
                                  />
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-lg-2 control-label" style="padding-top:0px;">Port Code: <span class="asterisk_red"></span></label>
                      <div class="col-lg-9" >
                          <s:select cssClass="containerInput form-control"
                                    id="container_portCode" name="container.portCode" list="portsList" listKey="key"
                                    listValue="value" required="true" value="%{container.portCode}" />
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-lg-2 control-label" style="padding-top:0px;">Receipt Number: <span class="asterisk_red"></span></label>
                      <div class="col-lg-9" >
                          <s:textfield required="true" name="container.receiptNumber" cssClass="form-control" id="container.receiptNumber" />
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-lg-2 control-label" style="padding-top:0px;">Date/Time: <span class="asterisk_red"></span></label>
                      <div class="col-lg-9" >
                          <s:textfield required="true" name="container.gateInTime" cssClass="form-control" id="gateInTime" />
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
                          <s:textfield required="true" name="container.eirNumber" cssClass="form-control" id="container.eirNumber" />
                      </div>
                  </div>

                  <div class="form-group">
                      <label class="col-lg-2 control-label" style="padding-top:0px;">Van Location: <span class="asterisk_red"></span></label>
                      <div class="col-lg-9" >
                          <s:textfield required="true" name="container.vanLocation" cssClass="form-control" id="container.vanLocation" />
                      </div>
                  </div>
              </div>
            </div>
        <%--</div>--%>
      <div class="panel-footer">
        <div class="pull-right">
          <a href="viewContainerList" class="btn btn-danger" id ="groups-btn">Cancel</a>
          <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" value="Save"/>
        </div>
      </div>
      </s:form>
    </div>
  </div>
</div>
