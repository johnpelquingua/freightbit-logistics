<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

<h1 class="page-header">Edit Vendor</h1>

<!-- EDIT HERE -->


<div class="row" >
<div class="col-md-12">

<s:form theme="bootstrap" cssClass="form-horizontal" action="editVendor">
    <s:hidden name="vendor.vendorId" value="%{vendor.vendorId}"/>
    <div class="panel panel-info">
    <div class="panel-heading">
    <img src="includes/images/add-user.png" class="box-icon">
    <span class="panel-title">Personal Information</span>
    </div>
    <div class="panel-body">

    <div class="form-group">

    <label class="col-sm-2 control-label">Type:</label>

    <div class="col-sm-10">
    <s:select list="vendorTypeList" name="vendor.vendorType" id="vendor.vendorType" listKey="key" listValue="value" cssClass="form-control" disabled="true" />
    </div>

    </div>

    <div class="form-group">

    <label for="vendor.vendorName" class="col-sm-2 control-label">Company:</label>

    <div class="col-sm-10">
    <s:textfield type="text" cssClass="form-control" id="vendor.vendorName" name="vendor.vendorName" placeholder="Company Name" />
    </div>

    </div>

    <div class="form-group">

    <label for="vendor.vendorCode" class="col-sm-2 control-label">Code:</label>

    <div class="col-sm-10">
    <s:textfield type="text" cssClass="form-control" id="vendor.vendorCode" name="vendor.vendorCode" placeholder="Code" />
    </div>

    </div>

    </div>

    </div>



    </div>

    <div class="col-md-12">
    <div class="panel booking panel-info">
    <div class="booking panel-heading">
    <img src="includes/images/add-user.png" class="box-icon">
    <span class="booking panel-title">Contact Person Information</span>
    </div>
    <div class="panel-body">



    <div class="form-group">

    <label for="contact.lastName" class="col-sm-2 control-label">Last Name:</label>

    <div class="col-sm-10">
    <s:textfield type="text" cssClass="form-control" id="contact.lastName" name="contact.lastName" placeholder="Last Name" />
    </div>

    </div>

    <div class="form-group">

    <label for="contact.firstName" class="col-sm-2 control-label">First Name:</label>

    <div class="col-sm-10">
    <s:textfield type="text" cssClass="form-control" id="contact.firstName" name="contact.firstName" placeholder="First Name" />
    </div>

    </div>

    <div class="form-group">

    <label for="contact.middleName" class="col-sm-2 control-label">Middle Name:</label>

    <div class="col-sm-10">
    <s:textfield type="text" cssClass="form-control" id="contact.middleName" name="contact.middleName" placeholder="Middle Name" />
    </div>

    </div>

    <div class="form-group">

    <label for="contact.number" cssClass="col-sm-2 control-label">Number:</label>

    <div class="col-sm-10">
    <s:textfield type="text" cssClass="form-control" id="contact.number" name="contact.number" placeholder="Number" />
    </div>

    </div>



    </div>

    </div>

    </div>

    <div class="col-md-12">

    <div class="panel panel-info">
    <div class="panel-heading">
    <img src="includes/images/add-user.png" class="box-icon">
    <span class="panel-title">Other Information</span>
    </div>
    <div class="panel-body">

    <div class="form-group">

    <label for="vendor.vendorClass" class="col-sm-2 control-label">Class:</label>

    <div class="col-sm-10">

    <s:select list="vendorClassList" name="vendor.vendorClass" id="vendor.vendorClass" listKey="key" listValue="value" cssClass="form-control"  />

    </div>

    </div>

    <div class="form-group">

    <label for="vendor.vendorStatus" class="col-sm-2 control-label">Status:</label>

    <div class="col-sm-10">

    <s:select list="statusList" name="vendor.vendorStatus" id="vendor.vendorStatus" listKey="key" listValue="value" cssClass="form-control" />

    </div>

    </div>

    </form>

    </div>

    </div>



    </div>

    </div>

    <div class="btn-group" style="float: right;">
        <button class="btn btn-default" onclick="location.href='vendorSaveComplete.jsp'">Save</button>
        <button class="btn btn-default" onclick="location.href='vendorListView.jsp'">Cancel</button>
    </div>
    </s:form>

    <div class="btn-group" style="float: left;" id="shipping-option">
        <button class="btn btn-default" onclick="location.href='vendorAddVessels.jsp'">Vessel</button>
        <button class="btn btn-default" onclick="location.href='vendor-address.jsp'">Address</button>
    </div>


    <!-- SIDEBAR GOES HERE -->

    <!-- END OF EDIT -->

</div>

<!-- END OF THE MIDDLE -->
