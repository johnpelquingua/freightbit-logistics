<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 11/17/2014
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary" style="margin-bottom: 0px;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Search Container </h3>
            </div>
            <div class="panel-body">
                <div class="well" style="margin-top: 10px;">
                <s:form action="viewConsolidationContainerList" theme="bootstrap" cssClass="form-horizontal" >
                <div class="form-group">
                    <label class="col-lg-2 control-label" style="padding-top:0px;">Search by</label>
                    <div class="col-lg-10">
                        <s:select emptyOption="true" id="container.containerSearchCriteria"
                                  value="container.containerSearchCriteria"
                                  name="container.containerSearchCriteria"
                                  list="containerSearchList" listValue="value" listKey="key"
                                  cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label" style="padding-top:0px;">Search</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" id="container.containerKeyword" name="container.containerKeyword" placeholder="Keyword"></s:textfield>
                    </div>
                </div>
                    <div class="pull-right">
                        <button type="button" class="btn" data-dismiss="modal">
                            Cancel
                        </button>
                        <s:submit value="Search" type="submit" cssClass="btn btn-primary"></s:submit>

                    </div>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>