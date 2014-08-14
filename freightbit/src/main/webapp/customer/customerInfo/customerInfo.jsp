<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer Information </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List </a>
            </li>
            <li class="active"> Customer Profile</li>
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
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0% !important;">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Customer Profile</h3>
            </div>

            <div class="panel-body">

                <div class="row">
                    <div class="col-md-3 col-lg-3 " align="center">
                        <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                    </div>
                    <div class=" col-md-9 col-lg-9 ">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td style="font-weight: bold;">Name</td>
                                <td><s:property value="customer.customerName"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Customer Code</td>
                                <td style="text-transform:uppercase"><s:property value="customer.customerCode" /></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Customer Type</td>
                                <td><s:property value="customer.customerType"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Email</td>
                                <td><s:property value="customer.email"/></td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Contact Numbers</td>
                                <td>
                                    <s:property value="customer.phone"/> (Landline)<br><br><s:property
                                        value="customer.mobile"/> (Mobile)<br><br><s:property value="customer.fax"/>
                                    (Fax)
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Documents</td>
                                <td>
                                    <s:hidden value="customer.dti" />
                                    <s:hidden value="customer.mayorsPermit" />
                                    <s:hidden value="customer.aaf" />
                                    <s:hidden value="customer.signatureCard" />
                                    <s:if test="%{customer.dti == 1}">
                                        <%--<s:checkbox name="customer_dti" fieldValue="true" label="DTI 1.5" checked="checked" disabled="true"/>--%>
                                        <i class="fa fa-check"></i> DTI
                                    </s:if>
                                    <s:else >
                                        <%--<s:checkbox name="customer_dti" fieldValue="true" label="DTI 2"  disabled="true"/>--%>
                                        <i class="fa fa-times"></i> DTI
                                    </s:else>
                                    <br />
                                    <br />
                                    <s:if test="%{customer.mayorsPermit == 1}">
                                        <%--<s:checkbox  name="customer_mayorsPermit" fieldValue="true" label="Permit 1" checked="checked" disabled="true"/>--%>
                                        <i class="fa fa-check"></i> Mayor's Permit
                                    </s:if>
                                    <s:else >
                                        <%--<s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Permit 2"  disabled="true"/>--%>
                                        <i class="fa fa-times"></i> Mayor's Permit
                                    </s:else>
                                    <br />
                                    <br />
                                    <s:if test="%{customer.aaf == 1}">
                                        <%--<s:checkbox  name="customer_aaf" fieldValue="true" label="AAF 1" checked="checked" disabled="true"/>--%>
                                        <i class="fa fa-check"></i> Account Application Form
                                    </s:if>
                                    <s:else >
                                        <%--<s:checkbox name="customer_aaf" fieldValue="true" label="AAF 2"  disabled="true"/>--%>
                                        <i class="fa fa-times"></i> Account Application Form
                                    </s:else>
                                    <br />
                                    <br />
                                    <s:if test="%{customer.signatureCard == 1}">
                                        <%--<s:checkbox  name="customer_signatureCard" fieldValue="true" label="Card 1" checked="checked" disabled="true"/>--%>
                                        <i class="fa fa-check"></i> Signature Card
                                    </s:if>
                                    <s:else >
                                        <%--<s:checkbox name="customer_signatureCard" fieldValue="true" label="Card 2"  disabled="true"/>--%>
                                        <i class="fa fa-times"></i> Signature Card
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

            <ul class="nav nav-pills nav-stacked">
           	   <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li class="active"><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>

</div>