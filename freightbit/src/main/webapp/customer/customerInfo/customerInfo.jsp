<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module</h1>
            </span>
        </legend>
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
    <div class="col-lg-12 " >
        <div class="panel panel-primary ">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Customer Profile</h3>
                <span class="pull-right">
                    <button type="button" class="btn btn-success new-booking" onclick="location.href=''">
                        <i class="fa fa-pencil"></i> Edit Customer
                    </button>

                </span>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-lg-2" align="center">
                        <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">

                    </div>
                    <div class="col-lg-8">
                        <div class="panel panel-info ">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-info-circle"></i> Details</h3>
                            </div>

                            <table class="table table-user-information profile">
                                <tbody>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px; border-top: none;">Name</td>
                                    <td style="border-top: none;"><s:property value="customer.customerName"/></td>
                                </tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Customer Code</td>
                                    <td style="text-transform:uppercase"><s:property value="customer.customerCode" /></td>
                                </tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Customer Type</td>
                                    <td><s:property value="customer.customerType"/></td>
                                </tr>
                                <tr>
                                    <td class="header"style="font-weight:normal; font-size: 12px;">Email</td>
                                    <td><s:property value="customer.email"/></td>
                                </tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Contact Numbers</td>
                                    <td>
                                        <i class="fa fa-phone"></i> <s:property value="customer.phone"/> <br><br>
                                        <i class="fa fa-mobile-phone"></i> <s:property value="customer.mobile"/> <br><br>
                                        <i class="fa fa-fax"></i> <s:property value="customer.fax"/>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="header" style="font-weight:normal; font-size: 12px;">Documents</td>
                                    <td>
                                        <s:hidden value="customer.dti" />
                                        <s:hidden value="customer.mayorsPermit" />
                                        <s:hidden value="customer.aaf" />
                                        <s:hidden value="customer.signatureCard" />
                                        <s:if test="%{customer.dti == 1}">
                                            <%--<s:checkbox name="customer_dti" fieldValue="true" label="DTI 1.5" checked="checked" disabled="true"/>--%>
                                            <i class="fa fa-check-square-o"></i> DTI
                                        </s:if>
                                        <s:else >
                                            <%--<s:checkbox name="customer_dti" fieldValue="true" label="DTI 2"  disabled="true"/>--%>
                                            <i class="fa fa-square-o"></i> DTI
                                        </s:else>
                                        <br />
                                        <br />
                                        <s:if test="%{customer.mayorsPermit == 1}">
                                            <%--<s:checkbox  name="customer_mayorsPermit" fieldValue="true" label="Permit 1" checked="checked" disabled="true"/>--%>
                                            <i class="fa fa-check-square-o"></i> Mayor's Permit
                                        </s:if>
                                        <s:else >
                                            <%--<s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Permit 2"  disabled="true"/>--%>
                                            <i class="fa fa-square-o"></i> Mayor's Permit
                                        </s:else>
                                        <br />
                                        <br />
                                        <s:if test="%{customer.aaf == 1}">
                                            <%--<s:checkbox  name="customer_aaf" fieldValue="true" label="AAF 1" checked="checked" disabled="true"/>--%>
                                            <i class="fa fa-check-square-o"></i> Account Application Form
                                        </s:if>
                                        <s:else >
                                            <%--<s:checkbox name="customer_aaf" fieldValue="true" label="AAF 2"  disabled="true"/>--%>
                                            <i class="fa fa-square-o"></i> Account Application Form
                                        </s:else>
                                        <br />
                                        <br />
                                        <s:if test="%{customer.signatureCard == 1}">
                                            <%--<s:checkbox  name="customer_signatureCard" fieldValue="true" label="Card 1" checked="checked" disabled="true"/>--%>
                                            <i class="fa fa-check-square-o"></i> Signature Card
                                        </s:if>
                                        <s:else >
                                            <%--<s:checkbox name="customer_signatureCard" fieldValue="true" label="Card 2"  disabled="true"/>--%>
                                            <i class="fa fa-square-o"></i> Signature Card
                                        </s:else>
                                    </td>
                                </tr>
                                </tbody>
                                <s:set name="customerId" value="%{customer.customerId}" scope="session"/>
                        </table>
                        </div>
                    </div>




                    <%--<div class="col-lg-3">
                        <div class="panel ">

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
                    </div>--%>


                    <div class="row">
                        <div class="col-lg-2">
                            <div class="panel panel-info" >
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12" style="text-align: center;">
                                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="#" class="btn btn-primary" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                            <a href="viewAddress" class="btn btn-warning" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                            <a href="viewCustomerContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>


                                            <a href="viewItem" class="btn btn-success" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list-ol fa-fw"></i> <br/>Items</a>
                                            </sec:authorize>

                                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                                            <a href="viewRates" class="btn btn-info" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-money fa-fw"></i> <br/>Rates</a>
                                            </sec:authorize>

                                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                            <a href="viewConsignees" class="btn btn-danger" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list fa-fw"></i> <br/>Consignee</a>
                                            </sec:authorize>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>


    <%--<div class="col-lg-3">
        <div class="panel ">

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
    </div>--%>

</div>