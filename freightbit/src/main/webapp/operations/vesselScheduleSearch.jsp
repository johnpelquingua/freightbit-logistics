<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<%--<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-anchor"></i> Search Vessel Schedule </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Search Vessel Schedule</li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search </h3>
            </div>--%>
            <%--<div class="panel-body">
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
                    </s:form>--%>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary" style="margin-bottom: 0px;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Search Vessel Schedule </h3>
            </div>
            <div class="panel-body">
                <div class="well" style="margin-top: 10px;">
                    <s:form theme="bootstrap" cssClass="form-horizontal" action="viewVesselSchedules">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search by</label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" id="vesselSchedule.vesselScheduleCriteria"
                                      value="vesselSchedule.vesselScheduleCriteria"
                                      name="vesselSchedule.vesselScheduleCriteria"
                                      list="vesselScheduleSearch" listValue="value" listKey="key"
                                      cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="vesselSchedule.vesselScheduleKeyword" class="col-lg-2 control-label" style="padding-top:0px;">Search</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Keyword"
                                         name="vesselSchedule.vesselScheduleKeyword"
                                         id="vesselSchedule.vesselScheduleKeyword"
                                        maxlength="20"
                                    />
                        </div>
                    </div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
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
        <%--</div>
    </div>
</div>--%>
