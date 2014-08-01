<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->

    <div class="row">
        <div class="col-md-12">
            <div class="main-box">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><s:property value="customer.customerName" /></h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 " align="center">
                                <img alt="User Pic" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100" class="img-circle">
                            </div>
                            <div class=" col-md-9 col-lg-9 ">
                                <table class="table table-user-information">
                                    <tbody>
                                    <tr>
                                        <td>Name:</td>
                                        <td><s:property value="customer.customerName" /></td>
                                    </tr>
                                    <tr>
                                        <td>Customer Code:</td>
                                        <td><s:property value="customer.customerCode" /></td>
                                    </tr>
                                    <tr>
                                        <td>Customer Type:</td>
                                        <td><s:property value="customer.customerType" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><a href="mailto:info@support.com"><s:property value="customer.email" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>Contact Number</td>
                                        <td>
                                            <s:property value="customer.phone" />(Landline)<br><br><s:property value="customer.mobile" />(Mobile)<br><br><s:property value="customer.fax" />(Fax)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Documents</td>
                                        <td>
                                            Signature Card(Done)<br><br>DTI(Done)<br><br>Mayor's Permit(Done)
                                        </td>
                                    </tr>
                                    </tbody>
                                    &lt;%&ndash;<s:set name="customerId" value="%{customer.customerId}" scope="session"/>&ndash;%&gt;

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
								<span class="pull-right">
								<a href="loadEditCustomerPage" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
								<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
								</span>
                    </div>
                </div>
            </div>
            <!-- SIDEBAR -->

            <div class="sidebar-box">
                <div class="panel booking panel-info">
                    <div class="booking panel-heading">
                        <img src="images/calendar.png" class="box-icon">
                        <span class="booking panel-title">Process</span>
                    </div>

                    <div class="panel-body">

                        <ul class="nav">
                            <li><a href="customer-add.html" class="side-help"><img src="images/1.png" class="img-sidehelp">Personal Information</a></li>
                            <li><a href="viewCustomerContacts" class="side-help"><img src="images/2.png" class="img-sidehelp">Contact Person</a></li>
                            <li><a href="viewAddress" class="side-help"><img src="images/3.png" class="img-sidehelp">Address</a></li>
                            <li><a href="viewItem" class="side-help"><img src="images/4.png" class="img-sidehelp">Items</a></li>
                            <li><a href="viewRates" class="side-help"><img src="images/5.png" class="img-sidehelp">Rates</a></li>
                            <li><a href="viewConsignees" class="side-help"><img src="images/6.png" class="img-sidehelp">Consignee Infomation</a></li>
                        </ul>

                    </div>
                </div>
            </div>


            <!-- END SIDEBAR -->

        </div>
    </div>
</div>

--%>

<!-- END OF MAIN BOX -->


<!-- END OF THE MIDDLE -->


<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Customer Information </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"><i class="fa fa-list"></i> Customer List </a>
            </li>
            <li class="active"><i class="fa fa-info-circle"></i> Customer Profile</li>
        </ol>

    </div>
</div>
<!-- /.row -->

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
                                    <%--<s:checkbox name="customer_dti" fieldValue="true" label="DTI 1.5" checked="checked" disabled="true"/>--%>
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

</div>
<!-- /.row -->

