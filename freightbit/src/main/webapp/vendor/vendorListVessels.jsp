<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left:-40px;">Vessel Module</h1>

    <div class="row">
        <div class="col-md-12" style="margin-left:-25px;">
            <div class="panel panel-info">

                <div class="panel-heading">

                    <img src="includes/images/listofusers.png" class="box-icon"/> <span
                        class="panel-title">List of Vessels</span>

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
                                            <s:param name="vesselNameParam" value="vesselName"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVesselUrl}" rel="tooltip"
                                             title="Edit this vessel">
                                            <img src="includes/images/edit-user.png"
                                                 class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteVesselUrl" action="deleteVessels">
                                            <s:param name="vesselNameParam" value="vesselName"></s:param>
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
                            <a href="loadAddVesselsPage" class="side-help" style="font-size: 15px;"><img
                                    src="includes/images/add-user.png" class="icon-action circ-icon"></a>
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
