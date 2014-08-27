<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<div class="row">
    <div class="col-lg-12">
        <h1>General Settings </h1>
    </div>
</div>


<s:if test="hasActionMessages()">
    <div class="col-lg-7">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
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
                    <s:hidden name="portsAdded"/>

                    <div class="form-group" id="vendorClassId">
                        <label for="vendorClass" class="col-lg-3 control-label" id="users-add-label">Vendor Class:</label>
                        <div class="col-lg-9" id="vendorClassDiv">
                             <s:iterator value="vendorClassParamList" var="vendorClass">
                             	<s:textfield disabled="true" required="true" name="value" cssClass="form-control"/>
                             </s:iterator> 
                             <div class="control-group" id="vendorClassGroup">
                             	<div class="controls">
                             		<input type="text" name="vendorClass_1" value="" id="vendorClass_1" class="form-control" style="width:85%; display:inline;"/>
                             		<input type="button" value="-"/> <input type="button" value="+" id="addVendorClassTextBox"/>
                             	</div>
                             </div>
                        </div>
                    </div>
                    
                    <div class="form-group" id="vendorTypeId">
                        <label for="vendorType" class="col-lg-3 control-label" id="users-add-label">Vendor Type:</label>
                        <div class="col-lg-9" id="vendorTypeDiv">
                             <s:iterator value="vendorTypeParamList" var="vendorType">
                             	<s:textfield disabled="true" required="true" name="value" cssClass="form-control"/>
                             </s:iterator> 
                             <div class="control-group" id="vendorTypeGroup">
                             	<div class="controls">
                             		<input type="text" name="vendorType_1" value="" id="vendorType_1" class="form-control" style="width:85%; display:inline;"/>
                             		<input type="button" value="-"/> <input type="button" value="+" id="addVendorTypeTextBox"/>
                             	</div>
                             </div>
                        </div>
                    </div>
                    
                    <div class="form-group" id="customerTypeId">
                        <label for="customerType" class="col-lg-3 control-label" id="users-add-label">Customer Type:</label>
                        <div class="col-lg-9" id="customerTypeDiv">
                             <s:iterator value="customerTypeParamList" var="customerType">
                             	<s:textfield disabled="true" required="true" name="value" cssClass="form-control"/>
                             </s:iterator> 
                             <div class="control-group" id="customerTypeGroup">
                             	<div class="controls">
                             		<input type="text" name="customerType_1" value="" id="customerType_1" class="form-control" style="width:85%; display:inline;"/>
                             		<input type="button" value="-"/> <input type="button" value="+" id="addCustomerTypeTextBox"/>
                             	</div>
                             </div>
                        </div>
                    </div>
                    
                    <div class="form-group" id="orderPortId">
                        <label for="orderPort" class="col-lg-3 control-label" id="users-add-label">Ports:</label>
                        <div class="col-lg-9" id="orderPortDiv">
                             <s:iterator value="portsParamsList" var="orderPort">
                             	<s:textfield disabled="true" required="true" name="value" cssClass="form-control"/>
                             </s:iterator> 
                             <div class="control-group" id="orderPortGroup">
                             	<div class="controls">
                             		<input type="text" name="orderPort_1" value="" id="orderPort_1" class="form-control" style="width:85%; display:inline;"/>
                             		<input type="button" value="-"/> <input type="button" value="+" id="addOrderPortTextBox"/>
                             	</div>
                             </div>
                        </div>
                    </div>

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
 
$(document).ready(function() {
	
   var vendorClassCounter = $("#vendorClassGroup").length + 1;
  $("#addVendorClassTextBox").click(function() {
	   var fieldWrapper = $("<div class=\"control-group \" id=\"vendorClassGroup\"><div class=\"controls\"></div></div>");
	   var textField = "<input type=\"text\" name=\"vendorClass_"+vendorClassCounter+"\" value=\"\" id=\"vendorClass_"+vendorClassCounter+"\" class=\"form-control\" style=\"width: 85%; display: inline;\" />\n";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });
	   //var addButton = $("<input type=\"button\" value=\"+\" id=\"add\"/>");

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
			  msg=$('#vendorClass_' + i).val();
		  else
			  msg += ", " + $('#vendorClass_' + i).val();
		}
        document.forms[0].vendorClassAdded.value = msg;
        
		var msg = '';
		for(i=1; i<vendorTypeCounter; i++){
		  if (i==1)
			  msg=$('#vendorType_' + i).val();
		  else
			  msg += ", " + $('#vendorType_' + i).val();
		}
        document.forms[0].vendorTypeAdded.value = msg;
        
		var msg = '';
		for(i=1; i<customerTypeCounter; i++){
		  if (i==1)
			  msg=$('#customerType_' + i).val();
		  else
			  msg += ", " + $('#customerType_' + i).val();
		}
        document.forms[0].customerTypeAdded.value = msg;
        
		var msg = '';
		for(i=1; i<orderPortCounter; i++){
		  if (i==1)
			  msg=$('#orderPort_' + i).val();
		  else
			  msg += ", " + $('#orderPort_' + i).val();
		}
        document.forms[0].portsAdded.value = msg;
        document.forms[0].action = "editGeneralSettings";
        document.forms[0].submit();
	});
	    
	});
</script>
