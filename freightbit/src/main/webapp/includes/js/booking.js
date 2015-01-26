/**
 * Created by Jan on 1/21/2015.
 * This script belongs to orderAdd.jsp
 * this will be included at the BOTTOM of the jsp page
 */
$(document).ready(function() {

    $('.basicInfoInput').change(function(){ $('.notifBox').attr('checked', false); })

    function changeDateLabels(changeVar){
        var deliveryDateLabel = $('.deliveryDateLabel'),
            pickupDateLabel = $('.pickupDateLabel'),
            deliveryDateInput = $('.deliveryDateInput'),
            pickupDateInput = $('.pickupDateInput');
        switch(changeVar){
            case 'PIER TO DOOR' :
                deliveryDateLabel.empty().append('Delivery Date<span class="asterisk_red"></span>');
                deliveryDateInput.attr('placeholder', 'Select Delivery date');
                pickupDateLabel.empty().append('Acceptance Date<span class="asterisk_red"></span>');
                pickupDateInput.attr('placeholder', 'Select Acceptance date');
                break;
            case 'DOOR TO PIER' :
                deliveryDateLabel.empty().append('Release Date<span class="asterisk_red"></span>');
                deliveryDateInput.attr('placeholder', 'Select Release date');
                pickupDateLabel.empty().append('Pickup Date<span class="asterisk_red"></span>');
                pickupDateInput.attr('placeholder', 'Select Pickup date');
                break;
            case 'PIER TO PIER' :
                deliveryDateLabel.empty().append('Release Date<span class="asterisk_red"></span>');
                deliveryDateInput.attr('placeholder', 'Select Release date');
                pickupDateLabel.empty().append('Acceptance Date<span class="asterisk_red"></span>');
                pickupDateInput.attr('placeholder', 'Select Acceptance date');
                break;
            default :
                pickupDateLabel.empty().append('Pickup Date<span class="asterisk_red"></span>');
                pickupDateInput.attr('placeholder', 'Select Pickup date');
                deliveryDateLabel.empty().append('Delivery Date<span class="asterisk_red"></span>');
                deliveryDateInput.attr('placeholder', 'Select Delivery date');
                break;
        }
    }

    $('.serviceModeDropdown').change(function(){ changeDateLabels($(this).val()); });

    $('.freightTypeField').change(function(){
        if($(this).val() == 'SHIPPING'){
            changeDateLabels('PIER TO PIER');
        }
    });

    // Customer Dropdown
    $('#customerName').change(function(event) {
        var custId = $("#customerName").val();
        /*alert(custId);*/

        $.getJSON('customerAction', {
            async:false,
            customerID : custId
        },function(jsonResponse) {
            /* alert(jsonResponse.dummyMsg);*/
            $('#ajaxResponse').text(jsonResponse.dummyMsg);
            var select = $('#shipperContact'),
                select2 = $('#shipperAddress'),
                select3 = $('#shipperConsignee'),
                select4 = $('#consigneeAddress'),
                select5 = $('#customerPhone'),
                select6 = $('#customerMobile'),
                select7 = $('#customerEmail'),
                select8 = $('#customerFax'),
                select9 = $('#consigneeContact');

            select.find('option').remove();
            select2.find('option').remove();
            select3.find('option').remove();
            select4.find('option').remove();
            select5.find('option').remove();
            select6.find('option').remove();
            select7.find('option').remove();
            select8.find('option').remove();
            select9.find('option').remove();

            // populate customer contacts list
            $.each(jsonResponse.customerContactsMap, function(key, value) {
                $('<option>').val(key).text(value).appendTo(select);

            });

            // populate customer address list
            $.each(jsonResponse.customerAddressMap, function(key, value) {
                switch($("#order_modeOfService").val()){
                    case 'DOOR TO PIER' :
                        select2.prop('disabled', false);
                        select4.prop('disabled', true);
                        $('<option>').val(key).text(value).appendTo(select2);
                        break;
                    case 'PIER TO DOOR' :
                        select2.prop('disabled', true);
                        select4.prop('disabled', false);
                        break;
                    case 'PIER TO PIER' :
                        select4.prop('disabled', true);
                        select2.prop('disabled', true);
                        break;
                    case 'PICKUP' :
                        select2.prop('disabled', false);
                        select4.prop('disabled', true);
                        $('<option>').val(key).text(value).appendTo(select2);
                        break;
                    case 'DELIVERY' :
                        select4.prop('disabled', false);
                        select2.prop('disabled', true);
                        break;
                    default :
                        select2.prop('disabled', false);
                        select4.prop('disabled', false);
                        $('<option>').val(key).text(value).appendTo(select2);
                        break;
                }
            });

            // populate customer consignee list
            $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                $('<option>').val(key).text(value).appendTo(select3);
            });

            // populate customer consignee address list
            $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                if(select4.val() != ''){
                    if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER' || $("#order_modeOfService").val() == 'PICKUP'){
                        $('<option>').val(null).text("").appendTo(select4);
                    }
                    $('<option>').val(key).text(value).appendTo(select4);
                }else{
                    $('<option>').val(key).text(value).appendTo(select4);
                }

            });

            // populate customer phone
            $.each(jsonResponse.customerPhoneMap, function(key, value) {
                $('<option>').val(key).text(value).appendTo(select5);
                $('#customerPhone_textfield').val($("#customerPhone").val());
            });

            // populate customer mobile
            $.each(jsonResponse.customerMobileMap, function(key, value) {
                $('<option>').val(key).text(value).appendTo(select6);
                $('#customerMobile_textfield').val($("#customerMobile").val());
            });

            // populate customer email
            $.each(jsonResponse.customerEmailMap, function(key, value) {
                $('<option>').val(key).text(value).appendTo(select7);
                $('#customerEmail_textfield').val($("#customerEmail").val());
            });

            // populate customer fax
            $.each(jsonResponse.customerFaxMap, function(key, value) {
                $('<option>').val(key).text(value).appendTo(select8);
                $('#customerFax_textfield').val($("#customerFax").val());
            });

            // populate consignee contacts
            var consignee_Id = $("#shipperConsignee").val();
            //alert(consignee_Id);

            //$.each(jsonResponse.consigneeContactMap, function(key, value) {
            //    $('<option>').val(key).text(value).appendTo(select9);
            //});

            $.getJSON('consigneeAction', {
                customerID : custId,
                consigneeId : consignee_Id
            },function(jsonResponse) {
                var select4 = $('#consigneeAddress'),
                    select9 = $('#consigneeContact');

                select4.find('option').remove();
                select9.find('option').remove();

                // populate consignee address
                $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                    if($("#order_modeOfService").val() == 'DOOR TO DOOR' || $("#order_modeOfService").val() == 'PIER TO DOOR' || $("#order_modeOfService").val() == 'PICKUP' || $("#order_modeOfService").val() == 'DELIVERY' || $("#order_modeOfService").val() == 'INTER-WAREHOUSE' ) {
                        if ($("#shipperConsignee").val() != '') {
                            $('<option>').val(key).text(value).appendTo(select4);
                        } else {
                            if ($("#consigneeAddress").val() != '') {
                                $('<option>').val(null).text("").appendTo(select4);
                            }
                            $('<option>').val(key).text(value).appendTo(select4);
                        }
                    }
                });

                // populate consignee contacts
                $.each(jsonResponse.consigneeContactMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select9);
                });
            });

        });

    });

    //Consignee on Select
    $('#shipperConsignee').change(function(event) {
        var custId = $("#customerName").val();
        var consignee_Id = $("#shipperConsignee").val();

        $.getJSON('consigneeAction', {
            customerID : custId,
            consigneeId : consignee_Id
        },function(jsonResponse) {
            var select4 = $('#consigneeAddress'),
                select9 = $('#consigneeContact');

            select4.find('option').remove();
            select9.find('option').remove();

            // populate consignee address
            $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                if($("#order_modeOfService").val() == 'DOOR TO DOOR' || $("#order_modeOfService").val() == 'PIER TO DOOR' || $("#order_modeOfService").val() == 'PICKUP' || $("#order_modeOfService").val() == 'DELIVERY' || $("#order_modeOfService").val() == 'INTER-WAREHOUSE' ) {
                    if ($("#shipperConsignee").val() != '') {
                        $('<option>').val(key).text(value).appendTo(select4);
                    } else {
                        if ($("#consigneeAddress").val() != '') {
                            $('<option>').val(null).text("").appendTo(select4);
                        }
                        $('<option>').val(key).text(value).appendTo(select4);
                    }
                }
            });

            // populate consignee contacts
            $.each(jsonResponse.consigneeContactMap, function(key, value) {
                $('<option>').val(key).text(value).appendTo(select9);
            });
        });
    });

    //Consignee Address on Select
    $('#consigneeAddress').change(function(event) {
        var custId = $("#customerName").val(),
            address_Id = $("#consigneeAddress").val();

        $.getJSON('addressAction', {
            customerID : custId,
            addressId: address_Id
        },function (jsonResponse) {
            var select3 = $('#shipperConsignee');

            select3.find('option').remove();

            // populate consignee field
            $.each(jsonResponse.customerConsigneeMap, function (key, value) {

                if($("#consigneeAddress").val() != ''){
                    $('<option>').val(key).text(value).appendTo(select3);
                }else{
                    if($("#shipperConsignee").val() != ''){
                        $('<option>').val(null).text("").appendTo(select3);
                    }
                    $('<option>').val(key).text(value).appendTo(select3);
                }
            });
        });
    });

    // Date Time Picker
    var fromDatePickUp = $('#datepicker1');
    var toDateDelivery = $('#datepicker2');
    var ServiceValue= $('#order_modeOfService');

    //pick up date validation
    fromDatePickUp.datepicker({
        // on 5:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {
            if(ServiceValue.val() !='PICKUP'){
                if (toDateDelivery.val() != '') {
                    var testStartDate = fromDatePickUp.datetimepicker('getDate'),
                        testEndDate = toDateDelivery.datetimepicker('getDate');

                    if (testStartDate > testEndDate)
                        toDateDelivery.datetimepicker('setDate', testStartDate);
                }
            } },

        onSelect: function (selectedDateTime){
            toDateDelivery.datetimepicker('option', 'minDate', fromDatePickUp.datetimepicker('getDate') );
        }
    });

    // delivery date validation -jp
    toDateDelivery.datepicker({
        // on 6:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {
            if(ServiceValue.val() !='DELIVERY'){
                if (fromDatePickUp.val() != '') {
                    var testStartDate = fromDatePickUp.datetimepicker('getDate');
                    var testEndDate = toDateDelivery.datetimepicker('getDate');

                    if (testStartDate > testEndDate)
                        fromDatePickUp.datetimepicker('setDate', testEndDate);
                }
            }
        },onSelect: function (selectedDateTime){
            fromDatePickUp.datetimepicker('option', 'maxDate', toDateDelivery.datetimepicker('getDate') );
        }

    });
});

