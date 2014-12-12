<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<%--<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Search Customer </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"> Search Customer</li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search </h3>
            </div>--%>

            <%--<label  style="font-size: 20px;">Search Customer</label>--%>
            <%--<div class="panel-body">
                    <s:form cssClass="form-horizontal" action="searchCustomers" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="padding-top:0px">Search by : </label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" id="customer.customerSearchCriteria"
                                      value="customer.customerSearchCriteria"
                                      name="customer.customerSearchCriteria"
                                      list="customerSearchList" listValue="value" listKey="key"
                                      cssClass="form-control customerCriteriaCSS"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="padding-top:0px;">Search : </label>

                        <div class="col-sm-10">
                            <s:textfield name="customer.customerKeyword" cssClass="form-control" placeholder="Keyword"/>
                        </div>
                    </div>
                        <div class= "pull-right" style="margin-top: 10px;">
                            <button type="button" class="btn" onclick="location.href='customerList'">
                                Cancel
                            </button>
                            <s:submit name="submit" cssClass="btn btn-primary" value="Search"/>
                        </div>
            </div>
                    </s:form>--%>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary" style="margin-bottom: 0px;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Search Customer</h3>
            </div>
            <div class="panel-body">
                <div class="well" style="margin-top: 10px;">
                    <s:form cssClass="form-horizontal" action="searchCustomers" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search by</label>
                        <div class="col-lg-10">
                            <s:select emptyOption="true" id="customer.customerSearchCriteria"
                                      value="customer.customerSearchCriteria"
                                      name="customer.customerSearchCriteria"
                                      list="customerSearchList" listValue="value" listKey="key"
                                      cssClass="form-control customerCriteriaCSS"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search</label>
                        <div class="col-lg-10">
                            <s:textfield name="customer.customerKeyword" cssClass="form-control" placeholder="Keyword"/>
                        </div>
                    </div>
                    <div class="pull-right">
                        <button type="button" class="btn" data-dismiss="modal">
                            Cancel
                        </button>
                        <s:submit name="submit" cssClass="btn btn-primary" value="Search"/>
                    </div>

                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
        <%--</div>
    </div>
</div>
</div>--%>