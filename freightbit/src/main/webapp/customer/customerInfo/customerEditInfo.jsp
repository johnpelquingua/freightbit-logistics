<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Customer Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List </a></li>
            <li class="active"> Edit Customer</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Customer</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" theme="bootstrap" action="editCustomer">
                    <s:hidden name="customer.customerId" value="%{customer.customerId}"/>
                    <s:hidden name="customer.createdTimestamp" value="%{customer.createdTimestamp}"/>
                    <s:hidden name="customer.createdBy" value="%{customer.createdBy}"/>
                    <div class="form-group">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Company Name:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield  required="true" name="customer.customerName" cssClass="form-control" id="customer.customerName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Company Code:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" maxLength="3" name="customer.customerCode" cssStyle="text-transform:uppercase" cssClass="form-control" id="customer.customerCode" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Customer Type:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Phone No.:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" name="customer.phone" cssClass="form-control" id="customer.phone" maxLength="7" pattern="\d{7}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Mobile No.:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="customer.mobile" maxLength="11" pattern="\d{11}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Fax  No.:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield  required="true" name="customer.fax" cssClass="form-control" id="customer.fax" maxLength="11" pattern="[0-9]+"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Email Address:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" type="email"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Website:</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="customer.website" cssClass="form-control" id="customer.website"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%; padding-top: 25px;">Documents</label>
                            <div class="col-sm-4" style="padding-left: 40px;">
                                <s:property value="%{customer.dti}" />
                                <%--<s:checkbox  name="%{customer.dti}" fieldValue="true" label="DTI"  />--%>

                                <s:if test="%{customer.dti == 1}">
                                    <%--<s:checkbox  name="%{customer.dti}" fieldValue="true" label="DTI 1"  />--%>
                                    <s:checkbox name="customer_dti" fieldValue="true" label="DTI 1.5" checked="checked" />
                                </s:if>
                                <s:else >
                                    <s:checkbox name="customer_dti" fieldValue="true" label="DTI 2"  />
                                </s:else>

                            </div>
                            <div class="col-sm-4" style="padding-left: 40px;" >
                                <s:property value="%{customer.mayorsPermit}" />
                                <%--<s:checkbox name="%{customer.mayorsPermit}" label="Mayor's Permit"  />--%>

                                <s:if test="%{customer.mayorsPermit == 1}">
                                    <s:checkbox  name="customer_mayorsPermit" fieldValue="true" label="Permit 1" checked="checked" />
                                </s:if>
                                <s:else >
                                    <s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Permit 2"  />
                                </s:else>

                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;"></label>
                            <div class="col-sm-4" style="padding-left: 40px;">
                                <s:property value="%{customer.aaf}" />
                                <%--<s:checkbox name="%{customer.aaf}" label="Account Application Form"  />--%>

                                <s:if test="%{customer.aaf == 1}">
                                    <s:checkbox  name="customer_aaf" fieldValue="true" label="AAF 1" checked="checked" />
                                </s:if>
                                <s:else >
                                    <s:checkbox name="customer_aaf" fieldValue="true" label="AAF 2"  />
                                </s:else>

                            </div>
                            <div class="col-sm-4" style="padding-left: 40px;">
                                <s:property value="%{customer.signatureCard}" />
                                <%--<s:checkbox name="%{customer.signatureCard}" label="Signature Card"  />--%>

                                <s:if test="%{customer.signatureCard == 1}">
                                    <s:checkbox  name="customer_signatureCard" fieldValue="true" label="Card 1" checked="checked" />
                                </s:if>
                                <s:else >
                                    <s:checkbox name="customer_signatureCard" fieldValue="true" label="Card 2"  />
                                </s:else>

                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="customerList" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit name="submit" cssClass="btn btn-info" value="Save" />
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>