var sReq = select = document.getElementById('order_serviceRequirement');
var sType = select = document.getElementById('order_freightType');
var sMode = select = document.getElementById('order_modeOfService');

$( window ).load(function() {
    //sets local storage data
    setThis();

    //prevents from loading different dropdown values if Trucking is selected as requirement
    for (var i = 0; i < sMode.options.length; i++) {
        if (document.getElementById('order_freightType').value != "TRUCKING") {
            if (sMode.options[i].value == "PICKUP" || sMode.options[i].value == "DELIVERY" || sMode.options[i].value == "INTER-WAREHOUSE") {
                sMode.options[i].style.display = "none";
            } else {
                sMode.options[i].style.display = "block";
            }
        }else{
            if (sMode.options[i].value == "PICKUP" || sMode.options[i].value == "DELIVERY" || sMode.options[i].value == "INTER-WAREHOUSE") {
                sMode.options[i].style.display = "block";
            } else {
                sMode.options[i].style.display = "none";
            }
        }
    }

    for (var i = 0; i < sReq.options.length; i++) {
        if (document.getElementById('order_freightType').value != "TRUCKING") {
            if (sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD") {
                sReq.options[i].style.display = "none";
            } else {
                sReq.options[i].style.display = "block";
            }
        }else{
            if (sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD") {
                sReq.options[i].style.display = "block";
            } else {
                sReq.options[i].style.display = "none";
            }
        }
    }
});

