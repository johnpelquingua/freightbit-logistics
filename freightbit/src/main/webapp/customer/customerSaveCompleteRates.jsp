<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 6/23/14
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Rates Module</h1>

    <div class="row alert alert-success alert-dismissable" style="margin-left: -40px !important;  width: 101%;">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Success!</strong> The data has been successfully saved.
    </div>

    <div class="col-md-12">
        <div class="panel panel-info">

            <div class="panel-heading">

                <img src="includes/images/listofusers.png" class="box-icon"/> <span
                    class="panel-title">List of Rates</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black">Origin</th>
                            <th class="tb-font-black">Destination</th>
                            <th class="tb-font-black">Rate</th>
                            <th class="tb-font-black">Rate Type</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="rates" var="rate">
                            <tr>
                                <td class="tb-font-black"><s:property value="origin"/></td>
                                <td class="tb-font-black"><s:property value="destination"/></td>
                                <td class="tb-font-black"><s:property value="rate"/></td>
                                <td class="tb-font-black"><s:property value="rateType"/></td>
                                <td>

                                    <s:url var="loadEditRatesUrl" action="loadEditRates">
                                        <s:param name="ratesIdParam" value="%{customerRateId}"></s:param>
                                    </s:url>
                                    <s:a href="%{loadEditRatesUrl}" class="icon-action-link" rel="tooltip"
                                         title="Edit this Vendor Address"><img src="includes/images/edit-user.png"
                                                                               class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteRatesUrl" action="deleteRates">
                                        <s:param name="ratesIdParam" value="%{customerRateId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteRatesUrl}" rel="tooltip"
                                         title="Delete this Vendor Address"
                                         onclick="return confirm('Do you really want to delete?');"><img
                                            src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="panel-footer">

                <ul class="pagination">
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li class="disabled"><a href="#">&raquo;</a></li>
                </ul>

            <span class="pull-right">
                <s:url var="loadAddRatesUrl" action="loadAddRates">
                    <s:param name="customerIdParam" value="customerIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddRatesUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>
        </div>
    </div>
</div>

