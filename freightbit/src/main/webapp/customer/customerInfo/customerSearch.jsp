<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

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
                                      cssClass="customerSearchDropdown form-control customerCriteriaCSS"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search</label>
                        <div class="col-lg-10">
                            <s:textfield name="customer.customerKeyword" cssClass="customerSearchText form-control" placeholder="Keyword"/>
                        </div>
                    </div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                            Cancel
                        </button>
                        <s:submit name="submit" cssClass="customerSearchBtn btn btn-primary" value="Search" disabled="true"/>
                    </div>

                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

<script>
    validateSearchModal('customerSearchBtn', 'customerSearchText', 'customerSearchDropdown');
</script>