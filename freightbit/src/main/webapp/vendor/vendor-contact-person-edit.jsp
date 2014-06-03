<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Contact Person</h1>

    <!-- EDIT HERE -->

    <div class="main-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="panel-title">Contact Person Information</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="vendor-other-information" theme="bootstrap">
                        <%--<form class="form-horizontal" role="form">--%>

                    <div class="form-group">

                        <label for="CONTACT-LAST_NAME" class="col-sm-2 control-label">Last Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="CONTACT-LAST_NAME" placeholder="Last Name" name="CONTACT-LAST_NAME"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="CONTACT-FIRST_NAME" class="col-sm-2 control-label">First Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="CONTACT-FIRST_NAME" placeholder="First Name" name="CONTACT-FIRST_NAME"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="CONTACT-MIDDLE_NAME" class="col-sm-2 control-label">Middle Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="CONTACT-MIDDLE_NAME" placeholder="Middle Name" name="CONTACT-MIDDLE_NAME"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="CONTACT_NUMBER" class="col-sm-2 control-label">Number:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="CONTACT-NUMBER" placeholder="Number" name="CONTACT_NUMBER"/>
                        </div>

                    </div>

                        <%--</form>--%>

                </div>
            </div>

            <div class="panel-footer">
                <div class="btn-group" style="float: right;">
                    <button class="btn btn-default" onclick="this.form.action='vendor-list-info'">Back</button>
                    <button class="btn btn-default" onclick="this.form.action='vendor-list-info'">Next</button>
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