<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row" style="margin-top:-15px;">

    <h1><i class="fa fa-truck"></i> Inland Freight Operations</h1>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Inland Freight Operations

                    </h3>
                </div>

                <div class="panel-body">
                    <s:hidden value="%{orderNoParam}" />
                    <div class="table-responsive">
                        <display:table id="orderItem" name="orderItems"
                                       requestURI="/viewSeaFreightItemList.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter"
                                       style="margin-top: 15px;">

                            <td><display:column property="nameSize" title="Name <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="status" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column title="Action">
                                <s:url var="viewFreightPlanningUrl" action="viewFreightPlanning">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderItem.orderItemId">
                                            </s:param>
                                    <s:param name="orderNoParam"
                                             value="orderNoParam">
                                             </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewFreightPlanningUrl}" rel="tooltip"
                                     title="Update Status">
                                    <img src="../includes/images/edit-user.png" class="icon-action circ-icon">
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
</div>