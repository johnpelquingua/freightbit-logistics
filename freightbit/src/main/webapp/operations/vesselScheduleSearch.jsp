<%@ taglib prefix="s" uri="/struts-tags" %>


<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Search Vessel Schedule </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-search"></i> Search Vessel Schedule</li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search </h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form theme="bootstrap" cssClass="form-horizontal" action="viewVesselSchedules">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Search By</label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" id="vesselSchedule.vesselScheduleCriteria"
                                      value="vesselSchedule.vesselScheduleCriteria"
                                      name="vesselSchedule.vesselScheduleCriteria"
                                      list="vesselScheduleSearch" listValue="value" listKey="key"
                                      cssClass="form-control"/>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="vesselSchedule.vesselScheduleKeyword" class="col-sm-2 control-label">Search</label>

                            <div class="col-sm-10">
                                <s:textfield cssClass="form-control" placeholder="Keyword" name="vesselSchedule.vesselScheduleKeyword"
                                             id="vesselSchedule.vesselScheduleKeyword"/>
                            </div>
                        </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button type="button" class="btn" onclick="location.href='viewVendors'">
                        Cancel
                    </button>
                    <s:submit cssClass="btn btn-default btn-info pull-right" name="submit" value="Search"/>
                </div>
            </div>
        </div>
            </s:form>
        </div>
    </div>
</div>
</div><!-- /.row -->