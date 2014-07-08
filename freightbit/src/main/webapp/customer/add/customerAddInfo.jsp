<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

<h1 class="page-header">Customer Profile</h1>

<!-- MAIN BOX -->

<div class="main-box">
    <div class="panel booking panel-info">
        <div class="booking panel-heading">
              <img src="includes/images/add-user.png" class="box-icon">
                <span class="booking panel-title">Add Customer - Personal Information</span>
        </div>
        <div class="panel-body">
        <div class="table-responsive list-table">

         <s:form cssClass="form-horizontal" theme="bootstrap" action="addCustomer">
          <div class="form-group">

         <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Company Name</label>
            <div class="col-sm-10" style="width:70%;">
              <s:textfield  required="true" name="customer.customerName" cssClass="form-control" id="customer.customerName" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Company Code</label>
            <div class="col-sm-10" style="width:70%;">
              <s:textfield required="true" maxLength="3" name="customer.customerCode" cssStyle="text-transform:uppercase" cssClass="form-control" id="customer.customerCode" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Customer Type</label>
            <div class="col-sm-10" style="width:70%;">
             <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Phone No.</label>
            <div class="col-sm-10" style="width:70%;">
              <s:textfield required="true" name="customer.phone" cssClass="form-control" id="customer.phone" maxLength="7"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Mobile No.</label>
            <div class="col-sm-10" style="width:70%;">
              <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="customer.mobile" maxLength="11"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Fax  No.</label>
            <div class="col-sm-10" style="width:70%;">
              <s:textfield  required="true" name="customer.fax" cssClass="form-control" id="customer.fax" maxLength="11"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Email Address</label>
            <div class="col-sm-10" style="width:70%;">
              <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" type="email"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" style="width:25%;">Website</label>
            <div class="col-sm-10" style="width:70%;">
              <s:textfield name="customer.website" cssClass="form-control" id="customer.website"/>
            </div>
          </div>
    <hr>

              <h4>Documents</h4>
              <hr>
              <div style="padding:4px;">
                  <div class="col-xs-6">
                      <label>
                         &lt;%&ndash; <input type="hidden" name="customer.dti" id="customer.dti" value="1">
                          <input type="checkbox" name="customer.dti" id="customer.dti" value="0">&ndash;%&gt;DTI / SEC Certificate
                      </label>
                  </div>
                  <div class="col-xs-6">
                      <label>
                          &lt;%&ndash;<input type="hidden" name="customer.mayorsPermit" id="customer.mayorsPermit" value="yes">
                          <input type="checkbox" name="customer.mayorsPermit" id="customer.mayorsPermit" value="no">&ndash;%&gt;Mayor's Permit
                      </label>
                  </div>
                  <div class="col-xs-6">
                      <label>
                         &lt;%&ndash; <input type="hidden" name="aaf" value="yes">
                          <input type="checkbox" name="aaf" value="no">&ndash;%&gt;Account Application Form
                      </label>
                  </div>
                  <div class="col-xs-6">
                      <label>
                         &lt;%&ndash; <input type="hidden" name="signatureCard" value="yes">
                          <input type="checkbox" name="signatureCard" value="no">&ndash;%&gt;Signature Specimen Card
                      </label>
                  </div>
              </div>
              <hr>

      <div class="col-sm-10 pull-right" style="width:70%;">
            <a href="customerList" class="btn btn-default" id ="groups-btn">Cancel</a>
            <s:submit name="submit" cssClass="btn btn-default" value="Save and Proceed" />
      </div>

        </s:form>

        </div>
        </div>
    </div>
</div>

<!-- END OF MAIN BOX -->

<!-- END OF THE MIDDLE -->--%>


<div class="row" style="margin-top: -15px;">
    <div class="col-lg-12">
        <h1>Add New Customer </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"><i class="fa fa-list"></i> Customer List </a></li>
            <li class="active"><i class="fa fa-plus"></i> Add New Customer</li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 21% !important;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add New</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addCustomer">

                        <div class="form-group">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Company Name</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield  required="true" name="customer.customerName" cssClass="form-control" id="customer.customerName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Company Code</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" maxLength="3" pattern="[A-Z-]+" name="customer.customerCode" cssStyle="text-transform:uppercase" cssClass="form-control" id="customer.customerCode" />
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Customer Type</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Phone No.</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" name="customer.phone" cssClass="form-control" id="customer.phone" maxLength="7" pattern="\d{7}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Mobile No.</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="customer.mobile" maxLength="11" pattern="\d{11}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Fax  No.</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield  required="true" name="customer.fax" cssClass="form-control" id="customer.fax" maxLength="11" pattern="[0-9]+"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Email Address</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" type="email"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="width:25%;">Website</label>
                            <div class="col-sm-10" style="width:70%;">
                                <s:textfield name="customer.website" cssClass="form-control" id="customer.website"/>
                            </div>
                        </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" style="width:25%; padding-top: 25px;">Documents</label>
                                <div class="col-sm-4" style="padding-left: 40px;">
                                    <s:checkbox name="customer_dti" fieldValue="true" label="DTI"  />

                                    <s:if test = "customer_dti == true">
                                        <s:hidden name="customer.dti" value="1" />
                                    </s:if>
                                    <s:else>
                                        <s:hidden name="customer.dti" value="0" />
                                    </s:else>

                                </div>
                                <div class="col-sm-4" style="padding-left: 40px;" >
                                    <s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Mayor's Permit"  />
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" style="width:25%;"></label>
                                <div class="col-sm-4" style="padding-left: 40px;">
                                    <s:checkbox name="customer_aaf" fieldValue="true" label="Account Application Form"  />
                                </div>
                                <div class="col-sm-4" style="padding-left: 40px;">
                                    <s:checkbox name="customer_signatureCard" fieldValue="true" label="Signature Card"  />
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
<!-- /.row -->