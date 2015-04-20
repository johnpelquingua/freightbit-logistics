<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
  <div class="col-lg-12">
    <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-building"></i> Vendor Module </h1>
            </span>
    </legend>
    <ol class="breadcrumb">
      <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
      <li class="active"> Vendor</li>
      <li class="active"><a href="<s:url action='viewVendors' />"> Vendor List</a></li>
      <li class="active"><a href="<s:url action='viewInfoVendor' />"> Vendor
        Profile</a></li>
      <li class="active"><a href="<s:url action='viewVendorTruckingContacts' />">
        Contact Persons</a></li>
      <li class="active"> Contact Person Info</li>
    </ol>

  </div>
</div>
<s:if test="hasActionMessages()">
  <div class="col-lg-12">
    <div class="alert alert-success">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
      <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
    </div>
  </div>
</s:if>
<s:if test="hasActionErrors()">
  <div class="col-lg-12">
    <div class="alert alert-errors">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
      <strong><s:actionerror cssStyle="margin-bottom: 0px;"/></strong>
    </div>
  </div>
</s:if>

<div class="row">

  <div class="col-lg-12">
    <div class="panel panel-primary">

      <div class="panel-heading">
        <h3 class="panel-title" style="float:left;top: 0px;"><i class="fa fa-info-circle"></i> Vendor Trucking Profile</h3>
      </div>

      <div class="panel-body">

        <s:set name="vendorId" value="%{vendor.vendorId}" scope="session"/>
        <s:hidden name="vendorId" value="%{vendor.vendorId}"></s:hidden>
        <s:hidden name="contactCodeParam" value="%{contact.contactId}"></s:hidden>

        <div class="row">

          <div class=" col-lg-6 col-lg-offset-2">

            <div class="panel panel-info ">

              <div class="row">
                <div class="col-lg-12">

                  <div class="col-lg-3">
                    <div align="center" style="margin-top: 10px;">
                      <div align="center" style="margin-top: 10px;">
                        <img alt="User Pic" src="../includes/images/photo.png" class="img-circle">
                      </div>
                    </div>
                  </div>

                  <div class="col-lg-9">

                    <table class="table table-user-information profile" style="margin-top: 10px;">
                      <tbody>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Contact Type</td>
                        <td><s:property value="contact.contactType"/></td>
                      </tr>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Position</td>
                        <td><s:property value="contact.position"/></td>
                      </tr>

                      <tr>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Last Name</td>
                        <td><s:property value="contact.lastName"/></td>
                      </tr>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">First Name</td>
                        <td><s:property value="contact.firstName"/></td>
                      </tr>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Phone</td>
                        <td><s:property value="contact.phone"/></td>
                      </tr>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Mobile</td>
                        <td><s:property value="contact.mobile"/></td>
                      </tr>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">Fax</td>
                        <td><s:property value="contact.fax"/></td>
                      </tr>
                      <tr>
                        <td class="header" style="font-weight:bold; font-size: 12px; text-align: left !important;">E-mail</td>
                        <td><s:property value="contact.email"/></td>
                      </tr>

                      </tbody>
                    </table>

                  </div>

                </div>
              </div>

            </div>

          </div>

        </div>

      </div>
    </div>
  </div>

</div>