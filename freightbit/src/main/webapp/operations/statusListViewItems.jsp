<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">
        <h1>Update Status</h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i>Status List</li>
            <li class="active"><i class="fa fa-male"></i>Status List Items / Containers</li>
        </ol>

    </div>
</div><!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i>List of Items of MTY-0001</h3>
            </div>

            <div class="panel-body">
				
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-center">
						<thead>
							<tr class="header_center active">
							  <th class="tb-font-black"><input type="checkbox"></th>
							  <th class="tb-font-black">Item Name</th>
							  <th class="tb-font-black">Status</th>
							  <th class="tb-font-black">Service Requirement</th>
							  <th class="tb-font-black">Service Mode</th>
							  <th class="tb-font-black">Action</th>
							</tr>
						</thead>
						<tbody>
							<tr class="success">
							  <td class="tb-font-black"><input type="checkbox"></td>
							  <td class="tb-font-black">Rock</td>
							  <td class="tb-font-black">SHIPPING</td>
							  <td class="tb-font-black">FCL</td>
							  <td class="tb-font-black">Door to Door</td>
							  <td class="tb-font-black">
								<a href="updateStatus.html" class="icon-action-link edit-booking">
                                    <img src="../includes/images/edit-booking.png" class="icon-action circ-icon" title="Edit Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                                </a>
                                <a href="#delete-Schedule" class="icon-action-link delete-booking">
                                    <img src="../includes/images/delete-sched.png" class="icon-action circ-icon" title="Delete Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                                </a>
							  </td>
							</tr>
							
							<tr class="success">
                              <td class="tb-font-black"><input type="checkbox"></td>
                              <td class="tb-font-black">Rock</td>
                              <td class="tb-font-black">SHIPPING</td>
                              <td class="tb-font-black">FCL</td>
                              <td class="tb-font-black">Door to Door</td>
                              <td class="tb-font-black">
                            	<a href="updateStatus.html" class="icon-action-link edit-booking">
                                    <img src="../includes/images/edit-booking.png" class="icon-action circ-icon" title="Edit Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                                </a>
                                <a href="#delete-Schedule" class="icon-action-link delete-booking">
                                    <img src="../includes/images/delete-sched.png" class="icon-action circ-icon" title="Delete Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                                </a>
                              </td>
                            </tr>

                            <tr class="success">
                              <td class="tb-font-black"><input type="checkbox"></td>
                              <td class="tb-font-black">Rock</td>
                              <td class="tb-font-black">SHIPPING</td>
                              <td class="tb-font-black">FCL</td>
                              <td class="tb-font-black">Door to Door</td>
                              <td class="tb-font-black">
                            	<a href="updateStatus.html" class="icon-action-link edit-booking">
                                    <img src="../includes/images/edit-booking.png" class="icon-action circ-icon" title="Edit Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                                </a>
                                <a href="#delete-Schedule" class="icon-action-link delete-booking">
                                    <img src="../includes/images/delete-sched.png" class="icon-action circ-icon" title="Delete Schedule"
                                    style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;">
                                </a>
                              </td>
                            </tr>
											
						</tbody>
					</table>
				</div>
				



            </div>

            <div class="panel-footer">
                                <ul class="pagination">
                                    <li><a href="#">&laquo;</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="booking2.html">2</a></li>
                                    <li><a href="booking2.html">&raquo;</a></li>
                                </ul>

            							<span class="pull-right">
            							<a href="vessel-schedule-add.html" class="icon-action-link"><img
                                                src="../includes/images/add-sched.png" class="icon-action circ-icon"> </a>
            							</span>
                            </div>

        </div>
    </div>
</div><!-- /.row -->