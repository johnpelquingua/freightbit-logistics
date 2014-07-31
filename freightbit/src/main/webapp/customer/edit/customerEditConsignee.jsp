<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->

    <div class="main-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/add-user.png" class="box-icon">
                <span class="booking panel-title">Add Customer - Consignee Information</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form cssClass="form-horizontal" action="editConsignee" theme="bootstrap">
                        <s:hidden name="consignee.addressId" value="%{addressIdParam}" />
                        <s:hidden name="consignee.contactId" value="%{contactCodeParam}" />
                        <div class="form-group">
                            <label for="consignee.firstName" class="col-sm-2 control-label" style="width:25%;">First
                                Name:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.firstName" cssClass="form-control" id="consignee.firstName"
                                             placeholder="First Name" maxLength="30" autofocus="true" required="true"
                                             pattern="[a-zA-Z]+"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.middleName" class="col-sm-2 control-label" style="width:25%;">Middle
                                Name:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.middleName" cssClass="form-control"
                                             id="consignee.middleName"
                                             placeholder="Middle Name" maxLength="30" pattern="[a-zA-Z]+"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.lastName" class="col-sm-2 control-label" style="width:25%;">Last Name:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.lastName" cssClass="form-control" id="consignee.lastName"
                                             placeholder="Last Name" maxLength="30" required="true"
                                             pattern="[a-zA-Z]+"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.phone" class="col-sm-2 control-label" style="width:25%;">Phone:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.phone" cssClass="form-control" id="consignee.phone"
                                             placeholder="Phone Number" maxLength="7" required="true" pattern="[0-9]+"
                                             title="Phone should not contain special characters and/or letters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.mobile" class="col-sm-2 control-label" style="width:25%;">Mobile:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.mobile" cssClass="form-control" id="consignee.mobile"
                                             placeholder="Mobile Number" maxLength="11" required="true"
                                             pattern="[0-9]+"
                                             title="Mobile should not contain special characters and/or letters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.email" class="col-sm-2 control-label" style="width:25%;">Email:
                                :</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.email" cssClass="form-control" id="consignee.email"
                                             placeholder="Email Address" type="email" required="true"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.fax" class="col-sm-2 control-label" style="width:25%;">Fax:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.fax" cssClass="form-control" id="consignee.fax"
                                             placeholder="Fax Number" maxLength="11" pattern="[0-9]+"
                                             title="Fax should not contain special characters and/or letters."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.addressLine1" class="col-sm-2 control-label" style="width:25%;">Address
                                1</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.addressLine1" cssClass="form-control"
                                             id="consignee.addressLine1" placeholder="Address 1" required="true"
                                             maxLength="50"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="consignee.addressLine2" class="col-sm-2 control-label" style="width:25%;">Address
                                2</label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.addressLine2" cssClass="form-control"
                                             id="consignee.addressLine2" placeholder="Address 2" maxLength="50"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.city" class="col-sm-2 control-label" style="width:25%;">City:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.city" cssClass="form-control"
                                             id="consignee.city" placeholder="City" required="true"
                                             pattern="[a-zA-Z]+" maxLength="50"
                                             title="City should not contain special characters and/or numbers."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.state" class="col-sm-2 control-label" style="width:25%;">State:
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.state" cssClass="form-control"
                                             id="consignee.state" placeholder="State" maxLength="50" pattern="[a-zA-Z]+"
                                             title="State should not contain special characters and/or numbers."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="consignee.zip" class="col-sm-2 control-label" style="width:25%;">ZIP
                            </label>

                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="consignee.zip" cssClass="form-control"
                                             id="consignee.zip" placeholder="ZIP" required="true"
                                             pattern="[0-9]+" maxLength="4"
                                             title="ZIP should not contain special characters and/or letters."/>
                            </div>
                        </div>
				  <span class="pull-right" style="margin-right:32px;">
					<s:submit cssClass="btn btn-default" name="submit" value="Save"/>
				  </span>
                    </s:form>

                </div>
            </div>
        </div>
    </div>


    <!-- END OF MAIN BOX -->

    <!-- SIDEBAR -->

    <div class="sidebar-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="../includes/images/calendar.png" class="box-icon">
                <span class="booking panel-title">Process</span>

            </div>
            <div class="panel-body">
                <ul class="nav">
                    <li><a href="customer-add.jsp" class="side-help"><img src="../includes/images/1.png"
                                                                          class="img-sidehelp">Personal Information</a>
                    </li>
                    <li><a href="customer-add2.jsp" class="side-help"><img src="../includes/images/2.png"
                                                                           class="img-sidehelp">Contact Person</a></li>
                    <li><a href="customer-add3.jsp" class="side-help"><img src="../includes/images/3.png"
                                                                           class="img-sidehelp">Address</a></li>
                    <li><a href="customer-add4.jsp" class="side-help"><img src="../includes/images/4.png"
                                                                           class="img-sidehelp">Items</a></li>
                    <li><a href="customer-add5.jsp" class="side-help"><img src="../includes/images/5.png"
                                                                           class="img-sidehelp">Documents</a></li>
                    <li><a href="customer-add7.jsp" class="side-help"><img src="../includes/images/6.png"
                                                                           class="img-sidehelp">Rates</a></li>
                    <li><a href="customerAddConsignee.jsp" class="side-help"><img src="../includes/images/7.png"
                                                                                  class="img-sidehelp">Consignee
                        Infomation</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>--%>

