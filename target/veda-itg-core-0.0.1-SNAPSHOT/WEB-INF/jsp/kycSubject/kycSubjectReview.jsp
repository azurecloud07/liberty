<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="riskCategoryName" value="<%= ITGConstant.RISK_CATEGORY_NAME%>" />
<c:set var="riskCategoryShortCode" value="<%= ITGConstant.RISK_CATEGORY_SHORT_CODE%>" />

<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />
<spring:message code="kycSubject.registrationName.label" var="registrationNameLabel" />
<spring:message code="kycSubject.dateOfIncorp.label" var="dateOfIncorpLabel" />
<spring:message code="kycSubject.countryOfIncorp.label" var="countryOfIncorpLabel" />

<spring:message code="kycSubject.mitigation.file.extensions" var="mitigationFileExtensions" />
<input type="hidden" value="${mitigationFileExtensions}" id="mitigationFileExtensionsId" />
<input type="hidden" value="${kycSubjectReview.manualScreening.isAutoScreening}" id="isAutoScreening" />

<c:choose>
	<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true}">
		<c:set var="requestTab" value="rfs done"></c:set>
		<c:set var="screeningTab" value="ms active"></c:set>
		
		<c:set var="requestTabBody" value="tab-pane"></c:set>
		<c:set var="screeningTabBody" value="tab-pane active"></c:set>
		
		<c:choose>
			<c:when test="${kycSubjectReview.manualScreening.totalRiskLevel != ''}">
				<c:set var="screeningResult" value=""></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="screeningResult" value="[Awaiting Response]"></c:set>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<c:set var="requestTab" value="rfs active"></c:set>
		<c:set var="screeningTab" value="ms"></c:set>
		
		<c:set var="requestTabBody" value="tab-pane active"></c:set>
		<c:set var="screeningTabBody" value="tab-pane"></c:set>
		<c:set var="screeningResult" value=""></c:set>
	</c:otherwise>
</c:choose>


