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
            if(wt == wtContainer || vol == volContainer || wt > maxWt || vol > maxVol){
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

function tablePropClass(tableClass, tableName, colStatus, colType, colReq, colMode, colOrigin, colDestination){
    var tableTr = $('.'+tableName+' tbody tr');
    for(var i = 0; i < tableTr.size(); i++){
        var statusColumn = $('.'+tableName+' tbody tr td:nth-child('+colStatus+')').eq(i).text(),
            typeColumn = $('.'+tableName+' tbody tr td:nth-child('+colType+')').eq(i),
            reqColumn = $('.'+tableName+' tbody tr td:nth-child('+colReq+')').eq(i),
            modeColumn = $('.'+tableName+' tbody tr td:nth-child('+colMode+')').eq(i),
            icon = changeIcons(typeColumn.text()),
            req = reqAbbrev(reqColumn.text()),
            mode = modeAbbrev(modeColumn.text());
        if(tableClass == 'DESTI_ORIG'){
            var desColumn = $('.'+tableName+' tbody tr td:nth-child('+colDestination+')').eq(i),
                origColumn = $('.'+tableName+' tbody tr td:nth-child('+colOrigin+')').eq(i),
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
        return '#f2a5aa';
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

// AUTHORED BY JAN SARMIENTO -- START
// This function modifies the \n character in the table and replaces it with a <br/> tag
// THIS FUNCTIONS CONCERNS ONLY THE FRONT-END
function newlineHandler(tableName, commentColumn){
    var tableComment = $('.'+tableName+' tbody tr td:nth-child('+commentColumn+')'),
        transformedString;

    for(var i=0; i < tableComment.size(); i++){
        transformedString = tableComment.eq(i).text().replace(/\n/g, "<br />");
        tableComment.eq(i).empty().append(transformedString);
    }
}
// AUTHORED BY JAN SARMIENTO -- END

function computeAll(tableClass, wellTotalWeight, wellTotalVolume, operation){
    var lclCheckBox = $('.'+tableClass+' tbody tr td input[type="checkbox"]'),
        finalWt = 0, finalVol = 0;
    if(operation == 'ADD'){
        for(var i=0; i<lclCheckBox.size(); i++){
            var tableWt = parseFloat(lclCheckBox.eq(i).closest('tr').find('td').eq(8).text()),
                tableVol = parseFloat(lclCheckBox.eq(i).closest('tr').find('td').eq(9).text());
            finalWt = finalWt + tableWt;
            finalVol = finalVol + tableVol;
        }
        $('#'+wellTotalWeight).empty().append(finalWt);
        $('#'+wellTotalVolume).empty().append(finalVol);
        triggerComputation(finalWt, finalVol);
    }
    else if(operation == 'SUBTRACT'){
        $('#'+wellTotalVolume).empty().append('0');
        $('#'+wellTotalWeight).empty().append('0');
        $('#recommendedContent').empty().append('Choose item(s) first');
    }
//    seaFreightLclComputation('lclTable', 'wellTotalWeight', 'wellTotalVolume');
}

function triggerComputation(weight, volume){
    startRecommendation('mainReco', 'recommendedContent', weight, volume);
}

function seaFreightLclComputation(tableClass, wellTotalWeight, wellTotalVolume){
    var lclCheckBox = $('.'+tableClass+' tbody tr td input[type="checkbox"]');

    lclCheckBox.change(function(){
        var weight = parseFloat($(this).closest('tr').find('td').eq(8).text()),
            volume = parseFloat($(this).closest('tr').find('td').eq(9).text()),
            wellContentWt = $('#'+wellTotalWeight),
            wellContentVol = $('#'+wellTotalVolume);

        if($(this).is(':checked')){
            weight = parseFloat(wellContentWt.text()) + weight;
            volume = parseFloat(wellContentVol.text()) + volume;

            wellContentWt.empty().append(weight);
            wellContentVol.empty().append(volume);
        }else{
            weight = parseFloat(wellContentWt.text()) - weight;
            volume = parseFloat(wellContentVol.text()) - volume;

            wellContentWt.empty().append(weight);
            wellContentVol.empty().append(volume);
        }
        startRecommendation('mainReco', 'recommendedContent', weight, volume);
    })
}

function startRecommendation(slideDiv, appendDiv, weight, volume){
    if(weight == 0 || volume == 0){
        $('#'+appendDiv).empty().append('Choose item(s) first');
//        $('#'+slideDiv).slideToggle();
    }else{
        var recommendation;
        recommendation = firstRecommendation(weight, volume);
        $('#'+appendDiv).empty().append(recommendation);
//        $('#'+slideDiv).slideToggle();
    }
}

function firstRecommendation(weight, volume){
    var recWt = weight, recVol = volume,
        hc40 = 0, std40 = 0, foot20 = 0, foot10 = 0, recommendation = "NONE";
    while(1){
        if(recVol <= 0){
            break;
        }else if(recVol > 53.2 || recWt > 15320){
            recWt = recWt - 16890;
            recVol = recVol - 74.1;
            hc40++;
        }else if(recVol > 26.6 || recWt > 14870){
            recWt = recWt - 15320;
            recVol = recVol - 53.2;
            std40++;
        }else if(recVol > 13.3 || recWt > 7250){
            recWt = recWt - 14870;
            recVol = recVol - 26.6;
            foot20++;
        }else if(recVol > 0 || recWt > 0){
            recWt = recWt - 7250;
            recVol = recVol - 13.3;
            foot10++;
        }

//        if(recVol > 74.1 || recWt > 20900){
//            recWt = recWt - 20900;
//            recVol = recVol - 74.1;
//            hc40++;
//        }else if(recVol > 53.2 || recWt > 19000){
//            recWt = recWt - 19000;
//            recVol = recVol - 53.2;
//            std40++;
//        }else if(recVol > 26.6 || recWt > 17100 ){
//            alert(1);
//            recWt = recWt - 17100;
//            recVol = recVol - 26.6;
//            foot20++;
//        }else if(recVol > 13.3 || recWt > 8550 ){
//            recWt = recWt - 8550;
//            recVol = recVol - 13.3;
//            foot10++;
//        }else if(recVol > 0 || recWt > 0){
//            foot10++;
//            break;
//        }
    }

    if(hc40 != 0){
        recommendation = '<p>'+hc40+' - 40 FOOTER HC CONTAINERS</p>';
    }

    if(std40 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+std40+' - 40 FOOTER STD CONTAINERS</p>';
        }else {
            recommendation = recommendation + '<p>'+std40+' - 40 FOOTER STD CONTAINERS</p>';
        }
    }

    if(foot20 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+foot20+' - 20 FOOTER CONTAINERS</p>';
        }else {
            recommendation = recommendation + '<p>'+foot20+' - 20 FOOTER CONTAINERS</p>';
        }
    }

    if(foot10 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+foot10+' - 10 FOOTER CONTAINERS</p>';
        }else {
            recommendation = recommendation + '<p>'+foot10+' - 10 FOOTER CONTAINERS</p>';
        }
    }

    return recommendation;
}

// THIS FUNCTION IS FOR CHECK ALL THIS REQUIRES THE ID OF THE MASTER CHECKBOX AND TABLE CLASS
function massCheckbox(boxName, tableName){
    $('#'+boxName).click(function(){
        var allCheckbox = $('.'+tableName+' tbody tr td input[type="checkbox"]');
        if(allCheckbox.is(':checked')){
            allCheckbox.prop('checked', false);
        }else{
            allCheckbox.prop('checked', true);
        }
    })
}

// THIS FUNCTION IS FOR FORM VALIDATION THIS REQURES THE CLASS OF INPUTS AND CLASS OF SUBMIT BUTTON
function validationForm(inputClass, submitBtn){
    var formInput = $('.'+inputClass);

    formInput.change(function(){
        var bool = 0;
        for(var i = 0; i < formInput.size(); i++){
            if(formInput.eq(i).val() != 0){
                bool++;
            }
        }

        if(bool == formInput.size()){
            $('.'+submitBtn).prop('disabled', false);
        }
    })
}

function postAjaxHtml(url, successDiv, idParam, columnParam){
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'html',
        success: function (html) {
            $('#'+successDiv).html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}

function showGateOutFields(containerId) {
    $.ajax({
        url: 'loadCheckoutFormPage',
        type: 'POST',
        data: { containerIdParam: containerId },
        dataType: 'html',
        success: function (html) {
            $('#inputDiv').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });

}