<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Permissions</h1>

    <!-- MAIN BOX -->

    <div class="main-box">
        <div class="col-md-12">


            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="../includes/images/groups.png" class="box-icon">
                    <span class="booking panel-title">Manage Permissions</span>

                </div>

                <div class="panel-body" style="padding:0px 15px 15px 15px;">
                    <div class="table-responsive list-table">
                        <s:form cssClass="form-horizontal" action="Customer-List" theme="bootstrap">

                        <div class="panel booking panel-info" style="width:45%;float:left;margin:6px;">
                            <div class="booking panel-heading">
                                <img src="../includes/images/listofusers.png" class="box-icon">
                                <span class="booking panel-title">List of Permissions</span>

                            </div>
                            <div class="panel-body">
                                <div class="table-responsive list-table">
                                    <table class="table table-striped table-bordered text-center" id="customer-list">
                                        <thead>
                                        <tr class="header_center">
                                            <th class="tb-font-black"><s:checkbox name="inlineCheckbox1"/></th>
                                            <th class="tb-font-black">Permissions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="tb-font-black"><s:checkbox name="inlineCheckbox2"/></td>
                                            <td class="tb-font-black">Admin System</td>
                                        </tr>
                                        <tr>
                                            <td class="tb-font-black"><s:checkbox name="inlineCheckbox3"/></td>
                                            <td class="tb-font-black">Create New Booking</td>
                                        </tr>
                                        <tr>
                                            <td class="tb-font-black"><s:checkbox name="inlineCheckbox4"/></td>
                                            <td class="tb-font-black">Add Customer</td>
                                        </tr>
                                        <tr>
                                            <td class="tb-font-black"><s:checkbox name="inlineCheckbox5"/></td>
                                            <td class="tb-font-black">Add Vendor</td>
                                        </tr>
                                        </tbody>
                                    </table>
							<span class="pull-right">
								<a href="#" class="icon-action-link">
                                    <img src="../includes/images/check-16.png"
                                         style="border-radius:6px; border:2px solid #707070; padding:2px;">
                                </a>
								<a href="#" class="icon-action-link">
                                    <img src="../includes/images/x-16.png"
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
                                <s:select list="group" cssClass="form-control" name="permission-group"/>
                            </div>
                        </div>

                        <div class="form-group" style="float:right;width:48.5%;margin-bottom:5px;margin-right:-10px;">
                            <label for="userSearch" class="col-sm-2 control-label" id="groups-add-label"> User:</label>

                            <div class="col-sm-10">
                                <s:select cssClass="form-control" list="user" name="permission-user"/>
                            </div>
                        </div>


                        <div class="panel booking panel-info" style="width:45%;float:right;margin:6px;">
                            <div class="booking panel-heading">
                                <img src="../includes/images/listofusers.png" class="box-icon">
                                <span class="booking panel-title">Selected Permissions</span>

                            </div>
                            <div class="panel-body">
                                <div class="table-responsive list-table">
                                    <table class="table table-striped table-bordered text-center" id="customer-list">
                                        <thead>
                                        <tr class="header_center">
                                            <th class="tb-font-black"><s:checkbox name="SelectCheckbox1"/></th>
                                            <th class="tb-font-black">Permissions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="tb-font-black"><s:checkbox name="SelectCheckbox2"/></td>
                                            <td class="tb-font-black">Create New Booking</td>
                                        </tr>
                                        <tr>
                                            <td class="tb-font-black"><s:checkbox name="SelectCheckbox3"/></td>
                                            <td class="tb-font-black">Add Customer</td>
                                        </tr>
                                        </tbody>
                                    </table>
							<span class="pull-right">
								<a href="#" class="icon-action-link">
                                    <img src="../includes/images/x-16.png"
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
                    <a href="permissions-edit.html" class="btn btn-default pull-right" id="groups-add-btn"
                       style="margin:20px 0px 6px 6px;">Cancel</a>

                    <a href="<s:url value='' />" class="btn btn-default pull-right" id="groups-add-btn"
                       style="margin:20px 10px 6px 6px;">Save</a>
                </div>
                </s:form>

            </div>

        </div>

    </div>

    <!-- SIDBAR GOES HERE -->
    <div class="sidebar-box">
        <div class="panel panel-info">
            <div class="panel-heading">
                <img src="../includes/images/chat.png" class="box-icon">
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
