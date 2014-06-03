<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Other Information</h1>

    <!-- EDIT HERE -->

    <div class="main-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="booking panel-title">Other Information</span>
            </div>
            <div class="panel-body">

                <form class="form-horizontal" role="form">
                    <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="vendor-address" theme="bootstrap">
                        <div class="form-group">

                            <label for="CLASS" class="col-sm-2 control-label">Class:</label>

                            <div class="col-sm-10">

                                <s:select list="otherInfoClassList" cssClass="form-control" id="CLASS" name="CLASS"/>

                            </div>

                        </div>

                        <div class="form-group">

                            <label for="STATUS" class="col-sm-2 control-label">Status:</label>

                            <div class="col-sm-10">

                                <s:select list="statusList" cssClass="form-control" id="STATUS" name="STATUS"/>

                            </div>

                        </div>

                            <%--</form>--%>

                    </div>
            </div>

            <div class="panel-footer">
                <div class="btn-group" style="float: right;">
                    <button class="btn btn-default" onclick="this.form.action='vendor-list-info'">Cancel</button>
                    <button class="btn btn-default" onclick="this.form.action='vendor-list-info'">Save</button>
                </div>
            </div>
            </s:form>
        </div>

    </div>
    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/calendar.png" class="box-icon">
                <span class="panel-title">Process</span>
            </div>
        </div>
    </div>

    <!-- SIDEBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->
