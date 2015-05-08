<%@ page import="com.sr.apps.freightbit.core.action.DashboardAction" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .pagebanner, .pagelinks {
        display: none;
    }
</style>

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
        <%--<a href="orders/viewOrdersBookingList.action">--%>
            <a href="orders/viewOrders.action">
            <div class="panel panel-primary">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-3">
                <i class="fa fa-book fa-5x"></i>
            </div>
            <div class="col-xs-9 text-right">

                <div class="huge-dashboard"  id="booking"><s:property value="%{Booking}"></s:property></div>
                <div id="ajaxResponse"></div>
                <div>New Booking</div>
            </div>
        </div>
        </div>

</div>
        </a>
</div>

<%--Customer--%>
<div class="col-lg-3 col-md-6 ">
    <%--<a href="customers/customerListNew.action">--%>
        <a href="customers/customerList.action">
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
    <%--<a href="core/viewUsersNew.action">--%>
        <a href="core/viewUsers.action">
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
    <%--<a href="vendor/viewVendorsNew.action">--%>
        <a href="vendor/viewVendors.action">
        <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-building-o fa-5x"></i>
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
            <div class="panel-heading" onclick="$('.calendar-body').slideToggle()">
                <h3 class="panel-title"><i class="fa fa-book"></i> Booking Calendar</h3>
            </div>
            <div class="calendar-body panel-body" align="center">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_INLAND_FREIGHT', 'ROLE_SEA_FREIGHT', 'ROLE_SALES')">
	                <%--<div class="text-right">
	                <a href="#" onclick="loadCalendar();">View Calendar <i class="fa fa-arrow-circle-right"></i></a>
	                </div>--%>
                </sec:authorize>
                <iframe height="500" width="925" name="sample" seamless="seamless"></iframe>
            </div>
        </div>

            <sec:authorize access="hasAnyRole('ROLE_CUSTOMER_RELATIONS')">
            <div class="panel panel-primary">

            <div class="panel-heading">
                <i class="fa fa-list"></i>
                <span class="panel-title">On-Going Booking List</span>
                <span class="pull-right">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="showSearchFields();">
                        <i class="fa fa-search"></i> Search Booking Number
                    </button>
                </sec:authorize>
                </span>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="order" name="orders"
                                   requestURI="home.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>
                        <td><display:column property="orderDate" title="Booking Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 10%; text-align: center;"> </display:column></td>
                        <%--Order Number--%>
                        <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 10%; text-align: center;"> </display:column></td>

                        <td><display:column property="customerName" title="Customer <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 15%; text-align: center;"> </display:column></td>

                        <td><display:column property="consigneeCode" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 25%; text-align: center;"> </display:column></td>
                        <%--ORIGIN--%>
                        <td><display:column property="originationPort" title="ORI <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 5%; text-align: center;"> </display:column></td>
                        <%--DESTINATION--%>
                        <td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 5%; text-align: center;"> </display:column></td>
                        <%--Freight Type--%>
                        <td><display:column property="freightType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                            style="width: 5%; text-align: center;"> </display:column></td>

                        <td><display:column property="serviceRequirement" title="Req't <i class='fa fa-sort' />"
                                            class="tb-font-black"
                                            style="width: 5%; text-align: center;"> </display:column></td>

                        <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column title="Action">
                            <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                                <s:param name="orderNoParam"
                                         value="#attr.order.orderNo"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewStatusListItemsUrl}" rel="tooltip"
                                 title="Update Status">
                                <%--<img src="../includes/images/edit-booking.png" class="icon-action circ-icon"
                                style="border-radius:25%;">--%>
                                <i class="fa fa-edit"></i>
                            </s:a>

                        </display:column></td>

                    </display:table>
                </div>
            </div>
            <div class="panel-footer">
                <div class="table-responsive">
                    <div class="col-lg-12">
                        <table class="col-lg-2">
                            <tr>
                                <td><label>LEGEND:</label></td>
                                <td><i class='fa fa-edit' ></i> Edit</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
            </sec:authorize>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>

        </div>
    </div>
