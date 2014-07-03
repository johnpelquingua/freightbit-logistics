<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Contact Person</h1>

    <div class="row alert alert-success alert-dismissable" style="margin-left: -40px !important;  width: 101%;">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Success!</strong> The data has been successfully saved.
    </div>

    <!-- EDIT HERE -->
    <div class="row">

        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/listofusers.png" class="box-icon"/>
                <span class="panel-title">List of Contacts</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center">
                        <thead>
                        <tr class="header_center">
                            <%--<th class="tb-font-black">Contact Type</th>--%>
                            <th class="tb-font-black"><input type="checkbox"/></th>
                            <th class="tb-font-black">Last Name</th>
                            <th class="tb-font-black">First Name</th>
                            <th class="tb-font-black">Middle Name</th>
                            <th class="tb-font-black">Phone</th>
                            <th class="tb-font-black">Mobile</th>
                            <th class="tb-font-black">Fax</th>
                            <th class="tb-font-black">E-Mail</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:hidden name="contact.contactId" value="%{contact.contactId}"/>
                        <s:hidden name="contact.sessionVendorId" value="%{contact.sessionVendorId}"/>
                        <s:iterator value="contacts" var="contact">
                            <tr>

                                    <%--<td class="tb-font-black"><s:property value="contactType" /></td>--%>
                                <td class="tb-font-black"><s:checkbox name="a" theme="simple"/></td>
                                <td class="tb-font-black"><s:property value="lastName"/></td>
                                <td class="tb-font-black"><s:property value="firstName"/></td>
                                <td class="tb-font-black"><s:property value="middleName"/></td>
                                <td class="tb-font-black"><s:property value="phone"/></td>
                                <td class="tb-font-black"><s:property value="mobile"/></td>
                                <td class="tb-font-black"><s:property value="fax"/></td>
                                <td class="tb-font-black"><s:property value="email"/></td>
                                <td class="tb-font-black">

                                    <s:url var="editContactsUrl" action="loadEditShippingContact">
                                        <s:param name="contactCodeParam" value="contactId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editContactsUrl}" rel="tooltip"
                                         title="Edit this contact person">
                                        <img src="includes/images/edit-user.png" class="icon-action circ-icon">
                                    </s:a>

                                    <s:url var="deleteContactsUrl" action="deleteShippingContact">
                                        <s:param name="contactCodeParam" value="contactId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteContactsUrl}" rel="tooltip"
                                         title="Delete this Contact Person"
                                         onclick="return confirm('Do you really want to delete?');">
                                        <img src="includes/images/remove-user.png" class="icon-action circ-icon">
                                    </s:a>


                                </td>
                            </tr>

                        </s:iterator>

                        </tbody>
                    </table>
                </div>
            </div>


            <div class="panel-footer">

                <ul class="pagination">
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li class="disabled"><a href="#">&raquo;</a></li>
                </ul>

            <span class="pull-right">
                <s:url var="loadAddContactUrl" action="loadAddShippingContact">
                    <s:param name="vendorIdParam" value="vendorIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddContactUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>


        </div>

    </div>

</div>

<!-- END OF THE MIDDLE -->
