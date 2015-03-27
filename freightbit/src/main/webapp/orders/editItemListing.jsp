<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-primary" style="margin-bottom: 0px;">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Edit Item Listing </h3>
      </div>
      <div class="panel-body">
        <div class="well" style="margin-top: 10px;">
          <s:form action="editItemListing" theme="bootstrap" cssClass="form-horizontal" >
          <s:hidden name="orderItem.orderItemId" value="%{orderItem.orderItemId}" />
          <s:hidden name="orderItem.vesselScheduleId" value="%{orderItem.vesselScheduleId}" />
          <s:hidden name="orderItem.driverOrigin" value="%{orderItem.driverOrigin}" />
          <s:hidden name="orderItem.driverDestination" value="%{orderItem.driverDestination}" />
          <s:hidden name="orderItem.truckOrigin" value="%{orderItem.truckOrigin}" />
          <s:hidden name="orderItem.truckDestination" value="%{orderItem.truckDestination}" />
          <s:hidden name="orderItem.finalPickupDate" value="%{orderItem.finalPickupDate}" />
          <s:hidden name="orderItem.finalDeliveryDate" value="%{orderItem.finalDeliveryDate}" />
          <s:hidden name="orderItem.vendorOrigin" value="%{orderItem.vendorOrigin}" />
          <s:hidden name="orderItem.vendorDestination" value="%{orderItem.vendorDestination}" />
          <s:hidden name="orderItem.vendorSea" value="%{orderItem.vendorSea}" />
          <s:hidden name="orderItem.serviceRequirement" value="%{orderItem.serviceRequirement}" />
          <s:hidden name="orderItem.containerId" value="%{orderItem.containerId}" />
          <s:hidden name="order.orderId" value="%{order.orderId}"/>

          <div class="form-group">

              <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' ">
                <label class="col-lg-4 control-label" style="padding-top:0px;">Quantity: </label>
                <div class="col-lg-7" >
                  <s:hidden name="orderItem.quantity" value="%{orderItem.quantity}" />
                  <s:select cssClass="form-control" id="orderItem_quantityFCL" list="containerQuantity"
                            emptyOption="true"
                            required="true"
                            onchange="fcl()"
                            disabled="true" />
                </div>
              </s:if>
              <s:else>
                <label class="col-lg-4 control-label" style="padding-top:0px;">Quantity: </label>
                <div class="col-lg-7" >
                  <s:select cssClass="form-control" id="orderItem_quantity" name="orderItem.quantity" list="itemQuantity"
                            emptyOption="true"
                            required="true" />
                </div>
              </s:else>
          </div>
          <div class="form-group">
            <s:if test="order.serviceRequirement == 'FULL CONTAINER LOAD' || order.serviceRequirement=='FCL' ">
            <label class="col-lg-4 control-label" style="padding-top:0px;">Size: </label>
            <div class="col-lg-7" >

                <s:select cssClass="form-control containerSizeDropdown"
                          id="orderItem.nameSize"
                          name="orderItem.nameSize"
                          list="containerList"
                          listKey="key"
                          listValue="value"
                          emptyOption="true"
                          required="true" />
            </div>
            </s:if>
            <s:else>
              <label class="col-lg-4 control-label" style="padding-top:0px;">Name: </label>
              <%--<s:textfield value="%{orderItem.nameSize}" cssClass="nameSizeTextField"/>--%>
              <div class="col-lg-7" >
                <%--<input list="items" id="itemName" name="orderItem.nameSize" class="form-control" maxLength="30" required="true"/>
                <datalist id="items">
                  <s:iterator value="customerItems">
                    <option id=<s:property value="%{customerItemsId}" /> value=<s:property value="%{itemName}" /> />
                  </s:iterator>
                </datalist>--%>
                  <s:textfield cssClass="form-control" name="orderItem.nameSize" required="true"></s:textfield>

              </div>
            </s:else>
          </div>

              <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                <s:textfield cssClass="form-control weightAndVolume" name="orderItem.weight" id="orderItem.weight" maxLength="9" required="true" />
              </s:if>
              <s:else>
              <div class="form-group">
                  <label class="col-lg-4 control-label" style="padding-top:0px;">Weight (kg): </label>

                  <div class="col-lg-7" >
                    <s:textfield cssClass="form-control" name="orderItem.weight" id="orderItemWeight_textfield" maxLength="9" required="true"
                               placeholder="XXXXXX.XX"
                               value="%{getText('format.number',{orderItem.weight})}"
                               pattern="\d+(\.\d{1,2})?" />

                  </div>
              </div>
              </s:else>

              <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                <s:textfield cssClass="form-control weightAndVolume" name="orderItem.volume" id="orderItem-volume"/>
              </s:if>
              <s:else>
              <div class="form-group">
                <label class="col-lg-4 control-label" style="padding-top:0px;">Volume (cbm): </label>
                  <div class="col-lg-7">
                    <s:textfield cssClass="form-control" name="orderItem.volume" id="orderItemVolume_textfield" required="true"
                            value="%{getText('format.number',{orderItem.volume})}"
                            pattern="\d+(\.\d{1,2})?" />
                  </div>
              </div>
              </s:else>

          <div class="form-group">
            <label class="col-lg-4 control-label" style="padding-top:0px;">Commodity: </label>
            <div class="col-lg-7" >
              <s:textfield name="orderItem.description" cssClass="form-control" id="commodity" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-4 control-label" style="padding-top:0px;">Value (Php): </label>
            <div class="col-lg-7" >
              <s:if test="order.serviceRequirement=='FULL CONTAINER LOAD' || order.serviceRequirement=='FCL'">
                <s:textfield cssClass="form-control automaticDeclaredValue" name="orderItem.declaredValue" id="orderItemdeclaredValues" value="%{getText('format.money',{orderItem.declaredValue})}"/>
              </s:if>
              <s:else>
                <s:select cssClass="form-control automaticDeclaredValue" id="orderItem_declaredValue" list="#{orderItem_declaredValue}"
                          value="%{orderItem_declaredValue}"
                          style="display:none" />

                <s:textfield cssClass="form-control automaticDeclaredValue" name="orderItem.declaredValue" id="orderItemdeclaredValues_textfield"
                             maxLength="19"
                             value="%{getText('format.money',{orderItem.declaredValue})}"
                             required="true" />
              </s:else>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-4 control-label" style="padding-top:0px;">Rate (Php): </label>
            <div class="col-lg-7" >
              <s:textfield cssClass="form-control" id="orderItem_rate" name="orderItem.rate" maxLength="16" disabled="true"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-4 control-label" style="padding-top:0px;">Comment: </label>
            <div class="col-lg-7" >
              <s:textarea cssClass="form-control" name="orderItem.remarks" id="orderItem_remarks"
                          cssStyle="resize: none; height: 150px;"
                          maxLength="255" />
            </div>
          </div>

          <div class="pull-right">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
              Cancel
            </button>
            <s:submit value="OK" type="submit" cssClass="editItemListingBtn btn btn-primary"></s:submit>
          </div>
        </div>
      </div>
      </s:form>
    </div>
  </div>
</div>

<script>

  $('.weightAndVolume').hide();

  $(document).ready(function() {
    $("#orderItemdeclaredValues").maskMoney();
    $("#orderItemdeclaredValues_textfield").maskMoney();
    $("#orderItemWeight_textfield").maskMoney({precision:0});
    $("#orderItemVolume_textfield").maskMoney({precision:0});
  });

</script>

