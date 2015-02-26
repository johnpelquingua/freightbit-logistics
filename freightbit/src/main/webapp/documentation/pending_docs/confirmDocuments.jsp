<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="panel-body">

    <div class="well">

        <display:table id="document" name="confirmDocuments" requestURI="viewOrderDocuments.action" pagesize="50" class="table table-hover table-bordered text-center tablesorter"
                       style="margin-top: 15px;">

            <td>
                <display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                </display:column>
            </td>
            <td>
                <display:column property="referenceNumber" title="Series Number" class="tb-font-black" style="text-align: center;">
                </display:column>
            </td>
            <td>
                <display:column property="vendorCode" title="Vendor" class="tb-font-black" style="text-align: center;">
                </display:column>
            </td>
            <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                </display:column>
            </td>
            <td><display:column property="documentComments" title="Comments" class="tb-font-black" style="text-align: center;">
                </display:column>
            </td>

        </display:table>

    </div>

    <div class="pull-right">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>

        <s:url var="processDocumentsUrl" action="processDocumentsDecision">

            <s:param name="checkString"
                     value="checkString">
            </s:param>
            <s:param name="documentItem"
                     value="documentItem">
            </s:param>
            <s:param name="orderIdParam"
                     value="orderIdParam">
            </s:param>
            <s:param name="documentStageParam"
                     value="documentStageParam">
            </s:param>

        </s:url>
        <s:a class="icon-action-link" href="%{processDocumentsUrl}" rel="tooltip" title="Check Documents">
            <button type="button" class="btn btn-primary">Save</button>
        </s:a>

    </div>

</div>

<s:hidden value="%{checkString}" />
<s:hidden value="%{documentItem}" />
<s:hidden value="%{orderIdParam}" />
<s:hidden value="%{documentStageParam}" />

<script>
    $(document).ready(function(){

    });
</script>


