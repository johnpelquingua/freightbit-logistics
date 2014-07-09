function hideForm(){

    document.getElementById("item").style.display = 'none';
    document.getElementById("cargo").style.display = 'none';

}

function fcl(){

        document.getElementById("cargo").style.display = 'block';
        document.getElementById("item").style.display = 'none';
        $("#cargo").addClass("active");
}

function lcl(){

        document.getElementById("item").style.display = 'block';
        document.getElementById("cargo").style.display = 'none';
        $("#item").addClass("active");


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
    else if(type == "DOOR TO DOOR"){
            $("#datepicker1").prop('disabled', false);
            $("#datepicker2").prop('disabled', false);
            $("#pickupaddress").prop('disabled', false);
            $("#deliveryaddress").prop('disabled', false);
        }
}

