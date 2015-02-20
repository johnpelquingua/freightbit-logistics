/**
 * Created by Jan on 1/21/2015.
 */
// AUTHORED BY Jan Sarmiento -- START
$(document).ready(function(){

    $('.containerSizeDropdown').change(function(){
        var declaredValField = $('.automaticDeclaredValue');
        var quantityClearField = $('#orderItem_quantityFCL');
        var declaredValFCL = document.getElementById('orderItem_declaredValues').value;
        var quantityFCL = document.getElementById('orderItem_quantityFCL').value;

        var totalValue = 0;
        switch($(this).val()){
            case '10 FOOTER' :
                if (document.getElementById('orderItem_quantityFCL').value == "1") {
                    declaredValField.val('250000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "2") {
                    declaredValField.val('500000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "3") {
                    declaredValField.val('750000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "4") {
                    declaredValField.val('1000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "5") {
                    declaredValField.val('1250000.00');
                }
                else{
                    declaredValField.val('250000.00');
                }
                break;
            case '20 FOOTER' :
                if (document.getElementById('orderItem_quantityFCL').value == "1") {
                    declaredValField.val('500000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "2") {
                    declaredValField.val('1000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "3") {
                    declaredValField.val('1500000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "4") {
                    declaredValField.val('2000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "5") {
                    declaredValField.val('2500000.00');
                }
                else{
                    declaredValField.val('500000.00');
                }
                break;
            case '40 STD FOOTER' :
                if (document.getElementById('orderItem_quantityFCL').value == "1") {
                    declaredValField.val('1000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "2") {
                    declaredValField.val('2000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "3") {
                    declaredValField.val('3000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "4") {
                    declaredValField.val('4000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "5") {
                    declaredValField.val('5000000.00');
                }
                else{
                    declaredValField.val('1000000.00');
                }
                break;
            case '40 HC FOOTER' :
                if (document.getElementById('orderItem_quantityFCL').value == "1") {
                    declaredValField.val('1000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "2") {
                    declaredValField.val('2000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "3") {
                    declaredValField.val('3000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "4") {
                    declaredValField.val('4000000.00');
                }
                else if(document.getElementById('orderItem_quantityFCL').value == "5") {
                    declaredValField.val('5000000.00');
                }
                else{
                    declaredValField.val('1000000.00');
                }
                break;
            default :
                declaredValField.val('');
        }
    });

    if($('.cargoContainerSavingTable tbody tr').size() == 0){
        $('.cargoContainerSavingTableDiv').hide()
        $('.cargoContainerSavingTableLoadingDiv').show();
    }

    $('.containerQuantityDropdown').change(function () {
        var quantityFCL = document.getElementById('orderItem_quantityFCL').value;
        var totalValue = 0;

        if (document.getElementById('orderItem.nameSize').value == "10 FOOTER") {
            totalValue = quantityFCL * 250000; // compute for total value
            document.getElementById("orderItem_declaredValues").value = totalValue.toFixed(2); // set total value to the order item value textfield
        }
        else if (document.getElementById('orderItem.nameSize').value == "20 FOOTER") {
            totalValue = quantityFCL * 500000; // compute for total value
            document.getElementById("orderItem_declaredValues").value = totalValue.toFixed(2); // set total value to the order item value textfield
        }
        else if (document.getElementById('orderItem.nameSize').value == "40 STD FOOTER") {
            totalValue = quantityFCL * 1000000; // compute for total value
            document.getElementById("orderItem_declaredValues").value = totalValue.toFixed(2); // set total value to the order item value textfield
        }
        else if (document.getElementById('orderItem.nameSize').value == "40 HC FOOTER") {
            totalValue = quantityFCL * 1000000; // compute for total value
            document.getElementById("orderItem_declaredValues").value = totalValue.toFixed(2); // set total value to the order item value textfield
        }
    });

    // adding item memory
    $('.addItemToList').click(function(){
        localStorage.setItem('addingItems', true);
    });

    $('.addContainerToList').click(function(){
        localStorage.setItem('addingContainer', true);
    });

    addTotalRate();
    newlineHandler('itemListing', 8);
    actionConfirmation($('.itemListingDeleteActionIcon'), $('.itemListingDeleteConfirmBtn'), $('#itemListingDeleteModal'));
});

// function to check if adding item memory exists
$(function(){
    if(localStorage.getItem('addingItems') || localStorage.getItem('addingContainer')){
        $('.addItemDiv').focus();
    }
});

// THIS FUNCTION HIDES THE WEIGHT AND VOLUME FIELD IF THE SERVICE REQ IS FULL CONTAINER LOAD
$(function(){
    if($('.serviceReq').text() == 'FULL CONTAINER LOAD'){
        $('.weightAndVolume').hide();
    }
});
// END

function getThis(){
    localStorage.setItem("itemQuantityField",$("#orderItem_quantity").val());
    localStorage.setItem("itemQuantityFCLField",$("#orderItem_quantityFCL").val());
    localStorage.setItem("itemNameField",$("#itemName").val());
    localStorage.setItem("itemRateField",$("#orderItem_rate").val());
    localStorage.setItem("itemDescriptionField",$("#orderItem_description_textfield").val());
    localStorage.setItem("itemWeightField", $("#orderItem_weight").val());
    localStorage.setItem("itemVolumeField",$("#orderItem_volume_textfield").val());
    localStorage.setItem("itemRemarksField",$("#orderItem_remarks").val());
    localStorage.setItem("itemValueField",$("#orderItem_declaredValue_textfield").val());
    localStorage.setItem("itemDeclaredValueField",$("#orderItem_declaredValues").val());
}

function setThis(){
    $("#orderItem_quantity").val(localStorage.getItem("itemQuantityField"));
    $("#orderItem_quantityFCL").val(localStorage.getItem("itemQuantityFCLField"));
    $("#itemName").val(localStorage.getItem("itemNameField"));
    $("#orderItem_rate").val(localStorage.getItem("itemRateField"));
    $("#orderItem_description_textfield").val(localStorage.getItem("itemDescriptionField"));
    $("#orderItem_weight").val(localStorage.getItem("itemWeightField"));
    $("#orderItem_volume_textfield").val(localStorage.getItem("itemVolumeField"));
    $("#orderItem_remarks").val(localStorage.getItem("itemRemarksField"));
    $("#orderItem_declaredValue_textfield").val(localStorage.getItem("itemValueField"));
    $("#orderItem_declaredValues").val(localStorage.getItem("itemDeclaredValueField"));
}

$( window ).load(function() {
    setThis();
    localStorage.clear();
});

function alphaKeyOnly(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    if ((charCode > 32 && charCode < 57)||(charCode > 57 && charCode <65) || (charCode > 90 && charCode < 97) )
        return false;

    return true;
}

function isNumberKey(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57) || (charCode == 46 && $(this).val().indexOf('.') != -1))
        return false;

    return true;
}

$(document).ready(function() {
    $("#orderItem_rate").maskMoney();
    $("#orderItem_declaredValues").maskMoney();
    $("#item_srp").maskMoney();
    $("#orderItem_rate").maskMoney();
    $("#orderItem_weight").mask('9,999,999');
    $("#orderItem-volume").mask('9,999,999');
//    $("#orderItemVolume").mask('9,999,999');
    $("#orderItem_volume_textfield").mask('9,999,999');
    $("#orderItem_declaredValues").maskMoney();
    $("#orderItem_declaredValue_textfield").maskMoney();
});

$("#item_itemCode").keyup(function(){
    this.value=this.value.toUpperCase();
});

//to get the customer id
$(document).ready(function(){
    $("#idCustomer").click(function(){
        var custId = $("#custIdHolder").val();
        getThis();
        $("#customerIdHolder").val(custId);
    });
});

$(document).ready(function() {
    // Anchor on successDiv on every add order item
    if ($('#successDiv').length !== 0){
        window.location.href = '#successDiv';
    }

    // On click event of Item name change
    $("#itemName").bind('input', function () {
        var x = $('#itemName').val();
        var z = $('#items');
        var val = $(z).find('option[value="' + x + '"]');
        var item_Id = val.attr('id');

        if(item_Id == '') {
            document.getElementById("orderItem_volume_textfield").value = '';
            document.getElementById("orderItem_description_textfield").value = '';
            document.getElementById("orderItem_declaredValue_textfield").value = '';
            document.getElementById("orderItem_weight_textfield").value = '';
        }

        $.getJSON('itemAction', {
                itemId: item_Id
        },function (jsonResponse) {
            var select = $('#orderItem_volume'),
                select2 = $('#orderItem_description'),
                select3 = $('#orderItem_declaredValue'),
                select4 = $('#orderItem_weight');

            select.find('option').remove();
            select2.find('option').remove();
            select3.find('option').remove();
            select4.find('option').remove();

            var itemQuantity = $("#orderItem_quantity").val();
            // Set quantity to 1 when Item name is selected first
            if(itemQuantity == '') {
                document.getElementById("orderItem_quantity").value = 1;
            }

            // populate item volume based on length X Width X Height
            $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select);
                var orderItem_volume = $("#orderItem_volume"); // get value of volume

                document.getElementById("orderItem_volume_textfield").value = orderItem_volume.val(); // set volume of Item volume textfield
                var totalVolume = $("#orderItem_quantity").val() * orderItem_volume.val(); // compute for total volume
                orderItem_volume.html(""); // clear list of order Item volume dropdown
                var newOption = $('<option value="'+totalVolume+'">'+totalVolume+'</option>'); // append new value to the dropdown list
                orderItem_volume.append(newOption);
                document.getElementById("orderItem_volume_textfield").value = totalVolume; // set total volume to the order item volume textfield
            });

            // populate item description
            $.each(jsonResponse.shipperItemCommodityMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select2);
                document.getElementById("orderItem_description_textfield").value = $("#orderItem_description").val();
            });

            // populate item declared value
            $.each(jsonResponse.shipperItemValueMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select3);
                document.getElementById("orderItem_declaredValue_textfield").value = $("#orderItem_declaredValue").val(); // set value of order item to textfield
                var totalValue = $("#orderItem_quantity").val() * $("#orderItem_declaredValue").val(); // compute for total value
                $("#orderItem_declaredValue").html(""); // clear list of order Item value dropdown
                var newOption2 = $('<option value="'+totalValue+'">'+totalValue+'</option>'); // append new value to the dropdown list
                $("#orderItem_declaredValue").append(newOption2);
                document.getElementById("orderItem_declaredValue_textfield").value = totalValue; // set total value to the order item value textfield
            });

            // populate item declared weight
            $.each(jsonResponse.shipperItemWeightMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select4);
                document.getElementById("orderItem_weight_textfield").value = $("#orderItem_weight").val(); // set weight of order item to textfield
                var totalWeight = $("#orderItem_quantity").val() * $("#orderItem_weight").val(); // compute for total value
                $("#orderItem_weight").html(""); // clear list of order Item weight dropdown
                var newOption3 = $('<option value="'+totalWeight+'">'+totalWeight+'</option>'); // append new value to the dropdown list
                $("#orderItem_weight").append(newOption3);
                document.getElementById("orderItem_weight_textfield").value = totalWeight; // set total value to the order item value textfield
            });

        });

    });

    // On click event of Item Quantity change
    $('#orderItem_quantity').change(function(event) {
        var x = $('#itemName').val(),
            z = $('#items'),
            val = $(z).find('option[value="' + x + '"]'),
            item_Id = val.attr('id');

        if(item_Id == '') {
            document.getElementById("orderItem_volume_textfield").value = '';
            document.getElementById("orderItem_description_textfield").value = '';
            document.getElementById("orderItem_declaredValue_textfield").value = '';
            document.getElementById("orderItem_weight_textfield").value = '';
        }

        $.getJSON('itemAction', {
                itemId: item_Id
        },function (jsonResponse){
            var select = $('#orderItem_volume'),
                select2 = $('#orderItem_description'),
                select3 = $('#orderItem_declaredValue'),
                select4 = $('#orderItem_weight');

            select.find('option').remove();
            select2.find('option').remove();
            select3.find('option').remove();
            select4.find('option').remove();

            // populate item volume based on length X Width X Height
            $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select);
                document.getElementById("orderItem_volume_textfield").value = $("#orderItem_volume").val(); // set volume of Item volume textfield
                var totalVolume = $("#orderItem_quantity").val() * $("#orderItem_volume").val(); // compute for total volume
                $("#orderItem_volume").html(""); // clear list of order Item volume dropdown
                var newOption = $('<option value="'+totalVolume+'">'+totalVolume+'</option>'); // append new value to the dropdown list
                $("#orderItem_volume").append(newOption);
                document.getElementById("orderItem_volume_textfield").value = totalVolume; // set total volume to the order item volume textfield

            });

            // populate item description
            $.each(jsonResponse.shipperItemCommodityMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select2);
                document.getElementById("orderItem_description_textfield").value = $("#orderItem_description").val();
            });

            // populate item declared value
            $.each(jsonResponse.shipperItemValueMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select3);
                document.getElementById("orderItem_declaredValue_textfield").value = $("#orderItem_declaredValue").val(); // set value of order item to textfield
                var totalValue = $("#orderItem_quantity").val() * $("#orderItem_declaredValue").val(); // compute for total value
                $("#orderItem_declaredValue").html(""); // clear list of order Item value dropdown
                var newOption2 = $('<option value="'+totalValue+'">'+totalValue+'</option>'); // append new value to the dropdown list
                $("#orderItem_declaredValue").append(newOption2);
                document.getElementById("orderItem_declaredValue_textfield").value = totalValue; // set total value to the order item value textfield
            });

            // populate item declared weight
            $.each(jsonResponse.shipperItemWeightMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select4);
                document.getElementById("orderItem_weight_textfield").value = $("#orderItem_weight").val(); // set weight of order item to textfield
                var totalWeight = $("#orderItem_quantity").val() * $("#orderItem_weight").val(); // compute for total value
                $("#orderItem_weight").html(""); // clear list of order Item weight dropdown
                var newOption3 = $('<option value="'+totalWeight+'">'+totalWeight+'</option>'); // append new value to the dropdown list
                $("#orderItem_weight").append(newOption3);
                document.getElementById("orderItem_weight_textfield").value = totalWeight; // set total value to the order item value textfield
            });
        });
    });
});

