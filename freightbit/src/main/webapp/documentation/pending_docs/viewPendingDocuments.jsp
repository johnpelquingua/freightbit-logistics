<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-file-text"></i> Documents Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"> Pending Documents List</li>
        </ol>

    </div>
</div>

<!-- MAIN BOX -->

<div class="row">
    <div class="col-md-12">

        <div class="panel booking panel-info">
            <div class="booking panel-heading">
                <img src="images/listofusers.png" class="box-icon">
                <span class="booking panel-title">Pending Documents List</span>

            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black"><input type="checkbox" /></th>
                            <th class="tb-font-black">Booking Code</th>
                            <th class="tb-font-black">Company Code</th>
                            <th class="tb-font-black">Status</th>
                            <th class="tb-font-black">Service Type</th>
                            <th class="tb-font-black">Service Mode</th>
                            <th class="tb-font-black">Date of Pick up</th>
                            <th class="tb-font-black">Date of Delivery</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0001</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">D/D</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0002</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">D/P</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view2.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0003</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">P/D</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view3.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-font-black"><input type="checkbox" /></td>
                            <td class="tb-font-black">MTY-0004</td>
                            <td class="tb-font-black">MTY</td>
                            <td class="tb-font-black">At Port</td>
                            <td class="tb-font-black" align="center">Trucking - Shipping</td>
                            <td class="tb-font-black" align="center">P/P</td>
                            <td class="tb-font-black">Jan 7, 2014</td>
                            <td class="tb-font-black">Jan 10, 2014</td>
                            <td class="tb-font-black">
                                <a href="documentation-view4.html" class="icon-action-link edit-booking"><img src="images/edit-booking.png" class="icon-actio" title="View Document" style="background-color: gray; padding: 6px; margin-right: 6px; border-radius: 20%;"> </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>

    </div>
</div>
