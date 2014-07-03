<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<!-- MIDDLE -->
<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Permissions</h1>

    <!-- MAIN BOX -->

    <div class="main-box">			
        <div class="col-md-12">
            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="includes/images/listofusers.png" class="box-icon">
                    <span class="booking panel-title">List of Permissions</span>
                </div>
                <div class="panel-body">
                    <div class="table-responsive list-table">
                        <table class="table table-striped table-bordered text-center" id ="groups-list">
                            <thead>
                                <tr class="header_center">
                                    <!--<th class="tb-font-black"><input type="checkbox" /></th>-->
                                    <th class="tb-font-black">Permissions</th>
                                    <th class="tb-font-black">Users/Groups</th>
                                    <th class="tb-font-black">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <s:iterator value="permissions" var="permission" status="rowStatus">
                                    <tr>
                                        <!--<th class="tb-font-black"><input type="checkbox" /></th>-->
                                        <td class="tb-font-black"><s:property value="permissionName"/></td>
                                        <td class="tb-font-black" align="center"><s:property value="userGroups"/></td>
                                        <td class="tb-font-black">
                                            <a href="<s:url value='loadEditPermissions' />" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                                        </td>
                                    </tr>
                                </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel-footer">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>

                    <span class="pull-right">
                        <a href="<s:url value='loadEditPermissions' />" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                    </span>
                </div>		  	
            </div>
        </div>
    </div>	

    <!-- SIDBAR GOES HERE -->
    <div class="sidebar-box">
        <div class="panel panel-info">
           <!--  <div class="panel-heading">
                <img src="includes/images/chat.png" class="box-icon">
                <span class="panel-title">Online Chat</span>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                </div>
            </div> -->
        </div> 
    </div>	
</div>



<!--<span class="pull-right">
                                        <a href="groups-add.html" class="icon-action-link"><img src="includes/images/add-user.png" class="icon-action circ-icon"> </a>
                                        </span>-->

<!-- END OF MAIN BOX -->



<!-- END OF THE MIDDLE -->

</div>
</div>
</div>
--%>



<div class="row">
    <div class="col-lg-12">
        <h1>Accounts Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-user"></i> Accounts</li>
            <li class="active"><i class="fa fa-group"></i> Group</li>

            <li class="active"><i class="fa fa-list"></i> Permissions</li>
        </ol>

    </div>
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Permissions</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">

                    <tbody>
                        <table>
                            <tr>
                                <display:table id="permission" name="permissions" requestURI="/viewUsers.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter" style="margin-top: 15px;">
                                    <td><display:column property="permissionName" title="Permissions" class="tb-font-black"/></td>
                                    <td><display:column property="userGroups" title="Users/Groups" class="tb-font-black"/></td>
                                    <td class="tb-font-black">
                                        <display:column title="Actions">
                                            <a href="<s:url value='loadEditPermissions' />" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                                        </display:column>
                                    </td>
                                </display:table>
                            </tr>
                        </table>
                    </tbody>

                </div>
            </div>

            <div class="panel-footer">

                <span class="pull-right">
                    <a href="<s:url value='loadEditPermissions' />" class="icon-action-link"><img src="includes/images/edit-user.png" class="icon-action circ-icon"> </a>
                </span>

            </div>
        </div>
    </div>
</div><!-- /.row -->


