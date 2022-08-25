<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:message code="cancel.label" var="cancelLabel" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="riskCategoryName" value="<%= ITGConstant.RISK_CATEGORY_NAME%>" />
<c:set var="riskCategoryShortCode" value="<%= ITGConstant.RISK_CATEGORY_SHORT_CODE%>" />

<spring:message code="kycSubject.registrationName.label" var="registrationNameLabel" />
<spring:message code="kycSubject.dateOfIncorp.label" var="dateOfIncorpLabel" />
<spring:message code="kycSubject.countryOfIncorp.label" var="countryOfIncorpLabel" />
<spring:message code="kycSubject.address.label" var="addressLabel" />
<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />
<spring:message code="kycSubject.viewOtherDetailsLabel.label" var="viewOtherDetailsLabel" />
<%-- <spring:message code="kycSubject.effectiveDate.label" var="effectiveDateLabel" /> --%>
<spring:message code="kycSubject.sourceOfWealth.label" var="sourceOfWealthLabel" />
<spring:message code="kycSubject.itgJurisdiction.label" var="itgJurisdictionLabel" />
<spring:message code="kycSubject.countryOfCitizenship.label" var="countryOfCitizenshipLabel" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li>My Task<i class="fa fa-angle-right"></i></li>
                <li>KYC Subject<i class="fa fa-angle-right"></i></li>
                <li>GDPR Process</li>
            </ul>
            <!-- <h4>&nbsp;KYC Subject</h4> -->
            <span class="header-scope">&nbsp;KYC Subject</span>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
						<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" >Remarks</button>
                        <c:choose>
		                   <c:when test="${nextStates != null && nextStates.length() > 0}">
			                   	<c:forEach begin="0" end="${nextStates.length() -1}" var="index">
			                   		<button type="button" class="btn-itg btn btn-sm grey-gallery" id="saveButton" onclick="deleteDocuments();">
			                            	${nextStates.get(index).getString('iconImage')} ${nextStates.get(index).getString('Label')}
			                        </button>
			                   	</c:forEach>
		                  		<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
		                   </c:when>
		                </c:choose>
                    </div>
                    <div class="clearfix margin-bottom-5"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="portlet" id="form_wizard_1">
                    <div class="portlet-body form">
                            <form class="form-horizontal uk-form bt-flabels js-flabels" action="${contextPath}/kyc/subject/gdprProccessAdd" id="form1" method="POST">
                                <div class="form-wizard">
									<input type="hidden" id="masterId" name="masterId" value="${subjectJson.id}">
                                    <input type="hidden" id="documentIds" name="documentIds">
                                    <input type="hidden" id="documentNames" name="documentNames">
                                     
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab1">
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class=""></i>Request Detail
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="expand"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display:none;">
                                                    <%-- <div class="panel-group accordion" id="tab3_template1_${proofIndex}">
                                                                    </div> --%>
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
			                                                                            <c:if test="${subjectJson != null && subjectJson.typeOfCounterpartyName != null}">
			                                                                                ${subjectJson.typeOfCounterpartyName}
			                                                                            </c:if>
			                                                                        </p>
			                                                                    </div>
			                                                                </div>
			                                                            </div>
			                                                            
			                                                            <c:choose>
																			<c:when test="${subjectJson.typeOfCounterpartyName == 'Individual'}">
																				<div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">First Name:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.firstName != null}">
					                                                                                ${subjectJson.firstName}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">Middle Name:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.middleName != null}">
					                                                                                ${subjectJson.middleName}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">Last Name:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.lastName != null}">
					                                                                                ${subjectJson.lastName}
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
					                                                                            <c:if test="${subjectJson != null && subjectJson.dateOfBirth != null}">
					                                                                            <fmt:formatDate pattern="MM/dd/yyyy" value="${subjectJson.dateOfBirth}"/>
					                                                                                
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">Occupation:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.occupation != null}">
					                                                                                ${subjectJson.occupation}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">${sourceOfWealthLabel}</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.sourceOfWealth != null}">
					                                                                                ${subjectJson.sourceOfWealth}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">${registrationNameLabel} :</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${subjectJson != null && subjectJson.registrationName != null}">
																									${subjectJson.registrationName} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">${dateOfIncorpLabel} :</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${subjectJson != null && subjectJson.dateOfIncorporation != null}">
																									<fmt:formatDate pattern="dd-MMM-yyyy" value="${subjectJson.dateOfIncorporation}" />
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
			                                                                            <c:if test="${subjectJson != null && subjectJson.itgJurisdictionName != null}">
			                                                                                ${subjectJson.itgJurisdictionName}
			                                                                            </c:if>
			                                                                        </p>
			                                                                    </div>
			                                                                </div>
			                                                            </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <h3 class="form-section">Address</h3>
                                                                    <div class="row">
                                                                        <div class="col-md-12 hidden">
			                                                                <div class="form-group">
			                                                                    <label class="control-label col-md-6 bold">Jurisdiction:</label>
			                                                                    <div class="col-md-6">
			                                                                        <p class="form-control-static doc-name-align">
			                                                                            <c:if test="${subjectJson != null && subjectJson.jurisdictionName != null}">
			                                                                                ${subjectJson.jurisdictionName}
			                                                                            </c:if>
			                                                                        </p>
			                                                                    </div>
			                                                                </div>
			                                                            </div>
			                                                            
			                                                            <c:choose>
																			<c:when test="${subjectJson.typeOfCounterpartyName == 'Individual'}">
																				<div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">Residential Address:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.residentialAddress != null}">
					                                                                                ${subjectJson.residentialAddress}
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
					                                                                            <c:if test="${subjectJson != null && subjectJson.stateCity != null}">
					                                                                                ${subjectJson.stateCity}
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
					                                                                            <c:if test="${subjectJson != null && subjectJson.zipCode != null}">
					                                                                                ${subjectJson.zipCode}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">Country of Residency:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.countryOfResidencyName != null}">
					                                                                                ${subjectJson.countryOfResidencyName}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">Country of Birth:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.countryOfBirthName != null}">
					                                                                                ${subjectJson.countryOfBirthName}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
					                                                                <div class="form-group">
					                                                                    <label class="control-label col-md-6 bold">${countryOfCitizenshipLabel}:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            <c:if test="${subjectJson != null && subjectJson.countryOfCitizenshipName != null}">
					                                                                                ${subjectJson.countryOfCitizenshipName}
					                                                                            </c:if>
					                                                                        </p>
					                                                                    </div>
					                                                                </div>
					                                                            </div>
					                                                            <div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">Email Address:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${subjectJson != null && subjectJson.emailAddress != null}">
																									${subjectJson.emailAddress} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="control-label col-md-6 bold">Telephone Number:</label>
																						<div class="col-md-6">
																							<p class="form-control-static doc-name-align">
																								<c:if test="${subjectJson != null && subjectJson.telephoneNumber != null}">
																									${subjectJson.telephoneNumber} 
																								</c:if>
																							</p>
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
																								<c:if test="${subjectJson != null && subjectJson.residentialAddress != null}">
																									${subjectJson.residentialAddress} 
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
																								<c:if test="${subjectJson != null && subjectJson.stateCity != null}">
																									${subjectJson.stateCity} 
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
																								<c:if test="${subjectJson != null && subjectJson.zipCode != null}">
																									${subjectJson.zipCode} 
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
																								<input type="hidden" id="countryOfIncorpCodeId" value="${subjectJson.countryOfIncorporationCode}">
																								<c:if test="${subjectJson != null && subjectJson.countryOfIncorporationName != null}">
																									${subjectJson.countryOfIncorporationName} 
																								</c:if>
																							</p>
																						</div>
																					</div>
																				</div>
																			</c:otherwise>
																		</c:choose>
                                                                    </div>
                                                                </div>
                                                                
                                                                <c:if test="${subjectJson.typeOfCounterpartyCode == 'Individual'}">
                                                                	<div class="col-md-4">
	                                                                    <h3 class="form-section">Other details</h3>
	                                                                    <div class="row">
	                                                                        <div class="col-md-12">
				                                                                <div class="form-group">
				                                                                    <label class="control-label col-md-6 bold">Any other former First Name:</label>
				                                                                    <div class="col-md-6">
				                                                                        <p class="form-control-static doc-name-align">
				                                                                            <c:if test="${subjectJson != null && subjectJson.anyOtherFirstName != null}">
				                                                                                ${subjectJson.anyOtherFirstName}
				                                                                            </c:if>
				                                                                        </p>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                            <div class="col-md-12">
				                                                                <div class="form-group">
				                                                                    <label class="control-label col-md-6 bold">Any other former Middle Name:</label>
				                                                                    <div class="col-md-6">
				                                                                        <p class="form-control-static doc-name-align">
				                                                                            <c:if test="${subjectJson != null && subjectJson.anyOtherMiddleName != null}">
				                                                                                ${subjectJson.anyOtherMiddleName}
				                                                                            </c:if>
				                                                                        </p>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
				                                                            <div class="col-md-12">
				                                                                <div class="form-group">
				                                                                    <label class="control-label col-md-6 bold">Any other former Last Name:</label>
				                                                                    <div class="col-md-6">
				                                                                        <p class="form-control-static doc-name-align">
				                                                                            <c:if test="${subjectJson != null && subjectJson.anyOtherLastName != null}">
				                                                                                ${subjectJson.anyOtherLastName}
				                                                                            </c:if>
				                                                                        </p>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
	                                                                    </div>
	                                                                    <div class="row">
	                                                                        <div class="col-md-12">
				                                                                <div class="form-group">
				                                                                    <label class="control-label col-md-6 bold">Other Nationality:</label>
				                                                                    <div class="col-md-6">
				                                                                        <p class="form-control-static doc-name-align">
				                                                                            <c:if test="${subjectJson != null && subjectJson.otherNationalityName != null}">
				                                                                                ${subjectJson.otherNationalityName}
				                                                                            </c:if>
				                                                                        </p>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
	                                                                    </div>
	                                                                    
	                                                                    <c:if test="${otherDetails.get('isRequestFromNec') == true && subjectJson.typeOfCounterpartyName == 'Individual'}">
																			<div class="row">
																				<div class="col-md-12">
																					<div class="form-group">
																		                <c:if test="${otherDetails.has('kycPartyType') && not empty otherDetails.get('kycPartyType')}">
																		                	<label class="control-label col-md-6 bold">KYC Party Type:</label>
																		                	<p class="form-control-static doc-name-align">
					                                                                            ${otherDetails.get('kycPartyType')}
					                                                                        </p>
																		                </c:if>
																					</div>
																				</div>
																				<div class="col-md-12">
																					<div class="form-group">
																		                <c:if test="${otherDetails.has('countryOfCitizenshipName') && not empty otherDetails.get('countryOfCitizenshipName')}">
																		                	<label class="control-label col-md-6 bold">Country Of Citizenship:</label>
																		                	<p class="form-control-static doc-name-align">
					                                                                            ${otherDetails.get('countryOfCitizenshipName')}
					                                                                        </p>
																		                </c:if>
																					</div>
																				</div>
																			</div>
																		</c:if>
																		<%-- 
				                                                        <div class="row">
																			<div class="col-md-12">
																				<div class="form-group">
				                                                                    <c:if test="${subjectJson != null && subjectJson.effectiveDate != null}">
																						<label class="control-label col-md-6 bold">${effectiveDateLabel}:</label>
					                                                                    <div class="col-md-6">
					                                                                        <p class="form-control-static doc-name-align">
					                                                                            ${subjectJson.effectiveDate}
					                                                                        </p>
					                                                                    </div>
																					</c:if>
				                                                                </div>
																			</div>
																		</div>
																		 --%>
	                                                                </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
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
																						<c:when test="${subjectJson.fullNameOfTargetedContact.length() > 0}"> 
																							${subjectJson.fullNameOfTargetedContact}
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
																						<c:when test="${subjectJson != null && subjectJson.addressOfTargetedContact.length() > 0}">
																							${subjectJson.addressOfTargetedContact}
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
																						<c:when test="${subjectJson != null && subjectJson.nationalityOfTargetedContactName.length() > 0}">
																				        	${subjectJson.nationalityOfTargetedContactName}
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
																						<c:when test="${subjectJson != null && subjectJson.emailAddressOfTargetedContact.length() > 0}">
																				        	${subjectJson.emailAddressOfTargetedContact}
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
																						<c:when test="${subjectJson != null && subjectJson.phoneNumberOfTargetedContact.length() > 0}">
																				        	${subjectJson.phoneNumberOfTargetedContact}
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
														
														<c:if test="${otherDetails.get('isRequestFromNec') == true && subjectJson.typeOfCounterpartyName != 'Individual'}">
															<div class="row">
																<div class="col-md-12">
																	<button type="button" data-toggle="modal" data-target="#otherDetailsModal" id="btnScreeningDetails" class="pull-right btn btn-sm grey-gallery" ><i class="fa fa-info-circle"></i>&nbsp;${viewOtherDetailsLabel}</button>
																</div>
															</div>
														</c:if>
														
														<c:if test="${consentData != null && consentData.size() > 0}">
                                                        <div class="form-body">
			                                                <h3 class="form-section">User Consent</h3>
			                                                <c:forEach begin="0" end="${consentData.size() - 1}" var="index">
			                                                    <div class="row">
			                                                        <div class="col-md-12">
			                                                            <div class="form-group">
			                                                                <div class="col-md-12">
			                                                                	<c:choose>
																					<c:when test="${consentData[index].isConsentChecked}">
																						<input id="userConsent_${index}" name="userConsent_${index}" disabled type="checkbox" checked value="true" autocomplete="off" />
			                                                                    		<label class="control-label">${consentData[index].consentDescription}</label>
																					</c:when>
																					<c:otherwise>
																						<input id="userConsent_${index}" name="userConsent_${index}" disabled type="checkbox" value="true" autocomplete="off" />
			                                                                    		<label class="control-label">${consentData[index].consentDescription}</label>
																					</c:otherwise>
																				</c:choose>
			                                                                </div>
			                                                            </div>
			                                                        </div>
			                                                    </div>
			                                                </c:forEach>
			                                            </div>
			                                            </c:if>
                                                </div>
                                            </div>
                                            
                                            <textarea id="riskDataJson" style="display: none;">${screeningData.screeningResult}</textarea>
                                            <c:if test="${screeningData != null}">
                                            <div class="clearfix margin-bottom-10"></div>
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class=""></i>Screening Result
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="expand"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display:none;">
													<div class="form-body">
		                                                <div class="row">
		                                                    <div class="col-md-12">
		                                                        <!-- <h3 class="form-section">Screening Process : [Manual]</h3> -->
		                                                        <div class="row">
																	<div class="col-md-5">
																		<h3 class="form-section" style="margin-left: 15px;">Screening Process&nbsp;: [${screeningData.screeningType}]</h3>
																	</div>
																	<div class="col-md-5">
																		<h3 class="form-section" style="margin-left: 15px;">Screening Date &nbsp;&nbsp;&nbsp;&nbsp;: <fmt:formatDate pattern="MM/dd/yyyy" value="${screeningData.createdDate}" /></h3>
																	</div>
																	<div class="col-md-2">
																		<c:if test="${screeningData.isAutoScreening == true}">
																			<button type="button" id="btnScreeningDetails" class="btn btn-sm grey-gallery" ><i class="fa fa-info-circle"></i>&nbsp;Screening Detail</button>
																		</c:if>
																	</div>
																</div>
		                                                        <div class="row">
		                                                            <div class="col-md-1"></div>
		                                                            <label class="col-md-2 control-label"> PEP Risk</label>
		                                                            <div class="col-md-2">
		                                                                <div class="radio-list">
		                                                                    <c:choose>
																				<c:when test="${screeningData.isPepRisk}">
																					<label class="radio-inline ">
				                                                                        <input type="radio" checked="checked" value="1" name="pepRisk" disabled> Yes
				                                                                    </label>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" value="0" name="pepRisk" disabled> No
				                                                                    </label>		
																				</c:when>
																				<c:otherwise>
																					<label class="radio-inline ">
				                                                                        <input type="radio" value="1" name="pepRisk" disabled> Yes
				                                                                    </label>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" checked="checked" value="0" name="pepRisk" disabled> No
				                                                                    </label>
																				</c:otherwise>
																			</c:choose>
		                                                                </div>
		                                                            </div>
		                                                            <div class="col-md-2" hidden>
		                                                                <div class="bt-form__wrapper">
		                                                                    <div class="form-group">
		                                                                        <div class="bt-flabels__wrapper">
		                                                                            <label class="parsley_hide">Risk Level</label>
		                                                                            <div class="field-background">
			                                                                            <select class="form-control select2me" name="pepRiskLevel" id="pepRiskLevel" data-parsley-required="false" placeholder="Risk Level" disabled>
																							<option value=""></option>
					                                                                            <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																									<c:forEach begin="0" end="${riskCategoryData.length() - 1 }" var="index">
																										<option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}" ${riskCategoryData.get(index).get(riskCategoryShortCode) == screeningData.pepRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																									</c:forEach>
																								</c:if>
																						</select>
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
		                                                            <div class="col-md-2">
		                                                                <div class="radio-list">
		                                                                	<c:choose>
																				<c:when test="${screeningData.isSanctionRisk}">
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" checked="checked" value="1" name="sanctionRisk" disabled> Yes
				                                                                    </label>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" value="0" name="sanctionRisk" disabled> No
				                                                                    </label>
																				</c:when>
																				<c:otherwise>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" value="1" name="sanctionRisk" disabled> Yes
				                                                                    </label>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" checked="checked" value="0" name="sanctionRisk" disabled> No
				                                                                    </label>
																				</c:otherwise>
																			</c:choose>
		                                                                </div>
		                                                            </div>
		                                                            <div class="col-md-2" hidden>
		                                                                <div class="bt-form__wrapper">
		                                                                    <div class="form-group">
		                                                                        <div class="bt-flabels__wrapper">
		                                                                            <label class="parsley_hide">Risk Level</label>
		                                                                            <div class="field-background">
		                                                                                <select id="sanctionsRiskLevel" name="sanctionsRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="false" disabled>
		                                                                                	<option value=""></option>
					                                                                            <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																									<c:forEach begin="0" end="${riskCategoryData.length() - 1 }" var="index">
																										<option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}" ${riskCategoryData.get(index).get(riskCategoryShortCode) == screeningData.sanctionsRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																									</c:forEach>
																								</c:if>
		                                                                                </select>
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
		                                                            <label class="col-md-2 control-label"> Activities Risk </label>
		                                                            <div class="col-md-2">
		                                                                <div class="radio-list">
		                                                                	<c:choose>
																				<c:when test="${screeningData.isActivitiesRisk}">
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" checked="checked" value="1" name="activitiesRisk" disabled> Yes
				                                                                    </label>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" value="0" name="activitiesRisk" disabled> No
				                                                                    </label>
																				</c:when>
																				<c:otherwise>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" value="1" name="activitiesRisk" disabled> Yes
				                                                                    </label>
				                                                                    <label class="radio-inline">
				                                                                        <input type="radio" checked="checked" value="0" name="activitiesRisk" disabled> No
				                                                                    </label>
																				</c:otherwise>
																			</c:choose>
		                                                                </div>
		                                                            </div>
		                                                            <div class="col-md-2" hidden>
		                                                                <div class="bt-form__wrapper">
		                                                                    <div class="form-group">
		                                                                        <div class="bt-flabels__wrapper">
		                                                                            <label class="parsley_hide">Risk Level</label>
		                                                                            <div class="field-background">
		                                                                                <select id="activitiesRiskLevel" name="activitiesRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="false" disabled>
		                                                                                    <option value=""></option>
				                                                                            <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0" end="${riskCategoryData.length() - 1 }" var="index">
																									<option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}" ${riskCategoryData.get(index).get(riskCategoryShortCode) == screeningData.activitiesRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
		                                                                                </select>
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
		                                                            <div class="col-md-2">
		                                                                <div class="bt-form__wrapper">
		                                                                    <div class="form-group">
		                                                                        <div class="bt-flabels__wrapper">
		                                                                            <label class="parsley_hide">Risk Level</label>
		                                                                            <div class="field-background">
		                                                                                <select id="countryRiskLevel" name="countryRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="false" disabled>
		                                                                                    <option value=""></option>
				                                                                            <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0" end="${riskCategoryData.length() - 1 }" var="index">
																									<option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}" ${riskCategoryData.get(index).get(riskCategoryShortCode) == screeningData.countryRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
		                                                                                </select>
		                                                                            </div>
		                                                                            <span class="bt-flabels__error-desc_select">Required</span>
		                                                                        </div>
		                                                                    </div>
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <hr />
		                                                        <div class="row">
		                                                            <div class="col-md-1"></div>
		                                                            <label class="col-md-2 control-label"> Total Risk Level</label>
		                                                            <!-- <div class="col-md-2"></div> -->
		                                                            <div class="col-md-2">
		                                                                <div class="bt-form__wrapper">
		                                                                    <div class="form-group">
		                                                                        <div class="bt-flabels__wrapper">
		                                                                            <label class="parsley_hide">Risk Level</label>
		                                                                            <div class="field-background">
		                                                                                <select id="totalRiskLevel" name="totalRiskLevel" placeholder="Risk Level" class="form-control select2me" data-parsley-required="false" disabled>
		                                                                                    <option value=""></option>
				                                                                            <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0" end="${riskCategoryData.length() - 1 }" var="index">
																									<option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}" ${riskCategoryData.get(index).get(riskCategoryShortCode) == screeningData.totalRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
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
                                            </c:if>
                                            <c:if test="${mitigationObject != null && mitigationObject.size() > 0}">
                                            <div class="clearfix margin-bottom-10"></div>
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class=""></i>Mitigation Details
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="expand"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display:none;">
													<div class="form-body">
			                                        	<c:forEach begin="0" end="${mitigationObject.size() - 1 }" var="mitigationIndex">
			                                        		<div class="row">
			                                        			<div class="col-md-6">
			                                        				<div class="form-group">
			                                        					<label class="control-label col-md-4 bold">Actvity Performed:</label>
			                                                            <div class="col-md-8">
			                                                            	<p class="form-control-static doc-name-align">
			                                                                    ${mitigationObject[mitigationIndex].activityPerformed}
			                                                                </p>
			                                                            </div>
			                                                        </div>
			                                                        <div class="form-group">
			                                                            <label class="control-label col-md-4 bold">Activity Description:</label>
			                                                            <div class="col-md-8">
			                                                                <p class="form-control-static doc-name-align">
			                                                                    ${mitigationObject[mitigationIndex].activityDescription}
			                                                                </p>
			                                                            </div>
			                                                        </div>
			                                                    </div>
			                                                    <div class="col-md-4">
			                                                        <div class="form-group">
			                                                            <label class="control-label col-md-4 bold">Proof / Evidence:</label>
			                                                            <div class="col-md-8">
			                                                            	<c:forEach begin="0" end="${mitigationObject[mitigationIndex].mitigationProofList.size() - 1 }" var="mitigationProofIndex">
			                                                                	<c:choose>
									                                       			<c:when test="${mitigationObject[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName ne ''}">
									                                       				<button type="button" class="btn btn-link doc-name-align" onclick="getFile('${mitigationObject[mitigationIndex].mitigationProofList[mitigationProofIndex].documentId}', '${mitigationObject[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}', '${contextPath}')" >
									                                       					<i class="fa fa-paperclip"></i>&nbsp;${mitigationObject[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}
									                                                     		</button>
									                                                        	<br/>
									                                                      </c:when>
									                                                      <c:otherwise>
									                                                      	<div style="padding-top: 9px;">-</div><br/>                                                                                   
									                                                      </c:otherwise>
									                                                 </c:choose>
			                                                                </c:forEach>
			                                                            </div>
			                                                        </div>
			                                                    </div>
			                                                </div>
			                                                <hr />
														</c:forEach>
													</div> 
                                            	</div>
                                            </div>
											<c:if test="${screeningData.totalRiskLevel != 'Low'}">
												<div class="clearfix margin-bottom-10"></div>
	                                            <div class="portlet">
	                                                <div class="portlet-title">
	                                                    <div class="caption">
	                                                        <i class=""></i>Result
	                                                    </div>
	                                                    <div class="tools">
	                                                        <a href="javascript:;" class="expand"></a>
	                                                    </div>
	                                                </div>
	                                                <div class="portlet-body" style="display:none;">
														<div class="form-body">
															<div class="row">
																<div class="col-md-7">
																	<label class="control-label">Do we have all the identity info that we need to satisfy the regulator of the given jurisdiction for this level of risk?</label>
																</div>
																<div class="col-md-5">
																	<div class="radio-list">
																		<c:if test="${subjectJson.MITQ1 == 'PASS' && subjectJson.MITQ1.length() > 0}">
																			<label class="radio-inline">
																               <input type="radio" value="PASS"  id="Q1Pass"  name="MITQ1" checked="checked" disabled>PASS
																            </label>
																            <label class="radio-inline">
																               <input type="radio" value="FAIL"  id="Q1Fail"  name="MITQ1" disabled>FAIL
																            </label>
																		</c:if>
															            <c:if test="${subjectJson.MITQ1 == 'FAIL' && subjectJson.MITQ1.length() > 0}">
															                <label class="radio-inline">
																               <input type="radio" value="PASS"  id="Q1Pass"  name="MITQ1" disabled>PASS
																            </label>
																            <label class="radio-inline">
																               <input type="radio" value="FAIL"  id="Q1Fail"  name="MITQ1" checked="checked" disabled>FAIL
																            </label>
															            </c:if>
															         </div>
															      </div>
															      <div class="col-md-7">
															         <label class="control-label">Do we have the supporting evidence (mitigants) that we need to satisfy the regulator of the given jurisdiction for this level of risk?</label>
															      </div>
															      <div class="col-md-5">
															      	<div class="radio-list">
															         	<c:if test="${subjectJson.MITQ2 == 'PASS' && subjectJson.MITQ2.length() > 0}">
															         		<label class="radio-inline">
																               <input type="radio" value="PASS"  id="Q2Pass"  name="MITQ2" checked="checked" disabled >PASS
																            </label>
																            <label class="radio-inline">
																               <input type="radio" value="FAIL"  id="Q2Fail"  name="MITQ2" disabled>FAIL
																           	</label>
																		</c:if>
															            <c:if test="${subjectJson.MITQ2 == 'FAIL' && subjectJson.MITQ2.length() > 0}">
															                <label class="radio-inline">
																               <input type="radio" value="PASS"  id="Q2Pass"  name="MITQ2" disabled>PASS
																            </label>
																            <label class="radio-inline">
																               <input type="radio" value="FAIL"  id="Q2Fail"  name="MITQ2"  checked="checked" disabled>FAIL
																           	</label>
															            </c:if>
															        </div>
															      </div>
															      <div class="col-md-7"></div>
															      <div class="col-md-5">
															      	<h3>
															      		<span class="text-default">
															               	STATUS : 
															               	<c:if test="${subjectJson.finalResult == 'PASS' && subjectJson.finalResult.length() > 0}">
																				<span class="text-success PASS">[PASS]</span>
															               </c:if>
															               <c:if test="${subjectJson.finalResult == 'FAIL' && subjectJson.finalResult.length() > 0}">
															                  	<span class="text-danger FAIL">[FAIL]</span>
															               </c:if>
															            </span>
														            </h3>
															      </div>
																</div>
															</div>
	                                            	</div>
	                                            </div>
											</c:if>
											</c:if>
											<c:if test="${managerScreeningData != null}">
											<div class="clearfix margin-bottom-10"></div>
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class=""></i>Manager Approval
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="expand"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display:none;">
													<div class="form-body">
		                                                <div class="row">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-1"></div>
																	<label class="col-md-2 control-label"> PEP Risk</label>
																	<div class="col-md-2">
																		<div class="radio-list">
																			<c:choose>
																				<c:when test="${managerScreeningData.isPepRisk}">
																					<label class="radio-inline "> <input
																						type="radio" checked="checked" value="1"
																						name="man_pepRisk" disabled> Yes
																					</label>
																					<label class="radio-inline"> <input
																						type="radio" value="0" name="man_pepRisk" disabled>
																						No
																					</label>
																				</c:when>
																				<c:otherwise>
																					<label class="radio-inline "> <input
																						type="radio" value="1" name="man_pepRisk" disabled>
																						Yes
																					</label>
																					<label class="radio-inline"> <input
																						type="radio" checked="checked" value="0"
																						name="man_pepRisk" disabled> No
																					</label>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div>
																	<div class="col-md-3" hidden>
																		<div class="bt-form__wrapper">
																			<div class="form-group">
																				<div class="bt-flabels__wrapper">
																					<label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select class="form-control select2me"
																							name="pepRiskLevel" id="pepRiskLevel"
																							data-parsley-required="false"
																							placeholder="Risk Level" disabled>
																							<option value=""></option>
																							<c:if
																								test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0"
																									end="${riskCategoryData.length() - 1 }"
																									var="index">
																									<option
																										value="${riskCategoryData.get(index).get(riskCategoryShortCode)}"
																										${riskCategoryData.get(index).get(riskCategoryShortCode) == managerScreeningData.pepRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-4" hidden>
																		<div class="bt-form__wrapper">
																			<div class="bt-flabels__wrapper">
																				<label class="parsley_hide">Remark</label> 
																				<textarea  name="pepRiskRemark" id="pepRemarkId" placeholder="Remark" data-parsley-required="false" style="min-width: 100%" class="field-background" rows="4" readonly>${managerScreeningData.pepRiskRemark}</textarea>
																				<span class="bt-flabels__error-desc">Required</span>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="clearfix margin-bottom-10"></div>
																<div class="row">
																	<div class="col-md-1"></div>
																	<label class="col-md-2 control-label"> Sanctions Risk</label>
																	<div class="col-md-2">
																		<div class="radio-list">
																			<c:choose>
																				<c:when test="${managerScreeningData.isSanctionRisk}">
																					<label class="radio-inline"> <input
																						type="radio" checked="checked" value="1"
																						name="man_sanctionRisk" disabled> Yes
																					</label>
																					<label class="radio-inline"> <input
																						type="radio" value="0" name="man_sanctionRisk"
																						disabled> No
																					</label>
																				</c:when>
																				<c:otherwise>
																					<label class="radio-inline"> <input
																						type="radio" value="1" name="man_sanctionRisk"
																						disabled> Yes
																					</label>
																					<label class="radio-inline"> <input
																						type="radio" checked="checked" value="0"
																						name="man_sanctionRisk" disabled> No
																					</label>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div>
																	<div class="col-md-3" hidden>
																		<div class="bt-form__wrapper">
																			<div class="form-group">
																				<div class="bt-flabels__wrapper">
																					<label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="sanctionsRiskLevel"
																							name="sanctionsRiskLevel" placeholder="Risk Level"
																							class="form-control select2me"
																							data-parsley-required="false" disabled>
																							<option value=""></option>
																							<c:if
																								test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0"
																									end="${riskCategoryData.length() - 1 }"
																									var="index">
																									<option
																										value="${riskCategoryData.get(index).get(riskCategoryShortCode)}"
																										${riskCategoryData.get(index).get(riskCategoryShortCode) == managerScreeningData.sanctionsRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-4" hidden>
																		<div class="bt-form__wrapper">
																			<div class="bt-flabels__wrapper">
																				<label class="parsley_hide">Remark</label>
																				<textarea name="sanctionRiskRemark" id="sanRemarkId" placeholder="Remark" style="min-width: 100%" class="field-background" rows="4" data-parsley-required="false" readonly >${managerScreeningData.sanctionRiskRemark}</textarea> 
																				<span class="bt-flabels__error-desc">Required</span>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="clearfix margin-bottom-10"></div>
																<div class="row">
																	<div class="col-md-1"></div>
																	<label class="col-md-2 control-label"> Activities Risk </label>
																	<div class="col-md-2">
																		<div class="radio-list">
																			<c:choose>
																				<c:when
																					test="${managerScreeningData.isActivitiesRisk}">
																					<label class="radio-inline"> <input
																						type="radio" checked="checked" value="1"
																						name="man_activitiesRisk" disabled> Yes
																					</label>
																					<label class="radio-inline"> <input
																						type="radio" value="0" name="man_activitiesRisk"
																						disabled> No
																					</label>
																				</c:when>
																				<c:otherwise>
																					<label class="radio-inline"> <input
																						type="radio" value="1" name="man_activitiesRisk"
																						disabled> Yes
																					</label>
																					<label class="radio-inline"> <input
																						type="radio" checked="checked" value="0"
																						name="man_activitiesRisk" disabled> No
																					</label>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div>
																	<div class="col-md-3" hidden>
																		<div class="bt-form__wrapper">
																			<div class="form-group">
																				<div class="bt-flabels__wrapper">
																					<label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="activitiesRiskLevel"
																							name="activitiesRiskLevel"
																							placeholder="Risk Level"
																							class="form-control select2me"
																							data-parsley-required="false" disabled>
																							<option value=""></option>
																							<c:if
																								test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0"
																									end="${riskCategoryData.length() - 1 }"
																									var="index">
																									<option
																										value="${riskCategoryData.get(index).get(riskCategoryShortCode)}"
																										${riskCategoryData.get(index).get(riskCategoryShortCode) == managerScreeningData.activitiesRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-4" hidden>
																		<div class="bt-form__wrapper">
																			<div class="bt-flabels__wrapper">
																				<label class="parsley_hide">Remark</label> 
																				<textarea name="activitiesRiskRemark" id="sanRemarkId" placeholder="Remark" style="min-width: 100%" class="field-background" rows="4" data-parsley-required="false" readonly >${managerScreeningData.activitiesRiskRemark}</textarea> 
																				<span
																					class="bt-flabels__error-desc">Required</span>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="clearfix margin-bottom-10"></div>
																<div class="row">
																	<div class="col-md-1"></div>
																	<label class="col-md-2 control-label"> Country Risk</label>
																	<!-- <div class="col-md-2"></div> -->
																	<div class="col-md-3">
																		<div class="bt-form__wrapper">
																			<div class="form-group">
																				<div class="bt-flabels__wrapper">
																					<label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="countryRiskLevel"
																							name="countryRiskLevel" placeholder="Risk Level"
																							class="form-control select2me"
																							data-parsley-required="false" disabled>
																							<option value=""></option>
																							<c:if
																								test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0"
																									end="${riskCategoryData.length() - 1 }"
																									var="index">
																									<option
																										value="${riskCategoryData.get(index).get(riskCategoryShortCode)}"
																										${riskCategoryData.get(index).get(riskCategoryShortCode) == managerScreeningData.countryRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-4">
																		<div class="bt-form__wrapper">
																			<div class="bt-flabels__wrapper">
																				<label class="parsley_hide">Remark</label> 
																				<textarea name="countryRiskLevel" id="sanRemarkId" placeholder="Remark" style="min-width: 100%" class="field-background" rows="4" data-parsley-required="false" readonly >${managerScreeningData.countryRiskRemark}</textarea> 
																				<span class="bt-flabels__error-desc">Required</span>
																			</div>
																		</div>
																	</div>
																</div>
																<hr />
																<div class="row">
																	<div class="col-md-1"></div>
																	<label class="col-md-2 control-label"> Total Risk Level</label>
																	<!-- <div class="col-md-2"></div> -->
																	<div class="col-md-3">
																		<div class="bt-form__wrapper">
																			<div class="form-group">
																				<div class="bt-flabels__wrapper">
																					<label class="parsley_hide">Risk Level</label>
																					<div class="field-background">
																						<select id="totalRiskLevel" name="totalRiskLevel"
																							placeholder="Risk Level"
																							class="form-control select2me"
																							data-parsley-required="false" disabled>
																							<option value=""></option>
																							<c:if
																								test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																								<c:forEach begin="0"
																									end="${riskCategoryData.length() - 1 }"
																									var="index">
																									<option
																										value="${riskCategoryData.get(index).get(riskCategoryShortCode)}"
																										${riskCategoryData.get(index).get(riskCategoryShortCode) == managerScreeningData.totalRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																								</c:forEach>
																							</c:if>
																						</select>
																					</div>
																					<span class="bt-flabels__error-desc_select">Required</span>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-4">
																		<div class="bt-form__wrapper">
																			<div class="bt-flabels__wrapper">
																				<label class="parsley_hide">Remark</label>
																				<textarea name="totalRiskRemark" id="sanRemarkId" placeholder="Remark" style="min-width: 100%" class="field-background" rows="4" data-parsley-required="false" readonly >${managerScreeningData.totalRiskRemark}</textarea> 
																				<span class="bt-flabels__error-desc">Required</span>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
                                            		</div>
                                            	</div>
                                            </div>
											</c:if>
                                            <div class="clearfix margin-bottom-10"></div>
                                            <div class="portlet">
                                                <div class="portlet-title">
                                                    <div class="caption">
                                                        <i class=""></i>Document Collection Details
                                                    </div>
                                                    <div class="tools">
                                                        <a href="javascript:;" class="collapse"></a>
                                                    </div>
                                                </div>
                                                <div class="portlet-body" style="display:block;">
                                                    <div class="form-body">
		                                                <div class="row">
		                                                    <div class="col-md-12">
																<h3 class="form-section">Template Name: <span class="text-warning" id="kycTemplateName"> [${templateName}] </span></h3>
		                                                    </div>
		                                                    <c:choose>
		                                                   	<c:when test="${not empty(usedDocument)}"> 
		                                                    <c:if test="${usedDocument.size() > 0}">
		                                                    <c:forEach begin="0" end="${usedDocument.size() -1}" var="proofIndex">
		                                                        <div class="col-md-4">
		                                                            <div class="portlet">
		                                                                <div class="portlet-title">
		                                                                    <div class="caption">
		                                                                        <i class=""></i>${usedDocument[proofIndex].proofName}
		                                                                    </div>
		                                                                    <div class="tools">
		                                                                        <a href="javascript:;" class="collapse"></a>
		                                                                    </div>
		                                                                </div>
		                                                                <div class="portlet-body">
		                                                                    <div class="panel-group accordion" id="tab3_template1_${proofIndex}">	
		                                                                    	<c:if test="${usedDocument[proofIndex].documentList.size() > 0}">																																			
		                                                                        <c:forEach begin="0" end="${usedDocument[proofIndex].documentList.size() - 1 }" var="index">
		                                                                            <div class="panel panel-default">
		                                                                                <div class="panel-heading">
		                                                                                    <h4 class="panel-title">
																                                  <a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#tab3_template1_${proofIndex}" href="#tab3_template1_collapse_${proofIndex}_${index}">
																                                    
																                                    <c:if test="${usedDocument[proofIndex].documentList[index].documentReceived == 1}">
																                                      <span style="float:right">[Received: YES]</span>${usedDocument[proofIndex].documentList[index].documentName}
																                                    </c:if>
				
																                                    <c:if test="${usedDocument[proofIndex].documentList[index].documentReceived == 0}">
																                                      <span style="float:right">[Received: NO]</span>${usedDocument[proofIndex].documentList[index].documentName}
																                                    </c:if>
				
																                                    <c:if test="${usedDocument[proofIndex].documentList[index].documentReceived == 2}">
																                                      <span style="float:right">[Received: WAIVED]</span>${usedDocument[proofIndex].documentList[index].documentName}
																                                    </c:if> 
																                                  </a>
														                              		</h4>
		                                                                                </div>
		                                                                                <div id="tab3_template1_collapse_${proofIndex}_${index}" class="panel-collapse collapse">
		                                                                                    <div class="panel-body">
		
		                                                                                        <c:if test="${usedDocument[proofIndex].documentList[index].documentReceived == 1}">
		                                                                                            <div class="form-group">
		                                                                                                
		                                                                                                <c:forEach begin="0" end="${usedDocument[proofIndex].documentList[index].documentAttributeList.size() - 1 }" var="docAttIndex">
		                                                                                                	<label class="control-label col-md-6 bold">${usedDocument[proofIndex].documentList[index].documentAttributeList[docAttIndex].documentAttributeName} :</label>
			                                                                                                <div class="col-md-6">
			                                                                                                    <p class="form-control-static doc-name-align">
			                                                                                                        ${usedDocument[proofIndex].documentList[index].documentAttributeList[docAttIndex].documentAttributeValue}
			                                                                                                    </p>
			                                                                                                </div>
		                                                                                                </c:forEach>
		                                                                                                <label class="control-label col-md-6 bold">Document:</label>
		                                                                                                <div class="col-md-6">
		                                                                                                    <button type="button" class="btn btn-link doc-name-align" onclick="getFile('${usedDocument[proofIndex].documentList[index].fileId}', '${usedDocument[proofIndex].documentList[index].fileName}', '${contextPath}')" ><i class="fa fa-paperclip"></i>&nbsp;${usedDocument[proofIndex].documentList[index].fileName}</button>
		                                                                                                </div>
		
		                                                                                                <label class="control-label col-md-6 bold">Reference Number:</label>
		                                                                                                <div class="col-md-6">
		                                                                                                    <p class="form-control-static doc-name-align">
		                                                                                                        <c:choose>
																												    <c:when test="${empty usedDocument[proofIndex].documentList[index].referenceNumber}">&nbsp;</c:when>
																												    <c:otherwise>
																												        <span>${usedDocument[proofIndex].documentList[index].referenceNumber}</span>
																												    </c:otherwise>
																												</c:choose>
		                                                                                                    </p>
		                                                                                                </div>
		
		                                                                                                <label class="control-label col-md-6 bold">Comment:</label>
		                                                                                                <div class="col-md-6">
		                                                                                                    <p class="form-control-static doc-name-align">
		                                                                                                        <c:choose>
																												    <c:when test="${empty usedDocument[proofIndex].documentList[index].comment}">&nbsp;</c:when>
																												    <c:otherwise>
																												        <span>${usedDocument[proofIndex].documentList[index].comment}</span>
																												    </c:otherwise>
																												</c:choose>
		                                                                                                    </p>
		                                                                                                </div>
		
		                                                                                            </div>
		                                                                                        </c:if>
		
		                                                                                        <c:if test="${usedDocument[proofIndex].documentList[index].documentReceived == 0}">
		                                                                                            <label class="control-label col-md-6 bold">Due Date:</label>
		                                                                                            <div class="col-md-6">
		                                                                                                <p class="form-control-static doc-name-align">
		                                                                                                    <fmt:formatDate pattern="MM/dd/yyyy" value="${usedDocument[proofIndex].documentList[index].dueDate}" />
		                                                                                                </p>
		                                                                                            </div>
		                                                                                        </c:if>
		
		                                                                                        <c:if test="${usedDocument[proofIndex].documentList[index].documentReceived == 2}">
		                                                                                            <label class="control-label col-md-6 bold">Waived Reason:</label>
		                                                                                            <div class="col-md-6">
		                                                                                                <p class="form-control-static doc-name-align">
		                                                                                                    ${usedDocument[proofIndex].documentList[index].waiverReason}
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
		                                                    </c:if>
		                                                    </c:when>
															<c:otherwise>
															  <label class="control-label col-md-6 text-danger">No Document Found</label>
															</c:otherwise>  
															</c:choose> 
		                                                </div>
		                                                <div class="clearfix margin-bottom-10"></div>
		                                               <%--  <div class="row">
		                                                    <div class="col-md-12">
		                                                        <h3 class="form-section"><span class="text-danger">Unused Documents</span></h3>
		                                                    </div>
		                                                    <textarea id="unusedDocuments" style="display: none;">${unusedDocuments}</textarea>
		                                                    <div class="form-body">
													           <!--  <div class="col-md-12">
													                <div class="portlet-body form">
													                    <div class="pull-right">
													                        <button type="button" id="deleteRemarkId" class="btn btn-sm grey-gallery" onclick="confirmDelete();">
													                            <em class="fa fa-times-circle"></em> Delete
													                        </button>
													                    </div>
													                    <div class="clearfix margin-bottom-5"></div>
													                </div>
													            </div> -->
													            <div id="unusedDocumentsJqxgrid"></div>
													        </div>
		                                                </div> --%>
		                                            </div>
                                                </div>
                                            </div>
                                            <%-- <div class="clearfix margin-bottom-10"></div>
                                            <c:if test="${screeningData.totalRiskLevel != 'Low'}">
	                                            <h3 class="form-section">Mitigation Details</h3>
	                                             
	                                             <div class="form-body">
	                                             <c:forEach begin="0" end="${mitigationObject.size() - 1 }" var="mitigationIndex">
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <div class="form-group">
	                                                            <label class="control-label col-md-4 bold">Actvity Performed:</label>
	                                                            <div class="col-md-8">
	                                                                <p class="form-control-static doc-name-align">
	                                                                    ${mitigationObject[mitigationIndex].activityPerformed}
	                                                                </p>
	                                                            </div>
	                                                        </div>
	
	                                                        <div class="form-group">
	                                                            <label class="control-label col-md-4 bold">Activity Description:</label>
	                                                            <div class="col-md-8">
	                                                                <p class="form-control-static doc-name-align">
	                                                                    ${mitigationObject[mitigationIndex].activityDescription}
	                                                                </p>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-4">
	                                                        <div class="form-group">
	                                                            <label class="control-label col-md-4 bold">Proof / Evidence:</label>
	                                                            <div class="col-md-8">
	                                                            	<c:forEach begin="0" end="${mitigationObject[mitigationIndex].mitigationProofList.size() - 1 }" var="mitigationProofIndex">
	                                                                	<button type="button" class="btn btn-link" onclick="getFile('${mitigationObject[mitigationIndex].mitigationProofList[mitigationProofIndex].documentId}', '${mitigationObject[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}', '${contextPath}')" ><i class="fa fa-paperclip"></i>&nbsp;${mitigationObject[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}</button>
	                                                                	<br />
	                                                                </c:forEach>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <hr />
	                                                </c:forEach>
	                                            </div> 
	                                    	</c:if> --%>
                                        </div>
                                    </div>
                                </div>
                                <div id="remarkHistoryModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-md">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Remark Details</h4>
												</div>
												<div class="modal-body">
												<textarea id="remarkHistoryViewJson" style="display: none;">${remarkHistoryViewJson}</textarea>
													<div class="row">
														<div class="col-md-12">
															<div id="remarkHistoryJqxgrid"></div>
														</div>												
												   </div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn-modal-cls btn-sm default" data-dismiss="modal"><img src="/digiKYC/assets/global/img/clear.png" /> Close
							                        </button>
												</div>
											</div>
										</div>
								</div> 
                                <div id="remarkModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">Remarks</h4>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-md-12">
														<div class="" id="deletedDocumentList" style="display:none;">
															<!-- <h5 class="modal-title">Below documents to be deleted.</h5> -->
															<font color="red"><i class="fa fa-warning"></i>&nbsp; Below documents to be deleted.</font>		
														</div>
														<div class="clearfix margin-bottom-10"></div>
														<div id="deletedProofs"></div>
													</div>
												</div>
													
												<div class="row">
													<div class="col-md-12">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">Remark</label>
															<textarea name="remarkContent" id="remarkContent" rows="15" style="height: 140px;" data-parsley-required="false" placeholder="Remark"></textarea>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
													</div>												
											   </div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn-modal-cls btn btn-sm grey-gallery" id="finalDelete" > <!-- data-dismiss="modal" onclick="deleteDocuments()" -->
													<img src="/digiKYC/assets/global/img/submit.png" /> Submit
												</button>
												<button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal" onclick="cancelDelete()">
						                            <img src="/digiKYC/assets/global/img/clear.png" /> Close
						                        </button>
											</div>
										</div>
									</div>
								</div>
                            </form>
                            <div id="screeningResultModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
							    <div class="modal-dialog modal-lg" style="width: 90%;">
							        <div class="modal-content">
							            <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal">&times;</button>
							                <h4 class="modal-title">Screening Result</h4>
							            </div>
							            <div class="modal-body">
						            	    <div class="row">
							               		<div class="col-md-12">
													<div class="page-bar" id="screeningResultBreadCrumId">
														<ul class="page-breadcrumb">
															<li><em><strong>Screening Result</strong></em></li>
														</ul>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div id='jqxWidget'>
																<div id="screeningResultJqxgrid"></div>
															</div>
														</div>
													</div>	
												</div>
							               </div>
							            </div>
							            <div class="modal-footer">
							            	<button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal">
						                           <img src="/digiKYC/assets/global/img/clear.png" /> Close
						                       </button>
							            </div>
							        </div>
							    </div>
							</div>
							<!-- End screening modal -->
							<div id="screeningDataModal" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog modal-md">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Screening Data</h4>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-12">
													<div class="">
														<pre style="height:400px;overflow-y: auto;overflow-x: hidden;" id="screeningDataDiv"></pre>
													</div>
												</div>												
										   </div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal">
						                           <img src="/digiKYC/assets/global/img/clear.png" /> Close
						                       </button>
										</div>
									</div>
								</div>
							</div>
							
							<div id="otherDetailsModal" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
							   <div class="modal-dialog modal-lg">
							      <div class="modal-content">
							         <div class="modal-header">
							            <button type="button" class="close" data-dismiss="modal">&times;</button>
							            <h4 class="modal-title">Other details</h4>
							         </div>
							         <div class="modal-body">
							            <div class="row">
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">KYC Party Type: </label>
							                  <c:set var="kycPartyType" value="-" />
							                  <c:if test="${otherDetails.has('kycPartyType') && not empty otherDetails.get('kycPartyType')}">
							                     <c:set var="kycPartyType" value="${otherDetails.get('kycPartyType')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${kycPartyType}</p>
							               </div>
							            </div>
							            <!-- End Row -->
							            <hr>
							            <div class="row">
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">TMS Manager Name: </label>
							                  <c:set var="tmsManagerName" value="-" />
							                  <c:if test="${otherDetails.has('tmsManagerName') && not empty otherDetails.get('tmsManagerName')}">
							                     <c:set var="tmsManagerName" value="${otherDetails.get('tmsManagerName')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${tmsManagerName}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">TMS Manager EmailId: </label>
							                  <c:set var="tmsManagerEmailId" value="-" />
							                  <c:if test="${otherDetails.has('tmsManagerEmailId') && not empty otherDetails.get('tmsManagerEmailId')}">
							                     <c:set var="tmsManagerEmailId" value="${otherDetails.get('tmsManagerEmailId')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${tmsManagerEmailId}</p>
							               </div>
							            </div>
							            <!-- End Row -->
							            <hr>
							            <div class="row">
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Training Club/Association Bank AC: </label>
							                  <c:set var="trainingClubOrAssociationBankAC" value="-" />
							                  <c:if test="${otherDetails.has('trainingClubOrAssociationBankAC') && not empty otherDetails.get('trainingClubOrAssociationBankAC')}">
							                     <c:set var="trainingClubOrAssociationBankAC" value="${otherDetails.get('trainingClubOrAssociationBankAC')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${trainingClubOrAssociationBankAC}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Bank Name: </label>
							                  <c:set var="bankName" value="-" />
							                  <c:if test="${otherDetails.has('bankName') && not empty otherDetails.get('bankName')}">
							                     <c:set var="bankName" value="${otherDetails.get('bankName')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${bankName}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">IBAN: </label>
							                  <c:set var="iban" value="-" />
							                  <c:if test="${otherDetails.has('iban') && not empty otherDetails.get('iban')}">
							                     <c:set var="iban" value="${otherDetails.get('iban')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${iban}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Routing Number: </label>
							                  <c:set var="routingNumber" value="-" />
							                  <c:if test="${otherDetails.has('routingNumber') && not empty otherDetails.get('routingNumber')}">
							                     <c:set var="routingNumber" value="${otherDetails.get('routingNumber')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${routingNumber}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Account Number: </label>
							                  <c:set var="accountNumber" value="-" />
							                  <c:if test="${otherDetails.has('accountNumber') && not empty otherDetails.get('accountNumber')}">
							                     <c:set var="accountNumber" value="${otherDetails.get('accountNumber')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${accountNumber}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Bank Account Type: </label>
							                  <c:set var="bankAccountType" value="-" />
							                  <c:if test="${otherDetails.has('bankAccountType') && not empty otherDetails.get('bankAccountType')}">
							                     <c:set var="bankAccountType" value="${otherDetails.get('bankAccountType')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${bankAccountType}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Bank Swift Code: </label>
							                  <c:set var="bankSwiftCode" value="-" />
							                  <c:if test="${otherDetails.has('bankSwiftCode') && not empty otherDetails.get('bankSwiftCode')}">
							                     <c:set var="bankSwiftCode" value="${otherDetails.get('bankSwiftCode')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${bankSwiftCode}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Bank Country: </label>
							                  <c:set var="bankCountryName" value="-" />
							                  <c:if test="${otherDetails.has('bankCountryName') && not empty otherDetails.get('bankCountryName')}">
							                     <c:set var="bankCountryName" value="${otherDetails.get('bankCountryName')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${bankCountryName}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Branch Identifier: </label>
							                  <c:set var="branchIdentifier" value="-" />
							                  <c:if test="${otherDetails.has('branchIdentifier') && not empty otherDetails.get('branchIdentifier')}">
							                     <c:set var="branchIdentifier" value="${otherDetails.get('branchIdentifier')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${branchIdentifier}</p>
							               </div>
							            </div>
							            <!-- End Row -->
							            <hr>
							            <div class="row">
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Full Name: </label>
							                  <c:set var="clubContactFullName" value="-" />
							                  <c:if test="${otherDetails.has('clubContactFullName') && not empty otherDetails.get('clubContactFullName')}">
							                     <c:set var="clubContactFullName" value="${otherDetails.get('clubContactFullName')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactFullName}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Address Street1: </label>
							                  <c:set var="clubContactAddressStreet1" value="-" />
							                  <c:if test="${otherDetails.has('clubContactAddressStreet1') && not empty otherDetails.get('clubContactAddressStreet1')}">
							                     <c:set var="clubContactAddressStreet1" value="${otherDetails.get('clubContactAddressStreet1')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactAddressStreet1}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Address Street2: </label>
							                  <c:set var="clubContactAddressStreet2" value="-" />
							                  <c:if test="${otherDetails.has('clubContactAddressStreet2') && not empty otherDetails.get('clubContactAddressStreet2')}">
							                     <c:set var="clubContactAddressStreet2" value="${otherDetails.get('clubContactAddressStreet2')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactAddressStreet2}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Address City: </label>
							                  <c:set var="clubContactAddressCity" value="-" />
							                  <c:if test="${otherDetails.has('clubContactAddressCity') && not empty otherDetails.get('clubContactAddressCity')}">
							                     <c:set var="clubContactAddressCity" value="${otherDetails.get('clubContactAddressCity')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactAddressCity}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Address State: </label>
							                  <c:set var="clubContactAddressState" value="-" />
							                  <c:if test="${otherDetails.has('clubContactAddressState') && not empty otherDetails.get('clubContactAddressState')}">
							                     <c:set var="clubContactAddressState" value="${otherDetails.get('clubContactAddressState')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactAddressState}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Address Country: </label>
							                  <c:set var="clubContactAddressCountryName" value="-" />
							                  <c:if test="${otherDetails.has('clubContactAddressCountryName') && not empty otherDetails.get('clubContactAddressCountryName')}">
							                     <c:set var="clubContactAddressCountryName" value="${otherDetails.get('clubContactAddressCountryName')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactAddressCountryName}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Address Postal Code: </label>
							                  <c:set var="clubContactAddressPostalCode" value="-" />
							                  <c:if test="${otherDetails.has('clubContactAddressPostalCode') && not empty otherDetails.get('clubContactAddressPostalCode')}">
							                     <c:set var="clubContactAddressPostalCode" value="${otherDetails.get('clubContactAddressPostalCode')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactAddressPostalCode}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Email Id: </label>
							                  <c:set var="clubContactEmailId" value="-" />
							                  <c:if test="${otherDetails.has('clubContactEmailId') && not empty otherDetails.get('clubContactEmailId')}">
							                     <c:set var="clubContactEmailId" value="${otherDetails.get('clubContactEmailId')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactEmailId}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Phone: </label>
							                  <c:set var="clubContactPhone" value="-" />
							                  <c:if test="${otherDetails.has('clubContactPhone') && not empty otherDetails.get('clubContactPhone')}">
							                     <c:set var="clubContactPhone" value="${otherDetails.get('clubContactPhone')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactPhone}</p>
							               </div>
							               <div class="col-md-6">
							                  <label class="control-label col-md-6 bold">Club Contact Fax: </label>
							                  <c:set var="clubContactFax" value="-" />
							                  <c:if test="${otherDetails.has('clubContactFax') && not empty otherDetails.get('clubContactFax')}">
							                     <c:set var="clubContactFax" value="${otherDetails.get('clubContactFax')}" />
							                  </c:if>
							                  <p class="form-control-static doc-name-align">${clubContactFax}</p>
							               </div>
							            </div>
							            <!-- End Row -->
							         </div>
							         <div class="modal-footer">
							            <button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal">
							            	<img src="/digiKYC/assets/global/img/clear.png" /> Close
							            </button>
							         </div>
							      </div>
							   </div>
							</div>
							<!-- End other details modal -->
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
	$(window).bind("load", function() {
    /*======= Unused Document =======================*/
	    var unusedDocuments = $("#unusedDocuments").val();
    	if(unusedDocuments == "[]"){
    		console.log("inside no unused document...");
    		$("#remarkContent").attr('data-parsley-required', 'false');
    	}
	    if($("#unusedDocuments").val() != null && $("#unusedDocuments").val() != ''){
	    	unusedDocuments = JSON.parse($("#unusedDocuments").val());	
		}
		//--console.log("unusedDocuments"+unusedDocuments);
		var unusedDocumentsSource = 
		{
	        datatype: "json",
			localdata: unusedDocuments,
	        datafields: [
				{ name: 'proofName', 		type: 'string'},
				{ name: 'documentName', 	type: 'string'},
				{ name: 'documentReceived',	type: 'string'},
				{ name: 'receviedDate', 	type: 'string'},
				{ name: 'expiryDate', 		type: 'string'},
				{ name: 'document', 		type: 'string'},
				{ name: 'referenceNumber',	type: 'string'},
				{ name: 'comment',	 		type: 'string'},
				{ name: 'documentId',	 	type: 'hidden'}
			 ],
	    };
	    var unusedDocumentsAdapter = new $.jqx.dataAdapter(unusedDocumentsSource);
	    // Create jqxGrid
	    $("#unusedDocumentsJqxgrid").jqxGrid(
	    {
			width: '100%',
	        source: unusedDocumentsAdapter,
			autoloadstate: false,
	        autosavestate: false,
	        groupable: true,
			theme: 'ITGtheme',
			groupsexpandedbydefault: true,
			sortable: true,
	        pageable: true,
	        height: 350,
			selectionmode: 'checkbox',
			showfilterrow: true,
	        filterable: true,
	        enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
	        rowsheight: 50,
	        ready: function () {          
			  $('#unusedDocumentsJqxgrid').jqxGrid('addgroup', 'proofName');
			  $('#unusedDocumentsJqxgrid').jqxGrid('expandgroup', 0);
			},
	        columns: [
	          { text: 'Proof Name', 		datafield: 'proofName', 		filtertype: 'input', 	width: '10%', align: 'left'},
			  { text: 'Document Name', 		datafield: 'documentName', 		filtertype: 'input', 	width: '20%', align: 'left'},
			  { text: 'Document Received', 	datafield: 'documentReceived',	filtertype: 'input',	width: '10%', align: 'left'},
			  { text: 'Received Date', 		datafield: 'receviedDate', 		filtertype: 'input',	width: '10%', align: 'left'},
			  { text: 'Expiry Date',		datafield: 'expiryDate', 		filtertype: 'input', 	width: '6%', align: 'left'},
			  { text: 'Document', 			datafield: 'document', 			filtertype: 'input', 	width: '10%', align: 'left'},
			  { text: 'Reference Number', 	datafield: 'referenceNumber',	filtertype: 'input', 	width: '10%', align: 'left'},
			  { text: 'Comment', 			datafield: 'comment', 			filtertype: 'input', 	width: '10%', align: 'left'},
			  { text: 'Hidden', 			datafield: 'documentId', 		filtertype: 'input', 	width: '10%', align: 'left', editable: false,width: 0, hidden:true}
	        ],
			pageSize:unusedDocuments.length,
			pageSizeOptions:["5","10","20", unusedDocuments.length]				
	    });
	});

	/* function confirmDelete(){
		var selectedrowindexs = $("#unusedDocumentsJqxgrid").jqxGrid('getselectedrowindexes');
		console.log("selectedrowindexs: "+selectedrowindexs);
		console.log("selectedrowindexs.length: " + selectedrowindexs.length);		
		if(selectedrowindexs.length == 0){
			bootbox.alert("Please Select Atleast One Document!", function(){});
			return false;
		}else{
			$("#remarkContent").attr('data-parsley-required', 'true');
			$('#remarkModalId').modal('toggle');
		}
	} */
	
	function confirmDeleteDocuments(){
			$("#remarkContent").attr('data-parsley-required', 'true');
			$('#remarkModalId').modal('toggle');
	}
	
	function cancelDelete(){
			$("#documentNames").val("");
			$("#documentIds").val("");
			$("#deletedProofs").html("");
			$("#remarkContent").attr('data-parsley-required', 'false');
	}
	
	var deleteRemark = "";
	function deleteDocuments(){
		var documentIdArr = [];
		var documentNameArr = [];

		//deleteRemark = $("#remarkContent").val();
		//if(deleteRemark=="" || deleteRemark=="undefined")
		//{
			//$('#form1').parsley().validate();
			//$("#remarkContent").attr('data-parsley-required', 'true');
			//$('#remarkModalId').modal('toggle');
		//}else{
			$("#remarkContent").trigger('change');
			var selectedrowindexs = $("#unusedDocumentsJqxgrid").jqxGrid('getselectedrowindexes');
			//console.log("selectedrowindexs: " + selectedrowindexs);
			console.log("selectedrowindexs.length: " + selectedrowindexs.length);
			//console.log("type: " + typeof selectedrowindexs);			
			
			var deleteIndex = [];
			if(selectedrowindexs.length > 0){
				for (var i = 0; i < selectedrowindexs.length; i++) {									
				
					if (typeof selectedrowindexs[i] === 'undefined' || selectedrowindexs[i] === null) {
						console.log("i: " + i);
						console.log("skipping element: " + selectedrowindexs[i]);							
					}else{					
						var data = $('#unusedDocumentsJqxgrid').jqxGrid('getrowdata', selectedrowindexs[i]);
						console.log("data : " + JSON.stringify(data));
						
						console.log("i: " + i + " index: " + selectedrowindexs[i]);
						var index = selectedrowindexs[i];
						console.log("index: " + index);
											
						deleteIndex.push(index);
						//$("#unusedDocumentsJqxgrid").jqxGrid('deleterow', [id]);
						
						documentIdArr.push(data.documentId);
						documentNameArr.push(data.documentName);
						console.log("data.documentId: " + data.documentId);
						console.log("data.documentName: " + data.documentName);
					}
				}			
			}
			
			console.log("deleteIndex: " + deleteIndex);
			
			/* for (var i = 0; i < deleteIndex.length; i++) {
				$("#unusedDocumentsJqxgrid").jqxGrid('deleterow', deleteIndex);
			} */
			
			/*if(selectedrowindexs.length > 0){
				for (var i = 0; i < selectedrowindexs.length; i++) {
					var data = $('#unusedDocumentsJqxgrid').jqxGrid('getrowdata', selectedrowindexs[i]);
					console.log("data : " + JSON.stringify(data));
					documentIdArr.push(data.documentId);
					console.log("documentIdArr: " + documentIdArr);
					$("#unusedDocumentsJqxgrid").jqxGrid('deleterow', selectedrowindexs[i]);
				}			
			}*/
			
			console.log("selectedrowindexs: " + selectedrowindexs);
			console.log("documentIdArr: " + documentIdArr);
			$("#documentIds").val(documentIdArr);
			$("#documentNames").val(documentNameArr);
			console.log("FINAL documentIdArr: " + documentIdArr);
			console.log("FINAL documentNameArr: " + documentNameArr);
			//$('#deleteRemarkId').attr("disabled", true);
			if(documentNameArr.length>0){
				$("#deletedDocumentList").show();
			
				var str = '<ul>'
				//for(var i in $documentNameArr){
				for (var i = 0; i < documentNameArr.length; i++) {
				   str += '<li>' + documentNameArr[i] + '</a></li>';
				}
				str += '</ul>';
				document.getElementById('deletedProofs').innerHTML += str;
				confirmDeleteDocuments();
			} else {
				$("#deletedDocumentList").hide();
				$("#remarkContent").attr('data-parsley-required', 'false');
				
				bootbox.confirm({
			           message: "Are you sure you want to approve?",
			           buttons: {
			               confirm: {
			                   label: ' Yes',
			                   className: 'alert-yes btn btn-sm grey-gallery'
			               },
			               cancel: {
			                   label: ' No',
			                   className: 'alert-no btn btn-sm btn-default'
			               }
			           },
			        callback: function (result) {
			    		if(result){
			    			$("#remarkContent").val("");
			    			$("#form1").submit();
			        		buffer();
			        	}
			        }
				});
				
			}
			
	}
    jQuery(document).ready(function() {
    	jQuery("#subject").remove("active");
		jQuery("#master").remove("active");
		jQuery("#dashboard").addClass("active");
        $(".doc0").hide();
        $(".doc1").hide();
        $(".doc2").hide();
        
        for (var index = 0; index < 3; index++) {
            $(".documentReceivedNo" + index).hide();
            $(".documentReceivedWaiver" + index).hide();
            $(".documentReceivedYes" + index).hide();
        }
    });
    
    $('#closeButton').click(function() {
        console.log("Closing current window...");
        window.close();
    });

    function showHideDiv(att, index) {
        if ($(att).is(":checked")) {
            $(".doc" + index).show(500);
            $(".documentReceivedNo" + index).show(500);
            $(".documentReceivedWaiver" + index).hide(500);
            $(".documentReceivedYes" + index).hide(500);
        } else {
            $(".doc" + index).hide(500);
            $(".documentReceivedNo" + index).hide(500);
            $(".documentReceivedWaiver" + index).hide(500);
            $(".documentReceivedYes" + index).hide(500);
        }
    }

    function showdocFields(value, index) {
        if (value == 0) {
            $(".documentReceivedNo" + index).show(500);
            $(".documentReceivedWaiver" + index).hide(300);
            $(".documentReceivedYes" + index).hide(300);
        } else if (value == 1) {
            $(".documentReceivedNo" + index).hide(300);
            $(".documentReceivedWaiver" + index).hide(300);
            $(".documentReceivedYes" + index).show(500);
        } else if (value == 2) {
            $(".documentReceivedNo" + index).hide(300);
            $(".documentReceivedWaiver" + index).show(500);
            $(".documentReceivedYes" + index).hide(300);
        }
    }
    
    /* ------------------ Functions Starts ------------------- */
	$('#cancelButton').click(function() {
		bootbox.confirm({
            message: "Are you sure you want to cancel?",
            buttons: {
                confirm: {
                    label: ' Yes',
                    className: 'alert-yes btn btn-sm grey-gallery'
                },
                cancel: {
                    label: ' No',
                    className: 'alert-no btn btn-sm btn-default'
                }
            },
	        callback: function (result) {
	        	if(result){
	        		location.href = "${contextPath}/dashboard";
	        		buffer();
	        	}
	        }
		});
	});
	
	$('#finalDelete').click(function() {
		var response = $('#form1').parsley().validate();
		if(response) {
		
			bootbox.confirm({
		           message: "Are you sure you want to approve?",
		           buttons: {
		               confirm: {
		                   label: ' Yes',
		                   className: 'alert-yes btn btn-sm grey-gallery'
		               },
		               cancel: {
		                   label: ' No',
		                   className: 'alert-no btn btn-sm btn-default'
		               }
		           },
		        callback: function (result) {
		    		if(result){
		    			$('#remarkModalId').modal('toggle');
		        		$("#form1").submit();
		        		buffer();
		        	}
		        }
			});
		} else
			return false;
		
	});
	
	$("#btnScreeningDetails").click(function(){
		var screeningResult = JSON.parse($("#riskDataJson").val());
		var screeningDataSource =
		{
			datatype: "json",
			localdata: screeningResult,
			datafields: [{name:'KycSubjectId',type: 'string'},{name:'ScreeningData',type: 'string'},{ name: 'ResultId',type: 'string'},{name: 'ScreeningSolution',	type: 'string'},{ name: 'Comments',type: 'string'},{ name: 'EntityType',type: 'string'},{ name: 'FullName',type: 'string'},{ name: 'MatchScore',type: 'string'},{ name: 'ReasonListed',type: 'string'},{ name: 'Action',type: 'string'}]
		};
		
		var screeningDataAdapter = new $.jqx.dataAdapter(screeningDataSource);
		$("#screeningResultJqxgrid").jqxGrid({
			width: '100%',
			source: screeningDataAdapter,
			autoloadstate: false,
			autosavestate: false,
			groupable: true,
			groupsexpandedbydefault: true,
			sortable: true,
			pageable: true,
			height: 300,
			showfilterrow: true,
			filterable: true,
			enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
	        rowsheight: 50,
	        columns: [
			  { text: 'Result Id', 			datafield: 'ResultId',			filtertype: 'input', hidden: true,key: true},
			  { text: 'Kyc Subject Id', 	datafield: 'KycSubjectId',		filtertype: 'input', hidden: true},
			  { text: 'Screening Solution', datafield: 'ScreeningSolution',	filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Comments', 			datafield: 'Comments', 			filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Entity Type', 		datafield: 'EntityType', 		filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Name',	 			datafield: 'FullName', 			filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Match Score', 		datafield: 'MatchScore', 		filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Reason Listed',		datafield: 'ReasonListed',		filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Action', 			datafield: 'Action', 			filtertype: 'input', align: 'left', enabletooltips:false}
			],
			pageSize:screeningResult.length,
			pageSizeOptions:["5","10","20",screeningResult.length]				
		});
		
		$('#screeningResultJqxgrid').show();
		$('#screeningResultModalId').modal('toggle');
	});


	var showScreeningData = function(id){
		var rows = $("#screeningResultJqxgrid").jqxGrid('selectedrowindexes');
		for (var m = 0; m < rows.length; m++) {
	        var row = $("#screeningResultJqxgrid").jqxGrid('getrowdata', rows[m]);
	        $("#screeningDataDiv").html(JSON.stringify(row.ScreeningData,null,2));
			$('#screeningDataModal').modal('toggle');
	    }
	};
</script>