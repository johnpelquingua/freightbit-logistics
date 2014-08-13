<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Edit Vendor</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"> Edit Vendor</li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-edit"></i> Edit Vendor</h3>
            </div>
            <div class="panel-body">
                <s:form cssClass="form-horizontal" action="editVendor" method="POST" theme="bootstrap">
                <s:hidden name="vendor.vendorId" value="%{vendor.vendorId}"/>
                <s:hidden name="vendor.createdTimeStamp" value="%{vendor.createdTimeStamp}" />
                <s:hidden name="vendor.createdBy" value="%{vendor.createdBy}" />
                <div class="form-group">
                    <label for="vendor.vendorName" class="col-sm-2 control-label">Name</label>

                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" id="vendor.vendorName" placeholder="Vendor Name"
                                     name="vendor.vendorName"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorCode" class="col-sm-2 control-label">Code</label>

                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" id="vendor.vendorCode" placeholder="Vendor Code"
                                     name="vendor.vendorCode" maxLength="3" pattern="[A-Z]+" title="Must be letters only and CAPS."></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorType" class="col-sm-2 control-label">Type</label>

                    <div class="col-sm-10">
                        <s:select cssClass="form-control" id="vendor.vendorType" list="vendorTypeList" listValue="value"
                                  listKey="key"
                                  name="vendor.vendorType"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorClass" class="col-sm-2 control-label">Class Name</label>

                    <div class="col-sm-10">
                        <s:select cssClass="form-control" id="vendor.vendorClass" list="vendorClassList" listKey="key"
                                  listValue="value"
                                  name="vendor.vendorClass"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorStatus" class="col-sm-2 control-label">Status</label>

                    <div class="col-sm-10">
                        <s:select cssClass="form-control" id="vendor.vendorStatus" list="statusList"
                                  listKey="key" listValue="value"
                                  name="vendor.vendorStatus"/>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="" style="float: right;">
                    <button class="btn btn-default" onclick="this.form.action='viewVendors'"/>
                    Cancel</button>
                    <s:submit cssClass="btn btn-default btn-info" value="Save" type="submit"/>
                </div>
                </s:form>
            </div>
        </div>
    </div>
</div>