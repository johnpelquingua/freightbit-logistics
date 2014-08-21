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
                    <s:hidden name="user.userId" value="%{user.userId}"/>

                    <div class="form-group" id="vendorClassId">
                        <label for="vendorClass" class="col-lg-3 control-label" id="users-add-label">Vendor Class:</label>
                        <div class="col-lg-9" id="vendorClassDiv">
                             <s:iterator value="vendorClassParamList" var="vendorClass">
                             	<s:textfield disabled="true" required="true" name="value" cssClass="form-control"/>
                             </s:iterator> 
                        </div>
                        <a href="#" class="btn btn-default" id="add">+</a>
                    </div>
                    

                </div>
            </div>

            <div class="panel-footer">
                   <span class="pull-right">
                     <a href="loadGeneralSettings" class="btn btn-default" id="save">Cancel</a>
                     <s:submit cssClass="btn btn-info" name="submit" value="Save" />
                   </span>
            </div>

            </s:form>
        </div>
    </div>
</div>


<script type="text/javascript">
 
$(document).ready(function() {
	
    var counter = $("#control-group").length + 1;

  $("#add").click(function() {
	    var fieldWrapper = $("<div class=\"control-group \" id=\"control-group\"><div class=\"controls\"></div></div>");
		 	var textField = "<input type=\"text\" name=\"value_"+counter+"\" value=\"\" id=\"textbox"+counter+"\" class=\"form-control\" style=\"width: 93%; display: inline;\" />";
	   var removeButton = $("<input type=\"button\" value=\"-\" />");
	        removeButton.click(function() {
	            $(this).parent().remove();
	        });
	    fieldWrapper.append(textField).append(removeButton);
	$("#vendorClassDiv").append(fieldWrapper);
     counter++;
	});
  
  $("#save").click(function() {
		var msg = '';
		for(i=1; i<counter; i++){
	   	  msg += "\n Textbox #" + i + " : " + $('#textbox' + i).val();
		}
	    alert(msg);
	});
	    
	});
</script>
