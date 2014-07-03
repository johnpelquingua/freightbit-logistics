<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $("#checkAll").click(function () {
            if (this.checked) {
                $(".selectIt").each(function () {
                    this.checked = true;
                });
            } else {
                $(".selectIt").each(function () {
                    this.checked = false;
                });
            }
        });
        $("#selectedGroupId").change(function () {
            document.forms[0].action = "loadEditPermissions";
            document.forms[0].submit();
        });
        $("#selectedUserId").change(function () {
            document.forms[0].action = "loadEditPermissions";
            document.forms[0].userChanged.value = "true";
            document.forms[0].submit();
        });
        $("#moveToSelected").click(function () {
            var sel = $(".selectIt:checked ").map(function () {
                return this.value;
            }).get();
            document.forms[0].selectedIds.value = sel;
            document.forms[0].action = "addSelectedPermissions";
            document.forms[0].submit();
        });
        $("#checkAll2").click(function () {
            if (this.checked) {
                $(".selectedPermCheckbox").each(function () {
                    this.checked = true;
                });
            } else {
                $(".selectedPermCheckbox").each(function () {
                    this.checked = false;
                });
            }
        });
        $("#removeFromSelected").click(function () {
            var sel = $(".selectedPermCheckbox:checked ").map(function () {
                return this.value;
            }).get();
            document.forms[0].removedIds.value = sel;
            document.forms[0].action = "removeSelectedPermissions";
            document.forms[0].submit();
        });
    });
