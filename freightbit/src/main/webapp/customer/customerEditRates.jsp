<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Rates Profile</h1>

    <!-- MAIN BOX -->

    <div class="main-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="booking panel-title">Add Rates</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="editRates">
                    <s:hidden name="rates.customerRateId" value="%{customerRateId}" />
                    <div class="form-group">
                        <label for="rates.origin" class="col-sm-2 control-label" style="width:25%;">Origin:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="rate.origin" cssClass="form-control" id="rates.origin"
                                         placeholder="Origin"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rates.destination" class="col-sm-2 control-label"
                               style="width:25%;">Destination:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="rate.destination" cssClass="form-control" id="rates.destination"
                                         placeholder="Destination"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rates.rate" class="col-sm-2 control-label" style="width:25%;">Rate:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="rate.rate" cssClass="form-control" id="rates.rate" placeholder="Rate"/>
                        </div>
                    </div>

                    <div class="form-group">

                        <label for="rates.rateType" class="col-sm-2 control-label" style="width:25%;">Address
                            Type</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:select name="rate.rateType" list="rateTypeList" listValue="value" listKey="key"
                                      cssClass="form-control" id="rates.rateType" emptyOption="true"/>
                        </div>
                    </div>

                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button class="btn btn-default">Cancel</button>
                    <s:submit cssClass="btn btn-default" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>


