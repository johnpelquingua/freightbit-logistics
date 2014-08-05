<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- END OF THE MIDDLE -->

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Update Status</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i>List of On-going Booking</li>
            <li class="active"><i class="fa fa-plus"></i> Update Status</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <span class="panel-title">Details</span>
            </div>

            <div class="panel-body">

                <s:form cssClass="form-horizontal" theme="bootstrap" action="updateStatus">
                    <s:hidden name="orderItem.orderItemIdParam" value="%{orderItemIdParam}"/>

                    <div class="form-group">

                        <label for="orderItem.voyageNumber" class="col-sm-2 control-label">Booking Number:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="orderItem.voyageNumber" value="MTY-1035"
                                   disabled>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="orderItem.voyageNumber" class="col-sm-2 control-label">Booking Number:</label>

                        <div class="col-sm-10">
                            <s:textfield name="orderItem.nameSize" cssClass="form-control"/>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="orderItem.status" class="col-sm-2 control-label"> Status</label>

                        <div class="col-sm-10">
                            <s:select list="orderStatusList" listValue="value" listKey="key"
                                      name="orderItem.status" id="orderItem.status"
                                      value="orderItem.status"
                                      cssClass="form-control" emptyOption="true"></s:select>
                        </div>

                    </div>

                    <div style="float: right;">
                        <s:submit value="SUBMIT"></s:submit>
                    </div>

                </s:form>

            </div>


        </div>

    </div>
</div>
<!-- /.row -->