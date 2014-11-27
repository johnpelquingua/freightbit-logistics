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
              <s:hidden name="container.containerId" value="%{container.containerId}" />
              <s:hidden name="container.containerNumber" value="%{container.containerNumber}" />
              <s:hidden name="container.containerSize" value="%{container.containerSize}" />
              <s:hidden name="container.shipping" value="%{container.shipping}" />
              <s:hidden name="container.portCode" value="%{container.portCode}" />
              <s:hidden name="container.modifiedBy" value="%{container.modifiedBy}"/>
              <s:hidden name="container.modifiedTimestamp" value="%{container.modifiedTimestamp}"/>
            <s:hidden name="container.eirType" value="EIR FORM 2"/>


            <div class="form-group">
              <label class="col-lg-2 control-label" style="padding-top:0px;">Date: </label>
              <div class="col-lg-4" >
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
              <label class="col-lg-2 control-label" style="padding-top:0px;">Seal Number: </label>
              <div class="col-lg-4" >
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