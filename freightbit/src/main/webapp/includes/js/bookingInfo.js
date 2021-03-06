/**
 * Created by Jan on 1/21/2015.
 */
// AUTHORED BY Jan Sarmiento -- START
$(document).ready(function(){

    if($('.cargoContainerSavingTable tbody tr').size() == 0){
        $('.cargoContainerSavingTableDiv').hide()
        $('.cargoContainerSavingTableLoadingDiv').show();
    }

    if($('.itemListing tbody tr').size() == 0){
        //$('.tableDiv').hide()
        $('.emptyContainerItemListing').show();
    }

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
    containerHandler('itemListing', 2, 3, 4);
    containerHandler('cargoContainerSavingTable', 2, 3, 4);
});

if($('.cargoContainerSavingTable tbody tr').size() == 0){
    $('.cargoContainerSavingTableDiv').hide()
    $('.cargoContainerSavingTableLoadingDiv').show();
}

$( window ).load(function() {
    $('.addItemDiv').focus();
});

// THIS FUNCTION HIDES THE WEIGHT AND VOLUME FIELD IF THE SERVICE REQ IS FULL CONTAINER LOAD
$(function(){
    if($('.serviceReq').text() == 'FULL CONTAINER LOAD' || $('.serviceReq').text() == 'FULL TRUCK LOAD'){
        $('.weightAndVolume').hide();
    }
});
// END

// function to check if adding item memory exists
$(function(){
    if(localStorage.getItem('addingItems') || localStorage.getItem('addingContainer')){
        $('.addItemDiv').focus();
    }
});

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
    if(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57) || (charCode == 46 && $(this).val().indexOf('.') != -1)){
        return false;
    }

    return true;
}

$(document).ready(function() {
    $("#orderItem_rate").maskMoney();
    $("#orderItem_declaredValues").maskMoney();
    $("#orderItem_declaredValue_textfield").maskMoney();
    $("#item_srp").maskMoney();
    $("#item_weight").maskMoney({precision:0});
    $("#orderItem_weight").maskMoney({precision:0});
    $("#orderItem_weight_textfield").maskMoney({precision:0});
    $("#orderItem-volume").maskMoney({precision:0});
    $("#orderItem_length").maskMoney({precision:0});
    $("#orderItem_length_textfield").maskMoney({precision:0});
    $("#orderItem_width").maskMoney({precision:0});
    $("#orderItem_width_textfield").maskMoney({precision:0});
    $("#orderItem_height").maskMoney({precision:0});
    $("#orderItem_height_textfield").maskMoney({precision:0});
});

