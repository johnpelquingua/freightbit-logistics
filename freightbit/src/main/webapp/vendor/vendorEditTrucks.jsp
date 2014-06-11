<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Edit Vendor</h1>

    <!-- EDIT HERE -->


    <div class="row" >
        <div class="panel panel-info">

            <div class="panel-heading">
                <img src="includes/images/truck.png" class="box-icon">
                <span class="panel-title">Truck Information</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="editVendorTrucks" method="post" theme="bootstrap">

                    <s:hidden name="truck.truckId" value="%{truck.truckId}"/>
                    <s:hidden name="vendor.vendorId" value="%{vendor.vendorId}"/>
                    <div class="form-group">

                        <label class="col-sm-2 control-label" for="truck.truckType">Type:</label>

                        <div class="col-sm-10">
                            <s:select list="truckTypeList" name="truck.truckType" listKey="key" listValue="value" cssClass="form-control"/>

                        </div>
                    </div>

                    <div class="form-group">

                        <label for="truck.plateNumber" class="col-sm-2 control-label">Plate:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Plate Number" name="truck.plateNumber" id="truck.plateNumber" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.modelNumber" class="col-sm-2 control-label">Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Model Number" name="truck.modelNumber" id="truck.modelNumber" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.modelYear" class="col-sm-2 control-label">Year Model:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Year Model" name="truck.modelYear" id="truck.modelYear"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.engineNumber" class="col-sm-2 control-label">Engine:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Engine Number" name="truck.engineNumber" id="truck.engineNumber" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.truckCode" class="col-sm-2 control-label">Code:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Truck Code" name="truck.truckCode" id="truck.truckCode" />
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="truck.grossWeight" class="col-sm-2 control-label">Weight:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Gross Weight" name="truck.grossWeight" id="truck.grossWeight" />
                        </div>

                    </div>

                </div>
            </div>

            <div class="panel-footer">

                <s:submit cssClass="btn btn-default" name="submit" value="Add" />

            </div>
            </s:form>
        </div>

        <div class="row">
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
                                <th class="tb-font-black">Code</th>
                                <th class="tb-font-black">Type</th>
                                <th class="tb-font-black">Plate</th>
                                <th class="tb-font-black">Model</th>
                                <th class="tb-font-black">Year</th>
                                <th class="tb-font-black">Engine</th>
                                <th class="tb-font-black">Weight</th>
                                <th class="tb-font-black">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <s:iterator value="trucks" var="truck">
                                <tr>
                                    <td class="tb-font-black"><s:checkbox name="a" theme="simple" /></td>
                                    <td class="tb-font-black"><s:property value="truckCode" /></td>
                                    <td class="tb-font-black"><s:property value="truckType" /></td>
                                    <td class="tb-font-black"><s:property value="plateNumber" /></td>
                                    <td class="tb-font-black"><s:property value="modelNumber" /></td>
                                    <td class="tb-font-black"><s:property value="modelYear" /></td>
                                    <td class="tb-font-black"><s:property value="engineNumber" /></td>
                                    <td class="tb-font-black"><s:property value="grossWeight" /></td>
                                    <td class="tb-font-black">
                                        <s:url var="editTrucksUrl" action="loadEditTrucksPage">
                                            <s:param name="truckCodeParam" value="truckCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editTrucksUrl}" rel="tooltip" title="Edit this truck">
                                            <img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>
                                        <s:url var="deleteTrucksUrl" action="deleteTrucks">
                                            <s:param name="truckCodeParam" value="truckCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteTrucksUrl}" rel="tooltip" title="Delete this Truck" onclick="return confirm('Do you really want to delete?');">
                                            <img src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                    </td>
                                </tr>

                            </s:iterator>
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

    </div>
