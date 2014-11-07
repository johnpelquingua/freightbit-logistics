<%@ page import="com.sr.apps.freightbit.core.action.DashboardAction" %>
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
        <a href="orders/viewOrdersBookingList.action">
<div class="panel panel-primary">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-3">
                <i class="fa fa-book fa-5x"></i>
            </div>
            <div class="col-xs-9 text-right">

                <div class="huge-dashboard"  id="booking"><s:property value="%{Booking}"></s:property></div>
                <div id="ajaxResponse"></div>
                <div>New Booking!</div>
            </div>
        </div>
    </div>

</div>
        </a>
</div>

<%--Customer--%>
<div class="col-lg-3 col-md-6 ">
    <a href="customers/customerListNew.action">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-male fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge-dashboard" id="customer"><s:property value="%{Customer}"></s:property></div>
                    <div>New Customer</div>
                </div>
            </div>
        </div>

    </div>
    </a>
</div>

<%--user--%>
<div class="col-lg-3 col-md-6">
    <a href="core/viewUsersNew.action">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-user fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge-dashboard" id="user"><s:property value="%{User}"></s:property></div>
                    <div>New User</div>
                </div>
            </div>
        </div>

    </div>
    </a>
</div>

<%--vendor--%>
<div class="col-lg-3 col-md-6">
    <a href="vendor/viewVendorsNew.action">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-building fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge-dashboard" id="vendor"><s:property value="%{Vendor}"></s:property></div>
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
              <%--  <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_INLAND_FREIGHT', 'ROLE_SEA_FREIGHT', 'ROLE_SALES')">
	                <div class="text-right">
	                <a href="#" onclick="loadCalendar();">View Calendar <i class="fa fa-arrow-circle-right"></i></a>
	                </div>
                </sec:authorize>--%>
                <iframe height="500" width="925" name="sample" seamless="seamless"></iframe>
            </div>
        </div>
    </div>

</div>


<script type="text/javascript">

    $(document).ready(function(){
		$(window).load(function(){
			localStorage.clear(); loadCalendar();
		});
	});

	function loadCalendar(){
		var win = window.open('calendar/loadCalendar','sample','width=1500,height=800');
		win.onload = function() { this.document.title = "Booking Calendar"; }
	}

	//will go to URL /getNotifications.action defined in struts config file
	function doAjaxCall()
	{
		xmlhttpObject = getXMLHTTPObject();
		if (xmlhttpObject != null)
		{
			var URL = "home.action";
			xmlhttpObject.open("POST", URL, true);
			xmlhttpObject.onreadystatechange = handleServerResponse;
			xmlhttpObject.send(null);
		}
	}

	function handleServerResponse() {
		if (xmlhttpObject.readyState == 4) {
			if (xmlhttpObject.status == 200) {
				//xmlhttpObject.responseText contains the count (See NotificationAction.java)
				setAjaxOutput();
			} else {
				alert("Error during AJAX call. Please try again");
			}
		}
	}

	// Change the value of the outputText field
	function setAjaxOutput()
	{
		//alert(xmlhttpObject.responseText);
		document.getElementById('booking').innerHTML = <s:property value="%{Booking}"></s:property>;
		<%--alert("booking is " +  <s:property value="%{Booking}"></s:property>);--%>
		document.getElementById('customer').innerHTML = <s:property value="%{Customer}"></s:property>;
		<%--alert("customer is " +  <s:property value="%{Customer}"></s:property>);--%>
		document.getElementById('user').innerHTML = <s:property value="%{User}"></s:property>;
		<%--alert("user is " +  <s:property value="%{User}"></s:property>);--%>
		document.getElementById('vendor').innerHTML = <s:property value="%{Vendor}"></s:property>;
		<%--alert("vendor is " +  <s:property value="%{Vendor}"></s:property>);--%>
	}

	//Get XMLHTTP Object
	function getXMLHTTPObject() {
		var xmlhttpObject = null;
		try {
			// For Old Microsoft Browsers
			xmlhttpObject = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				// For Microsoft IE 6.0+
				xmlhttpObject = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e1) {
				// No Browser accepts the XMLHTTP Object then false
				xmlhttpObject = false;
			}
		}

		if (!xmlhttpObject && typeof XMLHttpRequest != 'undefined') {
			//For Mozilla, Opera Browsers
			xmlhttpObject = new XMLHttpRequest();
		}
		// Mandatory Statement returning the ajax object created
		return xmlhttpObject;
	}
	/*setInterval('doAjaxCall();', 5000);*/
</script>