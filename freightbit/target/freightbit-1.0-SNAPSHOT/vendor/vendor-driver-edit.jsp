<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Drivers</h1>

    <!-- EDIT HERE -->
    <div class="main-box">
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="panel-title">Driver Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="vendor-contact-person" theme="bootstrap">
                        <%--<form class="form-horizontal" role="form">--%>

                    <div class="form-group">

                        <label for="licenseNumber" class="col-sm-2 control-label">License:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="License Number" name="licenseNumber"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="lastName" class="col-sm-2 control-label">Last Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="lastName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="firstName" class="col-sm-2 control-label">First Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="firstName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="middleName" class="col-sm-2 control-label">Middle Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="middleName"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label class="col-sm-2 control-label">Status:</label>

                        <div class="col-sm-10">
                            <s:select list="statusList" cssClass="form-control" />
                        </div>

                    </div>

                        <%--</form>--%>
                </div>
            </div>

            <div class="panel-footer">
                <button class="btn btn-default pull-left">Add</button>

                <div class="btn-group pull-right">
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

    <div class="row col-md-12">
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/listofusers.png" class="box-icon"/>
                <span class="panel-title">List of Drivers</span>

            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black"><input type="checkbox" /></th>
                            <th class="tb-font-black">License</th>
                            <th class="tb-font-black">Last Name</th>
                            <th class="tb-font-black">First Name</th>
                            <th class="tb-font-black">Middle Name</th>
                            <th class="tb-font-black">Status</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">123456789</td>
                            <td class="tb-font-black">Victoria</td>
                            <td class="tb-font-black">Clarence</td>
                            <td class="tb-font-black">Columna</td>
                            <td class="tb-font-black">Active</td>
                            <td class="tb-font-black">
                                <a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                                <a href="#myModal" data-toggle="modal" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="panel-footer">

                <ul class="pagination">
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li class="disabled"><a href="#">&raquo;</a></li>
                </ul>

            </div>

        </div>
    </div>

    <!-- SIDBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
            </div>
            <div class="modal-body">
                <div style="text-align:center;">
                    <span>Do you really want to delete <em>'123456789, Victoria, Clarence, Columna, Active'</em> ? This action is irreversible.</span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- END OF THE MIDDLE -->