</script>
<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Permissions</h1>

    <!-- MAIN BOX -->
    <s:if test="hasActionMessages()">
    <div class="row alert alert-success alert-dismissable">
        <s:actionmessage/>
    </div>
    </s:if>

    <div class="main-box">
        <div class="col-md-12">


            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="includes/images/groups.png" class="box-icon">
                    <span class="booking panel-title">Manage Permissions</span>

                </div>

                <div class="panel-body" style="padding:0px 15px 15px 15px;">
                    <div class="table-responsive list-table">
                        <s:form id="permissionsList" cssClass="form-horizontal" action="editPermission"
                                theme="bootstrap">

                        <div class="panel booking panel-info" style="width:45%;float:left;margin:6px;">
                            <div class="booking panel-heading">
                                <img src="includes/images/listofusers.png" class="box-icon">
                                <span class="booking panel-title">List of Permissions</span>

                            </div>
                            <div class="panel-body">
                                <div class="table-responsive list-table">
                                    <table class="table table-striped table-bordered text-center" id="customer-list">
                                        <thead>
                                        <tr class="header_center">
                                            <th class="tb-font-black"><input id="checkAll" name="checkAll"
                                                                             class="checkAll" type="checkbox"/></th>
                                            <th class="tb-font-black">Permissions</th>
                                        </tr>
                                        </thead>
                                        <tbody id="allPermissions">
                                        <s:iterator value="permissions" var="permission" status="rowStatus">
                                            <tr id="<s:property value="permissionId"/>">
                                                <td class="tb-font-black"><input id="selectIt" class="selectIt"
                                                                                 name="selectIt" type="checkbox"
                                                                                 value="<s:property value="permissionId"/>"/>
                                                </td>
                                                <td class="tb-font-black"><s:property value="permissionName"/></td>
                                            </tr>
                                        </s:iterator>
                                        <input type="hidden" name="selectedIds" id="selectedIds"/>
                                        </tbody>
                                    </table>
                                        <span class="pull-right">
                                            <a href="javascript:void(0);" class="icon-action-link" id="moveToSelected">
                                                <img src="includes/images/check-16.png"
                                                     style="border-radius:6px; border:2px solid #707070; padding:2px;">
                                            </a>
                                        </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group"
                             style="float:right;width:48.5%;margin-bottom:5px;margin-right:-10px;margin-top:5px">
                            <label for="groupSearch" class="col-sm-2 control-label" id="groups-add-label">
                                Group:</label>

                            <div class="col-sm-10">
                                <s:select id="selectedGroupId" list="groupList" cssClass="form-control"
                                          name="selectedGroupId" listKey="groupId" listValue="name"
                                          value="selectedGroupId"/>
                            </div>
                        </div>

                        <div class="form-group" style="float:right;width:48.5%;margin-bottom:5px;margin-right:-10px;">
                            <label for="userSearch" class="col-sm-2 control-label" id="groups-add-label"> User:</label>

                            <div class="col-sm-10">
                                <s:select id="selectedUserId" cssClass="form-control" list="userList"
                                          name="selectedUserId" listKey="userId" listValue="firstName"
                                          value="selectedUserId"/>
                                <input type="hidden" name="userChanged" id="userChanged"/>
                            </div>
                        </div>


                        <div class="panel booking panel-info" style="width:45%;float:right;margin:6px;">
                            <div class="booking panel-heading">
                                <img src="includes/images/listofusers.png" class="box-icon">
                                <span class="booking panel-title">Selected Permissions</span>

                            </div>
                            <div class="panel-body">
                                <div class="table-responsive list-table">
                                    <table class="table table-striped table-bordered text-center" id="customer-list">
                                        <thead>
                                        <tr class="header_center">
                                            <th class="tb-font-black"><input id="checkAll2" name="checkAll2"
                                                                             class="checkAll2" type="checkbox"/></th>
                                            <th class="tb-font-black">Permissions</th>
                                        </tr>
                                        </thead>
                                        <tbody id="selectedPermissions">
                                        <s:iterator value="selectedPermissions" var="selectedPermission"
                                                    status="rowStatus">
                                            <tr id="<s:property value="permissionId"/>">
                                                <td class="tb-font-black"><input id="selectedPermCheckbox"
                                                                                 class="selectedPermCheckbox"
                                                                                 name="selectedPermCheckbox"
                                                                                 type="checkbox"
                                                                                 value="<s:property value="permissionId"/>"/>
                                                </td>
                                                <td class="tb-font-black"><s:property value="permissionName"/></td>
                                            </tr>
                                        </s:iterator>
                                        <input type="hidden" name="removedIds" id="removedIds"/>
                                        </tbody>
                                    </table>
                                        <span class="pull-right">
                                            <a href="javascript:void(0);" class="icon-action-link"
                                               id="removeFromSelected">
                                                <img src="includes/images/x-16.png"
                                                     style="border-radius:6px; border:2px solid #707070; padding:2px;">
                                            </a>
                                        </span>
                                </div>
                            </div>
                        </div>


                        <!-- END OF TABLE-->


                    </div>


                </div>

                <div>
                    <a href="viewPermissions" class="btn btn-default pull-right" id="groups-add-btn"
                       style="margin:20px 0px 6px 6px;">Cancel</a>
                    <!--	<s:submit cssClass="btn btn-default pull-right" name="submit" value="Save" cssStyle="margin:20px 10px 6px 6px;" />-->
                    <s:url var="editPermissionUrl" action="editPermission" escapeAmp="false">
                        <s:param name="selectedGroupId" value="selectedGroupId"/>
                        <s:param name="selectedUserId" value="selectedUserId"/>
                    </s:url>
                    <a href="<s:url value='%{editPermissionUrl}' />" class="btn btn-default pull-right"
                       id="groups-add-btn" style="margin:20px 10px 6px 6px;">Save</a>
                </div>
                </s:form>

            </div>

        </div>

    </div>

    <!-- SIDBAR GOES HERE -->
    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="includes/images/chat.png" class="box-icon">
                <span class="panel-title">Online Chat</span>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                </div>
            </div>
        </div>
    </div>


    <!-- END OF MAIN BOX -->


    <!-- END OF THE MIDDLE -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="includes/js/bootstrap.min.js"></script>