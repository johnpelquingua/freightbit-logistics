<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%--<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> Booking List </a></li>
            <li class="active"> Search Booking</li>
        </ol>
    </div>
</div>
<!-- /.row -->--%>
<%--<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search Booking</h3>
            </div>--%>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary" style="margin-bottom: 0px;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Search Booking </h3>
            </div>
            <div class="panel-body">
                <div class="well" style="margin-top: 10px;">
                    <s:form action="viewOrders" theme="bootstrap" cssClass="form-horizontal" >
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search by</label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" id="order.orderSearchCriteria"
                                      value="order.orderSearchCriteria"
                                      name="order.orderSearchCriteria"
                                      list="orderSearchList" listValue="value" listKey="key"
                                      cssClass="bookingSearchDropdown form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Search</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="bookingSearchText form-control" id="order.orderKeyword" name="order.orderKeyword" placeholder="Keyword"></s:textfield>
                        </div>
                    </div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                            Cancel
                        </button>
                        <s:submit value="Search" type="submit" cssClass="bookingSearchBtn btn btn-primary" disabled="true"></s:submit>
                    </div>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
<script>
    validateSearchModal('bookingSearchBtn', 'bookingSearchText', 'bookingSearchDropdown');
</script>
<%--        </div>
    </div>
</div>--%>
<!-- /.row -->
