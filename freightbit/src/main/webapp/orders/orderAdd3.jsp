<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row setup-content" id="step-3">
<div class="col-xs-12">
<div class="col-md-12 well text-center">
<h1 class="text-center"> STEP 3</h1>
<div id="3rdPart">

<s:form cssClass="form-horizontal" theme="bootstrap" action="addItemsInTable" >


<div class="form-group" style="padding-top: 25px;">

    <s:if test="%{REQ == 'FULL CARGO LOAD'}">

        <label class="col-lg-2 col-lg-offset-1 control-label" for="orderItem.quantity" style="margin-top: 5px;">
            Container Quantity:
        </label>

        <div class="col-lg-3" >
            <%--<s:select cssClass="form-control"
                      style="margin-bottom: 15px !important;"
                      id="orderItem.quantity"
                      name="orderItem.quantity"
                      list="containerQuantity"
                      emptyOption="true"

                    />--%>

        </div>

    </s:if>

    <s:else >

        <label class="col-lg-2 col-lg-offset-1 control-label" for="orderItem.quantity" style="margin-top: 5px;">
            Item Quantity:
        </label>

        <div class="col-lg-3" >
           <%-- <s:select cssClass="form-control"
                      style="margin-bottom: 15px !important;"
                      id="item_quantity"
                      name="orderItem.quantity"
                      list="itemQuantity"
                      emptyOption="true"
                    />--%>
        </div>

    </s:else>

    <s:if test="%{REQ == 'FULL CARGO LOAD'}">

        <label class="col-lg-2 control-label" for="orderItem.nameSize" style="margin-top: 5px;">
            Container Size:
        </label>

        <div class="col-lg-3" >
            <s:select cssClass="form-control"
                      style="margin-bottom: 15px !important;"
                      id="orderItem.nameSize"
                      name="orderItem.nameSize"
                      list="containerList"
                      listKey="key"
                      listValue="value"
                      emptyOption="true"
                      value="%{orderItem.nameSize}"
                    />
        </div>

    </s:if>

    <s:else >

        <label class="col-lg-2 control-label" for="orderItem.nameSize" style="margin-top: 5px;">
            Item Name:
        </label>

        <div class="col-lg-3" >
            <s:select cssClass="form-control"
                      style="margin-bottom: 15px !important;"
                      id="name_Size"
                      name="orderItem.nameSize"
                      list="customerItems"
                      listKey="customerItemsId"
                      listValue="itemName"
                      emptyOption="true"
                      value="%{orderItem.nameSize}"
                    />
        </div>

    </s:else>

</div>

<div class="form-group" style="padding-top: 25px;">

    <label class="col-lg-2 col-lg-offset-1 control-label" for="orderItem.weight" style="margin-top: 5px;">
        Weight:
    </label>

    <div class="col-lg-3" >
        <s:textfield cssClass="form-control step3"
                     name="orderItem.weight"
                     id="orderItem.weight"
                     value="%{orderItem.weight}"
                     style="margin-bottom: 15px !important;"
                />
    </div>

    <label class="col-lg-2 control-label" for="orderItem.volume" style="margin-top: 5px;">
        Volume:
    </label>
    <div class="col-lg-3" >
            <%--<s:select cssClass="form-control step3"
                        id="volume"
                        name="orderItem.volume"
                        value="%{orderItem.volume}"
                        style="margin-bottom: 15px !important;"
                        list="{'Select Volume'}"
                        />--%>
        <s:textfield cssClass="form-control step3"
                     name="orderItem.volume"
                     id="orderItem.volume"
                     style="margin-bottom: 15px !important;" />

    </div>

</div>

