<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> EIR Form </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Container Management </li>
        </ol>
    </div>
</div>

<s:if test="hasActionMessages()">
    <div class="col-lg-12">
        <div class="alert alert-success" id="alert">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
            <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
        </div>
    </div>
</s:if>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Container: <s:property value="container.vanNumber"></s:property>
                </h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-2">
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
                                            <td class="header">EIR Type:</td>
                                            <td><s:property value="container.eirType"></s:property></td>
                                        </tr>
                                        <tr>
                                            <td class="header">Receipt Number:</td>
                                            <td><s:property value="container.receiptNumber"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Shipping Line:</td>
                                            <td><s:property value="container.shipping"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Van Number:</td>
                                            <td><s:property value="container.vanNumber"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">EIR Number:</td>
                                            <td><s:property value="container.eirNumber"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Van Location:</td>
                                            <td><s:property value="container.vanLocation"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Trucking:</td>
                                            <td><s:property value="container.trucking"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Plate Number:</td>
                                            <td><s:property value="container.plateNumber"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Driver:</td>
                                            <td><s:property value="container.driver"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Booking Number:</td>
                                            <td><s:property value="container.bookingNum"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Seal Number:</td>
                                            <td><s:property value="container.sealNumber"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Remarks:</td>
                                            <td><s:property value="container.remarks"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Laden / Empty:</td>
                                            <td><s:property value="container.ladenEmpty"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Van To:</td>
                                            <td><s:property value="container.vanTo"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Van From:</td>
                                            <td><s:property value="container.vanFrom"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Forklift Operator:</td>
                                            <td><s:property value="container.forkliftOperator"></s:property> </td>
                                        </tr>
                                        <tr>
                                            <td class="header">Operations Dept.:</td>
                                            <td><s:property value="container.operationsDept"></s:property> </td>
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
