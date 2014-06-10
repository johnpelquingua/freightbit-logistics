<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
  <h1 class="page-header">Customer Profile</h1>

  <!-- MAIN BOX -->

  <div class="main-box">
    <div class="panel booking panel-info">
      <div class="booking panel-heading"> <img src="images/add-user.png" class="box-icon"> <span class="booking panel-title">Add Customer - Items</span> </div>
      <div class="panel-body">
        <div class="table-responsive list-table">
          <s:form cssClass="form-horizontal" theme="bootstrap" action="addItem">
          <div class="form-group">
            <div class="form-group">
              <label for="ctype" class="col-sm-2 control-label" style="width:25%;">Item Name :</label>
              <div class="col-sm-10" style="width:70%;">
                <s:textfield name="item.itemName" id="item.itemName" required="true" cssClass="form-control"/>
              </div>
            </div>
            <div class="form-group">
              <label for="icode" class="col-sm-2 control-label" style="width:25%;">Item Code :</label>
              <div class="col-sm-10" style="width: 31%;">
                <s:textfield name="item.itemCode" id="item.itemCode" required="true" cssClass="form-control" style="150px" />
              </div>
              <label for="srp" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">SRP :</label>
              <div class="col-sm-10" style="width: 34.5%;">
                <s:textfield  name="item.srp" id="item.srp" required="true" cssClass="form-control" style="150px" />
              </div>
            </div>
            <div class="form-group">
              <label for="length" class="col-sm-2 control-label" style="width:25%;">Length :</label>
              <div class="col-sm-10" style="width: 31%;">
                <s:textfield name="item.length" id="item.length" required="true" cssClass="form-control" style="150px" />
              </div>
              <label for="width" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">Width :</label>
              <div class="col-sm-10" style="width: 32.8%;">
                <s:textfield name="item.width" id="item.width" required="true" cssClass="form-control" style="150px" />
              </div>
            </div>
            <div class="form-group">
              <label for="cquality" class="col-sm-2 control-label" style="width:25%;">Critical Quality :</label>
              <div class="col-sm-10" style="width: 31%;">
                <s:textfield name="item.criticalQuality" id="item.criticalQuality" required="true" cssClass="form-control" style="150px" />
              </div>
              <label for="height" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">Height :</label>
              <div class="col-sm-10" style="width: 31.8%;">
                <s:textfield name="item.height" id="item.height" required="true" cssClass="form-control" style="150px" />
              </div>
            </div>
            <div class="form-group">
              <label for="bprice" class="col-sm-2 control-label" style="width:25%;">Base Price :</label>
              <div class="col-sm-10" style="width:70%;">
                <s:textfield name="item.basePrice" id="item.basePrice" required="true" cssClass="form-control"  />
              </div>
            </div>
            <div class="form-group">
              <label for="note" class="col-sm-2 control-label" style="width:25%;">Note</label>
              <div class="col-sm-10" style="width:70%;">
                <s:textfield name="item.note" id="item.note" required="true" cssClass="form-control"  />
              </div>
            </div>
            <div class="form-group">
              <label for="desc" class="col-sm-2 control-label" style="width:25%;">Description</label>
              <div class="col-sm-10" style="width:70%;">
                <s:textfield name="item.description" id="item.description" required="true" cssClass="form-control"  />
              </div>
            </div>
            <hr>
            <div class="col-sm-10 pull-right" style="width:70%;"> <a href="customerList" class="btn btn-default" id ="groups-btn">Back</a>
              <s:submit name="submit" cssClass="btn btn-default" value="Save" />
              <a href="customerList" class="btn btn-default" id ="groups-btn">Next</a> </div>
            </s:form>
          </div>
        </div>
      </div>
    </div>
    <div class="sidebar-box">
      <div class="panel booking panel-info">
        <div class="booking panel-heading"> <img src="images/calendar.png" class="box-icon"> <span class="booking panel-title">Process</span> </div>
        <div class="panel-body">
          <ul class="nav">
            <li><a href="customer-add.html" class="side-help"><img src="images/1.png" class="img-sidehelp">Personal Information</a></li>
            <li><a href="customer-add2.html" class="side-help"><img src="images/2.png" class="img-sidehelp">Contact Person</a></li>
            <li><a href="customer-add3.html" class="side-help"><img src="images/3.png" class="img-sidehelp">Address</a></li>
            <li><a href="customer-add4.html" class="side-help"><img src="images/4.png" class="img-sidehelp">Items</a></li>
            <li><a href="customer-add5.html" class="side-help"><img src="images/5.png" class="img-sidehelp">Documents</a></li>
            <li><a href="customer-add7.html" class="side-help"><img src="images/6.png" class="img-sidehelp">Rates</a></li>
            <li><a href="customer-add6.html" class="side-help"><img src="images/7.png" class="img-sidehelp">Consignee Infomation</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
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
                                    <s:param name="customersItemIdParam" value="customerItemsId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editItemUrl}" rel="tooltip" title="Edit this driver">
                                    <img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>
                                    <s:url var="deleteItemUrl" action="deleteItem">
                                        <s:param name="customersItemIdParam" value="customerItemsId"></s:param>
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
</div>



