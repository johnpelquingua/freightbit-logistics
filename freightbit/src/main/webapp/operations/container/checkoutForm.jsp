<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Gate Out </h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <s:form cssClass="form-horizontal" theme="bootstrap" action="checkoutContainer">
              <s:hidden name="container.containerId" value="%{container.containerId}" />
              <s:hidden name="container.containerNumber" value="%{container.containerNumber}" />
              <s:hidden name="container.containerSize" value="%{container.containerSize}" />
              <s:hidden name="container.shipping" value="%{container.shipping}" />
              <s:hidden name="container.receiptNumber" value="%{container.receiptNumber}" />
              <s:hidden name="container.gateInTime" value="%{container.gateInTime}" />
              <s:hidden name="container.eirNumber" value="%{container.eirNumber}" />
              <s:hidden name="container.vanLocation" value="%{container.vanLocation}" />
              <s:hidden name="container.modifiedBy" value="%{container.modifiedBy}"/>
              <s:hidden name="container.modifiedTimestamp" value="%{container.modifiedTimestamp}"/>
              <s:hidden name="container.portCode" value="%{container.portCode}"/>
              <s:hidden name="container.eirType" value="EIR FORM 2"/>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Date/Time: </label>
              <div class="col-lg-7" >
                <s:textfield required="true" name="container.gateOutTime" cssClass="form-control" id="gateOutTime" />
              </div>
              <script type="text/javascript">
                $(function () {
                  var fromDatePickUp = $('#gateOutTime');
                  fromDatePickUp.datetimepicker({
                    timeFormat: 'h:mm TT',
                    minDate: 0
                  });
                });
              </script>
            </div>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Seal Number: </label>
              <div class="col-lg-7" >
                <s:textfield required="true" name="container.sealNumber" cssClass="form-control" id="container.sealNumber" />
              </div>
            </div>
              <div class="form-group">
                  <label class="col-lg-4 control-label" style="padding-top:0px;">Bullet Seal: </label>
                  <div class="col-lg-7" >
                      <s:textfield required="true" name="container.bulletSeal" cssClass="form-control" id="bulletSeal"/>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-lg-4 control-label" style="padding-top:0px;">Shipping Seal: </label>
                  <div class="col-lg-7" >
                      <s:textfield required="true" name="container.shippingSeal" cssClass="form-control" id="shippingSeal"/>
                  </div>
              </div>
            <div class="pull-right">
                <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
              <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary" value="Save"/>
            </div>
          </s:form>
        </div>
      </div>
    </div>
  </div>
</div>