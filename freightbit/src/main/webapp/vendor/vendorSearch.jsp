<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left: -40px;">Vendor Module</h1>

    <!-- EDIT HERE -->
    <div class="main-box" style="margin-left: -50px;">
        <div class="col-md-12">
            <div class="panel panel-info">

                <div class="panel-heading">
                    <img src="includes/images/search.png" class="box-icon">
                    <span class="panel-title">Search Vendor</span>
                </div>

                <div class="panel-body">
                    <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="viewVendors" theme="bootstrap">


                        <div class="form-group">

                            <label for="vendor.vendorSearchCriteria" class="col-sm-2 control-label">Search by:</label>

                            <div class="col-sm-10">
                                <s:select emptyOption="true" id="vendor.vendorSearchCriteria"
                                          value="vendor.vendorSearchCriteria"
                                          name="vendor.vendorSearchCriteria"
                                          list="vendorSearchList" listValue="value" listKey="key"
                                          cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">

                            <label for="vendor.vendorKeyword" class="col-sm-2 control-label">Search:</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Keyword" name="vendor.vendorKeyword" id="vendor.vendorKeyword" />
                            </div>

                        </div>

                    </div>


                </div>

                <div class="panel-footer">
                    <s:submit cssClass="btn btn-default pull-right" name="submit" value="Search"/>
                </div>
                </s:form>
            </div>

        </div>
    </div>

</div>--%>
<!-- END OF THE MIDDLE -->

<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Search Vendor</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><i class="fa fa-search"></i> Search Vendor</li>
        </ol>

    </div>
</div>
<!-- /.row -->
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
</div>
</div><!-- /.row -->