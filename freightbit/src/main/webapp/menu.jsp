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
            <li><a href="<s:url action='../operations/viewSeaFreightList' />"> <i class="fa fa-caret-right fa-fw"></i> Sea Freight Planning</a></li>
            <li><a href="<s:url action='../operations/viewInlandFreightList' />"> <i class="fa fa-caret-right fa-fw"></i> Inland Freight Planning</a></li>
            <li><a href="<s:url action='../operations/viewStatusList' />"> <i class="fa fa-caret-right fa-fw"></i> Shipment Monitoring</a></li>
            <li><a href="<s:url action='../operations/viewVesselSchedules' />"> <i class="fa fa-caret-right fa-fw"></i> Vessel Schedule</a></li>

        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-file-text"></i> Documentations <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='../documentation/viewPendingDocuments' />"> <i class="fa fa-caret-right fa-fw"></i>Pending Documents</a></li>
            <li><a href="<s:url action='../documentation/viewPlainDocuments' />"> <i class="fa fa-caret-right fa-fw"></i>Plain Documents</a></li>
            <li><a href="<s:url action='../documentation/viewArchivedDocuments' />"> <i class="fa fa-caret-right fa-fw"></i>Archived Documents</a></li>
        </ul>
    </li>

    <li>
        <a href="<s:url action='../customers/customerList' />" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-male"></i> Customer </a>
        <%--<ul class="dropdown-menu">--%>
            <%--<li><a href="<s:url action='../customers/loadSearchCustomerPage' />"> <i class="fa fa-caret-right fa-fw"></i> Search Customer</a></li>--%>
            <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">--%>
                <%--<li><a href="<s:url action='../customers/loadAddCustomerPage' />"> <i class="fa fa-caret-right fa-fw"></i> Add Customer</a></li>--%>
            <%--</sec:authorize>--%>
        <%--</ul>--%>
    </li>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
    <li>
        <a href="<s:url action='../vendor/viewVendors' />" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-building-o"></i> Vendor </a>

        <%--<ul class="dropdown-menu">--%>
            <%--<li><a href="<s:url action='../vendor/loadSearchVendorPage' />"> <i class="fa fa-caret-right fa-fw"></i> Search Vendor</a></li>--%>
            <%--<li><a href="<s:url action='../vendor/loadAddVendorPage' />"> <i class="fa fa-caret-right fa-fw"></i> Add Vendor</a></li>--%>
        <%--</ul>--%>
    </li>
    </sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-user"></i> Accounts <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='../core/viewUsers' />"> <i class="fa fa-caret-right fa-fw"></i> User</a></li> 
            <li><a href="<s:url action='../core/viewGroups' />"> <i class="fa fa-caret-right fa-fw"></i> Group</a></li>
           <!--  <li><a href="<s:url action='../core/viewPermissions' />"> <i class="fa fa-caret-right fa-fw"></i> Permission</a></li> -->
        </ul>
    </li>
    </sec:authorize>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-bar-chart-o"></i> Reports <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='../reports/truckReport'/>"> <i class="fa fa-caret-right fa-fw"></i> Trucks</a></li>
            <li><a href="<s:url action='../reports/containerReport'/>"> <i class="fa fa-caret-right fa-fw"></i> Container</a></li>
            <li><a href="<s:url action='../reports/cargoReport'/>"> <i class="fa fa-caret-right fa-fw"></i> Cargo</a></li>
            <li><a href="<s:url action='../reports/customerRelationReport'/>"> <i class="fa fa-caret-right fa-fw"></i> Customer Relation</a></li>
            <li><a href="<s:url action='../reports/salesReport'/>"> <i class="fa fa-caret-right fa-fw"></i> Sales</a></li>
        </ul>
    </li>

    <%--<li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-money"></i> Finance <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a href="<s:url action='../finance/searchFinance'/>"> <i class="fa fa-caret-right fa-fw"></i> Search Finance</a></li>
            <li><a href="<s:url action='../finance/addFinance'/>"> <i class="fa fa-caret-right fa-fw"></i> Add Finance</a></li>
        </ul>
    </li>--%>

    <%--<li class=""><a href="Help" style="border-top: 1px solid #4b4c4d; border-top-color: rgba(255, 255, 255, 0.05); border-bottom: 1px solid #353637; border-bottom-color: rgba(0, 0, 0, 0.18);"><i class="fa fa-question"></i> Help</a></li>--%>

</ul>