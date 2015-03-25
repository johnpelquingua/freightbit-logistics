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
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"> Add Vendor</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add Vendor</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form cssClass="form-horizontal" action="addVendor" method="POST" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Type<span class="asterisk_red"></span></label>

                        <div class="col-lg-9"></span>
                            <s:select list="vendorTypeList" name="vendor.vendorType" id="vendorTypeId"
                                      listKey="key" listValue="value" cssClass="vendorInput form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Code<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="vendorInput form-control" name="vendor.vendorCode" id="vendor_vendorCode" required="true"
                                         placeholder="Code" maxLength="3" pattern="^(\s*[\#a-zA-Z0-9\.\,]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\#]*)\s*)+$" title="Must be capital letters and numbers only"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Company<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:textfield cssClass="vendorInput form-control" placeholder="Company Name" name="vendor.vendorName"
                                         id="vendor.vendorName" required="true" pattern="^[a-z0-9_-,.]{3,15}$"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Class<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:select list="vendorClassList" listKey="key" listValue="value" cssClass="vendorInput form-control"
                                      id="vendor.vendorClass" name="vendor.vendorClass"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Service Area<span class="asterisk_red"></span></label>

                        <div class="col-lg-9">
                            <s:select list="portsList" listKey="key" listValue="value" cssClass="vendorInput form-control"
                                      id="serviceAreaId" name="vendor.serviceArea" emptyOption="true"/>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<label class="col-lg-2 control-label" style="padding-top:0px;">Status<span class="asterisk_red"></span></label>--%>

                        <%--<div class="col-lg-9">--%>
                            <%--<s:select list="statusList" listKey="key" listValue="value" cssClass="form-control"--%>
                                      <%--id="vendor.vendorStatus" name="vendor.vendorStatus"/>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>
            </div>
            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewVendors" class="btn btn-danger" id ="groups-btn">Cancel</a>
                    <s:submit cssClass="btn btn-primary submitBtn" value="Save" type="submit" disabled="true"/>
                </div>
            </div>
            </s:form>
        </div>

    </div>
</div>

<script type="text/javascript">

   $(document).ready(function(){
       validationForm('vendorInput', 'submitBtn');
   });

   $(document).ready(function(){
       $("#vendorTypeId").change(function(){
           if($('.vendorInput').val() == 'SHIPPING'){
               $("#serviceAreaId").prop('disabled', true);
               $("#serviceAreaId").val('');
           }
           else{
               $("#serviceAreaId").prop('disabled', false);

           }
       });
   });

</script>