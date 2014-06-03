	<%@ taglib prefix="s" uri="/struts-tags" %>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

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
