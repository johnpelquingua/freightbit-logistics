///**
///**
///**
///**
///**
///**
///**
///**
///**PLEASE DELETE THIS FILE
///**
///**
///**
///**
///**
// * Created by Jan on 11/19/2014.
// */
//function tableProp(tableClass, tableName, colStatus, colType, colReq, colMode, colOrigin, colDestination){
//    var tableTr = $('#'+tableName+' tbody tr');
//    for(var i = 0; i < tableTr.size(); i++){
//        var statusColumn = $('#'+tableName+' tbody tr td:nth-child('+colStatus+')').eq(i).text(),
//            typeColumn = $('#'+tableName+' tbody tr td:nth-child('+colType+')').eq(i),
//            reqColumn = $('#'+tableName+' tbody tr td:nth-child('+colReq+')').eq(i),
//            modeColumn = $('#'+tableName+' tbody tr td:nth-child('+colMode+')').eq(i);
//
//        if(tableClass == 'DESTI_ORIG'){
//            var desColumn = $('#'+tableName+' tbody tr td:nth-child('+colDestination+')').eq(i);
//            var origColumn = $('#'+tableName+' tbody tr td:nth-child('+colOrigin+')').eq(i);
//
//            // DESTINATION COLUMN
//            if(desColumn.text() == 'MANILA'){
//                desColumn.empty().append('MNL')
//            }else if(desColumn.text() == 'BACOLOD'){
//                desColumn.empty().append('BAC')
//            }else if(desColumn.text() == 'BUTUAN'){
//                desColumn.empty().append('BXU')
//            }else if(desColumn.text() == 'CAGAYAN'){
//                desColumn.empty().append('CGY')
//            }else if(desColumn.text() == 'COTABATO'){
//                desColumn.empty().append('CBO')
//            }else if(desColumn.text() == 'DAVAO'){
//                desColumn.empty().append('DVO')
//            }else if(desColumn.text() == 'DUMAGUETE'){
//                desColumn.empty().append('DGT')
//            }else if(desColumn.text() == 'DIPOLOG'){
//                desColumn.empty().append('DPG')
//            }else if(desColumn.text() == 'GEN. SANTOS'){
//                desColumn.empty().append('GES')
//            }else if(desColumn.text() == 'ILIGAN'){
//                desColumn.empty().append('ILI')
//            }else if(desColumn.text() == 'ILOILO'){
//                desColumn.empty().append('ILO')
//            }else if(desColumn.text() == 'OZAMIS'){
//                desColumn.empty().append('OZA')
//            }else if(desColumn.text() == 'GEN. SANTOS'){
//                desColumn.empty().append('GES')
//            }else if(desColumn.text() == 'PALAWAN'){
//                desColumn.empty().append('PPS')
//            }else if(desColumn.text() == 'ROXAS'){
//                desColumn.empty().append('RXS')
//            }else if(desColumn.text() == 'TAGBILARAN'){
//                desColumn.empty().append('TAG')
//            }else if(desColumn.text() == 'TACLOBAN'){
//                desColumn.empty().append('TAC')
//            }else if(desColumn.text() == 'ZAMBOANGA'){
//                desColumn.empty().append('ZAM')
//            }
//
//            // ORIGIN COLUMN
//            if(origColumn.text() == 'MANILA'){
//                origColumn.empty().append('MNL')
//            }else if(origColumn.text() == 'BACOLOD'){
//                origColumn.empty().append('BAC')
//            }else if(origColumn.text() == 'BUTUAN'){
//                origColumn.empty().append('BXU')
//            }else if(origColumn.text() == 'CAGAYAN'){
//                origColumn.empty().append('CGY')
//            }else if(origColumn.text() == 'COTABATO'){
//                origColumn.empty().append('CBO')
//            }else if(origColumn.text() == 'DAVAO'){
//                origColumn.empty().append('DVO')
//            }else if(origColumn.text() == 'DUMAGUETE'){
//                origColumn.empty().append('DGT')
//            }else if(origColumn.text() == 'DIPOLOG'){
//                origColumn.empty().append('DPG')
//            }else if(origColumn.text() == 'GEN. SANTOS'){
//                origColumn.empty().append('GES')
//            }else if(origColumn.text() == 'ILIGAN'){
//                origColumn.empty().append('ILI')
//            }else if(origColumn.text() == 'ILOILO'){
//                origColumn.empty().append('ILO')
//            }else if(origColumn.text() == 'OZAMIS'){
//                origColumn.empty().append('OZA')
//            }else if(origColumn.text() == 'GEN. SANTOS'){
//                origColumn.empty().append('GES')
//            }else if(origColumn.text() == 'PALAWAN'){
//                origColumn.empty().append('PPS')
//            }else if(origColumn.text() == 'ROXAS'){
//                origColumn.empty().append('RXS')
//            }else if(origColumn.text() == 'TAGBILARAN'){
//                origColumn.empty().append('TAG')
//            }else if(origColumn.text() == 'TACLOBAN'){
//                origColumn.empty().append('TAC')
//            }else if(origColumn.text() == 'ZAMBOANGA'){
//                origColumn.empty().append('ZAM')
//            }
//        }
//
//        // ROW COLORS
//        if(statusColumn == 'PENDING' || statusColumn == 'INCOMPLETE'){
//            tableTr.eq(i).css('background-color', '#fcf8e3');
//        }else if(statusColumn == 'DISAPPROVED' || statusColumn == 'CANCELLED'){
//            tableTr.eq(i).css('background-color', '#f2dede');
//        }else if(statusColumn == 'APPROVED' || statusColumn == 'SERVICE ACCOMPLISHED'){
//            tableTr.eq(i).css('background-color', '#dff0d8');
//        }else if(statusColumn == 'ON GOING'){
//            tableTr.eq(i).css('background-color', '#bce8f1');
//        }
//
//        // TYPE ICONS
//        if(typeColumn.text() == 'SHIPPING AND TRUCKING'){
//            typeColumn.empty().append("<i class='fa fa-anchor' /> <i class='fa fa-truck' />");
//        }else if(typeColumn.text() == 'SHIPPING'){
//            typeColumn.empty().append("<i class='fa fa-anchor' />");
//        }else if(typeColumn.text() == 'TRUCKING'){
//            typeColumn.empty().append("<i class='fa fa-truck' />");
//        }
//
//        // REQT COLUMN
//        if(reqColumn.text() == 'FULL CARGO LOAD' || reqColumn.text() == 'FULL CONTAINER LOAD'){
//            reqColumn.empty().append('FCL');
//        }else if(reqColumn.text() == 'FULL TRUCK LOAD'){
//            reqColumn.empty().append('FTL');
//        }else if(reqColumn.text() == 'LESS TRUCK LOAD'){
//            reqColumn.empty().append('LTL');
//        }else if(reqColumn.text() == 'LESS CARGO LOAD' || reqColumn.text() == 'LESS CONTAINER LOAD'){
//            reqColumn.empty().append('LCL');
//        }else if(reqColumn.text() == 'LOOSE CARGO LOAD'){
//            reqColumn.empty().append('LCU');
//        }else if(reqColumn.text() == 'ROLLING CARGO LOAD'){
//            reqColumn.empty().append('RCU');
//        }
//
//        // MODE COLUMN
//        if(modeColumn.text() == 'DOOR TO DOOR'){
//            modeColumn.empty().append('DD');
//        }else if(modeColumn.text() == 'DOOR TO PIER' || modeColumn.text() == 'DOOR TO PORT'){
//            modeColumn.empty().append('DP');
//        }else if(modeColumn.text() == 'PIER TO DOOR' || modeColumn.text() == 'PORT TO DOOR'){
//            modeColumn.empty().append('PD');
//        }else if(modeColumn.text() == 'PIER TO PIER' || modeColumn.text() == 'PORT TO PORT'){
//            modeColumn.empty().append('PP')
//        }else if(modeColumn.text() == 'PICKUP'){
//            modeColumn.empty().append('P')
//        }else if(modeColumn.text() == 'DELIVERY'){
//            modeColumn.empty().append('D')
//        }else if(modeColumn.text() == 'INTER-WAREHOUSE'){
//            modeColumn.empty().append('IW')
//        }
//    }
//}