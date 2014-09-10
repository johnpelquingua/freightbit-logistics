<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building"></i> Vendor Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"> Edit Vendor</li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
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
                    <label for="vendor.vendorName" class="col-lg-2 control-label" style="padding-top:0px;">Name<span class="asterisk_red"></span></label>

                    <div class="col-lg-9">
                        <s:textfield cssClass="form-control" id="vendor.vendorName" placeholder="Vendor Name"
                                     name="vendor.vendorName"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorCode" class="col-lg-2 control-label" style="padding-top:0px;">Code<span class="asterisk_red"></span></label>

                    <div class="col-lg-9">
                        <s:textfield cssClass="form-control" id="vendor_vendorCode" placeholder="Vendor Code"
                                     name="vendor.vendorCode" maxLength="3" pattern="[A-Z]+" title="Must be letters only and CAPS." onkeypress="return alphaKeyOnly(event)"></s:textfield>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorType" class="col-lg-2 control-label" style="padding-top:0px;">Type<span class="asterisk_red"></span></label>

                    <div class="col-lg-9">
                        <s:select cssClass="form-control" id="vendor.vendorType" list="vendorTypeList" listValue="value"
                                  listKey="key"
                                  name="vendor.vendorType"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorClass" class="col-lg-2 control-label" style="padding-top:0px;">Class Name<span class="asterisk_red"></span></label>

                    <div class="col-lg-9">
                        <s:select cssClass="form-control" id="vendor.vendorClass" list="vendorClassList" listKey="key"
                                  listValue="value"
                                  name="vendor.vendorClass"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorStatus" class="col-lg-2 control-label" style="padding-top:0px;">Status<span class="asterisk_red"></span></label>

                    <div class="col-lg-9">
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
                    <s:submit cssClass="btn btn-primary" value="Save" type="submit"/>
                </div>
                </s:form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#vendor_vendorCode").keyup(function(){
            this.value=this.value.toUpperCase();

        });
    });
    function alphaKeyOnly(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if ((charCode > 32 && charCode < 57)||(charCode > 57 && charCode <65) || (charCode > 90 && charCode < 97) )
            return false;

        return true;
    }
</script>