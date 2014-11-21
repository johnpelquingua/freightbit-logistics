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

function initValidationScript(pageType){
    var conVol, conWt, maxWt, maxVol,
        checkBox = $('.mainTable tbody td input[type="checkbox"]'),
        child4 = $('.mainTable tbody tr td:nth-child(4)'),
        child5 = $('.mainTable tbody tr td:nth-child(5)'),
        weight = $('#result'),
        volume = $('#result-vol'),
        container = $('#containerType'),
        submitBtn = $('#submitBtn'),
        containedWt = $('.containerItems tbody tr td:nth-child(3)'),
        containedVol = $('.containerItems tbody tr td:nth-child(4)'),
        volContainer,
        wtContainer;

    if(container.val() == '10 FOOTER'){
        maxWt = 9000;
        maxVol = 14;
    }else if(container.val() == '20 FOOTER'){
        maxWt = 18000;
        maxVol = 28;
    }else if(container.val() == '40 STD FOOTER'){
        maxWt = 20000;
        maxVol = 56;
    }else if(container.val() == '40 HC FOOTER'){
        maxWt = 22000;
        maxVol = 78;
    }
    $('#maxVol').empty().append(maxVol);
    $('#maxWt').empty().append(maxWt);

    // this automatically measures the dimension of the table
    // and appends id(for the 4th and 5th td) and value(for the checkbox)
    for(var i = 0; i < $('.mainTable tbody tr').size(); i++){
        child4.eq(i).attr('id', 'val'+(i+1));
        child5.eq(i).attr('id', 'val'+(i+1)+'-vol');
        checkBox.eq(i).attr('class', 'val'+(i+1));
        if(checkBox.eq(i).is(':checked')){
            conWt = parseFloat(weight.text())+parseFloat(child4.eq(i).text());
            conVol = parseFloat(volume.text())+parseFloat(child5.eq(i).text());
            weight.empty().append(conWt);
            volume.empty().append(conVol);
        }
    }

    if(pageType == 'CONSO_EDIT'){
        for(var x=0; x < $('.containerItems tbody tr').size(); x++){
            volContainer = parseFloat(containedVol.eq(x).text())+parseFloat($('#result-vol').text());
            wtContainer = parseFloat(containedWt.eq(x).text())+parseFloat($('#result').text());

            $('#result').empty().append(wtContainer);
            $('#result-vol').empty().append(volContainer);;
        }
    }

    // This function listens for change of the checkboxes within the tbody of the mainTable class
    checkBox.change(function(){
        var wt, vol;
        if($.isNumeric($('#'+this.className).text()) && $.isNumeric($('#'+this.className+'-vol').text())){
            if(this.checked){
                wt = parseFloat(weight.text())+parseFloat($('#'+this.className).text());
                vol = parseFloat(volume.text())+parseFloat($('#'+this.className+'-vol').text());
            }else{
                wt = parseFloat(weight.text())-parseFloat($('#'+this.className).text());
                vol = parseFloat(volume.text())-parseFloat($('#'+this.className+'-vol').text());
            }
        }

        if(pageType == 'CONSO_EDIT'){
            if(wt == wtContainer || vol == volContainer){
                submitBtn.prop('disabled',true);
            }else{
                submitBtn.prop('disabled',false);
            }
        }else{
            if(wt > maxWt || vol > maxVol){
                submitBtn.prop('disabled',true);
                $('#finalBtn').addClass('disabled');
            }else{
                submitBtn.prop('disabled',false);
                $('#finalBtn').removeClass('disabled');
            }
        }

        if(wt > maxWt){ wt = '<font color="red">'+wt+'</font>'; }
        if(vol > maxVol){ vol = '<font color="red">'+vol+'</font>'; }
        if(wt == 0 || vol == 0){
            submitBtn.prop('disabled',true);
            $('#finalBtn').addClass('disabled');
        }

        weight.empty().append(wt);
        volume.empty().append(vol);
    });
}

