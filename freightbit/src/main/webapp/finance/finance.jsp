	<%@ taglib prefix="s" uri="/struts-tags" %>

		<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h1 class="page-header">Finance</h1>

		<!-- EDIT HERE -->

<div style="height:100%;" class="panel booking panel-info">
	<div class="booking panel-heading">
		<img src="includes/images/booking.png" class="box-icon">
		<span class="booking panel-title">Finance</span>
	</div>
<div class="panel-body" >

                <div class="form-group">
                <s:form action="search" method="post">
                    <label for="username" class="col-sm-2 control-label">Search:</label>
                    <s:textfield name="username" id="username" cssStyle="margin-left:-90px;margin-bottom:20px;" size="100"   />
                    <s:submit value="Submit" />


                 </div>
                </s:form>
</div>
</div>
</div>



		<!-- END OF EDIT -->

        </div>
--%>


    <div class="row">
        <div class="col-lg-12">
            <h1>Finance Module </h1>
            <ol class="breadcrumb">
                <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
                <li class="active"><i class="fa fa-money"></i> Finance</li>
                <li class="active"><i class="fa fa-search"></i> Search Finance</li>
            </ol>

        </div>
    </div><!-- /.row -->

<s:form action="search" method="post" cssClass="form-horizontal" theme="bootstrap">

    <div class="row">

        <div class="col-lg-6 col-lg-offset-3">

            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-search"></i> Search Finance</h3>
                </div>

                <div class="panel-body">

                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label" style="width:20%;">Search:</label>
                        <div class="col-sm-10" style="width:70%;">
                            <s:textfield name="username" id="username" cssClass="form-control" />
                        </div>
                    </div>

                    <span class="pull-right">
                        <s:submit value="Submit" cssClass="btn btn-info"/>
                    </span>

                </div>

            </div>

        </div>

    </div><!-- /.row -->

</s:form>