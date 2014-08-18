<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"> Booking List</li>
        </ol>

    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Booking List</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" onclick="location.href='bookingSearch'">
                        <i class="fa fa-search"></i> Search Booking
                    </button>
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddOrderPage'">
                        <i class="fa fa-book"></i> New Booking
                    </button>
                </span>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                        <display:table id="order" name="orders" requestURI="viewOrders.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="orderNumber" title="Order # <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;" > </i></display:column></td>
                            <td><display:column property="shipperContactId" title="Shipper <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="consigneeContactId" title="Consignee <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="serviceType" title="Type <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="modeOfService" title="Mode <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="orderDate" title="Order Date <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>
                            <td><display:column property="orderStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black status-color"
                                                style="text-align: center;"> </display:column></td>

                            <td class="tb-font-black" style="text-align: center;">
                                <display:column title="Actions">
                                <s:url var="editOrderUrl" action="loadEditOrder">
                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{editOrderUrl}" rel="tooltip"
                                     title ="Edit order">
                                    <%--<img src="../includes/images/edit-booking.png" class="icon-action circ-icon"
                                    style="border-radius: 25%;">--%>
                                    <i class="fa fa-pencil"></i>
                                </s:a>

                                <s:url var="deleteOrderUrl" action="deleteOrder">
                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip"
                                     title="Delete order"
                                     onclick="return confirm('Do you really want to delete?');">
                                    <%--<img src="../includes/images/delete-booking.png" class="icon-action circ-icon"
                                    style="border-radius: 25%;">--%>
                                    <i class="fa fa-trash-o"></i>
                                </s:a>

                                <s:url var="viewInfoOrderUrl" action="viewInfoOrder">
                                    <s:param name="orderIdParam" value="%{#attr.order.orderId}"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewInfoOrderUrl}" rel="tooltip"
                                     title="View Booking Info">
                                    <%--<img src="../includes/images/info-b.png" class="icon-action circ-icon"
                                    style="border-radius: 25%;">--%>
                                    <i class="fa fa-info-circle"></i>
                                </s:a>
                                <s:a class="icon-action-link" href="#" rel="tooltip"
                                     title="Approve or Disapprove order" id="approve" onclick="approve()">
                                     <%--<img src="../includes/images/info-b.png" class="icon-action circ-icon"
                                     style="border-radius: 25%;">--%>
                                    <i class="fa fa-check-circle-o"></i>
                                </s:a>
                                </display:column>
                            </td>

                        </display:table >

                </div>
            </div>

            <div class="panel-footer">

                    <span class="pull-right">
                        <button type="button" class="btn btn-success new-booking" onclick="location.href='bookingSearch'">
                            <i class="fa fa-search"></i> Search Booking
                        </button>
                        <button type="button" class="btn btn-primary new-booking"
                                onclick="location.href='loadAddOrderPage'">
                            <i class="fa fa-book"></i> New Booking
                        </button>
                    </span>
            </div>
        </div>
    </div>
    <!-- /.row -->

</div>



<div id="modal">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <span class="pull-right ">
                <a href="#" class="icon-action-link" id="closeModal" onclick="closeModal()" style="color:white;"> x </a>
            </span>
        </div>
    <div class="panel-body">
    <button class="btn btn-success">Approve</button>
    <button class="btn btn-danger">Disapprove</button>
    </div>
    </div>
</div>

<style>

#modal {
  width: 300px;
  height: 80px;
  position: fixed;
  top: 50%;
  left: 50%;
  margin-top: -100px;
  margin-left: -150px;
  background-color: rgba(0,0,0,0.5);
  border-radius: 5px;
  text-align: center;
  z-index: 11; /* 1px higher than the overlay layer */

   /* Embiggen */
   transform: scale(1.5); /* prefix me */

   /* Hidden */
   opacity: 0;
   pointer-events: none;
}

.dialogIsOpen #page-wrap {

  /* Blur and de-color */
  -webkit-filter: blur(5px) grayscale(50%);

  /* Recede */
  -webkit-transform: scale(0.9);

}

.dialogIsOpen #modal {

  /* Regular size and visible */
  transform: scale(1); /* prefix me */
  opacity: 1;

  /* Clickable */
  pointer-events: auto;

}
#modal {

  transition: all 0.4s ease; /* prefix me */

}

</style>

<script>

    function approve(){
        $("body").addClass("dialogIsOpen");
    }

    function closeModal(){
        $("body").removeClass("dialogIsOpen");
    }

    var tbl = document.getElementById("order");
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++){

            if (tbl.rows[i].cells[6].innerHTML == "PENDING") {
                /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                for (var j = 0; j < tbl.rows[i].cells.length; j++){
                    tbl.rows[i].cells[j].style.backgroundColor="#fcf8e3";
                }
            }

            if (tbl.rows[i].cells[6].innerHTML == "DISAPPROVED" || tbl.rows[i].cells[6].innerHTML == "CANCELLED") {
                /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                for (var j = 0; j < tbl.rows[i].cells.length; j++){
                    tbl.rows[i].cells[j].style.backgroundColor="#f2dede";
                }
            }

            if (tbl.rows[i].cells[6].innerHTML == "APPROVED" || tbl.rows[i].cells[6].innerHTML == "SERVICE ACCOMPLISHED") {
                /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                for (var j = 0; j < tbl.rows[i].cells.length; j++){
                    tbl.rows[i].cells[j].style.backgroundColor="#dff0d8";
                }
            }

        }

    }

    function onDelete() {

    }

</script>

