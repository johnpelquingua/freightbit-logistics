
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

        <div class="modal-header margin-10-bot center-text" style="font-size: 1.5em; !important;">
            <i class="fa fa-plus"></i> Add New Documents
        </div>
        <s:hidden value="%{order.freightType}" cssClass="serviceType"/>
        <s:hidden value="%{order.modeOfService}" cssClass="serviceMode"/>
        <%--<s:hidden cssClass="originVendorFlag" value="%{originVendorFlag}" />
        <s:hidden cssClass="destinationVendorFlag" value="%{destinationVendorFlag}" />--%>
        <s:hidden cssClass="vendorLocationFlag" value="%{vendorLocationFlag}" />

        <s:form action="addDocument" theme="bootstrap" novalidate="true">

            <label class="col-lg-4 control-label" style="text-align: right;">Document Name</label>
            <div class="col-lg-8">
                <%--<s:textfield name="document.referenceId" value="%{orderIdParam}" />--%>
                <%--<s:param name="orderIdParam" value="%{orderIdParam}"></s:param>--%>
                <s:hidden name="documentStageParam" value="%{documentStageParam}" />

                <s:hidden name="document.referenceId" cssClass="orderIdParam" value="%{orderIdParam}" />

                    <input list="documents" id="documentName" name="document.documentName" class="form-control" maxLength="30" required="true" style="margin-bottom: 15px !important;" required="true"/>
                    <datalist id="documents" class="datalistDocuments">
                        <s:iterator value="documentNames">
                            <%--<option value=<s:property value="value"/> />--%>
                            <%--<s:property> </s:property>--%>
                            <%--<option> <s:property/> <option/>--%>
                            <option> <s:property value="value"/> <option/>
                        </s:iterator>
                    </datalist>

            </div>

            <div class="recipientField" style="display:none;">

                <label class="col-lg-4 control-label" style="clear:both; text-align: right; clear:both;">Authorized Agent to Withdraw</label>
                <div class="col-lg-8" >
                    <s:select id="representativeContact"
                              name="repContactIdParam"
                              cssClass="form-control"
                              style="margin-bottom: 15px !important;"
                              list="repContactsList"
                              listKey="driverId"
                              listValue="authorizedAgent"
                              required="true" />
                </div>

                <label class="col-lg-4 control-label" style="clear:both; text-align: right; clear:both;">Ernest Shipper Contact</label>
                <div class="col-lg-8" >
                    <s:select id="shipperContact"
                              name="shipperContactIdParam"
                              cssClass="form-control"
                              style="margin-bottom: 15px !important;"
                              list="shipperContacts"
                              listKey="contactId"
                              listValue="firstName + ' ' + lastName"
                              required="true" />
                </div>

                <label class="col-lg-4 control-label" style="clear:both; text-align: right; clear:both;">Ernest Consignee Contact</label>
                <div class="col-lg-8" >
                    <s:select id="consigneeContact"
                              name="consigneeContactIdParam"
                              cssClass="form-control"
                              style="margin-bottom: 15px !important;"
                              list="consigneeContacts"
                              listKey="contactId"
                              listValue="firstName + ' ' + lastName"
                              required="true" />
                </div>
            </div>

            <div class="seriesField">
                <label class="col-lg-4 control-label" style="clear:both; text-align: right; clear:both;">Series Number</label>
                <div class="col-lg-8" >
                    <s:textfield cssClass="form-control modalComment" name="document.referenceNumber" style="margin-bottom: 15px !important;" maxLength="30"/>
                </div>
            </div>

            <div class="commentsField">
                <label class="col-lg-4 control-label" style="text-align: right; clear:both;">Comments</label>
                <div class="col-lg-8" >
                    <%--<s:textarea cssClass="form-control modalTextArea" name="document.documentComments" style="margin-bottom: 15px !important; resize:none; height: 200px;"
                        id="document_documentComments" maxLength="255" data-toggle="tooltip" data-placement="left" title='e.g. "Change this with sample comments" <br/> "Another sample"' data-html="true"/>--%>
                        <s:textarea cssClass="form-control modalTextArea" name="document.documentComments" style="margin-bottom: 15px !important; resize:none; height: 200px;"
                                    id="document_documentComments" maxLength="255" />
                </div>
            </div>

            <div style="clear:both;" class="modal-footer">
                <s:url var="cancelInputUrl" action="viewOrderDocuments">
                    <s:param name="orderIdParam" value="document.referenceId"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{cancelInputUrl}" rel="tooltip">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </s:a>
                <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
            </div>

        </s:form>