function resetBox(pageType){
    $('.mainTable tbody td input[type="checkbox"]').removeAttr('checked');
    if(pageType == 'CONSO_EDIT'){
        var volContainer = 0, wtContainer = 0;
        for(var x=0; x < $('.containerItems tbody tr').size(); x++){
            volContainer = parseFloat($('.containerItems tbody tr td:nth-child(4)').eq(x).text())+volContainer;
            wtContainer = parseFloat($('.containerItems tbody tr td:nth-child(3)').eq(x).text())+wtContainer;
        }
        $('#result').empty().append(wtContainer);
        $('#result-vol').empty().append(volContainer);
        $('#submitBtn').prop('disabled', true);
    }else{
        $('#result').empty().append(0);
        $('#result-vol').empty().append(0);
    }
}

function tableProp(tableClass, tableName, colStatus, colType, colReq, colMode, colOrigin, colDestination){
    var tableTr = $('#'+tableName+' tbody tr');
    for(var i = 0; i < tableTr.size(); i++){
        var statusColumn = $('#'+tableName+' tbody tr td:nth-child('+colStatus+')').eq(i).text(),
            typeColumn = $('#'+tableName+' tbody tr td:nth-child('+colType+')').eq(i),
            reqColumn = $('#'+tableName+' tbody tr td:nth-child('+colReq+')').eq(i),
            modeColumn = $('#'+tableName+' tbody tr td:nth-child('+colMode+')').eq(i);

        if(tableClass == 'DESTI_ORIG'){
            var desColumn = $('#'+tableName+' tbody tr td:nth-child('+colDestination+')').eq(i);
            var origColumn = $('#'+tableName+' tbody tr td:nth-child('+colOrigin+')').eq(i);

            // DESTINATION COLUMN
            if(desColumn.text() == 'MANILA'){
                desColumn.empty().append('MNL')
            }else if(desColumn.text() == 'BACOLOD'){
                desColumn.empty().append('BAC')
            }else if(desColumn.text() == 'BUTUAN'){
                desColumn.empty().append('BXU')
            }else if(desColumn.text() == 'CAGAYAN'){
                desColumn.empty().append('CGY')
            }else if(desColumn.text() == 'COTABATO'){
                desColumn.empty().append('CBO')
            }else if(desColumn.text() == 'DAVAO'){
                desColumn.empty().append('DVO')
            }else if(desColumn.text() == 'DUMAGUETE'){
                desColumn.empty().append('DGT')
            }else if(desColumn.text() == 'DIPOLOG'){
                desColumn.empty().append('DPG')
            }else if(desColumn.text() == 'GEN. SANTOS'){
                desColumn.empty().append('GES')
            }else if(desColumn.text() == 'ILIGAN'){
                desColumn.empty().append('ILI')
            }else if(desColumn.text() == 'ILOILO'){
                desColumn.empty().append('ILO')
            }else if(desColumn.text() == 'OZAMIS'){
                desColumn.empty().append('OZA')
            }else if(desColumn.text() == 'GEN. SANTOS'){
                desColumn.empty().append('GES')
            }else if(desColumn.text() == 'PALAWAN'){
                desColumn.empty().append('PPS')
            }else if(desColumn.text() == 'ROXAS'){
                desColumn.empty().append('RXS')
            }else if(desColumn.text() == 'TAGBILARAN'){
                desColumn.empty().append('TAG')
            }else if(desColumn.text() == 'TACLOBAN'){
                desColumn.empty().append('TAC')
            }else if(desColumn.text() == 'ZAMBOANGA'){
                desColumn.empty().append('ZAM')
            }

            // ORIGIN COLUMN
            if(origColumn.text() == 'MANILA'){
                origColumn.empty().append('MNL')
            }else if(origColumn.text() == 'BACOLOD'){
                origColumn.empty().append('BAC')
            }else if(origColumn.text() == 'BUTUAN'){
                origColumn.empty().append('BXU')
            }else if(origColumn.text() == 'CAGAYAN'){
                origColumn.empty().append('CGY')
            }else if(origColumn.text() == 'COTABATO'){
                origColumn.empty().append('CBO')
            }else if(origColumn.text() == 'DAVAO'){
                origColumn.empty().append('DVO')
            }else if(origColumn.text() == 'DUMAGUETE'){
                origColumn.empty().append('DGT')
            }else if(origColumn.text() == 'DIPOLOG'){
                origColumn.empty().append('DPG')
            }else if(origColumn.text() == 'GEN. SANTOS'){
                origColumn.empty().append('GES')
            }else if(origColumn.text() == 'ILIGAN'){
                origColumn.empty().append('ILI')
            }else if(origColumn.text() == 'ILOILO'){
                origColumn.empty().append('ILO')
            }else if(origColumn.text() == 'OZAMIS'){
                origColumn.empty().append('OZA')
            }else if(origColumn.text() == 'GEN. SANTOS'){
                origColumn.empty().append('GES')
            }else if(origColumn.text() == 'PALAWAN'){
                origColumn.empty().append('PPS')
            }else if(origColumn.text() == 'ROXAS'){
                origColumn.empty().append('RXS')
            }else if(origColumn.text() == 'TAGBILARAN'){
                origColumn.empty().append('TAG')
            }else if(origColumn.text() == 'TACLOBAN'){
                origColumn.empty().append('TAC')
            }else if(origColumn.text() == 'ZAMBOANGA'){
                origColumn.empty().append('ZAM')
            }
        }

        // ROW COLORS
        if(statusColumn == 'PENDING' || statusColumn == 'INCOMPLETE'){
            tableTr.eq(i).css('background-color', '#fcf8e3');
        }else if(statusColumn == 'DISAPPROVED' || statusColumn == 'CANCELLED'){
            tableTr.eq(i).css('background-color', '#f2dede');
        }else if(statusColumn == 'APPROVED' || statusColumn == 'SERVICE ACCOMPLISHED'){
            tableTr.eq(i).css('background-color', '#dff0d8');
        }else if(statusColumn == 'ON GOING'){
            tableTr.eq(i).css('background-color', '#bce8f1');
        }

        // TYPE ICONS
        if(typeColumn.text() == 'SHIPPING AND TRUCKING'){
            typeColumn.empty().append("<i class='fa fa-anchor' /> <i class='fa fa-truck' />");
        }else if(typeColumn.text() == 'SHIPPING'){
            typeColumn.empty().append("<i class='fa fa-anchor' />");
        }else if(typeColumn.text() == 'TRUCKING'){
            typeColumn.empty().append("<i class='fa fa-truck' />");
        }

        // REQT COLUMN
        if(reqColumn.text() == 'FULL CARGO LOAD' || reqColumn.text() == 'FULL CONTAINER LOAD'){
            reqColumn.empty().append('FCL');
        }else if(reqColumn.text() == 'FULL TRUCK LOAD'){
            reqColumn.empty().append('FTL');
        }else if(reqColumn.text() == 'LESS TRUCK LOAD'){
            reqColumn.empty().append('LTL');
        }else if(reqColumn.text() == 'LESS CARGO LOAD' || reqColumn.text() == 'LESS CONTAINER LOAD'){
            reqColumn.empty().append('LCL');
        }else if(reqColumn.text() == 'LOOSE CARGO LOAD'){
            reqColumn.empty().append('LCU');
        }else if(reqColumn.text() == 'ROLLING CARGO LOAD'){
            reqColumn.empty().append('RCU');
        }

        // MODE COLUMN
        if(modeColumn.text() == 'DOOR TO DOOR'){
            modeColumn.empty().append('DD');
        }else if(modeColumn.text() == 'DOOR TO PIER' || modeColumn.text() == 'DOOR TO PORT'){
            modeColumn.empty().append('DP');
        }else if(modeColumn.text() == 'PIER TO DOOR' || modeColumn.text() == 'PORT TO DOOR'){
            modeColumn.empty().append('PD');
        }else if(modeColumn.text() == 'PIER TO PIER' || modeColumn.text() == 'PORT TO PORT'){
            modeColumn.empty().append('PP')
        }else if(modeColumn.text() == 'PICKUP'){
            modeColumn.empty().append('P')
        }else if(modeColumn.text() == 'DELIVERY'){
            modeColumn.empty().append('D')
        }else if(modeColumn.text() == 'INTER-WAREHOUSE'){
            modeColumn.empty().append('IW')
        }
    }
}
