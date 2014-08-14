<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Vendor Trucking Contacts </h1>
        <ol class="breadcrumb">

            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
                Profile</a></li>
            <li class="active"> Contact Persons</li>
        </ol>

    </div>
</div>
<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-9" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-group"></i> Contact Persons</h3>

            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="contact" name="contacts" requestURI="viewVendorTruckingContacts.action"
                                           pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="lastName" title="Last Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="firstName" title="First Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="middleName" title="Middle Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="phone" title="Phone" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="mobile" title="Mobile" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="fax" title="Fax" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="email" title="E-mail" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editContactsUrl" action="loadEditTruckingContact">
                                            <s:param name="contactCodeParam" value="#attr.contact.contactId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editContactsUrl}" rel="tooltip"
                                             title="Edit this contact person">
                                            <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
                                        </s:a>

                                        <s:url var="deleteContactsUrl" action="deleteTruckingContact">
                                            <s:param name="contactCodeParam" value="#attr.contact.contactId"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteContactsUrl}" rel="tooltip"
                                             title="Delete this Contact Person"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="../includes/images/remove-user.png" class="icon-action circ-icon">
                                        </s:a>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>
                </div>


            </div>
            <div class="panel-footer">
            <span class="pull-right">
                <s:url var="loadAddContactUrl" action="loadAddTruckingContact">
                    <s:param name="vendorIdParam" value="vendorIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddContactUrl}" rel="tooltip" title="Add Contact">
                    <img src="../includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>
            </div>
        </div>
    </div>

    <div class="col-lg-3">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="viewInfoVendor"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewTruckingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li class="active"><a href="viewVendorTruckingContacts"><i class="fa fa-group fa-fw"></i> Contact
                    Persons</a></li>
                <li><a href="viewDrivers"><i class="fa fa-group fa-fw"></i> Drivers</a></li>
                <li><a href="viewTrucks"><i class="fa fa-truck fa-fw"></i> Trucks</a></li>
            </ul>
        </div>
    </div>

</div>