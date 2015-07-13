<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List </a></li>
            <li class="active"> Edit Customer</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Customer</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" theme="bootstrap" action="editCustomer">
                    <%--<s:property value="%{customer.customerId}"/>--%>
                    <s:hidden name="customer.customerId" value="%{customer.customerId}"/>
                    <s:hidden name="customer.createdTimestamp" value="%{customer.createdTimestamp}"/>
                    <s:hidden name="customer.createdBy" value="%{customer.createdBy}"/>
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="col-lg-12 control-label" style="padding-top:0px !important; margin-top: 0px !important; text-align:left;">Company Name / Customer Name<span class="asterisk_red"></span></label>
                                <div class="col-lg-12">
                                    <s:textfield  required="true" name="customer.customerName" cssClass="form-control" id="customer.customerName"
                                                  pattern="^(\s*[\#a-zA-Z0-9\.\,\-\&]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\-\&\#]*)\s*)+$"
                                                  title="Company / Customer name must not contain special charatcters."/>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Company Code<span class="asterisk_red"></span></label>
                                <div class="col-lg-7">
                                    <s:textfield required="true" maxLength="3" name="customer.customerCode" cssClass="form-control" id="customerCode" onkeypress="return alphaKeyOnly(event)"
                                                 pattern="^[A-Z0-9]{3,}$" title="Company Code must not contain special characters."/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Phone Number</label>
                                <div class="col-lg-7">
                                    <s:textfield name="customer.phone" cssClass="form-control" id="customer_phone" maxLength="14" pattern=".{14,}"
                                    placeholder="(XXX) XXX-XXXX" title="Phone number should contain 10 digits including local city code."/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Email Address<span class="asterisk_red"></span></label>
                                <div class="col-lg-7">
                                    <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" maxLength="50"
                                                 placeholder="Email Address" pattern="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"
                                                 title="Example: example@domain.com"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Website</label>
                                <div class="col-lg-7">
                                    <s:textfield name="customer.website" cssClass="form-control" placeholder="example.com" id="customer.website" maxLength="50"
                                                 pattern="^([_W-Ww-w-\\.])*([A-Za-z0-9]+)*(\\.[A-Za-z]{3,3}*(\\.[A-Za-z]{2,3}))$" title="Proper Format: example.com or www.example.com"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5  control-label" style="padding-top:0px;">DTI / SEC</label>
                                <div class="col-lg-7">
                                    <s:textfield name="customer.dti" cssClass="form-control" id="customer_dti" maxLength="15" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5  control-label" style="padding-top:0px;">Customer Information Sheet Number</label>
                                <div class="col-lg-7">
                                    <s:textfield name="customer.signatureCard" cssClass="form-control" id="customer_signatureCard" maxLength="30"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">

                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Customer Type<span class="asterisk_red"></span></label>
                                <div class="col-lg-7">
                                    <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Mobile</label>
                                <div class="col-lg-7">
                                    <s:textfield name="customer.mobile" cssClass="form-control" id="customer_mobile" maxLength="14"
                                    placeholder="(XXX) XXX-XXXX" pattern=".{14,}"
                                    title="Mobile number should contain 10 digits."/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Fax  Number</label>
                                <div class="col-lg-7">
                                    <s:textfield   name="customer.fax" cssClass="form-control" id="customer_fax" maxLength="14"
                                                   title="Fax number should contain 10 digits including local city codes."
                                                   placeholder="(XXX) XXX-XXXX" pattern=".{14,}"/>
                                </div>
                            </div>

                            <div class="form-group">

                                <label class="col-lg-5 control-label" style="padding-top:0px;">Mayor's Permit Number</label>
                                <div class="col-lg-7">
                                    <s:textfield name="customer.mayorsPermit" cssClass="form-control" id="customer_mayorsPermit" maxlength="30" pattern="^(\s*[\#a-zA-Z0-9\.\,\-\&]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9\.\,\-\&\#]*)\s*)+$"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5 control-label" style="padding-top:0px;">Account Application Form Number</label>
                                <div class="col-lg-7">
                                    <s:textfield name="customer.aaf" cssClass="form-control" id="customer_aaf" maxlength="30"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-5  control-label" style="padding-top:0px;">Service Area</label>
                                <div class="col-lg-7">
                                    <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                              id="select" name="customer.serviceArea" list="portsList" listKey="key"
                                              listValue="value" required="true"/>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="customerList" class="btn btn-danger" id ="groups-btn">Cancel</a>
                    <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function(){

        $("#customer_phone").mask("(999) 999-9999");
        $("#customer_mobile").mask("(999) 999-9999");
        $("#customer_fax").mask("(999) 999-9999");

    });

    $("#customerCode").keyup(function(){

        this.value=this.value.toUpperCase();
    });

</script>