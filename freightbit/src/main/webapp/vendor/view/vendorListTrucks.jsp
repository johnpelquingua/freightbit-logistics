<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building"></i> Vendor Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"> Trucks</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>
<s:if test="hasActionErrors()">
   <div class="col-lg-12">
	   <div class="alert alert-errors">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
   			<strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
		</div>
   </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Trucks List</h3>
                <span class="pull-right">
                    <%--<a href="loadAddTrucksPage" class="icon-action-link" rel="tooltip" title="Add Driver">
                        <img src="../includes/images/add-user.png" class="icon-action circ-icon">
                    </a>--%>
                    <button type="button" class="btn btn-primary" onclick="location.href='loadAddTrucksPage'">
                        <i class="fa fa-truck"></i> New Truck
                    </button>
                </span>
            </div>

            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-10">

                        <div class="table-responsive list-table">

                            <tbody>
                            <table>
                                <tr>
                                    <display:table id="truck" name="trucks" requestURI="viewTrucks.action" pagesize="10"
                                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px;">
                                        <td><display:column property="plateNumber" title="Plate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="truckCode" title="LTO Certificate Number <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="engineNumber" title="Make <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="modelNumber" title="Model <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="truckType" title="Body Type <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td><display:column property="grossWeight" title="Gross Weight <i class='fa fa-sort' />" class="tb-font-black"
                                                            style="text-align: center;"> </display:column></td>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">

                                                <s:url var="editTruckUrl" action="loadEditTrucksPage">
                                                    <s:param name="truckCodeParam" value="#attr.truck.truckCode"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{editTruckUrl}" rel="tooltip"
                                                     title="Edit Truck">
                                                     <i class="fa fa-pencil"></i>
                                                </s:a>

                                                <s:url var="deleteTruckUrl" action="deleteTrucks">
                                                    <s:param name="truckCodeParam" value="#attr.truck.truckCode"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteTruckUrl}" rel="tooltip"
                                                     title="Delete Truck"
                                                     onclick="return confirm('Do you really want to delete?');">

                                                </s:a>
                                                <i class="fa fa-trash-o deleteVendorTruckingTruckIcon"></i>
                                                <s:url var="viewInfoTruckUrl" action="viewInfoTruck">
                                                    <s:param name="truckCodeParam" value="#attr.truck.truckCode"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{viewInfoTruckUrl}" rel="tooltip"
                                                     title="View Truck Info">
                                                     <i class="fa fa-info-circle"></i>
                                                </s:a>

                                            </display:column>
                                        </td>
                                    </display:table>
                                </tr>
                            </table>
                            </tbody>

                        </div>
                        </div>

                    <div class="col-lg-2">
                        <div class="panel panel-info" >
                            <%--<div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>
                            </div>--%>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <a href="viewInfoVendor" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                        <a href="viewTruckingAddress" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                        <a href="viewVendorTruckingContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>
                                        <a href="viewDrivers" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Drivers</a>
                                        <a href="#" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-truck fa-fw"></i> <br/>Trucks</a>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    </div>
            </div>



            <div class="panel-footer">
                <span class="pull-right">
                    <%--<a href="loadAddTrucksPage" class="icon-action-link" rel="tooltip" title="Add Driver">
                        <img src="../includes/images/add-user.png" class="icon-action circ-icon">
                    </a>--%>
                    <button type="button" class="btn btn-primary" onclick="location.href='loadAddTrucksPage'">
                        <i class="fa fa-truck"></i> New Truck
                    </button>
                </span>

                <div class="table-responsive" >
                    <div class="col-lg-12" style="position:relative;margin-top: -28px;">
                        <table class="col-lg-6">
                            <tr>
                                <td><label>Legend:</label></td>
                                <td><i class="fa fa-pencil"></i> Edit</td>
                                <td><i class="fa fa-trash-o"></i> Delete</td>
                                <td><i class="fa fa-info-circle"></i> Information</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%--<div class="col-lg-3">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li class="active"><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>--%>

</div>

<div class="modal fade" id="deleteVendorTruckingTruckModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Delete Trucking Vendor Truck</span>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this trucking vendor truck ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmDeleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        actionConfirmation($('.deleteVendorTruckingTruckIcon'), $('.confirmDeleteModalBtn'), $('#deleteVendorTruckingTruckModal'));
    });
</script>