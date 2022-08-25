<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="save.label" var="saveLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />
<spring:message code="kycSubject.firstName.label" var="firstNameLabel" />
<spring:message code="kycSubject.middleName.label" var="middleNameLabel" />
<spring:message code="kycSubject.lastName.label" var="lastNameLabel" />
<spring:message code="kycSubject.dateOfBirth.label" var="dateOfBirthLabel" />
<spring:message code="kycSubject.occupation.label" var="occupationLabel" />
<spring:message code="kycSubject.residentialAddress.label" var="residentialAddressLabel" />
<spring:message code="kycSubject.stateCity.label" var="stateCityLabel" />
<spring:message code="kycSubject.zipCode.label" var="zipCodeLabel" />
<spring:message code="kycSubject.countryOfResidency.label" var="countryOfResidencyLabel" />
<spring:message code="kycSubject.countryOfBirth.label" var="countryOfBirthLabel" />
<spring:message code="kycSubject.countryOfNationality.label" var="countryOfNationalityLabel" />
<spring:message code="kycSubject.anyOtherFormerFirstName.label" var="anyOtherFormerFirstNameLabel" />
<spring:message code="kycSubject.anyOtherFormerMiddleName.label" var="anyOtherFormerMiddleNameLabel" />
<spring:message code="kycSubject.anyOtherFormerLastName.label" var="anyOtherFormerLastNameLabel" />
<spring:message code="kycSubject.otherNationality.label" var="otherNationalityLabel" />
<spring:message code="kycSubject.userConsent.label" var="userConsentLabel" />
<spring:message code="kycSubject.jurisdiction.label" var="jurisdictionLabel" />
<spring:message code="kycSubject.itgJurisdiction.label" var="itgJurisdictionLabel" />
<spring:message code="kycSubject.emailAddress.label" var="emailAddressLabel" />
<spring:message code="kycSubject.telephoneNumber.label" var="telephoneNumberLabel" />

<spring:message code="kycSubject.fullNameOfTargetedContact.label" var="fullNameOfTargetedContactLabel" />
<spring:message code="kycSubject.addressOfTargetedContact.label" var="addressOfTargetedContactLabel" />
<spring:message code="kycSubject.nationalityOfTargetedContact.label" var="nationalityOfTargetedContactLabel" />
<spring:message code="kycSubject.emailAddressOfTargetedContact.label" var="emailAddressOfTargetedContactLabel" />
<spring:message code="kycSubject.phoneNoOfTargetedContact.label" var="phoneNoOfTargetedContactLabel" />
<spring:message code="kycSubject.proofDocument.file.extensions" var="proofDocumentFileExtensions" />
<input type="hidden" value="${proofDocumentFileExtensions}" id="proofDocumentFileExtensionsId" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="jurisdictionName" value="<%= ITGConstant.JURISDICTION_NAME%>" />
<c:set var="countryName" value="<%= ITGConstant.COUNTRY_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="jurisdictionShortCode" value="<%= ITGConstant.JURISDICTION_SHORT_CODE%>" />
<c:set var="countryShortCode" value="<%= ITGConstant.COUNTRY_SHORT_CODE%>" />