<script>
    $(document).ready(function(){
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $('#documentName').on("input", function() {

            var documentName = $(this).val(),
                originVendorFlag = $('.originVendorFlag').val(),
                destinationVendorFlag = $('.destinationVendorFlag').val(),
                referenceNumber = $('.modalComment'),
                commentsBox = $('.modalTextArea'),
                seriesField = $('.seriesField'),
                commentsField = $('.commentsField'),
                recipientField = $('.recipientField');

            switch (documentName) {

            case 'HOUSE BILL OF LADING' :
                recipientField.hide();
                seriesField.hide();
                commentsField.hide();
                referenceNumber.prop('disabled', true);
                commentsBox.prop('disabled', true);
                break;

            case 'MASTER WAYBILL ORIGIN' :
                recipientField.hide();
                seriesField.hide();
                commentsField.hide();
                referenceNumber.prop('disabled', true);
                commentsBox.prop('disabled', true);
                break;

            case 'MASTER WAYBILL DESTINATION' :
                recipientField.hide();
                seriesField.hide();
                commentsField.hide();
                referenceNumber.prop('disabled', true);
                commentsBox.prop('disabled', true);
                break;

            case 'AUTHORIZATION TO WITHDRAW' :
                recipientField.show();
                seriesField.hide();
                commentsField.hide();
                referenceNumber.prop('disabled', true);
                commentsBox.prop('disabled', true);
                break;

            default :
                recipientField.hide();
                seriesField.show();
                commentsField.show();
                referenceNumber.prop('disabled', false);
                commentsBox.prop('disabled', false);
                break;
            }
        });

        for(var i=0; i < $('.datalistDocuments option').size(); i++){
            if($('.datalistDocuments option').eq(i).val() == ''){
                $('.datalistDocuments option').eq(i).remove();
            }
            if($('[name="documentStageParam"]').val() == 'OUTBOUND'){
                if($('.serviceType').val() == 'SHIPPING AND TRUCKING' || $('.serviceType').val() == 'SHIPPING'){
                    if($('.serviceMode').val() == 'PIER TO DOOR' ){
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' ){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else if($('.serviceMode').val() == 'DOOR TO PIER'){
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else if($('.serviceMode').val() == 'PIER TO PIER'){
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else{
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }
                }else{
                    $('.datalistDocuments').remove();
                }
            }else if($('[name="documentStageParam"]').val() == 'INBOUND'){
                if($('.serviceType').val() == 'SHIPPING AND TRUCKING' || $('.serviceType').val() == 'SHIPPING'){
                    if($('.serviceMode').val() == 'PIER TO DOOR' ) {
                        if ($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW' ) {
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else if($('.serviceMode').val() == 'DOOR TO PIER'){
                        if ($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER') {
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else if($('.serviceMode').val() == 'DOOR TO DOOR') {
                        if ($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW') {
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else{
                        if ($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN') {
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }
                }else{
                    if($('.serviceMode').val() == 'DELIVERY'){
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'HOUSE BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else{
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'HOUSE BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }

                }
            }else if($('[name="documentStageParam"]').val() == 'FINAL OUTBOUND'){
                if($('.serviceType').val() == 'SHIPPING AND TRUCKING' || $('.serviceType').val() == 'SHIPPING'){
                    if($('.serviceMode').val() == 'PIER TO DOOR' ){
                        if($('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else if($('.serviceMode').val() == 'DOOR TO PIER'){
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else if($('.serviceMode').val() == 'PIER TO PIER'){
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else{
                        if($('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' ||  $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }
                }else{
                    $('.datalistDocuments').remove();
                }
            }else if($('[name="documentStageParam"]').val() == 'FINAL INBOUND'){
                if($('.serviceType').val() == 'SHIPPING AND TRUCKING' || $('.serviceType').val() == 'SHIPPING'){
                    if($('.serviceMode').val() == 'PIER TO DOOR' ){
                        if($('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else if($('.serviceMode').val() == 'DOOR TO PIER' ){
                        if($('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }else{
                        if($('.datalistDocuments option').eq(i).val() == 'ACCEPTANCE RECEIPT' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY ORDER' || $('.datalistDocuments option').eq(i).val() == 'RELEASE ORDER' || $('.datalistDocuments option').eq(i).val() == 'AUTHORIZATION TO WITHDRAW' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL ORIGIN' || $('.datalistDocuments option').eq(i).val() == 'MASTER WAYBILL DESTINATION' || $('.datalistDocuments option').eq(i).val() == 'MASTER BILL OF LADING' || $('.datalistDocuments option').eq(i).val() == 'SALES INVOICE' || $('.datalistDocuments option').eq(i).val() == 'DELIVERY RECEIPT'){
                            $('.datalistDocuments option').eq(i).remove();
                        }
                    }
                }else{
                    $('.datalistDocuments').remove();
                }
            }
        }

    });
</script>


