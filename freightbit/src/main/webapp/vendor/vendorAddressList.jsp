<%@ taglib prefix="s" uri="/struts-tags" %>
    <h1 class="page-header">Vendor Module</h1>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">

                <div class="panel-heading">

                    <img src="includes/images/listofusers.png" class="box-icon"/> <span class="panel-title">List of Vendors</span>
                </div>

                <div class="panel-body">
                    <div class="table-responsive list-table">
                    							<table class="table table-striped table-bordered text-center" id="customer-list">
                    							  <thead>
                    								<tr class="header_center">
                    								  <th class="tb-font-black">Address ID</th>
                    								  <th class="tb-font-black">Reference ID</th>
                    								  <th class="tb-font-black">Reference Table</th>
                    								  <th class="tb-font-black">Address Type</th>
                                                      <th class="tb-font-black">City</th>
                    								  <th class="tb-font-black">State</th>
                    								  <th class="tb-font-black">Zip</th>
                    								  <th class="tb-font-black">Action</th>
                    								</tr>
                    							  </thead>
                    							  <tbody>
                    							  <s:iterator value="addresses" var="address" >
                    								<tr>

                                                        <td class="tb-font-black"><s:property value="addressId" /></td>
                                                        <td class="tb-font-black"><s:property value="referenceId" /></td>
                                                        <td class="tb-font-black"><s:property value="referenceTable" /></td>
                                                        <td class="tb-font-black"><s:property value="addressType" /></td>
                                                        <td class="tb-font-black"><s:property value="city" /></td>
                                                        <td class="tb-font-black"><s:property value="state" /></td>
                                                        <td class="tb-font-black"><s:property value="zip" /></td>

                                                        <td>

                                                     <s:url var="loadEditVendorAddressUrl" action="vendorAddressEdit">
                                                    <s:param name="vendorIdParam" value="%{vendorIdParam}"></s:param>
                                                    </s:url>
                                                    <s:a href="%{loadEditVendorAddressUrl}" class="icon-action-link" rel="tooltip" title="Edit this Vendor Address"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>

                                                    <s:url var="deleteVendorAddressUrl" action="vendorDeleteAddress">
                                                         <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{deleteVendorAddressUrl}" rel="tooltip" title="Delete this Vendor Address" onclick="return confirm('Do you really want to delete?');"><img src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                                        </td>
                    								</tr>
                                                    </s:iterator>
                    							  </tbody>
                    							</table>
                    </div>
                    <s:url var="loadVendorAddAddressPage" action="loadVendorAddAddressPage">
                        <s:param name="vendorIdParam" value="%{vendorIdParam}"></s:param>
                    </s:url>
                    <s:a cssClass="icon-action-link pull-right" href="%{loadVendorAddAddressPage}" rel="tooltip"><img src="includes/images/add-user.png" class="icon-action circ-icon"> </s:a>

                </div>
            </div>
        </div>
    </div>
