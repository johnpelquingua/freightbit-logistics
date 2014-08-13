<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Search Vendor</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"> Search Vendor</li>
        </ol>

    </div>
</div>
<br/>

<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search</h3>
            </div>
            <div class="panel-body">
                <s:form cssClass="form-horizontal" action="viewVendors" theme="bootstrap">
                <div class="form-group">
                    <label for="vendor.vendorSearchCriteria" class="col-sm-2 control-label">Search By</label>

                    <div class="col-sm-10">
                        <s:select emptyOption="true" id="vendor.vendorSearchCriteria"
                                  value="vendor.vendorSearchCriteria"
                                  name="vendor.vendorSearchCriteria"
                                  list="vendorSearchList" listValue="value" listKey="key"
                                  cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vendor.vendorKeyword" class="col-sm-2 control-label">Search</label>

                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" placeholder="Keyword" name="vendor.vendorKeyword"
                                     id="vendor.vendorKeyword"/>
                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button type="button" class="btn" onclick="location.href='viewVendors'">
                        Cancel
                    </button>
                    <s:submit cssClass="btn btn-default btn-info pull-right" name="submit" value="Search"/>
                </div>
            </div>
        </div>
        </s:form>
        <div id="morris-chart-area"></div>
    </div>
</div>