sReq.onchange = function() {
    dynamicDropdown.call(this, sReq ,this.selectedIndex);
};

sType.onchange = function() {
    dynamicDropdown.call(this, sType ,this.selectedIndex);
};

sMode.onchange = function() {
    dynamicDropdown.call(this, sMode, this.selectedIndex);
};

function preventDuplicatePort(select1, select2) {
    select2.find('option').show();
    select2.find('option:contains("'+select1.val()+'")').hide();
}

var select1 = select = document.getElementById('select1');
var select2 = select = document.getElementById('select2');

select2.value = '';

select1.onchange = function () {
    preventDuplicatePort($('#select1'), $('#select2'));
};

select2.onchange = function () {
    preventDuplicatePort($('#select2'), $('#select1'));
};

//to get the customer id for adding new contact person
$(document).ready(function(){
    $("#idCustomer").click(function(){
        var custId = $("#customerName").val();
        getThis();
        if (custId == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
            return false;
        }
        $("#custIdHolder").val(custId);
    });
});

// to get customer id for adding new address
$(document).ready(function(){
    $("#idAddress").click(function(){
        var custId1 = $("#customerName").val();
        getThis();
        if (custId1 == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
            return false;
        }
        $("#custAddIdHolder").val(custId1);
    });
});

// to get customer id for adding new consignee
$(document).ready(function(){
    $("#idConsignee").click(function(){
        var custId2 = $("#customerName").val();
        getThis();
        if (custId2 == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
            return false;
        }
        $("#consigneeAddIdHolder").val(custId2);
    });
});

