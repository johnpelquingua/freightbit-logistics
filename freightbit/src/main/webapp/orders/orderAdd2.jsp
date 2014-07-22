<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>


<div class="form-group">
    <label class="col-sm-2 control-label"
           for="orderBean.orderNumber">Booking Number:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                     name="orderBean.orderNumber" disabled="true"/>
    </div>
</div>

<div class="form-group">

    <label class="col-lg-2 col-lg-offset-1 control-label"
           for="orderBean.pickupDate" style="margin-top: 5px;">Pickup Date/Time:</label>
    <div class="col-lg-3" >
        <input type="text" class="from_date form-control step2" id="datepicker1" name="orderBean.pickupDate" placeholder="Select start date" contenteditable="false" style="margin-bottom: 15px !important;">

    </div>

    <label class="col-lg-2 control-label"
           for="orderBean.deliveryDate" style="margin-top: 5px;">Delivery Date/Time:</label>
    <div class="col-lg-3" >
        <input type="text" class="to_date form-control step2" id="datepicker2" name="orderBean.deliveryDate" placeholder="Select end date" contenteditable="false" style="margin-bottom: 15px !important;">
    </div>

</div>

<div class="form-group">

    <label class="col-lg-2 col-lg-offset-1 control-label"
           for="orderBean.pickupDate" style="margin-top: 5px;">Port of Origin:</label>
    <div class="col-lg-3" >

        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="order.shipperCode" list="portsList" listKey="key"
                  listValue="value" />

    </div>

    <label class="col-lg-2 control-label"
           for="orderBean.deliveryDate" style="margin-top: 5px;">Port of Destination:</label>
    <div class="col-lg-3" >

        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="order.shipperCode" list="portsList" listKey="key"
                  listValue="value" />

    </div>

</div>


<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.companyName">Shipper Name:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:textfield cssClass="form-control step2" style="margin-bottom: 15px !important;"
                     name="order.companyName" emptyOption="true" disabled="true"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.contactPerson">Contact Person:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="order.shipperCode" list="contactsList" listKey="contactId"
                  listValue="firstName" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.pickupAddress">Pickup Address:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="orderBean.pickupAddress" list="addressList" listKey="addressId"
                  listValue="addressLine1" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label"
           for="orderBean.rates">Notification Type:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="orderBean.notifyBy" list="notifyByList" listKey="key"
                  listValue="value"
                  value="orderBean.notifyBy" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.consigneeName">Consignee Name:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="orderBean.consigneeName" list="consigneeList" listKey="contactId"
                  listValue="firstName" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label" for="orderBean.deliveryAddress">Delivery Address:</label>

    <div class="col-sm-9" style="margin-left:4%">
        <s:select id="deliveryaddress" cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="orderBean.deliveryAddress" list="consigneeAddressList" listKey="addressId"
                  listValue="addressLine2" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label"
           for="orderBean.comments">Comments :</label>

    <div class="col-sm-9" style="margin-left:4%;">
        <s:textarea cssClass="form-control step2"
                    name="orderBean.comments" cssStyle="resize: none;"></s:textarea>
    </div>
</div>

<button id="activate-step-3" class="btn btn-primary btn-lg">Activate Step 3</button>



<script type="text/javascript">

    var fromDatePickUp = $('#datepicker1');
    var toDateDelivery = $('#datepicker2');

    //pick up date validation
    fromDatePickUp.datetimepicker({

        // on 5:00pm
        timeFormat: 'HH:mm',
        onClose: function(dateText, inst) {

            if (toDateDelivery.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    toDateDelivery.datetimepicker('setDate', testStartDate);

            }

            else {
                toDateDelivery.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            toDateDelivery.datetimepicker('option', 'minDate', fromDatePickUp.datetimepicker('getDate') );
        }

    });

    // delivery date validation -jp
    toDateDelivery.datetimepicker({

        // on 6:00pm
        timeFormat: 'HH:mm',
        onClose: function(dateText, inst) {

            if (fromDatePickUp.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    fromDatePickUp.datetimepicker('setDate', testEndDate);

            }

            else {
                fromDatePickUp.val(dateText);
            }
        },

        onSelect: function (selectedDateTime){
            fromDatePickUp.datetimepicker('option', 'maxDate', toDateDelivery.datetimepicker('getDate') );
        }

    });


    $('#activate-step-3').on('click', function(e) {
        $('ul.setup-panel li:eq(2)').removeClass('disabled');
        $('.step2').attr('disabled', 'disabled');
        $('ul.setup-panel li a[href="#step-3"]').trigger('click');
        $(this).remove();
    })

    $('#activate-step-3').click(function(){

        var selectedItem = $("select[name='order.customerId'] option:selected").val();

        $.ajax({
            url: 'load3rdPage', // action to be perform
            type: 'POST',       //type of posting the data
            //data: { name: "Jeetu", age: "24" }, // data to set to Action Class
            data:{ ID: selectedItem },
            dataType: 'html',

            success: function (html) {
                /*alert(selectedItem);
                 alert(html);*/
                $('#3rdPart').html(html); //set result.jsp output to leftDiv
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });
    });


</script>