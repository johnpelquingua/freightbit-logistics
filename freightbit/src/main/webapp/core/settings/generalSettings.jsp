<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<div class="row">

    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-cogs"></i> General Settings </h1>
            </span>
        </legend>

    </div>

</div>


<s:if test="hasActionErrors()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit General Settings</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <s:form action="editGeneralSettings" theme="bootstrap" cssClass="form-horizontal" method="post" name="editGeneralSettingsForm">
                    <s:hidden name="vendorClassAdded"/>
                    <s:hidden name="vendorTypeAdded"/>
                    <s:hidden name="customerTypeAdded"/>
                    <s:hidden name="addressTypeAdded"/>
                    <s:hidden name="contactTypeAdded"/>
                    <s:hidden name="portsAdded"/>

                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="active"><a href="#vendor" role="tab" data-toggle="tab">Vendor</a></li>
                            <li><a href="#customer" role="tab" data-toggle="tab">Customer</a></li>
                            <li><a href="#contact" role="tab" data-toggle="tab">Contact</a></li>
                            <li><a href="#address" role="tab" data-toggle="tab">Address</a></li>
                            <li><a href="#ports" role="tab" data-toggle="tab">Ports</a></li>
                        </ul>

                </div>
            </div>

            <div class="panel-footer">
                   <span class="pull-right">
                     <a href="loadGeneralSettings" class="btn btn-default" id="cancelButton">Cancel</a>
                     <a href="#" class="btn btn-default" id="saveButton">Save</a>
                     <!--<s:submit cssClass="btn btn-info" name="submit" value="Save" />-->
                   </span>
            </div>

            </s:form>
        </div>
    </div>
</div>


<script type="text/javascript">
var vendorClassParamMap= "";
var vendorTypeParamMap = "";
var customerTypeParamMap = "";
var contactTypeParamMap = "";
var addressTypeParamMap = "";
var portsParamMap = "";
function trackTextFieldChanges(paramName, here, key) {
	if ('vendorClass' == paramName) {
		vendorClassParamMap += "{"+key+":"+here.value+"} , ";
	} else 	if ('vendorType' == paramName) {
		vendorTypeParamMap += "{"+key+":"+here.value+"} , ";
	} else 	if ('customerType' == paramName) {
		customerTypeParamMap += "{"+key+":"+here.value+"} , ";
	} else 	if ('addressType' == paramName) {
		addressTypeParamMap += "{"+key+":"+here.value+"} , ";
	} else 	if ('contactType' == paramName) {
		contactTypeParamMap += "{"+key+":"+here.value+"} , ";
	} else 	if ('ports' == paramName) {
		portsParamMap += "{"+key+":"+here.value+"} , ";
	}
} 


