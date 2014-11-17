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

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Search Containers </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> Container List </a></li>
            <li class="active"> Search Container </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search Container</h3>
            </div>
            <div class="panel-body">
                <s:form action="viewContainerList" theme="bootstrap" cssClass="form-horizontal" >
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
                    <label class="col-lg-2 control-label" style="padding-top:0px;">Search</label>
                    <div class="col-lg-10">
                        <s:textfield cssClass="form-control" id="container.containerKeyword" name="container.containerKeyword" placeholder="Keyword"></s:textfield>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="pull-right">
                        <%--<button type="button" class="btn" onclick="location.href='viewOrders'">
                            Cancel
                        </button>--%>
                    <s:submit value="Search" type="submit" cssClass="btn btn-primary"></s:submit>

                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
<!-- /.row -->



