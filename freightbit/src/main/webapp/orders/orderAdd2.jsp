<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<fieldset>

    <legend style="text-align: left;">
        <span>
            Cargo Listing
        </span>
    </legend>

    <div class="panel-body">
        <div class="table-responsive list-table">
            <table class="table table-striped table-hover table-bordered text-center tablesorter" id="customer-list">
                <thead>
                <tr class="header_center" style="background-color: #fff;">
                    <th class="tb-font-black">Quantity</th>
                    <th class="tb-font-black">Size</th>
                    <th class="tb-font-black">Weight</th>
                    <th class="tb-font-black">Class</th>
                    <th class="tb-font-black">Commodity</th>
                    <th class="tb-font-black">Value</th>
                    <th class="tb-font-black">Rate</th>
                    <th class="tb-font-black">Comment</th>
                    <th class="tb-font-black">Action</th>
                </tr>
                </thead>
                <tbody>

                <s:iterator value="orderItems" var="orderItem">
                    <tr>
                        <td class="tb-font-black"><s:property value="quantity"/></td>
                        <td class="tb-font-black"><s:property value="nameSize"/></td>
                        <td class="tb-font-black"><s:property value="weight"/></td>
                        <td class="tb-font-black"><s:property value="classification"/></td>
                        <td class="tb-font-black"><s:property value="description"/></td>
                        <td class="tb-font-black"><s:property value="declaredValue"/></td>
                        <td class="tb-font-black"><s:property value="rate"/></td>
                        <td class="tb-font-black"><s:property value="remarks"/></td>

                        <td class="tb-font-black">

                                <%--<s:url var="deleteItemUrl" action="deleteItem">
                                    <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                     title="Delete this Item?"
                                     onclick="return confirm('Do you really want to delete?');">
                                    <img src="includes/images/remove-user.png" class="icon-action circ-icon">
                                </s:a>--%>

                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>

</fieldset>