</div>

<%--<div class="row">--%>

    <%--<div class="col-lg-12">--%>
        <%--<div class="panel panel-primary">--%>
            <%--<div class="panel-heading">--%>
                <%--<h3 class="panel-title"><i class="fa fa-book"></i> Port Summary (LCL Only)</h3>--%>
            <%--</div>--%>
            <%--<div class="col-md-12 form-group pull-left" style="margin-top: 0.8em; margin-left: -5em; margin-bottom: 0em;">--%>
                <%--<s:form action="changeOrigin" theme="bootstrap">--%>
                <%--<label class="col-lg-2 control-label">Sort by Origin :</label>--%>
                <%--<div class="col-lg-4">--%>
                    <%--<s:select cssClass="form-control" style="margin-bottom: 15px !important;"--%>
                      <%--id="select1" list="portsList" listKey="key"--%>
                      <%--listValue="value" name="originCity" onchange="$(this).closest('form').submit()" />--%>
                <%--</div>--%>
                <%--</s:form>--%>

            <%--</div>--%>

            <%--<div class="panel-body">--%>
                <%--<s:iterator value="test" >--%>
                    <%--<li><s:property /></li>--%>
                <%--</s:iterator>--%>
                <%--<div class="table-responsive">--%>
                    <%--<table class="table table-hover table-bordered text-center tablesorter table-striped">--%>
                        <%--<thead>--%>
                            <%--<th>DESTINATION</th>--%>
                            <%--<th>Total Volume (m&#179;)</th>--%>
                            <%--<th>Total Weight (kg.)</th>--%>
                            <%--<th>Action</th>--%>
                        <%--</thead>--%>
                        <%--<tbody>--%>
                            <%--<tr>--%>
                                <%--<td>Bacolod</td>--%>
                                <%--<td><s:property value="bacolodVolume"/></td>--%>
                                <%--<td><s:property value="bacolodWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Butuan</td>--%>
                                <%--<td><s:property value="butuanVolume"/></td>--%>
                                <%--<td><s:property value="butuanWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Cagayan</td>--%>
                                <%--<td><s:property value="cagayanVolume"/></td>--%>
                                <%--<td><s:property value="cagayanWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Cebu</td>--%>
                                <%--<td><s:property value="cebuVolume"/></td>--%>
                                <%--<td><s:property value="cebuWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Cotabato</td>--%>
                                <%--<td><s:property value="cotabatoVolume"/></td>--%>
                                <%--<td><s:property value="cotabatoWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Davao</td>--%>
                                <%--<td><s:property value="davaoVolume"/></td>--%>
                                <%--<td><s:property value="davaoWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Dumaguete</td>--%>
                                <%--<td><s:property value="dumagueteVolume"/></td>--%>
                                <%--<td><s:property value="dumagueteWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>General Santos</td>--%>
                                <%--<td><s:property value="gensanVolume"/></td>--%>
                                <%--<td><s:property value="gensanWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Iligan</td>--%>
                                <%--<td><s:property value="iliganVolume"/></td>--%>
                                <%--<td><s:property value="iliganWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Iloilo</td>--%>
                                <%--<td><s:property value="iloiloVolume"/></td>--%>
                                <%--<td><s:property value="iloiloWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Ozamis</td>--%>
                                <%--<td><s:property value="ozamisVolume"/></td>--%>
                                <%--<td><s:property value="ozamisWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Palawan</td>--%>
                                <%--<td><s:property value="palawanVolume"/></td>--%>
                                <%--<td><s:property value="palawanWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Roxas</td>--%>
                                <%--<td><s:property value="roxasVolume"/></td>--%>
                                <%--<td><s:property value="roxasWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Tagbilaran</td>--%>
                                <%--<td><s:property value="tagbilaranVolume"/></td>--%>
                                <%--<td><s:property value="tagbilaranWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Tacloban</td>--%>
                                <%--<td><s:property value="taclobanVolume"/></td>--%>
                                <%--<td><s:property value="taclobanWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Zamboanga</td>--%>
                                <%--<td><s:property value="zamboangaVolume"/></td>--%>
                                <%--<td><s:property value="zamboangaWeight"/></td>--%>
                                <%--<td>--%>
                                    <%--<i class="fa fa-cubes" data-toggle="tooltip" data-placement="top" title="Tooltip on left"></i>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                        <%--</tbody>--%>
                    <%--</table>--%>

                        <%--&lt;%&ndash;<display:table id="order" name="lclTable"--%>
                                       <%--requestURI="home.action" pagesize="10"--%>
                                       <%--class="lclTable table table-hover table-bordered text-center tablesorter table-condensed"--%>
                                       <%--style="margin-top: 15px;empty-cells: hide;">--%>

                            <%--&lt;%&ndash;<td>--%>
                                <%--<display:column title="<input type='checkbox' id='mainCheckBox' name='mainCheckBox'/>">--%>
                                    <%--<s:checkbox theme="simple" name="check"--%>
                                                <%--fieldValue="%{#attr.order.orderId}"/>--%>
                                <%--</display:column>--%>
                            <%--</td>&ndash;%&gt;--%>

                            <%--<td><display:column property="destinationPort" title="DES <i class='fa fa-sort' />" class="tb-font-black"--%>
                                                <%--style="text-align: center;"> </display:column></td>--%>
                            <%--&lt;%&ndash;<td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"--%>
                                                <%--style="text-align: center;"> </display:column></td>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"--%>
                                                <%--style="text-align: center;"> </display:column></td>&ndash;%&gt;--%>
                            <%--<td><display:column property="orderWeight" title="Weight  <i class='fa fa-sort' />" class="tb-font-black"--%>
                                                <%--style="text-align: center;"> </display:column></td>--%>
                            <%--<td><display:column property="orderVolume" title="Volume  <i class='fa fa-sort' />" class="tb-font-black"--%>
                                                <%--style="text-align: center;"> </display:column></td>--%>
                            <%--<td>--%>
                                <%--<display:column title="Action">--%>
                                    <%--&lt;%&ndash;<s:if test="#attr.order.orderStatus=='PENDING'">--%>
                                        <%--<i class="fa fa-ban"></i>--%>
                                    <%--</s:if>--%>
                                    <%--<s:else>&ndash;%&gt;--%>
                                       <%--&lt;%&ndash; <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">--%>
                                            <%--<s:param name="orderIdParam" value="#attr.order.orderId"></s:param>--%>
                                        <%--</s:url>--%>
                                        <%--<s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"--%>
                                             <%--title="Update Status">--%>
                                            <%--<i class="fa fa-edit" id="status"></i>--%>
                                        <%--</s:a>&ndash;%&gt;--%>

                                        <%--<s:url var="viewInfoOrderUrl" action="../operations/viewInfoOrderSea">--%>
                                            <%--<s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>--%>
                                        <%--</s:url>--%>
                                        <%--<s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip" title="View Booking Information">--%>
                                            <%--<i class="fa fa-info-circle"></i>--%>
                                        <%--</s:a>--%>
                                    <%--&lt;%&ndash;</s:else>&ndash;%&gt;--%>
                                <%--</display:column>--%>
                            <%--</td>--%>

                        <%--</display:table>&ndash;%&gt;--%>

                <%--</div>--%>
            <%--</div>--%>

        <%--</div>--%>
    <%--</div>--%>

<%--</div>--%>

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

    $(document).ready(function(){
        tableProp('DESTI_ORIG','order',0 ,7, 8, 9, 5, 6, 1);
    });

    function showSearchFields() {
        $.ajax({
            url: 'loadSearchBookingPage',
            type: 'POST',
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
                /*window.location.href = '#sixth';*/
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });

    }
</script>