<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left:-40px;">Trucks Module</h1>

    <div class="row alert alert-success alert-dismissable" style="margin-left: -40px !important;  width: 101%;">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Success!</strong> The data has been successfully saved.
    </div>

    <div class="row">
        <div class="col-md-12" style="margin-left:-25px;">
            <div class="panel panel-info">

                <div class="panel-heading">

                    <img src="includes/images/listofusers.png" class="box-icon"/> <span
                        class="panel-title">List of Trucks</span>

                </div>

                <div class="panel-body">
                    <div class="table-responsive list-table">
                        <table class="table table-striped table-bordered text-center">
                            <thead>
                            <tr class="header_center">
                                <th class="tb-font-black"><input type="checkbox"/></th>
                                <th class="tb-font-black">Number</th>
                                <th class="tb-font-black">Vessel Name</th>
                                <th class="tb-font-black">Model Number</th>
                                <th class="tb-font-black">Model Year</th>
                                <th class="tb-font-black">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <s:iterator value="vessels" var="vessel">

                                <tr>
                                        <%--<input type="checkbox" />--%>
                                    <td class="tb-font-black"><s:checkbox name="a" theme="simple"/></td>
                                    <td class="tb-font-black"><s:property value="vesselNumber"/></td>
                                    <td class="tb-font-black"><s:property value="vesselName"/></td>
                                    <td class="tb-font-black"><s:property value="modelNumber"/></td>
                                    <td class="tb-font-black"><s:property value="modelYear"/></td>
                                    <td class="tb-font-black">

                                        <s:url var="editVesselUrl" action="loadEditVesselsPage">
                                            <s:param name="vesselIdParam" value="vesselId"></s:param>

                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVesselUrl}" rel="tooltip"
                                             title="Edit this vessel">
                                            <img src="includes/images/edit-user.png"
                                                 class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteVesselUrl" action="deleteVessels">
                                            <s:param name="vesselIdParam" value="vesselId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVesselUrl}" rel="tooltip"
                                             title="Delete this Vendor"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="includes/images/remove-user.png"
                                                 class="icon-action circ-icon"> </s:a>
                                    </td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel-footer">
                        <span class="pull-right">
                            <s:url var="addTrucksUrl" action="loadAddTrucksPage">
                                <s:param name="vendorIdParam" value="vendorIdParam"></s:param>
                            </s:url>
                        <s:a href="%{addTrucksUrl}" cssClass="side-help" style="font-size: 15px;"><img
                                src="includes/images/add-user.png" class="icon-action circ-icon"></s:a>
                        </span>

                    <ul class="pagination">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li class="disabled"><a href="#">&raquo;</a></li>
                    </ul>

                </div>

            </div>
        </div>
    </div>

</div>
