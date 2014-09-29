<%--
  Created by IntelliJ IDEA.
  User: JMXPSX
  Date: 9/24/2014
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
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
            <li class="active"><a href="<s:url action='../viewPendingDocuments' />"> Pending Documents List</a></li>
            <li class="active"> Pending Documents of Booking Number 9999</li> <%--placeholder--%>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-file-text"></i> Document Stages</h3>
            </div>

            <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#outbound" role="tab" data-toggle="tab">Outbound</a></li>
                    <li><a href="#inbound" role="tab" data-toggle="tab">Inbound</a></li>
                    <li><a href="#finalOutbound" role="tab" data-toggle="tab">Final Set Outbound</a></li>
                    <li><a href="#finalInbound" role="tab" data-toggle="tab">Final Set Inbound</a></li>
                    <li><a href="#archive" role="tab" data-toggle="tab">Archive</a></li>
                    <li><a href="#billing" role="tab" data-toggle="tab">Billing</a></li>
                </ul>


                <div class="tab-content">
                    <%--OUTBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade in active" id="outbound">

                        OUTBOUND DOCUMENTS

                    </div>
                    <%--INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="inbound">

                        INBOUND DOCUMENTS

                    </div>
                    <%--FINAL SET OUTBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="finalOutbound">

                        FINAL SET OUTBOUND DOCUMENTS

                    </div>
                    <%--FINAL SET INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="finalInbound">

                        FINAL SET INBOUND DOCUMENTS

                    </div>
                    <%--ARCHIVE BEGIN--%>
                    <div class="tab-pane fade" id="archive">

                        ARCHIVE DOCUMENTS

                    </div>
                    <%--BILLING DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="billing">

                        BILLING DOCUMENTS

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>