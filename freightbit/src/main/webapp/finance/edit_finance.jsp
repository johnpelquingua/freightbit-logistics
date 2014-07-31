<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<head>
    <sj:head compressed='false'/>
</head>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Finance</h1>

    <!-- EDIT HERE -->

    <div style="height:100%;" class="panel booking panel-info">
        <div class="booking panel-heading">
            <img src="../includes/images/booking.png" class="box-icon">
            <span class="booking panel-title">Finance</span>
        </div>
        <div class="panel-body">
            <div class="table-responsive list-table">

                <s:form action="edit_finance_validate" cssClass="form-horizontal" theme="bootstrap">
                    <div class="form-group">
                        <label for="cname" class="col-sm-2 control-label" style="width:25%;">UserName</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="username" cssClass="form-control" id="username" placeholder="UserName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cnumber" class="col-sm-2 control-label" style="width:25%;">Name</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="name" cssClass="form-control" id="name" placeholder="Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="width:25%;">Company</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="company" cssClass="form-control" id="company" placeholder="Company"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add1" class="col-sm-2 control-label" style="width:25%;">Email Address</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="email" cssClass="form-control" id="emai1" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add2" class="col-sm-2 control-label" style="width:25%;">Contact Number</label>

                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="contact" cssClass="form-control" id="contact"
                                         placeholder="Contact Number"/>
                        </div>
                    </div>
				  <span class="pull-right" style="margin-right:32px;">
					<a href="javascript: window.history.back();" class="btn btn-default" id="groups-btn"
                       style="width:70px;">Back</a>
				    <s:submit value="Save" cssClass="btn btn-default"/>
				  </span>
                </s:form>

            </div>
        </div>
    </div>


    <!-- END OF EDIT -->

</div>