<div class="form-group" style="padding-top: 25px;">

    <label class="col-lg-2 col-lg-offset-1 control-label" for="orderItem.classification" style="margin-top: 5px;">
        Classification:
    </label>

    <div class="col-lg-3" >
        <s:textfield cssClass="form-control step3"
                     name="orderItem.classification"
                     id="orderItem.classification"
                     style="margin-bottom: 15px !important;" />

    </div>

    <label class="col-lg-2 control-label" for="orderItem.description" style="margin-top: 5px;">
        Commodity:
    </label>

    <div class="col-lg-3" >

        <s:if test="%{REQ == 'FULL CARGO LOAD'}">
            <s:textfield cssClass="form-control step3"
                         name="orderItem.description"
                         id="description"
                         value="%{orderItem.description}"
                         style="margin-bottom: 15px !important;"
                    />
        </s:if>

        <s:else >
            <%--<s:select cssClass="form-control step3"
                         name="orderItem.description"
                         id="description"
                         value="%{orderItem.description}"
                         style="margin-bottom: 15px !important;"

                         list="{'Select Description'}"
                    />--%>
            <s:textfield cssClass="form-control step3"
                         name="orderItem.description"
                         id="orderItem.description"

                         style="margin-bottom: 15px !important;" />

        </s:else>

    </div>

</div>

<div class="form-group" style="padding-top: 25px;">

    <label class="col-lg-2 col-lg-offset-1 control-label" for="orderItem.rate" style="margin-top: 5px;">
        Rate:
    </label>
    <div class="col-lg-3" >
        <s:textfield cssClass="form-control step3"
                     id="orderItem.rate"
                     name="orderItem.rate"
                     value="%{orderItem.rate}"
                     style="margin-bottom: 15px !important;" />


    </div>

    <label class="col-lg-2 control-label" for="orderItem.declaredValue" style="margin-top: 5px;">
        Declared Value:
    </label>
    <div class="col-lg-3" >
        <s:if test="%{REQ == 'FULL CARGO LOAD'}">
            <s:textfield cssClass="form-control step3"
                         name="orderItem.declaredValue"
                         id="orderItem.declaredValue"
                         value="%{orderItem.declaredValue}"
                         style="margin-bottom: 15px !important;"
                    />
        </s:if>

        <s:else >
            <%--<s:select cssClass="form-control step3"
                         name="orderItem.declaredValue"
                         id="declaredValue"
                         value="%{orderItem.declaredValue}"
                         style="margin-bottom: 15px !important;"

                         list="{'Select Value'}"
                    />--%>
            <s:textfield cssClass="form-control step3"
                         id="orderItem.declaredValue"
                         name="orderItem.declaredValue"
                         value="%{orderItem.rate}"
                         style="margin-bottom: 15px !important;" />

        </s:else>

    </div>

</div>

<div class="form-group" style="padding-top: 25px;">

    <label class="col-lg-2 col-lg-offset-1 control-label" for="orderItem.remarks" style="margin-top: 5px;">
        Comments:
    </label>
    <div class="col-lg-3" >
        <s:textarea cssClass="form-control step3"
                    name="orderItem.remarks"
                    id="orderItem.remarks"
                    value="%{orderItem.remarks}"
                    style="margin-bottom: 15px !important; resize: none"
                />


    </div>

</div>

<s:submit name="submit"  cssClass="btn btn-primary btn-lg" value="Add Item" />
<%--<button id="addItemsInTable" name="submit" class="btn btn-primary btn-lg" style="float:right;">Add Item</button>--%>
</s:form>

<s:form cssClass="form-horizontal" theme="bootstrap" action="orderAddFinal" >

    <div class="panel-body">
        <div class="table-responsive list-table">
            <table class="table table-striped table-bordered text-center" id="customer-list">
                <thead>
                <tr class="header_center">
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

                            <s:url var="deleteItemUrl" action="deleteItem">
                                <s:param name="customersItemIdParam" value="%{customerItemsId}"></s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{deleteItemUrl}" rel="tooltip"
                                 title="Delete this Item?"
                                 onclick="return confirm('Do you really want to delete?');">
                                <img src="includes/images/remove-user.png" class="icon-action circ-icon">
                            </s:a>

                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>

    <s:submit name="submit"  cssClass="btn btn-primary btn-lg" value="Create Booking" />

</s:form>

</div>
</div>
</div>
</div>
