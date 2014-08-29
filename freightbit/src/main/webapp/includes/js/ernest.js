function fcl(){
    var containerVolume = document.getElementById("orderItem.volume").value;

    if(containerVolume != ''){
        var containerQuantity = document.getElementById("orderItem.quantity").value;
        var containerSize = document.getElementById("orderItem.nameSize").value;

        if(containerQuantity == '') {
            document.getElementById("orderItem.nameSize").value ='';
            document.getElementById("orderItem.volume").value = '';
            document.getElementById("orderItemVolume").value = '';
        }

        if (containerSize == '10 FOOTER'){
            var totalVolume = containerQuantity * 14;
        }else if (containerSize == '20 FOOTER'){
            var totalVolume = containerQuantity * 28;
        }else if (containerSize == '40 FOOTER') {
            var totalVolume = containerQuantity * 56;
        }

        document.getElementById("orderItem.volume").value = totalVolume;
        document.getElementById("orderItemVolume").value = totalVolume;
    }
}


function serviceValidate(){
	var serviceReq = document.getElementById("serviceReq");
	var pos = serviceReq.options[serviceReq.selectedIndex].value;
	if(pos == "FULL CARGO LOAD"){

        document.getElementById("item").style.display = 'none';
        document.getElementById("item-menu").style.display = 'none';
	    document.getElementById("cargo-menu").style.display = 'block';


	}
	else if(pos == "LESS CARGO LOAD" || pos == "LOOSE CARGO LOAD" || pos == "ROLLING CARGO LOAD"){

        document.getElementById("cargo").style.display = 'none';
        document.getElementById("cargo-menu").style.display = 'none';
	    document.getElementById("item-menu").style.display = 'block';


	}
}

function typeValidate(){
    var typeReq = document.getElementById("mode");
    var type = typeReq.options[typeReq.selectedIndex].value;

    if(type == "DOOR TO PIER"){
        $("#deliveryaddress").prop('disabled', true);
        $("#pickupaddress").prop('disabled', false);
        $("#datepicker1").prop('disabled', false);
        $("#datepicker2").prop('disabled', true);
    }
    else if(type == "PIER TO DOOR"){
        $("#deliveryaddress").prop('disabled', false);
        $("#pickupaddress").prop('disabled', true);
        $("#datepicker1").prop('disabled', true);
        $("#datepicker2").prop('disabled', false);
    }
    else if(type == "PIER TO PIER"){
        $("#datepicker1").prop('disabled', true);
        $("#datepicker2").prop('disabled', true);
        $("#pickupaddress").prop('disabled', true);
        $("#deliveryaddress").prop('disabled', true);
    }

}