<input type="hidden" id="contextPathId" value="${contextPath}" />
<spring:message code="cancel.label" var="cancelLabel" />
<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i class="fa fa-angle-right"></i></li>
				<li>My Task<i class="fa fa-angle-right"></i></li>
                <li>KYC Subject<i class="fa fa-angle-right"></i></li>
                <li>Review</li>
            </ul>
			<h4>&nbsp;KYC Subject</h4>
        </div>
        
        <div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">
					<c:choose>
	               		<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true && (kycSubjectReview.manualScreening.totalRiskLevel == null || kycSubjectReview.manualScreening.totalRiskLevel == '') }">
	               			<button type="button" disabled="disabled" class="btn btn-sm grey-gallery">
			               		<em class="fa fa-check"></em> &nbsp;Approve
			                </button>
			                <button type="button" disabled="disabled" class="btn btn-sm grey-gallery" data-toggle="modal" data-target="#remarkModalId">
			               		<em class="fa fa-ban"></em> &nbsp;Reject
			               </button>
	               		</c:when>
	               		<c:otherwise>
	               			<button type="button" class="btn btn-sm grey-gallery" onclick="reviewerApproved('', '');">
			               		<em class="fa fa-check"></em> &nbsp;Approve
			                </button>
			                <button type="button" class="btn btn-sm grey-gallery" data-toggle="modal" data-target="#remarkModalId" onclick="setUpdateWorkflowDetails('','MakerReject');">
			               		<em class="fa fa-ban"></em> &nbsp;Reject
			               </button>
	               		</c:otherwise>
	               	</c:choose>
	               	<button type="button" id="cancelBtn" class="btn btn-sm grey-gallery">
						<em class="fa fa-times-circle"></em> ${cancelLabel}
					</button>
					 <%-- <c:choose>
						<c:when test="${nextStates != null && nextStates.length() > 0}">
		                	<c:forEach begin="0" end="${nextStates.length() -1}" var="index">
		                    	<c:choose>
						            <c:when test="${nextStates.get(index).getString('Label') == 'Approve'}">
						               <button type="button" class="btn btn-sm grey-gallery" onclick="reviewerApproved('${workflowId}', '${nextStates.get(index).getString('State')}');">
					               		  <em class="${nextStates.get(index).getString('iconClass')}"></em> ${nextStates.get(index).getString('Label')}
					                   </button>
						            </c:when>
						            <c:when test="${nextStates.get(index).getString('Label') == 'Return'}"></c:when>
						            <c:otherwise>
						               <button type="button" class="btn btn-sm grey-gallery" data-toggle="modal" data-target="#remarkModalId" onclick="setUpdateWorkflowDetails('${workflowId}', '${nextStates.get(index).getString('State')}');">
						               		<em class="${nextStates.get(index).getString('iconClass')}"></em> ${nextStates.get(index).getString('Label')}
						               </button>
						            </c:otherwise>
						         </c:choose>
	                    	</c:forEach>
	                  		<button type="button" id="cancelBtn" class="btn btn-sm grey-gallery">
								<em class="fa fa-times-circle"></em> ${cancelLabel}
							</button>
	                    </c:when>
					</c:choose> --%>
					<div class="clearfix margin-bottom-5"></div>
					</div>
				</div>
			</div>
	    
        <div class="row">
			<div class="col-md-12">
				<div class="portlet" id="form_wizard_1">
					<div class="portlet-body form">
						<form:form class="form-horizontal uk-form bt-flabels js-flabels" action="${contextPath}/kyc/subject/reviewAdd" id="mainFrm" role="form" method="POST" modelAttribute="kycSubjectReview" data-parsley-validate="true" data-parsley-errors-messages-disabled="true" enctype="multipart/form-data">
						<input type="hidden" id="subjectId" value="${kycSubjectBO.id}" />
						<input type="hidden" id="subjectRequestNo" value="${kycSubjectBO.kycSubjectRequestNo}" />
						
						<input type="hidden" name="manualScreening.kycSubjectId" value="${kycSubjectBO.id}" />
						
						<form:hidden path="id" />
							<textarea id="workflowId" style="display:none;"></textarea>
							<textarea id="stateId" style="display:none;"></textarea>
							<textarea id="masterId" style="display:none;">${kycSubjectBO.id}</textarea>
							<div class="form-wizard">
								<div class="form-body">
									<!-- <ul class="nav nav-pills nav-justified steps" style="padding: 0px !important;"> -->
									<ul class="nav nav-justified steps" style="padding: 0px !important;">
										<li class="${requestTab}">
											<a href="#" class="step">
												<span class="number"> 1 </span>
												<span class="desc"> <i class="fa fa-check"></i> Request for screening </span>
											</a>
										</li>
										<li class="${screeningTab}">
											<a href="#" class="step">
												<span class="number"> 2 </span>
												<span class="desc"> <i class="fa fa-check"></i> ${screeningLabel} </span>
											</a>
										</li>
										<li class="tm">
											<a href="#" class="step">
												<span class="number"> 3 </span>
												<span class="desc"> <i class="fa fa-check"></i> Document Collection </span>
											</a>
										</li>
										<li class="metigation mt" style="display:none;" >
											<a href="#" class="step">
												<span class="number"> 4 </span>
												<span class="desc"> <i class="fa fa-check"></i> Mitigation </span>
											</a>
										</li>
									</ul>
									<div id="bar" class="progress progress-striped hidden" role="progressbar">
										<div class="progress-bar progress-bar-success"></div>
									</div>
									<div class="tab-content">
										<div class="${requestTabBody}" id="tab1">
											<div class="row">
									            <div class="col-md-12">
									                <div class="portlet-body form">
									                    <div class="pull-right">
									                    <c:choose>
															<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true && (kycSubjectReview.manualScreening.totalRiskLevel == null || kycSubjectReview.manualScreening.totalRiskLevel == '') }">
																<button type="button" id="btnEdit" class="btn btn-sm grey-gallery disabled"><em class="fa fa-edit"></em> Edit</button>
										                    	<button type="button" class="btn btn-sm grey-gallery disabled">
										                            <em class="fa fa-file-code-o"></em> Manual Screening
										                        </button>
										                        <button type="button" class="btn btn-sm grey-gallery disabled">                                                    
										                            <em class="fa fa-external-link"></em> Send for Screening
										                        </button>
									                        </c:when>
									                        <c:otherwise>
									                        	<button type="button" id="btnEdit" class="btn btn-sm grey-gallery"><em class="fa fa-edit"></em> Edit</button>
									                        	<button type="button" id="manualScreening" class="btn btn-sm grey-gallery" onclick="showHideDivs(3);">
								                            		<em class="fa fa-file-code-o"></em> Manual Screening
									                        	</button>
									                        	<button type="button" id="sendForScreening" class="btn btn-sm grey-gallery">                                                    
									                           		<em class="fa fa-external-link"></em> Send for Screening
									                        	</button>
									                        </c:otherwise>
									                   </c:choose>
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
																		<input type="hidden" id="typeOfCounterTypeParty" value="${kycSubjectBO.typeOfCounterpartyCode}" />
																		<p class="form-control-static doc-name-align">
																			<c:if test="${kycSubjectBO != null && kycSubjectBO.typeOfCounterpartyName != null}">
																				${kycSubjectBO.typeOfCounterpartyName} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
															<!--/span-->
															
															<c:choose>
																<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">First Name:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.firstName" id="firstName" value="${kycSubjectBO.firstName}">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.firstName != null}">
																						${kycSubjectBO.firstName} 
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
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.middleName" id="middleName" value="${kycSubjectBO.middleName}">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.middleName != null}">
																						${kycSubjectBO.middleName} 
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
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.lastName" id="lastName" value="${kycSubjectBO.lastName}">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.lastName != null}">
																						${kycSubjectBO.lastName} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Date of Birth:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.dateOfBirth" id="dateOfBirth" value="${kycSubjectBO.dateOfBirth}">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfBirth != null}">
																					<fmt:formatDate pattern="MM/dd/yyyy" value="${kycSubjectBO.dateOfBirth}" />
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
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.occupation != null}">
																						${kycSubjectBO.occupation} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
															</c:when>
									                        <c:otherwise>
																<!--/span-->
																<div class="col-md-12">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">${registrationNameLabel} :</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<input type="hidden" name="manualScreening.registrationName" id="registrationName" value="${kycSubjectBO.registrationName}">
																				<c:if test="${kycSubjectBO != null && kycSubjectBO.registrationName != null}">
																					${kycSubjectBO.registrationName} 
																				</c:if>
																			</p>
																		</div>
																	</div>
																</div>
																<!--/span-->
																<div class="col-md-12">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">${dateOfIncorpLabel} :</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<input type="hidden" name="manualScreening.dateOfIncorporation" id="dateOfIncorporation" value="${kycSubjectBO.dateOfIncorporation}">
																				<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfIncorporation != null}">
																					<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycSubjectBO.dateOfIncorporation}" />
																				</c:if>
																			</p>
																		</div>
																	</div>
																</div>
									                        </c:otherwise>
										                 </c:choose>
															
															<div class="col-md-12 hidden">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">ITG Jurisdiction:</label>
																	<div class="col-md-6">
																		<p class="form-control-static doc-name-align">
																			<input type="hidden" id="itgJurisdictionCodeId" value="${kycSubjectBO.itgJurisdictionCode}" />
																			<c:if test="${kycSubjectBO != null && kycSubjectBO.itgJurisdictionName != null}">
																				${kycSubjectBO.itgJurisdictionName} 
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
														<div class="row hidden">
															<div class="col-md-12">
																<div class="form-group">
																	<label class="control-label col-md-6 bold">Jurisdiction:</label>
																	<div class="col-md-6">
																		<p class="form-control-static doc-name-align">
																			<input type="hidden" id="jurisdictionCodeId" value="${kycSubjectBO.jurisdictionCode}" />
																			<c:if test="${kycSubjectBO != null && kycSubjectBO.jurisdictionName != null}">
																				${kycSubjectBO.jurisdictionName} 
																			</c:if>
																		</p>
																	</div>
																</div>
															</div>
														</div>
														
														<c:choose>
															<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Residential Address:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																						${kycSubjectBO.residentialAddress} 
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
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																						${kycSubjectBO.stateCity} 
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
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																						${kycSubjectBO.zipCode} 
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
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.countryOfResidencyCode" id="countryOfResidencyCode" value="${kycSubjectBO.countryOfResidencyCode}">
																					<input type="hidden" id="countryOfResidency" value="${kycSubjectBO.countryOfResidencyCode}" />
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfResidencyName != null}">
																						${kycSubjectBO.countryOfResidencyName} 
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
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.countryOfBirthCode" id="countryOfBirthCode" value="${kycSubjectBO.countryOfBirthCode}">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfBirthName != null}">
																						${kycSubjectBO.countryOfBirthName} 
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
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.countryOfNationalityCode" id="countryOfNationalityCode" value="${kycSubjectBO.countryOfNationalityCode}">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfNationalityName != null}">
																						${kycSubjectBO.countryOfNationalityName} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																	<!--/span-->
																</div>
																<!--/row-->
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Email Address:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<%-- <input type="hidden" name="manualScreening.emailAddress" value="${kycSubjectBO.emailAddress}"> --%>
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.emailAddress != null}">
																						${kycSubjectBO.emailAddress} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Telephone Number:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<%-- <input type="hidden" name="manualScreening.telephoneNumber" value="${kycSubjectBO.telephoneNumber}"> --%>
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.telephoneNumber != null}">
																						${kycSubjectBO.telephoneNumber} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
															</c:when>
															<c:otherwise>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Address:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																						${kycSubjectBO.residentialAddress} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">City/State:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																						${kycSubjectBO.stateCity} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Zip code:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																						${kycSubjectBO.zipCode} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">${countryOfIncorpLabel} :</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<input type="hidden" name="manualScreening.countryOfIncorporationCode" id="countryOfIncorporationCode" value="${kycSubjectBO.countryOfIncorporationCode}">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfIncorporationName != null}">
																						${kycSubjectBO.countryOfIncorporationName} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
															</c:otherwise>
														</c:choose>
														
													</div>
													
													<c:if test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
														<div class="col-md-4">
															<h3 class="form-section">Other details</h3>
															<div class="row">
																<div class="col-md-12">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Any other former First Name:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherFirstName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherFirstName.length() > 0}">
																                    	${kycSubjectBO.anyOtherFirstName}
																                    </c:when>
																                    <c:otherwise>
																                    	-
															                    	</c:otherwise>
															                    </c:choose>
																			</p>
																		</div>
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Any other former Middle Name:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherMiddleName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherMiddleName.length() > 0}">
																                    	${kycSubjectBO.anyOtherMiddleName}
																                    </c:when>
																                    <c:otherwise>
																                    	-
															                    	</c:otherwise>
															                    </c:choose>
																			</p>
																		</div>
																	</div>
																</div>
																<!--/span-->
																<div class="col-md-12">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Any other former Last Name:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherLastName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherLastName.length() > 0}">
																                    	${kycSubjectBO.anyOtherLastName}
																                    </c:when>
																                    <c:otherwise>
																                    	-
															                    	</c:otherwise>
															                    </c:choose>
																			</p>
																		</div>
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Other Nationality:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																                    <c:when test="${kycSubjectBO != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.otherNationalityName.length() > 0}">
																                    	${kycSubjectBO.otherNationalityName}
																                    </c:when>
																                    <c:otherwise>
																                    	-
															                    	</c:otherwise>
															                    </c:choose>
																			</p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
												</div>
											</div>
											
											<div class="clearfix margin-bottom-10"></div>

                                            <div class="form-body" style="display:none">
												<h3 class="form-section">Target Contact Details</h3>
												<div class="row">
													<div class="col-md-12">
														<div class="col-md-4">
															<div class="form-group">
																<label class="control-label col-md-6 bold">Full	Name:</label>
																<div class="col-md-6">
																	<p class="form-control-static doc-name-align">
																		<c:choose>
																			<c:when test="${kycSubjectBO.fullNameOfTargetedContact.length() > 0}"> 
																				${kycSubjectBO.fullNameOfTargetedContact}
																	        </c:when>
																			<c:otherwise>
																				-
																            </c:otherwise>
																		</c:choose>
																	</p>
																</div>
															</div>
														</div>
														<div class="col-md-4">
															<div class="form-group">
																<label class="control-label col-md-6 bold">Address:</label>
																<div class="col-md-6">
																	<p class="form-control-static doc-name-align">
																		<c:choose>
																			<c:when test="${kycSubjectBO != null && kycSubjectBO.addressOfTargetedContact.length() > 0}">
																				${kycSubjectBO.addressOfTargetedContact}
																	        </c:when>
																			<c:otherwise>
																	        	-
																            </c:otherwise>
																		</c:choose>
																	</p>
																</div>
															</div>
														</div>
														<div class="col-md-4">
															<div class="form-group">
																<label class="control-label col-md-6 bold">Nationality:</label>
																<div class="col-md-6">
																	<p class="form-control-static doc-name-align">
																		<c:choose>
																			<c:when test="${kycSubjectBO != null && kycSubjectBO.nationalityOfTargetedContactName.length() > 0}">
																	        	${kycSubjectBO.nationalityOfTargetedContactName}
																			</c:when>
																			<c:otherwise>
																	        	-
																            </c:otherwise>
																		</c:choose>
																	</p>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-12">
														<div class="col-md-4">
															<div class="form-group">
																<label class="control-label col-md-6 bold">Email
																	Address:</label>
																<div class="col-md-6">
																	<p class="form-control-static doc-name-align">
																		<c:choose>
																			<c:when test="${kycSubjectBO != null && kycSubjectBO.emailAddressOfTargetedContact.length() > 0}">
																	        	${kycSubjectBO.emailAddressOfTargetedContact}
																	        </c:when>
																			<c:otherwise>
																				-
																            </c:otherwise>
																		</c:choose>
																	</p>
																</div>
															</div>
														</div>
														<div class="col-md-4">
															<div class="form-group">
																<label class="control-label col-md-6 bold">Phone Number:</label>
																<div class="col-md-6">
																	<p class="form-control-static doc-name-align">
																		<c:choose>
																			<c:when test="${kycSubjectBO != null && kycSubjectBO.phoneNumberOfTargetedContact.length() > 0}">
																	        	${kycSubjectBO.phoneNumberOfTargetedContact}
																	        </c:when>
																			<c:otherwise>
																				-
																			</c:otherwise>
																		</c:choose>
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="portlet">
												<div class="portlet-title">
													<div class="caption">
														<i class="icon-layers"></i> <span class="">Other Details</span>
													</div>
													<div class="tools hidden-xs">
														<a href="javascript:;" class="expand"></a>
													</div>
												</div>
												<div class="portlet-body form collapse">
													<div class="otherDetails">
										            	<c:choose>
															<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
																<div class="row">
																	<c:if test="${otherDetails.get(0).has('CountryOfCitizenship') && not empty otherDetails.get(0).get('CountryOfCitizenship')}">
										                              <div class="col-md-4">
											                              	<label class="control-label col-md-6 bold">Country Of Citizenship</label>
											                              	<p class="form-control-static doc-name-align">
												                           	   ${otherDetails.get(0).get('CountryOfCitizenship')}
												                           	</p>
										                              </div>
										                            </c:if>
																	<c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
										                              <div class="col-md-4">
											                              	<label class="control-label col-md-6 bold">KYC PartyType</label>
											                              	<p class="form-control-static doc-name-align">
												                           	   ${otherDetails.get(0).get('KYCPartyType')}
												                           	</p>
										                              </div>
										                            </c:if>
																</div>
																<!-- End Row -->
															</c:when>
															<c:otherwise>
																<!-- End Row -->
																<div class="row">
												                  <c:if test="${otherDetails.get(0).has('TMSManagerName') && not empty otherDetails.get(0).get('TMSManagerName')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">TMS Manager Name</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('TMSManagerName')}
											                          </p>
									                              	</div>
									                              </c:if>
												                  <c:if test="${otherDetails.get(0).has('TMSManagerEmailId') && not empty otherDetails.get(0).get('TMSManagerEmailId')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">TMS Manager EmailId</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('TMSManagerEmailId')}
											                          </p>
									                              	</div>
									                              	<div class="col-md-12">
													                    <hr>
													                </div>
									                              </c:if>
												               </div>
												               <!-- End Row -->
												               <div class="row">
												                  <c:if test="${otherDetails.get(0).has('TrainingClubOrAssociationBankAC') && not empty otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Training Club / Association Bank AC</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('BankName') && not empty otherDetails.get(0).get('BankName')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Bank Name</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('BankName')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('RoutingNumber') && not empty otherDetails.get(0).get('RoutingNumber')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Routing Number</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('RoutingNumber')}
											                          </p>
									                              	</div>
									                              </c:if>
												                  
												                  <c:if test="${otherDetails.get(0).has('AccountNumber') && not empty otherDetails.get(0).get('AccountNumber')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Account Number</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('AccountNumber')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                               <c:if test="${otherDetails.get(0).has('BankAccountType') && not empty otherDetails.get(0).get('BankAccountType')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Bank Account Type</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('BankAccountType')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('BankSwiftCode') && not empty otherDetails.get(0).get('BankSwiftCode')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Bank Swift Code</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('BankSwiftCode')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('BankCountry') && not empty otherDetails.get(0).get('BankCountry')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Bank Country</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('BankCountry')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('BranchIdentifier') && not empty otherDetails.get(0).get('BranchIdentifier')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Branch Identifier</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('BranchIdentifier')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
												               </div>
												               <!-- End Row -->
												               <div class="row">
												                  <c:if test="${otherDetails.get(0).has('ClubContactFullName') && not empty otherDetails.get(0).get('ClubContactFullName')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Full Name</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactFullName')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet1') && not empty otherDetails.get(0).get('ClubContactAddressStreet1')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Address Street1</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactAddressStreet1')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet2') && not empty otherDetails.get(0).get('ClubContactAddressStreet2')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Address Street2</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactAddressStreet2')}
											                          </p>
									                              	</div>
									                              </c:if>
												                  
												                  <c:if test="${otherDetails.get(0).has('ClubContactAddressCity') && not empty otherDetails.get(0).get('ClubContactAddressCity')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Address City</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactAddressCity')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactAddressState') && not empty otherDetails.get(0).get('ClubContactAddressState')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Address State</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactAddressState')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactAddressCountry') && not empty otherDetails.get(0).get('ClubContactAddressCountry')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Address Country</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactAddressCountry')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactAddressPostalCode') && not empty otherDetails.get(0).get('ClubContactAddressPostalCode')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Address PostalCode</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactAddressPostalCode')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactEmail_ID') && not empty otherDetails.get(0).get('ClubContactEmail_ID')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact EmailId</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactEmail_ID')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactPhone') && not empty otherDetails.get(0).get('ClubContactPhone')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Phone</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactPhone')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('ClubContactFax') && not empty otherDetails.get(0).get('ClubContactFax')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Club Contact Fax</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('ClubContactFax')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('StateOrCounty') && not empty otherDetails.get(0).get('StateOrCounty')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">State/County</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('StateOrCounty')}
											                          </p>
									                              	</div>
									                              </c:if>
												                              
									                               <c:if test="${otherDetails.get(0).has('Country') && not empty otherDetails.get(0).get('Country')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">Country</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('Country')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
									                              <c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
									                              	<div class="col-md-4">
										                              <label class="control-label col-md-6 bold">KYC PartyType</label>
										                              <p class="form-control-static doc-name-align">
											                           	  ${otherDetails.get(0).get('KYCPartyType')}
											                          </p>
									                              	</div>
									                              </c:if>
									                              
												               </div>
												               <!-- End Row -->
															</c:otherwise>
														</c:choose>
										            </div>
										            <!-- End Other Details -->
												</div>
												<!-- End portlet Body -->
											</div>
											<!-- End portlet  -->
														
											<div class="clearfix margin-bottom-10"></div>
											<c:if test="${kycSubjectBO != null && kycSubjectBO.proofList != null && kycSubjectBO.proofList.size() > 0}">
												<div class="row">
													<c:forEach items="${kycSubjectBO.proofList}" var="proofObject" varStatus="proofStatus">
													    <div class="col-md-4">
													        <!-- BEGIN ACCORDION PORTLET-->
													        <div class="portlet">
													            <div class="portlet-title">
													                <div class="caption">
													                    <i class=""></i>${proofObject.proofName}
													                </div>
													                <div class="tools">
													                    <a href="javascript:;" class="collapse"></a>
													                </div>
													            </div>
													            <div class="portlet-body">
													                <div class="panel-group accordion" id="accordion_${proofStatus.index}">
																		<c:if test="${proofObject.documentList != null && proofObject.documentList.size() > 0}">
														                    <c:forEach items="${proofObject.documentList}" var="docObject" varStatus="docStatus">
														                        <div class="panel panel-default">
														                            <div class="panel-heading">
														                                <h4 class="panel-title">
														                                  <a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion_${proofStatus.index}" href="#collapse_${proofStatus.index}_${docStatus.index}">
														
														                                    <c:if test="${docObject.documentReceived == 1}">
														                                      <span style="float:right">[Received: YES]</span>${docObject.documentName}
														                                    </c:if>
														
														                                    <c:if test="${docObject.documentReceived == 0}">
														                                      <span style="float:right">[Received: NO]</span>${docObject.documentName}
														                                    </c:if>
														
														                                    <c:if test="${docObject.documentReceived == 2}">
														                                      <span style="float:right">[Received: WAIVED]</span>${docObject.documentName}
														                                    </c:if> 
														                                  </a>
														                              </h4>
														                            </div>
														                            <div id="collapse_${proofStatus.index}_${docStatus.index}" class="panel-collapse collapse">
														                                <div class="panel-body">
																							<c:if test="${docObject.documentReceived == 1}">
														                                        <div class="form-group">
															                                        <c:if test="${docObject.documentAttributeList != null && docObject.documentAttributeList.size() > 0}">
																                                        <c:forEach items="${docObject.documentAttributeList}" var="attributeObject" varStatus="attrStatus">
																                                            <label class="control-label col-md-6 bold">${attributeObject.documentAttributeName}:</label>
																                                            <div class="col-md-6">
																                                                <p class="form-control-static doc-name-align">
																                                                    <span>${attributeObject.documentAttributeValue}</span>
																                                                </p>
																                                            </div>
																										</c:forEach>
																									</c:if>
																									<label class="control-label col-md-6 bold">Document:</label>
														                                            <div class="col-md-6">
														                                                <i class="fa fa-paperclip"></i><button type="button" class="btn btn-link doc-name-align" onclick="getFile( '${docObject.fileId}', '${docObject.fileName}', '${contextPath}');" >${docObject.fileName}</button>
														                                            </div>
														
														                                            <label class="control-label col-md-6 bold">Reference Number:</label>
														                                            <div class="col-md-6">
														                                                <p class="form-control-static doc-name-align">
														                                                    <span>${docObject.referenceNumber}</span>
														                                                </p>
														                                            </div>
														
														                                            <label class="control-label col-md-6 bold">Comment:</label>
														                                            <div class="col-md-6">
														                                                <p class="form-control-static doc-name-align">
														                                                    <span>${docObject.comment}</span>
														                                                </p>
														                                            </div>
														                                        </div>    
														                                    </c:if>
														
														                                    <c:if test="${docObject.documentReceived == 0}">
														                                        <label class="control-label col-md-6 bold">Due Date:</label>
														                                        <div class="col-md-6">
														                                            <p class="form-control-static doc-name-align">
														                                                <span><fmt:formatDate pattern="MM/dd/yyyy" value="${docObject.dueDate}" /></span>
														                                            </p>
														                                        </div>
														                                    </c:if>
														
														                                    <c:if test="${docObject.documentReceived == 2}">
														                                        <label class="control-label col-md-6 bold">Waived Reason:</label>
														                                        <div class="col-md-6">
														                                            <p class="form-control-static doc-name-align">
														                                                <span>${docObject.waiverReason}</span>
														                                            </p>
														                                        </div>
														                                    </c:if>
														                                    
														                                </div>
														                            </div>
														                        </div>
														                    </c:forEach>
													                	</c:if>
													                </div>
													            </div>
													        </div>
													    </div>
													</c:forEach>
												</div>
											</c:if>
								            <div class="clearfix margin-bottom-10"></div>
									            <c:if test="${kycSubjectBO.consentList != null && kycSubjectBO.consentList.size() > 0}">
										            <div class="page-bar">
														<ul class="page-breadcrumb">
															<li><em><strong>User Consent</strong></em></li>
														</ul>
													</div>
													<div class="clearfix margin-bottom-10"></div>
										            <c:forEach items="${kycSubjectBO.consentList}" var="consentObject" varStatus="consentStatus">
											            <div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<div class="col-md-12">								
																		<c:choose>
																			<c:when test="${consentObject.isConsentChecked}">
																				<input id="userConsent_${index}" name="userConsent_${consentStatus.index}" disabled type="checkbox" checked value="true" autocomplete="off" />
																			</c:when>
																			<c:otherwise>
																				<input id="userConsent_${index}" name="userConsent_${consentStatus.index}" disabled type="checkbox" value="false" autocomplete="off" />
																			</c:otherwise>
																		</c:choose>								
																		<label class="control-label">${consentObject.consentDescription}</label>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>
												<div class="col-md-12" align="center">
													<a href="javascript:;" class="btn default button-previous"> <i class="m-icon-swapleft"></i> Back </a>
													<a href="#" onclick="showHideDivs(0)" class="btn blue button-next grey-gallery"> Continue <i class="m-icon-swapright m-icon-white"></i> </a>
												</div>
												
										</div>
										
										<div class="${screeningTabBody}" id="tab2">
											<div class="row">
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
															<label class="noteLabel">${kycSubjectBO.typeOfCounterpartyName}</label>
															<br>
															<c:choose>
																<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																	<label class="noteLabel bold">Country of Residency :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfResidencyName}</label>
																	<br>
																	<label class="noteLabel bold">Country of Birth :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfBirthName}</label>
																	<br>
																	<label class="noteLabel bold">Country of Nationality :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfNationalityName}</label>	
																</c:when>
																<c:otherwise>
																	<label class="noteLabel bold">${countryOfIncorpLabel} :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfIncorporationName}</label>
																	<br>
																</c:otherwise>
															</c:choose>
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<c:choose>
																<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																	<label class="noteLabel bold">First Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.firstName}</label>
																	<br>
																	<label class="noteLabel bold">Middle Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.middleName}</label>						
																	<br>
																	<label class="noteLabel bold">Last Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.lastName}</label>
																	<br>	
																</c:when>
																<c:otherwise>
																	<label class="noteLabel bold">${registrationNameLabel} :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.registrationName}</label>
																	<br>
																</c:otherwise>
															</c:choose>
														</p>
													</div>
												</div>
											</div>
											
											<div class="col-md-12">
												<div class="row">
											        <div class="portlet">
														<div class="portlet-title">
															<div class="caption">
																<i class="icon-layers"></i> <span class="">Detail </span>
															</div>
															<div class="tools hidden-xs">
																<a href="javascript:;" class="expand"></a>
															</div>
														</div>
														<div class="portlet-body form collapse">
															<div class="form-body">
																<div class="row">
																	<div class="col-md-4">
																		<h3 class="form-section">KYC Details</h3>
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Counterparty(CP) Type:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.typeOfCounterpartyName != null}">
																								${kycSubjectBO.typeOfCounterpartyName} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																			<!--/span-->
																			<c:choose>
																				<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">First Name:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.firstName != null}">
																										${kycSubjectBO.firstName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.middleName != null}">
																										${kycSubjectBO.middleName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.lastName != null}">
																										${kycSubjectBO.lastName} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Date of Birth:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfBirth != null}">
																									<fmt:formatDate pattern="MM/dd/yyyy" value="${kycSubjectBO.dateOfBirth}" />
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.occupation != null}">
																										${kycSubjectBO.occupation} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<!--/span-->
																				</c:when>
																				<c:otherwise>
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">${registrationNameLabel} :</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<%-- <input type="hidden" name="manualScreening.middleName" id="middleNameId" value="${kycSubjectBO.middleName}"> --%>
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.registrationName != null}">
																										${kycSubjectBO.registrationName} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<!--/span-->
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">${dateOfIncorpLabel} :</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<%-- <input type="hidden" name="manualScreening.lastName" id="lastNameId" value="${kycSubjectBO.lastName}"> --%>
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfIncorporation != null}">
																										<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycSubjectBO.dateOfIncorporation}" />
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div>
																
																	<div class="col-md-4">
																		<h3 class="form-section">Address</h3>
																		<div class="row hidden">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Jurisdiction:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.jurisdictionName != null}">
																								${kycSubjectBO.jurisdictionName} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																		</div>
																		
																		<c:choose>
																			<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																				<div class="row">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Residential Address:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																										${kycSubjectBO.residentialAddress} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																										${kycSubjectBO.stateCity} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																										${kycSubjectBO.zipCode} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfResidencyName != null}">
																										${kycSubjectBO.countryOfResidencyName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfBirthName != null}">
																										${kycSubjectBO.countryOfBirthName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfNationalityName != null}">
																										${kycSubjectBO.countryOfNationalityName} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<!--/span-->
																				</div>
																				<!--/row-->
																				<div class="row">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Email Address:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.emailAddress != null}">
																										${kycSubjectBO.emailAddress} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="row">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Telephone Number:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.telephoneNumber != null}">
																										${kycSubjectBO.telephoneNumber} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																				</div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">Address:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																									${kycSubjectBO.residentialAddress} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">State/City:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																									${kycSubjectBO.stateCity} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">Zip code:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																									${kycSubjectBO.zipCode} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">${countryOfIncorpLabel} :</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfIncorporationName != null}">
																									${kycSubjectBO.countryOfIncorporationName} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																			</c:otherwise>
																		</c:choose>
																	</div>
																	
																	<c:if test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
																			<div class="col-md-4">
																		<h3 class="form-section">Other details</h3>
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Any other former First Name:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherFirstName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherFirstName.length() > 0}">
																			                    	${kycSubjectBO.anyOtherFirstName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Any other former Middle Name:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherMiddleName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherMiddleName.length() > 0}">
																			                    	${kycSubjectBO.anyOtherMiddleName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																			<!--/span-->
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Any other former Last Name:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherLastName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherLastName.length() > 0}">
																			                    	${kycSubjectBO.anyOtherLastName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Other Nationality:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.otherNationalityName.length() > 0}">
																			                    	${kycSubjectBO.otherNationalityName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	</c:if>
																</div>
																<div class="clearfix margin-bottom-10"></div>
																<!-- <h3 class="form-section">Target Contact Details</h3> -->
																<div class="row" style="display:none">
																	<div class="col-md-12">
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Full	Name:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO.fullNameOfTargetedContact.length() > 0}"> 
																								${kycSubjectBO.fullNameOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																								-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Address:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.addressOfTargetedContact.length() > 0}">
																								${kycSubjectBO.addressOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																					        	-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Nationality:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.nationalityOfTargetedContactName.length() > 0}">
																					        	${kycSubjectBO.nationalityOfTargetedContactName}
																							</c:when>
																							<c:otherwise>
																					        	-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Email
																					Address:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.emailAddressOfTargetedContact.length() > 0}">
																					        	${kycSubjectBO.emailAddressOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																								-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Phone Number:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.phoneNumberOfTargetedContact.length() > 0}">
																					        	${kycSubjectBO.phoneNumberOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																								-
																							</c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																
																<div class="portlet">
																	<div class="portlet-title">
																		<div class="caption">
																			<i class="icon-layers"></i> <span class="">Other Details</span>
																		</div>
																		<div class="tools hidden-xs">
																			<a href="javascript:;" class="expand"></a>
																		</div>
																	</div>
																	<div class="portlet-body form collapse">
																		<div class="otherDetails">
															            	<c:choose>
																				<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
																					<div class="row">
																						<c:if test="${otherDetails.get(0).has('CountryOfCitizenship') && not empty otherDetails.get(0).get('CountryOfCitizenship')}">
															                              <div class="col-md-4">
																                              	<label class="control-label col-md-6 bold">Country Of Citizenship</label>
																                              	<p class="form-control-static doc-name-align">
																	                           	   ${otherDetails.get(0).get('CountryOfCitizenship')}
																	                           	</p>
															                              </div>
															                            </c:if>
																						<c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
															                              <div class="col-md-4">
																                              	<label class="control-label col-md-6 bold">KYC PartyType</label>
																                              	<p class="form-control-static doc-name-align">
																	                           	   ${otherDetails.get(0).get('KYCPartyType')}
																	                           	</p>
															                              </div>
															                            </c:if>
																					</div>
																					<!-- End Row -->
																				</c:when>
																				<c:otherwise>
																					<!-- End Row -->
																					<div class="row">
																	                  <c:if test="${otherDetails.get(0).has('TMSManagerName') && not empty otherDetails.get(0).get('TMSManagerName')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">TMS Manager Name</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('TMSManagerName')}
																                          </p>
														                              	</div>
														                              </c:if>
																	                  <c:if test="${otherDetails.get(0).has('TMSManagerEmailId') && not empty otherDetails.get(0).get('TMSManagerEmailId')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">TMS Manager EmailId</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('TMSManagerEmailId')}
																                          </p>
														                              	</div>
														                              	<div class="col-md-12">
																		                    <hr>
																		                </div>
														                              </c:if>
																	               </div>
																	               <!-- End Row -->
																	               <div class="row">
																	                  <c:if test="${otherDetails.get(0).has('TrainingClubOrAssociationBankAC') && not empty otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Training Club / Association Bank AC</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BankName') && not empty otherDetails.get(0).get('BankName')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Name</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankName')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('RoutingNumber') && not empty otherDetails.get(0).get('RoutingNumber')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Routing Number</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('RoutingNumber')}
																                          </p>
														                              	</div>
														                              </c:if>
																	                  
																	                  <c:if test="${otherDetails.get(0).has('AccountNumber') && not empty otherDetails.get(0).get('AccountNumber')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Account Number</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('AccountNumber')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                               <c:if test="${otherDetails.get(0).has('BankAccountType') && not empty otherDetails.get(0).get('BankAccountType')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Account Type</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankAccountType')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BankSwiftCode') && not empty otherDetails.get(0).get('BankSwiftCode')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Swift Code</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankSwiftCode')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BankCountry') && not empty otherDetails.get(0).get('BankCountry')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Country</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankCountry')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BranchIdentifier') && not empty otherDetails.get(0).get('BranchIdentifier')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Branch Identifier</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BranchIdentifier')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
																	               </div>
																	               <!-- End Row -->
																	               <div class="row">
																	                  <c:if test="${otherDetails.get(0).has('ClubContactFullName') && not empty otherDetails.get(0).get('ClubContactFullName')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Full Name</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactFullName')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet1') && not empty otherDetails.get(0).get('ClubContactAddressStreet1')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address Street1</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressStreet1')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet2') && not empty otherDetails.get(0).get('ClubContactAddressStreet2')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address Street2</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressStreet2')}
																                          </p>
														                              	</div>
														                              </c:if>
																	                  
																	                  <c:if test="${otherDetails.get(0).has('ClubContactAddressCity') && not empty otherDetails.get(0).get('ClubContactAddressCity')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address City</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressCity')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressState') && not empty otherDetails.get(0).get('ClubContactAddressState')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address State</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressState')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressCountry') && not empty otherDetails.get(0).get('ClubContactAddressCountry')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address Country</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressCountry')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressPostalCode') && not empty otherDetails.get(0).get('ClubContactAddressPostalCode')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address PostalCode</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressPostalCode')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactEmail_ID') && not empty otherDetails.get(0).get('ClubContactEmail_ID')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact EmailId</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactEmail_ID')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactPhone') && not empty otherDetails.get(0).get('ClubContactPhone')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Phone</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactPhone')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactFax') && not empty otherDetails.get(0).get('ClubContactFax')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Fax</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactFax')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('StateOrCounty') && not empty otherDetails.get(0).get('StateOrCounty')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">State/County</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('StateOrCounty')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                               <c:if test="${otherDetails.get(0).has('Country') && not empty otherDetails.get(0).get('Country')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Country</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('Country')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">KYC PartyType</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('KYCPartyType')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
																	               </div>
																	               <!-- End Row -->
																				</c:otherwise>
																			</c:choose>
															            </div>
															            <!-- End Other Details -->
																	</div>
																	<!-- End portlet Body -->
																</div>
																<!-- End portlet  -->
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="clearfix margin-bottom-10"></div>
											<div class="row">
												<div class="col-md-12">										
													<h3 class="form-section">Screening Checks ${screeningResult}</h3>
													<input type="hidden" value="" name="manualScreening.screeningType" id="screeningTypeId">
													<c:if test="${kycSubjectReview.manualScreening.id != null && kycSubjectReview.manualScreening.id.length() > 0}">
													 		<form:hidden path="manualScreening.id" />
													</c:if>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-2 control-label"> PEP Risk</label>
														<c:choose>
															<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true}">
										                    	<div class="col-md-2">
																	<div class="radio-list">
																		<c:choose>
																			<c:when test="${kycSubjectReview.manualScreening.isPepRisk == true}">
																				<label class="radio-inline"><input class="enableField" type="radio" value="true" name="manualScreening.isPepRisk" disabled checked> 
																					Yes
																				</label> 
																				<label class="radio-inline"><input class="enableField" type="radio" value="false" name="manualScreening.isPepRisk" disabled> 
																					No
																				</label>	
																			</c:when>
																			<c:otherwise>
																				<label class="radio-inline"><input class="enableField" type="radio" value="true" name="manualScreening.isPepRisk" disabled> 
																					Yes
																				</label> 
																				<label class="radio-inline"><input class="enableField" type="radio" value="false" name="manualScreening.isPepRisk" disabled checked> 
																					No
																				</label>
																			</c:otherwise>
																		</c:choose>
																		
																	</div>
																</div>
									                        </c:when>
									                        <c:otherwise>
										                        <div class="col-md-2">
																	<div class="radio-list">
																		<label class="radio-inline"><form:radiobutton value="true" path="manualScreening.isPepRisk" /> 
																			Yes
																		</label> 
																		<label class="radio-inline"><form:radiobutton value="false" path="manualScreening.isPepRisk" /> 
																			No
																		</label>
																	</div>
																</div>
									                        </c:otherwise>
									                   </c:choose>
														<div class="col-md-2 hidden">
															<div class="bt-form__wrapper">
										                        <div class="form-group uk-width-1-1">
										                            <div class="bt-flabels__wrapper">
										                                <label class="parsley_hide">Risk Level</label>
																		<div class="field-background">
																			<form:select id="pepRiskLevel" path="manualScreening.pepRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="false"  data-parsley-group="kycSubjectReviewGroup">
																				<!-- <option value=""></option> -->
																				<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																					<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
																						<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
																					</c:forEach>
																				</c:if>
																			</form:select>
																		</div>
																		<span class="bt-flabels__error-desc_select">Required</span>
										                            </div>
										                        </div>
										                    </div>
														</div>
													</div>
													<div class="clearfix margin-bottom-10"></div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-2 control-label"> Sanctions Risk</label>
														<c:choose>
															<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true}">
										                    	<div class="col-md-2">
																	<div class="radio-list">
																		<c:choose>
																			<c:when test="${kycSubjectReview.manualScreening.isSanctionRisk == true}">
																				<label class="radio-inline"><input class="enableField" type="radio" value="true" name="manualScreening.isSanctionRisk" disabled checked> 
																					Yes
																				</label> 
																				<label class="radio-inline"><input class="enableField" type="radio" value="false" name="manualScreening.isSanctionRisk" disabled> 
																					No
																				</label>
																			</c:when>
																			<c:otherwise>
																				<label class="radio-inline"><input class="enableField" type="radio" value="true" name="manualScreening.isSanctionRisk" disabled> 
																					Yes
																				</label> 
																				<label class="radio-inline"><input class="enableField" type="radio" value="false" name="manualScreening.isSanctionRisk" disabled checked> 
																					No
																				</label>
																			</c:otherwise>
																		</c:choose>
																	</div>
																</div>
									                        </c:when>
									                        <c:otherwise>
										                        <div class="col-md-2">
																	<div class="radio-list">
																		<label class="radio-inline"><form:radiobutton value="true" path="manualScreening.isSanctionRisk" /> 
																			Yes
																		</label> 
																		<label class="radio-inline"><form:radiobutton value="false" path="manualScreening.isSanctionRisk" /> 
																			No
																		</label>
																	</div>
																</div>
									                        </c:otherwise>
									                   </c:choose>
														
														<div class="col-md-2 hidden">
															<div class="bt-form__wrapper">
										                        <div class="form-group uk-width-1-1">
										                            <div class="bt-flabels__wrapper">
										                                <label class="parsley_hide">Risk Level</label>
																		<div class="field-background">
																			<form:select id="sanctionsRiskLevel" path="manualScreening.sanctionsRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="false" data-parsley-group="kycSubjectReviewGroup">
																				<!-- <option value=""></option> -->
																				<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																					<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
																						<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
																					</c:forEach>
																				</c:if>
																			</form:select>
																		</div>
																		<span class="bt-flabels__error-desc_select">Required</span>
										                            </div>
										                        </div>
										                    </div>
														</div>
													</div>
													<div class="clearfix margin-bottom-10"></div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-2 control-label"> Activities Risk</label>
														<c:choose>
															<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true}">
										                    	<div class="col-md-2">
																	<div class="radio-list">
																		<c:choose>
																			<c:when test="${kycSubjectReview.manualScreening.isActivitiesRisk == true}">
																				<label class="radio-inline"><input class="enableField" type="radio" value="true" name="manualScreening.isActivitiesRisk" disabled checked> 
																					Yes
																				</label> 
																				<label class="radio-inline"><input class="enableField" type="radio" value="false" name="manualScreening.isActivitiesRisk" disabled> 
																					No
																				</label>	
																			</c:when>
																			<c:otherwise>
																				<label class="radio-inline"><input class="enableField" type="radio" value="true" name="manualScreening.isActivitiesRisk" disabled> 
																					Yes
																				</label> 
																				<label class="radio-inline"><input class="enableField" type="radio" value="false" name="manualScreening.isActivitiesRisk" disabled checked> 
																					No
																				</label>
																			</c:otherwise>
																		</c:choose>
																	</div>
																</div>
									                        </c:when>
									                        <c:otherwise>
										                        <div class="col-md-2">
																	<div class="radio-list">
																		<label class="radio-inline"><form:radiobutton value="true" path="manualScreening.isActivitiesRisk" /> 
																			Yes
																		</label> 
																		<label class="radio-inline"><form:radiobutton value="false" path="manualScreening.isActivitiesRisk" /> 
																			No
																		</label>
																	</div>
																</div>
									                        </c:otherwise>
									                   </c:choose>
														
														<div class="col-md-2 hidden">
															<div class="bt-form__wrapper">
										                        <div class="form-group uk-width-1-1">
										                            <div class="bt-flabels__wrapper">
										                                <label class="parsley_hide">Risk Level</label>
																		<div class="field-background">
																			<form:select id="activitiesRiskLevel" path="manualScreening.activitiesRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="false" data-parsley-group="kycSubjectReviewGroup">
																				<!-- <option value=""></option> -->
																				<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																					<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
																						<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
																					</c:forEach>
																				</c:if>
																			</form:select>
																		</div>
																		<span class="bt-flabels__error-desc_select">Required</span>
										                            </div>
										                        </div>
										                    </div>
														</div>
													</div>
													<div class="clearfix margin-bottom-10"></div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-2 control-label"> Country Risk</label>
														<!-- <div class="col-md-2"></div> -->
														<c:choose>
															<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true}">
										                    	<div class="col-md-2">
															<div class="bt-form__wrapper">
										                        <div class="form-group uk-width-1-1">
										                            <div class="bt-flabels__wrapper">
										                                <label class="parsley_hide">Risk Level</label>
																		<div class="field-background">
																			<form:select id="countryRiskLevel" path="manualScreening.countryRiskLevel" placeholder="Risk Level" class="form-control select2me enableField" data-parsley-required="false" data-parsley-group="kycSubjectReviewGroup" disabled="true">
																				<option value=""></option>
																				<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																					<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
																						<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
																					</c:forEach>
																				</c:if>
																			</form:select>
																		</div>
																		<span class="bt-flabels__error-desc_select">Required</span>
										                            </div>
										                        </div>
										                    </div>
														</div>
									                        </c:when>
									                        <c:otherwise>
										                        <div class="col-md-2">
																	<div class="bt-form__wrapper">
												                        <div class="form-group uk-width-1-1">
												                            <div class="bt-flabels__wrapper">
												                                <label class="parsley_hide">Risk Level</label>
																				<div class="field-background">
																					<form:select id="countryRiskLevel" path="manualScreening.countryRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
																						<option value=""></option>
																						<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																							<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
																								<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
																							</c:forEach>
																						</c:if>
																					</form:select>
																				</div>
																				<span class="bt-flabels__error-desc_select">Required</span>
												                            </div>
												                        </div>
												                    </div>
																</div>
									                        </c:otherwise>
									                   </c:choose>
													</div>
													<hr />
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-2 control-label"> Total Risk Level</label>
														<!-- <div class="col-md-2"></div> -->
														<c:choose>
															<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true}">
										                    	<div class="col-md-2">
																	<div class="bt-form__wrapper">
												                        <div class="form-group uk-width-1-1">
												                            <div class="bt-flabels__wrapper">
												                                <label class="parsley_hide">Risk Level</label>
																				<div class="field-background">
																					<form:select id="totalRiskLevel" path="manualScreening.totalRiskLevel" placeholder="Risk Level" class="form-control select2me enableField" data-parsley-required="false" data-parsley-group="kycSubjectReviewGroup"  disabled="true">
																						<option value=""></option>
																						<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																							<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
																								<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
																							</c:forEach>
																						</c:if>
																					</form:select>
																				</div>
																				<span class="bt-flabels__error-desc_select">Required</span>
												                            </div>
												                        </div>
												                    </div>
																</div>
									                        </c:when>
									                        <c:otherwise>
										                        <div class="col-md-2">
																	<div class="bt-form__wrapper">
												                        <div class="form-group uk-width-1-1">
												                            <div class="bt-flabels__wrapper">
												                                <label class="parsley_hide">Risk Level</label>
																				<div class="field-background">
																					<form:select id="totalRiskLevel" path="manualScreening.totalRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
																						<option value=""></option>
																						<c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																							<c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
																								<form:option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</form:option>
																							</c:forEach>
																						</c:if>
																					</form:select>
																				</div>
																				<span class="bt-flabels__error-desc_select">Required</span>
												                            </div>
												                        </div>
												                    </div>
																</div>
									                        </c:otherwise>
									                   </c:choose>
														
													</div>
												</div>
											</div>
											<div class="col-md-12" align="center">
												<a href="#" onclick="showHideDivs(5)" class="btn default button-previous"> <i class="m-icon-swapleft"></i> Back </a>
												
							                    <c:choose>
													<c:when test="${kycSubjectReview.manualScreening.isAutoScreening == true}">
														<c:choose>
															<c:when test="${kycSubjectReview.manualScreening.totalRiskLevel != ''}">
										                    	<a href="#" onclick="setRiskLevel()" class="btn blue button-next grey-gallery"> Continue <i class="m-icon-swapright m-icon-white"></i> </a>
									                        </c:when>
									                        <c:otherwise>
										                        <a href="#" class="btn blue button-next grey-gallery disabled"> Continue <i class="m-icon-swapright m-icon-white"></i> </a>
									                        </c:otherwise>
									                   </c:choose>
							                        </c:when>
							                        <c:otherwise>
							                        	<a href="#" onclick="setRiskLevel()" class="btn blue button-next grey-gallery"> Continue <i class="m-icon-swapright m-icon-white"></i> </a>
							                        </c:otherwise>
							                   </c:choose>
												
											</div>
										</div>
										
										<div class="tab-pane" id="tab3">
											<div class="row">
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
															<label class="noteLabel">${kycSubjectBO.typeOfCounterpartyName}</label>
															<br>
															<c:choose>
																<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																	<label class="noteLabel bold">Country of Residency :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfResidencyName}</label>
																	<br>
																	<label class="noteLabel bold">Country of Birth :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfBirthName}</label>
																	<br>
																	<label class="noteLabel bold">Country of Nationality :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfNationalityName}</label>	
																</c:when>
																<c:otherwise>
																	<label class="noteLabel bold">${countryOfIncorpLabel} :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfIncorporationName}</label>
																	<br>
																</c:otherwise>
															</c:choose>
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<c:choose>
																<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																	<label class="noteLabel bold">First Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.firstName}</label>
																	<br>
																	<label class="noteLabel bold">Middle Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.middleName}</label>						
																	<br>
																	<label class="noteLabel bold">Last Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.lastName}</label>
																	<br>	
																</c:when>
																<c:otherwise>
																	<label class="noteLabel bold">${registrationNameLabel} :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.registrationName}</label>
																	<br>
																</c:otherwise>
															</c:choose>
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<label class="noteLabel bold">Country Risk :</label>
															<label class="noteLabel">
															 	<span class="text-warning" id="tm_CountryRiskLevel"></span>
															</label>
															<br>
															<label class="noteLabel bold">Total Risk Level :</label>
															<label class="noteLabel"> 
															 	<span class="text-warning" id="tm_TotalRiskLevel"></span>
															</label>
															<br>
															<label class="noteLabel bold" style="display:none">PEP Risk :</label>
															<label class="noteLabel" style="display:none">
																<span class="text-warning" id="tm_isPepRisk"></span>
															 	<span class="text-warning" id="tm_PepRiskLevel"></span>
															</label>
															<br>
															<label class="noteLabel bold" style="display:none">Sanctions Risk :</label>
															<label class="noteLabel" style="display:none">
																<span class="text-warning" id="tm_isSanctionsRisk"></span>
															 	<span class="text-warning" id="tm_SanctionsRiskLevel"></span>	
															</label>
															<br>
															<label class="noteLabel bold" style="display:none">Activities Risk :</label>
															<label class="noteLabel" style="display:none">
																<span class="text-warning" id="tm_isActivitiesRisk"></span>
															 	<span class="text-warning" id="tm_ActivitiesRiskLevel"></span>
															</label>
															<br>
														</p>
													</div>
												</div>
											</div>
									        
									        <div class="portlet">
												<div class="portlet-title">
													<div class="caption">
														<i class="icon-layers"></i> <span class="">
														Detail </span>
													</div>
													<div class="tools hidden-xs">
														<a href="javascript:;" class="expand"></a>
													</div>
												</div>
												<div class="portlet-body form collapse">
													<div class="form-body">
														<div class="row">
															<div class="col-md-4">
																<h3 class="form-section">KYC Details</h3>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Counterparty(CP) Type:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.typeOfCounterpartyName != null}">
																						${kycSubjectBO.typeOfCounterpartyCode} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																	<!--/span-->
																	<c:choose>
																		<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">First Name:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.firstName != null}">
																								${kycSubjectBO.firstName} 
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.middleName != null}">
																								${kycSubjectBO.middleName} 
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.lastName != null}">
																								${kycSubjectBO.lastName} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Date of Birth:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfBirth != null}">
																							<fmt:formatDate pattern="MM/dd/yyyy" value="${kycSubjectBO.dateOfBirth}" />
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.occupation != null}">
																								${kycSubjectBO.occupation} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																			<!--/span-->
																		</c:when>
																		<c:otherwise>
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">${registrationNameLabel} :</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<%-- <input type="hidden" name="manualScreening.middleName" id="middleNameId" value="${kycSubjectBO.middleName}"> --%>
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.registrationName != null}">
																								${kycSubjectBO.registrationName} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																			<!--/span-->
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">${dateOfIncorpLabel} :</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<%-- <input type="hidden" name="manualScreening.lastName" id="lastNameId" value="${kycSubjectBO.lastName}"> --%>
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfIncorporation != null}">
																								<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycSubjectBO.dateOfIncorporation}" />
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														
															<div class="col-md-4">
																<h3 class="form-section">Address</h3>
																<div class="row hidden">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Jurisdiction:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:if test="${kycSubjectBO != null && kycSubjectBO.jurisdictionName != null}">
																						${kycSubjectBO.jurisdictionName} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
																
																<c:choose>
																	<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Residential Address:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																								${kycSubjectBO.residentialAddress} 
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																								${kycSubjectBO.stateCity} 
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																								${kycSubjectBO.zipCode} 
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfResidencyName != null}">
																								${kycSubjectBO.countryOfResidencyName} 
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfBirthName != null}">
																								${kycSubjectBO.countryOfBirthName} 
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
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfNationalityName != null}">
																								${kycSubjectBO.countryOfNationalityName} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																			<!--/span-->
																		</div>
																		<!--/row-->
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Email Address:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.emailAddress != null}">
																								${kycSubjectBO.emailAddress} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Telephone Number:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.telephoneNumber != null}">
																								${kycSubjectBO.telephoneNumber} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-12">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Address:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																							${kycSubjectBO.residentialAddress} 
																						</c:if>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-12">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">State/City:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																							${kycSubjectBO.stateCity} 
																						</c:if>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-12">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Zip code:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																							${kycSubjectBO.zipCode} 
																						</c:if>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-12">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">${countryOfIncorpLabel} :</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfIncorporationName != null}">
																							${kycSubjectBO.countryOfIncorporationName} 
																						</c:if>
																					</p>
																				</div>
																			</div>
																		</div>
																	</c:otherwise>
																</c:choose>
															</div>
															
															<c:if test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
																<div class="col-md-4">
																<h3 class="form-section">Other details</h3>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Any other former First Name:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:choose>
																	                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherFirstName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherFirstName.length() > 0}">
																	                    	${kycSubjectBO.anyOtherFirstName}
																	                    </c:when>
																	                    <c:otherwise>
																	                    	-
																                    	</c:otherwise>
																                    </c:choose>
																				</p>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Any other former Middle Name:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:choose>
																	                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherMiddleName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherMiddleName.length() > 0}">
																	                    	${kycSubjectBO.anyOtherMiddleName}
																	                    </c:when>
																	                    <c:otherwise>
																	                    	-
																                    	</c:otherwise>
																                    </c:choose>
																				</p>
																			</div>
																		</div>
																	</div>
																	<!--/span-->
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Any other former Last Name:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:choose>
																	                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherLastName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherLastName.length() > 0}">
																	                    	${kycSubjectBO.anyOtherLastName}
																	                    </c:when>
																	                    <c:otherwise>
																	                    	-
																                    	</c:otherwise>
																                    </c:choose>
																				</p>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="control-label col-md-6 bold">Other Nationality:</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:choose>
																	                    <c:when test="${kycSubjectBO != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.otherNationalityName.length() > 0}">
																	                    	${kycSubjectBO.otherNationalityName}
																	                    </c:when>
																	                    <c:otherwise>
																	                    	-
																                    	</c:otherwise>
																                    </c:choose>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															</c:if>
														</div>
														<div class="clearfix margin-bottom-10"></div>
														<!-- <h3 class="form-section">Target Contact Details</h3> -->
														<div class="row" style="display:none">
															<div class="col-md-12">
																<div class="col-md-4">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Full	Name:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																					<c:when test="${kycSubjectBO.fullNameOfTargetedContact.length() > 0}"> 
																						${kycSubjectBO.fullNameOfTargetedContact}
																			        </c:when>
																					<c:otherwise>
																						-
																		            </c:otherwise>
																				</c:choose>
																			</p>
																		</div>
																	</div>
																</div>
																<div class="col-md-4">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Address:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																					<c:when test="${kycSubjectBO != null && kycSubjectBO.addressOfTargetedContact.length() > 0}">
																						${kycSubjectBO.addressOfTargetedContact}
																			        </c:when>
																					<c:otherwise>
																			        	-
																		            </c:otherwise>
																				</c:choose>
																			</p>
																		</div>
																	</div>
																</div>
																<div class="col-md-4">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Nationality:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																					<c:when test="${kycSubjectBO != null && kycSubjectBO.nationalityOfTargetedContactName.length() > 0}">
																			        	${kycSubjectBO.nationalityOfTargetedContactName}
																					</c:when>
																					<c:otherwise>
																			        	-
																		            </c:otherwise>
																				</c:choose>
																			</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-md-12">
																<div class="col-md-4">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Email
																			Address:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																					<c:when test="${kycSubjectBO != null && kycSubjectBO.emailAddressOfTargetedContact.length() > 0}">
																			        	${kycSubjectBO.emailAddressOfTargetedContact}
																			        </c:when>
																					<c:otherwise>
																						-
																		            </c:otherwise>
																				</c:choose>
																			</p>
																		</div>
																	</div>
																</div>
																<div class="col-md-4">
																	<div class="form-group">
																		<label class="control-label col-md-6 bold">Phone Number:</label>
																		<div class="col-md-6">
																			<p class="form-control-static doc-name-align">
																				<c:choose>
																					<c:when test="${kycSubjectBO != null && kycSubjectBO.phoneNumberOfTargetedContact.length() > 0}">
																			        	${kycSubjectBO.phoneNumberOfTargetedContact}
																			        </c:when>
																					<c:otherwise>
																						-
																					</c:otherwise>
																				</c:choose>
																			</p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="portlet">
															<div class="portlet-title">
																<div class="caption">
																	<i class="icon-layers"></i> <span class="">Other Details</span>
																</div>
																<div class="tools hidden-xs">
																	<a href="javascript:;" class="expand"></a>
																</div>
															</div>
															<div class="portlet-body form collapse">
																<div class="otherDetails">
													            	<c:choose>
																		<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
																			<div class="row">
																				<c:if test="${otherDetails.get(0).has('CountryOfCitizenship') && not empty otherDetails.get(0).get('CountryOfCitizenship')}">
													                              <div class="col-md-4">
														                              	<label class="control-label col-md-6 bold">Country Of Citizenship</label>
														                              	<p class="form-control-static doc-name-align">
															                           	   ${otherDetails.get(0).get('CountryOfCitizenship')}
															                           	</p>
													                              </div>
													                            </c:if>
																				<c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
													                              <div class="col-md-4">
														                              	<label class="control-label col-md-6 bold">KYC PartyType</label>
														                              	<p class="form-control-static doc-name-align">
															                           	   ${otherDetails.get(0).get('KYCPartyType')}
															                           	</p>
													                              </div>
													                            </c:if>
																			</div>
																			<!-- End Row -->
																		</c:when>
																		<c:otherwise>
																			<div class="row">
															                  <c:if test="${otherDetails.get(0).has('TMSManagerName') && not empty otherDetails.get(0).get('TMSManagerName')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">TMS Manager Name</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('TMSManagerName')}
														                          </p>
												                              	</div>
												                              </c:if>
															                  <c:if test="${otherDetails.get(0).has('TMSManagerEmailId') && not empty otherDetails.get(0).get('TMSManagerEmailId')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">TMS Manager EmailId</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('TMSManagerEmailId')}
														                          </p>
												                              	</div>
												                              	<div class="col-md-12">
																                    <hr>
																                </div>
												                              </c:if>
															               </div>
															               <!-- End Row -->
															               <div class="row">
															                  <c:if test="${otherDetails.get(0).has('TrainingClubOrAssociationBankAC') && not empty otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Training Club / Association Bank AC</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('BankName') && not empty otherDetails.get(0).get('BankName')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Bank Name</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('BankName')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('RoutingNumber') && not empty otherDetails.get(0).get('RoutingNumber')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Routing Number</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('RoutingNumber')}
														                          </p>
												                              	</div>
												                              </c:if>
															                  
															                  <c:if test="${otherDetails.get(0).has('AccountNumber') && not empty otherDetails.get(0).get('AccountNumber')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Account Number</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('AccountNumber')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                               <c:if test="${otherDetails.get(0).has('BankAccountType') && not empty otherDetails.get(0).get('BankAccountType')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Bank Account Type</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('BankAccountType')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('BankSwiftCode') && not empty otherDetails.get(0).get('BankSwiftCode')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Bank Swift Code</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('BankSwiftCode')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('BankCountry') && not empty otherDetails.get(0).get('BankCountry')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Bank Country</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('BankCountry')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('BranchIdentifier') && not empty otherDetails.get(0).get('BranchIdentifier')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Branch Identifier</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('BranchIdentifier')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
															               </div>
															               <!-- End Row -->
															               <div class="row">
															                  <c:if test="${otherDetails.get(0).has('ClubContactFullName') && not empty otherDetails.get(0).get('ClubContactFullName')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Full Name</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactFullName')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet1') && not empty otherDetails.get(0).get('ClubContactAddressStreet1')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Address Street1</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactAddressStreet1')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet2') && not empty otherDetails.get(0).get('ClubContactAddressStreet2')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Address Street2</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactAddressStreet2')}
														                          </p>
												                              	</div>
												                              </c:if>
															                  
															                  <c:if test="${otherDetails.get(0).has('ClubContactAddressCity') && not empty otherDetails.get(0).get('ClubContactAddressCity')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Address City</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactAddressCity')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactAddressState') && not empty otherDetails.get(0).get('ClubContactAddressState')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Address State</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactAddressState')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactAddressCountry') && not empty otherDetails.get(0).get('ClubContactAddressCountry')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Address Country</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactAddressCountry')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactAddressPostalCode') && not empty otherDetails.get(0).get('ClubContactAddressPostalCode')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Address PostalCode</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactAddressPostalCode')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactEmail_ID') && not empty otherDetails.get(0).get('ClubContactEmail_ID')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact EmailId</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactEmail_ID')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactPhone') && not empty otherDetails.get(0).get('ClubContactPhone')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Phone</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactPhone')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('ClubContactFax') && not empty otherDetails.get(0).get('ClubContactFax')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Club Contact Fax</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('ClubContactFax')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('StateOrCounty') && not empty otherDetails.get(0).get('StateOrCounty')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">State/County</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('StateOrCounty')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                               <c:if test="${otherDetails.get(0).has('Country') && not empty otherDetails.get(0).get('Country')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">Country</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('Country')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
												                              <c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
												                              	<div class="col-md-4">
													                              <label class="control-label col-md-6 bold">KYC PartyType</label>
													                              <p class="form-control-static doc-name-align">
														                           	  ${otherDetails.get(0).get('KYCPartyType')}
														                          </p>
												                              	</div>
												                              </c:if>
												                              
															               </div>
															               <!-- End Row -->
																		</c:otherwise>
																	</c:choose>
													            </div>
													            <!-- End Other Details -->
															</div>
															<!-- End portlet Body -->
														</div>
														<!-- End portlet  -->
													</div>
												</div>
											</div>

											<div class="clearfix margin-bottom-10"></div>
								            <div class="row">
								            	<div class="col-md-12">
								            		<h3 class="form-section">Template Name: <span class="text-warning" id="kycTemplateName"></span></h3>
								            	</div>
								            	<div class="col-md-12" id="usedDocumentList"  style="display:none">
								            		<label class="text-danger">No Document found</label>
								            	</div>
												
								            	<div id="usedProofDiv"></div>
												
											</div>
											<div class="clearfix margin-bottom-10"></div>
								            <div class="row">
								            	<div class="col-md-12">
								            		<h3 class="form-section"><span class="text-danger">Unused Documents</span></h3>
								            	</div>
								            	<div class="col-md-12" id="unusedDocumentList" style="display:none">
								            		<label class="text-danger">No Document found</label>
								            	</div>
												<div id="unUsedProofDiv"></div>
											</div>
											<hr/>
												<div class="row">
													<div class="">
														<div class="col-md-7">
															<label class="control-label">
																Do we have all the identity info that we need to satisfy the regulator of the given jurisdiction for this level of risk?
															</label>
														</div>
														<div class="col-md-5">
															<div class="radio-list">
																<c:choose>
												               		<c:when test="${kycSubjectReview.MITQ1 != '' && kycSubjectReview.MITQ1.length() > 0 && kycSubjectReview.MITQ1 != null}">
												               			<c:if test="${kycSubjectReview.MITQ1 == 'PASS'}">
																			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q1Pass" value="PASS" path="MITQ1" checked="checked"/>PASS</label>
																			<label class="radio-inline"><form:radiobutton class="MITQ" value="FAIL" id="Q1Fail" path="MITQ1"/>FAIL</label>
																		</c:if>
												               			 <c:if test="${kycSubjectReview.MITQ1 == 'FAIL'}">
																			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q1Pass" value="PASS" path="MITQ1"/>PASS</label>
																			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q1Fail" value="FAIL" path="MITQ1" checked="checked"/>FAIL</label>
																		</c:if>
												               		</c:when>
												               		<c:otherwise>
												               			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q1Pass" value="PASS" path="MITQ1" checked="checked"/>PASS</label>
																		<label class="radio-inline"><form:radiobutton class="MITQ" value="FAIL" id="Q1Fail" path="MITQ1"/>FAIL</label>
												               		</c:otherwise>
												               	</c:choose>
															</div>
														</div>
														<div class="col-md-7">
															<label class="control-label">
																Do we have the supporting evidence (mitigants) that we need to satisfy the regulator of the given jurisdiction for this level of risk?
															</label>
														</div>
														<div class="col-md-5">
															<div class="radio-list">
																<c:choose>
												               		<c:when test="${kycSubjectReview.MITQ2 != '' && kycSubjectReview.MITQ2.length() > 0 && kycSubjectReview.MITQ2 != null}">
												               			<c:if test="${kycSubjectReview.MITQ2 == 'PASS'}">
																			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q2Pass" value="PASS" path="MITQ2" checked="checked"/>PASS</label>
																			<label class="radio-inline"><form:radiobutton class="MITQ" value="FAIL" id="Q2Fail" path="MITQ2"/>FAIL</label>
																		</c:if>
												               			 <c:if test="${kycSubjectReview.MITQ2 == 'FAIL'}">
																			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q2Pass" value="PASS" path="MITQ2"/>PASS</label>
																			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q2Fail" value="FAIL" path="MITQ2" checked="checked"/>FAIL</label>
																		</c:if>
												               		</c:when>
												               		<c:otherwise>
												               			<label class="radio-inline"><form:radiobutton class="MITQ" id="Q2Pass" value="PASS" path="MITQ2" checked="checked"/>PASS</label>
																		<label class="radio-inline"><form:radiobutton class="MITQ" value="FAIL" id="Q2Fail" path="MITQ2"/>FAIL</label>
												               		</c:otherwise>
												               	</c:choose>
															</div>
														</div>
														<div class="col-md-7"></div>
														<div class="col-md-5">
															<h3>
																<span class="text-default">STATUS : 
																	<form:hidden path="finalResult" value="PASS"/>
																	<c:if test="${kycSubjectReview.finalResult == '' && kycSubjectReview.finalResult.length() == 0 || kycSubjectReview.finalResult.length() == null}">
																		<span class="text-success PASS">[PASS]</span>
																		<span class="text-danger FAIL hidden">[FAIL]</span>
																	</c:if>
																	<c:if test="${kycSubjectReview.finalResult == 'PASS' && kycSubjectReview.finalResult.length() > 0}">
																		<span class="text-success PASS">[PASS]</span>
																		<span class="text-danger FAIL hidden">[FAIL]</span>
																	</c:if>
																	<c:if test="${kycSubjectReview.finalResult == 'FAIL' && kycSubjectReview.finalResult.length() > 0}">
																		<span class="text-success PASS hidden">[PASS]</span>
																		<span class="text-danger FAIL">[FAIL]</span>
																	</c:if>
																</span>
															</h3>
														</div>
													</div>
												</div>
								            <div class="clearfix margin-bottom-10"></div>
											<div class="col-md-12" align="center">
												<a href="#" onclick="showHideDivs(6)" class="btn default button-previous"> <i class="m-icon-swapleft"></i> Back </a>
												<a href="#" onclick="showHideDivs(2)" id="btn_continue" class="btn blue button-next grey-gallery"> Continue <i class="m-icon-swapright m-icon-white"></i> </a>
											</div>
										</div>
										<div class="tab-pane" id="tab4">
											<div class="row">
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
															<label class="noteLabel">${kycSubjectBO.typeOfCounterpartyName}</label>
															<br>
															<c:choose>
																<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																	<label class="noteLabel bold">Country of Residency :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfResidencyName}</label>
																	<br>
																	<label class="noteLabel bold">Country of Birth :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfBirthName}</label>
																	<br>
																	<label class="noteLabel bold">Country of Nationality :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfNationalityName}</label>	
																</c:when>
																<c:otherwise>
																	<label class="noteLabel bold">${countryOfIncorpLabel} :</label> 
																	<label class="noteLabel">${kycSubjectBO.countryOfIncorporationName}</label>
																	<br>
																</c:otherwise>
															</c:choose>
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<c:choose>
																<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																	<label class="noteLabel bold">First Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.firstName}</label>
																	<br>
																	<label class="noteLabel bold">Middle Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.middleName}</label>						
																	<br>
																	<label class="noteLabel bold">Last Name :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.lastName}</label>
																	<br>	
																</c:when>
																<c:otherwise>
																	<label class="noteLabel bold">${registrationNameLabel} :</label> 
																	<label class="noteLabel doc-name-align">${kycSubjectBO.registrationName}</label>
																	<br>
																</c:otherwise>
															</c:choose>
														</p>
													</div>
												</div>
												<div class="col-md-4">
													<div class="note note-grey-gallery">
														<p>
															<label class="noteLabel bold">Country Risk :</label>
															<label class="noteLabel">
															 	<span class="text-warning" id="mt_CountryRiskLevel"></span>
															</label>
															<br>
															<label class="noteLabel bold">Total Risk Level :</label>
															<label class="noteLabel"> 
															 	<span class="text-warning" id="mt_TotalRiskLevel"></span>
															</label>
															<br>
															<label class="noteLabel bold" style="display:none">PEP Risk :</label>
															<label class="noteLabel" style="display:none">
																<span class="text-warning" id="mt_isPepRisk"></span>
															 	<span class="text-warning" id="mt_PepRiskLevel"></span>
															</label>
															<br>
															<label class="noteLabel bold" style="display:none">Sanctions Risk :</label>
															<label class="noteLabel" style="display:none">
																<span class="text-warning" id="mt_isSanctionsRisk"></span>
															 	<span class="text-warning" id="mt_SanctionsRiskLevel"></span>	
															</label>
															<br>
															<label class="noteLabel bold" style="display:none">Activities Risk :</label>
															<label class="noteLabel" style="display:none">
																<span class="text-warning" id="mt_isActivitiesRisk"></span>
															 	<span class="text-warning" id="mt_ActivitiesRiskLevel"></span>
															</label>
															<br>
														</p>
													</div>
												</div>
											</div>
									        <div class="col-md-12">
										        <div class="row">
											        <div class="portlet">
														<div class="portlet-title">
															<div class="caption">
																<i class="icon-layers"></i> <span class="">
																Detail </span>
															</div>
															<div class="tools hidden-xs">
																<a href="javascript:;" class="expand"></a>
															</div>
														</div>
														<div class="portlet-body form collapse">
															<div class="form-body">
																<div class="row">
																	<div class="col-md-4">
																		<h3 class="form-section">KYC Details</h3>
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Counterparty(CP) Type:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.typeOfCounterpartyName != null}">
																								${kycSubjectBO.typeOfCounterpartyCode} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																			<!--/span-->
																			<c:choose>
																				<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">First Name:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.firstName != null}">
																										${kycSubjectBO.firstName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.middleName != null}">
																										${kycSubjectBO.middleName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.lastName != null}">
																										${kycSubjectBO.lastName} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Date of Birth:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfBirth != null}">
																									<fmt:formatDate pattern="MM/dd/yyyy" value="${kycSubjectBO.dateOfBirth}" />
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.occupation != null}">
																										${kycSubjectBO.occupation} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<!--/span-->
																				</c:when>
																				<c:otherwise>
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">${registrationNameLabel} :</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<%-- <input type="hidden" name="manualScreening.middleName" id="middleNameId" value="${kycSubjectBO.middleName}"> --%>
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.registrationName != null}">
																										${kycSubjectBO.registrationName} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<!--/span-->
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">${dateOfIncorpLabel} :</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<%-- <input type="hidden" name="manualScreening.lastName" id="lastNameId" value="${kycSubjectBO.lastName}"> --%>
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.dateOfIncorporation != null}">
																										<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycSubjectBO.dateOfIncorporation}" />
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div>
																
																	<div class="col-md-4">
																		<h3 class="form-section">Address</h3>
																		<div class="row hidden">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Jurisdiction:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:if test="${kycSubjectBO != null && kycSubjectBO.jurisdictionName != null}">
																								${kycSubjectBO.jurisdictionName} 
																							</c:if>
																						</p>
																					</div>
																				</div>
																			</div>
																		</div>
																		
																		<c:choose>
																			<c:when test="${kycSubjectBO.typeOfCounterpartyName == 'Individual'}">
																				<div class="row">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Residential Address:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																										${kycSubjectBO.residentialAddress} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																										${kycSubjectBO.stateCity} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																										${kycSubjectBO.zipCode} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfResidencyName != null}">
																										${kycSubjectBO.countryOfResidencyName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfBirthName != null}">
																										${kycSubjectBO.countryOfBirthName} 
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
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfNationalityName != null}">
																										${kycSubjectBO.countryOfNationalityName} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																					<!--/span-->
																				</div>
																				<!--/row-->
																				<div class="row">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Email Address:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.emailAddress != null}">
																										${kycSubjectBO.emailAddress} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="row">
																					<div class="col-md-12">
																						<div class="form-group">
																							<label class="control-label col-md-6 bold">Telephone Number:</label>
																							<div class="col-md-6">
																								<p class="form-control-static doc-name-align">
																									<c:if test="${kycSubjectBO != null && kycSubjectBO.telephoneNumber != null}">
																										${kycSubjectBO.telephoneNumber} 
																									</c:if>
																								</p>
																							</div>
																						</div>
																					</div>
																				</div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">Address:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.residentialAddress != null}">
																									${kycSubjectBO.residentialAddress} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">State/City:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.stateCity != null}">
																									${kycSubjectBO.stateCity} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">Zip code:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.zipCode != null}">
																									${kycSubjectBO.zipCode} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">${countryOfIncorpLabel} :</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${kycSubjectBO != null && kycSubjectBO.countryOfIncorporationName != null}">
																									${kycSubjectBO.countryOfIncorporationName} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																			</c:otherwise>
																		</c:choose>
																	</div>
																	
																	<c:if test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
																		<div class="col-md-4">
																		<h3 class="form-section">Other details</h3>
																		<div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Any other former First Name:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherFirstName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherFirstName.length() > 0}">
																			                    	${kycSubjectBO.anyOtherFirstName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Any other former Middle Name:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherMiddleName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherMiddleName.length() > 0}">
																			                    	${kycSubjectBO.anyOtherMiddleName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																			<!--/span-->
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Any other former Last Name:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.anyOtherLastName != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.anyOtherLastName.length() > 0}">
																			                    	${kycSubjectBO.anyOtherLastName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="control-label col-md-6 bold">Other Nationality:</label>
																					<div class="col-md-6">
																						<p class="form-control-static doc-name-align">
																							<c:choose>
																			                    <c:when test="${kycSubjectBO != null && kycSubjectBO.otherNationalityName != null && kycSubjectBO.otherNationalityName.length() > 0}">
																			                    	${kycSubjectBO.otherNationalityName}
																			                    </c:when>
																			                    <c:otherwise>
																			                    	-
																		                    	</c:otherwise>
																		                    </c:choose>
																						</p>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	</c:if>
																</div>
																<div class="clearfix margin-bottom-10"></div>
																<!-- <h3 class="form-section">Target Contact Details</h3> -->
																<div class="row" style="display:none">
																	<div class="col-md-12">
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Full	Name:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO.fullNameOfTargetedContact.length() > 0}"> 
																								${kycSubjectBO.fullNameOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																								-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Address:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.addressOfTargetedContact.length() > 0}">
																								${kycSubjectBO.addressOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																					        	-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Nationality:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.nationalityOfTargetedContactName.length() > 0}">
																					        	${kycSubjectBO.nationalityOfTargetedContactName}
																							</c:when>
																							<c:otherwise>
																					        	-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Email
																					Address:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.emailAddressOfTargetedContact.length() > 0}">
																					        	${kycSubjectBO.emailAddressOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																								-
																				            </c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																		<div class="col-md-4">
																			<div class="form-group">
																				<label class="control-label col-md-6 bold">Phone Number:</label>
																				<div class="col-md-6">
																					<p class="form-control-static doc-name-align">
																						<c:choose>
																							<c:when test="${kycSubjectBO != null && kycSubjectBO.phoneNumberOfTargetedContact.length() > 0}">
																					        	${kycSubjectBO.phoneNumberOfTargetedContact}
																					        </c:when>
																							<c:otherwise>
																								-
																							</c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																
																<div class="portlet">
																	<div class="portlet-title">
																		<div class="caption">
																			<i class="icon-layers"></i> <span class="">Other Details</span>
																		</div>
																		<div class="tools hidden-xs">
																			<a href="javascript:;" class="expand"></a>
																		</div>
																	</div>
																	<div class="portlet-body form collapse">
																		<div class="otherDetails">
															            	<c:choose>
																				<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
																					<div class="row">
																						<c:if test="${otherDetails.get(0).has('CountryOfCitizenship') && not empty otherDetails.get(0).get('CountryOfCitizenship')}">
															                              <div class="col-md-4">
																                              	<label class="control-label col-md-6 bold">Country Of Citizenship</label>
																                              	<p class="form-control-static doc-name-align">
																	                           	   ${otherDetails.get(0).get('CountryOfCitizenship')}
																	                           	</p>
															                              </div>
															                            </c:if>
																						<c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
															                              <div class="col-md-4">
																                              	<label class="control-label col-md-6 bold">KYC PartyType</label>
																                              	<p class="form-control-static doc-name-align">
																	                           	   ${otherDetails.get(0).get('KYCPartyType')}
																	                           	</p>
															                              </div>
															                            </c:if>
																					</div>
																					<!-- End Row -->
																				</c:when>
																				<c:otherwise>
																					<div class="row">
																	                  <c:if test="${otherDetails.get(0).has('TMSManagerName') && not empty otherDetails.get(0).get('TMSManagerName')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">TMS Manager Name</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('TMSManagerName')}
																                          </p>
														                              	</div>
														                              </c:if>
																	                  <c:if test="${otherDetails.get(0).has('TMSManagerEmailId') && not empty otherDetails.get(0).get('TMSManagerEmailId')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">TMS Manager EmailId</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('TMSManagerEmailId')}
																                          </p>
														                              	</div>
														                              	<div class="col-md-12">
																		                    <hr>
																		                </div>
														                              </c:if>
																	               </div>
																	               <!-- End Row -->
																	               <div class="row">
																	                  <c:if test="${otherDetails.get(0).has('TrainingClubOrAssociationBankAC') && not empty otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Training Club / Association Bank AC</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('TrainingClubOrAssociationBankAC')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BankName') && not empty otherDetails.get(0).get('BankName')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Name</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankName')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('RoutingNumber') && not empty otherDetails.get(0).get('RoutingNumber')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Routing Number</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('RoutingNumber')}
																                          </p>
														                              	</div>
														                              </c:if>
																	                  
																	                  <c:if test="${otherDetails.get(0).has('AccountNumber') && not empty otherDetails.get(0).get('AccountNumber')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Account Number</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('AccountNumber')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                               <c:if test="${otherDetails.get(0).has('BankAccountType') && not empty otherDetails.get(0).get('BankAccountType')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Account Type</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankAccountType')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BankSwiftCode') && not empty otherDetails.get(0).get('BankSwiftCode')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Swift Code</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankSwiftCode')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BankCountry') && not empty otherDetails.get(0).get('BankCountry')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Bank Country</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BankCountry')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('BranchIdentifier') && not empty otherDetails.get(0).get('BranchIdentifier')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Branch Identifier</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('BranchIdentifier')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
																	               </div>
																	               <!-- End Row -->
																	               <div class="row">
																	                  <c:if test="${otherDetails.get(0).has('ClubContactFullName') && not empty otherDetails.get(0).get('ClubContactFullName')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Full Name</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactFullName')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet1') && not empty otherDetails.get(0).get('ClubContactAddressStreet1')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address Street1</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressStreet1')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressStreet2') && not empty otherDetails.get(0).get('ClubContactAddressStreet2')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address Street2</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressStreet2')}
																                          </p>
														                              	</div>
														                              </c:if>
																	                  
																	                  <c:if test="${otherDetails.get(0).has('ClubContactAddressCity') && not empty otherDetails.get(0).get('ClubContactAddressCity')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address City</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressCity')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressState') && not empty otherDetails.get(0).get('ClubContactAddressState')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address State</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressState')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressCountry') && not empty otherDetails.get(0).get('ClubContactAddressCountry')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address Country</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressCountry')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactAddressPostalCode') && not empty otherDetails.get(0).get('ClubContactAddressPostalCode')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Address PostalCode</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactAddressPostalCode')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactEmail_ID') && not empty otherDetails.get(0).get('ClubContactEmail_ID')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact EmailId</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactEmail_ID')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactPhone') && not empty otherDetails.get(0).get('ClubContactPhone')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Phone</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactPhone')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('ClubContactFax') && not empty otherDetails.get(0).get('ClubContactFax')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Club Contact Fax</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('ClubContactFax')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('StateOrCounty') && not empty otherDetails.get(0).get('StateOrCounty')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">State/County</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('StateOrCounty')}
																                          </p>
														                              	</div>
														                              </c:if>
												                              
														                               <c:if test="${otherDetails.get(0).has('Country') && not empty otherDetails.get(0).get('Country')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">Country</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('Country')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
														                              <c:if test="${otherDetails.get(0).has('KYCPartyType') && not empty otherDetails.get(0).get('KYCPartyType')}">
														                              	<div class="col-md-4">
															                              <label class="control-label col-md-6 bold">KYC PartyType</label>
															                              <p class="form-control-static doc-name-align">
																                           	  ${otherDetails.get(0).get('KYCPartyType')}
																                          </p>
														                              	</div>
														                              </c:if>
														                              
																	               </div>
																	               <!-- End Row -->
																				</c:otherwise>
																			</c:choose>
															            </div>
															            <!-- End Other Details -->
																	</div>
																	<!-- End portlet Body -->
																</div>
																<!-- End portlet  -->
															</div>
														</div>
													</div>
												</div>
												
												<div class="clearfix margin-bottom-10"></div>
												<span id="activitySection">
												<c:set var="activityListCount" value="${0}" />
												<c:set var="proofListCount" value="${0}" />
												<c:choose>
													<c:when test="${kycSubjectReview.mitigation.mitigationActivityList.size() == 0}">
														<div class="row">
															<div class="col-md-3">
											                    <div class="bt-form__wrapper">
											                        <div class="form-group uk-width-1-1">
											                            <div class="bt-flabels__wrapper">
											                                <label class="parsley_hide">Activity Performed</label>
											                                <form:hidden path="mitigation.mitigationActivityList[0].activityId" value= "0"/>
											                                <form:input type="text" path="mitigation.mitigationActivityList[0].activityPerformed" class="form-control field-background" placeholder="Activity Performed" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" maxlength="255" />
											                                <span class="bt-flabels__error-desc">Required</span>
											                            </div>
											                        </div>
											                    </div>
											                </div>
											                
											                <div class="col-md-3">
											                    <div class="bt-form__wrapper">
											                        <div class="form-group uk-width-1-1">
											                            <div class="bt-flabels__wrapper">
											                            	<div class="field-background">
												                                <label class="parsley_hide">Activity Description</label>
												                                <form:textarea path="mitigation.mitigationActivityList[0].activityDescription" class="field-background" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" placeholder="Activity Description" rows="5" style="min-width:100%;padding: 12px 0 0px 12px !important;"/>
												                                <span class="bt-flabels__error-desc">Required</span>
												                            </div>
											                            </div>
											                        </div>
											                    </div>
											                </div>
											                
											                <div class="col-md-4" id="multiRowProof_0">
																<div class="row">
																	<div class="col-md-6">
																		<div class="form-group">
																			<div class="bt-flabels__wrapper">
																				<label class="parsley_hide">Proof/Evidence</label>
																				<form:hidden path="mitigation.mitigationActivityList[0].mitigationProofList[0].fileId" value= "0"/>
																				<input type="file" class="hidden" name="mitigation.mitigationActivityList[0].mitigationProofList[0].documentFile" id="file_0_0" onchange="javascript:onChangeFile('0_0');" accept="${mitigationFileExtensions}">
																				<form:input type="text" readonly="true" class="form-control" path="mitigation.mitigationActivityList[0].mitigationProofList[0].documentName" id="file0_0" placeholder="Proof/Evidence" onchange="javascript:onChangeFile('0_0');"/>
																				<!-- <input type="text" readonly class="form-control field-background" placeholder="Proof/Evidence" id="file0_0" data-parsley-required="true" data-parsley-group="docAvailable"> -->
																				<!-- <span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span> -->
																			</div>
																		</div>
																	</div> 
																	<div class="col-md-4">
																		<button type="button" class="btn btn-sm grey-gallery" id="uploadFile_0_0" value="Change" onclick="$('#file_0_0').click()">
																			<i class="fa fa-folder-open-o"></i>&nbsp;Browse
																		</button>
																		
																		<button type="button" class="btn btn-sm grey-gallery hidden" id="removeFile_0_0" value="Remove" onclick="javascript:removeOnClick('0_0');">
																			<i class="fa fa-trash"></i>
																		</button>
																    </div>
																    <div class="col-md-2">
																		<button type="button" class="btn btn-sm grey-gallery" onclick="javascript:addMoreProof('0')" value="Add More">
																			<i class="fa fa-plus"></i> Add Proof
																		</button>
																    </div>
													            </div>
														    </div>
										                
											                <div class="col-md-2">
																<button type="button" class="btn btn-sm grey-gallery pull-right" id="addMoreActivity" value="Add More">
																	<i class="fa fa-plus"></i>&nbsp;Add Activity
																</button>
														    </div>
														</div>
													</c:when>
													<c:otherwise>
														<c:set var="activityListCount" value="${kycSubjectReview.mitigation.mitigationActivityList.size()}" />
														<c:forEach items="${kycSubjectReview.mitigation.mitigationActivityList}" var="mitigationObject" varStatus="activityStatus">
													 		<c:choose>
													 			<c:when test="${activityStatus.index == 0}">
													 				<div class="row">
													 				<form:hidden path="mitigation.id"/>
																</c:when>
																<c:otherwise>
																	<div class="row" id="activityRow_${activityStatus.index}">
																</c:otherwise>
													 		</c:choose>
																		<div class="col-md-3">
														                    <div class="bt-form__wrapper">
														                        <div class="form-group uk-width-1-1">
														                            <div class="bt-flabels__wrapper">
														                                <label class="parsley_hide">Activity Performed</label>
														                                <div class="field-background">
																							<form:hidden path="mitigation.mitigationActivityList[${activityStatus.index}].activityId" value= "0"/>
														                                	<form:input type="text" path="mitigation.mitigationActivityList[${activityStatus.index}].activityPerformed" class="form-control field-background" placeholder="Activity Performed" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" maxlength="255" />
														                                	<span class="bt-flabels__error-desc">Required</span>														                                
														                                </div>
														                            </div>
														                        </div>
														                    </div>
														                </div>
										                
														                <div class="col-md-3">
														                    <div class="bt-form__wrapper">
														                        <div class="form-group uk-width-1-1">
														                            <div class="bt-flabels__wrapper">
														                            	<div class="field-background">
														                            		<label class="parsley_hide">Activity Description</label>
														                                	<form:textarea path="mitigation.mitigationActivityList[${activityStatus.index}].activityDescription" class="field-background" data-parsley-required="true" data-parsley-group="kycSubjectMitigationGroup" placeholder="Activity Description" rows="5" style="min-width:100%;padding: 12px 0 0px 12px !important;"/>
														                                	<span class="bt-flabels__error-desc">Required</span>
														                            	</div>
														                            </div>
														                        </div>
														                    </div>
														                </div>
														                <div class="col-md-4" id="multiRowProof_${activityStatus.index}">
														                	<c:set var="proofListCount" value="${proofListCount + mitigationObject.mitigationProofList.size()}" />
										                					<c:forEach items="${mitigationObject.mitigationProofList}" var="mitigationProofObject" varStatus="proofStatus">
											                				<c:choose>
																			<c:when test="${proofStatus.index == 0}">
																			<div class="row">
																			</c:when>
																			<c:otherwise>
																			<div class="row" id="proofRow_${activityStatus.index}_${proofStatus.index - 1}">
																			</c:otherwise>
																			</c:choose>
																				<div class="col-md-6">
																					<div class="bt-form__wrapper">
																						<div class="form-group uk-width-1-1">
																							<div class="bt-flabels__wrapper">
																								<label class="parsley_hide">Proof/Evidence</label>
																								<form:hidden path="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].fileId" value= "${proofStatus.index}"/>
																								<form:hidden path="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].documentId" value=""/>
																								<input type="file" class="hidden" name="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].documentFile" id="file_${activityStatus.index}_${proofStatus.index}" onchange="javascript:onChangeFile('${activityStatus.index}_${proofStatus.index}');" accept="${mitigationFileExtensions}">
																								<form:input type="text" readonly="true" class="form-control file_${activityStatus.index}_${proofStatus.index}" path="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].documentName" data-file-id="file_${activityStatus.index}_${proofStatus.index}" id="file${activityStatus.index}_${proofStatus.index}" placeholder="Proof/Evidence" onchange="javascript:onChangeFile('${activityStatus.index}_${proofStatus.index}');"/>
																								<!-- <span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span> -->
																							</div>
																						</div>
																					</div>
																				</div> 
																				<div class="col-md-4">
																					<button type="button" class="btn btn-sm grey-gallery" id="uploadFile_${activityStatus.index}_${proofStatus.index}" value="Change" onclick="$('#file_${activityStatus.index}_${proofStatus.index}').click()">
																						<i class="fa fa-folder-open-o"></i>&nbsp;Browse
																					</button>
																					<button type="button" class="btn btn-sm grey-gallery removeFile_${activityStatus.index}_${proofStatus.index}" id="removeFile_${activityStatus.index}_${proofStatus.index}" value="Remove" onclick="javascript:removeOnClick('${activityStatus.index}_${proofStatus.index}');">
																						<i class="fa fa-trash"></i>
																					</button>
																				</div>
															   	 			<c:choose>
																 			<c:when test="${proofStatus.index == 0}">
																				<div class="col-md-2">
																					<button type="button" class="btn btn-sm grey-gallery" onclick="javascript:addMoreProof(${activityStatus.index})" value="Add More">
																						<i class="fa fa-plus"></i> Add Proof
																					</button>
																			    </div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-md-2">
																					<button type="button" class="btn btn-sm grey-gallery" onclick="javascript:jQuery('#proofRow_${activityStatus.index}_${proofStatus.index-1}').remove();" value="">
																						<i class="fa fa-close"></i>
																					</button>
																				</div>
																			</c:otherwise>
															 		        </c:choose>
												            			</div>
												            		</c:forEach>
												            		</div>
												            		
															    <c:choose>
																    <c:when test="${activityStatus.index == 0}">
																	    <div class="col-md-2">
																			<button type="button" class="btn btn-sm grey-gallery pull-right" id="addMoreActivity" value="Add More">
																				<i class="fa fa-plus"></i>&nbsp;Add Activity
																			</button>
																	    </div>
																    </c:when>
																    <c:otherwise>															
																		<div class="col-md-2">
																			<button type="button" class="btn btn-sm grey-gallery pull-right" onclick="javascript:jQuery('#activityRow_${activityStatus.index}').remove();" value="Remove">
																				<i class="fa fa-close"></i>
																			</button>
																		</div>
																    </c:otherwise>
															    </c:choose>
															</div>
															<hr>
												</c:forEach>		
													</c:otherwise>
												</c:choose>
												</span>
									            <hr />
												<%-- <div class="row">
													<div class="form-group">
														<div class="col-md-7">
															<label class="control-label">
																Do we have all the identity info that we need to satisfy the regulator of the given jurisdiction for this level of risk?
															</label>
														</div>
														<div class="col-md-5">
															<div class="radio-list">
																<label class="radio-inline"><form:radiobutton value="PASS"  id="Q1Pass"  path="MITQ1" checked="checked"/> 
																	PASS
																</label> 
																<label class="radio-inline"><form:radiobutton value="FAIL"  id="Q1Fail"  path="MITQ1" /> 
																	FAIL
																</label>
															</div>
														</div>
														<div class="col-md-7">
															<label class="control-label">
																Do we have the supporting evidence (mitigants) that we need to satisfy the regulator of the given jurisdiction for this level of risk?
															</label>
														</div>
														<div class="col-md-5">
															<div class="radio-list">
																<label class="radio-inline"><form:radiobutton value="PASS"  id="Q2Pass"  path="MITQ2" checked="checked"/>
																	PASS
																</label> 
																<label class="radio-inline"><form:radiobutton value="FAIL"  id="Q2Fail"  path="MITQ2" />
																	FAIL
																</label>
															</div>
														</div>
														<div class="col-md-7"></div>
														<div class="col-md-5">
															<h3>
																<span class="text-default">STATUS : 
																	<form:hidden path="finalResult" value="PASS"/>
																	<c:if test="${kycSubjectReview.finalResult == '' && kycSubjectReview.finalResult.length() == 0 || kycSubjectReview.finalResult.length() == null}">
																		<span class="text-success PASS">[PASS]</span>
																		<span class="text-danger FAIL hidden">[FAIL]</span>
																	</c:if>
																	<c:if test="${kycSubjectReview.finalResult == 'PASS' && kycSubjectReview.finalResult.length() > 0}">
																		<span class="text-success PASS">[PASS]</span>
																		<span class="text-danger FAIL hidden">[FAIL]</span>
																	</c:if>
																	<c:if test="${kycSubjectReview.finalResult == 'FAIL' && kycSubjectReview.finalResult.length() > 0}">
																		<span class="text-success PASS hidden">[PASS]</span>
																		<span class="text-danger FAIL">[FAIL]</span>
																	</c:if>
																</span>
															</h3>
														</div>
													</div>
												</div> --%>
											</div>
											<div class="col-md-12" align="center">
												<a href="#" onclick="showHideDivs(7)" class="btn default button-previous"> <i class="m-icon-swapleft"></i> Back </a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							 <div id="remarkModalApproveId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								    <div class="modal-dialog modal-md">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal">&times;</button>
								                <h4 class="modal-title">Remark</h4>
								            </div>
								            <div class="modal-body">
								                <div class="row">
								                    <div class="col-md-12">
								                            <div class="bt-flabels__wrapper">
								                            	<div class="uk-width-1-1">
																	<div class="bt-flabels__wrapper">
										                                <label class="parsley_hide">Remark</label>
										                                <%-- <form:textarea path="reviewerRemark" id="reviewerRemark" rows="15" style="height: 140px;width: 567px;" data-parsley-required="false" placeholder="Remark" data-parsley-group="kycSubjectRemarkGroup"></form:textarea> --%>
										                                <form:textarea path="reviewerRemark" id="reviewerRemark" rows="15" style="height: 140px;width: 567px;" data-parsley-required="false" placeholder="Remark"></form:textarea>
										                                <span class="bt-flabels__error-desc">Required</span>
										                            </div>
										                            <form:errors path="reviewerRemark" cssClass="help-block error" />
										                       	</div>
								                            </div>
								                    </div>
								                </div>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-sm grey-gallery" onclick="remarkSubmit('${contextPath}');">
								                    <em class="fa fa-paper-plane"></em> Submit
								                </button>
								                <button type="button" class="btn btn-sm default" data-dismiss="modal">
								                    <em class="fa fa-times-circle"></em> Close
								                </button>
								            </div>
								        </div>
								    </div>
								</div>
						</form:form>
						<form action="" id="frm">
							<div id="remarkModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Remark</h4>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-12">
													<div class="bt-flabels__wrapper">
														<textarea name="remark" id="remarkContent" rows="15" style="height: 140px;" data-parsley-required="false" placeholder="Remark"></textarea>
														<span class="bt-flabels__error-desc">Required</span>
													</div>
												</div>												
										   </div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-sm grey-gallery" onclick="updateWorkflow('${contextPath}')">
												<em class="fa fa-paper-plane"></em> Submit
											</button>
											<button type="button" class="btn btn-sm default" data-dismiss="modal">
					                            <em class="fa fa-times-circle"></em> Close
					                        </button>
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

