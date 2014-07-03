<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header" style="margin-left:-40px;">Driver Module</h1>

    <div class="row">
        <div class="col-md-12" style="margin-left:-25px;">
            <div class="panel panel-info">

                <div class="panel-heading">

                    <img src="includes/images/listofusers.png" class="box-icon"/> <span
                        class="panel-title">List of Drivers</span>

                </div>

                <div class="panel-body">
                    <div class="table-responsive list-table">
                        <table class="table table-striped table-bordered text-center">
                            <thead>
                            <tr class="header_center">
                                <th class="tb-font-black"><input type="checkbox"/></th>
                                <th class="tb-font-black">Driver Code</th>
                                <th class="tb-font-black">License Number</th>
                                <th class="tb-font-black">Last Name</th>
                                <th class="tb-font-black">First Name</th>
                                <th class="tb-font-black">Middle Name</th>
                                <th class="tb-font-black">Title</th>
                                <th class="tb-font-black">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <s:iterator value="drivers" var="driver">

                                <tr>
                                        &lt;%&ndash;<input type="checkbox" />&ndash;%&gt;
                                    <td class="tb-font-black"><s:checkbox name="a" theme="simple"/></td>
                                    <td class="tb-font-black"><s:property value="driverCode"/></td>
                                    <td class="tb-font-black"><s:property value="licenseNumber"/></td>
                                    <td class="tb-font-black"><s:property value="firstName"/></td>
                                    <td class="tb-font-black"><s:property value="lastName"/></td>
                                    <td class="tb-font-black"><s:property value="middleName"/></td>
                                    <td class="tb-font-black"><s:property value="title"/></td>
                                    <td class="tb-font-black">

                                        <s:url var="editVendorDriverUrl" action="loadEditDriverPage">
                                            <s:param name="driverCodeParam" value="driverCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVendorDriverUrl}" rel="tooltip"
                                             title="Edit this Driver">
                                            <img src="includes/images/edit-user.png"
                                                 class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteVendorDriverUrl" action="deleteDriver">
                                            <s:param name="driverCodeParam" value="driverCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVendorDriverUrl}" rel="tooltip"
                                             title="Delete this Driver"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="includes/images/remove-user.png"
                                                 class="icon-action circ-icon"> </s:a>
                                    </td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel-footer">
                        <span class="pull-right"> <a href="loadAddDriverPage"
                                                     class="icon-action-link" rel="tooltip" title="Add Vendor"><img
                                src="includes/images/add-user.png" class="icon-action circ-icon">
                        </a>
                        </span>

                    <ul class="pagination">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li class="disabled"><a href="#">&raquo;</a></li>
                    </ul>

                </div>

            </div>
        </div>
    </div>

</div>--%>


<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor List Drivers </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> <i class="fa fa-info-circle"></i> Vendor
                Profile</a></li>
            <li class="active"><i class="fa fa-group"></i> Drivers</li>
        </ol>
    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<!-- /.row -->
<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-group"></i> Drivers</h3>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <%--<table class="table table-striped table-bordered text-center table-hover">
                        <thead>
                        <tr class="header_center">
                            &lt;%&ndash;<th class="tb-font-black"><input type="checkbox"/></th>&ndash;%&gt;
                            <th class="tb-font-black" style="text-align: center;">Driver Code <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">License Number <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Last Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">First Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Middle Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Title <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="drivers" var="driver">
                            <tr>
                                    &lt;%&ndash;<td class="tb-font-black"><s:checkbox name="a" theme="simple"/></td>&ndash;%&gt;
                                <td class="tb-font-black">
                                    <s:property value="driverCode"/>
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="licenseNumber"/>
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="firstName"/>
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="lastName"/>
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="middleName"/>
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="title"/>
                                </td>
                                <td class="tb-font-black">
                                    <s:url var="editVendorDriverUrl" action="loadEditDriverPage">
                                        <s:param name="driverCodeParam" value="driverCode"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editVendorDriverUrl}" rel="tooltip"
                                         title="Edit this Driver">
                                        <img src="includes/images/edit-user.png"
                                             class="icon-action circ-icon">
                                    </s:a>
                                    <s:url var="deleteVendorDriverUrl" action="deleteDriver">
                                        <s:param name="driverCodeParam" value="driverCode"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteVendorDriverUrl}" rel="tooltip"
                                         title="Delete this Driver"
                                         onclick="return confirm('Do you really want to delete?');">
                                        <img src="includes/images/remove-user.png"
                                             class="icon-action circ-icon">
                                    </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>--%>

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="driver" name="drivers" requestURI="/viewDrivers.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="driverCode" title="Driver Code" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="licenseNumber" title="License Number"
                                                    class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="title" title="Title" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="lastName" title="Last Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="firstName" title="First Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="middleName" title="Middle Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editVendorDriverUrl" action="loadEditDriverPage">
                                            <s:param name="driverCodeParam" value="#attr.driver.driverCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVendorDriverUrl}" rel="tooltip"
                                             title="Edit this Driver">
                                            <img src="includes/images/edit-user.png"
                                                 class="icon-action circ-icon">
                                        </s:a>
                                        <s:url var="deleteVendorDriverUrl" action="deleteDriver">
                                            <s:param name="driverCodeParam" value="#attr.driver.driverCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVendorDriverUrl}" rel="tooltip"
                                             title="Delete this Driver"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="includes/images/remove-user.png"
                                                 class="icon-action circ-icon">
                                        </s:a>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>

                </div>
            </div>
            <div class="panel-footer">
            <span class="pull-right"> <a href="loadAddDriverPage"
                                         class="icon-action-link" rel="tooltip" title="Add Vendor"><img
                    src="includes/images/add-user.png" class="icon-action circ-icon">
            </a>
            </span>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li class="active"><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li <%--class="active"--%>><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- /.row -->