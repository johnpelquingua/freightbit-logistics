<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Sea Freight Planning</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i>List of Bookings</li>
            <li class="active"><i class="fa fa-male"></i>List of Items / Containers</li>
            <li class="active"><i class="fa fa-male"></i>Sea Freight Planning</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i><c:out
                        value="${sessionScope.nameSizeParam}"/></h3>
            </div>

            <div class="panel-body">

                <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap">

                    <s:hidden name="operationsBean.orderItemParam" value="%{orderItemIdParam}"/>
                    <s:hidden name="operationsBean.nameSizeParam" value="%{nameSizeParam}"/>

                    <div class="form-group">


                        <label for="operations.nameSizeParam" class="col-sm-2 control-label">Container Number:</label>

                        <div class="col-sm-10">
                            <div class="form-control">
                                <c:out value="${sessionScope.nameSizeParam}"/>
                            </div>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="operationsBean.vendorList" class="col-sm-2 control-label">Vendor:</label>

                        <div class="col-sm-10">
                            <div style="width:90%;float:left;padding-right:10px;">
                                <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                          id="operationsBean.vendorList"
                                          listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                          emptyOption="true"
                                        ></s:select>
                            </div>
                            <div style="width:5%;float:left;">
                                <a href="../vendor/loadAddVendorPage" class="icon-action-link">
                                    <img src="../includes/images/add-sched.png" class="icon-action circ-icon">
                                </a>
                            </div>
                        </div>

                    </div>

                    <s:submit cssClass="btn btn-default btn-info pull-right" name="submit" value="Search"/>

                </s:form>

                <div class="form-group">

                    <hr>
                    <center><h4>List of Schedules</h4></center>
                    <hr>

                </div>

                <display:table id="vesselSchedule" name="vesselSchedules"
                               requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                               class="table table-striped table-hover table-bordered text-center tablesorter"
                               style="margin-top: 15px;">
                    <td><display:column><input type="radio"/></display:column></td>

                    <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                        style="text-align: center;"> </display:column></td>

                    <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                        style="text-align: center;"> </display:column></td>

                    <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                        style="text-align: center;"> </display:column></td>

                    <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                        style="text-align: center;"> </display:column></td>

                    <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                        style="text-align: center;"> </display:column></td>
                </display:table>


                <div style="float: right;">
                    <button class="btn btn-default" onclick="location.href='inland-operation.html'">Save</button>
                    <button class="btn btn-default" onclick="location.href='inland-operation.html'">Cancel</button>
                </div>

            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    $("#date").datepicker({dateFormat: 'yy-dd-mm'});
</script>