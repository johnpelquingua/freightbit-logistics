<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Contact Profile</h1>

    <!-- MAIN BOX -->

    <div class="main-box">
        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="includes/images/add-user.png" class="box-icon">
                <span class="booking panel-title">Add Contact Person</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form action="addCustomerContact" cssClass="form-horizontal" theme="bootstrap">


                    <div class="form-group">
                        <label for="contact.contactType" class="col-sm-2 control-label"> Contact Type:</label>

                        <div class="col-sm-10">
                            <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                      listKey="key" listValue="value" cssClass="form-control"
                                      value="contact.contactType" emptyOption="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact.lastName" class="col-sm-2 control-label">Last Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                         id="contact.lastName" required="true" maxLength="30" autofocus="true"
                                         pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact.firstName" class="col-sm-2 control-label">First Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                         id="contact.firstName" maxLength="30" pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."
                                         required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact.middleName" class="col-sm-2 control-label">Middle Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                         id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s]+"
                                         title="Name should not contain special characters and/or numbers."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact.phone" class="col-sm-2 control-label">Phone:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.phone" name="contact.phone"
                                         maxLength="11" required="true" pattern="\d{11}"
                                         title="Phone should not contain special characters and/or letters. Must be 11 digits."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact.mobile" class="col-sm-2 control-label">Mobile:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.mobile" name="contact.mobile"
                                         maxLength="11" required="true"
                                         pattern="\d{11}"
                                         title="Mobile should not contain special characters and/or letters."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact.fax" class="col-sm-2 control-label">Fax:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.fax" name="contact.fax"
                                         maxLength="11" pattern="[0-9]+"
                                         title="Fax should not contain special characters and/or letters."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact.email" class="col-sm-2 control-label">E-mail:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="contact.email" name="contact.email"
                                         type="email" required="true"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group pull-right">
                    <button class="btn btn-default">Cancel</button>
                    <s:submit cssClass="btn btn-default" name="submit" value="Save"/>
                </div>
            </div>
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
            <img src="includes/images/calendar.png" class="box-icon">
            <span class="booking panel-title">Process</span>

        </div>
        <div class="panel-body">
            <ul class="nav">
                <li><a href="customer-add.jsp" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal
                    Information</a></li>
                <li><a href="customer-add2.jsp" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Contact
                    Person</a></li>
                <li><a href="customer-add3.jsp" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Address</a>
                </li>
                <li><a href="customer-add4.jsp" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Items</a>
                </li>
                <li><a href="customer-add5.jsp" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Documents</a>
                </li>
                <li><a href="customer-add7.jsp" class="side-help"><img src="includes/images/6.png" class="img-sidehelp">Rates</a>
                </li>
                <li><a href="customerAddConsignee.jsp" class="side-help"><img src="includes/images/7.png"
                                                                              class="img-sidehelp">Consignee Infomation</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>

<!-- END SIDEBAR -->--%>

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
            <li class="active"><a href="<s:url action='viewCustomerContacts' />"><i class="fa fa-group"></i> Contact
                Persons</a></li>
            <li class="active"><i class="fa fa-plus"></i> Add New Contact Person</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add New Contact Person</h3>
            </div>

            <div class="panel-body">

                <s:form action="editCustomerContact" cssClass="form" theme="bootstrap">
                    <s:hidden name="contact.contactId" value="%{contact.contactId}"/>
                    <div class="form-group">
                        <label for="contact.contactType">Contact Type</label>
                        <s:select list="contactTypeList" name="contact.contactType" id="contact.contactType"
                                  listKey="key" listValue="value" cssClass="form-control"
                                  value="contact.contactType" emptyOption="true"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.lastName">Last Name</label>
                        <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                     id="contact.lastName" required="true" maxLength="30" autofocus="true"
                                     pattern="[a-zA-Z\s]+"
                                     title="Name should not contain special characters and/or numbers."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.firstName">First Name</label>
                        <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                     id="contact.firstName" maxLength="30" pattern="[a-zA-Z\s]+"
                                     title="Name should not contain special characters and/or numbers."
                                     required="true"/>

                    </div>

                    <div class="form-group">
                        <label for="contact.middleName">Middle Name</label>
                        <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                     id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s]+"
                                     title="Name should not contain special characters and/or numbers."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.phone">Phone</label>
                        <s:textfield cssClass="form-control" placeholder="contact.phone" name="contact.phone"
                                     maxLength="7" required="true" pattern="\d{7}"
                                     title="Phone should not contain special characters and/or letters. Must be 7 digits."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.mobile">Mobile</label>
                        <s:textfield cssClass="form-control" placeholder="contact.mobile" name="contact.mobile"
                                     maxLength="11" required="true"
                                     pattern="\d{11}"
                                     title="Mobile should not contain special characters and/or letters."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.fax">Fax</label>
                        <s:textfield cssClass="form-control" placeholder="contact.fax" name="contact.fax"
                                     maxLength="11" pattern="[0-9]+"
                                     title="Fax should not contain special characters and/or letters."/>

                    </div>

                    <div class="form-group">
                        <label for="contact.email">E-Mail</label>
                        <s:textfield cssClass="form-control" placeholder="contact.email" name="contact.email"
                                     type="email" required="true"/>

                    </div>

                    <div class="pull-right">
                        <s:submit cssClass="btn btn-info" name="submit" value="Save"/>
                    </div>

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
                <li class="active"><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a>
                </li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>

            </ul>
        </div>
    </div>
</div>
<!-- /.row -->