<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <a href="#"> Home </a> <i class="fa fa-angle-right"></i></li>
				<li>KYC Subject<i class="fa fa-angle-right"></i></li>
                <li>View</li>
            </ul>
			<h4>&nbsp;KYC Subject</h4>
        </div>
        
        <div class="row">
			<div class="col-md-12">
				<div class="portlet" id="form_wizard_1">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-layers"></i> <span class="step-title">
							Step 1 of 5 </span>
						</div>
						<div class="tools hidden-xs">
							<a href="javascript:;" class="collapse"></a>
						</div>
					</div>
					<div class="portlet-body form">
						<%-- <form action="#" method="POST" id="submit_form" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" data-parsley-errors-messages-disabled="true"> --%>
						<form class="form-horizontal uk-form bt-flabels js-flabels" action="#" id="submit_form" method="POST" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
							<div class="form-wizard">
								<div class="form-body">
									<ul class="nav nav-pills nav-justified steps" style="padding: 0px !important;">
										<li class="active">
											<a href="#tab1" data-toggle="tab" class="step">
												<span class="number"> 1 </span>
												<span class="desc"> <i class="fa fa-check"></i> Request for screening </span>
											</a>
										</li>
										<li>
											<a href="#tab2" data-toggle="tab" class="step">
												<span class="number"> 2 </span>
												<span class="desc"> <i class="fa fa-check"></i> Manual screening </span>
											</a>
										</li>
										<li>
											<a href="#tab3" data-toggle="tab" class="step">
												<span class="number"> 3 </span>
												<span class="desc"> <i class="fa fa-check"></i> Final template </span>
											</a>
										</li>
										<li>
											<a href="#tab4" data-toggle="tab" class="step">
												<span class="number"> 4 </span>
												<span class="desc"> <i class="fa fa-check"></i> Mitigation </span>
											</a>
										</li>
									</ul>
									<div id="bar" class="progress progress-striped hidden" role="progressbar">
										<div class="progress-bar progress-bar-success"></div>
									</div>
									<div class="tab-content">
										<div class="tab-pane active" id="tab1">
											<div class="row">
									            <div class="col-md-12">
									                <div class="portlet-body form">
									                    <div class="pull-right">
									                    	<button type="button" id="manualScreening" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-file-code-o"></em> Manual Screening
									                        </button>
									                        <button type="button" id="sendForScreening" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-external-link"></em> Send for Screening
									                        </button>
									                    	<button type="button" id="closeButton" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-times-circle"></em> Close
									                        </button>
									                    </div>
									                    <div class="clearfix margin-bottom-5"></div>
									                </div>
									            </div>
									        </div>
									        
											<div class="form-body">
												<div class="row">
													<div class="col-md-4">
														<h3 class="form-section">KYC Details</h3>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Counterparty(CP) Type:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('counterparty') != null}">
																				${subjectJson.getString('counterparty')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">First Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('firstName') != null}">
																				${subjectJson.getString('firstName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Middle Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('middleName') != null}">
																				${subjectJson.getString('middleName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Last Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('lastName') != null}">
																				${subjectJson.getString('lastName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Date of Birth:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('dateOfBirth') != null}">
																				${subjectJson.getString('dateOfBirth')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Occupation:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('occupation') != null}">
																				${subjectJson.getString('occupation')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
													</div>
												
													<div class="col-md-4">
														<h3 class="form-section">Address</h3>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Residential Address:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('residentialAddress') != null}">
																				${subjectJson.getString('residentialAddress')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">City/State:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('cityState') != null}">
																				${subjectJson.getString('cityState')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Zip code:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('zipCode') != null}">
																				${subjectJson.getString('zipCode')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Country of Residency:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('countryOfResidency') != null}">
																				${subjectJson.getString('countryOfResidency')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Country of Birth:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('countryOfBirth') != null}">
																				${subjectJson.getString('countryOfBirth')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Country of Nationality:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('countryOfNationality') != null}">
																				${subjectJson.getString('countryOfNationality')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
														<!--/row-->
													</div>
													
													<div class="col-md-4">
														<h3 class="form-section">Other details</h3>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Any other former First Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('formerFirstName') != null}">
																				${subjectJson.getString('formerFirstName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Any other former Middle Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('formerMiddleName') != null}">
																				${subjectJson.getString('formerMiddleName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Any other former Last Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('formerLastName') != null}">
																				${subjectJson.getString('formerLastName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Other Nationality:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('otherNationality') != null}">
																				${subjectJson.getString('otherNationality')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
													</div>
												</div>
											</div>
								
											<%-- <div class="clearfix margin-bottom-10"></div>
								            
								            <div class="row">
								            	<c:forEach begin="0" end="${proofData.length() -1}" var="proofIndex">
								            	<div class="col-md-4">
										            <div class="page-bar">
														<ul class="page-breadcrumb">
															<li><em><strong>${proofData.get(proofIndex).getString('proofName')}</strong></em></li>
														</ul>
													</div>
													<div class="clearfix margin-bottom-10"></div>
													<div class="row">
													<c:forEach begin="0" end="${proofData.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
														<div class="col-md-12">
															<div class="form-group">
								                            	<a href="#" data-backdrop="static" data-keyboard="false">
								                                	<button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
																</a>
															</div>
														</div>
													</c:forEach>
													</div>
												</div>
												</c:forEach>
											</div> --%>
											
											<div class="clearfix margin-bottom-10"></div>
											<div class="row">
												<c:forEach begin="0" end="${newProofData.length() -1}" var="proofIndex">
												    <div class="col-md-4">
												        <!-- BEGIN ACCORDION PORTLET-->
												        <div class="portlet">
												            <div class="portlet-title">
												                <div class="caption">
												                    <i class=""></i>${newProofData.get(proofIndex).getString('proofName')}
												                </div>
												                <div class="tools">
												                    <a href="javascript:;" class="collapse"></a>
												                </div>
												            </div>
												            <div class="portlet-body">
												                <div class="panel-group accordion" id="accordion_${proofIndex}">
												
												                    <c:forEach begin="0" end="${newProofData.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
												                        <div class="panel panel-default">
												                            <div class="panel-heading">
												                                <h4 class="panel-title">
												                                  <a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion_${proofIndex}" href="#collapse_${proofIndex}_${index}">
												                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
												                                      <span style="float:right">[Received: YES]</span>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
												                                      <span style="float:right">[Received: NO]</span>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
												                                      <span style="float:right">[Received: WAIVER]</span>
												                                    </c:if> 
												
												                                  </a>
												                              </h4>
												                            </div>
												                            <div id="collapse_${proofIndex}_${index}" class="panel-collapse collapse">
												                                <div class="panel-body">
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
												                                        <div class="form-group">
												                                            <label class="control-label col-md-6 bold">Received Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('receviedDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Document Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Expiry Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('expiryDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Document:</label>
												                                            <div class="col-md-6">
												                                                <button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Reference Number:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('referenceNumber')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Comment:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('comment')}
												                                                </p>
												                                            </div>
												
												                                        </div>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
												                                        <label class="control-label col-md-6 bold">Due Date:</label>
												                                        <div class="col-md-6">
												                                            <p class="form-control-static">
												                                                ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('dueDate')}
												                                            </p>
												                                        </div>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
												                                        <label class="control-label col-md-6 bold">Waiver Reason:</label>
												                                        <div class="col-md-6">
												                                            <p class="form-control-static">
												                                                ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('waiverReason')}
												                                            </p>
												                                        </div>
												                                    </c:if>
												                                </div>
												                            </div>
												                        </div>
												                    </c:forEach>
												                </div>
												            </div>
												        </div>
												    </div>
												</c:forEach>
											</div>
					<!-- END ACCORDION PORTLET-->
											
								            <div class="clearfix margin-bottom-10"></div>
								            <div class="page-bar">
												<ul class="page-breadcrumb">
													<li><em><strong>User Consent</strong></em></li>
												</ul>
											</div>
											<div class="clearfix margin-bottom-10"></div>
											
								            <c:forEach begin="0" end="${consentData.length() -1}" var="index">
								            <div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<div class="col-md-12">
															<input id="userConsent_${index}" name="userConsent_${index}" disabled type="checkbox" checked value="true" autocomplete="off" />
														    <label class="control-label">${consentData.get(index).getString('consentDescription')}</label>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
										<div class="tab-pane" id="tab2">
											<div class="row">
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<label class="noteLabel">Counterparty(CP) Type :</label> 
															<label class="noteLabel">Individual</label>
															<br>
															<label class="noteLabel">Country of Residency :</label> 
															<label class="noteLabel">Cayman</label>
															<br>
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<label class="noteLabel">Country of Birth :</label> 
															<label class="noteLabel">Cayman</label>
															<br>
															<label class="noteLabel">Country of Nationality :</label> 
															<label class="noteLabel">Cayman</label>						
															<br>
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<!-- BEGIN SAVE BUTTONs GROUP-->
													<div class="portlet-body form">
														<div class="pull-right">
									                    	<button type="button" id="saveScreening" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-check-circle"></em> Save
									                        </button>
									                    	<button type="button" id="closeButton" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-times-circle"></em> Close
									                        </button>
									                    </div>
									                    <div class="clearfix margin-bottom-5"></div>
													</div>
													<!-- END SAVE BUTTONs GROUP-->
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="portlet-body">
														<div class="page-bar">
															<ul class="page-breadcrumb">
																<li><em><strong>Manual Screening Process</strong></em></li>
															</ul>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="col-md-3 control-label"> PEP Risk</label>
																	<div class="col-md-3">
																		<div class="radio-list">
																			<label class="radio-inline"><input type="radio" value="1" name="pepRisk"> 
																				Yes
																			</label> 
																			<label class="radio-inline"><input type="radio" value="0" name="pepRisk"> 
																				No
																			</label>
																		</div>
																	</div>
																	<div class="col-md-2">
																		<div class="bt-form__wrapper">
													                        <div class="form-group">
													                            <div class="bt-flabels__wrapper">
													                                <label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="pepRiskLevel" name="pepRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="true">
																							<option value=""></option>
																							<option value="High">High</option>
																							<option value="Medium">Medium</option>
																							<option value="Low">Low</option>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
													                            </div>
													                        </div>
													                    </div>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="col-md-3 control-label"> Sanctions Risk</label>
																	<div class="col-md-3">
																		<div class="radio-list">
																			<label class="radio-inline"><input type="radio" value="1" name="sanctionRisk"> 
																				Yes
																			</label> 
																			<label class="radio-inline"><input type="radio" value="0" name="sanctionRisk"> 
																				No
																			</label>
																		</div>
																	</div>
																	<div class="col-md-2">
																		<div class="bt-form__wrapper">
													                        <div class="form-group">
													                            <div class="bt-flabels__wrapper">
													                                <label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="sanctionsRiskLevel" name="sanctionsRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="true">
																							<option value=""></option>
																							<option value="High">High</option>
																							<option value="Medium">Medium</option>
																							<option value="Low">Low</option>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
													                            </div>
													                        </div>
													                    </div>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="col-md-3 control-label"> Activities Risk</label>
																	<div class="col-md-3">
																		<div class="radio-list">
																			<label class="radio-inline"><input type="radio" value="1" name="activitiesRisk"> 
																				Yes
																			</label> 
																			<label class="radio-inline"><input type="radio" value="0" name="activitiesRisk"> 
																				No
																			</label>
																		</div>
																	</div>
																	<div class="col-md-2">
																		<div class="bt-form__wrapper">
													                        <div class="form-group">
													                            <div class="bt-flabels__wrapper">
													                                <label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="activitiesRiskLevel" name="activitiesRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="true">
																							<option value=""></option>
																							<option value="High">High</option>
																							<option value="Medium">Medium</option>
																							<option value="Low">Low</option>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
													                            </div>
													                        </div>
													                    </div>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="col-md-3 control-label"> Country Risk</label>
																	<div class="col-md-3"></div>
																	<div class="col-md-2">
																		<div class="bt-form__wrapper">
													                        <div class="form-group">
													                            <div class="bt-flabels__wrapper">
													                                <label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="countryRiskLevel" name="countryRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="true">
																							<option value=""></option>
																							<option value="High">High</option>
																							<option value="Medium">Medium</option>
																							<option value="Low">Low</option>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
													                            </div>
													                        </div>
													                    </div>
																	</div>
																</div>
															</div>
														</div>
														
														<hr />
														
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="col-md-3 control-label"> Total Risk Level</label>
																	<div class="col-md-3"></div>
																	<div class="col-md-2">
																		<div class="bt-form__wrapper">
													                        <div class="form-group">
													                            <div class="bt-flabels__wrapper">
													                                <label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="totalRiskLevel" name="totalRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="true">
																							<option value=""></option>
																							<option value="High">High</option>
																							<option value="Medium">Medium</option>
																							<option value="Low">Low</option>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
													                            </div>
													                        </div>
													                    </div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tab3">
											<div class="row">
									            <div class="col-md-12">
									                <div class="portlet-body form">
									                    <div class="pull-right">
									                    	<button type="button" id="closeButton" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-times-circle"></em> Close
									                        </button>
									                    </div>
									                    <div class="clearfix margin-bottom-5"></div>
									                </div>
									            </div>
									        </div>
									        
											<div class="form-body">
												<div class="row">
													<div class="col-md-4">
														<h3 class="form-section">KYC Details</h3>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Counterparty(CP) Type:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('counterparty') != null}">
																				${subjectJson.getString('counterparty')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">First Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('firstName') != null}">
																				${subjectJson.getString('firstName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Middle Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('middleName') != null}">
																				${subjectJson.getString('middleName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Last Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('lastName') != null}">
																				${subjectJson.getString('lastName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Date of Birth:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('dateOfBirth') != null}">
																				${subjectJson.getString('dateOfBirth')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Occupation:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('occupation') != null}">
																				${subjectJson.getString('occupation')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
													</div>
												
													<div class="col-md-4">
														<h3 class="form-section">Address</h3>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Residential Address:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('residentialAddress') != null}">
																				${subjectJson.getString('residentialAddress')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">State/City:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('cityState') != null}">
																				${subjectJson.getString('cityState')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Zip code:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('zipCode') != null}">
																				${subjectJson.getString('zipCode')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Country of Residency:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('countryOfResidency') != null}">
																				${subjectJson.getString('countryOfResidency')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Country of Birth:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('countryOfBirth') != null}">
																				${subjectJson.getString('countryOfBirth')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Country of Nationality:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('countryOfNationality') != null}">
																				${subjectJson.getString('countryOfNationality')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
														<!--/row-->
													</div>
													
													<div class="col-md-4">
														<h3 class="form-section">Other details</h3>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Any other former First Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('formerFirstName') != null}">
																				${subjectJson.getString('formerFirstName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Any other former Middle Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('formerMiddleName') != null}">
																				${subjectJson.getString('formerMiddleName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Any other former Last Name:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('formerLastName') != null}">
																				${subjectJson.getString('formerLastName')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Other Nationality:</label>
																	<div class="col-md-6">
																		<p class="form-control-static">
																			<c:if test="${subjectJson != null && subjectJson.getString('otherNationality') != null}">
																				${subjectJson.getString('otherNationality')} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
														</div>
													</div>
												</div>
											</div>
								
											<div class="clearfix margin-bottom-10"></div>
								            
								            <div class="row">
								            	<div class="col-md-12">
								            		<h3 class="form-section">Defined Template <span class="text-danger">[HIGH]</span></h3>
								            	</div>
								            	<%-- <c:forEach begin="0" end="${proofData.length() -1}" var="proofIndex">
								            	<div class="col-md-4">
										            <div class="page-bar">
														<ul class="page-breadcrumb">
															<li><em><strong>${proofData.get(proofIndex).getString('proofName')}</strong></em></li>
														</ul>
													</div>
													<div class="clearfix margin-bottom-10"></div>
													<div class="row">
													<c:forEach begin="0" end="${proofData.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
														<div class="col-md-12">
															<div class="form-group">
								                            	<a href="#" data-backdrop="static" data-keyboard="false">
								                                	<button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
																</a>
															</div>
														</div>
													</c:forEach>
													</div>
												</div>
												</c:forEach> --%>
												
												
												<c:forEach begin="0" end="${newProofData.length() -1}" var="proofIndex">
												    <div class="col-md-4">
												        <!-- BEGIN ACCORDION PORTLET-->
												        <div class="portlet">
												            <div class="portlet-title">
												                <div class="caption">
												                    <i class=""></i>${newProofData.get(proofIndex).getString('proofName')}
												                </div>
												                <div class="tools">
												                    <a href="javascript:;" class="collapse"></a>
												                </div>
												            </div>
												            <div class="portlet-body">
												                <div class="panel-group accordion" id="accordion_${proofIndex}">
												
												                    <c:forEach begin="0" end="${newProofData.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
												                        <div class="panel panel-default">
												                            <div class="panel-heading">
												                                <h4 class="panel-title">
												                                  <a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion_${proofIndex}" href="#collapse_${proofIndex}_${index}">
												                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
												                                      <span style="float:right">[Received: YES]</span>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
												                                      <span style="float:right">[Received: NO]</span>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
												                                      <span style="float:right">[Received: WAIVER]</span>
												                                    </c:if> 
												
												                                  </a>
												                              </h4>
												                            </div>
												                            <div id="collapse_${proofIndex}_${index}" class="panel-collapse collapse">
												                                <div class="panel-body">
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
												                                        <div class="form-group">
												                                            <label class="control-label col-md-6 bold">Received Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('receviedDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Document Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Expiry Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('expiryDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Document:</label>
												                                            <div class="col-md-6">
												                                                <button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Reference Number:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('referenceNumber')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Comment:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('comment')}
												                                                </p>
												                                            </div>
												
												                                        </div>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
												                                        <label class="control-label col-md-6 bold">Due Date:</label>
												                                        <div class="col-md-6">
												                                            <p class="form-control-static">
												                                                ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('dueDate')}
												                                            </p>
												                                        </div>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
												                                        <label class="control-label col-md-6 bold">Waiver Reason:</label>
												                                        <div class="col-md-6">
												                                            <p class="form-control-static">
												                                                ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('waiverReason')}
												                                            </p>
												                                        </div>
												                                    </c:if>
												                                </div>
												                            </div>
												                        </div>
												                    </c:forEach>
												                </div>
												            </div>
												        </div>
												    </div>
												</c:forEach>
												
											</div>
											
											<div class="clearfix margin-bottom-10"></div>
								            
								            <div class="row">
								            	<div class="col-md-12">
								            		<h3 class="form-section">Unused Documents</h3>
								            	</div>
								            	
								            	<%-- <c:forEach begin="0" end="${proofData.length() -1}" var="proofIndex">
								            	<div class="col-md-4">
										            <div class="page-bar">
														<ul class="page-breadcrumb">
															<li><em><strong>${proofData.get(proofIndex).getString('proofName')}</strong></em></li>
														</ul>
													</div>
													<div class="clearfix margin-bottom-10"></div>
													<div class="row">
													<c:forEach begin="0" end="${proofData.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
														<div class="col-md-12">
															<div class="form-group">
								                            	<a href="#" data-backdrop="static" data-keyboard="false">
								                                	<button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
																</a>
																
																<button type="button" class="btn btn-sm grey-gallery" style="float:right;" id="removeUnusedFile_${index}" value="Remove" onclick="javascript:removeOnClick('0');">
																	<i class="fa fa-close"></i>
																</button>
															</div>
														</div>
													</c:forEach>
													</div>
												</div>
												</c:forEach> --%>
												
												<c:forEach begin="0" end="${newProofData.length() -1}" var="proofIndex">
												    <div class="col-md-4">
												        <!-- BEGIN ACCORDION PORTLET-->
												        <div class="portlet">
												            <div class="portlet-title">
												                <div class="caption">
												                    <i class=""></i>${newProofData.get(proofIndex).getString('proofName')}
												                </div>
												                <div class="tools">
												                    <a href="javascript:;" class="collapse"></a>
												                </div>
												            </div>
												            <div class="portlet-body">
												                <div class="panel-group accordion" id="accordion_${proofIndex}">
												
												                    <c:forEach begin="0" end="${newProofData.get(proofIndex).getJSONArray('documents').length() -1}" var="index">
												                        <div class="panel panel-default">
												                            <div class="panel-heading">
												                                <h4 class="panel-title">
												                                  <a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion_${proofIndex}" href="#collapse_${proofIndex}_${index}">
												                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
												                                      <span style="float:right">[Received: YES]</span>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
												                                      <span style="float:right">[Received: NO]</span>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
												                                      <span style="float:right">[Received: WAIVER]</span>
												                                    </c:if> 
												
												                                  </a>
												                              </h4>
												                            </div>
												                            <div id="collapse_${proofIndex}_${index}" class="panel-collapse collapse">
												                                <div class="panel-body">
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Yes'}">
												                                        <div class="form-group">
												                                            <label class="control-label col-md-6 bold">Received Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('receviedDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Document Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Expiry Date:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('expiryDate')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Document:</label>
												                                            <div class="col-md-6">
												                                                <button type="button" class="btn btn-link"><i class="fa fa-paperclip"></i>&nbsp;${proofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentName')}</button>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Reference Number:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('referenceNumber')}
												                                                </p>
												                                            </div>
												
												                                            <label class="control-label col-md-6 bold">Comment:</label>
												                                            <div class="col-md-6">
												                                                <p class="form-control-static">
												                                                    ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('comment')}
												                                                </p>
												                                            </div>
												
												                                        </div>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'No'}">
												                                        <label class="control-label col-md-6 bold">Due Date:</label>
												                                        <div class="col-md-6">
												                                            <p class="form-control-static">
												                                                ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('dueDate')}
												                                            </p>
												                                        </div>
												                                    </c:if>
												
												                                    <c:if test="${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('documentReceived') == 'Waiver'}">
												                                        <label class="control-label col-md-6 bold">Waiver Reason:</label>
												                                        <div class="col-md-6">
												                                            <p class="form-control-static">
												                                                ${newProofData.get(proofIndex).getJSONArray('documents').get(index).getString('waiverReason')}
												                                            </p>
												                                        </div>
												                                    </c:if>
												                                </div>
												                            </div>
												                        </div>
												                    </c:forEach>
												                </div>
												            </div>
												        </div>
												    </div>
												</c:forEach>
											</div>
								            <div class="clearfix margin-bottom-10"></div>
								            <div class="page-bar">
												<ul class="page-breadcrumb">
													<li><em><strong>User Consent</strong></em></li>
												</ul>
											</div>
											<div class="clearfix margin-bottom-10"></div>
											
								            <c:forEach begin="0" end="${consentData.length() -1}" var="index">
								            <div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<div class="col-md-12">
															<input id="userConsent_${index}" name="userConsent_${index}" disabled type="checkbox" checked value="true" autocomplete="off" />
														    <label class="control-label">${consentData.get(index).getString('consentDescription')}</label>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
										
										<div class="tab-pane" id="tab4">
											<div class="row">
												<div class="col-md-12">
													<!-- BEGIN SAVE BUTTONs GROUP-->
													<div class="portlet-body form">
														<div class="pull-right">
									                    	<button type="button" id="saveScreening" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-check-circle"></em> Save
									                        </button>
									                    	<button type="button" id="closeButton" class="btn btn-sm grey-gallery">
									                            <em class="fa fa-times-circle"></em> Close
									                        </button>
									                    </div>
									                    <div class="clearfix margin-bottom-5"></div>
													</div>
													<!-- END SAVE BUTTONs GROUP-->
												</div>
											</div>
											<div class="row">
												<div class="col-md-3">
											        <div class="bt-form__wrapper">
								                        <div class="form-group uk-width-1-1">
								                            <div class="bt-flabels__wrapper">
								                                <label class="parsley_hide">Result of Screening</label>
																<div class="field-background">
																	<select id="resultOfScreening" name="resultOfScreening" placeholder="Result of Screening" data-parsley-required="true" class="form-control select2me">
																		<option value=""></option>
																		<option value="HIGH">High</option>
																		<option value="MEDIUN">Medium</option>
																	</select>
																</div>
																<span class="bt-flabels__error-desc_select">Required</span>
								                            </div>
								                        </div>
								                    </div>
								                </div>
								                <div class="col-md-3">
								                    <div class="bt-form__wrapper">
								                        <div class="form-group uk-width-1-1">
								                            <div class="bt-flabels__wrapper">
								                                <label class="parsley_hide">Activity Performed</label>
								                                <input type="text" name="activityPerformed" class="form-control field-background" placeholder="Activity Performed" data-parsley-required="true" maxlength="255" />
								                                <span class="bt-flabels__error-desc">Required</span>
								                            </div>
								                        </div>
								                    </div>
								                </div>
										        <div class="col-md-4">
								                    <div class="bt-form__wrapper">
								                        <div class="form-group uk-width-1-1">
								                            <div class="bt-flabels__wrapper">
								                                <label class="parsley_hide">Activity Description</label>
								                                <textarea name="activityDescription" class="field-background" data-parsley-required="true" placeholder="Activity Description" rows="5" style="min-width:100%;"></textarea>
								                                <span class="bt-flabels__error-desc">Required</span>
								                            </div>
								                        </div>
								                    </div>
								                </div>
								            </div>
							            	<div class="row">
												<div class="col-md-3">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">Proof/Evidence</label>
															<input type="file" class="hidden" name="file" id="file_0" onchange="javascript:onChangeFile('0');">
															<input type="text" readonly class="form-control field-background" placeholder="Proof/Evidence" id="file0" data-parsley-required="true" data-parsley-group="docAvailable">
															<span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span>
														</div>
													</div>
												</div> 
												<div class="col-md-2">
													<button type="button" class="btn btn-sm grey-gallery" id="uploadFile_0" value="Change" onclick="$('#file_0').click()">
														<i class="fa fa-folder-open-o"></i>&nbsp;Browse
													</button>
													&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-sm grey-gallery hidden" id="removeFile_0" value="Remove" onclick="javascript:removeOnClick('0');">
														<i class="fa fa-close"></i>
													</button>
											    </div>
											<!-- </div>
											
											<div class="row"> -->
								                <div class="col-md-2">
								                    <div class="bt-form__wrapper">
								                        <div class="form-group uk-width-1-1">
								                            <div class="bt-flabels__wrapper">
								                                <input type="checkbox" name="isMandatory" value="PASS" />
																<label class="control-label">PASS</label>
								                            <!-- </div>
								                        </div>
								                    </div>
								                </div>
								                <div class="col-md-2">
								                    <div class="bt-form__wrapper">
								                        <div class="form-group uk-width-1-1">
								                            <div class="bt-flabels__wrapper"> -->
								                                <input type="checkbox" name="isMandatory" value="FAIL" />
																<label class="control-label">FAIL</label>
								                            </div>
								                        </div>
								                    </div>
								                </div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-12" align="center">
											<a href="javascript:;" class="btn default button-previous"> <i class="m-icon-swapleft"></i> Back </a>
											<a href="javascript:;" class="btn blue button-next grey-gallery"> Continue <i class="m-icon-swapright m-icon-white"></i> </a>
											<a href="javascript:;" class="btn green button-submit grey-gallery"> Submit <i class="m-icon-swapright m-icon-white"></i> </a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
</div>

<script>
	
	jQuery(document).ready(function() {
		jQuery("#subject").addClass("active");
		jQuery("#master").remove("active");
		jQuery("#dashboard").remove("active");
		
		$(".doc0").hide();
		$(".doc1").hide();
		$(".doc2").hide();
		
		for(var index = 0; index < 3; index++) {
			$(".documentReceivedNo"+index).hide();
			$(".documentReceivedWaiver"+index).hide();
			$(".documentReceivedYes"+index).hide();
		}
	});
	
	function onChangeFile(i){
		var uploadFile = $('#file_'+i).val().split('\\').slice(-1)[0].toString();
		$('#file'+i).val(uploadFile);
		if (uploadFile) {
			$('#removeFile_'+i).removeClass('hidden');
			$("#removeFile_"+i).attr('value', 'Change');
		}
	}

	function removeOnClick(i){
			$('#file_'+i).val('');
			$('#file'+i).val('');
			$('#removeFile_'+i).addClass('hidden');
			$("#file"+i).change();
	}

	$('#closeButton').click(function() {
	    console.log("Closing current window...");
	    window.close();
	});
	
	function showHideDiv(att, index) {
		if($(att).is(":checked")) {
	    	$(".doc"+index).show(500);
	    	
	    	$(".documentReceivedNo"+index).show(500);
			$(".documentReceivedWaiver"+index).hide(500);
			$(".documentReceivedYes"+index).hide(500);
	    } else {
	    	$(".doc"+index).hide(500);
	    	
	    	$(".documentReceivedNo"+index).hide(500);
			$(".documentReceivedWaiver"+index).hide(500);
			$(".documentReceivedYes"+index).hide(500);
	    }
	}
	
	function showdocFields(value, index) {
		if(value == 0) {
			$(".documentReceivedNo"+index).show(500);
			$(".documentReceivedWaiver"+index).hide(300);
			$(".documentReceivedYes"+index).hide(300);
		} else if(value == 1) {
			$(".documentReceivedNo"+index).hide(300);
			$(".documentReceivedWaiver"+index).hide(300);
			$(".documentReceivedYes"+index).show(500);
		} else if(value == 2) {
			$(".documentReceivedNo"+index).hide(300);
			$(".documentReceivedWaiver"+index).show(500);
			$(".documentReceivedYes"+index).hide(300);
		}
	}
</script>