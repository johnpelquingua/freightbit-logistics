    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>
        <%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
        <%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
        <sj:head compressed='true' jquerytheme="ui-darkness"/>
            <!-- MIDDLE -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <h1 class="page-header">Customer Profile</h1>

            <!-- MAIN BOX -->

            <div class="main-box">
                      <div class="panel booking panel-info">
                          <div class="booking panel-heading">
                          <img src="includes/images/search.png" class="box-icon">
                            <span class="booking panel-title">Search Customer</span>

                          </div>
                          <div class="panel-body">
                            <div class="table-responsive list-table">


                            <label>Select Date:</label>


                            <s:form cssClass="form-horizontal" action="Customer-List" theme="bootstrap" method="POST">

                                    <div class="form-group">

                                       <label for="customerSearch" class="col-sm-2 control-label">Select Date:</label>

                                       <div class="col-sm-10">
                                       <sj:datepicker id="datepicker1"
                                         displayFormat="mm-dd-yy"
                                         imageUrl="includes/images/datepicker.gif"
                                         imageTooltip="Select Your Birthdate"
                                         showButton="true"
                                         changeYear="true"
                                         changeMonth="true"
                                         cssClass="form-control"
                                       />
                                       </div>
                                   </div>

                                    <div class="form-group">

                                        <label for="customerSearch" class="col-sm-2 control-label">Search by:</label>

                                        <div class="col-sm-10">
                                       <%-- <s:select name="customerSearch" list="customerSearch" cssClass="form-control"/> --%>
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <label for="inputKeyword" class="col-sm-2 control-label">Search:</label>

                                        <div class="col-sm-10">
                                                <s:textfield name="inputKeyword" cssClass="form-control"/>

                                        </div>

                                    </div>

                                    <div class="form-group">

                                        <label for="inputCHECKBOX"class="col-sm-2 control-label">Filter by:</label>

                                        <div class="col-sm-10">

                                            <label class="checkbox-inline">
                                              <s:checkbox name="inlineCheckbox1"/> Company Name
                                            </label>
                                            <label class="checkbox-inline">
                                             <s:checkbox name="inlineCheckbox2"/> Customer Code
                                            </label>
                                            <label class="checkbox-inline">
                                              <s:checkbox name="inlineCheckbox3"/> Customer Type
                                            </label>
                                            <label class="checkbox-inline">
                                              <s:checkbox name="inlineCheckbox4"/> Email Address
                                            </label>
                                        </div>

                                    </div>



                  <button type="cancel" class="btn btn-default" style="float:right;margin:6px 0px 6px 0px;" id ="groups-btn">Cancel</button>
                  <s:submit name="submit" cssStyle="float:right;margin:6px 20px 6px 0px;" cssClass="btn btn-default" value="Search" />

            </s:form>
                              </div>
                          </div>
                      </div>
                    </div>



            <!-- END OF MAIN BOX -->

            <!-- SIDEBAR -->

            <div class="sidebar-box">
                      <div class="panel booking panel-info">
                          <div class="booking panel-heading">
                          <img src="includes/images/chat.png" class="box-icon">
                            <span class="booking panel-title">Online Chat</span>

                          </div>
                          <div class="panel-body">
                            <div class="table-responsive list-table">

                              </div>
                          </div>
                      </div>
                    </div>
                </div>

            <!-- END SIDEBAR -->

            <!-- END OF THE MIDDLE -->