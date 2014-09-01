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
            <li class="active"><a href="<s:url action='viewRates' />"> Rates </a></li>
            <li class="active"> Add Rate</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add Rate</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form cssClass="form-horizontal" action="addRates" theme="bootstrap">
                        <div class="form-group">
                            <label class="col-lg-2 control-label" style="padding-top:0px;">Origin</label>

                            <div class="col-lg-10" >
                                <span class="asterisk_red"></span>
                                <s:select name="rate.origin" cssClass="form-control" id="select1"
                                          list="portsList" listKey="key"
                                          listValue="value" placeholder="Origin"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   style="padding-top:0px;">Destination</label>

                            <div class="col-lg-10" >
                                <span class="asterisk_red"></span>
                                <s:select name="rate.destination" cssClass="form-control" id="select2"
                                          list="portsList" listKey="key"
                                          listValue="value" placeholder="Destination"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rates.rate" class="col-lg-2 control-label" style="padding-top:0px;">Rate (Php)<span class="asterisk_red"></span></label>

                            <div class="col-lg-10" >

                                <s:textfield required="true" name="rate.rate" cssClass="form-control" id="rates.rate"
                                             placeholder="Rate" onkeypress="return isNumberKey(event)"/>
                            </div>
                        </div>

                        <div class="form-group">

                            <label for="rates.rateType" class="col-lg-2 control-label" style="padding-top:0px;">Rate
                                Type</label>

                            <div class="col-lg-10" >
                                <s:select name="rate.rateType" list="rateTypeList" listValue="value" listKey="key"
                                          cssClass="form-control" id="rates.rateType" emptyOption="true"/>
                            </div>

                        </div>

                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="viewRates" class="btn btn-default" id ="groups-btn">Cancel</a>
                    <s:submit type="submit" value="Save" cssClass="btn btn-primary" id="strut" disabled="true"/>
                </div>
            </div>
            </s:form>
        </div>

    </div>

    <%--<div class="col-lg-2 col-lg-offset-2">
        <div class="panel panel-primary">
            <ul class="nav nav-pills nav-stacked">
           	   <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li><a href="viewAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewCustomerContacts"><i class="fa fa-group fa-fw"></i> Contacts</a></li>
                <li><a href="viewItem"><i class="fa fa-list-ol fa-fw"></i> Items</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER',  'ROLE_DOC_SPECIALIST', 'ROLE_FINANCE')">
                <li class="active"><a href="viewRates"><i class="fa fa-money fa-fw"></i> Rates</a></li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER_RELATIONS', 'ROLE_SALES', 'ROLE_CUSTOMER')">
                <li><a href="viewConsignees"><i class="fa fa-list fa-fw"></i> Consignee List</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>--%>

</div>

<script type="text/javascript">

    // Avoid selecting duplicate ports

    function preventDuplicatePort(select, index) {

        var options = select.options,
                len = options.length;

        while ( len-- ){
            options[ len ].disabled = false;
        }

        select.options[ index ].disabled = true;

        if( index === select.selectedIndex ){
            alert('You already selected the same port "' + select.options[index].text + '". Please choose another' );
            /*this.selectedIndex = 0;*/
            select2.value = '';
        }

    }

    var select1 = select = document.getElementById('select1');
    var select2 = select = document.getElementById('select2');

    select2.value = '';

    select1.onchange = function() {
    preventDuplicatePort.call(this, select2, this.selectedIndex);
    };

    select2.onchange = function() {
    preventDuplicatePort.call(this, select1, this.selectedIndex);
    };


    function validateRate(){
        var ratesField = document.getElementById('rates.rate');
        var Xrate = document.getElementById('rates.rate').value;
        var sa = document.getElementById('strut');
            if (Xrate == "" || null){
            alert("Rates Required");
                ratesField.focus();
                sa.disabled=true;
            }
           else{
                sa.disabled=false;
            }
    }
    var ratesField2 = document.getElementById('rates.rate');

    ratesField2.onchange = function(){
        validateRate();

    };

    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57) || (charCode == 46 && $(this).val().indexOf('.') != -1))
            return false;

        return true;
    }

</script>