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

                    <s:form theme="bootstrap" cssClass="form-horizontal" action="viewContainerList">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search By</label>

                        <div class="col-lg-10">
                            <s:select emptyOption="true" id="container.containerSearchCriteria"
                                      value="container.containerSearchCriteria"
                                      name="container.containerSearchCriteria"
                                      list="containerSearchList" listValue="value" listKey="key"
                                      cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="container.containerKeyword" class="col-lg-2 control-label" style="padding-top:0px;">Search</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Keyword"
                                         name="container.containerKeyword"
                                         id="container.containerKeyword"/>
                        </div>
                    </div>
                        <div class="pull-right">
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>
                            <s:submit cssClass="btn btn-primary" name="submit" value="Search"/>
                        </div>
                    </s:form>
                    </div>
            </div>
        </div>
    </div>
</div>