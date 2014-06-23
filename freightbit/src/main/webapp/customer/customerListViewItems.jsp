<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
  <h1 class="page-header">Customer Profile</h1>

  <!-- MAIN BOX -->

  				  <div class="panel panel-info">

  					  <div class="panel-heading">
  					  	<img src="includes/images/listofusers.png" class="box-icon"/>
  						<span class="panel-title">List of Items</span>

  					  </div>

  					  <div class="panel-body">
  						<div class="table-responsive list-table">
  							<table class="table table-striped table-bordered text-center">
  							  <thead>
  								<tr class="header_center">
  								  <th class="tb-font-black">Item ID</th>
                                  <th class="tb-font-black">Customer ID</th>
  								  <th class="tb-font-black">Item Name</th>
  								  <th class="tb-font-black">Item Code</th>
  								  <th class="tb-font-black">Length</th>
  								  <th class="tb-font-black">Width</th>
                                  <th class="tb-font-black">Height</th>
  								  <th class="tb-font-black">SRP</th>
  								  <th class="tb-font-black">Critical Quality</th>
  								  <th class="tb-font-black">Base Price</th>
  								  <th class="tb-font-black">Note</th>
  								  <th class="tb-font-black">Description </th>
  								  <th class="tb-font-black">Action</th>
  								</tr>
  							  </thead>
  							  <tbody>
                              <s:iterator value="items" var="item">
                              <tr>
                                <td class="tb-font-black"><s:property value="customerItemsId" /></td>
                                <td class="tb-font-black"><s:property value="customerId" /></td>
                                <td class="tb-font-black"><s:property value="itemName" /></td>
                                <td class="tb-font-black"><s:property value="itemCode" /></td>
                                <td class="tb-font-black"><s:property value="length" /></td>
                                <td class="tb-font-black"><s:property value="width" /></td>
                                <td class="tb-font-black"><s:property value="height" /></td>
                                <td class="tb-font-black"><s:property value="srp" /></td>
                                <td class="tb-font-black"><s:property value="criticalQuality" /></td>
                                <td class="tb-font-black"><s:property value="basePrice" /></td>
                                <td class="tb-font-black"><s:property value="Note" /></td>
                                <td class="tb-font-black"><s:property value="Description" /></td>
                                <td class="tb-font-black">

                                    <s:url var="editItemUrl" action="editItem">
                                    <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editItemUrl}" rel="tooltip" title="Edit this driver">
                                    <img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteItemUrl" action="deleteItem">
                                        <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip" title="Delete this Item?" onclick="return confirm('Do you really want to delete?');">
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



