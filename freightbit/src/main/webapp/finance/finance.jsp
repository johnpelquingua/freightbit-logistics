<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-money"></i> Finance Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Finance</li>
            <li class="active"> Search Finance</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<s:form action="search" method="post" cssClass="form-horizontal" theme="bootstrap">

    <div class="row">

        <div class="col-lg-6 col-lg-offset-3">

            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-search"></i> Search</h3>
                </div>

                <div class="panel-body">

                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label" style="padding-top:0px;">Search By</label>

                        <div class="col-sm-10">
                            <s:textfield name="username" id="username" cssClass="form-control"/>
                        </div>
                    </div>

                </div>

                <div class="panel-footer">
                    <div class="btn-group pull-right">
                        <s:submit value="Submit" cssClass="btn btn-primary"/>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <!-- /.row -->

</s:form>