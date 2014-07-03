<%@ taglib prefix="s" uri="/struts-tags" %>

<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->

    <div class="row alert alert-success alert-dismissable" style="margin-left: -40px !important;  width: 101%;">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Success!</strong> The data has been successfully saved.
    </div>

    <div class="row">
        <div class="col-md-12">

            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="includes/images/listofusers.png" class="box-icon">
                    <span class="booking panel-title">List of Customers</span>

                </div>
                <div class="panel-body">

                    <div class="table-responsive list-table">
                        <table class="table table-striped table-bordered text-center" id="customer-list">
                            <thead>
                            <tr class="header_center">

                                <th class="tb-font-black">Customer ID</th>
                                <th class="tb-font-black">Customer Name</th>
                                <th class="tb-font-black">Customer Type</th>
                                <th class="tb-font-black">Email Address</th>
                                <th class="tb-font-black">Website</th>
                                <th class="tb-font-black">Contact Number</th>
                                <th class="tb-font-black">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <s:iterator value="customers" var="customer">
                                <tr>

                                    <td class="tb-font-black"><s:property value="customerId"/></td>
                                    <td class="tb-font-black"><s:property value="customerName"/></td>
                                    <td class="tb-font-black"><s:property value="customerType"/></td>
                                    <td class="tb-font-black"><s:property value="email"/></td>
                                    <td class="tb-font-black"><s:property value="website"/></td>
                                    <td class="tb-font-black"><s:property value="phone"/></td>
                                    <td>

                                        <s:url var="editCustomerUrl" action="loadEditCustomerPage">
                                            <s:param name="customerCodeParam" value="customerCode"></s:param>
                                        </s:url>
                                        <s:a href="%{editCustomerUrl}" class="icon-action-link" rel="tooltip"
                                             title="Edit this Customer"><img src="includes/images/edit-user.png"
                                                                             class="icon-action circ-icon"> </s:a>

                                        <s:url var="deleteCustomerUrl" action="deleteCustomer">
                                            <s:param name="customerCodeParam" value="customerCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteCustomerUrl}" rel="tooltip"
                                             title="Delete this Customer"
                                             onclick="return confirm('Do you really want to delete?');"><img
                                                src="includes/images/remove-user.png"
                                                class="icon-action circ-icon"> </s:a>

                                        <s:url var="customerInfoUrl" action="customerInfo">
                                            <s:param name="customerCodeParam" value="customerCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{customerInfoUrl}" rel="tooltip"><img
                                                src="includes/images/info-b.png" class="icon-action circ-icon"> </s:a>


                                    </td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="panel-footer">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>

							<span class="pull-right">
							<a href="customerAdd" class="icon-action-link"><img src="includes/images/add-user.png"
                                                                                class="icon-action circ-icon"> </a>
							</span>

                </div>
            </div>

        </div>
    </div>
</div>


--%>























<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer Information </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"><i class="fa fa-list"></i> Customer List </a></li>
            <li class="active"><i class="fa fa-info-circle"></i> Customer Profile</li>
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
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Customer Profile</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-3 col-lg-3 " align="center">
                        <img alt="User Pic" src="includes/images/photo.png" class="img-circle">
                    </div>
                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td style="font-weight: bold;">Name:</td>
                                <td><s:property value="customer.customerName" /></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Customer Code:</td>
                                <td><s:property value="customer.customerCode" /></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Customer Type:</td>
                                <td><s:property value="customer.customerType" /></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Email:</td>
                                <td><s:property value="customer.email" /></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Contact Numbers:</td>
                                <td>
                                    <s:property value="customer.phone" /> (Landline)<br><br><s:property value="customer.mobile" /> (Mobile)<br><br><s:property value="customer.fax" /> (Fax)
                                </td>
                            </tr>
                            <tr>
                                <td>Documents</td>
                                <td>
                                    <s:if test="%{customer.dti == 1}">
                                        <s:checkbox name="customer_dti" fieldValue="true" label="DTI 1.5" checked="checked" disabled="true"/>
                                    </s:if>
                                    <s:else >
                                        <s:checkbox name="customer_dti" fieldValue="true" label="DTI 2"  disabled="true"/>
                                    </s:else>
                                    <br />
                                    <br />
                                    <s:if test="%{customer.mayorsPermit == 1}">
                                        <s:checkbox  name="customer_mayorsPermit" fieldValue="true" label="Permit 1" checked="checked" disabled="true"/>
                                    </s:if>
                                    <s:else >
                                        <s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Permit 2"  disabled="true"/>
                                    </s:else>
                                    <br />
                                    <br />
                                    <s:if test="%{customer.aaf == 1}">
                                        <s:checkbox  name="customer_aaf" fieldValue="true" label="AAF 1" checked="checked" disabled="true"/>
                                    </s:if>
                                    <s:else >
                                        <s:checkbox name="customer_aaf" fieldValue="true" label="AAF 2"  disabled="true"/>
                                    </s:else>
                                    <br />
                                    <br />
                                    <s:if test="%{customer.signatureCard == 1}">
                                        <s:checkbox  name="customer_signatureCard" fieldValue="true" label="Card 1" checked="checked" disabled="true"/>
                                    </s:if>
                                    <s:else >
                                        <s:checkbox name="customer_signatureCard" fieldValue="true" label="Card 2"  disabled="true"/>
                                    </s:else>
                                </td>
                            </tr>
                            </tbody>
                            <s:set name="customerId" value="%{customer.customerId}" scope="session"/>

                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="col-lg-3 col-lg-offset-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>

            </ul>
        </div>
    </div>

</div><!-- /.row -->
