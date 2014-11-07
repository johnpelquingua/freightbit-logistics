<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 11/5/2014
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-file-text"></i> Available Documents </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> Dashboard </a></li>
            <li class="active"> Available Documents</li>

        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Available Documents List</h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="document" name="documents"
                                   requestURI="viewDocumentList.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                   style="margin-top: 15px;">
                        <%--Booking Date--%>

                        <td><display:column property="documentName" title="Document <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--Order Number--%>
                        <td><display:column property="referenceNumber" title="Ref. # <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="vendorCode" title="Vendor <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="documentStatus" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <%--ORIGIN--%>
                        <td><display:column property="createdDate" title="Date <i class='fa fa-sort' />" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td>
                                <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                    <s:if test="#attr.document.documentName=='PROFORMA BILL OF LADING'">
                                        <i class="fa fa-ban"></i>
                                        <s:url var="deleteDocumentUrl" action="deleteDocument">
                                            <s:param name="orderIdParam" value="%{orderIdParam}"></s:param>
                                            <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteDocumentUrl}" rel="tooltip" title="Delete Document" onclick="return confirm('Delete this document?');">
                                            <i class="fa fa-trash-o"></i>
                                        </s:a>
                                    </s:if>
                                    <s:elseif test="#attr.document.documentName=='BOOKING REQUEST FORM'">
                                        <i class="fa fa-ban"></i>
                                    </s:elseif>
                                    <s:else>
                                    <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                        <i class="fa fa-print"></i>
                                        <s:url var="deleteDocumentUrl" action="deleteDocument">
                                            <s:param name="orderIdParam" value="%{orderIdParam}"></s:param>
                                            <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteDocumentUrl}" rel="tooltip" title="Delete Document" onclick="return confirm('Delete this document?');">
                                            <i class="fa fa-trash-o"></i>
                                        </s:a>
                                    </a>
                                    </s:else>
                                </display:column></td>
                    </display:table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function generateReport(documentId,documentName) {
        if (documentName == "BOOKING REQUEST FORM" || documentName == "BOOKING REQUEST FORM WITH SIGNATURE") {
            var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
            win.onload = function () {
                this.document.title = "Booking Request Form";
            }
        }
        else if (documentName == "HOUSE BILL OF LADING") {
            var win = window.open('documentations/generateBillofLadingReport?documentIdParam=' + documentId, 'HouseBillofLading', 'width=910,height=800');
            win.onload = function () {
                this.document.title = " House Bill of Lading";
            }
        }
        else if (documentName == "HOUSE WAYBILL ORIGIN" || documentName == "HOUSE WAYBILL ORIGIN WITH SIGNATURE") {
            var win = window.open('documentations/generateHouseWayBillReport?documentIdParam=' + documentId, 'HouseWayBillOrigin', 'width=910,height=800');
            win.onload = function () {
                this.document.title = " House Way Bill Origin";
            }
        }
        else if (documentName == "HOUSE WAYBILL DESTINATION") {
            var win = window.open('documentations/generateHouseWayBillDestinationReport?documentIdParam=' + documentId, 'HouseWayBillDestination', 'width=910,height=800');
            win.onload = function () {
                this.document.title = " House Way Bill Destination";
            }
        }
        else if (documentName == "ACCEPTANCE RECEIPT") {
            var win = window.open('documentations/generateAcceptanceReceiptReport?documentIdParam=' + documentId, 'Acceptance Receipt', 'width=910,height=800');
            win.onload = function () {
                this.document.title = " Acceptance Receipt";
            }
        }
    }

</script>