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
                <h3 class="panel-title"><i class="fa fa-book"></i>Booking Calendar</h3>
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



    <%--<div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-spin fa-spinner"></i> On-Going Transactions</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped tablesorter">
                        <thead>
                        <tr>
                            <th>Booking # <i class="fa fa-sort"></i></th>
                            <th>Consignee <i class="fa fa-sort"></i></th>
                            <th>Destination <i class="fa fa-sort"></i></th>
                            <th> &nbsp; &nbsp;Status <i class="fa fa-sort"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>XYZ-123</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Truck at warehouse for pick-up</td>
                        </tr>
                        <tr>
                            <td>XYZ-124</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>
                        <tr>
                            <td>XYZ-125</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>
                        <tr>
                            <td>XYZ-126</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>
                        <tr>
                            <td>XYZ-127</td>
                            <td>J. Ernest</td>
                            <td>Cebu</td>
                            <td>Items/s at deconsolidation area</td>
                        </tr>


                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>--%>

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



