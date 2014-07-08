
document.getElementById("items").style.display = 'none';
document.getElementById("cargos").style.display = 'none';

function serviceValidate(){
	var serviceReq = document.getElementById("serviceReq");
	var pos = serviceReq.options[serviceReq.selectedIndex].value;
	if(pos == "FULL CARGO LOAD"){
	    document.getElementById("cargo").css('display', "");
	    document.getElementById("cargos").style.display = 'block';
        document.getElementById("items").style.display = 'none';
        document.getElementById("item").style.display = 'none';

	}
	else if(pos == "LESS CARGO LOAD" || pos == "LOOSE CARGO LOAD" || pos == "ROLLING CARGO LOAD"){
	    document.getElementById("item").css('display', "");
	    document.getElementById("items").style.display = 'block';
        document.getElementById("cargos").style.display = 'none';
        document.getElementById("cargo").style.display = 'none';

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
