<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
  <h1 class="page-header">Customer Profile</h1>

  <!-- MAIN BOX -->


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


</div>



