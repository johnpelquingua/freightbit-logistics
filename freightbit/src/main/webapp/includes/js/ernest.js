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
    if(value == '10 FT'){
        if(type == 'VOLUME'){ return 14; }
        else if(type == 'WEIGHT'){ return 9000; }
    }else if(value == '20 FT'){
        if(type == 'VOLUME'){ return 28; }
        else if(type == 'WEIGHT'){ return 18000; }
    }else if(value == '40 STD FT'){
        if(type == 'VOLUME'){ return 56; }
        else if(type == 'WEIGHT'){ return 20000; }
    }else if(value == '40 HC FT'){
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

function tableProp(tableClass, tableName, colStatus, colType, colReq, colMode, colOrigin, colDestination, colDate){
    var tableTr = $('#'+tableName+' tbody tr');
    for(var i = 0; i < tableTr.size(); i++){
        var statusColumn = $('#'+tableName+' tbody tr td:nth-child('+colStatus+')').eq(i).text(),
            typeColumn = $('#'+tableName+' tbody tr td:nth-child('+colType+')').eq(i),
            reqColumn = $('#'+tableName+' tbody tr td:nth-child('+colReq+')').eq(i),
            modeColumn = $('#'+tableName+' tbody tr td:nth-child('+colMode+')').eq(i),
            dateColumn = $('#'+tableName+' tbody tr td:nth-child('+colDate+')').eq(i),
            icon = changeIcons(typeColumn.text()),
            req = reqAbbrev(reqColumn.text()),
            mode = modeAbbrev(modeColumn.text()),
            dateTrans = dateAbbrev(dateColumn.text());

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
        dateColumn.empty().append(dateTrans);
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
    }else if(place == 'CEBU'){
        return 'CEB'
    }else{
        return place;
    }
}

function trColor(status){
//    if( status == 'INCOMPLETE'){
//        return '#f2a5aa';
//    }

    if(status == 'DISAPPROVED' || status == 'CANCELLED'){
        return '#f2dede';
    }else if(status == 'APPROVED' || status == 'SERVICE ACCOMPLISHED'){
        return '#dff0d8';
    }else if(status == 'ON GOING'){
        return '#bce8f1';
    }else if(status == 'PENDING' || status == 'INCOMPLETE'){
        return '#f0ad4e';
    }
}

function changeIcons(type){
    if(type == 'SHIPPING AND TRUCKING'){
        return "<i class='fa fa-anchor' /> <i class='fa fa-truck' />";
    }else if(type == 'SHIPPING'){
        return "<i class='fa fa-anchor' />";
    }else if(type == 'TRUCKING'){
        return "<i class='fa fa-truck' />";
    }else{
        return type;
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
        return 'LC';
    }else if(req == 'ROLLING CARGO LOAD'){
        return 'RCU';
    }else{
        return req;
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
        return 'PUP';
    }else if(mode == 'DELIVERY'){
        return 'DEL';
    }else if(mode == 'INTER-WAREHOUSE'){
        return 'ITW';
    }else{
        return mode;
    }
}

function dateAbbrev_Format3(date){
    var splitDate = date.split('-'),
        month;

    if(splitDate[0] == '01'){
        month = 'JAN';
    }else if(splitDate[0] == '02'){
        month = 'FEB';
    }else if(splitDate[0] == '03'){
        month = 'MAR';
    }else if(splitDate[0] == '04'){
        month = 'APR';
    }else if(splitDate[0] == '05'){
        month = 'MAY';
    }else if(splitDate[0] == '06'){
        month = 'JUN';
    }else if(splitDate[0] == '07'){
        month = 'JUL';
    }else if(splitDate[0] == '08'){
        month = 'AUG';
    }else if(splitDate[0] == '09'){
        month = 'SEP';
    }else if(splitDate[0] == '10'){
        month = 'OCT';
    }else if(splitDate[0] == '11'){
        month = 'NOV';
    }else if(splitDate[0] == '12'){
        month = 'DEC';
    }else{
        month = splitDate[0];
    }

    // FORMAT MUST BE dd/Mon/yyyy

    return splitDate[1]+'-'+month+'-'+splitDate[2];
//    return splitDate[2]+'-'+month+'-'+splitDate[0];
}

function dateAbbrev(date){
    var splitDate = date.split('-'),
        month;

    if(splitDate[1] == '01'){
        month = 'JAN';
    }else if(splitDate[1] == '02'){
        month = 'FEB';
    }else if(splitDate[1] == '03'){
        month = 'MAR';
    }else if(splitDate[1] == '04'){
        month = 'APR';
    }else if(splitDate[1] == '05'){
        month = 'MAY';
    }else if(splitDate[1] == '06'){
        month = 'JUN';
    }else if(splitDate[1] == '07'){
        month = 'JUL';
    }else if(splitDate[1] == '08'){
        month = 'AUG';
    }else if(splitDate[1] == '09'){
        month = 'SEP';
    }else if(splitDate[1] == '10'){
        month = 'OCT';
    }else if(splitDate[1] == '11'){
        month = 'NOV';
    }else if(splitDate[1] == '12'){
        month = 'DEC';
    }else{
        month = splitDate[1];
    }

    // FORMAT MUST BE dd/Mon/yyyy

    return splitDate[2]+'-'+month+'-'+splitDate[0];
}

function initTimestampAbbrev(tableClass, dateColumn){
    var table = $('.'+tableClass+' tbody tr td:nth-child('+dateColumn+')');

    for(var i = 0; i < table.size(); i++){
        var splitDate = table.eq(i).text().split(' ');
        if(splitDate[0] != ''){
            table.eq(i).empty().append(dateAbbrev(splitDate[0])+' '+splitDate[1].substr(0,8));
        }
    }
}

function dateAbbrev_Format2(table, column){
    var tableSelect = $('#'+table+' tbody tr');
    for(var i = 0; i < tableSelect.size(); i++){
        var dateColumn = $('#'+table+' tbody tr td:nth-child('+column+')').eq(i),
            splitDate = dateColumn.text().split('-'),
            month;

        if(splitDate[0] == '01'){
            month = 'JAN';
        }else if(splitDate[0] == '02'){
            month = 'FEB';
        }else if(splitDate[0] == '03'){
            month = 'MAR';
        }else if(splitDate[0] == '04'){
            month = 'APR';
        }else if(splitDate[0] == '05'){
            month = 'MAY';
        }else if(splitDate[0] == '06'){
            month = 'JUN';
        }else if(splitDate[0] == '07'){
            month = 'JUL';
        }else if(splitDate[0] == '08'){
            month = 'AUG';
        }else if(splitDate[0] == '09'){
            month = 'SEP';
        }else if(splitDate[0] == '10'){
            month = 'OCT';
        }else if(splitDate[0] == '11'){
            month = 'NOV';
        }else if(splitDate[0] == '12'){
            month = 'DEC';
        }else{
            month = splitDate[0];
        }

        dateColumn.empty().append(splitDate[1]+'-'+month+'-'+splitDate[2]);
    }
}

function addCommas(nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
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

function containerHandler(tableName, containerColumn, weightColumn, volumeColumn){
    var tableTr = $('.'+tableName+' tbody tr td:nth-child('+containerColumn+')');

    for(var i=0; i <= tableTr.size(); i++){
        var tableContainer = $('.'+tableName+' tbody tr td:nth-child('+containerColumn+')').eq(i),
            columnWeight = $('.'+tableName+' tbody tr td:nth-child('+weightColumn+')').eq(i),
            tableWeight = parseFloat($('.'+tableName+' tbody tr td:nth-child('+weightColumn+')').eq(i).text()),
            columnVolume = $('.'+tableName+' tbody tr td:nth-child('+volumeColumn+')').eq(i),
            tableVolume = parseFloat($('.'+tableName+' tbody tr td:nth-child('+volumeColumn+')').eq(i).text()),
            container = containerAbbrev(tableContainer.text()),
            weight = addCommas((tableWeight.toFixed(0)).toString()),
            volume = addCommas((tableVolume.toFixed(0)).toString());

        tableContainer.empty().append(container);
        columnWeight.empty().append(weight);
        columnVolume.empty().append(volume);
    }

}

function weightVolumeHandler(tableName,weightColumn, volumeColumn){
    var tableTr = $('.'+tableName+' tbody tr td:nth-child('+weightColumn+')');

    for(var i=0; i <= tableTr.size(); i++){
        var tableWeight = parseFloat($('.'+tableName+' tbody tr td:nth-child('+weightColumn+')').eq(i).text()),
            tableVolume = parseFloat($('.'+tableName+' tbody tr td:nth-child('+volumeColumn+')').eq(i).text()),
            columnWeight = $('.'+tableName+' tbody tr td:nth-child('+weightColumn+')').eq(i),
            columnVolume = $('.'+tableName+' tbody tr td:nth-child('+volumeColumn+')').eq(i),
            weight = addCommas((tableWeight.toFixed(0)).toString()),
            volume = addCommas((tableVolume.toFixed(0)).toString());

        columnWeight.empty().append(weight);
        columnVolume.empty().append(volume);
    }
}

function itemHandler(tableName,lengthColumn,widthColumn,heightColumn,srpColumn,weightColumn){
    var tableTr = $('.'+tableName+' tbody tr td:nth-child('+lengthColumn+')');

    for(var i=0; i <= tableTr.size(); i++){
        var tableLength = parseFloat($('.'+tableName+' tbody tr td:nth-child('+lengthColumn+')').eq(i).text()),
            tableWidth = parseFloat($('.'+tableName+' tbody tr td:nth-child('+widthColumn+')').eq(i).text()),
            tableHeight = parseFloat($('.'+tableName+' tbody tr td:nth-child('+heightColumn+')').eq(i).text()),
            tableSRP = parseFloat($('.'+tableName+' tbody tr td:nth-child('+srpColumn+')').eq(i).text()),
            tableWeight = parseFloat($('.'+tableName+' tbody tr td:nth-child('+weightColumn+')').eq(i).text()),
            columnLength = $('.'+tableName+' tbody tr td:nth-child('+lengthColumn+')').eq(i),
            columnWidth = $('.'+tableName+' tbody tr td:nth-child('+widthColumn+')').eq(i),
            columnHeight = $('.'+tableName+' tbody tr td:nth-child('+heightColumn+')').eq(i),
            columnSRP = $('.'+tableName+' tbody tr td:nth-child('+srpColumn+')').eq(i),
            columnWeight = $('.'+tableName+' tbody tr td:nth-child('+weightColumn+')').eq(i),
            length = addCommas((tableLength.toFixed(0)).toString()),
            width = addCommas((tableWidth.toFixed(0)).toString()),
            height = addCommas((tableHeight.toFixed(0)).toString()),
            srp = addCommas((tableSRP.toFixed(2)).toString()),
            weight = addCommas((tableWeight.toFixed(0)).toString());

        columnLength.empty().append(length);
        columnWidth.empty().append(width);
        columnHeight.empty().append(height);
        columnSRP.empty().append(srp);
        columnWeight.empty().append(weight);
    }

}

function containerAbbrev(containerSize){
    if(containerSize == '10 FOOTER'){
        return '10 FT';
    }else if(containerSize == '20 FOOTER'){
        return '20 FT';
    }else if(containerSize == '40 STD FOOTER'){
        return '40 STD FT';
    }else if(containerSize == '40 HC FOOTER'){
        return '40 HC FT';
    }else{
        return containerSize;
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
        var weight = parseFloat($(this).closest('tr').find('td').eq(9).text()),
            volume = parseFloat($(this).closest('tr').find('td').eq(10).text()),
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
    }

    if(hc40 != 0){
        recommendation = '<p>'+hc40+' - 40 FOOTER HC CONTAINER(S)</p>';
    }

    if(std40 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+std40+' - 40 FOOTER STD CONTAINER(S)</p>';
        }else {
            recommendation = recommendation + '<p>'+std40+' - 40 FOOTER STD CONTAINER(S)</p>';
        }
    }

    if(foot20 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+foot20+' - 20 FOOTER CONTAINER(S)</p>';
        }else {
            recommendation = recommendation + '<p>'+foot20+' - 20 FOOTER CONTAINER(S)</p>';
        }
    }

    if(foot10 != 0){
        if(recommendation == 'NONE'){
            recommendation = '<p>'+foot10+' - 10 FOOTER CONTAINER(S)</p>';
        }else {
            recommendation = recommendation + '<p>'+foot10+' - 10 FOOTER CONTAINER(S)</p>';
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
function validationForm(inputClass, submitBtn, module){

    var classInput = $('.'+inputClass+':enabled'),
        submitBtn = $('.'+submitBtn);
    classInput.change(function(){
        initValidation();
    });

    classInput.keyup(function(){
        initValidation();
    });

    classInput.click(function(){
        initValidation();
    });

    classInput.hover(function(){
        initValidation();
    });

    if(module == 'BOOKING'){
        $('.notifBox').click(function(){
            initValidation();
        })
    }

    function initValidation(){
        console.clear();
        var formInput = $('.'+inputClass+':enabled');
        var bool = 0;

        for(var i = 0; i < formInput.size(); i++){
            if(formInput.eq(i).val() != '' && formInput.eq(i).val() != undefined){
                bool++;
                console.log('- '+formInput.eq(i).val())
            }
        }
        console.log(bool+' out of '+formInput.size());

        if(module == 'BOOKING'){
            if(bool == formInput.size() && notifBox_booking('notifBox')){
                submitBtn.prop('disabled', false);
            }else{
                submitBtn.prop('disabled', true);
            }
        }else{
            if(bool == formInput.size()){
                submitBtn.prop('disabled', false);
            }else{
                submitBtn.prop('disabled', true);
            }
        }

    }
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

function showActualDateFields(statusId) {
    $.ajax({
        url: 'loadActualDateForm',
        type: 'POST',
        data: { statusIdParam: statusId },
        dataType: 'html',
        success: function (html) {
            $('#actualInput').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}

function showEditItemListingFields(orderItemId) {
    $.ajax({
        url: 'loadEditItemListing',
        type: 'POST',
        async: false,
        data: { orderItemIdParam: orderItemId},
        dataType: 'html',
        success: function (html) {
            $('#editItemListingInput').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}

function showContainerDetails(orderItemId) {
    $.ajax({
        url: 'loadContainerDetails',
        type: 'POST',
        data: { orderItemIdParam: orderItemId },
        dataType: 'html',
        success: function (html) {
            $('#containerInput').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}

// restrict a textfield for numbers only
function restrictField_Numbers(fieldClass){
    $('.'+fieldClass).keypress(function(e) {
        var a = [];
        var k = e.which;

        for (i = 48; i < 58; i++)
            a.push(i);

        if (!(a.indexOf(k)>=0))
            e.preventDefault();
    })
}

function notifBox_booking(boxClass){
    var bool = false;
    for(var i=0; i < $('.'+boxClass).size(); i++){
        if($('.'+boxClass).eq(i).is(':checked')){
            bool = true;
        }
    }

    return bool;
//    console.log($('.'+boxClass).size());
}

function validateSearchModal(button, textfield, dropdown){
    $('.'+textfield).keyup(function(){initValidate();})
    $('.'+dropdown).change(function(){initValidate();})

    function initValidate(){
        console.clear();
        if($('.'+textfield).val() != '' && $('.'+dropdown).val() != ''){
            $('.'+button).prop('disabled', false);
            console.log('ENABLE BUTTON');
        }else{
            $('.'+button).prop('disabled', true);
            console.log('DISABLE BUTTON');
        }
    }
}

function changeDateValue(dateSelector, mode){
    var newDate = new Date(dateSelector.val());

    if(mode == 'DECREMENT'){
        newDate.setDate(newDate.getDate()-1);
    }else{
        newDate.setDate(newDate.getDate()+1);
    }
    newDate = (newDate.getMonth()+1) +'-'+ newDate.getDate()+'-'+newDate.getUTCFullYear();
//    dateSelector.empty().val(newDate);
    return newDate;
}

function hideVesselSchedule(){
    var departureDateTable = $('.listOfSchedules tbody tr td:nth-child(6)'),
        arrivalDateTable = $('.listOfSchedules tbody tr td:nth-child(7)'),
        schedClass = $('.listOfSchedules tbody tr td:nth-child(8)'),
        bookingClass = $('#bookingClass'),
        currentDate = new Date().setHours(0,0,0,0),
        pickupDate = new Date($('.pickupDate').val()).setHours(0,0,0,0),
        deliveryDate = new Date($('.deliveryDate').val()).setHours(0,0,0,0),
        voyageNumberCurrent = $('.currentSchedulesTable tbody tr td:nth-child(2)').eq(0).text(),
        voyageNumberList = $('.listOfSchedules tbody tr td:nth-child(2)');

    for(var i=0; i < departureDateTable.size(); i++){
        var loopDepartureDate = new Date(departureDateTable.eq(i).text()).setHours(0,0,0,0),
            loopArrivalDate = new Date(arrivalDateTable.eq(i).text()).setHours(0,0,0,0);

//        if(voyageNumberCurrent == voyageNumberList.eq(i).text()){
//            voyageNumberList.eq(i).closest('tr').remove();
//            continue;
//        }

        // DELETES OVERDUE SCHEDULES
        if(loopDepartureDate < currentDate){
            departureDateTable.eq(i).closest('tr').remove();
            continue;
        }

        if(pickupDate > loopDepartureDate || deliveryDate < loopArrivalDate){
            departureDateTable.eq(i).closest('tr').remove();
            continue;
        }

        if(bookingClass.val() == 'REGULAR'){
            if(schedClass.eq(i).text() == 'PREMIUM'){
                schedClass.eq(i).closest('tr').remove();
                continue;
            }
        }else if(bookingClass.val() == 'ECONOMY'){
            if(schedClass.eq(i).text() != 'ECONOMY'){
                schedClass.eq(i).closest('tr').remove();
                continue;
            }
        }

        var arrivalDateReformat = dateAbbrev_Format3(arrivalDateTable.eq(i).text()),
            departureDateReformat = dateAbbrev_Format3(departureDateTable.eq(i).text());

        arrivalDateTable.eq(i).empty().append(arrivalDateReformat);
        departureDateTable.eq(i).empty().append(departureDateReformat);
    }

    setTimeout(function(){
        if($('.listOfSchedules tbody tr').size() == 0){
            $('.loadingDiv').empty().append('<i>No schedule found.</i>');
        }else{
            /*if($('.listOfSchedules tbody tr').size() > 10){
             $('.listOfSchedules').oneSimpleTablePagination({rowsPerPage: 10});
             }*/
            $('.loadingDiv').hide();
            $('.tableDiv').fadeIn();
        }
    }, 1000);

//    if($('.listOfSchedules tbody tr').size() == 0){
//        $('.loadingDiv').empty().append('<i>No schedule found.</i>');
//    }else{
//        if($('.listOfSchedules tbody tr').size() > 10){
//            $('.listOfSchedules').oneSimpleTablePagination({rowsPerPage: 10});
//        }
//        $('.loadingDiv').hide();
//        $('.tableDiv').fadeIn();
//    }
}

function addTotalRate(){
    // Addition of rate (php) and conversion to currency format
    var itemList = $('.itemListing tbody tr td:nth-child(7)'),
        totalPhp = 0;

    for(var i=0; i < itemList.size(); i++){
        if($.isNumeric(parseFloat(itemList.eq(i).text()))){
            var origRate = parseFloat(itemList.eq(i).text());
            totalPhp += origRate;
            itemList.eq(i).empty().append(origRate.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
        }else{
            itemList.eq(i).empty().append('<font color="red">0.00</font>');
        }
    }
    totalPhp = totalPhp.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    if(totalPhp == 0.00 || totalPhp == 0 || totalPhp == 0.0){
        totalPhp = '<font color="red">'+totalPhp+'</font>'
    }

    $('#totalRate').empty().append(totalPhp);
    $('.loadingDiv').hide();
    $('.tableDiv').fadeIn();
}

function dateValidationInit(){
    $('.finalSaveBtn').click(function(){
        var pickupdate = new Date($('.pickupDate').val()),
            departureDate = new Date($('.departureDate').val()),
            finalPickupDate = new Date($('.finalPickupDate').val()),
            finalSaveBtn = $('.finalSaveBtn'),
            serviceMode = $('.serviceModeField').val(),
            serviceType = $('.serviceTypeField').val(),
            formToSubmit = $('.originForm'),
            originVendor = $('#vendorListOrigin').val(),
            originDriver = $('#driverList').val(),
            originTruck = $('#trucksList').val();

        if(serviceType != 'TRUCKING') {
            if (departureDate != 'Invalid Date' && pickupdate != 'Invalid Date') {
                if (finalPickupDate.setHours(0, 0, 0, 0) >= pickupdate.setHours(0, 0, 0, 0) && finalPickupDate.setHours(0, 0, 0, 0) <= departureDate.setHours(0, 0, 0, 0)) {
                    finalPickupDateModal(originVendor,originDriver,originTruck,finalPickupDate);
                    $('#saveDispatchPlanning').modal('show');
                    //formToSubmit.submit();
                } else {
                    pickupdate = pickupdate.getUTCFullYear() + '-' + (pickupdate.getMonth() + 1) + '-' + pickupdate.getDate();
                    departureDate = departureDate.getUTCFullYear() + '-' + (departureDate.getMonth() + 1) + '-' + departureDate.getDate();
                    var message = 'Date must be between <font color="red">' + pickupdate + '</font> and <font color="red">' + departureDate + '</font> <br/>Do you still wish to proceed?';
                    $('#dateWarningModalBody').empty().append(message);
                    $('#dateWarningModal').modal('show');
                }
            } else {
                if (pickupdate != 'Invalid Date') {
                    if (finalPickupDate.setHours(0, 0, 0, 0) >= pickupdate.setHours(0, 0, 0, 0)) {
                        finalPickupDateModal(originVendor,originDriver,originTruck,finalPickupDate);
                        $('#saveDispatchPlanning').modal('show');
                        //formToSubmit.submit();
                    } else {
                        pickupdate = pickupdate.getUTCFullYear() + '-' + (pickupdate.getMonth() + 1) + '-' + pickupdate.getDate();
                        var message = 'Date must be no later than <font color="red">' + pickupdate + '</font>';
                        $('#dateWarningModalBody').empty().append(message);
                        $('#dateWarningModal').modal('show');
                    }
                } else {
                    if (finalPickupDate.setHours(0, 0, 0, 0) <= departureDate.setHours(0, 0, 0, 0)) {
                        finalPickupDateModal(originVendor,originDriver,originTruck,finalPickupDate);
                        $('#saveDispatchPlanning').modal('show');
                        //formToSubmit.submit();
                    } else {
                        departureDate = departureDate.getUTCFullYear() + '-' + (departureDate.getMonth() + 1) + '-' + departureDate.getDate();
                        var message = 'Date must be no later than <font color="red">' + departureDate + '</font>';
                        $('#dateWarningModalBody').empty().append(message);
                        $('#dateWarningModal').modal('show');
                    }
                }
            }
        }else{
            finalPickupDateModal(originVendor,originDriver,originTruck,finalPickupDate);
            $('#saveDispatchPlanning').modal('show');
            //formToSubmit.submit();
        }

    })
}

function dateValidationInitDes(){
    $('.finalSaveBtnDes').click(function(){

        var deliveryDate = new Date($('.deliveryDate').val()),
            arrivalDate = new Date($('.arrivalDate').val()),
            finalDeliveryDate = new Date($('.finalDeliveryDate').val()),
            finalSaveBtnDes = $('.finalSaveBtnDes').val(),
            serviceMode = $('.serviceModeField').val(),
            serviceType = $('.serviceTypeField').val(),
            formToSubmit = $('.destinationForm').val(),
            destinationVendor = $('#vendorListDestination').val(),
            destinationDriver = $('#driverListDestination').val(),
            destinationTruck = $('#trucksListDestination').val();

        if(serviceType != 'TRUCKING') {
            if (arrivalDate != 'Invalid Date' && deliveryDate != 'Invalid Date') {
                if (deliveryDate.setHours(0, 0, 0, 0) >= finalDeliveryDate.setHours(0, 0, 0, 0) && arrivalDate.setHours(0, 0, 0, 0) <= finalDeliveryDate.setHours(0, 0, 0, 0)) {
                    /*formToSubmit.submit();*/
                    finalDeliveryDateModal(destinationVendor, destinationDriver, destinationTruck, finalDeliveryDate);
                    $('#saveDispatchPlanning').modal('show');
                } else {
                    deliveryDate = deliveryDate.getUTCFullYear() + '-' + (deliveryDate.getMonth() + 1) + '-' + deliveryDate.getDate();
                    arrivalDate = arrivalDate.getUTCFullYear() + '-' + (arrivalDate.getMonth() + 1) + '-' + arrivalDate.getDate();
                    var message = 'Date must be between <font color="red">' + arrivalDate + '</font> and <font color="red">' + deliveryDate + '</font> <br/>Do you still wish to proceed?';
                    $('#dateWarningModalBodyDes').empty().append(message);
                    $('#dateWarningModalDes').modal('show');
                }
            } else {
                if (deliveryDate != 'Invalid Date') {
                    if (deliveryDate.setHours(0, 0, 0, 0) >= finalDeliveryDate.setHours(0, 0, 0, 0)) {
                        /*formToSubmit.submit();*/
                        finalDeliveryDateModal(destinationVendor, destinationDriver, destinationTruck, finalDeliveryDate);
                        $('#saveDispatchPlanning').modal('show');
                    } else {
                        deliveryDate = deliveryDate.getUTCFullYear() + '-' + (deliveryDate.getMonth() + 1) + '-' + deliveryDate.getDate();
                        var message = 'Date must be no later than <font color="red">' + deliveryDate + '</font>';
                        $('#dateWarningModalBodyDes').empty().append(message);
                        $('#dateWarningModalDes').modal('show');
                    }
                } else {
                    if (arrivalDate.setHours(0, 0, 0, 0) <= finalDeliveryDate.setHours(0, 0, 0, 0)) {
                        /*formToSubmit.submit();*/
                        finalDeliveryDateModal(destinationVendor, destinationDriver, destinationTruck, finalDeliveryDate);
                        $('#saveDispatchPlanning').modal('show');
                    } else {
                        arrivalDate = arrivalDate.getUTCFullYear() + '-' + (arrivalDate.getMonth() + 1) + '-' + arrivalDate.getDate();
                        var message = 'Date must be on or after <font color="red">' + arrivalDate + '</font>';
                        $('#dateWarningModalBodyDes').empty().append(message);
                        $('#dateWarningModalDes').modal('show');
                    }
                }
            }
        }else{
            finalDeliveryDateModal(destinationVendor, destinationDriver, destinationTruck, finalDeliveryDate);
            $('#saveDispatchPlanning').modal('show');
        }

    })
}

function finalPickupDateModal(originVendor,originDriver,originTruck,finalPickupDate){

    finalPickupDate = finalPickupDate.getUTCFullYear() + '-' + (finalPickupDate.getMonth() + 1) + '-' + finalPickupDate.getDate();

    $.ajax({
        url: 'getConfirmModalDispatchAction',
        type: 'POST',
        data: {vendorId : originVendor, driverCodeParam: originDriver, truckCodeParam : originTruck, finalPickupParam : finalPickupDate},
        dataType: 'html',
        success: function (html) {
            $('#inputDiv').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert('An error occured! ' + thrownError);
        }
    });
}

function finalDeliveryDateModal(destinationVendor,destinationDriver,destinationTruck,finalDeliveryDate){

    finalDeliveryDate = finalDeliveryDate.getUTCFullYear() + '-' + (finalDeliveryDate.getMonth() + 1) + '-' + finalDeliveryDate.getDate();

    $.ajax({
        url: 'getConfirmModalDispatchActionDes',
        type: 'POST',
        data: {vendorId : destinationVendor, driverCodeParam: destinationDriver, truckCodeParam : destinationTruck, finalDeliveryParam : finalDeliveryDate},
        dataType: 'html',
        success: function (html) {
            $('#inputDiv').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert('An error occured! ' + thrownError);
        }
    });
}


function finalPickupDateBulkModal(originVendor,originDriver,originTruck,dispatchFinalPickup){

    dispatchFinalPickup = dispatchFinalPickup.getUTCFullYear() + '-' + (dispatchFinalPickup.getMonth() + 1) + '-' + dispatchFinalPickup.getDate();

    $.ajax({
        url: 'getConfirmModalDispatchBulkAction',
        type: 'POST',
        data: {vendorId : originVendor, driverCodeParam: originDriver, truckCodeParam : originTruck, finalPickupParam : dispatchFinalPickup},
        dataType: 'html',
        success: function (html) {
            $('#inputDiv').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert('An error occured! ' + thrownError);
        }
    });
}

function finalDeliveryDateBulkModal(destinationVendor,destinationDriver,destinationTruck,dispatchFinalDelivery){

    dispatchFinalDelivery = dispatchFinalDelivery.getUTCFullYear() + '-' + (dispatchFinalDelivery.getMonth() + 1) + '-' + dispatchFinalDelivery.getDate();

    $.ajax({
        url: 'getConfirmModalDispatchBulkActionDes',
        type: 'POST',
        data: {vendorId : destinationVendor, driverCodeParam: destinationDriver, truckCodeParam : destinationTruck, finalDeliveryParam : dispatchFinalDelivery},
        dataType: 'html',
        success: function (html) {
            $('#inputDiv').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert('An error occured! ' + thrownError);
        }
    });
}

function sameDateValidationInit(){
    $('.submitBtn').click(function(){
        var departureDate = new Date($('.departureDate').val()),
            arrivalDate = new Date($('.arrivalDate').val()),
            submitBtn = $('.submitBtn'),
            formToSubmit = $('.vesselScheduleForm');

        if(departureDate.setHours(0, 0, 0, 0) == arrivalDate.setHours(0, 0, 0, 0)) {
            var message = 'Departure Date is the same with Arrival Date';
            $('#dateWarningModalBody').empty().append(message);
            $('#dateWarningModal').modal('show');
        }else{
            formToSubmit.submit();
        }
    })
}

function vesselScheduleColor(tableClass, departureColumn){
    var tableDepartureColumn = $('#'+tableClass+' tbody tr td:nth-child('+departureColumn+')');
    for(var i = 0; i < tableDepartureColumn.size(); i++){
        var departDate = new Date(tableDepartureColumn.eq(i).text()).setHours(0,0,0,0),
            currentDate = new Date().setHours(0,0,0,0);
        if(departDate < currentDate){ tableDepartureColumn.eq(i).closest('tr').css('background-color', '#f2a5aa');
        }else{ tableDepartureColumn.eq(i).closest('tr').css('background-color', '#dff0d8'); }
    }
}

function changeDocumentInputLabels(documentName) {
    var documentSeries = $('.documentSeries');

    switch(documentName){
        case 'BOOKING REQUEST FORM' :
            documentSeries.empty().append('BRF Number <span class="asterisk_red"></span>');
            break;
        case 'PROFORMA BILL OF LADING' :
            documentSeries.empty().append('Bill of Lading Number <span class="asterisk_red"></span>');
            break;
        case 'MASTER BILL OF LADING' :
            documentSeries.empty().append('Bill of Lading Number <span class="asterisk_red"></span>');
            break;
        case 'HOUSE BILL OF LADING' :
            documentSeries.empty().append('Bill of Lading Number <span class="asterisk_red"></span>');
            break;
        case 'HOUSE WAYBILL ORIGIN' :
            documentSeries.empty().append('Waybill Number <span class="asterisk_red"></span>');
            break;
        case 'MASTER WAYBILL ORIGIN' :
            documentSeries.empty().append('Waybill Number <span class="asterisk_red"></span>');
            break;
        case 'HOUSE WAYBILL DESTINATION' :
            documentSeries.empty().append('Waybill Number <span class="asterisk_red"></span>');
            break;
        case 'MASTER WAYBILL DESTINATION' :
            documentSeries.empty().append('Waybill Number <span class="asterisk_red"></span>');
            break;
        default :
            break;

    }
}

/*function documentsCheckbox(){
 $('.documentsCheckbox').click(function(){

 if($(this).parent().siblings().eq(1).text() == undefined || $(this).parent().siblings().eq(1).text() == '' || $(this).parent().siblings().eq(1).text() == null){
 //            alert('Please input SERIES NUMBER first before proceeding document');
 $('#warningModalContent').empty().append('Please input SERIES NUMBER first before proceeding document');
 $('#warningModal').modal().show();
 }else{
 window.location = $(this).prev().attr('href');
 }
 });
 }*/

function preventSamePort(select1, select2) {
    select2.find('option').show();
    select2.find('option:contains("'+select1.val()+'")').hide();
}

function buttonControl(){
    switch($('.serviceModeInput').val()){
        case 'PIER TO DOOR' :
            //$('.houseWaybillOriginBtn').hide();
            $('.houseWaybillDestinationBtn').show();
            break;
        case 'DOOR TO PIER' :
            $('.houseWaybillOriginBtn').show();
            $('.houseWaybillDestinationBtn').hide();
            break;
        case 'PIER TO PIER' :
            $('.houseWaybillDestinationBtn').hide();
            $('.houseWaybillOriginBtn').hide();
            break;
        default :
            $('.houseWaybillDestinationBtn').show();
            $('.houseWaybillOriginBtn').show();
    }
}

function dispatchFilterScheduleOrigin() {
    $('.dispatchSaveBtn').click(function() {
        var dispatchFreightTable = $('.freightTableBulk tbody tr'),
            scheduleDeparture = $('.freightTableBulk tbody tr td:nth-child(6)'),
            dispatchFinalPickup = new Date($('.dispatchFinalPickup').val()),
            formToSubmit = $('.dispatchOriginForm'),
            finalDeparture,
            selectedDeparture,
            originVendor = $('#vendorListOrigin').val(),
            originDriver = $('#driverList').val(),
            originTruck = $('#trucksList').val(),
            serviceType = $('.serviceType').val();

        for (var i = 0; i < dispatchFreightTable.size(); i++) {
            var loop_schedDeparture = new Date(scheduleDeparture.eq(i).text()).setHours(0, 0, 0, 0);

            if (i == 0) {
                selectedDeparture = loop_schedDeparture;
            }

            if (loop_schedDeparture <= selectedDeparture) {
                selectedDeparture = loop_schedDeparture;
            }
        }

        if(serviceType != 'TRUCKING'){
            if (selectedDeparture >= dispatchFinalPickup.setHours(0, 0, 0, 0)) {
                /*formToSubmit.submit();*/
                finalPickupDateBulkModal(originVendor, originDriver, originTruck, dispatchFinalPickup);
                $('#saveDispatchPlanning').modal('show');
            } else {
                finalDeparture = new Date(selectedDeparture);
                finalDeparture = finalDeparture.getUTCFullYear() + '-' + (finalDeparture.getMonth() + 1) + '-' + finalDeparture.getDate();
                var message = 'Date must be no later than <font color="red">' + finalDeparture + '</font> <br/> Do you still wish to proceed?';
                $('#dateWarningModalBody').empty().append(message);
                $('#dateWarningModal').modal('show');
            }
        }else{
            finalPickupDateBulkModal(originVendor, originDriver, originTruck, dispatchFinalPickup);
            $('#saveDispatchPlanning').modal('show');
        }
    })
}

function dispatchFilterScheduleDestination() {
    $('.dispatchSaveBtnDes').click(function() {
        var dispatchFreightTable = $('.freightTableBulk tbody tr'),
            scheduleArrival = $('.freightTableBulk tbody tr td:nth-child(7)'),
            dispatchFinalDelivery = new Date($('.dispatchFinalDelivery').val()),
            formToSubmit = $('.dispatchDestinationForm'),
            finalArrival,
            selectedArrival,
            destinationVendor = $('#vendorListDestination').val(),
            destinationDriver = $('#driverListDestination').val(),
            destinationTruck = $('#trucksListDestination').val(),
            serviceType = $('.serviceType').val(),
            serviceMode = $('.serviceMode').val();

        for (var i = 0; i < dispatchFreightTable.size(); i++){
            var loop_schedArrival = new Date(scheduleArrival.eq(i).text()).setHours(0,0,0,0);

            if(i == 0){
                selectedArrival = loop_schedArrival;
            }

            if(loop_schedArrival <= selectedArrival){
                selectedArrival = loop_schedArrival;
            }
        }

        if(serviceType != 'TRUCKING'){
            if(serviceMode != 'DELIVERY'){
                if(selectedArrival <= dispatchFinalDelivery.setHours(0,0,0,0)){
                    /*formToSubmit.submit();*/
                    finalDeliveryDateBulkModal(destinationVendor, destinationDriver, destinationTruck, dispatchFinalDelivery);
                    $('#saveDispatchPlanning').modal('show');
                }else{
                    finalArrival = new Date(selectedArrival);
                    finalArrival = finalArrival.getUTCFullYear() + '-' + (finalArrival.getMonth() + 1) + '-' + finalArrival.getDate();
                    var message = 'Date must be on or after <font color="red">' + finalArrival + '</font> <br/> Do you still wish to proceed?';
                    $('#dateWarningModalBodyDes').empty().append(message);
                    $('#dateWarningModalDes').modal('show');
                }
            }else{
                finalDeliveryDateBulkModal(destinationVendor, destinationDriver, destinationTruck, dispatchFinalDelivery);
                $('#saveDispatchPlanning').modal('show');
            }

        }else{
            finalDeliveryDateBulkModal(destinationVendor, destinationDriver, destinationTruck, dispatchFinalDelivery);
            $('#saveDispatchPlanning').modal('show');
        }

    })
}

function lclHideVesselSchedule(){
    $('.lclConsolidateSchedule tbody tr').show();
    // FIRST STEP - FILTER SCHEDULE TABLE BY ORIGIN / DESTINATION
    var scheduleTable = $('.lclConsolidateSchedule tbody tr'),
        sched_origin = $('.lclConsolidateSchedule tbody tr td:nth-child(4)'),
        sched_desti = $('.lclConsolidateSchedule tbody tr td:nth-child(5)'),
        checkedItems = $('.lclCheckbox:checked'),
        lclTable_ori = checkedItems.eq(0).closest('tr').find('td').eq(5).text(),
        lclTable_des = checkedItems.eq(0).closest('tr').find('td').eq(6).text();

    for(var i=0; i < scheduleTable.size(); i++){
        if(placeAbbrev(sched_desti.eq(i).text()) == lclTable_des){
            if(placeAbbrev(sched_origin.eq(i).text()) != lclTable_ori){
                sched_origin.eq(i).closest('tr').hide();
            }
        }else{
            sched_origin.eq(i).closest('tr').hide();
        }
    }
    // FIRST STEP - END

    // SECOND STEP - FILTER SCHEDULE BY DATE - START
    var lcl_pickupDateValue,
        lcl_deliveryDateValue,
        checkbox = $('.lclCheckbox:checked');

    for(var i=0; i < checkbox.size(); i++){
        var loop_pickupDate = new Date(checkbox.eq(i).closest('tr').find('td').eq(11).text()).setHours(0,0,0,0),
            loop_deliveryDate = new Date(checkbox.eq(i).closest('tr').find('td').eq(12).text()).setHours(0,0,0,0);

        if(i == 0){
            lcl_pickupDateValue = loop_pickupDate;
            lcl_deliveryDateValue = loop_deliveryDate;
        }

        if(loop_pickupDate < lcl_pickupDateValue){
            lcl_pickupDateValue = loop_pickupDate;
        }

        if(loop_deliveryDate < lcl_deliveryDateValue){
            lcl_deliveryDateValue = loop_deliveryDate;
        }
    }

    var lclConsolidateSchedule = $('.lclConsolidateSchedule tbody tr'),
        conso_departureDate = $('.lclConsolidateSchedule tbody tr td:nth-child(6)'),
        conso_arrivalDate = $('.lclConsolidateSchedule tbody tr td:nth-child(7)'),
        currentDate = new Date().setHours(0,0,0,0);

    for(var i=0; i < lclConsolidateSchedule.size(); i++){

        var loop_departureDate = new Date(conso_departureDate.eq(i).text()).setHours(0,0,0,0),
            loop_arrivalDate = new Date(conso_arrivalDate.eq(i).text()).setHours(0,0,0,0);

        if(loop_departureDate < currentDate){
            conso_departureDate.eq(i).closest('tr').hide();
            continue;
        }

        if(lcl_pickupDateValue > loop_departureDate){
            if(lcl_deliveryDateValue != loop_arrivalDate){
                conso_departureDate.eq(i).closest('tr').hide();
                continue;
            }
        }

        // MODIFIED VERSION - REPLACE ABOVE CHECKING WITH THIS AND TEST/PLAY IT OUT - Jan (START)
        if(lcl_pickupDateValue > loop_departureDate){
            if(lcl_deliveryDateValue != loop_arrivalDate && lcl_deliveryDateValue > loop_arrivalDate){
                conso_departureDate.eq(i).closest('tr').hide();
                continue;
            }
        }
        // MODIFIED VERSION - REPLACE ABOVE CHECKING WITH THIS AND TEST/PLAY IT OUT - Jan (END)
    }

    // SECOND STEP - END

    // THIRD STEP (OPTIONAL) - START (this steps determines if there are any schedules left in the table
    var visibleRow = $('.lclConsolidateSchedule tbody tr').size() - $('.lclConsolidateSchedule tbody tr[style="display: none;"]').size();
    if(visibleRow != 0){
        $('.consolidateLoadingDiv').append('Pulling up Schedules. Please Wait.<br/><i style="padding: 10px; font-size: 2em; color: #95A5A6;" class="fa fa-repeat fa-spin"></i>').hide();
        $('.consolidateTableDiv').fadeIn();
    }else{
        $('.consolidateLoadingDiv').empty().append('<h3><i class="fa fa-warning" style="color: #ff0000"></i> No schedules found</h3><i><span style="color: red;">*</span> Please make sure you have existing/matching schedule(s).<br/>Click <a href="/operations/loadAddVesselSchedule">here</a> to create schedule(s)</i>').show();
        $('.consolidateTableDiv').hide();
    }

    // APPEND ALL ID OF CHECKED ITEMS -- START
    //for(var i=0; i < checkedItems.size(); i++){
    //    var itemId = checkedItems.eq(i).closest('tr').find('td').eq(14).text()
    //    if(i == 0){
    //        $('.consolidateModalTextfield').val(itemId);
    //    }else{
    //        $('.consolidateModalTextfield').val($('.consolidateModalTextfield').val()+'?'+itemId);
    //    }
    //}
    // APPEND ALL ID OF CHECKED ITEMS -- END

    //$('#consolidateModal').modal('show');
    // THIRD STEP (OPTIONAL) - END
}

function filterLclTable(){
    var lclTable = $('.lclTable tbody tr'),
        lcl_origin = $('.lclTable tbody tr td:nth-child(6)'),
        lcl_desti = $('.lclTable tbody tr td:nth-child(7)'),
        lcl_status = $('.lclTable tbody tr td:nth-child(9)'),
        lcl_checkboxColumn = $('.lclTable tbody tr td:nth-child(1)'),
        lcl_actionColumn = $('.lclTable tbody tr td:nth-child(14)'),
        initialOrigin = lcl_origin.eq(0).text(),
        initialDestination = lcl_desti.eq(0).text(),
        boolean = false;

    for(var i=0; i < lclTable.size(); i++){
//        if(initialDestination != lcl_desti.eq(i).text() || initialOrigin != lcl_origin.eq(i).text()){
//            boolean = true;
//        }
//
//        if(boolean){
//            $('.lclCheckbox').prop('disabled', true);
//        }

        switch(lcl_status.eq(i).text()){
            case 'PENDING' :
            case 'INCOMPLETE' :
            case 'CANCELLED' :
            case 'SERVICE ACCOMPLISHED' :
                lcl_actionColumn.eq(i).empty().append('<i style="color: red;" class="fa fa-ban"></i>');
                lcl_checkboxColumn.eq(i).empty().append('<i style="color: red;" class="fa fa-ban"></i>');
        }
    }

    $('.lclTable td:nth-child(15)').hide();
    $('.lclTable th:nth-child(15)').hide();
    //$('.lclTable tbody tr').hide();
    $('.lclMainLoadingDiv').hide();
    $('.lclMainTable').fadeIn();
}

function lclCheckboxFilter(item){
    if(item.is(':checked')){
        var des = item.closest('tr').find('td').eq(6).text(),
            ori = item.closest('tr').find('td').eq(5).text(),
            box = $('.lclCheckbox');

        for(var i=0; i < box.size(); i++){
            if(box.eq(i).closest('tr').find('td').eq(6).text() == des && box.eq(i).closest('tr').find('td').eq(5).text() == ori){
                box.eq(i).attr('disabled', false);
            }else{
                box.eq(i).attr('disabled', true);
            }
        }
    }else{
        var disabledBox = $('.lclCheckbox:disabled'),
            checkedBox = $('.lclCheckbox:checked');
        if(checkedBox.size() != 0){
            for(var i=0; i < disabledBox.size(); i++){
                if(checkedBox.eq(i).closest('tr').find('td').eq(5).text() == disabledBox.eq(i).closest('tr').find('td').eq(5).text() && checkedBox.eq(i).closest('tr').find('td').eq(6).text() != disabledBox.eq(i).closest('tr').find('td').eq(6).text()){
                    disabledBox.eq(i).attr('disabled', false);
                }
            }
        }else{
            disabledBox.attr('disabled', false);
        }
    }
    if($('.lclCheckbox:checked').size() != 0){
        $('.warningMsg').hide();
        $('.consolidateBtn').attr('disabled', false);
    }else{
        $('.warningMsg').show();
        $('.consolidateBtn').attr('disabled', true);
    }
}

function actionConfirmation(icon, confirmBtn, modal){
    icon.click(function(){
        // added this to prevent losing the tooltip for cancel and approve
        if($(this).parent().attr('href') != undefined){
            $(this).parent().click(function(event){
                event.preventDefault();
            });
            confirmBtn.attr('href', $(this).parent().attr('href'));
        }
        else{
            confirmBtn.attr('href', $(this).prev().attr('href'));
        }
        modal.modal('show');

    });
}

function checkDocumentModal(documentItem,orderIdPass,checkedBox,stageParam) {
    $.ajax({
        url: 'confirmDocumentModal',
        type: 'POST',
        data: { documentItem: documentItem, orderIdParam: orderIdPass, checkString: checkedBox, documentStageParam: stageParam },
        dataType: 'html',
        success: function (html) {
            $('#documentListDiv').html(html);
            $('#confirmDocumentProcess').modal('show');
        },
        error: function(xhr, ajaxOptions, thrownError){
            alert('An error occurred! ' + thrownError);
        }
    });
}

function processDocumentStage(table, tableDiv, loadingDiv, stageColumn, idColumn){
    var stageFlag = $(table+' tbody tr td:nth-child('+stageColumn+')'),
        idFlag = $(table+' tbody tr td:nth-child('+idColumn+')');

    for(var i=0; i < stageFlag.size(); i++){
        switch(stageFlag.eq(i).text()){
            case '0' :
                stageFlag.eq(i).closest('tr').css('background-color', '#D0D0D0');
                break;
            case '1' :
                stageFlag.eq(i).closest('tr').css('background-color', '#66CCFF');
                break;
            case '2' :
                stageFlag.eq(i).closest('tr').css('background-color', '#ffd37e');
                break;
            case '3' :
                stageFlag.eq(i).closest('tr').css('background-color', '#feabff');
                break;
            case '4' :
                stageFlag.eq(i).closest('tr').css('background-color', '#c1c2ff');
                break;
            case '5' :
                stageFlag.eq(i).closest('tr').css('background-color', '#a7ffad');
                break;
        }
    }
    $(table+' thead tr th:nth-child('+stageColumn+')').hide();
    $(table+' thead tr th:nth-child('+idColumn+')').hide();
    stageFlag.hide();
    idFlag.hide();
    loadingDiv.hide();
    tableDiv.fadeIn();
}

function planningWarningMsg(){
    $('.submitBtn').click(function() {
        var vendorsTable = $('.vendorTable tbody tr'),
            vendorSea = $('.vendorTable tbody tr td:nth-child(1)'),
            vendorOrigin = $('.vendorTable tbody tr td:nth-child(2)'),
            vendorDestination = $('.vendorTable tbody tr td:nth-child(3)'),
            serviceMode = $('.serviceMode').val();
        var message = 'Are you sure you want to update this status?';
        var noVendMsg = 'One or more items/container(s) has missing vendor(s). Are you sure you want to update this status?';

        for(var i=0; i < vendorsTable.size(); i++) {
            if(serviceMode == 'DOOR TO DOOR') {
                if (vendorOrigin.eq(i).text() == null || vendorOrigin.eq(i).text() == '' || vendorDestination.eq(i).text() == null || vendorDestination.eq(i).text() == '' || vendorSea.eq(i).text() == null || vendorSea.eq(i).text() == '') {
                    $('#planWarningBody').empty().append(noVendMsg);
                    $('#planWarningModal').modal('show');
                }
                else{
                    $('#confirmStatId').empty().append(message);
                    $('#confirmStatModal').modal('show');
                }
            }
            else if(serviceMode == 'DOOR TO PIER') {
                if (vendorOrigin.eq(i).text() == null || vendorOrigin.eq(i).text() == '' || vendorSea.eq(i).text() == null || vendorSea.eq(i).text() == '') {
                    $('#planWarningBody').empty().append(noVendMsg);
                    $('#planWarningModal').modal('show');
                }
                else{
                    $('#confirmStatId').empty().append(message);
                    $('#confirmStatModal').modal('show');
                }
            }
            else if(serviceMode == 'PIER TO DOOR'){
                if (vendorDestination.eq(i).text() == null || vendorDestination.eq(i).text() == '' || vendorSea.eq(i).text() == null || vendorSea.eq(i).text() == '') {
                    $('#planWarningBody').empty().append(noVendMsg);
                    $('#planWarningModal').modal('show');
                }
                else{
                    $('#confirmStatId').empty().append(message);
                    $('#confirmStatModal').modal('show');
                }
            }
            else if(serviceMode == 'PIER TO PIER'){
                if (vendorSea.eq(i).text() == null || vendorSea.eq(i).text() == '') {
                    $('#planWarningBody').empty().append(noVendMsg);
                    $('#planWarningModal').modal('show');
                }
                else{
                    $('#confirmStatId').empty().append(message);
                    $('#confirmStatModal').modal('show');
                }
            }
            else if(serviceMode == 'PICKUP'){
                if (vendorOrigin.eq(i).text() == null || vendorOrigin.eq(i).text() == '') {
                    $('#planWarningBody').empty().append(noVendMsg);
                    $('#planWarningModal').modal('show');
                }
                else{
                    $('#confirmStatId').empty().append(message);
                    $('#confirmStatModal').modal('show');
                }
            }
            else if(serviceMode == 'DELIVERY'){
                if (vendorDestination.eq(i).text() == null || vendorDestination.eq(i).text() == '') {
                    $('#planWarningBody').empty().append(noVendMsg);
                    $('#planWarningModal').modal('show');
                }
                else{
                    $('#confirmStatId').empty().append(message);
                    $('#confirmStatModal').modal('show');
                }
            }
            else if(serviceMode == 'INTER-WAREHOUSE'){
                if (vendorOrigin.eq(i).text() == null || vendorOrigin.eq(i).text() == '') {
                    $('#planWarningBody').empty().append(noVendMsg);
                    $('#planWarningModal').modal('show');
                }
                else{
                    $('#confirmStatId').empty().append(message);
                    $('#confirmStatModal').modal('show');
                }
            }
        }
    });
}