// to get customer id for editing contact number information
$(document).ready(function(){
    $("#id_Customer").click(function() {
        var custId3 = $("#customerName").val();
        var custPhone = $("#customerPhone").val();
        var custMobile = $("#customerMobile").val();
        var custEmail = $("#customerEmail").val();
        var custFax = $("#customerFax").val();
        getThis();
        if (custId3 == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
            return false;
        }
        $("#customerIdHolder").val(custId3);
        $("#customer_phone").val(custPhone);
        $("#customer_mobile").val(custMobile);
        $("#customer_email").val(custEmail);
        $("#customer_fax").val(custFax);
    });
});

//to get consignee id for adding consignee contact
$(document).ready(function(){

    $("#id_Consignee").click(function() {
        var consigneeId = $("#shipperConsignee").val();
        getThis();
        if (consigneeId == null ){
            alert("Select Consignee First");
            /*$("#shipperConsignee").focus();*/
            return false;
        }
        $("#consigneeIdHolder").val(consigneeId);
    });

});

function getThis(){
    localStorage.setItem("ServiceReqField", $("#order_serviceRequirement").val());
    localStorage.setItem("ServiceModeField", $("#order_modeOfService").val());
    localStorage.setItem("FreightTypeField", $("#order_freightType").val());
    localStorage.setItem("PaymentModeField", $("#order_modeOfPayment").val());
    localStorage.setItem("CustNameField", $("#customerName").val());
    localStorage.setItem("Pickdatefield", $("#datepicker1").val());
    localStorage.setItem("Deldatefield", $("#datepicker2").val());
    localStorage.setItem("OriginPortField", $("#select1").val());
    localStorage.setItem("DestinationPortField", $("#select2").val());
    localStorage.setItem("NotificationField", $("#notification_type").val());
    localStorage.setItem("CommentsField", $("#Comments").val());
    localStorage.setItem("PhoneField", $("#customerPhone_textfield").val());
    localStorage.setItem("Mobilefield", $("#customerMobile_textfield").val());
    localStorage.setItem("EmailField", $("#customerEmail_textfield").val());
    localStorage.setItem("FaxField", $("#customerFax_textfield").val());

}
function setThis()
{
    $("#order_serviceRequirement").val(localStorage.getItem("ServiceReqField"));
    $("#order_modeOfService").val(localStorage.getItem("ServiceModeField"));
    $("#order_freightType").val(localStorage.getItem("FreightTypeField"));
    $("#order_modeOfPayment").val(localStorage.getItem("PaymentModeField"));
    $("#customerName").val(localStorage.getItem("CustNameField"));
    $("#datepicker1").val(localStorage.getItem("Pickdatefield"));
    $("#datepicker2").val(localStorage.getItem("Deldatefield"));
    $("#select1").val(localStorage.getItem("OriginPortField"));
    $("#select2").val(localStorage.getItem("DestinationPortField"));
    $("#notification_type").val(localStorage.getItem("NotificationField"));
    $("#Comments").val(localStorage.getItem("CommentsField"));
    $("#customerPhone_textfield").val(localStorage.getItem("PhoneField"));
    $("#customerMobile_textfield").val(localStorage.getItem("Mobilefield"));
    $("#customerEmail_textfield").val(localStorage.getItem("EmailField"));
    $("#customerFax_textfield").val(localStorage.getItem("FaxField"));
}

