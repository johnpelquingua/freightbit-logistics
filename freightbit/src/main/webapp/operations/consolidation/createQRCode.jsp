<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="row">
  <div class="col-lg-12">
    <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-exchange"></i> Consolidation </h1>
            </span>
    </legend>
    <ol class="breadcrumb">
      <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
      <li class="active"> Container List </li>
    </ol>

  </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success" id="alert">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-qrcode"></i> Sample QR Code</h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive list-table">
          <s:form cssClass="form-horizontal" theme="bootstrap" action="generate" id="qrCode">
            <div class="form-group">
              <label class="col-lg-2 control-label" style="padding-top:0px;">Input: <span class="asterisk_red"></span></label>
              <div class="col-lg-9" >
                <s:textfield required="true"
                             name="container.containerType"
                             cssClass="containerInput form-control"
                             id="container.containerType"
                             maxlength="20"
                             placeholder="Enter any value"
                        />
              </div>
            </div>
        </div>
      </div>
      <div class="panel-footer">
        <div class="pull-right">
          <s:submit id="saveBtn" name="submit" cssClass="btn btn-primary submitBtn" value="Generate QR Code"/>
        </div>
      </div>
    </div>
    </s:form>
  </div>
</div>
