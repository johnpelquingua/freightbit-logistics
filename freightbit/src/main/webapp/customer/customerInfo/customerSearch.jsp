<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Search Customer </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"> Search Customer</li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search </h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="searchCustomers" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Search By</label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" id="customer.customerSearchCriteria"
                                      value="customer.customerSearchCriteria"
                                      name="customer.customerSearchCriteria"
                                      list="customerSearchList" listValue="value" listKey="key"
                                      cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Search</label>

                        <div class="col-sm-10">
                            <s:textfield name="customer.customerKeyword" cssClass="form-control" placeholder="Keyword"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button type="button" class="btn" onclick="location.href='customerList'">
                        Cancel
                    </button>
                    <s:submit name="submit" cssClass="btn btn-info pull-right" value="Search"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
</div>