$(document).ready(function(){
    $(window).load(function(){
        //        sets the form values
        var custId = $("#customerName").val();
        $.getJSON('customerAction', {
                customerID : custId },
            function(jsonResponse) {
                var select = $('#shipperContact'),
                    select2 = $('#shipperAddress'),
                    select3 = $('#shipperConsignee'),
                    select4 = $('#consigneeAddress'),
                    select5 = $('#customerPhone'),
                    select6 = $('#customerMobile'),
                    select7 = $('#customerEmail'),
                    select8 = $('#customerFax'),
                    select9 = $('#consigneeContact');

                select.find('option').remove();
                select2.find('option').remove();
                select3.find('option').remove();
                select4.find('option').remove();
                select5.find('option').remove();
                select6.find('option').remove();
                select7.find('option').remove();
                select8.find('option').remove();
                select9.find('option').remove();

                // populate customer consignee list
                $.each(jsonResponse.customerContactsMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select);
                });

                // populate customer address list
                $.each(jsonResponse.customerAddressMap, function(key, value) {
                    switch($("#order_modeOfService").val()){
                        case 'DOOR TO PIER' :
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                            break;
                        case 'PIER TO DOOR' :
                            $("#shipperAddress").prop('disabled', true);
                            $("#consigneeAddress").prop('disabled', false);
                            break;
                        case 'PIER TO PIER' :
                            $("#consigneeAddress").prop('disabled', true);
                            $("#shipperAddress").prop('disabled', true);
                            break;
                        case 'PICKUP' :
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                            break;
                        case 'DELIVERY' :
                            $("#consigneeAddress").prop('disabled', false);
                            $("#shipperAddress").prop('disabled', true);
                            break;
                        default :
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', false);
                            $('<option>').val(key).text(value).appendTo(select2);
                            break;
                    }
                });

                // populate customer consignee list
                $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select3);
                });

                // populate customer address list
                $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                    if($("#consigneeAddress").val() != ''){
                        if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER' ||  $("#order_modeOfService").val() == 'DELIVERY'){
                            $('<option>').val(null).text("").appendTo(select4);
                        }
                        $('<option>').val(key).text(value).appendTo(select4);
                    }else{
                        $('<option>').val(key).text(value).appendTo(select4);
                    }
                });

                // populate customer phone
                $.each(jsonResponse.customerPhoneMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select5);
                    var customerPhone = $("#customerPhone").val();
                    document.getElementById("customerPhone_textfield").value = customerPhone;
                });

                // populate customer mobile
                $.each(jsonResponse.customerMobileMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select6);
                    var customerMobile = $("#customerMobile").val();
                    document.getElementById("customerMobile_textfield").value = customerMobile;
                });

                // populate customer email
                $.each(jsonResponse.customerEmailMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select7);
                    var customerEmail = $("#customerEmail").val();
                    document.getElementById("customerEmail_textfield").value = customerEmail;
                });

                // populate customer fax
                $.each(jsonResponse.customerFaxMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select8);
                    var customerFax = $("#customerFax").val();
                    document.getElementById("customerFax_textfield").value = customerFax;
                });

                // populate consignee contacts
                $.each(jsonResponse.consigneeContactMap, function(key, value) {
                    $('<option>').val(key).text(value).appendTo(select9);
                });
            }
        );
        localStorage.clear();
    });
});

