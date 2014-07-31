<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->

        <div class="row">
            <div class="col-md-12">

                <div class="panel booking panel-info">
                  <div class="booking panel-heading">
                    <img src="../includes/images/listofusers.png" class="box-icon">
                    <span class="booking panel-title">List of Customers</span>

                  </div>
                  <div class="panel-body">

                    <div class="table-responsive list-table">
                        <table class="table table-striped table-bordered text-center" id="customer-list">
                          <thead>
                            <tr class="header_center">
                              <th class="tb-font-black">Customer Name</th>
                              <th class="tb-font-black">Customer Type</th>
                              <th class="tb-font-black">Email Address</th>
                              <th class="tb-font-black">Website</th>
                              <th class="tb-font-black">Contact Number</th>
                              <th class="tb-font-black">Action</th>
                            </tr>
                          </thead>
                          <tbody>
                          <s:iterator value="customers" var="customer">
                            <tr>
                                <td class="tb-font-black"><s:property value="customerName" /></td>
                                <td class="tb-font-black"><s:property value="customerType" /></td>
                                <td class="tb-font-black"><s:property value="email" /></td>
                                <td class="tb-font-black"><s:property value="website" /></td>
                                <td class="tb-font-black"><s:property value="phone" /></td>
                                <td>

                                 <s:url var="editCustomerUrl" action="loadEditCustomerPage">
                                     <s:param name="customerCodeParam" value="customerCode"></s:param>
                                 </s:url>
                                 <s:a href="%{editCustomerUrl}" class="icon-action-link" rel="tooltip" title="Edit this Customer"><img src="../includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>

                               <s:url var="deleteCustomerUrl" action="deleteCustomer">
                                     <s:param name="customerCodeParam" value="customerCode"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{deleteCustomerUrl}" rel="tooltip" title="Delete this Customer" onclick="return confirm('Do you really want to delete?');"><img src="../includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>

                               <s:url var="customerInfoUrl" action="customerInfo">
                                     <s:param name="customerCodeParam" value="customerCode"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{customerInfoUrl}" rel="tooltip"><img src="../includes/images/info-b.png" class="icon-action circ-icon"> </s:a>



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
                        <a href="loadAddCustomerPage" class="icon-action-link"><img src="../includes/images/add-user.png" class="icon-action circ-icon"> </a>
                        </span>

                      </div>
                      </div>

            </div>
        </div>
    </div>--%>


<div class="row" style="margin-top:-15px;">
    <div class="col-lg-12">
        <h1>Customer List </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Customer</li>
            <li class="active"><i class="fa fa-list"></i> Customer List</li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" style="position: relative; top: 2px;"><i class="fa fa-list"></i> Customer List
                </h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <%--<table class="table table-striped table-bordered text-center table-hover" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black" style="text-align: center;">Customer Name <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Customer Type <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Email Address <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Website <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Contact Number <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;" >Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="customers" var="customer">
                            <tr>
                                <td class="tb-font-black">
                                    <s:property value="customerName" />
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="customerType" />
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="email" />
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="website" />
                                </td>
                                <td class="tb-font-black">
                                    <s:property value="phone" />
                                </td>
                                <td>
                                    <s:url var="editCustomerUrl" action="loadEditCustomerPage">
                                        <s:param name="customerCodeParam" value="customerCode"></s:param>
                                    </s:url>
                                    <s:a href="%{editCustomerUrl}" class="icon-action-link" rel="tooltip" title="Edit this Customer"><img src="../includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>
                                    <s:url var="deleteCustomerUrl" action="deleteCustomer">
                                        <s:param name="customerCodeParam" value="customerCode"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteCustomerUrl}" rel="tooltip" title="Delete this Customer" onclick="return confirm('Do you really want to delete?');"><img src="../includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                    <s:url var="customerInfoUrl" action="customerInfo">
                                        <s:param name="customerCodeParam" value="customerCode"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{customerInfoUrl}" rel="tooltip"><img src="../includes/images/info-b.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>--%>

                    <tbody>
                    <table>
                        <tr>
                            <display:table id="customer" name="customers" requestURI="/customerList.action"
                                           pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="customerName" title="Customer Name" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="customerType" title="Customer Type" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="email" title="E-mail Address" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="website" title="Website" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="phone" title="Contact Number" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">
                                        <s:url var="editCustomerUrl" action="loadEditCustomerPage">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <s:a href="%{editCustomerUrl}" class="icon-action-link" rel="tooltip"
                                             title="Edit this Customer"><img src="../includes/images/edit-user.png"
                                                                             class="icon-action circ-icon"> </s:a>
                                        <s:url var="deleteCustomerUrl" action="deleteCustomer">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteCustomerUrl}" rel="tooltip"
                                             title="Delete this Customer"
                                             onclick="return confirm('Do you really want to delete?');"><img
                                                src="../includes/images/remove-user.png"
                                                class="icon-action circ-icon"> </s:a>
                                        <s:url var="customerInfoUrl" action="customerInfo">
                                            <s:param name="customerCodeParam"
                                                     value="#attr.customer.customerCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{customerInfoUrl}" rel="tooltip"><img
                                                src="../includes/images/info-b.png" class="icon-action circ-icon"> </s:a>
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
            <a href="loadAddCustomerPage" class="icon-action-link"><img src="../includes/images/add-user.png"
                                                                        class="icon-action circ-icon"> </a>
            </span>
            </div>
        </div>
    </div>
</div>
<!-- /.row -->