<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-primary" style="margin-bottom: 0px;">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Actual Date Input </h3>
      </div>
      <div class="panel-body">
        <div class="well" style="margin-top: 10px;">
          <s:form action="actualDateInput" theme="bootstrap" cssClass="form-horizontal" >
            <s:hidden name="orderStatusLogsBean.statusId" value="%{orderStatusLogsBean.statusId}" />
            <%--<s:hidden name="orderStatusLogs.orderId" value="%{orderStatusLogs.orderId}" />--%>
            <%--<s:hidden name="orderStatusLogs.orderItemId" value="%{orderStatusLogs.orderItemId}" />--%>
            <%--<s:hidden name="orderStatusLogsBean.status" value="%{orderStatusLogs.status}" />--%>
            <%--<s:hidden name="orderStatusLogsBean.createdTimestamp" value="%{orderStatusLogs.createdTimestamp}" />--%>
            <%--<s:hidden name="orderStatusLogsBean.createdBy" value="%{orderStatusLogs.createdBy}" />--%>
            <%--<s:textfield value="%{orderStatusLogsBean.statusId}"></s:textfield>--%>
            <%--<s:textfield value="%{orderStatusLogs.orderItemId}"></s:textfield>--%>

            <div class="form-group">
              <label class="col-lg-4 control-label" style="padding-top:0px;">Actual Date/Time: </label>
              <div class="col-lg-7" >
                <s:textfield required="true" name="orderStatusLogsBean.actualDate" cssClass="form-control" id="actualDate" />
                <script>
                  $(function () {
                    var actDate = $('#actualDate');
                    actDate.datetimepicker({
                      timeFormat: 'h:mm TT',
                      minDate: 0
                    });
                  });
                </script>
              </div>
            </div>
          <div class="pull-right">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Cancel
            </button>
            <s:submit value="OK" type="submit" cssClass="bookingSearchBtn btn btn-primary"></s:submit>
          </div>
        </div>
      </div>
      </s:form>
    </div>
  </div>
</div>