<c:set var="nationalityShortCode" value="<%= ITGConstant.NATIONALITY_SHORT_CODE%>" />
<c:set var="nationalityName" value="<%= ITGConstant.NATIONALITY_NAME%>" />
<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />
<c:set var="maxLength15" value="<%= ITGConstant.MAX_LENGTH_15%>" />
<c:set var="maxLength500" value="<%= ITGConstant.MAX_LENGTH_500%>" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i
					class="fa fa-angle-right"></i></li>
				<li>KYC Subject<i class="fa fa-angle-right"></i></li>
				<li>Add</li>
			</ul>
			<h4>&nbsp;KYC Subject</h4>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">

						<button type="button" id="saveButton"
							class="btn btn-sm grey-gallery">
							<em class="fa fa-check-circle"></em> ${saveLabel}
						</button>

						<button type="button" id="cancelButton"
							class="btn btn-sm grey-gallery">
							<em class="fa fa-times-circle"></em> ${cancelLabel}
						</button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/subject/add" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" modelAttribute="kycSubjectBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="false" enctype="multipart/form-data">
			<form:hidden path="kycSubjectRequestNo" value="${kycSubjectBO.kycSubjectRequestNo}"></form:hidden>
			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${counterPartyTypeLabel}</label>
								<div class="field-background">
									<form:select path="typeOfCounterpartyCode" class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectGroup" placeholder="${counterPartyTypeLabel}">
										<option value=""></option>
										<c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
											<c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
												<form:option  value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
							</div>
							<form:errors path="typeOfCounterpartyCode" cssClass="help-block error" />
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${firstNameLabel}</label>
								<form:input type="text" path="firstName" class="form-control field-background" placeholder="${firstNameLabel}" data-parsley-required="true" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="firstName" cssClass="help-block error" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${middleNameLabel}</label>
								<form:input type="text" path="middleName" class="form-control" placeholder="${middleNameLabel}" data-parsley-required="false" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${lastNameLabel}</label>
								<form:input type="text" path="lastName" class="form-control field-background" placeholder="${lastNameLabel}" data-parsley-required="true" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="lastName" cssClass="help-block error" />
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${dateOfBirthLabel}</label>
								<div class="input-group date date-picker" data-date-end-date="+0d">
									<form:input type="text" path="dateOfBirth" placeholder="${dateOfBirthLabel}" data-parsley-required="true" class="datePicker form-control form-control-inline field-background" data-parsley-group="kycSubjectGroup" />
									<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
								</div>
								<span class="bt-flabels__error-desc_date">Required</span>
							</div>
							<form:errors path="dateOfBirth" cssClass="help-block error" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${occupationLabel}</label>
								<form:input type="text" path="occupation" class="form-control field-background" placeholder="${occupationLabel}" maxlength="${maxLength255}" data-parsley-required="true" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="occupation" cssClass="help-block error" />
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${kycSubjectBO.itgJurisdictionCode != null && kycSubjectBO.itgJurisdictionCode != ''}">
						<div class="col-md-3 hidden">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">ITG Jurisdiction
											</label>
										<div class="field-background">
											<form:select path="itgJurisdictionCode" class="form-control select2me" data-parsley-required="false" data-parsley-group="kycSubjectGroup" placeholder="${itgJurisdictionLabel}">
											<option value=""></option>
												<c:if test="${jurisdictionData != null && jurisdictionData.length() > 0}">
													<c:forEach begin="0" end="${jurisdictionData.length() -1}" var="index">
														<form:option value="${jurisdictionData.get(index).get(jurisdictionShortCode)}">${jurisdictionData.get(index).get(jurisdictionName)}</form:option>
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
						<div class="col-md-3">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">ITG Jurisdiction
											</label>
										<div class="field-background">
											<form:select path="itgJurisdictionCode" class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectGroup" placeholder="${itgJurisdictionLabel}">
											<option value=""></option>
												<c:if test="${jurisdictionData != null && jurisdictionData.length() > 0}">
													<c:forEach begin="0" end="${jurisdictionData.length() -1}" var="index">
														<form:option value="${jurisdictionData.get(index).get(jurisdictionShortCode)}">${jurisdictionData.get(index).get(jurisdictionName)}</form:option>
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
				<%-- <div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${jurisdictionLabel}
									</label>
								<div class="field-background">
									<form:select path="jurisdictionCode" class="form-control select2me" data-parsley-required="false" data-parsley-group="kycSubjectGroup" placeholder="${jurisdictionLabel}">
									<option value=""></option>
										<c:if test="${jurisdictionData != null && jurisdictionData.length() > 0}">
											<c:forEach begin="0" end="${jurisdictionData.length() -1}" var="index">
												<form:option value="${jurisdictionData.get(index).get(jurisdictionShortCode)}">${jurisdictionData.get(index).get(jurisdictionName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>								
							</div>
						</div>
					</div>
				</div> --%>
				
				<div class="col-md-6">
					<div class="">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${residentialAddressLabel}</label>
								<form:input type="text" maxlength="${maxLength255}" path="residentialAddress"
									class="form-control field-background"
									placeholder="${residentialAddressLabel}" data-parsley-required="true" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="residentialAddress" cssClass="help-block error" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${stateCityLabel}</label>
								<form:input type="text" path="stateCity"
									class="form-control field-background" placeholder="${stateCityLabel}"
									data-parsley-required="true" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="stateCity" cssClass="help-block error" />
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${zipCodeLabel}</label>
								<form:input type="text" path="zipCode"
									class="form-control field-background" placeholder="${zipCodeLabel}"
									data-parsley-required="true" maxlength="${maxLength15}" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="zipCode" cssClass="help-block error" />
						</div>
					</div>
				</div>
				
			</div>

			<div class="row">
				
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${countryOfResidencyLabel}</label>
								<div class="field-background">
									<form:select path="countryOfResidencyCode"
										placeholder="${countryOfResidencyLabel}"
										class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectGroup">
										<form:option value=""></form:option>
										<c:if test="${countryData != null && countryData.length() > 0}">
											<c:forEach begin="0" end="${countryData.length() -1}" var="index">
												<form:option value="${countryData.get(index).get(countryShortCode)}">${countryData.get(index).get(countryName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
							</div>
							<form:errors path="countryOfResidencyCode" cssClass="help-block error" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${countryOfBirthLabel}</label>
								<div class="field-background">
									<form:select path="countryOfBirthCode"
										placeholder="${countryOfBirthLabel}" class="form-control select2me"
										data-parsley-required="true" data-parsley-group="kycSubjectGroup">
										<form:option value=""></form:option>
										<c:if test="${countryData != null && countryData.length() > 0}">
											<c:forEach begin="0" end="${countryData.length() -1}" var="index">
												<form:option value="${countryData.get(index).get(countryShortCode)}">${countryData.get(index).get(countryName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
							</div>
							<form:errors path="countryOfBirthCode" cssClass="help-block error" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${countryOfNationalityLabel}</label>
								<div class="field-background">
									<form:select path="countryOfNationalityCode"
										placeholder="${countryOfNationalityLabel}"
										class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectGroup">
										<form:option value=""></form:option>
										<c:if test="${nationalityData != null && nationalityData.length() > 0}">
											<c:forEach begin="0" end="${nationalityData.length() -1}" var="index">
												<form:option value="${nationalityData.get(index).get(nationalityShortCode)}">${nationalityData.get(index).get(nationalityName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
							</div>
							<form:errors path="countryOfNationalityCode" cssClass="help-block error" />
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${emailAddressLabel}</label>
								<form:input type="email" path="emailAddress"
									class="form-control field-background" placeholder="${emailAddressLabel}"
									data-parsley-required="true" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="emailAddress" cssClass="help-block error" />
						</div>
					</div>
				</div>
				
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${telephoneNumberLabel}</label>
								<form:input type="text" path="telephoneNumber" maxlength="${maxLength15}"
									class="form-control field-background" placeholder="${telephoneNumberLabel}"
									data-parsley-required="true" data-parsley-group="kycSubjectGroup" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="telephoneNumber" cssClass="help-block error" />
						</div>
					</div>
				</div>
			</div>
			
			<hr />

			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${anyOtherFormerFirstNameLabel}</label>
								<form:input type="text" path="anyOtherFirstName"
									class="form-control" placeholder="${anyOtherFormerFirstNameLabel}"
									maxlength="${maxLength255}" />
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${anyOtherFormerMiddleNameLabel}</label>
								<form:input path="anyOtherMiddleName" class="form-control"
									placeholder="${anyOtherFormerMiddleNameLabel}" maxlength="${maxLength255}" />
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${anyOtherFormerLastNameLabel}</label>
								<form:input path="anyOtherLastName" class="form-control"
									placeholder="${anyOtherFormerLastNameLabel}" maxlength="${maxLength255}" />
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${otherNationalityLabel}</label>
								<div class="">
									<form:select path="otherNationality" placeholder="${otherNationalityLabel}" class="form-control select2me">
										<form:option value=""></form:option>
										<c:if test="${nationalityData != null && nationalityData.length() > 0}">
											<c:forEach begin="0" end="${nationalityData.length() -1}" var="index">
												<form:option value="${nationalityData.get(index).get(nationalityShortCode)}">${nationalityData.get(index).get(nationalityName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <hr/> -->
			<div class="row" style="display:none">
			   <div class="col-md-3">
			      <div class="bt-form__wrapper">
			         <div class="form-group uk-width-1-1">
			            <div class="bt-flabels__wrapper">
							<label class="parsley_hide">${fullNameOfTargetedContactLabel}</label>
							<form:input path="fullNameOfTargetedContact" placeholder="${fullNameOfTargetedContactLabel}" class="form-control contactDetails" value="" maxlength="${maxLength255}" data-parsley-required="false" data-parsley-group="kycSubjectGroup" disabled="true" />
						</div>
			         </div>
			      </div>
			   </div>
			   <div class="col-md-6">
			      <div class="">
			         <div class="form-group uk-width-1-1">
			            <div class="bt-flabels__wrapper">
			               <label class="parsley_hide">${addressOfTargetedContactLabel}</label>
			               <form:input path="addressOfTargetedContact" placeholder="${addressOfTargetedContactLabel}" class="form-control contactDetails" value="" data-parsley-required="false" data-parsley-group="kycSubjectGroup" disabled="true" />
			               <span class="bt-flabels__error-desc">Required</span>
			            </div>
			         </div>
			      </div>
			   </div>
			   <%-- <div class="col-md-3">
			      <div class="bt-form__wrapper">
			         <div class="form-group uk-width-1-1">
			            <div class="bt-flabels__wrapper">
			               	<label class="parsley_hide">Nationality</label>
			               	<form:input path="nationalityOfTargetedContact" class="form-control contactDetails" placeholder="Nationality" maxlength="${maxLength255}" data-parsley-required="false" data-parsley-group="kycSubjectGroup" disabled="true" />
							<span class="bt-flabels__error-desc">Required</span>
			            </div>
			         </div>
			      </div>
			   </div> --%>
			   <div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${nationalityOfTargetedContactLabel}</label>
								<div class="">
									<form:select path="nationalityOfTargetedContact" placeholder="${nationalityOfTargetedContactLabel}" class="form-control select2me contactDetails"  data-parsley-group="kycSubjectGroup" disabled="true">
										<form:option value=""></form:option>
										<c:if test="${nationalityData != null && nationalityData.length() > 0}">
											<c:forEach begin="0" end="${nationalityData.length() -1}" var="index">
												<form:option value="${nationalityData.get(index).get(nationalityShortCode)}">${nationalityData.get(index).get(nationalityName)}</form:option>
											</c:forEach>
										</c:if>
									</form:select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="display:none">
			   <div class="col-md-3">
			      <div class="bt-form__wrapper">
			         <div class="form-group uk-width-1-1">
			            <div class="bt-flabels__wrapper">
			               <label class="parsley_hide">${emailAddressOfTargetedContactLabel}</label>
			               <form:input path="emailAddressOfTargetedContact" class="form-control contactDetails" placeholder="${emailAddressOfTargetedContactLabel}" maxlength="${maxLength255}" data-parsley-required="false" data-parsley-group="kycSubjectGroup" disabled="true" />
			               <span class="bt-flabels__error-desc">Required</span>
			            </div>
			         </div>
			      </div>
			   </div>
			   <div class="col-md-3">
			      <div class="bt-form__wrapper">
			         <div class="form-group uk-width-1-1">
			            <div class="bt-flabels__wrapper">
			               	<label class="parsley_hide">${phoneNoOfTargetedContactLabel}</label>
			               	<form:input path="phoneNumberOfTargetedContact" class="form-control contactDetails" placeholder="${phoneNoOfTargetedContactLabel}" maxlength="${maxLength255}" data-parsley-required="false" data-parsley-group="kycSubjectGroup" disabled="true" />
							<span class="bt-flabels__error-desc">Required</span>
			            </div>
			         </div>
			      </div>
			   </div>
			</div>
			<div class="clearfix margin-bottom-10"></div>
			<hr />
			
			<div id="userProofAndConsent">
			
			<div id="userProof">
			<c:choose>
            <c:when test="${not empty(kycSubjectBO.proofList)}"> 
				<c:if test="${kycSubjectBO.proofList != null && kycSubjectBO.proofList.size() > 0}">
					<div class="row">
						<div class="col-md-3 col-sm-3 col-xs-3">
							<ul class="nav nav-tabs" style="border-right: 1px solid #ddd; border-bottom: 0;"> 
								<c:forEach items="${kycSubjectBO.proofList}" var="proofObject" varStatus="proofStatus">
									<li class="inv-tabs" style="width: 100%;"> 
										<a href="#tab_${proofStatus.index}" data-toggle="tab"> ${proofObject.proofName} </a>
									</li>
								</c:forEach>
							</ul>
						</div>
	
						<div class="col-md-9 col-sm-9 col-xs-9">
							<div class="tab-content">
								<c:forEach items="${kycSubjectBO.proofList}" var="proofObject" varStatus="proofStatus">
							
									<div class="tab-pane fade in" id="tab_${proofStatus.index}"> 
										<form:hidden path="proofList[${proofStatus.index}].proofId" value="${proofObject.proofId}"/>
									
									<c:if test="${proofObject.documentList != null && proofObject.documentList.size() > 0}">
										<c:forEach items="${proofObject.documentList}" var="documentObject" varStatus="docStatus">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group">
														<input type="hidden" id="isDocSelected${proofStatus.index}_${docStatus.index}_hidden" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].isDocumentSelected" />
														<input type="checkbox" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentId" id="isDocSelected${proofStatus.index}_${docStatus.index}" onclick="javascript:displaydocs(this,'${proofStatus.index}','${docStatus.index}','${documentObject.documentId}','${documentObject.documentAttributeList.size()}');">
														<label class="control-label">${documentObject.documentName}</label>
													</div>
												</div>
		
												<div class="col-md-8 document${proofStatus.index}_${docStatus.index}" style="display: none">
													<div class="radio-list">
														<label class="radio-inline"><b>Document Received&nbsp;:&nbsp;</b></label> 
														<label class="radio-inline">
															<c:choose>
																<c:when test="${documentObject.documentAttributeList !=null && documentObject.documentAttributeList.size() > 0}">
																	<input type="radio" checked="checked" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentReceived" id="isDocumentReceivedYes${proofStatus.index}_${docStatus.index}" value="1" onclick="showdocFields(this.value,'${proofStatus.index}','${docStatus.index}','${documentObject.documentAttributeList.size()}')"><span>&nbsp;Yes&nbsp;&nbsp;</span>
																</c:when>
																<c:otherwise>
																	<input type="radio" checked="checked" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentReceived" id="isDocumentReceivedYes${proofStatus.index}_${docStatus.index}" value="1" onclick="showdocFields(this.value,'${proofStatus.index}','${docStatus.index}')"><span>&nbsp;Yes&nbsp;&nbsp;</span>
																</c:otherwise>
															</c:choose>
														</label>&nbsp; 
														<label class="radio-inline">
															<c:choose>
																<c:when test="${documentObject.documentAttributeList !=null && documentObject.documentAttributeList.size() > 0}">
																	<input type="radio" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentReceived" id="isDocumentReceivedNo${proofStatus.index}_${docStatus.index}" value="0" onclick="showdocFields(this.value,'${proofStatus.index}','${docStatus.index}','${documentObject.documentAttributeList.size()}')"><span>&nbsp;No&nbsp;&nbsp;</span>
																</c:when>
																<c:otherwise>
																	<input type="radio" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentReceived" id="isDocumentReceivedNo${proofStatus.index}_${docStatus.index}" value="0" onclick="showdocFields(this.value,'${proofStatus.index}','${docStatus.index}')"><span>&nbsp;No&nbsp;&nbsp;</span>
																</c:otherwise>
															</c:choose>
														</label>&nbsp;
														<label class="radio-inline">
															<c:choose>
																<c:when test="${documentObject.documentAttributeList !=null && documentObject.documentAttributeList.size() > 0}">
																	<input type="radio" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentReceived" id="isDocumentReceivedWaiver${proofStatus.index}_${docStatus.index}" value="2" onclick="showdocFields(this.value,'${proofStatus.index}','${docStatus.index}','${documentObject.documentAttributeList.size()}')"><span>&nbsp;Waiver&nbsp;&nbsp;</span>
																</c:when>
																<c:otherwise>
																	<input type="radio" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentReceived" id="isDocumentReceivedWaiver${proofStatus.index}_${docStatus.index}" value="2" onclick="showdocFields(this.value,'${proofStatus.index}','${docStatus.index}')"><span>&nbsp;Waiver&nbsp;&nbsp;</span>
																</c:otherwise>
															</c:choose>
														</label>&nbsp;
													</div>
												</div>
											</div>
	
											<div class="row docFieldDetailsNo${proofStatus.index}_${docStatus.index}" style="display: none">
												<div class="col-md-4">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">Due Date</label>
															<div class="input-group date date-picker" data-date-format="mm/dd/yyyy">
																<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].dueDate" data-parsley-required="false" placeholder="Due Date" class="datePicker form-control field-background form-control-inline" />
																<span class="input-group-btn btn default"><i class="fa fa-calendar"></i></span>
																<span class="bt-flabels__error-desc_date">Required</span>
															</div>
														</div>
													</div>
												</div>
											</div>
		
											<div class="row docFieldDetailsWaiver${proofStatus.index}_${docStatus.index}" style="display: none">
												<div class="col-md-6">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">Waiver Reason</label>
															<form:textarea path="proofList[${proofStatus.index}].documentList[${docStatus.index}].waiverReason" class="field-background" data-parsley-required="false" placeholder="Waiver Reason" rows="5" style="min-width: 100%" maxlength="${maxLength500}"></form:textarea>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
													</div>
												</div>
											</div>
		
											<div class="row docFieldDetailsYes${proofStatus.index}_${docStatus.index}" style="display: none">
												<c:if test="${documentObject.documentAttributeList != null && documentObject.documentAttributeList.size() > 0}">
													<c:forEach items="${documentObject.documentAttributeList}" var="attributeObject" varStatus="attrStatus">
														<div class="col-md-4">
															<div class="form-group uk-width-1-1">
																<div class="bt-flabels__wrapper">
																	<label class="parsley_hide">${attributeObject.documentAttributeName}</label>
																	<form:hidden path="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentAttributeList[${attrStatus.index}].documentAttributeName" value="${attributeObject.documentAttributeName}" />
																	<c:choose>
																		<c:when test="${attributeObject.documentAttributeDataType eq 'Date'}">
																			<c:choose>
																				<c:when test="${attributeObject.documentAttributeName eq 'Receive Date'}">
																					<div class="input-group date date-picker" data-date-format="mm/dd/yyyy" data-date-end-date="+0d">
																						<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentAttributeList[${attrStatus.index}].documentAttributeValue" placeholder="${attributeObject.documentAttributeName}" data-parsley-required="false" class="datePicker form-control field-background form-control-inline" />
																						<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
																						<span class="bt-flabels__error-desc_date">Required</span>
																					</div>
																				</c:when>
																				<c:when test="${attributeObject.documentAttributeName eq 'Document Date'}">
																					<div class="input-group date date-picker" data-date-format="mm/dd/yyyy" data-date-end-date="+0d">
																						<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentAttributeList[${attrStatus.index}].documentAttributeValue" placeholder="${attributeObject.documentAttributeName}" data-parsley-required="false" class="datePicker form-control field-background form-control-inline" />
																						<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
																						<span class="bt-flabels__error-desc_date">Required</span>
																					</div>
																				</c:when>
																				<c:when test="${attributeObject.documentAttributeName eq 'Expiry Date'}">
																					<div class="input-group date date-picker" data-date-format="mm/dd/yyyy" data-date-start-date="+0d">
																						<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentAttributeList[${attrStatus.index}].documentAttributeValue" placeholder="${attributeObject.documentAttributeName}" data-parsley-required="false" class="datePicker form-control field-background form-control-inline" />
																						<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
																						<span class="bt-flabels__error-desc_date">Required</span>
																					</div>
																				</c:when>
																				<c:otherwise>
																					<div class="input-group date date-picker" data-date-format="mm/dd/yyyy">
																						<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentAttributeList[${attrStatus.index}].documentAttributeValue" placeholder="${attributeObject.documentAttributeName}" data-parsley-required="false" class="datePicker form-control field-background form-control-inline" />
																						<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
																						<span class="bt-flabels__error-desc_date">Required</span>
																					</div>
																				</c:otherwise>
																			</c:choose>	
																		</c:when>
																		<c:otherwise>
																			<c:choose>
																				<c:when test="${attributeObject.documentAttributeDataLength != null}">
																					<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentAttributeList[${attrStatus.index}].documentAttributeValue" placeholder="${attributeObject.documentAttributeName}" maxlength="${attributeObject.documentAttributeDataLength}" data-parsley-required="false" class="form-control field-background" />
																					<span class="bt-flabels__error-desc">Required</span>
																				</c:when>
																				<c:otherwise>
																					<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentAttributeList[${attrStatus.index}].documentAttributeValue" placeholder="${attributeObject.documentAttributeName}" maxlength="${maxLength255}" data-parsley-required="false" class="form-control field-background" />
																					<span class="bt-flabels__error-desc">Required</span>
																				</c:otherwise>
																			</c:choose>
																		</c:otherwise>
																	</c:choose>
																	
																</div>
																<%-- <form:errors path="effectiveDate" cssClass="help-block error" /> --%>
															</div>
														</div>
													</c:forEach>
												</c:if>
											</div>
		
											<div class="row docFieldDetailsYes${proofStatus.index}_${docStatus.index}" style="display: none">
												<div class="col-md-4">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">${documentObject.documentName}</label>
															<%-- <input type="file" class="hidden" name="proofList[${proofStatus.index}].fileDetailsList[${docStatus.index}].fileDetails" id="file_${proofStatus.index}_${docStatus.index}" onchange="javascript:onChangeFile('${proofStatus.index}','${docStatus.index}');"> --%>
															<input type="file" class="hidden" name="proofList[${proofStatus.index}].documentList[${docStatus.index}].documentFile" id="file_${proofStatus.index}_${docStatus.index}" onchange="javascript:onChangeFile('${proofStatus.index}','${docStatus.index}');" accept="${proofDocumentFileExtensions}">
															<form:input type="text" readonly="true" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].fileName" class="form-control field-background" placeholder="${documentObject.documentName}" data-parsley-required="false" data-parsley-group="docAvailable" />
															<span class="bt-flabels__error-desc_date" style="right: 10px;">Required</span>
														</div>
													</div>
												</div>
												<div class="col-md-2">
													<button type="button" class="btn btn-sm grey-gallery" id="uploadFile_${proofStatus.index}_${docStatus.index}" value="Change" onclick="$('#file_${proofStatus.index}_${docStatus.index}').click()">
														<i class="fa fa-folder-open-o"></i>&nbsp;Browse
													</button>&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-sm grey-gallery hidden" id="removeFile_${proofStatus.index}_${docStatus.index}" value="Remove" onclick="javascript:removeOnClick('${proofStatus.index}','${docStatus.index}');">
														<i class="fa fa-close"></i>
													</button>
												</div>
												<div class="col-md-2"></div>
												<div class="col-md-4">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">Reference Number</label>
															<form:input type="text" path="proofList[${proofStatus.index}].documentList[${docStatus.index}].referenceNumber" class="form-control field-background textRequired" data-parsley-required="false" placeholder="Reference Number" maxlength="${maxLength255}"/>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
													</div>
												</div>
											</div>
		
											<div class="row docFieldDetailsYes${proofStatus.index}_${docStatus.index}" style="display: none">
												<div class="col-md-6">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">Comment</label>
															<form:textarea path="proofList[${proofStatus.index}].documentList[${docStatus.index}].comment" class="field-background" data-parsley-required="false" placeholder="Comment" rows="5" style="min-width: 100%" maxlength="${maxLength500}"></form:textarea>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
													</div>
												</div>
											</div>
		
											<hr />
										</c:forEach>
									</c:if>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<div class="row" id="userProofEmpty" style="display:none;">
						<div class="col-md-12">
							<div  style="padding: 9px;"><font color="red"><i class="fa fa-warning"></i>&nbsp;No active default document is setup !</font> <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
							</div>								
						</div>
				</div>
			</c:otherwise>  
		</c:choose> 
		</div>
			<div class="clearfix margin-bottom-10"></div>

			<c:if test="${kycSubjectBO.consentList != null && kycSubjectBO.consentList.size() > 0}">
				<div class="row">
					<div class="col-md-12">
						<div class="page-bar">
							<ul class="page-breadcrumb">
								<li><em><strong>${userConsentLabel}</strong></em></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="clearfix margin-bottom-10"></div>

				<c:forEach items="${kycSubjectBO.consentList}" var="consentObject" varStatus="consentIndex">
					<div class="row">
						<c:choose>
							<c:when test="${consentObject.isMandatory ==true}">
								<div class="form-group">
									<div class="form-group uk-width-1-1">
										<div class="bt-flabels__wrapper">
											<div class="col-md-12">
												<form:hidden path="consentList[${consentIndex.index}].consentId" value="${consentObject.consentId}" />
												<form:checkbox path="consentList[${consentIndex.index}].isConsentChecked" autocomplete="off" required="required"/>
												<label class="control-label">${consentObject.consentDescription}</label>
											</div>
											<div class="row col-md-1" style="width: 6.3333%;">
												<span class="bt-flabels__error-desc">Required</span>
											</div>
										</div>
										<div class="clearfix margin-bottom-10"></div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-12">
									<form:hidden path="consentList[${consentIndex.index}].consentId" value="${consentObject.consentId}" />
									<form:checkbox path="consentList[${consentIndex.index}].isConsentChecked" autocomplete="off"/>
									<label class="control-label">${consentObject.consentDescription}</label>
								</div>
								<div class="row col-md-1" style="width: 17.3333%;"></div>
								<div class="clearfix margin-bottom-10"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</c:if>

		</form:form>
		<textarea id="isDashboardRequestId" style="display: none;">${isDashboardRequest}</textarea>
	</div>
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
	<div class="clearfix margin-bottom-10"></div>
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
		
		var typeOfCounterpartyCode = $("#typeOfCounterpartyCode").val();
		if(typeOfCounterpartyCode!=null && typeOfCounterpartyCode != ""){
			$('#userProofEmpty').show();
		}
		
		/* jQuery("#zipCode").keypress(function (e) {
		var length = jQuery(this).val().length;
			if(length > 11) {
				return false;
			}
	    }); */
	    
	    $(document).on("input", "#telephoneNumber", function() {
	        //this.value = this.value.replace(/\D/g,'');
	    	var self = $(this);
	    	self.val(self.val().replace(/[^0-9\-]/g, ''));
	    });
	});
			
	var counts = [];
	$('#saveButton').click(function() {

		console.log("Form submitting.....");
		$('#frm').parsley().validate();
		var response = $('#frm').parsley().isValid();
		//--console.log("Validation Response : " + response);
		if (response) {
			var proofCount = 0;
			$('.tab-content').find('input[type="checkbox"]:checked').each( function() {
				var docValue = this.value;
				//--console.log("docValue : " + docValue);
				proofCount++;
			});
			//console.log("proofCount : " + proofCount);
			if(proofCount==0){
				bootbox.alert("At least one document must be selected in support of this KYC Subject!", function(){});
				return false;
			} else {
				$('.contactDetails').attr("disabled", false);
				$('#frm').attr("method", "post");
				$('#frm').attr("action", "${contextPath}/kyc/subject/add");
				bootbox.confirm({
                    message: "Are you sure you want to save?",
                    buttons: {
                        confirm: {
                            label: ' Yes',
                            className: 'btn btn-sm grey-gallery'
                        },
                        cancel: {
                            label: ' No',
                            className: 'btn btn-sm btn-default'
                        }
                    },
			        callback: function (result) {
			        	if(result){
			        		$('#frm').submit();
			    			buffer();
			        	}
			        }
				});
			}
		}
	});

	// Get Proof List with Documents
	$("#typeOfCounterpartyCode").change(function() {
	    document.getElementById("userProof").innerHTML = "";
		//$('#userProofEmpty').show();
	    var typeOfCounterpartyCode = this.value;
		//--console.log("typeOfCounterpartyCode :: " + typeOfCounterpartyCode);
		if(typeOfCounterpartyCode!=null && typeOfCounterpartyCode != ""){
			$('.contactDetails').attr("disabled", false);
			console.log("Form submitting by typeOfCounterpartyCode.....");
			$('#frm').parsley().destroy();
			$('#frm').attr("method", "post");
			$('#frm').attr("action",  $("#commonContextPathId").val() + "/kyc/subject/addPage");
			$('.contactDetails').attr("disabled", false);
			$('#frm').submit();
			buffer();
		}else{
			document.getElementById('userProofAndConsent').style.display='none'; 
		}
	});

	$('#cancelButton').click(function() {
		bootbox.confirm({
            message: "Are you sure you want to cancel?",
            buttons: {
                confirm: {
                    label: ' Yes',
                    className: 'btn btn-sm grey-gallery'
                },
                cancel: {
                    label: ' No',
                    className: 'btn btn-sm btn-default'
                }
            },
	        callback: function (result) {
	        	if(result){
	        		if($("#isDashboardRequestId").val() != null && $("#isDashboardRequestId").val() != "")
	        			location.href = "${contextPath}/dashboard";
	        		else
						location.href = "${contextPath}/kyc/subject/search";
	        		buffer();
	        	}
	        }
		});
	});

	function onChangeFile(i, j) {
		var uploadFile = $('#file_' + i + '_' + j).val().split('\\').slice(-1)[0].toString();
		//alert(uploadFile);
		if (uploadFile != "") {
			var acceptedFileExtn = document.getElementById("file_" + i + "_" + j).getAttribute("accept");
			if(acceptedFileExtn != undefined && acceptedFileExtn != ""){
				var acceptedFileExtnArray = acceptedFileExtn.split(",");
				var fileExtn = uploadFile.split('.');
				if(acceptedFileExtnArray.includes("."+fileExtn[fileExtn.length-1])){
					$('#file' + i + '_' + j).val(uploadFile);
					document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = uploadFile;
					$('#removeFile_' + i + '_' + j).removeClass('hidden');
					$("#removeFile_" + i + '_' + j).attr('value', 'Change');
				} else {
					bootbox.alert({
						message: "You have selected incorrect file! Please select file with " + acceptedFileExtn + " extension(s).",
						buttons: {
				        	ok: {
				        		label: 'OK',
				        		className: 'btn btn-sm grey-gallery',
				        	}
						},
						callback: function(){
							$('#file_' + i + '_' + j).val('');
							$('#file' + i + '_' + j).val('');
							document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = '';
							$('#removeFile_' + i + '_' + j).addClass('hidden');
							$("#file" + i + "_" + j).change();
						}
					});
				}
			}
		}
	}

	function removeOnClick(i, j) {
		$('#file_' + i + '_' + j).val('');
		$('#file' + i + '_' + j).val('');
		document.getElementById('proofList' + i + '.documentList' + j + '.fileName').value = '';
		$('#removeFile_' + i + '_' + j).addClass('hidden');
		$("#file" + i + "_" + j).change();
	}

	function displaydocs(value, proofIndex, documentIndex, documentId, attributeCount) {
		console.log("proofIndex  ::" + proofIndex + " documentIndex :: " + documentIndex + " documentId :: " + documentId);
		if (value.checked) {
			$('#uniform-isDocumentReceivedYes'+ proofIndex + "_" + documentIndex + ">span").addClass("checked");
			//on check of document showing the default yes fields with parsely validation
			$(".docFieldDetailsYes" + proofIndex + "_" + documentIndex).show(300);
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').dispatchEvent(new Event("change"));
			
			for (var i = 0; i < attributeCount; i++) {
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'true');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			} 
			//Parsley validation setting false
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.dueDate').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.dueDate').dispatchEvent(new Event("change"));

			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.waiverReason').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.waiverReason').dispatchEvent(new Event("change"));
			//
			console.log("documentId:::"+documentId);
			if(jQuery.inArray(documentId, counts) !== -1) {
			    $('#isDocSelected'+ proofIndex + "_" + documentIndex).prop("checked", false);
			    $('#isDocSelected'+ proofIndex + "_" + documentIndex + '_hidden').val("false");
			    $('#isDocSelected'+ proofIndex + "_" + documentIndex).val("");
			    $(".document" + proofIndex + "_" + documentIndex).hide(300);
				$(".docFieldDetailsNo" + proofIndex + "_" + documentIndex).hide(300);
				$(".docFieldDetailsYes" + proofIndex + "_" + documentIndex).hide(300);
				$(".docFieldDetailsWaiver" + proofIndex + "_" + documentIndex).hide(300);
				bootbox.alert("Same document is already selected please select another document!", function(){});
				
				
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').dispatchEvent(new Event("change"));
				
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').dispatchEvent(new Event("change"));
				
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').dispatchEvent(new Event("change"));
				
				for (var i = 0; i < attributeCount; i++) {
					document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
					document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
				}
				
			} else {
				$('#isDocSelected'+ proofIndex + "_" + documentIndex + '_hidden').val("true");
				$('#isDocSelected'+ proofIndex + "_" + documentIndex).val(documentId);
				$(".document" + proofIndex + "_" + documentIndex).show(500);
				counts.push(documentId);
			}
		} else {
			$('#uniform-isDocumentReceivedYes'+ proofIndex + "_" + documentIndex + ">span").removeClass("checked");
			$('#uniform-isDocumentReceivedNo'+ proofIndex + "_" + documentIndex + ">span").removeClass("checked");
			$('#uniform-isDocumentReceivedWaiver'+ proofIndex + "_" + documentIndex + ">span").removeClass("checked");
			
			//on uncheck of document hiding the default yes fields with no parsely validation
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.fileName').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.referenceNumber').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.comment').dispatchEvent(new Event("change"));
			
			for (var i = 0; i < attributeCount; i++) {
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofIndex + '.documentList' + documentIndex + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			} 
			
			$('#isDocSelected'+ proofIndex + "_" + documentIndex + '_hidden').val("false");
			$('#isDocSelected'+ proofIndex + "_" + documentIndex).val("");
			$(".document" + proofIndex + "_" + documentIndex).hide(300);
			$(".docFieldDetailsNo" + proofIndex + "_" + documentIndex).hide(300);
			$(".docFieldDetailsYes" + proofIndex + "_" + documentIndex).hide(300);
			$(".docFieldDetailsWaiver" + proofIndex + "_" + documentIndex).hide(300);
			
			var i;
			while ((i = counts.indexOf(documentId)) != -1) {
				 counts.splice(i, 1);
			}
		}
	}

	function consentBox(value, consentIndex) {
		if (value.checked) {
			$('#uniform-consent_' + consentIndex +'>span').addClass('checked');
			$('#consent_' + consentIndex).prop('checked', true);
			$('#consent_' + consentIndex).val(true);
		} else {
			$('#uniform-consent_' + consentIndex +'>span').removeClass('checked');
			$('#consent_' + consentIndex).prop('checked', false);
			$('#consent_' + consentIndex).val(false);
		}
	}

	function showdocFields(value, proofId, documentId, attributeCount) {
		console.log("proofIndex  ::" + proofId + " documentIndex :: " + documentId + " attributeCount :: " + attributeCount);
		if (value == "0") {
			$(".docFieldDetailsNo" + proofId + "_" + documentId).show(500);
			$(".docFieldDetailsYes" + proofId + "_" + documentId).hide(300);
			$(".docFieldDetailsWaiver" + proofId + "_" + documentId).hide(300);
			
			//Parsley validation setting true
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').dispatchEvent(new Event("change"));
			
			//Parsley validation setting false
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').dispatchEvent(new Event("change"));

			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').dispatchEvent(new Event("change"));

			for (var i = 0; i < attributeCount; i++) {
				document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			}

		} else if (value == "1") {
			//Parsley validation setting true
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').dispatchEvent(new Event("change"));
			
			for (var i = 0; i < attributeCount; i++) {
				document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'true');
				document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			}
			
			//Parsley validation setting false
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').dispatchEvent(new Event("change"));

			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').dispatchEvent(new Event("change"));
			
			$(".docFieldDetailsYes" + proofId + "_" + documentId).show(500);
			$(".docFieldDetailsWaiver" + proofId + "_" + documentId).hide(300);
			$(".docFieldDetailsNo" + proofId + "_" + documentId).hide(300);
		} else if (value == "2") {
			//Parsley validation setting true
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').setAttribute('data-parsley-required', 'true');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.waiverReason').dispatchEvent(new Event("change"));
			
			//Parsley validation setting false
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.dueDate').dispatchEvent(new Event("change"));

			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.fileName').dispatchEvent(new Event("change"));
			
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.referenceNumber').dispatchEvent(new Event("change"));

			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').setAttribute('data-parsley-required', 'false');
			document.getElementById('proofList' + proofId + '.documentList' + documentId + '.comment').dispatchEvent(new Event("change"));
			
			for (var i = 0; i < attributeCount; i++) {
				document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').setAttribute('data-parsley-required', 'false');
				document.getElementById('proofList' + proofId + '.documentList' + documentId + '.documentAttributeList' + i + '.documentAttributeValue').dispatchEvent(new Event("change"));
			}
			$(".docFieldDetailsWaiver" + proofId + "_" + documentId).show(500);
			$(".docFieldDetailsYes" + proofId + "_" + documentId).hide(300);
			$(".docFieldDetailsNo" + proofId + "_" + documentId).hide(300);
		}
	}
	
</script>