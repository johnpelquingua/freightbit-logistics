<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <s:form action="User-List-Info" theme="bootstrap" cssClass="form-horizontal">
    <h1 class="page-header">Edit <em>'<s:property value="users[1].name"></s:property>'</em></h1>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">

                <div class="panel-heading">
                    <img src="../includes/images/listofusers.png" class="box-icon"/>
						<span class="panel-title">Edit User</h3>
                </div>

                <div class="panel-body">


                    <div class="form-group">

                        <label for="uType" class="col-sm-2 control-label">User Type:</label>

                        <div class="col-sm-10">
                            <s:select name="uType" id="uType" list="userType" cssClass="form-control"/>
                        </div>

                    </div>
                    <div class="form-group">

                        <label for="uName" class="col-sm-2 control-label">Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uName" name="uName"
                                         placeholder="Name"></s:textfield>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="uCompanyName" class="col-sm-2 control-label">Company:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uCompanyName" name="uCompanyName"
                                         placeholder="Company Name"></s:textfield>
                        </div>
                    </div>

                    <div class="form-group">

                        <label for="uUserName" class="col-sm-2 control-label">User Name:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uUserName" name="uUserName"
                                         placeholder="User Name"></s:textfield>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="uPassword" class="col-sm-2 control-label">Password:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uPassword" name="uPassword"
                                         placeholder="Password"></s:textfield>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="uTitle" class="col-sm-2 control-label">Title:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uTitle" name="uTitle"
                                         placeholder="Title"></s:textfield>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="uEmailAddress" class="col-sm-2 control-label">Email Address:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uEmailAddress" name="uEmailAddress"
                                         placeholder="Email Address"></s:textfield>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="uContactNumber" class="col-sm-2 control-label">Contact Number:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uContactNumber" name="uContactNumber"
                                         placeholder="Contact Number"></s:textfield>
                        </div>

                    </div>

                    <div class="form-group">

                        <label for="uStatus" class="col-sm-2 control-label">Status:</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" id="uStatus" name="uStatus"
                                         placeholder="Status"></s:textfield>
                        </div>

                    </div>


                </div>

            </div>

            <div class="btn-group" style="float: right;">
                <button class="btn btn-default" onclick="location.href='User-Save-Complete'">Save</button>
                <button class="btn btn-default" onclick="location.href='User-List'">Cancel</button>
            </div>
            </s:form>
        </div>

    </div>

    <script>

        $("#shipping-option").hide();
        $("#trucking-option").hide();
        $("#selectType").hide();
        $('#edit').show();
        $('#controls').hide();

        $('#target :input').prop("disabled", true);
        $('#target2 :input').prop("disabled", true);
        $('#target3 :input').prop("disabled", true);

        function EventChanged(selectEl) {

            var text = selectEl.options[selectEl.selectedIndex].text;

            if (text == "Shipping") {
                $("#shipping-option").show();
                $("#trucking-option").hide();
                $("#selectType").hide();
            } else if (text == "Trucking") {
                $("#shipping-option").hide();
                $("#trucking-option").show();
                $("#selectType").hide();
            } else {
                $("#shipping-option").hide();
                $("#trucking-option").hide();
                $("#selectType").hide();
            }
        }

        $('#cancel').click(function () {
            $('#target :input').prop("disabled", true);
            $('#target2 :input').prop("disabled", true);
            $('#target3 :input').prop("disabled", true);
            $("#shipping-option").hide();
            $("#trucking-option").hide();
            $("#selectType").hide();
            $('#edit').show();
            $('#controls').hide();
        });

        $('#edit').click(function () {
            $('#target :input').prop("disabled", false);
            $('#target2 :input').prop("disabled", false);
            $('#target3 :input').prop("disabled", false);
            $("#trucking-option").show();
            $('#controls').show();
            $('#edit').hide();
        });

    </script>

