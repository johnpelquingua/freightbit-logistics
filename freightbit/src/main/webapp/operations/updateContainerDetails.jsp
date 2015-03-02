<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-primary" style="margin-bottom: 0px;">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Update Container Details </h3>
      </div>
      <div class="panel-body">
        <div class="well" style="margin-top: 10px;">
          <s:form action="updateContainerDetails" theme="bootstrap" cssClass="form-horizontal" >
          <s:hidden name="orderItemIdParam" value="%{orderItem.orderItemId}" />
          <s:hidden name="container.containerId" value="%{container.containerId}" />
          <div class="form-group">
            <label class="col-lg-4 control-label" style="padding-top:0px;">Container Number: </label>
            <div class="col-lg-7" >
              <s:textfield required="true" name="container.containerNumber" value="%{orderItem.containerNumber}" cssClass="form-control" id="containerNumber"/>
            </div>
          </div>
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Seal Number: </label>
              <div class="col-lg-7" >
                <s:textfield required="true" name="container.sealNumber" value="%{orderItem.sealNumber}" cssClass="form-control" id="sealNumber"/>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Bullet Seal: </label>
              <div class="col-lg-7" >
                <s:textfield required="true" name="container.bulletSeal" value="%{orderItem.bulletSeal}" cssClass="form-control" id="bulletSeal"/>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Shipping Seal: </label>
              <div class="col-lg-7" >
                <s:textfield required="true" name="container.shippingSeal" value="%{orderItem.shippingSeal}" cssClass="form-control" id="shippingSeal"/>
              </div>
            </div>
          <div class="pull-right">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Cancel
            </button>
            <s:submit value="Update" type="submit" cssClass="containerBtn btn btn-primary"></s:submit>
          </div>
        </div>
      </div>
      </s:form>
    </div>
  </div>
</div>