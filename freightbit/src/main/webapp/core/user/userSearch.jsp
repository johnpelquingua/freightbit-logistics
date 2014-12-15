<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<%--
<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-user"></i> Accounts Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> User</li>
            <li class="active"> Search User</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-search"></i> Search</h3>
            </div>
--%>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary" style="margin-bottom: 0px;">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Search User </h3>
            </div>
            <div class="panel-body">
                <div class="well" style="margin-top: 10px;">
                    <s:form cssClass="form-horizontal" action="viewUsers" theme="bootstrap">
                    <div class="form-group">
                        <label for="user.userSearchCriteria" class="col-sm-2 control-label" style="padding-top:0px;">Search by</label>

                        <div class="col-sm-10">
                            <s:select emptyOption="true" list="userSearchList" listValue="value" listKey="key"
                                      cssClass="form-control" name="user.userSearchCriteria"
                                      value="user.userSearchCriteria"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="user.userKeyword" class="col-sm-2 control-label" style="padding-top:0px;">Search</label>

                        <div class="col-sm-10">
                            <s:textfield cssClass="form-control" placeholder="Keyword" name="user.userKeyword"/>
                        </div>
                    </div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <s:submit value="Search" type="submit" cssClass="btn btn-primary"></s:submit>
                    </div>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

            <%--<label  style="font-size: 20px;">Search User</label>
            <div class="panel-body">

                <s:form cssClass="form-horizontal" action="viewUsers" theme="bootstrap">


                <div class="form-group">

                    <label for="user.userSearchCriteria" class="col-sm-2 control-label" style="padding-top:0px;">Search by :</label>

                    <div class="col-sm-10">
                        <s:select emptyOption="true" list="userSearchList" listValue="value" listKey="key"
                                  cssClass="form-control" name="user.userSearchCriteria"
                                  value="user.userSearchCriteria"/>
                    </div>
                </div>

                <div class="form-group">

                    <label for="user.userSearchCriteria" class="col-sm-2 control-label" style="padding-top:0px;">Search :</label>

                    <div class="col-sm-10">
                        <s:textfield cssClass="form-control" placeholder="Keyword" name="user.userKeyword"/>
                    </div>

                </div>
                    <div class="pull-right" style="margin-top: 10px;">
                        <button type="button" class="btn" onclick="location.href='viewUsers'">
                            Cancel
                        </button>
                        <s:submit value="Search" type="submit" cssClass="btn btn-primary"></s:submit>
                    </div>
            </div>
            </s:form>--%>


<%--

        </div>
    </div>
</div>
</div>--%>
