<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Vendor Module</h1>

    <!-- EDIT HERE -->
    <div class="main-box">
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
                                <s:textfield cssClass="form-control" placeholder="Keyword" name="vendor.vendorKeyword"/>
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


    <!-- SIDBAR GOES HERE -->
    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/chat.png" class="box-icon">
                <span class="panel-title">Online Chat</span>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                </div>
            </div>
        </div>
    </div>
    <!-- END OF EDIT -->


</div>
<!-- END OF THE MIDDLE -->
