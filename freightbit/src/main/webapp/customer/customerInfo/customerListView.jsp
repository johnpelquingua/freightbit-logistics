<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .deleteCustomerIcon {
        cursor: pointer;
    }
</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"> Customer List</li>
        </ol>
    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success" id="alert">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-list"></i> Customer List
                </h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" data-toggle="modal" data-target="#inputModal" onclick="showSearchFields();">
                        <i class="fa fa-search"></i> Search Customer
                    </button>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                    <button type="button" class="btn btn-primary new-booking"
                            onclick="location.href='loadAddCustomerPage'">
                        <i class="fa fa-male"></i> New Customer
                    </button>
                    </sec:authorize>
                </span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <tbody>
                    <table>
                        <tr>
                            <display:table id="customer" name="customers" requestURI="customerList.action"
                                           pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="customerName" title="Customer Name <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerType" title="Customer Type <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="email" title="Email Address <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="website" title="Website <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="phone" title="Contact Number <i class='fa fa-sort' />" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editCustomerUrl" action="loadEditCustomerPage">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <sec:authorize
                                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <s:a href="%{editCustomerUrl}" class="icon-action-link" rel="tooltip"
                                                 title="Edit this Customer">
                                                <i class="fa fa-pencil"></i>
                                            </s:a>
                                        </sec:authorize>

                                        <s:url var="deleteCustomerUrl" action="deleteCustomer">
                                            <%--<s:property value="#attr.customer.customerId"></s:property>--%>
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                            <s:param name="customerIdParam"
                                                     value="#attr.customer.customerId"></s:param>

                                        </s:url>
                                        <sec:authorize
                                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <s:a class="icon-action-link" href="%{deleteCustomerUrl}" rel="tooltip"
                                                 title="Delete this Customer"
                                                 onclick="return confirm('Do you really want to delete?');">
                                            </s:a>
                                            <i class="fa fa-trash-o deleteCustomerIcon"></i>
                                        </sec:authorize>

                                        <s:url var="customerInfoUrl" action="customerInfo">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <sec:authorize
                                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                                            <s:a class="icon-action-link" href="%{customerInfoUrl}" rel="tooltip">
                                                <i class="fa fa-info-circle"></i>
                                            </s:a>
                                        </sec:authorize>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>
                    </tbody>

                </div>
            </div>
            <div class="panel-footer">

                <div class="table-responsive" >
                    <div class="col-lg-12" style="position:relative;margin-top: -28px;">
                        <table class="col-lg-6">
                            <tr>
                                <td><label>Legend:</label></td>
                                <td><i class="fa fa-pencil"></i> Edit</td>
                                <td><i class="fa fa-trash-o"></i> Delete</td>
                                <td><i class="fa fa-info-circle"></i> Information</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%--<div class="modal-header">
                <center><h4 class="modal-title" id="alertlabel"><li class="fa fa-info"/> Warning</h4></center>
            </div>--%>
            <div class="modal-body" style="padding: 0px;">
                <div id="inputDiv"> <%--Area where input fields will appear--%> </div>
            </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
            </div>--%>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteCustomerModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span style="font-size: 1.4em;"><i class="fa fa-warning" style="color: red;"></i> Delete Customer</span>
            </div>
            <div class="modal-body">
                This customer might have items, contacts, consignee and such associated to it. Please confirm cancellation. Are you sure you want to delete the customer?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="" class="btn btn-danger confirmDeleteModalBtn">Yes</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("customer");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {
                if ($("#alert").length) {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[1].cells[j].style.backgroundColor = "#dff0d8";
                    }
                }
            }
        }

        actionConfirmation($('.deleteCustomerIcon'), $('.confirmDeleteModalBtn'), $('#deleteCustomerModal'));
    });

    function showSearchFields() {
        $.ajax({
            url: 'loadSearchCustomerPage',
            type: 'POST',
            dataType: 'html',
            success: function (html) {
                $('#inputDiv').html(html);
                /*window.location.href = '#sixth';*/
            },
            error: function(xhr, ajaxOptions, thrownError){
                alert('An error occurred! ' + thrownError);
            }
        });

    }

</script>