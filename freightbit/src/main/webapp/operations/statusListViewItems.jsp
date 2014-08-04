<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Update Status</h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-list"></i> On Going Booking List</li>
            <li class="active"><i class="fa fa-file-text"></i> Status List Items / Containers</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i>List of Items of <s:property value="%{orderNoParam}"/> </h3>
            </div>

            <div class="panel-body">

                <div class="table-responsive">
                    <display:table id="orderItem" name="orderItems"
                                   requestURI="/viewStatusListItems.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                   style="margin-top: 15px;">

                        <td><display:column property="nameSize" title="Name" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column property="status" title="Status" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>

                        <td><display:column title="Action">
                            <s:url var="viewStatusListItemsUrl" action="viewStatusListItems">
                                <s:param name="orderIdParam"
                                         value="#attr.order.orderId"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{viewStatusListItemsUrl}" rel="tooltip"
                                 title="Update Status">
                                <img src="../includes/images/edit-user.png" class="icon-action circ-icon"
                                style="border-radius:25%;">
                            </s:a>

                        </display:column></td>

                    </display:table>
                </div>
            </div>

            <div class="panel-footer">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="booking2.html">2</a></li>
                    <li><a href="booking2.html">&raquo;</a></li>
                </ul>
            </div>

        </div>
    </div>
</div>
<!-- /.row -->