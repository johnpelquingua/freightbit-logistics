<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-dashboard"></i> Dashboard </h1>
            </span>
        </legend>

    </div>
</div>
<!-- /.row -->
<%--for booking--%>
<div class="col-lg-3 col-md-6">
    <%--<a href="<s:url action='viewOrderss'/>">--%>
        <a href="/orders/viewOrdersInbooking.action">
<div class="panel panel-primary">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-3">
                <i class="fa fa-book fa-5x"></i>
            </div>
            <div class="col-xs-9 text-right">

                <div class="huge-dashboard"><s:property value="%{Booking}"></s:property></div>
                <div>New Booking!</div>
            </div>
        </div>
    </div>

</div>
        </a>
</div>

<%--Customer--%>
<div class="col-lg-3 col-md-6 ">
    <a href="/customers/customerListNew.action">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-male fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge-dashboard"><s:property value="%{Customer}"></s:property></div>
                    <div>New Customer</div>
                </div>
            </div>
        </div>

    </div>
    </a>
</div>

<%--user--%>
<div class="col-lg-3 col-md-6">
    <a href="/core/viewUsersNew.action">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-user fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge-dashboard"><s:property value="%{User}"></s:property></div>
                    <div>New User</div>
                </div>
            </div>
        </div>

    </div>
    </a>
</div>

<%--vendor--%>
<div class="col-lg-3 col-md-6">
    <a href="/vendor/viewVendorsNew.action">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-building fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge-dashboard"><s:property value="%{Vendor}"></s:property></div>
                    <div>New Vendor</div>
                </div>
            </div>
        </div>

    </div>
    </a>
</div>

<div class="row">

    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-book"></i> Booking Calendar</h3>
            </div>
            <div class="panel-body" align="center">
                <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_INLAND_FREIGHT', 'ROLE_SEA_FREIGHT', 'ROLE_SALES')">--%>
	                <%--<div class="text-right">--%>
	                <%--<a href="#" onclick="openCalendar();">View Calendar <i class="fa fa-arrow-circle-right"></i></a>--%>
	                <%--</div>--%>
                <%--</sec:authorize>--%>
                <iframe height="500" width="925" name="sample" seamless="seamless"></iframe>
            </div>
        </div>
    </div>

</div>


<script type="text/javascript">
    $(document).ready(function(){
        $(window).load(function(){
            localStorage.clear();
            openCalendar();
        });
    });

    function openCalendar(){
      var win = window.open('calendar/loadCalendar','sample','width=1500,height=800');
      win.onload = function() { this.document.title = "Booking Calendar"; }
    }
</script>



