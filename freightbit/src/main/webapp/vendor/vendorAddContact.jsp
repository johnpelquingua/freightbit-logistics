<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
		<!-- MIDDLE -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h1 class="page-header">Contact Person</h1>

		<!-- EDIT HERE -->

			<div class="main-box">
				<div class="panel panel-info">

							<div class="panel-heading">
								<img src="includes/images/add-user.png" class="box-icon">
								<span class="panel-title">Contact Person Information</span>
							</div>

							<div class="panel-body">
								<div class="table-responsive list-table">
                                <s:form action="editVendorContactPerson" cssClass="form-horizontal" theme="bootstrap">
								<s:hidden name="contact.contactId" value="%{contact.contactId}" />
								<s:hidden value="%{sessionVendorId}" />
								<s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName" id="contact.lastName" value="%{sessionVendorId}"/>
									  <div class="form-group">

										<label for="contact.contactType" class="col-sm-2 control-label" > Contact Type:</label>

										<div class="col-sm-10">
											<s:select list="contactTypeList" name="contact.contactType" id="contact.contactType" listKey="key" listValue="value" cssClass="form-control" />
										</div>

									  </div>

									  <div class="form-group">

										<label for="contact.lastName" class="col-sm-2 control-label">Last Name:</label>

										<div class="col-sm-10">
											<s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName" id="contact.lastName" />
										</div>

									  </div>

									  <div class="form-group">

										<label for="contact.firstName" class="col-sm-2 control-label">First Name:</label>

										<div class="col-sm-10">
											<s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName" id="contact.firstName"/>
										</div>

									  </div>

									  <div class="form-group">

										<label for="contact.middleName" class="col-sm-2 control-label">Middle Name:</label>

										<div class="col-sm-10">
											<s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName" id="contact.middleName" />
										</div>

									  </div>

									  <div class="form-group">

										<label for="contact.phone" class="col-sm-2 control-label">Phone:</label>

										<div class="col-sm-10">
											<s:textfield cssClass="form-control" placeholder="contact.phone" name="contact.phone"/>
										</div>

									  </div>

									  <div class="form-group">

										<label for="contact.mobile" class="col-sm-2 control-label">Mobile:</label>

										<div class="col-sm-10">
											  <s:textfield cssClass="form-control" placeholder="contact.mobile" name="contact.mobile"/>
										</div>

									  </div>

									  <div class="form-group">

										  <label for="contact.fax" class="col-sm-2 control-label">Fax:</label>

										  <div class="col-sm-10">
												<s:textfield cssClass="form-control" placeholder="contact.fax" name="contact.fax"/>
										  </div>

									   </div>

									   <div class="form-group">

										   <label for="contact.email" class="col-sm-2 control-label">E-mail:</label>

										   <div class="col-sm-10">
												 <s:textfield cssClass="form-control" placeholder="contact.email" name="contact.email"/>
										   </div>

										</div>

								</div>
							</div>

							<div class="panel-footer">
									<s:submit cssClass="btn btn-default" name="submit" value="Add" />

								<div class="btn-group" style="float: right;">

									<button class="btn btn-default">Back</button>

									<button class="btn btn-default" onclick="this.form.action='loadAddOtherInformationPage'" >Next</button>

								</div>
							</div>
                    </s:form>
				</div>

			</div>

   			<div class="sidebar-box">
			  <div class="panel panel-info">
					<div class="panel-heading">
						<img src="includes/images/calendar.png" class="box-icon">
						<span class="panel-title">Process</span>
					</div>

				  <div class="panel-body">

						<ul class="nav">
							<li><a href="vendor-addvendor" class="side-help"><img src="includes/images/1.png" class="img-sidehelp">Personal Information</a></li>
							<li><a href="vendor-trucks" class="side-help"><img src="includes/images/2.png" class="img-sidehelp">Trucks Information</a></li>
							<li><a href="vendor-driver" class="side-help"><img src="includes/images/3.png" class="img-sidehelp">Driver Information</a></li>
							<li><a href="vendor-contact-person" class="side-help"><img src="includes/images/4.png" class="img-sidehelp">Contact Person</a></li>
							<li><a href="vendor-other-information" class="side-help"><img src="includes/images/5.png" class="img-sidehelp">Other Information</a></li>
							<li><a href="vendor-address" class="side-help"><img src="includes/images/6.png" class="img-sidehelp">Address</a></li>
						</ul>

				  </div>
			  </div>
		    </div>

		    <div class="row col-md-12">
                    <div class="panel panel-info">

                        <div class="panel-heading">
                            <img src="includes/images/listofusers.png" class="box-icon"/>
                            <span class="panel-title">List of Contacts</span>

                        </div>

                        <div class="panel-body">
                            <div class="table-responsive list-table">
                                <table class="table table-striped table-bordered text-center">
                                    <thead>
                                    <tr class="header_center">
                                        <th class="tb-font-black"><input type="checkbox" /></th>
                                        <th class="tb-font-black">Contact Type</th>
                                        <th class="tb-font-black">Last Name</th>
                                        <th class="tb-font-black">First Name</th>
                                        <th class="tb-font-black">Middle Name</th>
                                        <th class="tb-font-black">Phone</th>
                                        <th class="tb-font-black">Mobile</th>
                                        <th class="tb-font-black">Fax</th>
                                        <th class="tb-font-black">E-Mail</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <s:iterator value="contacts" var="contact">
                                        <tr>
                                            <td class="tb-font-black"><s:checkbox name="a" theme="simple" /></td>
                                            <td class="tb-font-black"><s:property value="contactType" /></td>
                                            <td class="tb-font-black"><s:property value="lastName" /></td>
                                            <td class="tb-font-black"><s:property value="firstName" /></td>
                                            <td class="tb-font-black"><s:property value="middleName" /></td>
                                            <td class="tb-font-black"><s:property value="phone" /></td>
                                            <td class="tb-font-black"><s:property value="mobile" /></td>
                                            <td class="tb-font-black"><s:property value="fax" /></td>
                                            <td class="tb-font-black"><s:property value="email" /></td>
                                            <td class="tb-font-black">

                                                <s:url var="editContactsUrl" action="loadEditContactPersonPage">
                                                    <s:param name="contactCodeParam" value="contactId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{editContactsUrl}" rel="tooltip" title="Edit this contact person">
                                                    <img src="includes/images/edit-user.png" class="icon-action circ-icon"> </s:a>

                                                <s:url var="deleteContactsUrl" action="deleteVendorContactPerson">
                                                    <s:param name="contactCodeParam" value="contactId"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{deleteContactsUrl}" rel="tooltip" title="Delete this Contact Person" onclick="return confirm('Do you really want to delete?');">
                                                    <img src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>

                                            </td>
                                        </tr>

                                    </s:iterator>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="panel-footer">

                            <ul class="pagination">
                                <li class="disabled"><a href="#">&laquo;</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li class="disabled"><a href="#">&raquo;</a></li>
                            </ul>

                        </div>

                    </div>
                </div>

		<!-- SIDEBAR GOES HERE -->

		<!-- END OF EDIT -->

        </div>

		<!-- END OF THE MIDDLE -->
