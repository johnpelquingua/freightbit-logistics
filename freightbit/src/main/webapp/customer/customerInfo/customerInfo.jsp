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
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title" style="float:left;top: 10px;"><i class="fa fa-info-circle"></i> Customer Profile</h3>
                <span class="pull-right">
                    <s:url var="editCustomerUrl" action="loadEditCustomerPage">
                        <s:param name="customerCodeParam"
                                 value="#attr.customer.customerCode"></s:param>
                    </s:url>
                        <sec:authorize
                                access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                            <s:a href="%{editCustomerUrl}" cssClass="btn btn-success new-booking" rel="tooltip"
                                 title="Edit this Customer">
                                <%--<img src="../includes/images/edit-user.png"
                                     class="icon-action circ-icon"> --%>
                                <i class="fa fa-pencil"></i> Edit Customer
                            </s:a>
                        </sec:authorize>
                </span>
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-lg-6 col-lg-offset-2">

                        <div class="panel panel-info ">

                            <%--<div align="center" style="margin-top: 10px;">
                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                            </div>--%>

                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-3">
                                        <div align="center" style="margin-top: 10px;">
                                            <div align="center" style="margin-top: 10px;">
                                                <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-9">

                                        <table class="table table-user-information profile" style="margin-top: 10px;">
                                            <tbody>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; border-top: none; text-align: left !important;">Name</td>
                                                <td style="border-top: none;"><s:property value="customer.customerName"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Customer Code</td>
                                                <td style="text-transform:uppercase"><s:property value="customer.customerCode" /></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Customer Type</td>
                                                <td><s:property value="customer.customerType"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header"style="font-weight:Bold; font-size: 12px; text-align: left !important;">Email</td>
                                                <td><s:property value="customer.email"/></td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Contact Numbers</td>
                                                <td>
                                                    <i class="fa fa-phone"></i> <s:property value="customer.phone"/> <br><br>
                                                    <i class="fa fa-mobile-phone"></i> <s:property value="customer.mobile"/> <br><br>
                                                    <i class="fa fa-fax"></i> <s:property value="customer.fax"/>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="header" style="font-weight:Bold; font-size: 12px; text-align: left !important;">Documents</td>
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
                                            <%--<s:property value="%{customer.customerId}" />--%>
                                        </table>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="col-lg-2 col-lg-offset-2">
                        <div class="panel panel-info" >
                            <%--<div class="panel-heading">--%>
                                <%--<h3 class="panel-title"><i class="fa fa-navicon"></i> Shortcuts</h3>--%>
                            <%--</div>--%>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: center;">

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                        <a href="" class="btn btn-default active" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-info-circle fa-fw"></i> <br/>Profile</a>
                                        <a href="viewAddress" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-home fa-fw"></i> <br/>Address</a>
                                        <a href="viewCustomerContacts" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-group fa-fw"></i> <br/>Contacts</a>


                                        <a href="viewItem" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list-ol fa-fw"></i> <br/>Items</a>
                                        </sec:authorize>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                                        <a href="viewRates" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-money fa-fw"></i> <br/>Rates</a>
                                        </sec:authorize>

                                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                                        <a href="viewConsignees" class="btn btn-default" role="button" style="width:120px; margin-bottom: 10px;"><i class="fa fa-list fa-fw"></i> <br/>Consignee</a>
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