$(document).ready(function() {
	
   var vendorClassCounter = $("#vendorClassGroup").length + 1;
  $("#addVendorClassTextBox").click(function() {
	   var fieldWrapper = $("<div class=\"control-group \" id=\"vendorClassGroup\"><div class=\"controls\"></div></div>");
	   var textField = "<input type=\"text\" name=\"vendorClass_"+vendorClassCounter+"\" value=\"\" id=\"vendorClass_"+vendorClassCounter+"\" class=\"form-control\" style=\"width: 85%; display: inline;\" />\n";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });
	   fieldWrapper.append(textField).append(removeButton);
	    
	    $("#vendorClassDiv").append(fieldWrapper);
	    vendorClassCounter++;
	});
  
  
  var vendorTypeCounter = $("#vendorTypeGroup").length + 1;
  $("#addVendorTypeTextBox").click(function() {
	   var fieldWrapper = $("<div class=\"control-group \" id=\"vendorTypeGroup\"><div class=\"controls\"></div></div>");
	   var textField = "<input type=\"text\" name=\"vendorType_"+vendorTypeCounter+"\" value=\"\" id=\"vendorType_"+vendorTypeCounter+"\" class=\"form-control\" style=\"width: 85%; display: inline;\" />\n";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });

	   fieldWrapper.append(textField).append(removeButton);
	    
	    $("#vendorTypeDiv").append(fieldWrapper);
	    vendorTypeCounter++;
	});
  
  

  var customerTypeCounter = $("#customerTypeGroup").length + 1;
  $("#addCustomerTypeTextBox").click(function() {
	   var fieldWrapper = $("<div class=\"control-group \" id=\"customerTypeGroup\"><div class=\"controls\"></div></div>");
	   var textField = "<input type=\"text\" name=\"customerType_"+customerTypeCounter+"\" value=\"\" id=\"customerType_"+customerTypeCounter+"\" class=\"form-control\" style=\"width: 85%; display: inline;\" />\n";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });
	   //var addButton = $("<input type=\"button\" value=\"+\" id=\"add\"/>");

	   fieldWrapper.append(textField).append(removeButton);
	    
	    $("#customerTypeDiv").append(fieldWrapper);
	    customerTypeCounter++;
	});
  
  var contactTypeCounter = $("#contactTypeGroup").length + 1;
  $("#addContactTypeTextBox").click(function() {
	   var fieldWrapper = $("<div class=\"control-group \" id=\"contactTypeGroup\"><div class=\"controls\"></div></div>");
	   var textField = "<input type=\"text\" name=\"contactType_"+contactTypeCounter+"\" value=\"\" id=\"contactType_"+contactTypeCounter+"\" class=\"form-control\" style=\"width: 85%; display: inline;\" />\n";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });
	   //var addButton = $("<input type=\"button\" value=\"+\" id=\"add\"/>");

	   fieldWrapper.append(textField).append(removeButton);
	    
	    $("#contactTypeDiv").append(fieldWrapper);
	    contactTypeCounter++;
	});
  
  var addressTypeCounter = $("#addressTypeGroup").length + 1;
  $("#addAddressTypeTextBox").click(function() {
	   var fieldWrapper = $("<div class=\"control-group \" id=\"addressTypeGroup\"><div class=\"controls\"></div></div>");
	   var textField = "<input type=\"text\" name=\"addressType_"+addressTypeCounter+"\" value=\"\" id=\"addressType_"+addressTypeCounter+"\" class=\"form-control\" style=\"width: 85%; display: inline;\" />\n";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });
	   //var addButton = $("<input type=\"button\" value=\"+\" id=\"add\"/>");

	   fieldWrapper.append(textField).append(removeButton);
	    
	    $("#addressTypeDiv").append(fieldWrapper);
	    addressTypeCounter++;
	});
  
  var orderPortCounter = $("#orderPortGroup").length + 1;
  $("#addOrderPortTextBox").click(function() {
	   var fieldWrapper = $("<div class=\"control-group \" id=\"orderPortGroup\"><div class=\"controls\"></div></div>");
	   var textField = "<input type=\"text\" name=\"orderPort_"+orderPortCounter+"\" value=\"\" id=\"orderPort_"+orderPortCounter+"\" class=\"form-control\" style=\"width: 85%; display: inline;\" />\n";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });
	   //var addButton = $("<input type=\"button\" value=\"+\" id=\"add\"/>");

	   fieldWrapper.append(textField).append(removeButton);
	    
	    $("#orderPortDiv").append(fieldWrapper);
	    orderPortCounter++;
	});
  
  $("#saveButton").click(function() {
		var msg = '';
		for(i=1; i<vendorClassCounter; i++){
		  if (i==1)
			  msg="{NEW_"+i+":"+ $('#vendorClass_' + i).val() +"}";
		  else
			  msg += ", {NEW_"+i+":" + $('#vendorClass_' + i).val() +"}";
		}		
        document.forms[0].vendorClassAdded.value = vendorClassParamMap + "" + msg;

		var msg = '';
		for(i=1; i<vendorTypeCounter; i++){
		  if (i==1)
			  msg="{NEW_"+i+":"+ $('#vendorType_' + i).val() +"}";
		  else
			  msg += ", {NEW_"+i+":" + $('#vendorType_' + i).val() +"}";
		}		
        document.forms[0].vendorTypeAdded.value = vendorTypeParamMap + "" + msg;

		var msg = '';
		for(i=1; i<customerTypeCounter; i++){
			if (i==1)
				  msg="{NEW_"+i+":"+ $('#customerType_' + i).val() +"}";
			  else
				  msg += ", {NEW_"+i+":" + $('#customerType_' + i).val() +"}";
		}
        document.forms[0].customerTypeAdded.value = customerTypeParamMap + "" + msg;
        
		var msg = '';
		for(i=1; i<contactTypeCounter; i++){
			if (i==1)
				  msg="{NEW_"+i+":"+ $('#contactType_' + i).val() +"}";
			  else
				  msg += ", {NEW_"+i+":" + $('#contactType_' + i).val() +"}";
		}
        document.forms[0].contactTypeAdded.value = contactTypeParamMap + "" + msg;
        
		var msg = '';
		for(i=1; i<addressTypeCounter; i++){
			if (i==1)
				  msg="{NEW_"+i+":"+ $('#addressType_' + i).val() +"}";
			  else
				  msg += ", {NEW_"+i+":" + $('#addressType_' + i).val() +"}";
		}
        document.forms[0].addressTypeAdded.value = addressTypeParamMap + "" + msg;
        
		var msg = '';
		for(i=1; i<orderPortCounter; i++){
			if (i==1)
				  msg="{NEW_"+i+":"+ $('#orderPort_' + i).val() +"}";
			  else
				  msg += ", {NEW_"+i+":" + $('#orderPort_' + i).val() +"}";
		}
        document.forms[0].portsAdded.value = portsParamMap + "" + msg;
        document.forms[0].action = "editGeneralSettings";
        document.forms[0].submit();
	});
	    
	});
</script>
