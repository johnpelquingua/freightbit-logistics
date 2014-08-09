<%--
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-sm-3 col-md-2 sidebar">

  <ul class="nav nav-sidebar">

    <ul id="css3menu1" class="topmenu" style="padding:0;">
        <li class="topfirst"><a href="#" class="icon-home"><span class="icon-font">Dashboard</span></a></li>
        <li class="topmenu "><a href="<s:url action='viewOrders' />" class="icon-booking"><span class="icon-font">Booking</span></a></li>
        <li class="topmenu"><a href="#" class="icon-operation"><span class="icon-font">Operations</span></a></li>
        <li class="topmenu"><a href="#" class="icon-document"><span class="icon-font">Documentations</span></a></li>
        <li class="topmenu"><a> class="icon-vendor"><span class="icon-font">Vendor</span></a>
            <ul>
                <li class="subfirst"><a href="<s:url action='loadSearchVendorPage' />" class="icon-vendor"><span class="icon-font">Search Vendor</span></a></li>
                <li class="subfirst"><a href="<s:url action='loadAddVendorPage' />" class="icon-vendor"><span class="icon-font">Add Vendor</span></a></li>
            </ul>
        </li>

        <li class="topmenu"><a class="icon-customer "><span class="icon-font">Customer</span></a>
            <ul>
                <li class="subfirst"><a href="<s:url action='loadSearchCustomerPage' />" class="icon-vendor"><span class="icon-font">Search Customer</span></a></li>
                <li class="subfirst"><a href="<s:url action='loadAddCustomerPage' />" class="icon-vendor"><span class="icon-font">Add Customer</span></a></li>
            </ul>
            </li>
        <li class="topmenu activeaccounts"><a class="icon-account"><span class="icon-font">Accounts</span></a>
            <ul>
                <li class="subfirst"><a href="<s:url action='loadSearchUserPage' />" class="icon-user"><span class="icon-font">Users</span></a></li>
                <li class="subfirst"><a href="<s:url action='viewGroups' />" class="icon-group"><span class="icon-font">Groups</span></a></li>
                <li class="subfirst"><a href="<s:url action='viewPermissions' />" class="icon-permission"><span class="icon-font">Permissions</span></a></li>
            </ul>
        </li>
        <li id="report" class="topmenu"><a class="icon-report"><span class="icon-font">Reports</span></a>
                   <ul>
                        <li class="subfirst"><a href="#" ><span class="icon-font">Truck</span></a></li>
                        <li class="subfirst"><a href="#"><span class="icon-font">Container</span></a></li>
                        <li class="subfirst"><a href="#"><span class="icon-font">Cargo</span></a></li>
                        <li class="subfirst"><a href="#" class="icon-group"><span class="icon-font">Customer Relation</span></a></li>
                        <li class="subfirst"><a href="#" ><span class="icon-font">Sales</span></a></li>
                    </ul>

        </li>
        <li class="topmenu"><a class="icon-finance"><span class="icon-font">Finance</span></a>
                  <ul>
                      <li class="subfirst"><a href="searchFinance" ><span class="icon-font">Search Finance</span></a></li>
                      <li class="subfirst"><a href="addFinance"><span class="icon-font">Add Finance</span></a></li>
                  </ul>
        </li>
        <li class="topmenu"><a href="Help" class="icon-help"><span class="icon-font">Help</span></a></li>

    </ul>

  </ul>

</div>--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<ul class="nav navbar-nav side-nav">
    <li><a href="<s:url action='../home' />" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-dashboard "></i> Dashboard</a></li>
    
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_INLAND_FREIGHT', 'ROLE_SEA_FREIGHT', 'ROLE_SALES')">
    <li><a href="<s:url action='../orders/viewOrders' />" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-book"></i> Booking</a></li>
    </sec:authorize>
    
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-truck"></i> Operations <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='operations/viewSeaFreightList' />"> <i class="fa fa-caret-right fa-fw"></i> Sea Freight Planning</a></li>
            <li><a href="<s:url action='operations/viewInlandFreightList' />"> <i class="fa fa-caret-right fa-fw"></i> Inland Freight Planning</a></li>
            <li><a href="<s:url action='operations/loadVesselScheduleSearch' />"> <i class="fa fa-caret-right fa-fw"></i> Vessel Schedule</a></li>
            <li><a href="<s:url action='operations/viewStatusList' />"> <i class="fa fa-caret-right fa-fw"></i> Status</a></li>
        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-file-text"></i> Documentations <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='documentation/viewPendingDocuments' />"> <i class="fa fa-caret-right fa-fw"></i>Pending Documents</a></li>
            <li><a href="<s:url action='documentation/viewPlainDocuments' />"> <i class="fa fa-caret-right fa-fw"></i>Plain Documents</a></li>
            <li><a href="<s:url action='documentation/viewArchivedDocuments' />"> <i class="fa fa-caret-right fa-fw"></i>Archived Documents</a></li>
        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-male"></i> Customer <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='../customers/loadSearchCustomerPage' />"> <i class="fa fa-caret-right fa-fw"></i> Search Customer</a></li>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES')">
                <li><a href="<s:url action='../customers/loadAddCustomerPage' />"> <i class="fa fa-caret-right fa-fw"></i> Add Customer</a></li>
            </sec:authorize>
        </ul>
    </li>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-building-o"></i> Vendor <b class="caret"></b></a>

        <ul class="dropdown-menu">
            <li><a href="<s:url action='../vendor/loadSearchVendorPage' />"> <i class="fa fa-caret-right fa-fw"></i> Search Vendor</a></li>
            <li><a href="<s:url action='../vendor/loadAddVendorPage' />"> <i class="fa fa-caret-right fa-fw"></i> Add Vendor</a></li>
        </ul>
    </li>
    </sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-user"></i> Accounts <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='../user/loadSearchUserPage' />"> <i class="fa fa-caret-right fa-fw"></i> User</a></li>
            <li><a href="<s:url action='../user/viewGroups' />"> <i class="fa fa-caret-right fa-fw"></i> Group</a></li>
            <li><a href="<s:url action='../user/viewPermissions' />"> <i class="fa fa-caret-right fa-fw"></i> Permission</a></li>
        </ul>
    </li>
    </sec:authorize>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-bar-chart-o"></i> Reports <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="#"> <i class="fa fa-caret-right fa-fw"></i> Trucks</a></li>
            <li><a href="#"> <i class="fa fa-caret-right fa-fw"></i> Container</a></li>
            <li><a href="#"> <i class="fa fa-caret-right fa-fw"></i> Cargo</a></li>
            <li><a href="#"> <i class="fa fa-caret-right fa-fw"></i> Customer Relation</a></li>
            <li><a href="#"> <i class="fa fa-caret-right fa-fw"></i> Sales</a></li>
        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-money"></i> Finance <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="searchFinance"> <i class="fa fa-caret-right fa-fw"></i> Search Finance</a></li>
            <li><a href="addFinance"> <i class="fa fa-caret-right fa-fw"></i> Add Finance</a></li>
        </ul>
    </li>

    <%--<li class=""><a href="Help" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-question"></i> Help</a></li>--%>

</ul>