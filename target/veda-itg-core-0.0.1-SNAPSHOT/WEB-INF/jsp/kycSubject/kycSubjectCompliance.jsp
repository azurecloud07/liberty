<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="riskCategoryName" value="<%= ITGConstant.RISK_CATEGORY_NAME%>" />
<c:set var="riskCategoryShortCode" value="<%= ITGConstant.RISK_CATEGORY_SHORT_CODE%>" />

<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />
<spring:message code="kycSubject.registrationName.label" var="registrationNameLabel" />
<spring:message code="kycSubject.registrationNumber.label" var="registrationNumberLabel" />
<spring:message code="kycSubject.dateOfIncorp.label" var="dateOfIncorpLabel" />
<spring:message code="kycSubject.countryOfIncorp.label" var="countryOfIncorpLabel" />
<spring:message code="kycSubject.viewOtherDetailsLabel.label" var="viewOtherDetailsLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<%-- <spring:message code="kycSubject.effectiveDate.label" var="effectiveDateLabel" /> --%>
<spring:message code="kycSubject.sourceOfWealth.label" var="sourceOfWealthLabel" />
<spring:message code="kycSubject.itgJurisdiction.label" var="itgJurisdictionLabel" />
<spring:message code="kycSubject.exemptCategory.label" var="exemptCatLabel" />
<spring:message code="kycSubject.countryOfCitizenship.label" var="countryOfCitizenshipLabel" />

<spring:message code="app.isRelationList" var="isRelationList" />
<spring:message code="app.isOtherDetails" var="isOtherDetails" />
<spring:message code="app.isShowMitigatedRisk" var="isShowMitigatedRisk" />
<spring:message code="app.isMitigationWorkflow" var="isMitigationWorkflow" />