var existingActivityCount = ${activityListCount};
console.log("existingActivityCount : "+existingActivityCount);

var existingProofCount = ${proofListCount};
console.log("existingProofCount : "+existingProofCount);

</script>
<script src="${contextPath}/master/kycSubject/kycSubjectReview.js" type="text/javascript"></script>
<script>
	jQuery(document).ready(function() {
			jQuery("#subject").remove("active");
			jQuery("#master").remove("active");
			jQuery("#dashboard").addClass("active");
			
			$(".doc0").hide();
			$(".doc1").hide();
			$(".doc2").hide();
			$('#saveButton').attr("disabled", true);
			//--$('#sendForScreening').attr("disabled", true);
			for(var index = 0; index < 3; index++) {
				$(".documentReceivedNo"+index).hide();
				$(".documentReceivedWaiver"+index).hide();
				$(".documentReceivedYes"+index).hide();
			}
			console.log("file:::"+$("#file0_0").val())
			//--$("#file0_0").trigger('change');
	});
	
	$('input[type=radio][name=MITQ1]').change(function() {
		if ($("#Q1Pass").prop("checked")) {
			if ($("#Q2Pass").prop("checked")) {
				$('.PASS').removeClass('hidden');
				$('.FAIL').addClass('hidden');
				$("#finalResult").val("PASS");
			} else if ($("#Q2Fail").prop("checked")) {
				$('.PASS').addClass('hidden');
				$('.FAIL').removeClass('hidden');
				$("#finalResult").val("FAIL");
			} else {
				$('.PASS').addClass('hidden');
				$('.FAIL').addClass('hidden');
				$("#finalResult").val("FAIL");
			}
		}
		else if ($("#Q1Fail").prop("checked")) {
			if ($("#Q2Pass").prop("checked") || $("#Q2Fail").prop("checked")) {
				$('.PASS').addClass('hidden');
				$('.FAIL').removeClass('hidden');
				$("#finalResult").val("FAIL");
			} else {
				$('.PASS').addClass('hidden');
				$('.FAIL').addClass('hidden');
				$("#finalResult").val("FAIL");
			}
		}
	});
	
	$('input[type=radio][name=MITQ2]').change(function() {
		if ($("#Q2Pass").prop("checked")) {
			if ($("#Q1Pass").prop("checked")) {
				$('.PASS').removeClass('hidden');
				$('.FAIL').addClass('hidden');
				$("#finalResult").val("PASS");
			} else if ($("#Q1Fail").prop("checked")) {
				$('.PASS').addClass('hidden');
				$('.FAIL').removeClass('hidden');
				$("#finalResult").val("FAIL");
			} else {
				$('.PASS').addClass('hidden');
				$('.FAIL').addClass('hidden');
				$("#finalResult").val("FAIL");
			}
		}
		else if ($("#Q2Fail").prop("checked")) {
			if ($("#Q1Pass").prop("checked") || $("#Q1Fail").prop("checked")) {
				$('.PASS').addClass('hidden');
				$('.FAIL').removeClass('hidden');
				$("#finalResult").val("FAIL");
			} else {
				$('.PASS').addClass('hidden');
				$('.FAIL').addClass('hidden');
				$("#finalResult").val("FAIL");
			}
		}
	});

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
	
	$("#btnEdit").click(function(){
		var contextPath = $('#commonContextPathId').val();
		var requestId = $("#subjectId").val();
		
		var form = document.createElement("form");
	    var element = document.createElement("input");  

	    form.method = "POST";
	    form.action = contextPath + '/kyc/subject/reviewerEdit';

	    element.value=requestId;
	    element.name="requestId";
	    form.appendChild(element);

	    document.body.appendChild(form);
	    form.submit();
	    buffer();
		
		/* $('#mainFrm').attr("action", contextPath + "/kyc/subject/reviewerEdit");
		$('#mainFrm').append('<input type="hidden" name="requestId" value="' +requestId+ '" />');
		$('#mainFrm').submit();
		buffer(); */
	});
	
	$('#cancelBtn').click(function() {
		location.href = "${contextPath}/dashboard";
		buffer();
	});
</script>