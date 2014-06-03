<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Trucks</h1>

    <!-- EDIT HERE -->
    <div class="main-box">
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/truck.png" class="box-icon">
                <span class="panel-title">Truck Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="vendor-driver" theme="bootstrap">
                        <%--<form class="form-horizontal" role="form">--%>

                    <div class="form-group">

                        <label class="col-sm-2 control-label">Type:</label>

                        <div class="col-sm-10">
                            <s:select list="truckTypeList" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">

                        <label for="PLATE_NUMBER" class="col-sm-2 control-label">Plate:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="PLATE_NUMBER" placeholder="Plate Number" name="PLATE_NUMBER"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="MODEL_NUMBER" class="col-sm-2 control-label">Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="MODEL_NUMBER" placeholder="Model Number" name="MODEL_NUMBER"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="YEAR_MODEL" class="col-sm-2 control-label">Year Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="YEAR_MODEL" placeholder="Year Model" name="YEAR_MODEL"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="ENGINE_NUMBER" class="col-sm-2 control-label">Engine:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="ENGINE_NUMBER" placeholder="Engine Number" name="ENGINE_NUMBER"/>
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
                <span class="panel-title">List of Trucks</span>

            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black"><input type="checkbox" /></th>
                            <th class="tb-font-black">Type</th>
                            <th class="tb-font-black">Plate</th>
                            <th class="tb-font-black">Model</th>
                            <th class="tb-font-black">Year</th>
                            <th class="tb-font-black">Engine</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">Closed Van</td>
                            <td class="tb-font-black" align="center">ABC-123</td>
                            <td class="tb-font-black">Isuzu Elf Dropside</td>
                            <td class="tb-font-black">1991</td>
                            <td class="tb-font-black">4HF1</td>
                            <td class="tb-font-black">
                                <a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                                <a href="#myModal" data-toggle="modal" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">Closed Van</td>
                            <td class="tb-font-black" align="center">ZXC-321</td>
                            <td class="tb-font-black">Isuzu 6HL</td>
                            <td class="tb-font-black">2013</td>
                            <td class="tb-font-black">M03737</td>
                            <td class="tb-font-black">
                                <a href="" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                                <a href="#myModal2" data-toggle="modal" class="icon-action-link"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </a>
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
</div>
<!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
            </div>
            <div class="modal-body">
                <div style="text-align:center;">
                    <span>Do you really want to delete <em>'Closed Van, ABC-123, Isuzu Elf Dropside, 1991, 4HF1'</em> ? This action is irreversible.</span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
            </div>
            <div class="modal-body">
                <div style="text-align:center;">
                    <span>Do you really want to delete <em>'Closed Van, ZXC-321, Isuzu GHL, 2013, M03737'</em> ? This action is irreversible.</span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
