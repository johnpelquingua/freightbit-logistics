<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Contact Person</h1>
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
                            &lt;%&ndash;<th class="tb-font-black">Contact Type</th>&ndash;%&gt;
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

                        <s:property value="lastName"/></td>
                        <s:iterator value="contacts" var="contact">
                            <tr>
                                <td class="tb-font-black"><s:checkbox name="a" theme="simple"/></td>
                                <td class="tb-font-black"><s:property value="lastName"/></td>
                                <td class="tb-font-black"><s:property value="firstName"/></td>
                                <td class="tb-font-black"><s:property value="middleName"/></td>
                                <td class="tb-font-black"><s:property value="phone"/></td>
                                <td class="tb-font-black"><s:property value="mobile"/></td>
                                <td class="tb-font-black"><s:property value="fax"/></td>
                                <td class="tb-font-black"><s:property value="email"/></td>
                                <td class="tb-font-black">

                                    <s:url var="editContactsUrl" action="loadEditCustomerContact">
                                        <s:param name="contactCodeParam" value="contactId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editContactsUrl}" rel="tooltip"
                                         title="Edit this contact person">
                                        <img src="includes/images/edit-user.png" class="icon-action circ-icon">
                                    </s:a>

                                    <s:url var="deleteContactsUrl" action="deleteCustomerContact">
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

                <s:url var="loadAddContactUrl" action="loadAddCustomerContact">
                    <s:param name="CustomerCodeParam" value="CustomerCodeParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddContactUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>

            </span>
            </div>
        </div>
    </div>
</div>--%>

<!-- END OF THE MIDDLE -->


<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer List Contacts </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a></li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer Profile</a></li>
            <li class="active"><i class="fa fa-group"></i> Contact Persons</li>
        </ol>

    </div>
</div><!-- /.row -->

<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>


<div class="row">
    <div class="col-lg-10">
        <div class="panel panel-primary">

            <div class="panel-heading"  >
                <h3 class="panel-title" style="position: relative; top: 2px;"><i class="fa fa-group"></i> Contact Persons</h3>

            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <%--<table class="table table-striped table-bordered text-center">
                        <thead>
                        <tr class="header_center">
                            &lt;%&ndash;<th class="tb-font-black">Contact Type</th>&ndash;%&gt;

                            <th class="tb-font-black" style="text-align: center;">Last Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">First Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Middle Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Phone <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Mobile <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Fax <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">E-Mail <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <s:property value="lastName"/></td>
                        <s:iterator value="contacts" var="contact">
                            <tr>

                                <td class="tb-font-black"><s:property value="lastName"/></td>
                                <td class="tb-font-black"><s:property value="firstName"/></td>
                                <td class="tb-font-black"><s:property value="middleName"/></td>
                                <td class="tb-font-black"><s:property value="phone"/></td>
                                <td class="tb-font-black"><s:property value="mobile"/></td>
                                <td class="tb-font-black"><s:property value="fax"/></td>
                                <td class="tb-font-black"><s:property value="email"/></td>
                                <td class="tb-font-black">

                                    <s:url var="editContactsUrl" action="loadEditCustomerContact">
                                        <s:param name="contactCodeParam" value="contactId"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{editContactsUrl}" rel="tooltip"
                                         title="Edit this contact person">
                                        <img src="includes/images/edit-user.png" class="icon-action circ-icon">
                                    </s:a>

                                    <s:url var="deleteContactsUrl" action="deleteCustomerContact">
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
                    </table>--%>

                        <tbody>
                            <table>
                                <tr>
                                    <display:table id="contact" name="contacts" requestURI="/viewCustomerContacts.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter" style="margin-top: 15px;">
                                        <td><display:column property="lastName" title="Last Name" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="firstName" title="First Name" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="middleName" title="Middle Name" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="phone" title="Phone" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="mobile" title="Mobile" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="fax" title="Fax" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td><display:column property="email" title="E-Mail" class="tb-font-black" style="text-align: center;" >  </display:column></td>
                                        <td class="tb-font-black" style="text-align: center;">
                                            <display:column title="Actions">
                                                <s:url var="editContactsUrl" action="loadEditCustomerContact">
                                                    <s:param name="contactCodeParam" value="#attr.contact.contactId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{editContactsUrl}" rel="tooltip"
                                                     title="Edit this contact person">
                                                    <img src="includes/images/edit-user.png" class="icon-action circ-icon">
                                                </s:a>

                                                <s:url var="deleteContactsUrl" action="deleteCustomerContact">
                                                    <s:param name="contactCodeParam" value="#attr.contact.contactId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteContactsUrl}" rel="tooltip"
                                                     title="Delete this Contact Person"
                                                     onclick="return confirm('Do you really want to delete?');">
                                                    <img src="includes/images/remove-user.png" class="icon-action circ-icon">
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

                <s:url var="loadAddContactUrl" action="loadAddCustomerContact">
                    <s:param name="CustomerCodeParam" value="CustomerCodeParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddContactUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>

            </span>
            </div>
        </div>
    </div>

    <div class="col-lg-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li><a href="customerInfo"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li class="active"><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>

            </ul>
        </div>
    </div>

</div><!-- /.row -->
