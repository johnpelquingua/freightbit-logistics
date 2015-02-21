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
            <li class="active"> Add Customer</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add Customer</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addCustomer">

                        <div class="col-lg-12">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="col-lg-12 control-label" style="padding-top:0px !important; margin-top: 0px !important; text-align:left;">Company Name / Customer Name<span class="asterisk_red"></span></label>
                                    <div class="col-lg-12" >
                                        <s:textfield placeholder="Enter Company / Customer name" required="true" name="customer.customerName" cssClass="customerInput form-control" id="customer.customerName"
                                                     pattern="^(\s*[a-zA-Z0-9]+(([\'\-\+\s]\s*[a-zA-Z0-9])?[a-zA-Z0-9]*)\s*)+$" maxLength="50" title="Company / Customer name must not contain special charatcters."/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="padding-top:0px;">Company Code<span class="asterisk_red"></span></label>
                                    <div class="col-lg-7" >
                                        <s:textfield placeholder="Enter company code" required="true" maxLength="3" name="customer.customerCode" cssClass="customerInput form-control" id="customerCode" onkeypress="return alphaKeyOnly(event)"
                                                title="Company Code must not contain special charatcters." pattern="^[A-Z]{3,}$" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="padding-top:0px;">Phone Number<span class="asterisk_red"></span></label>
                                    <div class="col-lg-7" >
                                        <s:textfield required="true" name="customer.phone" cssClass="customerInput form-control" id="customer_phone" maxLength="14" pattern=".{14,}"
                                                     placeholder="(XXX) XXX-XXXX" title="Phone number should contain 10 digits including local city code."/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="padding-top:0px;">Email Address<span class="asterisk_red"></span></label>
                                    <div class="col-lg-7" >
                                        <s:textfield required="true" name="customer.email" cssClass="customerInput form-control" id="customer.email" maxLength="50"
                                                     placeholder="Email Address" pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{3,})$"
                                                     title="Example: example@domain.com" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="padding-top:0px;">Website</label>
                                    <div class="col-lg-7" >
                                        <s:textfield name="customer.website" cssClass="form-control" placeholder="example.com" id="customer.website"
                                                     pattern="^([_W-Ww-w-\\.])*([A-Za-z0-9]+)*(\\.[A-Za-z]{3,3})$"
                                                     title="Proper Format: example.com or www.example.com" />
                                    </div>
                                </div>

                                <div class="form-group">
                                <label class="col-lg-5  control-label" style="padding-top:0px;">DTI / SEC</label>
                                <div class="col-lg-7" >
                                    <s:textfield name="customer.dti" cssClass="form-control" id="customer_dti"
                                                 placeholder="XXXXXXXX" maxLength="8" pattern=".{8,}"/>
                                </div>
                                </div>

                                <div class="form-group">

                                    <label class="col-lg-5  control-label" style="padding-top:0px;">Customer Information Sheet Number</label>
                                    <div class="col-lg-7" >
                                        <s:textfield name="customer.signatureCard" cssClass="form-control" id="customer_signatureCard" placeholder="Customer Information Sheet Number" maxLength="30"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="padding-top:0px;">Customer Type<span class="asterisk_red"></span></label>
                                    <div class="col-lg-7" >
                                        <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="customerInput form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="padding-top:0px;">Mobile Number<span class="asterisk_red"></span></label>
                                    <div class="col-lg-7" >
                                        <s:textfield required="true" name="customer.mobile" cssClass="customerInput form-control" id="customer_mobile" maxLength="19"
                                                     placeholder="(+639XX) (XXX-XXXX)" pattern=".{18,}"
                                                     title="Mobile number should contain 11 digits."/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="padding-top:0px;">Fax  Number</label>
                                    <div class="col-lg-7" >
                                        <s:textfield   name="customer.fax" cssClass="form-control" id="customer_fax" maxLength="14" pattern=".{14,}"
                                                       title="Fax number should contain 10 digits including local city codes." placeholder="(XXX) XXX-XXXX"/>
                                    </div>
                                </div>


                                <div class="form-group">

                                        <label class="col-lg-5 control-label" style="padding-top:0px;">Mayor's Permit Number</label>
                                        <div class="col-lg-7" >
                                        <s:textfield name="customer.mayorsPermit" cssClass="form-control" id="customer_mayorsPermit" pattern=".{9,}" placeholder="XX-XXXXXX"/>
                                        </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-lg-5  control-label" style="padding-top:0px;">Account Application Form Number</label>
                                    <div class="col-lg-7" >
                                        <s:textfield name="customer.aaf" cssClass="form-control" id="customer_aaf" placeholder="Account Application Form Number" maxlength="30"/>
                                    </div>
                                    </div>
                            </div>

                        <%--<div class="col-lg-9 col-lg-offset-2">--%>
                            <%--<div class="panel panel-info" >--%>
                                <%--<div class="panel-heading">--%>
                                    <%--<h3 class="panel-title"><i class="fa fa-file-text"></i> Documents</h3>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>

                                    <%--<div class="col-lg-4 col-lg-offset-2" >--%>
                                        <%--<s:checkbox name="customer_dti" fieldValue="true" label="DTI"/>--%>
                                        <%--<s:if test = "customer_dti == true">--%>
                                            <%--<s:hidden name="customer.dti" value="1" />--%>
                                        <%--</s:if>--%>
                                        <%--<s:else>--%>
                                            <%--<s:hidden name="customer.dti" value="0" />--%>
                                        <%--</s:else>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-lg-4 col-lg-offset-1">--%>
                                        <%--<s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Mayor's Permit"/>--%>
                                    <%--</div>--%>


                                    <%--<div class="col-lg-4 col-lg-offset-2" >--%>
                                        <%--<s:checkbox name="customer_aaf" fieldValue="true" label="Account Application Form"/>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-lg-4 col-lg-offset-1">--%>
                                        <%--<s:checkbox name="customer_signatureCard" fieldValue="true" label="Signature Card"/>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="customerList" class="btn btn-danger" id ="groups-btn">Cancel</a>

                    <s:submit name="submit" cssClass="btn btn-primary submitBtn" value="Save" disabled="true"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){

        $("#customer_phone").mask("(999) 999-9999");
        $("#customer_mobile").mask("(+63999)(999-9999)");
        $("#customer_fax").mask("(999) 999-9999");
        $("#customer_dti").mask("99999999");
        $("#customer_mayorsPermit").mask("99-999999");

        validationForm('customerInput', 'submitBtn');
    });

    $("#customerCode").keyup(function(){
       this.value=this.value.toUpperCase();
    });

    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if ((charCode > 32 && charCode < 57)||(charCode > 57 && charCode <65) || (charCode > 90 && charCode < 97) )
            return false;

        return true;
    }

</script>