<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->


    <div class="panel booking panel-info">
        <div class="booking panel-heading"> <img src="images/add-user.png" class="box-icon"> <span class="booking panel-title">Add Customer - Items</span> </div>
        <div class="panel-body">
            <div class="table-responsive list-table">
                <s:form cssClass="form-horizontal" theme="bootstrap" action="editItem">
                <s:hidden name="item.customerItemsId" value="%{customersItemIdParam}" />
                <div class="form-group">
                    <div class="form-group">
                        <label for="item.itemName" class="col-sm-2 control-label" style="width:25%;">Item Name :</label>
                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="item.itemName" id="item.itemName" required="true" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="item.itemCode" class="col-sm-2 control-label" style="width:25%;">Item Code :</label>
                        <div class="col-sm-10" style="width: 31%;">
                            <s:textfield name="item.itemCode" id="item.itemCode" required="true" cssClass="form-control" style="150px" />
                        </div>
                        <label for="item.srp" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">SRP :</label>
                        <div class="col-sm-10" style="width: 34.5%;">
                            <s:textfield  name="item.srp" id="item.srp" required="true" cssClass="form-control" style="150px" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="item.length" class="col-sm-2 control-label" style="width:25%;">Length :</label>
                        <div class="col-sm-10" style="width: 31%;">
                            <s:textfield name="item.length" id="item.length" required="true" cssClass="form-control" style="150px" />
                        </div>
                        <label for="item.width" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">Width :</label>
                        <div class="col-sm-10" style="width: 32.8%;">
                            <s:textfield name="item.width" id="item.width" required="true" cssClass="form-control" style="150px" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="item.criticalQuality" class="col-sm-2 control-label" style="width:25%;">Critical Quality :</label>
                        <div class="col-sm-10" style="width: 31%;">
                            <s:textfield name="item.criticalQuality" id="item.criticalQuality" required="true" cssClass="form-control" style="150px" />
                        </div>
                        <label for="item.height" style="float:left;margin-top: 0;margin-bottom: 0;padding-top: 7px;">Height :</label>
                        <div class="col-sm-10" style="width: 31.8%;">
                            <s:textfield name="item.height" id="item.height" required="true" cssClass="form-control" style="150px" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="item.basePrice" class="col-sm-2 control-label" style="width:25%;">Base Price :</label>
                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="item.basePrice" id="item.basePrice" required="true" cssClass="form-control"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="item.note" class="col-sm-2 control-label" style="width:25%;">Note</label>
                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="item.note" id="item.note" required="true" cssClass="form-control"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="item.description" class="col-sm-2 control-label" style="width:25%;">Description</label>
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

--%>


<div class="row">
    <div class="col-lg-12">
        <h1>Customer Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a></li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer Profile</a></li>
            <li class="active"><a href="<s:url action='viewItem' />"><i class="fa fa-list-ol"></i> Items</a></li>
            <li class="active"><i class="fa fa-pencil"></i> Edit Item</li>
        </ol>

    </div>
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-10">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Item</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form theme="bootstrap" cssClass="form-horizontal" action="editItem">
                    <s:hidden name="item.customerItemsId" value="%{customersItemIdParam}" />
                        <!-- Text input-->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label" for="textinput">Item Name:</label>
                            <div class="col-sm-4">
                                <s:textfield name="item.itemName" id="item.itemName" required="true" cssClass="form-control"/>
                            </div>

                            <label class="col-sm-2 control-label" for="textinput">Item Code:</label>
                            <div class="col-sm-4">
                                <s:textfield name="item.itemCode" id="item.itemCode" required="true" cssClass="form-control" />
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Base Price:</label>
                            <div class="col-sm-4">
                                <s:textfield name="item.basePrice" id="item.basePrice" required="true" cssClass="form-control"  />
                            </div>

                            <label class="col-sm-2 control-label" for="textinput">SRP:</label>
                            <div class="col-sm-4">
                                <s:textfield  name="item.srp" id="item.srp" required="true" cssClass="form-control" />
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Critical Quality:</label>
                            <div class="col-sm-4">
                                <s:textfield name="item.criticalQuality" id="item.criticalQuality" required="true" cssClass="form-control" />
                            </div>

                            <label class="col-sm-2 control-label" for="textinput">Lenght: </label>
                            <div class="col-sm-4">
                                <s:textfield name="item.length" id="item.length" required="true" cssClass="form-control" style="150px" />
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Width:</label>
                            <div class="col-sm-4">
                                <s:textfield name="item.width" id="item.width" required="true" cssClass="form-control" />
                            </div>

                            <label class="col-sm-2 control-label" for="textinput">Height: </label>
                            <div class="col-sm-4">
                                <s:textfield name="item.height" id="item.height" required="true" cssClass="form-control" />
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="textinput">Description:</label>
                            <div class="col-sm-4">
                                <s:textarea name="item.description" id="item.description" required="true" resize="none" style="resize:none" rows="3" cssClass="form-control"  />
                            </div>

                            <label class="col-sm-2 control-label" for="textinput">Note: </label>
                            <div class="col-sm-4">
                                <s:textarea name="item.note" id="item.note" required="true" cssClass="form-control" style="resize:none" rows="3" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="pull-right">

                                    <button type="submit" class="btn btn-info">Save</button>
                                </div>
                            </div>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li class="active"><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>

            </ul>
        </div>
    </div>
</div><!-- /.row -->



