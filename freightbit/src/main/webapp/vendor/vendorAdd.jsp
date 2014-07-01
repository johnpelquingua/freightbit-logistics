<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left: -40px;">Add New Vendor</h1>

    <!-- EDIT HERE -->

    &lt;%&ndash;<div class="main-box">&ndash;%&gt;
    <div class="main-box" style="margin-left: -40px;">

        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="panel-title">Personal Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="addVendor" method="POST" theme="bootstrap">

                    <div class="form-group">
                        <label class="col-sm-1 control-label" for="vendor.vendorType">Type:</label>

                        <div class="col-sm-10" style="margin-left:4%">
                            <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType"
                                      listKey="key" listValue="value" cssClass="form-control"
                                      ></s:select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="vendor.vendorName" class="col-sm-1 control-label">Company:</label>

                        <div class="col-sm-10" style="margin-left:4%">
                            <s:textfield cssClass="form-control" placeholder="Company Name" name="vendor.vendorName"
                                         id="vendor.vendorName"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="vendor.vendorCode" class="col-sm-1 control-label">Code:</label>

                        <div class="col-sm-10" style="margin-left:4%">
                            <s:textfield cssClass="form-control" name="vendor.vendorCode" id="vendor.vendorCode"
                                         placeholder="Code"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="vendor.vendorClass" class="col-sm-1 control-label">Class:</label>

                        <div class="col-sm-10" style="margin-left:4%">
                            <s:select list="vendorClassList" listKey="key" listValue="value" cssClass="form-control"
                                      id="vendor.vendorClass" name="vendor.vendorClass"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="vendor.vendorStatus" class="col-sm-1 control-label">Status:</label>

                        <div class="col-sm-10" style="margin-left:4%">
                            <s:select list="statusList" listKey="key" listValue="value" cssClass="form-control"
                                      id="vendor.vendorStatus" name="vendor.vendorStatus"/>
                        </div>
                    </div>

                </div>
            </div>

            <div class="panel-footer">
                <div class="btn-group" style="float: right;position: relative;margin-right: 30px;">
                    <button class="btn btn-default" onclick="this.form.action='viewVendors'">
                    Cancel</button>
                    <s:submit cssClass="btn btn-default" value="Save" type="submit"/>
                </div>
            </div>
            </s:form>
        </div>

    </div>

</div>--%>
<!-- END OF THE MIDDLE -->

<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><i class="fa fa-plus"></i> Add New Vendor</li>
        </ol>

    </div>
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add New Vendor</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form cssClass="form-horizontal" action="addVendor" method="POST" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-sm-1 control-label" for="vendor.vendorType">Type:</label>
                        <div class="col-sm-10" style="margin-left:4%">
                            <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType"
                                      listKey="key" listValue="value" cssClass="form-control"
                                    ></s:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="vendor.vendorName" class="col-sm-1 control-label">Company:</label>
                        <div class="col-sm-10" style="margin-left:4%">
                            <s:textfield cssClass="form-control" placeholder="Company Name" name="vendor.vendorName"
                                         id="vendor.vendorName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="vendor.vendorCode" class="col-sm-1 control-label">Code:</label>
                        <div class="col-sm-10" style="margin-left:4%">
                            <s:textfield cssClass="form-control" name="vendor.vendorCode" id="vendor.vendorCode"
                                         placeholder="Code"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="vendor.vendorClass" class="col-sm-1 control-label">Class:</label>
                        <div class="col-sm-10" style="margin-left:4%">
                            <s:select list="vendorClassList" listKey="key" listValue="value" cssClass="form-control"
                                      id="vendor.vendorClass" name="vendor.vendorClass"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="vendor.vendorStatus" class="col-sm-1 control-label">Status:</label>
                        <div class="col-sm-10" style="margin-left:4%">
                            <s:select list="statusList" listKey="key" listValue="value" cssClass="form-control"
                                      id="vendor.vendorStatus" name="vendor.vendorStatus"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="pull-right" >
                    <button class="btn btn-default" onclick="this.form.action='viewVendors'">
                        Cancel</button>
                    <s:submit cssClass="btn btn-info" value="Save" type="submit"/>
                </div>
            </div>
            </s:form>
                </div>

            </div>
        </div>
    </div>
</div><!-- /.row -->