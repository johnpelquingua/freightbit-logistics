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

function getMaxValue(type, value){
    if(value == '10 FOOTER'){
        if(type == 'VOLUME'){ return 14; }
        else if(type == 'WEIGHT'){ return 9000; }
    }else if(value == '20 FOOTER'){
        if(type == 'VOLUME'){ return 28; }
        else if(type == 'WEIGHT'){ return 18000; }
    }else if(value == '40 STD FOOTER'){
        if(type == 'VOLUME'){ return 56; }
        else if(type == 'WEIGHT'){ return 20000; }
    }else if(value == '40 HC FOOTER'){
        if(type == 'VOLUME'){ return 78; }
        else if(type == 'WEIGHT'){ return 22000; }
    }
}

function initValidationScript(pageType){
    var conVol, conWt,
        checkBox = $('.mainTable tbody td input[type="checkbox"]'),
        child4 = $('.mainTable tbody tr td:nth-child(4)'),
        child5 = $('.mainTable tbody tr td:nth-child(5)'),
        weight = $('#result'),
        volume = $('#result-vol'),
        container = $('#containerType').val(),
        submitBtn = $('#submitBtn'),
        containedWt = $('.containerItems tbody tr td:nth-child(3)'),
        containedVol = $('.containerItems tbody tr td:nth-child(4)'),
        volContainer,
        wtContainer;

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

    $('#maxVol').empty().append(getMaxValue('VOLUME', container));
    $('#maxWt').empty().append(getMaxValue('WEIGHT', container));

    if(pageType == 'CONSO_EDIT'){
        for(var x=0; x < $('.containerItems tbody tr').size(); x++){
            volContainer = parseFloat(containedVol.eq(x).text())+parseFloat(volume.text());
            wtContainer = parseFloat(containedWt.eq(x).text())+parseFloat(weight.text());
            weight.empty().append(wtContainer);
            volume.empty().append(volContainer);
        }
    }

    // This function listens for change of the checkboxes within the tbody of the mainTable class
    checkBox.change(function(){
        var wt, vol,
            maxWt = parseFloat($('#maxWt').text()),
            maxVol = parseFloat($('#maxVol').text()),
            checkBoxWt = $('#'+this.className),
            checkBoxVol = $('#'+this.className+'-vol');
        if($.isNumeric(checkBoxWt.text()) && $.isNumeric(checkBoxVol.text())){
            if(this.checked){
                wt = parseFloat(weight.text())+parseFloat(checkBoxWt.text());
                vol = parseFloat(volume.text())+parseFloat(checkBoxVol.text());
            }else{
                wt = parseFloat(weight.text())-parseFloat(checkBoxWt.text());
                vol = parseFloat(volume.text())-parseFloat(checkBoxVol.text());
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
            modeColumn = $('#'+tableName+' tbody tr td:nth-child('+colMode+')').eq(i),
            icon = changeIcons(typeColumn.text()),
            req = reqAbbrev(reqColumn.text()),
            mode = modeAbbrev(modeColumn.text());

        if(tableClass == 'DESTI_ORIG'){
            var desColumn = $('#'+tableName+' tbody tr td:nth-child('+colDestination+')').eq(i),
                origColumn = $('#'+tableName+' tbody tr td:nth-child('+colOrigin+')').eq(i),
                des = placeAbbrev(desColumn.text()),
                ori = placeAbbrev(origColumn.text());

            desColumn.empty().append(des);
            origColumn.empty().append(ori);
        }

        tableTr.eq(i).css('background-color', trColor(statusColumn));
        typeColumn.empty().append(icon);
        reqColumn.empty().append(req);
        modeColumn.empty().append(mode);
    }
}

function placeAbbrev(place){
    if(place == 'MANILA'){
        return 'MNL';
    }else if(place == 'BACOLOD'){
        return 'BAC';
    }else if(place == 'BUTUAN'){
        return 'BXU';
    }else if(place == 'CAGAYAN'){
        return 'CGY';
    }else if(place == 'COTABATO'){
        return 'CBO';
    }else if(place == 'DAVAO'){
        return 'DVO';
    }else if(place == 'DUMAGUETE'){
        return 'DGT';
    }else if(place == 'DIPOLOG'){
        return 'DPG';
    }else if(place == 'GEN. SANTOS'){
        return 'GES';
    }else if(place == 'ILIGAN'){
        return 'ILI';
    }else if(place == 'ILOILO'){
        return 'ILO';
    }else if(place == 'OZAMIS'){
        return 'OZA';
    }else if(place == 'GEN. SANTOS'){
        return 'GES';
    }else if(place == 'PALAWAN'){
        return 'PPS';
    }else if(place == 'ROXAS'){
        return 'RXS';
    }else if(place == 'TAGBILARAN'){
        return 'TAG';
    }else if(place == 'TACLOBAN'){
        return 'TAC';
    }else if(place == 'ZAMBOANGA'){
        return 'ZAM';
    }
}

function trColor(status){
    if(status == 'PENDING' || status == 'INCOMPLETE'){
        return '#fcf8e3';
    }else if(status == 'DISAPPROVED' || status == 'CANCELLED'){
        return '#f2dede';
    }else if(status == 'APPROVED' || status == 'SERVICE ACCOMPLISHED'){
        return '#dff0d8';
    }else if(status == 'ON GOING'){
        return '#bce8f1';
    }
}

function changeIcons(type){
    if(type == 'SHIPPING AND TRUCKING'){
        return "<i class='fa fa-anchor' /> <i class='fa fa-truck' />";
    }else if(type == 'SHIPPING'){
        return "<i class='fa fa-anchor' />";
    }else if(type == 'TRUCKING'){
        return "<i class='fa fa-truck' />";
    }
}

function reqAbbrev(req){
    if(req == 'FULL CARGO LOAD' || req == 'FULL CONTAINER LOAD'){
        return 'FCL';
    }else if(req == 'FULL TRUCK LOAD'){
        return 'FTL';
    }else if(req == 'LESS TRUCK LOAD'){
        return 'LTL';
    }else if(req == 'LESS CARGO LOAD' || req == 'LESS CONTAINER LOAD'){
        return 'LCL';
    }else if(req == 'LOOSE CARGO LOAD'){
        return 'LCU';
    }else if(req == 'ROLLING CARGO LOAD'){
        return 'RCU';
    }
}

function modeAbbrev(mode){
    if(mode == 'DOOR TO DOOR'){
        return 'DD';
    }else if(mode == 'DOOR TO PIER' || mode == 'DOOR TO PORT'){
        return 'DP';
    }else if(mode == 'PIER TO DOOR' || mode == 'PORT TO DOOR'){
        return 'PD';
    }else if(mode == 'PIER TO PIER' || mode == 'PORT TO PORT'){
        return 'PP';
    }else if(mode == 'PICKUP'){
        return 'P';
    }else if(mode == 'DELIVERY'){
        return 'D';
    }else if(mode == 'INTER-WAREHOUSE'){
        return 'IW';
    }
}

function newlineHandler(){
    // AUTHORED BY JAN SARMIENTO -- START
    // This function modifies the \n character in the table and replaces it with a <br/> tag
    // THIS FUNCTIONS CONCERNS ONLY THE FRONT-END

    var outboundComment = $('.outbound_table tbody tr td:nth-child(6)'),
        finalOutboundComment = $('.final_outbound_table tbody tr td:nth-child(6)'),
        inboundTableComment = $('.inbound_table tbody tr td:nth-child(6)'),
        finalInboundTableComment = $('.final_inbound_table tbody tr td:nth-child(6)'),
        transformedString;

    for(var i=0; i < outboundComment.size(); i++){
        transformedString = outboundComment.eq(i).text().replace(/\n/g, "<br />");
        outboundComment.eq(i).empty().append(transformedString);
        transformedString = finalOutboundComment.eq(i).text().replace(/\n/g, "<br />");
        finalOutboundComment.eq(i).empty().append(transformedString);
        transformedString = inboundTableComment.eq(i).text().replace(/\n/g, "<br />");
        inboundTableComment.eq(i).empty().append(transformedString);
        transformedString = finalInboundTableComment.eq(i).text().replace(/\n/g, "<br />");
        finalInboundTableComment.eq(i).empty().append(transformedString);
    }

    // AUTHORED BY JAN SARMIENTO -- END
}