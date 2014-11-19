<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
  <div class="col-lg-12">

    <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Search Forms </h1>
            </span>
    </legend>
    <ol class="breadcrumb">
      <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
      <li class="active"> Container </li>
      <li class="active"> Search Form</li>
    </ol>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-search"></i> Search </h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive list-table">
          <s:form cssClass="form-horizontal" action="searchContainer" theme="bootstrap">
          <div class="form-group">
            <label class="col-sm-2 control-label" style="padding-top:0px;">Search By</label>

            <div class="col-sm-10">
              <s:select emptyOption="true" id="container.containerSearchCriteria"
                        value="container.containerSearchCriteria"
                        name="container.containerSearchCriteria"
                        list="containerSearchList" listValue="value" listKey="key"
                        cssClass="form-control containerCriteriaCSS"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" style="padding-top:0px;">Search</label>

            <div class="col-sm-10">
              <s:textfield name="container.containerKeyword" cssClass="form-control" placeholder="Keyword"/>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-footer">
        <div class= "pull-right">
          <a href="viewContainerList" class="btn btn-default" id ="groups-btn">Back to Container List</a>
          <s:submit name="submit" cssClass="btn btn-primary" value="Search"/>
        </div>
      </div>

    </div>
    </s:form>
  </div>
</div>