<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">List of Address</h1>

    <div class="row alert alert-success alert-dismissable" style="margin-left: -40px !important;  width: 101%;">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Success!</strong> The data has been successfully saved.
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">

                <div class="panel-heading">

                    <img src="includes/images/listofusers.png" class="box-icon"/> <span class="panel-title">List of Adress</span>
                </div>

                <div class="panel-body">
                    <div class="table-responsive list-table">
                        <table class="table table-striped table-bordered text-center" id="customer-list">
                            <thead>
                            <tr class="header_center">
                                <th class="tb-font-black">Address Type</th>
                                <th class="tb-font-black">Address 1</th>
                                <th class="tb-font-black">Address 2</th>
                                <th class="tb-font-black">City</th>
                                <th class="tb-font-black">State</th>
                                <th class="tb-font-black">Zip</th>
                                <th class="tb-font-black">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <s:iterator value="addresss" var="address">
                                <tr>
                                    <td class="tb-font-black"><s:property value="addressType"/></td>
                                    <td class="tb-font-black"><s:property value="addressLine1"/></td>
                                    <td class="tb-font-black"><s:property value="addressLine2"/></td>
                                    <td class="tb-font-black"><s:property value="city"/></td>
                                    <td class="tb-font-black"><s:property value="state"/></td>
                                    <td class="tb-font-black"><s:property value="zip"/></td>

                                    <td>

                                        <s:url var="loadEditTruckingAddressUrl" action="loadEditTruckingAddress">
                                            <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                        </s:url>
                                        <s:a href="%{loadEditTruckingAddressUrl}" class="icon-action-link" rel="tooltip"
                                             title="Edit this Vendor Address"><img src="includes/images/edit-user.png"
                                                                                   class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteAddressUrl" action="deleteTruckingAddress">
                                            <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                             title="Delete this Vendor Address"
                                             onclick="return confirm('Do you really want to delete?');"><img
                                                src="includes/images/remove-user.png"
                                                class="icon-action circ-icon"> </s:a>
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

            <span class="pull-right">
                <s:url var="loadAddAddressUrl" action="loadAddTruckingAddress">
                    <s:param name="vendorIdParam" value="vendorIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

                </div>

            </div>
        </div>
    </div>
</div>
