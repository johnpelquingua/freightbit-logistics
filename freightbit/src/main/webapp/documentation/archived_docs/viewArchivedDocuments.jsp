
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
            <li class="active"> Archived Documents List</li>
        </ol>

    </div>
</div>

<div class="container-fluid">
    <div class="row">


        <!-- MIDDLE -->
        <div class="col-lg-12 main">

            <!-- MAIN BOX -->

            <div class="row">
                <div class="col-md-12">

                    <div class="panel booking panel-info">
                        <div class="booking panel-heading">
                            <img src="images/listofusers.png" class="box-icon">
                            <span class="booking panel-title">Archived Documents List</span>

                        </div>
                        <div class="panel-body">
                            <div class="table-responsive list-table">
                                <table class="table table-striped table-bordered text-center" id="customer-list">
                                    <thead>
                                    <tr class="header_center">
                                        <th class="tb-font-black"><input type="checkbox" /></th>
                                        <th class="tb-font-black">Booking Code</th>
                                        <th class="tb-font-black">Company Code</th>
                                        <th class="tb-font-black">Type</th>
                                        <th class="tb-font-black">Date of Pick up</th>
                                        <th class="tb-font-black">Date of Delivery</th>
                                        <th class="tb-font-black">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="tb-font-black"><input type="checkbox" /></td>
                                        <td class="tb-font-black">RUS101101</td>
                                        <td class="tb-font-black">RUSE</td>
                                        <td class="tb-font-black" align="center">D/D</td>
                                        <td class="tb-font-black">Jan 7, 2014</td>
                                        <td class="tb-font-black">Jan 10, 2014</td>
                                        <td class="tb-font-black">
                                            <label class="doc-sel">
                                                <select>
                                                    <option selected> Select Document </option>
                                                    <option>Way Bill Origin</option>
                                                    <option>Way Bill Destination</option>
                                                    <option>Release Order</option>
                                                    <option>Acceptance Order</option>
                                                    <option>Bill of Lading</option>
                                                    <option>Load Manifest</option>
                                                    <option>Authority to Load</option>
                                                    <option>Authority to Withdraw</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
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



