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

                        <div class="form-group">
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px !important; margin-top: 0px !important;">Company Name / Customer Name</label>
                            <div class="col-lg-9" >
                                <span class="asterisk_input"></span>
                                <s:textfield  required="true" name="customer.customerName" pattern="^[a-zA-Z][a-zA-Z ]+$" cssClass="form-control" id="customer.customerName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Company Code</label>
                            <div class="col-lg-9" >
                                <span class="asterisk_input"></span>
                                <s:textfield required="true" maxLength="3" pattern="[A-Z]+" name="customer.customerCode" cssClass="form-control" id="customer.customerCode" />
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Customer Type</label>
                            <div class="col-lg-9" >
                                <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Phone No.</label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="customer.phone" cssClass="form-control" id="customer.phone" maxLength="14" 
                                pattern="\([0-9]{2,3}\) ?[0-9]{3}-[0-9]{4}" title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Mobile No.</label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="customer.mobile" maxLength="19" 
								pattern="\(\+63[0-9]{3}\) ?\([0-9]{3}-[0-9]{4}\)"
                                title="(+639XX) (XXX-XXXX) Mobile should not contain special characters and/or letters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Fax  No.</label>
                            <div class="col-lg-9" >
<<<<<<< HEAD
                                <s:textfield  name="customer.fax" cssClass="form-control" id="customer.fax" maxLength="11" pattern="[0-9]+"/>
=======
                                <s:textfield  required="true" name="customer.fax" cssClass="form-control" id="customer.fax" maxLength="14" 
                                 pattern="\([0-9]{2,3}\) ?[0-9]{3}-[0-9]{4}" title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
>>>>>>> ac33275e89949d187a41449861392a9c2e7b3fa7
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Email Address</label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" type="email"
								maxLength="50" pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Website</label>
                            <div class="col-lg-9" >
                                <s:textfield name="customer.website" cssClass="form-control" id="customer.website"/>
                            </div>
                        </div>

                        <div class="col-lg-9 col-lg-offset-2">
                            <div class="panel panel-info" >
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-file-text"></i> Documents</h3>
                                </div>
                                <div class="form-group">

                                    <div class="col-lg-4 col-lg-offset-2" >
                                        <s:checkbox name="customer_dti" fieldValue="true" label="DTI"/>
                                        <s:if test = "customer_dti == true">
                                            <s:hidden name="customer.dti" value="1" />
                                        </s:if>
                                        <s:else>
                                            <s:hidden name="customer.dti" value="0" />
                                        </s:else>
                                    </div>
                                    <div class="col-lg-4 col-lg-offset-1">
                                        <s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Mayor's Permit"/>
                                    </div>


                                    <div class="col-lg-4 col-lg-offset-2" >
                                        <s:checkbox name="customer_aaf" fieldValue="true" label="Account Application Form"/>
                                    </div>
                                    <div class="col-lg-4 col-lg-offset-1">
                                        <s:checkbox name="customer_signatureCard" fieldValue="true" label="Signature Card"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="customerList" class="btn btn-default" id ="groups-btn">Cancel</a>

                    <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>