<spring:message code="kycSubject.isDocumentConfigCheckBox.label" var="isDocumentConfigCheckBoxLabel" />
<spring:message code="kycSubject.isDocumentConfigCheckBoxBy.label" var="isDocumentConfigCheckBoxByLabel" />
<spring:message code="kycSubject.isDocumentConfigCheckBoxDate.label" var="isDocumentConfigCheckBoxDateLabel" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
            	<li><a class="cancel redirect-kyc/subject/search"> KYC Subjects <i class="fa fa-angle-right"></i></a></li>
                <li>Compliance Approval</li>
            </ul>
            <!-- <h4>&nbsp;KYC Subject</h4> -->
            <span class="header-scope">&nbsp;KYC Subject</span>
        </div>
        <div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">
						<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'KYCSubject', 'Remarks','Viewing remark on compliance approval']);" >Remark</button>
						<%-- <c:choose>
		                   <c:when test="${nextStates != null && nextStates.length() > 0}">
			                   	<c:forEach begin="0" end="${nextStates.length() -1}" var="index"> --%>
			                   		<!-- <button type="button" class="btn-itg btn btn-sm grey-gallery" data-toggle="modal" data-target="#remarkModalId" onclick="_paq.push(['trackEvent', 'KYCSubject', 'ComplianceSubmit','Submitting from compliance']);" >
			                            <img src="/digiKYC/assets/global/img/submit.png"> Approve
			                        </button> -->
			                   	<%-- </c:forEach> --%>
		                  		<%-- <button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button> --%>
		                   <%-- </c:when>
		                </c:choose> --%>
		                
						<c:choose>
		                   <c:when test="${nextStates != null && nextStates.length() > 0}">
			                   	<c:forEach begin="0" end="${nextStates.length() -1}" var="index">
			                   		<button type="button" class="btn-itg btn btn-sm grey-gallery" data-toggle="modal" data-target="#remarkModalId" onclick="_paq.push(['trackEvent', 'KYCSubject', 'ComplianceSubmit','Submitting from compliance']);" >
			                            ${nextStates.get(index).getString('iconImage')} ${nextStates.get(index).getString('Label')}
			                        </button>
			                   	</c:forEach>
		                  		<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="${contextPath}/assets/global/img/clear.png" /> ${cancelLabel} </button>
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
                            <form:form modelAttribute="subjectComplianceBO" class="form-horizontal uk-form bt-flabels js-flabels" action="${contextPath}/kyc/subject/complianceApproval" id="frmMain" method="POST" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
                            <form:hidden path="kycSubjectId"/>
                            <form:hidden path="kycSubjectRequestNo"/>
                            <input type="hidden" id="manualScreenShowURL" value="${manualScreenShowURL}" />
                            <textarea id="workflowId" style="display:none;"></textarea>
							<textarea id="stateId" style="display:none;"></textarea>
							<textarea id="masterId" style="display:none;">${subjectJson.id}</textarea>
							<textarea id="relationList" style="display:none;">${subjectJson.relationListString}</textarea>
							<input type="hidden" id="instance" value="${instanceName}" />
                                <div class="form-wizard">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab1">
                                            <h3 class="form-section">Request Detail</h3>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <h3 class="form-section">KYC Details</h3>
                                                        <div class="row">
                                                        	<c:if test="${kycViewSchema != null && kycViewSchema.length() > 0}">
                                                        		<c:forEach begin="0" end="${kycViewSchema.get('KycDetails').length() - 1 }" var="index">
                                                        			<div class="col-md-12">
		                                                                <div class="form-group">
		                                                                    <label class="control-label col-md-6 bold">${kycViewSchema.get('KycDetails').get(index).get('title')} :</label>
		                                                                    <div class="col-md-6">
		                                                                        <p class="form-control-static doc-name-align">
		                                                                        	<c:choose>
																				       	<c:when test="${kycViewSchema.get('KycDetails').get(index).get('value') != null && kycViewSchema.get('KycDetails').get(index).get('value').length() > 0}">
																				           	${kycViewSchema.get('KycDetails').get(index).get('value')}
																				        </c:when>
																				      	<c:otherwise>
																				           	 
																			       		</c:otherwise>
																			        </c:choose>
		                                                                        </p>
		                                                                    </div>
		                                                                </div>
		                                                            </div>
                                                        		</c:forEach>
                                                        	</c:if>
                                                            <%-- <div class="col-md-12">
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
																			<label class="control-label col-md-6 bold">${registrationNumberLabel} :</label>
																			<div class="col-md-6">
																				<p class="form-control-static doc-name-align">
																					<c:if test="${subjectJson != null && subjectJson.registrationNumber != null}">
																						${subjectJson.registrationNumber} 
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
                                                                    <label class="control-label col-md-6 bold">${itgJurisdictionLabel}:</label>
                                                                    <div class="col-md-6">
                                                                        <p class="form-control-static doc-name-align">
                                                                            <c:if test="${subjectJson != null && subjectJson.itgJurisdictionName != null}">
                                                                                ${subjectJson.itgJurisdictionName}
                                                                            </c:if>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div> --%>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <h3 class="form-section">Address</h3>
                                                        <div class="row">
                                                        	<c:if test="${kycViewSchema != null && kycViewSchema.length() > 0}">
                                                        		<c:forEach begin="0" end="${kycViewSchema.get('AddressDetails').length() - 1 }" var="index">
                                                        			<div class="col-md-12">
		                                                                <div class="form-group">
		                                                                    <label class="control-label col-md-6 bold">${kycViewSchema.get('AddressDetails').get(index).get('title')} :</label>
		                                                                    <div class="col-md-6">
		                                                                        <p class="form-control-static doc-name-align">
		                                                                        	<c:choose>
																				       	<c:when test="${kycViewSchema.get('AddressDetails').get(index).get('value') != null && kycViewSchema.get('AddressDetails').get(index).get('value').length() > 0}">
																				           	${kycViewSchema.get('AddressDetails').get(index).get('value')}
																				        </c:when>
																				      	<c:otherwise>
																				           	 
																			       		</c:otherwise>
																			        </c:choose>
		                                                                        </p>
		                                                                    </div>
		                                                                </div>
		                                                            </div>
                                                        		</c:forEach>
                                                        	</c:if>
                                                        	<%-- <div class="col-md-12 hidden">
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
																					<input type="hidden" id="countryOfIncorporationCode" value="${subjectJson.countryOfIncorporationCode}">
																					<c:if test="${subjectJson != null && subjectJson.countryOfIncorporationName != null}">
																						${subjectJson.countryOfIncorporationName} 
																					</c:if>
																				</p>
																			</div>
																		</div>
																	</div>
																</c:otherwise>
															</c:choose> --%>
                                                        </div>
                                                    </div>
                                                    
                                                    <c:if test="${subjectJson.typeOfCounterpartyCode == 'Individual'}">
                                                    	<div class="col-md-4">
	                                                        <h3 class="form-section">Other details</h3>
	                                                        <div class="row">
	                                                        	<c:if test="${kycViewSchema != null && kycViewSchema.length() > 0}">
	                                                        		<c:if test="${kycViewSchema.has('OtherDetails') && not empty kycViewSchema.get('OtherDetails')}">
	                                                        			<c:forEach begin="0" end="${kycViewSchema.get('OtherDetails').length() - 1 }" var="index">
		                                                        			<div class="col-md-12">
				                                                                <div class="form-group">
				                                                                    <label class="control-label col-md-6 bold">${kycViewSchema.get('OtherDetails').get(index).get('title')} :</label>
				                                                                    <div class="col-md-6">
				                                                                        <p class="form-control-static doc-name-align">
				                                                                        	<c:choose>
																						       	<c:when test="${kycViewSchema.get('OtherDetails').get(index).get('value') != null && kycViewSchema.get('OtherDetails').get(index).get('value').length() > 0}">
																						           	${kycViewSchema.get('OtherDetails').get(index).get('value')}
																						        </c:when>
																						      	<c:otherwise>
																						           	 
																					       		</c:otherwise>
																					        </c:choose>
				                                                                        </p>
				                                                                    </div>
				                                                                </div>
				                                                            </div>
		                                                        		</c:forEach>
	                                                        		</c:if>
	                                                        	</c:if>
	                                                            <%-- <div class="col-md-12">
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
	                                                            </div> --%>
	                                                        </div>
	                                                        <%-- <div class="row">
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
	                                                        <div class="row">
	                                                            <div class="col-md-12">
	                                                                <div class="form-group">
	                                                                    <label class="control-label col-md-6 bold">${exemptCatLabel}:</label>
	                                                                    <div class="col-md-6">
	                                                                        <p class="form-control-static doc-name-align">
	                                                                            <c:if test="${subjectJson != null}">
	                                                                                <c:choose>
																					   <c:when test="${subjectJson.isExemptCategory}"><span> Yes </span></c:when> 
																					   <c:otherwise><span> No </span></c:otherwise>
																					</c:choose>
	                                                                            </c:if>
	                                                                        </p>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div> --%>
	                                                        
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
															                <c:if test="${otherDetails.has('stateOrCounty') && not empty otherDetails.get('stateOrCounty')}">
															                	<label class="control-label col-md-6 bold">State Or County:</label>
															                	<p class="form-control-static doc-name-align">
		                                                                            ${otherDetails.get('stateOrCounty')}
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
											
											<c:if test="${isOtherDetails == 'true' && otherDetails.get('isRequestFromNec') == true && subjectJson.typeOfCounterpartyName != 'Individual'}">
												<div class="row">
													<div class="col-md-12">
														<button type="button" data-toggle="modal" data-target="#otherDetailsModal" class="btn-itg pull-right btn btn-sm grey-gallery" ><i class="fa fa-info-circle"></i>&nbsp;${viewOtherDetailsLabel}</button>
													</div>
												</div>
											</c:if>
											
											<div class="clearfix margin-bottom-10"></div>
								            <div class="clearfix margin-bottom-10"></div>
								            <c:if test="${isRelationList == 'true'}">
								            	<div class="page-bar">
													<ul class="page-breadcrumb">
														<li><em><strong> Add Relation Details </strong></em></li>
													</ul>
												</div>
												<div class="row">
									            	<div class="col-md-12">
									            		<div id="addRelationGrid"></div>
									            	</div>
									            </div>
									            <div class="clearfix margin-bottom-10"></div>
									            <div class="clearfix margin-bottom-10"></div>
								            </c:if>
											<c:if test="${consentData.size() > 0}">
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
											
                                            <div class="clearfix margin-bottom-10"></div>
                                            <textarea id="riskDataJson" style="display: none;">${screeningData.screeningResult}</textarea>
                                            <h3 class="form-section">Screening Result</h3>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <!-- <h3 class="form-section">Screening Process : [Manual]</h3> -->
                                                        <%-- <c:choose>
                                                    		<c:when test="${screeningData.isAutoScreening == true}">
                                                    			<h3 class="form-section">Screening Process : [Auto]</h3>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<h3 class="form-section">Screening Process : [Manual]</h3>
                                                    		</c:otherwise>
                                                    	</c:choose> --%>
                                                        <div class="row">
															<div class="col-md-5">
																<h3 class="form-section" style="margin-left: 15px;">Screening Process&nbsp;: [${screeningData.screeningType}]</h3>
															</div>
															<div class="col-md-5">
																<h3 class="form-section" style="margin-left: 15px;">Screening Date &nbsp;&nbsp;&nbsp;&nbsp;: <fmt:formatDate pattern="dd-MMM-yyyy" value="${screeningData.createdDate}" /></h3>
															</div>
															<div class="col-md-2">
																<c:if test="${screeningData.isAutoScreening == true}">
																	<button type="button" id="btnScreeningDetails" class="btn-itg btn btn-sm grey-gallery" ><img src="/digiKYC/assets/global/img/info.png" />&nbsp;Screening Detail</button>
																</c:if>
															</div>
														</div>
                                                        <div class="row">
                                                            <div class="col-md-1"></div>
                                                            <label class="col-md-2 control-label"> PEP</label>
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
                                                            <div class="col-md-1"></div>
															<label class="col-md-2 control-label">Law Enforcement</label>
															<div class="col-md-2">
																<div class="radio-list">
																	<c:choose>
																		<c:when test="${screeningData.isLawEnforcement}">
																			<label class="radio-inline "> <input type="radio"
																				checked="checked" value="1" name="lawEnforcement" disabled>
																				Yes
																			</label>
																			<label class="radio-inline"> <input type="radio"
																				value="0" name="lawEnforcement" disabled> No
																			</label>
																		</c:when>
																		<c:otherwise>
																			<label class="radio-inline "> <input type="radio"
																				value="1" name="lawEnforcement" disabled> Yes
																			</label>
																			<label class="radio-inline"> <input type="radio"
																				checked="checked" value="0" name="lawEnforcement" disabled>
																				No
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
                                                            <label class="col-md-2 control-label"> Sanctions</label>
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
                                                            <div class="col-md-1"></div>
															<label class="col-md-2 control-label">Regulatory Enforcement</label>
															<div class="col-md-2">
																<div class="radio-list">
																	<c:choose>
																		<c:when test="${screeningData.isRegulatoryEnforcement}">
																			<label class="radio-inline "> <input type="radio"
																				checked="checked" value="1" name="regulatoryEnforcement" disabled>
																				Yes
																			</label>
																			<label class="radio-inline"> <input type="radio"
																				value="0" name="regulatoryEnforcement" disabled> No
																			</label>
																		</c:when>
																		<c:otherwise>
																			<label class="radio-inline "> <input type="radio"
																				value="1" name="regulatoryEnforcement" disabled> Yes
																			</label>
																			<label class="radio-inline"> <input type="radio"
																				checked="checked" value="0" name="regulatoryEnforcement" disabled>
																				No
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
                                                            <label class="col-md-2 control-label"> Negative Media </label>
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
                                                            <div class="col-md-1"></div>
															<label class="col-md-2 control-label">Other Bodies</label>
															<div class="col-md-2">
																<div class="radio-list">
																	<c:choose>
																		<c:when test="${screeningData.isOtherBodies}">
																			<label class="radio-inline "> <input type="radio"
																				checked="checked" value="1" name="otherBodies" disabled>
																				Yes
																			</label>
																			<label class="radio-inline"> <input type="radio"
																				value="0" name="otherBodies" disabled> No
																			</label>
																		</c:when>
																		<c:otherwise>
																			<label class="radio-inline "> <input type="radio"
																				value="1" name="otherBodies" disabled> Yes
																			</label>
																			<label class="radio-inline"> <input type="radio"
																				checked="checked" value="0" name="otherBodies" disabled>
																				No
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

                                            <div class="clearfix margin-bottom-10"></div>
                                            
                                            <c:if test="${documentConfigCheckBox == 'true'}">
								                <div class="portlet">
								                   	<div class="portlet-body form">
								                       	<div class="form-body">
															<label style="margin-left:-5px;" class="control-label">
																<c:choose>
																	<c:when test="${subjectJson.isDocumentConfigCheckBox == 'true'}">
																		<input type="checkbox" checked disabled>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" disabled>
																	</c:otherwise>
																</c:choose>
																${isDocumentConfigCheckBoxLabel}
															</label>
															<div class="clearfix margin-bottom-10"></div>
															<div class="col-md-12">
																<div class="portlet-body">
																	<div class="abc" style="margin-left: -31px; margin-right: 157px;">
																		<div class="col-md-4"><label class="bold">${isDocumentConfigCheckBoxByLabel} :&nbsp;&nbsp;</label><label>${subjectJson.documentConfigCheckBoxCheckedBy}</label></div>
																		<div class="col-md-3"><label class="bold">${isDocumentConfigCheckBoxDateLabel} :&nbsp;&nbsp;</label><label>${subjectJson.documentConfigCheckBoxCheckedDate}</label></div>
																	</div>
																</div>
															</div>
														</div>
								               		</div>
								                </div>
								            </c:if>
                                            
                                            <h3 class="form-section">Document Collection Details</h3>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-12">
														<h3 class="form-section">Template Name: <span class="text-warning" id="kycTemplateName"> ${templateName} </span></h3>
                                                    </div>
                                                </div>
                                                <div class="clearfix margin-bottom-10"></div>
                                                <c:if test="${subjectJson != null && subjectJson.proofList != null && subjectJson.proofList.size() > 0}">
													<div class="row">
														<c:forEach items="${subjectJson.proofList}" var="proofObject" varStatus="proofStatus">
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
																                                                    <c:choose>
																													   <c:when test="${empty attributeObject.documentAttributeValue}"><span>&nbsp;</span></c:when> 
																													   <c:otherwise>
																													   		<c:choose>
																															   <c:when test="${attributeObject.documentAttributeDataType == 'Date'}">
																																    <fmt:parseDate value="${attributeObject.documentAttributeValue}" var="parsedEmpDate" pattern="MM/dd/yyyy" />
																															   		<span><fmt:formatDate pattern="dd-MMM-yyyy" value="${parsedEmpDate}" /></span>
																															   </c:when> 
																															   <c:otherwise>
																															   		<span>${attributeObject.documentAttributeValue}</span>
																															   	</c:otherwise>
																															</c:choose>
																													   	</c:otherwise>
																													</c:choose>
																                                                </p>
																                                            </div>
																										</c:forEach>
																									</c:if>
																									<label class="control-label col-md-6 bold">Document:</label>
														                                            <div class="col-md-6">
														                                                <button type="button" class="btn btn-link docName doc-name-align fa fa-paperclip" onclick="getFile( '${docObject.fileId}', '${docObject.fileName}', '${contextPath}');" >&nbsp;&nbsp;&nbsp;${docObject.fileName}</button>
														                                            </div>
														
														                                            <label class="control-label col-md-6 bold">Reference Number:</label>
														                                            <div class="col-md-6">
														                                                <p class="form-control-static doc-name-align">
														                                                    <c:choose>
																											    <c:when test="${empty docObject.referenceNumber}"><span><br /><br /></span></c:when>
																											    <c:otherwise>
																											    	<c:choose>
																										                <c:when test="${docObject.referenceNumber.length() > 15 }"><span>${docObject.referenceNumber}</span></c:when>
																										                <c:otherwise><span>${docObject.referenceNumber}<br /><br /></span></c:otherwise>
																										            </c:choose>
																											    </c:otherwise>
																											</c:choose>
														                                                </p>
														                                            </div>
														
														                                            <label class="control-label col-md-6 bold">Comment:</label>
														                                            <div class="col-md-6">
														                                                <p class="form-control-static doc-name-align">
														                                                    <c:choose>
																											    <c:when test="${empty docObject.comment}">&nbsp;</c:when>
																											    <c:otherwise>
																											        <span>${docObject.comment}</span>
																											    </c:otherwise>
																											</c:choose>
														                                                </p>
														                                            </div>
														                                        </div>    
														                                    </c:if>
														
														                                    <c:if test="${docObject.documentReceived == 0}">
														                                        <label class="control-label col-md-6 bold">Due Date:</label>
														                                        <div class="col-md-6">
														                                            <p class="form-control-static doc-name-align">
														                                                <span><fmt:formatDate pattern="dd-MMM-yyyy" value="${docObject.dueDate}" /></span>
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
												
												<c:if test="${subjectJson != null && subjectJson.additionalDocuments != null && subjectJson.additionalDocuments.size() > 0}">
													<div class="row">
														<div class="col-md-12">
															<h3 class="form-section">
																Additional Documents
															</h3>
														</div>
													</div>
													<div class="clearfix margin-bottom-10"></div>
													<div class="row">
														<c:forEach items="${subjectJson.additionalDocuments}" var="proofObject" varStatus="proofStatus">
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
														                <div class="panel-group accordion" id="accordion_1_${proofStatus.index}">
																			<c:if test="${proofObject.documentList != null && proofObject.documentList.size() > 0}">
														                    <c:forEach items="${proofObject.documentList}" var="docObject" varStatus="docStatus">
														                        <div class="panel panel-default">
														                            <div class="panel-heading">
														                                <h4 class="panel-title">
														                                  <a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion_1_${proofStatus.index}" href="#collapse_1_${proofStatus.index}_${docStatus.index}">
														                                  	<span style="float:right">[Received: YES]</span>${docObject.documentName}							
														                                  </a>
														                              </h4>
														                            </div>
														                            <div id="collapse_1_${proofStatus.index}_${docStatus.index}" class="panel-collapse collapse">
														                                <div class="panel-body">
														                                    <c:if test="${docObject.documentReceived == 1}">
														                                        <div class="form-group">
															                                        <c:if test="${docObject.documentAttributeList != null && docObject.documentAttributeList.size() > 0}">
																                                        <c:forEach items="${docObject.documentAttributeList}" var="attributeObject" varStatus="attrStatus">
																                                            <c:if test="${attributeObject.documentAttributeName == 'Receive Date' || attributeObject.documentAttributeName == 'Expiry Date'}">
																                                            	<label class="control-label col-md-6 bold">${attributeObject.documentAttributeName}:</label>
																	                                            <div class="col-md-6">
																	                                                <p class="form-control-static doc-name-align">
																	                                                	<c:choose>
																														   <c:when test="${empty attributeObject.documentAttributeValue}"><span>&nbsp;</span></c:when> 
																														   <c:otherwise>
																														   		<c:choose>
																																   <c:when test="${attributeObject.documentAttributeDataType == 'Date'}">
																																	    <fmt:parseDate value="${attributeObject.documentAttributeValue}" var="parsedEmpDate" pattern="MM/dd/yyyy" />
																																   		<span><fmt:formatDate pattern="dd-MMM-yyyy" value="${parsedEmpDate}" /></span>
																																   </c:when> 
																																   <c:otherwise>
																																   		<span>${attributeObject.documentAttributeValue}</span>
																																   	</c:otherwise>
																																</c:choose>
																														   	</c:otherwise>
																														</c:choose>
																	                                                </p>
																	                                            </div>
																                                            </c:if>
																										</c:forEach>
																									</c:if>
																									<label class="control-label col-md-6 bold">Document:</label>
														                                            <div class="col-md-6">
														                                                <button type="button" class="btn btn-link docName doc-name-align fa fa-paperclip" onclick="getFile( '${docObject.fileId}', '${docObject.fileName}', '${contextPath}');" >&nbsp;&nbsp;&nbsp;${docObject.fileName}</button>
														                                            </div>
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
                                            </div> 
                                           
                                            <div class="clearfix margin-bottom-10"></div>
                                            <c:choose>
												<c:when test="${isMitigationWorkflow == 'true'}">
													<c:if test="${(screeningData.totalRiskLevel != 'Low' || subjectJson.typeOfCounterpartyName == 'Entity') && mitigationActivityList.size() > 0}">
		                                            <h3 class="form-section">Mitigation Details</h3>
		                                            <div class="form-body">
			                                             <c:if test="${mitigationActivityList.size() > 0}">
			                                             	 <c:forEach begin="0" end="${mitigationActivityList.size() - 1 }" var="mitigationIndex">
				                                                <div class="row">
				                                                    <div class="col-md-6">
				                                                        <div class="form-group">
				                                                            <label class="control-label col-md-4 bold">Actvity Performed:</label>
				                                                            <div class="col-md-8">
				                                                                <p class="form-control-static doc-name-align">
				                                                                    ${mitigationActivityList[mitigationIndex].activityPerformed}
				                                                                </p>
				                                                            </div>
				                                                        </div>
				
				                                                        <div class="form-group">
				                                                            <label class="control-label col-md-4 bold">Activity Description:</label>
				                                                            <div class="col-md-8">
				                                                                <p class="form-control-static doc-name-align">
				                                                                    ${mitigationActivityList[mitigationIndex].activityDescription}
				                                                                </p>
				                                                            </div>
				                                                        </div>
				                                                    </div>
				
				                                                    <div class="col-md-4">
				                                                        <div class="form-group">
				                                                            <label class="control-label col-md-4 bold">Proof / Evidence:</label>
				                                                            <div class="col-md-8">
				                                                            	<c:forEach begin="0" end="${mitigationActivityList[mitigationIndex].mitigationProofList.size() - 1 }" var="mitigationProofIndex">
				                                                                	<c:choose>
										                                       			<c:when test="${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName ne ''}">
										                                       				<button type="button" class="btn btn-link doc-name-align" onclick="getFile('${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentId}', '${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}', '${contextPath}')" >
										                                       					<i class="fa fa-paperclip"></i>&nbsp;${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}
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
			                                             </c:if>
			                                             <c:if test="${isShowMitigatedRisk == 'true'}">
			                                        	 <div class="row">
															<div class="col-md-1"></div>
															<label class="col-md-2 control-label bold">Mitigation Risk Level</label>
															<div class="col-md-2">
																<div class="bt-form__wrapper">
																	<div class="form-group">
																		<div class="bt-flabels__wrapper">
																			<label class="parsley_hide">Mitigation Risk Level</label>
																			<div class="field-background">
																				<select name="mitigation.mitigationRiskLevel" id="mitigationRiskLevel"
																					placeholder="Mitigation Risk Level" class="form-control select2me"
																					data-parsley-required="false" disabled>
																					<option value=""></option>
																					<c:if
																						test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																						<c:forEach begin="0"
																							end="${riskCategoryData.length() - 1 }" var="index">
																							<option
																								value="${riskCategoryData.get(index).get('RiskCategory_shortcode')}"
																								${riskCategoryData.get(index).get('RiskCategory_shortcode') == mitigationObject.mitigationRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																						</c:forEach>
																					</c:if>
																				</select>
																			</div>
																			<span class="bt-flabels__error-desc_select">Required</span>
																		</div>
																	</div>
																</div>
														    </div>
														    <div class="col-md-1"></div>
															<label class="col-md-2 control-label bold">Mitigation Comment :</label>
															<c:if test="${mitigationObject != null}">
																<div class="col-md-2 control-label">
																	<c:choose>
													                    <c:when test="${mitigationObject.mitigationComment != null && mitigationObject.mitigationComment.length() > 0}">
													                    	${mitigationObject.mitigationComment}
													                    </c:when>
													                    <c:otherwise>
													                    	-
												                    	</c:otherwise>
												                    </c:choose>
																</div>
															</c:if>
														 </div>
			                                        	 </c:if>
			                                        </div>
			                                        <div class="clearfix margin-bottom-10"></div>
				                                    <h3 class="form-section">Result</h3>
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
		                                    		</c:if>
												</c:when>
												<c:otherwise>
		                                        	<h3 class="form-section">Mitigation Details</h3>
		                                            <div class="form-body">
			                                             <c:if test="${mitigationActivityList.size() > 0}">
			                                             	 <c:forEach begin="0" end="${mitigationActivityList.size() - 1 }" var="mitigationIndex">
				                                                <div class="row">
				                                                    <div class="col-md-6">
				                                                        <div class="form-group">
				                                                            <label class="control-label col-md-4 bold">Actvity Performed:</label>
				                                                            <div class="col-md-8">
				                                                                <p class="form-control-static doc-name-align">
				                                                                    ${mitigationActivityList[mitigationIndex].activityPerformed}
				                                                                </p>
				                                                            </div>
				                                                        </div>
				
				                                                        <div class="form-group">
				                                                            <label class="control-label col-md-4 bold">Activity Description:</label>
				                                                            <div class="col-md-8">
				                                                                <p class="form-control-static doc-name-align">
				                                                                    ${mitigationActivityList[mitigationIndex].activityDescription}
				                                                                </p>
				                                                            </div>
				                                                        </div>
				                                                    </div>
				
				                                                    <div class="col-md-4">
				                                                        <div class="form-group">
				                                                            <label class="control-label col-md-4 bold">Proof / Evidence:</label>
				                                                            <div class="col-md-8">
				                                                            	<c:forEach begin="0" end="${mitigationActivityList[mitigationIndex].mitigationProofList.size() - 1 }" var="mitigationProofIndex">
				                                                                	<c:choose>
										                                       			<c:when test="${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName ne ''}">
										                                       				<button type="button" class="btn btn-link doc-name-align" onclick="getFile('${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentId}', '${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}', '${contextPath}')" >
										                                       					<i class="fa fa-paperclip"></i>&nbsp;${mitigationActivityList[mitigationIndex].mitigationProofList[mitigationProofIndex].documentName}
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
			                                             </c:if>
			                                             <c:if test="${isShowMitigatedRisk == 'true'}">
			                                        	 <div class="row">
															<div class="col-md-1"></div>
															<label class="col-md-2 control-label bold">Mitigation Risk Level</label>
															<div class="col-md-2">
																<div class="bt-form__wrapper">
																	<div class="form-group">
																		<div class="bt-flabels__wrapper">
																			<label class="parsley_hide">Mitigation Risk Level</label>
																			<div class="field-background">
																				<select name="mitigation.mitigationRiskLevel" id="mitigationRiskLevel"
																					placeholder="Mitigation Risk Level" class="form-control select2me"
																					data-parsley-required="false" disabled>
																					<option value=""></option>
																					<c:if
																						test="${riskCategoryData != null && riskCategoryData.length() > 0}">
																						<c:forEach begin="0"
																							end="${riskCategoryData.length() - 1 }" var="index">
																							<option
																								value="${riskCategoryData.get(index).get('RiskCategory_shortcode')}"
																								${riskCategoryData.get(index).get('RiskCategory_shortcode') == mitigationObject.mitigationRiskLevel ? 'selected="selected"' : '' }>${riskCategoryData.get(index).get(riskCategoryName)}</option>
																						</c:forEach>
																					</c:if>
																				</select>
																			</div>
																			<span class="bt-flabels__error-desc_select">Required</span>
																		</div>
																	</div>
																</div>
														    </div>
														    <div class="col-md-1"></div>
															<label class="col-md-2 control-label bold">Mitigation Comment :</label>
															<c:if test="${mitigationObject != null}">
																<div class="col-md-2 control-label">
																	<c:choose>
													                    <c:when test="${mitigationObject.mitigationComment != null && mitigationObject.mitigationComment.length() > 0}">
													                    	${mitigationObject.mitigationComment}
													                    </c:when>
													                    <c:otherwise>
													                    	-
												                    	</c:otherwise>
												                    </c:choose>
																</div>
															</c:if>
														 </div>
			                                        	 </c:if>
			                                        </div>
			                                        <div class="clearfix margin-bottom-10"></div>
				                                    <h3 class="form-section">Result</h3>
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
												</c:otherwise>
											</c:choose>
                                      		
                                    	
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
									                <h4 class="modal-title">Remark</h4>
									            </div>
									            <div class="modal-body">
									                <div class="row">
									                    <div class="col-md-12">
								                            <div class="bt-flabels__wrapper">
								                            	<div class="uk-width-1-1">
																	<div class="bt-flabels__wrapper">
										                                <label class="parsley_hide">Remark</label>
										                                <form:textarea id="remarkContent" path="complianceRemark" rows="15" style="height: 140px;width: 567px;" data-parsley-required="true" placeholder="Remark"></form:textarea>
								                                		<span class="bt-flabels__error-desc">Required</span>
								                                	</div>
								                                </div>
								                            </div>
									                    </div>
									                </div>
									           	</div>
									            <div class="modal-footer">
									                <button type="button" class="btn-modal-cls btn btn-sm grey-gallery" onclick="submitData('${contextPath}');">
									                    <img src="/digiKYC/assets/global/img/submit.png" /> Submit
									                </button>
									                <button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal">
									                    <img src="/digiKYC/assets/global/img/clear.png" /> Close
									                </button>
									            </div>
									        </div>
									    </div>
									</div>
                            		</div>
                            		</div>
                            	</div>
                            </form:form>
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
							                  <c:if test="${otherDetails.has('emailId') && not empty otherDetails.get('emailId')}">
							                     <c:set var="clubContactEmailId" value="${otherDetails.get('emailId')}" />
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
    <div class="clearfix margin-bottom-20"></div>
    <div class="clearfix margin-bottom-10"></div>
</div>

<script>
    jQuery(document).ready(function() {
    	jQuery("#subject").remove("active");
		jQuery("#master").remove("active");
		jQuery("#dashboard").addClass("active");
		
		try{
			var relationList = JSON.parse($("#relationList").val());
			showAddRelation(relationList);
		}catch(err){
			console.log(err.message);
		}
    });

    /* ------------------ Functions Starts ------------------- */
	$('#cancelButton').click(function() {
		_paq.push(['trackEvent', 'KYCSubject', 'ComplianceCancel','Cancel from compliance approval']);
		location.href = "${contextPath}/dashboard";
		buffer();
	});
    
	function submitData(contextPath) {
		$('#frmMain').parsley().validate();
		var response = $('#frmMain').parsley().isValid();
		if (!response)
			return false;
		else {
			$('#remarkModalId').modal('toggle');
			buffer();
			$('#frmMain').submit();
		}
	}
	
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
			theme: 'ITGtheme',
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
			  { text: 'Kyc Subject Id', 	datafield: 'KycSubjectId',		filtertype: 'input', hidden: true},
			  { text: 'Screening Solution', datafield: 'ScreeningSolution',	filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Comments', 			datafield: 'Comments', 			filtertype: 'input', width: '10%', align: 'left'},
			  { text: 'Entity Type', 		datafield: 'EntityType', 		filtertype: 'input', width: '10%', align: 'left'},
			  { text: 'Name',	 			datafield: 'FullName', 			filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Match Score', 		datafield: 'MatchScore', 		filtertype: 'input', width: '10%', align: 'left'},
			  { text: 'Reason Listed',		datafield: 'ReasonListed',		filtertype: 'input', width: '15%', align: 'left'},
			  { text: 'Reference ID', 		datafield: 'ResultId',			filtertype: 'input', width: '15%',key: true},
			  { text: 'Action', 			datafield: 'Action', 			filtertype: 'input', align: 'left', enabletooltips:false}
			],
			pageSize:screeningResult.length,
			pageSizeOptions:["5","10","20",screeningResult.length]				
		});
		
		$('#screeningResultJqxgrid').show();
		$('#screeningResultModalId').modal('toggle');
	});


	var showScreeningData = function(manualScreenShowURL, referenceId, counterPartyType) {
		
		var screenShowURL;
		if(referenceId != undefined)
			screenShowURL = manualScreenShowURL+referenceId+","+counterPartyType+",World-Check,false,kyc";
		else {
			var manualScreenShowURL = $("#manualScreenShowURL").val();
			var screeningResult = JSON.parse($("#riskDataJson").val());
			if(screeningResult[0].EntityType == "INDIVIDUAL")
				counterPartyType = "Individual";
			else
				counterPartyType = "Organization";
			referenceId = screeningResult[0].ResultId;
			screenShowURL = manualScreenShowURL+referenceId+","+counterPartyType+",World-Check,false,kyc";	
		}
		
		window.open(screenShowURL, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=50, left=100, width=1000, height=500");
	};
	
	var showAddRelation = function(relationList){
		var relationDataSource =
		{
			datatype: "json",
			localdata: relationList,
			datafields: [{name:'legalEntityName',type: 'string'},{name:'jurisdictionName',type: 'string'},{ name: 'roleName',type: 'string'},{ name: 'appointmentDate',type: 'date'},{ name: 'resignationDate',type: 'date'}]
		};
		
		var relationDataAdapter = new $.jqx.dataAdapter(relationDataSource);
		$("#addRelationGrid").jqxGrid({
			width: '100%',
			source: relationDataAdapter,
			autoloadstate: false,
			autosavestate: false,
			sortable: true,
			theme: 'ITGtheme',
			//pageable: true,
			autoheight: true,
			enabletooltips: true,
	        columnsresize: true,
	        columnsreorder: true,
	        rowsheight: 50,
	        columns: [
			  { text: 'Legal Entity', datafield: 'legalEntityName',	filtertype: 'input', width: '25%', align: 'left'},
			  { text: 'Jurisdiction Name', datafield: 'jurisdictionName', filtertype: 'input', width: '20%', align: 'left'},
			  { text: 'Relation', datafield: 'roleName', filtertype: 'input', width: '25%', align: 'left'},
			  { text: 'Appointment Date',	datafield: 'appointmentDate', filtertype: 'input', width: '15%', align: 'left', cellsformat: 'dd-MMM-yyyy'},
			  { text: 'Date of Resignation',	datafield: 'resignationDate', filtertype: 'input', width: '15%', align: 'left', cellsformat: 'dd-MMM-yyyy'}
			],
			pageSize:relationList.length,
			pageSizeOptions:["5","10","20",relationList.length]				
		});
	};
</script>