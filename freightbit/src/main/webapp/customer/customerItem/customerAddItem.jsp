<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
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
            <li class="active"><a href="<s:url action='customerList' />"> Customer List</a>
            </li>
            <li class="active"><a href="<s:url action='customerInfo' />"> Customer
                Profile</a></li>
            <li class="active"><a href="<s:url action='viewItem' />"> Items</a></li>
            <li class="active"> Add Item</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add Item</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form theme="bootstrap" cssClass="form-horizontal" action="addItem">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-8">
                                <s:textfield name="item.itemName" id="item.itemName" required="true"
                                             cssClass="form-control" pattern="[A-Za-z ]+" title="Must be letters only" maxlength="50"/>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Item Code<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textfield name="item.itemCode" id="item_itemCode" required="true"
                                             cssClass="form-control" maxLength="3" pattern="[A-Z]+" title="Must be capital letters only" onkeypress="return alphaKeyOnly(event)"/>
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Weight (kg)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textfield name="item.weight" id="item.weight" required="true"
                                             cssClass="form-control" pattern="[0-9.,]+" title="Special characters in Price is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                            <%--<label class="col-lg-2 control-label" style="padding-top:0px;">SRP (Php)</label>--%>

                            <%--<div class="col-lg-3"><span class="asterisk_input"></span>--%>
                                <%--<s:textfield name="item.srp" id="item.srp" required="true" cssClass="form-control"/>--%>
                            <%--</div>--%>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <%--<label class="col-lg-2 control-label" style="padding-top:0px;">Critical Quality</label>

                            <div class="col-lg-3"><span class="asterisk_input"></span>
                                <s:textfield name="item.criticalQuality" id="item.criticalQuality" required="true"
                                             cssClass="form-control"/>
                            </div>--%>

                            <label class="col-lg-2 control-label" style="padding-top:0px;">SRP (Php)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textfield name="item.srp" id="item.srp" required="true" cssClass="form-control" pattern="[0-9.,]+" title="Special characters in Quality is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Length (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textfield name="item.length" id="item.length" required="true" cssClass="form-control"
                                             style="150px" pattern="[0-9.]+" title="Special characters in length is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Width (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textfield name="item.width" id="item.width" required="true" cssClass="form-control"  pattern="[0-9.]+" title="Special characters in width is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Height (m)<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textfield name="item.height" id="item.height" required="true"
                                             cssClass="form-control" pattern="[0-9.]+" title="Special characters in height is not valid" onkeypress="return isNumberKey(event)"/>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Description<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textarea name="item.description" id="item.description" required="true" resize="none"
                                            style="resize:none" rows="3" cssClass="form-control" maxlength="50"/>
                            </div>

                            <label class="col-lg-2 control-label" style="padding-top:0px;">Note<span class="asterisk_red"></span></label>

                            <div class="col-lg-3">
                                <s:textarea name="item.note" id="item.note" required="true" cssClass="form-control"
                                            style="resize:none" rows="3" maxlength="50"/>
                            </div>
                        </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewItem" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </div>
            </s:form>
        </div>
    </div>

    <%--<div class="col-lg-2">
        <div class="panel panel-primary">

            <ul class="nav nav-pills nav-stacked">
           	   <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li class="active"><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                <li><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>--%>

</div>


<script type="text/javascript">

    $("#item_itemCode").keyup(function(){
        this.value=this.value.toUpperCase();
    });


    function alphaKeyOnly(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if ((charCode > 32 && charCode < 57)||(charCode > 57 && charCode <65) || (charCode > 90 && charCode < 97) )
            return false;

        return true;
    }

    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57) || (charCode == 46 && $(this).val().indexOf('.') != -1))
            return false;

        return true;
    }


</script>