<!-- END SIDEBAR -->

<!-- END OF THE MIDDLE -->


<div class="row">
    <div class="col-lg-12">
        <h1>Customer Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> <i class="fa fa-list"></i> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> <i class="fa fa-info-circle"></i> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewConsignees' />"><i class="fa fa-list"></i> Consignee List</a>
            </li>
            <li class="active"><i class="fa fa-pencil"></i> Edit Consignee</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Consignee</h3>
            </div>

            <div class="panel-body">

                <s:form cssClass="form-horizontal" action="editConsignee" theme="bootstrap">
                    <s:hidden name="consignee.addressId" value="%{addressIdParam}"/>
                    <s:hidden name="consignee.contactId" value="%{contactCodeParam}"/>
                    <s:hidden name="consignee.createdTimeStamp1" value="%{consignee.createdTimeStamp1}" />
                    <s:hidden name="consignee.createdBy1" value="%{consignee.createdBy1}" />
                    <s:hidden name="consignee.createdTimeStamp2" value="%{consignee.createdTimeStamp2}" />
                    <s:hidden name="consignee.createdBy2" value="%{consignee.createdBy2}" />
                    <s:hidden name="consignee.referenceId1" value="%{consignee.referenceId1}" />
                    <s:hidden name="consignee.referenceId2" value="%{consignee.referenceId2}" />
                    <%--<s:property value="%{consignee.createdTimeStamp1}" />
                    <s:property value="%{consignee.createdBy1}" />
                    <s:property value="%{consignee.createdTimeStamp2}" />
                    <s:property value="%{consignee.createdBy2}" />
                    <s:property value="%{consignee.referenceId1}" />
                    <s:property value="%{consignee.referenceId2}" />--%>

                    <div class="form-group">
                        <label for="consignee.firstName" class="col-sm-2 control-label" style="width:25%;">First
                            Name:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.firstName" cssClass="form-control" id="consignee.firstName"
                                         placeholder="First Name" maxLength="30" autofocus="true" required="true"
                                         pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.middleName" class="col-sm-2 control-label" style="width:25%;">Middle
                            Name:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.middleName" cssClass="form-control"
                                         id="consignee.middleName"
                                         placeholder="Middle Name" maxLength="30" pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.lastName" class="col-sm-2 control-label" style="width:25%;">Last Name:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.lastName" cssClass="form-control" id="consignee.lastName"
                                         placeholder="Last Name" maxLength="30" required="true"
                                         pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.phone" class="col-sm-2 control-label" style="width:25%;">Phone:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.phone" cssClass="form-control" id="consignee.phone"
                                         placeholder="Phone Number" maxLength="7" required="true" pattern="\d{7}"
                                         title="Phone should not contain special characters and/or letters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.mobile" class="col-sm-2 control-label" style="width:25%;">Mobile:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.mobile" cssClass="form-control" id="consignee.mobile"
                                         placeholder="Mobile Number" maxLength="11" required="true"
                                         pattern="\d{11}"
                                         title="Mobile should not contain special characters and/or letters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.email" class="col-sm-2 control-label" style="width:25%;">Email:
                            :</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.email" cssClass="form-control" id="consignee.email"
                                         placeholder="Email Address" type="email" required="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.fax" class="col-sm-2 control-label" style="width:25%;">Fax:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.fax" cssClass="form-control" id="consignee.fax"
                                         placeholder="Fax Number" maxLength="11" pattern="[0-9]+"
                                         title="Fax should not contain special characters and/or letters."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.addressLine1" class="col-sm-2 control-label" style="width:25%;">Address
                            1:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.addressLine1" cssClass="form-control"
                                         id="consignee.addressLine1" placeholder="Address 1" required="true"
                                         maxLength="50"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="consignee.addressLine2" class="col-sm-2 control-label" style="width:25%;">Address
                            2:</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.addressLine2" cssClass="form-control"
                                         id="consignee.addressLine2" placeholder="Address 2" maxLength="50"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.city" class="col-sm-2 control-label" style="width:25%;">City:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.city" cssClass="form-control"
                                         id="consignee.city" placeholder="City" required="true"
                                         pattern="[a-zA-Z]+" maxLength="50"
                                         title="City should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.state" class="col-sm-2 control-label" style="width:25%;">State:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.state" cssClass="form-control"
                                         id="consignee.state" placeholder="State" maxLength="50" pattern="[a-zA-Z]+"
                                         title="State should not contain special characters and/or numbers."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="consignee.zip" class="col-sm-2 control-label" style="width:25%;">ZIP:
                        </label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="consignee.zip" cssClass="form-control"
                                         id="consignee.zip" placeholder="ZIP" required="true"
                                         pattern="[0-9]+" maxLength="4"
                                         title="ZIP should not contain special characters and/or letters."/>
                        </div>
                    </div>
				  <span class="pull-right" style="margin-right:32px;">
					<s:submit cssClass="btn btn-info" name="submit" value="Save"/>
				  </span>
                </s:form>

            </div>
        </div>
    </div>

    <div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                <li class="active"><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>

            </ul>
        </div>
    </div>
</div>
<!-- /.row -->
