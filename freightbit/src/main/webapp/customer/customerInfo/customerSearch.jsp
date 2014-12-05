<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Search </h3>
            </div>
            <div class="panel-body">
                <div class="well">
                    <s:form cssClass="form-horizontal" action="searchCustomers" theme="bootstrap">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="padding-top:0px;">Search By</label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" id="customer.customerSearchCriteria"
                                      value="customer.customerSearchCriteria"
                                      name="customer.customerSearchCriteria"
                                      list="customerSearchList" listValue="value" listKey="key"
                                      cssClass="form-control customerCriteriaCSS"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="padding-top:0px;">Search</label>

                        <div class="col-sm-10">
                            <s:textfield name="customer.customerKeyword" cssClass="form-control" placeholder="Keyword"/>
                        </div>
                    </div>
                        <div class= "pull-right">
                            <button type="button" class="btn" onclick="location.href='customerList'">
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