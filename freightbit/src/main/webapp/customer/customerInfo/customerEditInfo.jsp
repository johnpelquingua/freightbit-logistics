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
                    <s:property value="%{customer.customerId}"/>
                    <s:hidden name="customer.customerId" value="%{customer.customerId}"/>
                    <s:hidden name="customer.createdTimestamp" value="%{customer.createdTimestamp}"/>
                    <s:hidden name="customer.createdBy" value="%{customer.createdBy}"/>
                    <div class="form-group">
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px !important; margin-top: 0px !important;">Company Name / Customer Name<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >

                                <s:textfield  required="true" name="customer.customerName" cssClass="form-control" id="customer.customerName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Company Code<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >

                                <s:textfield required="true" maxLength="3" name="customer.customerCode" cssStyle="text-transform:uppercase" cssClass="form-control" id="customer.customerCode" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Customer Type<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Phone Number<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="customer.phone" cssClass="form-control" id="customer.phone" maxLength="14" 
                                pattern="\([0-9]{2,3}\) ?[0-9]{3}-[0-9]{4}" title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Mobile Number<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="customer.mobile" maxLength="19" 
                                pattern="\(\+63[0-9]{3}\) ?\([0-9]{3}-[0-9]{4}\)"
                                title="(+639XX) (XXX-XXXX) Mobile should not contain special characters and/or letters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Fax  Number</label>
                            <div class="col-lg-9" >
                                <s:textfield   name="customer.fax" cssClass="form-control" id="customer.fax" maxLength="14"
                                 pattern="\([0-9]{2,3}\) ?[0-9]{3}-[0-9]{4}" title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Email Address<span class="asterisk_red"></span></label>
                            <div class="col-lg-9" >
                                <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" type="email" maxLength="50"
                                         pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"/>
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
                                    <h3 class="panel-title"><i class="fa fa-file-text"></i> Documents<span class="asterisk_red"></span></h3>
                                </div>
                                <div class="form-group" >

                                    <div class="col-lg-4 col-lg-offset-2">
                                        <%--<s:property value="%{customer.dti}" />--%>
                                        <%--<s:checkbox  name="%{customer.dti}" fieldValue="true" label="DTI"  />--%>

                                        <s:if test="%{customer.dti == 1}">
                                            <%--<s:checkbox  name="%{customer.dti}" fieldValue="true" label="DTI 1"  />--%>
                                            <s:checkbox name="customer_dti" fieldValue="true" label="DTI" checked="checked" />
                                        </s:if>
                                        <s:else >
                                            <s:checkbox name="customer_dti" fieldValue="true" label="DTI"  />
                                        </s:else>

                                    </div>
                                    <div class="col-lg-4 col-lg-offset-1">
                                        <%--<s:property value="%{customer.mayorsPermit}" />--%>
                                        <%--<s:checkbox name="%{customer.mayorsPermit}" label="Mayor's Permit"  />--%>

                                        <s:if test="%{customer.mayorsPermit == 1}">
                                            <s:checkbox  name="customer_mayorsPermit" fieldValue="true" label="Mayor's Permit" checked="checked" />
                                        </s:if>
                                        <s:else >
                                            <s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Mayor's Permit"  />
                                        </s:else>
                                    </div>



                                    <div class="col-lg-4 col-lg-offset-2" >
                                        <%--<s:property value="%{customer.aaf}" />--%>
                                        <%--<s:checkbox name="%{customer.aaf}" label="Account Application Form"  />--%>

                                        <s:if test="%{customer.aaf == 1}">
                                            <s:checkbox  name="customer_aaf" fieldValue="true" label="Account Application Form" checked="checked" />
                                        </s:if>
                                        <s:else >
                                            <s:checkbox name="customer_aaf" fieldValue="true" label="Account Application Form"  />
                                        </s:else>

                                    </div>
                                    <div class="col-lg-4 col-lg-offset-1">
                                        <%--<s:property value="%{customer.signatureCard}" />--%>
                                        <%--<s:checkbox name="%{customer.signatureCard}" label="Signature Card"  />--%>

                                        <s:if test="%{customer.signatureCard == 1}">
                                            <s:checkbox  name="customer_signatureCard" fieldValue="true" label="Signature Card" checked="checked" />
                                        </s:if>
                                        <s:else >
                                            <s:checkbox name="customer_signatureCard" fieldValue="true" label="Signature Card"  />
                                        </s:else>
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