// On dropdown change
function dynamicDropdown(select, index) {
    var opt = select.options,
        lent = opt.length;

    while (lent--) {
        opt[ lent ].disabled = false;
    }

    /*To compute for total tons and weight for FCL*/
    if (sContainer.value != ''){
        switch(sContainer.value){
            case '10 FOOTER' :
                document.getElementById("orderItem-volume").value = sQuantity.value * 14;
                document.getElementById("orderItem_weight").value = sQuantity.value * 9000;
                break;
            case '20 FOOTER' :
                document.getElementById("orderItem-volume").value = sQuantity.value * 28;
                document.getElementById("orderItem_weight").value = sQuantity.value * 18000;
                break;
            case '40 STD FOOTER' :
                document.getElementById("orderItem-volume").value = sQuantity.value * 56;
                document.getElementById("orderItem_weight").value = sQuantity.value * 20000;
                break;
            case '40 HC FOOTER' :
                document.getElementById("orderItem-volume").value = sQuantity.value * 78;
                document.getElementById("orderItem_weight").value = sQuantity.value * 22000;
                break;
        }
    }

    if (select.options[ index ].value === '') {
        document.getElementById("orderItem-volume").value = "";
//            document.getElementById("orderItemVolume").value = "";
    }

    if (select.options[ index ].value === '10 FOOTER') {
        var containerQuantityNull = document.getElementById("orderItem.quantity").value;
        if(containerQuantityNull == '') {
            document.getElementById("orderItem_weight").value = 9000;
            document.getElementById("orderItem.quantity").value = 1;
            document.getElementById("orderItem-volume").value = "14";
//                document.getElementById("orderItemVolume").value = "14";
        }else{
            var containerQuantity = document.getElementById("orderItem.quantity").value;
            var containerVolume = containerQuantity * 14;
            document.getElementById("orderItem_weight").value = 9000;
            document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
        }
    }

    if (select.options[ index ].value === '20 FOOTER') {
        var containerQuantityNull = document.getElementById("orderItem.quantity").value;
        if(containerQuantityNull == '') {
            document.getElementById("orderItem_weight").value = 18000;
            document.getElementById("orderItem.quantity").value = 1;
            document.getElementById("orderItem-volume").value = "28";
//                document.getElementById("orderItemVolume").value = "28";
        }else {
            var containerQuantity = document.getElementById("orderItem.quantity").value;
            var containerVolume = containerQuantity * 28;
            document.getElementById("orderItem_weight").value = 18000;
            document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
        }
    }

    if (select.options[ index ].value === '40 STD FOOTER') {
        var containerQuantity = document.getElementById("orderItem.quantity").value;
        if(containerQuantity == '') {
            document.getElementById("orderItem_weight").value = 20000;
            document.getElementById("orderItem.quantity").value = 1;
            document.getElementById("orderItem-volume").value = "56";
//                document.getElementById("orderItemVolume").value = "56";
        }else {
            var containerQuantity = document.getElementById("orderItem.quantity").value;
            var containerVolume = containerQuantity * 56;
            document.getElementById("orderItem_weight").value = 20000;
            document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
        }
    }

    if (select.options[ index ].value === '40 HC FOOTER') {
        var containerQuantity = document.getElementById("orderItem.quantity").value;
        if(containerQuantity == '') {
            document.getElementById("orderItem_weight").value = 22000;
            document.getElementById("orderItem.quantity").value = 1;
            document.getElementById("orderItem-volume").value = "78";
//                document.getElementById("orderItemVolume").value = "78";
        }else {
            var containerQuantity = document.getElementById("orderItem.quantity").value;
            var containerVolume = containerQuantity * 78;
            document.getElementById("orderItem_weight").value = 22000;
            document.getElementById("orderItem-volume").value = containerVolume;
//                document.getElementById("orderItemVolume").value = containerVolume;
        }
    }
}

$(document).ready(function(){
    validationForm('addItemInput', 'saveBtnModal');
});

var sContainer = select = document.getElementById('orderItem.nameSize');
var sQuantity = select = document.getElementById('orderItem_quantityFCL');

sContainer.onchange = function () {
    dynamicDropdown.call(this, sContainer, this.selectedIndex);
};
if(sQuantity != null){
    sQuantity.onchange = function () {
        dynamicDropdown.call(this, sQuantity, this.selectedIndex);
    };
}
