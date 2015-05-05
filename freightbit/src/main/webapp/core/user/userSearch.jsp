<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary" style="margin-bottom: 0px;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Search User </h3>
            </div>
            <div class="panel-body">
                <div class="well" style="margin-top: 10px;">
                    <s:form cssClass="form-horizontal" action="viewUsers" theme="bootstrap">
                        <div class="form-group">
                            <label for="user.userSearchCriteria" class="col-sm-2 control-label" style="padding-top:0px;">Search by</label>

                            <div class="col-sm-10">
                                <s:select emptyOption="true" list="userSearchList" listValue="value" listKey="key"
                                          cssClass="userSearchInput form-control" name="user.userSearchCriteria"
                                          value="user.userSearchCriteria"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user.userKeyword" class="col-sm-2 control-label" style="padding-top:0px;">Search</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="userSearchInput form-control" placeholder="Keyword" name="user.userKeyword"/>
                            </div>
                        </div>
                        <div class="pull-right">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                            <s:submit value="Search" type="submit" cssClass="userSearchBtn btn btn-primary" disabled="true"></s:submit>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    validationForm('userSearchInput', 'userSearchBtn');
</script>