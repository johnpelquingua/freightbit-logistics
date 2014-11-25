<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
  <div class="col-lg-12">

    <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Search Container List </h1>
            </span>
    </legend>
    <ol class="breadcrumb">
      <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
      <li class="active"> Search Container List</li>
    </ol>
  </div>
</div>
<div class="row">
  <div class="col-lg-6 col-lg-offset-3">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-search"></i> Search </h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive list-table">
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
        </div>
      </div>
      <div class="panel-footer">
        <div class="pull-right">
          <s:submit cssClass="btn btn-primary" name="submit" value="Search"/>
        </div>
      </div>
    </div>
    </s:form>
  </div>
</div>