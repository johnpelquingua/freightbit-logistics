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
                    <s:form theme="bootstrap" cssClass="form-horizontal" action="viewVesselSchedules">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search By</label>

                        <div class="col-lg-10">
                            <s:select emptyOption="true" id="vesselSchedule.vesselScheduleCriteria"
                                      value="vesselSchedule.vesselScheduleCriteria"
                                      name="vesselSchedule.vesselScheduleCriteria"
                                      list="vesselScheduleSearch" listValue="value" listKey="key"
                                      cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="vesselSchedule.vesselScheduleKeyword" class="col-lg-2 control-label" style="padding-top:0px;">Search</label>

                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" placeholder="Keyword"
                                         name="vesselSchedule.vesselScheduleKeyword"
                                         id="vesselSchedule.vesselScheduleKeyword"/>
                        </div>
                    </div>
                        <div class="pull-right">
                            <button type="button" class="btn" onclick="location.href='viewVesselSchedules'">
                                Cancel
                            </button>
                            <s:submit cssClass="btn btn-primary" name="submit" value="Search"></s:submit>
                        </div>
                </div>
            </div>
                    </s:form>
        </div>
    </div>
</div>