$("#item_itemCode").keyup(function(){
    this.value = this.value.toUpperCase();
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
            document.getElementById("orderItem_itemCode_textfield").value = '';
            document.getElementById("orderItem_length_textfield").value = '';
            document.getElementById("orderItem_width_textfield").value = '';
            document.getElementById("orderItem_height_textfield").value = '';
        }

        $.getJSON('itemAction', {
                itemId: item_Id
        },function (jsonResponse) {
            var select = $('#orderItem_volume'),
                select2 = $('#orderItem_description'),
                select3 = $('#orderItem_declaredValue'),
                select4 = $('#orderItem_weight'),
                select5 = $('#orderItem_itemCode'),
                select6 = $('#orderItem_length'),
                select7 = $('#orderItem_width'),
                select8 = $('#orderItem_height'),
                select9 = $('#orderItem_remarks'),
                serviceReq = $('.serviceReq');

                select.find('option').remove();
                select2.find('option').remove();
                select3.find('option').remove();
                select4.find('option').remove();
                select5.find('option').remove();
                select6.find('option').remove();
                select7.find('option').remove();
                select8.find('option').remove();
                select9.find('option').remove();

            var itemQuantity = $("#orderItem_quantity").val();
            // Set quantity to 1 when Item name is selected first
            if(itemQuantity == '') {
                document.getElementById("orderItem_quantity").value = 1;
            }

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

            $.each(jsonResponse.shipperItemCodeMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select5);
                document.getElementById("orderItem_itemCode_textfield").value = $("#orderItem_itemCode").val();
            });

            $.each(jsonResponse.shipperItemLengthMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select6);
                document.getElementById("orderItem_length_textfield").value = (parseInt($("#orderItem_length").val())).toPrecision(1);
                var totalLength = $('#orderItem_quantity').val() * (parseInt($("#orderItem_length").val())).toPrecision(1);
                $("#orderItem_length").html(""); // clear list of order Item length dropdown
                var newOption4 = $('<option value="'+totalLength+'">'+totalLength+'</option>'); // append new value to the dropdown list
                $("#orderItem_length").append(newOption4);
                document.getElementById("orderItem_length_textfield").value = totalLength; // set total value to the order item length textfield
            });

            $.each(jsonResponse.shipperItemWidthMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select7);
                document.getElementById("orderItem_width_textfield").value = (parseInt($("#orderItem_width").val())).toPrecision(1);
                var totalWidth = $('#orderItem_quantity').val() * (parseInt($("#orderItem_width").val())).toPrecision(1);
                $("#orderItem_width").html(""); // clear list of order Item width dropdown
                var newOption5 = $('<option value="'+totalWidth+'">'+totalWidth+'</option>'); // append new value to the dropdown list
                $("#orderItem_width").append(newOption5);
                document.getElementById("orderItem_width_textfield").value = totalWidth; // set total value to the order item width textfield
            });

            $.each(jsonResponse.shipperItemHeightMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select8);
                document.getElementById("orderItem_height_textfield").value = (parseInt($("#orderItem_height").val())).toPrecision(1);
                var totalHeight = $('#orderItem_quantity').val() * (parseInt($("#orderItem_height").val())).toPrecision(1);
                $("#orderItem_height").html(""); // clear list of order Item height dropdown
                var newOption6 = $('<option value="'+totalHeight+'">'+totalHeight+'</option>'); // append new value to the dropdown list
                $("#orderItem_height").append(newOption6);
                document.getElementById("orderItem_height_textfield").value = totalHeight; // set total value to the order item height textfield
            });

            $.each(jsonResponse.shipperItemCommentsMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select9);
                document.getElementById("orderItem_remarks_textarea").value = $("#orderItem_remarks").val();
            });

            // populate item volume based on length X Width X Height
            $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select);

                var orderItemQuantity = $("#orderItem_quantity").val(),
                    orderItemLength = $("#orderItem_length").val(),
                    orderItemWidth = $("#orderItem_width").val(),
                    orderItemHeight = $("#orderItem_height").val(),
                    orderItem_volume = $("#orderItem_volume"),
                    orderItemVolume;

                    orderItemVolume = orderItemQuantity * (orderItemLength * orderItemWidth * orderItemHeight);
                    orderItem_volume.html("");
                    var newOption = $('<option value="'+orderItemVolume+'">'+orderItemVolume+'</option>'); // append new value to the dropdown list
                    orderItem_volume.append(newOption);
                    document.getElementById("orderItem_volume_textfield").value = orderItemVolume; // set total volume to the order item volume textfield
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
                select4 = $('#orderItem_weight'),
                select5 = $('#orderItem_itemCode'),
                select6 = $('#orderItem_length'),
                select7 = $('#orderItem_width'),
                select8 = $('#orderItem_height'),
                select9 = $('#orderItem_remarks'),
                serviceReq = $('.serviceReq');

                select.find('option').remove();
                select2.find('option').remove();
                select3.find('option').remove();
                select4.find('option').remove();
                select5.find('option').remove();
                select6.find('option').remove();
                select7.find('option').remove();
                select8.find('option').remove();
                select9.find('option').remove();

            if(serviceReq == 'FULL CONTAINER LOAD' || serviceReq == 'FULL TRUCK LOAD') {

                // populate item volume based on length X Width X Height
                $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                    $('<option>').val(key).text(value).appendTo(select);
                    document.getElementById("orderItem_volume_textfield").value = $("#orderItem_volume").val(); // set volume of Item volume textfield
                    var totalVolume = $("#orderItem_quantity").val() * $("#orderItem_volume").val(); // compute for total volume
                    $("#orderItem_volume").html(""); // clear list of order Item volume dropdown
                    var newOption = $('<option value="' + totalVolume + '">' + totalVolume + '</option>'); // append new value to the dropdown list
                    $("#orderItem_volume").append(newOption);
                    document.getElementById("orderItem_volume_textfield").value = totalVolume; // set total volume to the order item volume textfield

                });
            }

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

            $.each(jsonResponse.shipperItemCodeMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select5);
                document.getElementById("orderItem_itemCode_textfield").value = $("#orderItem_itemCode").val();
            });

            $.each(jsonResponse.shipperItemLengthMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select6);
                document.getElementById("orderItem_length_textfield").value = (parseInt($("#orderItem_length").val())).toPrecision(1);
                var totalLength = $('#orderItem_quantity').val() * (parseInt($("#orderItem_length").val())).toPrecision(1);
                $("#orderItem_length").html(""); // clear list of order Item length dropdown
                var newOption4 = $('<option value="'+totalLength+'">'+totalLength+'</option>'); // append new value to the dropdown list
                $("#orderItem_length").append(newOption4);
                document.getElementById("orderItem_length_textfield").value = totalLength; // set total value to the order item length textfield
            });

            $.each(jsonResponse.shipperItemWidthMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select7);
                document.getElementById("orderItem_width_textfield").value = (parseInt($("#orderItem_width").val())).toPrecision(1);
                var totalWidth = $('#orderItem_quantity').val() * (parseInt($("#orderItem_width").val())).toPrecision(1);
                $("#orderItem_width").html(""); // clear list of order Item width dropdown
                var newOption5 = $('<option value="'+totalWidth+'">'+totalWidth+'</option>'); // append new value to the dropdown list
                $("#orderItem_width").append(newOption5);
                document.getElementById("orderItem_width_textfield").value = totalWidth; // set total value to the order item width textfield
            });

            $.each(jsonResponse.shipperItemHeightMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select8);
                document.getElementById("orderItem_height_textfield").value = (parseInt($("#orderItem_height").val())).toPrecision(1);
                var totalHeight = $('#orderItem_quantity').val() * (parseInt($("#orderItem_height").val())).toPrecision(1);
                $("#orderItem_height").html(""); // clear list of order Item height dropdown
                var newOption6 = $('<option value="'+totalHeight+'">'+totalHeight+'</option>'); // append new value to the dropdown list
                $("#orderItem_height").append(newOption6);
                document.getElementById("orderItem_height_textfield").value = totalHeight; // set total value to the order item height textfield
            });

            $.each(jsonResponse.shipperItemCommentsMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select9);
                document.getElementById("orderItem_remarks_textarea").value = $("#orderItem_remarks").val();
            });

            // populate item volume based on length X Width X Height
            $.each(jsonResponse.shipperItemVolumeMap, function (key, value) {
                $('<option>').val(key).text(value).appendTo(select);

                var orderItemQuantity = $("#orderItem_quantity").val(),
                    orderItemLength = $("#orderItem_length").val(),
                    orderItemWidth = $("#orderItem_width").val(),
                    orderItemHeight = $("#orderItem_height").val(),
                    orderItem_volume = $("#orderItem_volume"),
                    orderItemVolume;

                    orderItemVolume = orderItemQuantity * (orderItemLength * orderItemWidth * orderItemHeight);
                    orderItem_volume.html("");
                    var newOption = $('<option value="'+orderItemVolume+'">'+orderItemVolume+'</option>'); // append new value to the dropdown list
                    orderItem_volume.append(newOption);
                    document.getElementById("orderItem_volume_textfield").value = orderItemVolume; // set total volume to the order item volume textfield
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
        var totalVolume,
            totalWeight,
            totalValue

        switch(sContainer.value){
            case '10 FOOTER' :
                totalVolume = sQuantity.value * 14;
                totalWeight = sQuantity.value * 9000;
                totalValue = sQuantity.value * 250000;
                totalVolume = 1 * 14;
                totalWeight = 1 * 9000;
                totalValue = 1 * 250000;
                document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                break;
            case '20 FOOTER' :
                totalVolume = sQuantity.value * 28;
                totalWeight = sQuantity.value * 18000;
                totalValue = sQuantity.value * 500000;
                totalVolume = 1 * 28;
                totalWeight = 1 * 18000;
                totalValue = 1 * 500000;
                document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                break;
            case '40 STD FOOTER' :
                totalVolume = sQuantity.value * 56;
                totalWeight = sQuantity.value * 20000;
                totalValue = sQuantity.value * 1000000;
                totalVolume = 1 * 56;
                totalWeight = 1 * 20000;
                totalValue = 1 * 1000000;
                document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                break;
            case '40 HC FOOTER' :
                totalVolume = sQuantity.value * 78;
                totalWeight = sQuantity.value * 22000;
                totalValue = sQuantity.value * 1000000;
                totalVolume = 1 * 78;
                totalWeight = 1 * 22000;
                totalValue = 1 * 1000000;
                document.getElementById("orderItem-volume").value = addCommas(totalVolume);
                document.getElementById("orderItem_weight").value = addCommas(totalWeight);
                document.getElementById("orderItem_declaredValues").value = addCommas(totalValue);
                break;
        }
    }

    if (select.options[ index ].value === '') {
        document.getElementById("orderItem-volume").value = "";
    }

    if (select.options[ index ].value === '10 FOOTER') {
        var containerQuantityNull = document.getElementById("orderItem_quantityFCL").value;
         if(containerQuantityNull == '') {
             document.getElementById("orderItem_weight").value = '9,000';
             document.getElementById("orderItem_quantityFCL").value = 1;
             document.getElementById("orderItem-volume").value = '14';
             document.getElementById("orderItem_declaredValues").value = '250,000.00';
         }
     }

    if (select.options[ index ].value === '20 FOOTER') {
        var containerQuantityNull = document.getElementById("orderItem_quantityFCL").value;
        if(containerQuantityNull == '') {
            document.getElementById("orderItem_weight").value = '18,000';
            document.getElementById("orderItem_quantityFCL").value = 1;
            document.getElementById("orderItem-volume").value = '28';
            document.getElementById("orderItem_declaredValues").value = '500,000.00';
        }
    }

    if (select.options[ index ].value === '40 STD FOOTER') {
        var containerQuantity = document.getElementById("orderItem_quantityFCL").value;
        if(containerQuantity == '') {
            document.getElementById("orderItem_weight").value = '20,000';
            document.getElementById("orderItem_quantityFCL").value = 1;
            document.getElementById("orderItem-volume").value = '56';
            document.getElementById("orderItem_declaredValues").value = '1,000,000.00';
        }
    }

    if (select.options[ index ].value === '40 HC FOOTER') {
        var containerQuantity = document.getElementById("orderItem_quantityFCL").value;
        if(containerQuantity == '') {
            document.getElementById("orderItem_weight").value = '22,000';
            document.getElementById("orderItem_quantityFCL").value = 1;
            document.getElementById("orderItem-volume").value = '78';
            document.getElementById("orderItem_declaredValues").value = '1,000,000.00';
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