/*Mask input fields*/
$(document).ready(function(){
    $("#contact_phone").mask("(999) 999-9999");
    $("#customer_phone").mask("(999) 999-9999");
    $("#contact_mobile").mask("(+63999)(999-9999)");
    $("#customer_mobile").mask("(+63999)(999-9999)");
    $("#contact_fax").mask("(999) 999-9999");
    $("#consignee_phone").mask("(999) 999-9999");
    $("#consignee_mobile").mask("(+63999)(999-9999)");
    $("#consignee_fax").mask("(999) 999-9999");
    $("#customer_fax").mask("(999) 999-9999");
    $("#consignee_contact_phone").mask("(999) 999-9999");
    $("#consignee_contact_mobile").mask("(+63999)(999-9999)");
    $("#consignee_contact_fax").mask("(999) 999-9999");

    validationForm('bookingInput', 'nextBtn', 'BOOKING');
});

function dynamicDropdown(select, index) {
    var opt = select.options,
        lent = opt.length;

    while ( lent-- ){
        opt[ lent ].disabled = false;
    }

    switch(select.options[ index ].value){
        case 'DOOR TO PIER' :
            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").val('');
            $("#consigneeAddress").prop('disabled', true);
            break;
        case 'PIER TO DOOR' :
            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', true);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');
            break;
        default :
            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');
            break;
    }

    // IF PICKUP IS SELECTED
    switch(select.options[index].value){
        case 'PICKUP' :
            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#datepicker2").prop('disabled', true);
            $("#datepicker1").prop('disabled', false);
            $("#datepicker2").val('');
            $("#datepicker1").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").val('');
            $("#consigneeAddress").prop('disabled', true);
            break;
        case 'DELIVERY' :
            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#datepicker1").prop('disabled', true);
            $("#datepicker2").prop('disabled', false);
            $("#datepicker2").val('');
            $("#datepicker1").val('');
            $("#shipperAddress").prop('disabled', true);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');
            break;
        case 'INTER-WAREHOUSE' :
            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#datepicker1").prop('disabled', false);
            $("#datepicker2").prop('disabled', false);
            $("#datepicker2").val('');
            $("#datepicker1").val('');
            break;
    }



    // If Service Mode is Pier to Pier
    if (select.options[ index ].value === 'PIER TO PIER') {
        for (var i = 0; i < sType.options.length; i++){
            if(sType.options[i].value == "SHIPPING"){
                sType.options[i].disabled = false;
                sType.options[i].selected = true;
            }
        }
        $("#customerName").val('');
        $("#shipperContact").val('');
        $("#shipperAddress").prop('disabled', true);
        $("#shipperAddress").val('');
        $("#shipperConsignee").val('');
        $("#consigneeAddress").prop('disabled', true);
        $("#consigneeAddress").val('');
    }else{
        for (var i = 0; i < sType.options.length; i++){
            if(sType.options[i].value == "SHIPPING AND TRUCKING"){
                sType.options[i].disabled = false;
            }
        }
    }

    // If Service Type is Shipping
    if (select.options[ index ].value === 'SHIPPING'){
        $("#select1").val('');
        $("#select2").val('');
        $('#datepicker1').val('');
        $('#datepicker2').val('');
        $('#datepicker1').prop('disabled' , false);
        $('#datepicker2').prop('disabled' , false);
        $('#select1').prop('disabled', false);
        $('#select2').prop('disabled', false);
        $("#order_modeOfPayment").val('');
        $("#order_modeOfPayment").val('');
        $("#customerPhone_textfield").val('');
        $("#customerMobile_textfield").val('');
        $("#customerEmail_textfield").val('');
        $("#customerFax_textfield").val('');
        $("#Comments").val('');
        $("#consigneeContact").val('');

        for (var i = 0; i < sMode.options.length; i++){
            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].style.display = "block";
                sMode.options[i].selected = true;
            }else{
                sMode.options[i].style.display = "none";
            }
        }

        for (var i = 0; i < sReq.options.length; i++){
            $("#order_serviceRequirement").val('');
            if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                sReq.options[i].style.display = "none";
            }else{
                sReq.options[i].style.display = "block";
            }
        }
    }
    // If Service Type is Shipping and Trucking
    if (select.options[ index ].value === 'SHIPPING AND TRUCKING') {
        $("#select1").val('');
        $("#select2").val('');
        $("#order_modeOfService").val('');
        $('#datepicker1').val('');
        $('#datepicker2').val('');
        $('#datepicker1').prop('disabled' , false);
        $('#datepicker2').prop('disabled' , false);
        $('#select1').prop('disabled',false);
        $('#select2').prop('disabled',false);
        $("#order_modeOfPayment").val('');
        $("#order_modeOfPayment").val('');
        $("#customerPhone_textfield").val('');
        $("#customerMobile_textfield").val('');
        $("#customerEmail_textfield").val('');
        $("#customerFax_textfield").val('');
        $("#Comments").val('');
        $("#consigneeContact").val('');
        for (var i = 0; i < sMode.options.length; i++) {
            $("#order_modeOfService").val('');
            if(sMode.options[i].value == "DOOR TO DOOR" || sMode.options[i].value == "DOOR TO PIER" || sMode.options[i].value == "PIER TO DOOR"){
                sMode.options[i].style.display = "block";
            }else{
                sMode.options[i].style.display = "none";
            }
        }

        for (var i = 0; i < sReq.options.length; i++){
            $("#order_serviceRequirement").val('');
            if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                sReq.options[i].style.display = "none";
            }else{
                sReq.options[i].style.display = "block";
            }
        }
    }
    // If Service Type is Trucking
    if (select.options[ index ].value === 'TRUCKING'){
        $('#select1').val('');
        $('#select2').val('');
        $("#select1").prop('disabled', true);
        $("#select2").prop('disabled', true);
        $('#datepicker1').val('');
        $('#datepicker2').val('');
        $('#datepicker1').prop('disabled' , false);
        $('#datepicker2').prop('disabled' , false);
        $("#order_modeOfPayment").val('');
        $("#customerPhone_textfield").val('');
        $("#customerMobile_textfield").val('');
        $("#customerEmail_textfield").val('');
        $("#customerFax_textfield").val('');
        $("#Comments").val('');
        $("#consigneeContact").val('');
        for (var i = 0; i < sMode.options.length; i++){
            $("#order_modeOfService").val('');
            if(sMode.options[i].value == "PICKUP" || sMode.options[i].value == "DELIVERY" || sMode.options[i].value == "INTER-WAREHOUSE"){
                sMode.options[i].style.display = "block";
            }else{
                sMode.options[i].style.display = "none";
            }
        }
        for (var i = 0; i < sReq.options.length; i++){
            $("#order_serviceRequirement").val('');
            if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                sReq.options[i].style.display = "block";
            }else{
                sReq.options[i].style.display = "none";
            }
        }
    }

}