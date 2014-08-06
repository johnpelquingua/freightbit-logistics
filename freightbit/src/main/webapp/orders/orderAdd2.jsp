<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>


<%--<div class="form-group">
    <label class="col-lg-3 control-label" style="margin-top: 5px;">Booking Number:</label>

    <div class="col-lg-9">
        <s:textfield cssClass="form-control" style="margin-bottom: 15px !important;"
                     name="orderBean.orderNumber" disabled="true"/>

    </div>
</div>--%>


<%--<div class="form-group">
    <label class="col-lg-3 control-label">Shipper Name:</label>

    <div class="col-lg-9">
        <s:textfield cssClass="form-control step2" style="margin-bottom: 15px !important;"
                     name="order.companyName" emptyOption="true" disabled="true"/>
    </div>
</div>--%>

<div class="form-group">
    <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person:</label>

    <div class="col-lg-9">
        <s:select id="order.shipperContactId" cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="order.shipperContactId" list="contactsList" listKey="contactId"
                  listValue="firstName +' '+ middleName +' '+ lastName"/>
    </div>
</div>

<div class="form-group">
    <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Address:</label>

    <div class="col-lg-9">
        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  id="order.shipperAddressId" name="order.shipperAddressId" list="addressList" listKey="addressId"
                  listValue="addressLine1 + ' ' + addressLine2" />
    </div>
</div>

<div class="form-group">
    <label class="col-lg-3 control-label" style="margin-top: 5px;">Notification Type:</label>

    <div class="col-lg-9">
        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="order.notifyBy" list="notifyByList" listKey="key"
                  listValue="value"
                  value="orderBean.notifyBy" />
    </div>
</div>

<div class="form-group">
    <label class="col-lg-3 control-label" style="margin-top: 5px;">Consignee Name:</label>

    <div class="col-lg-9">
        <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  id="order.consigneeContactId" name="order.consigneeContactId" list="consigneeList" listKey="contactId"
                  listValue="firstName +' '+ middleName +' '+ lastName" />
    </div>
</div>

<div class="form-group">
    <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Address:</label>

    <div class="col-lg-9">
        <s:select id="deliveryAddress" cssClass="form-control step2" style="margin-bottom: 15px !important;"
                  name="order.consigneeAddressId" list="consigneeAddressList" listKey="addressId"
                  listValue="addressLine1 + ' ' + addressLine2" />
    </div>
</div>

<div class="form-group">
    <label class="col-lg-3 control-label" style="margin-top: 5px;">Comments :</label>

    <div class="col-lg-9">
        <s:textarea cssClass="form-control step2"
                    name="order.comments" cssStyle="resize: none; margin-bottom: 15px !important;"></s:textarea>
    </div>
</div>

<s:submit name="submit" cssClass="btn btn-primary btn-lg" value="Save" />

<%--<button id="activate-step-3" class="btn btn-primary pull-right" style="margin-bottom: 15px !important;">Save</button>--%>


<script type="text/javascript">

    /*var fromDatePickUp = $('#datepicker1');
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

    });*/


    /*$('#activate-step-3').on('click', function(e) {
        $('ul.setup-panel li:eq(2)').removeClass('disabled');
        $('.step2').attr('disabled', 'disabled');
        $('ul.setup-panel li a[href="#step-3"]').trigger('click');
        $(this).remove();
    })*/

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