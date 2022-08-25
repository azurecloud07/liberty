<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="riskCategoryName" value="<%= ITGConstant.RISK_CATEGORY_NAME%>" />
<c:set var="riskCategoryShortCode" value="<%= ITGConstant.RISK_CATEGORY_SHORT_CODE%>" />
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
<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />
<spring:message code="submit.label" var="updateLabel" />
<spring:message code="save.label" var="saveLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="kycSubject.firstName.label" var="firstNameLabel" />
<spring:message code="kycSubject.middleName.label" var="middleNameLabel" />
<spring:message code="kycSubject.lastName.label" var="lastNameLabel" />
<spring:message code="kycSubject.dateOfBirth.label" var="dateOfBirthLabel" />
<spring:message code="kycSubject.occupation.label" var="occupationLabel" />
<spring:message code="kycSubject.sourceOfWealth.label" var="sourceOfWealthLabel" />
<spring:message code="kycSubject.residentialAddress.label" var="residentialAddressLabel" />
<spring:message code="kycSubject.stateCity.label" var="stateCityLabel" />
<spring:message code="kycSubject.zipCode.label" var="zipCodeLabel" />
<spring:message code="kycSubject.countryOfResidency.label" var="countryOfResidencyLabel" />
<spring:message code="kycSubject.countryOfBirth.label" var="countryOfBirthLabel" />
<spring:message code="kycSubject.countryOfNationality.label" var="countryOfNationalityLabel" />
<spring:message code="kycSubject.countryOfCitizenship.label" var="countryOfCitizenshipLabel" />
<spring:message code="kycSubject.anyOtherFormerFirstName.label" var="anyOtherFormerFirstNameLabel" />
<spring:message code="kycSubject.anyOtherFormerMiddleName.label" var="anyOtherFormerMiddleNameLabel" />
<spring:message code="kycSubject.anyOtherFormerLastName.label" var="anyOtherFormerLastNameLabel" />
<spring:message code="kycSubject.otherNationality.label" var="otherNationalityLabel" />
<spring:message code="kycSubject.userConsent.label" var="userConsentLabel" />
<spring:message code="kycSubject.jurisdiction.label" var="jurisdictionLabel" />
<spring:message code="kycSubject.itgJurisdiction.label" var="itgJurisdictionLabel" />
<spring:message code="kycSubject.emailAddress.label" var="emailAddressLabel" />
<spring:message code="kycSubject.telephoneNumber.label" var="telephoneNumberLabel" />
<spring:message code="kycSubject.exemptCategory.label" var="exemptCatLabel" />
<spring:message code="kycSubject.fullNameOfTargetedContact.label" var="fullNameOfTargetedContactLabel" />
<spring:message code="kycSubject.addressOfTargetedContact.label" var="addressOfTargetedContactLabel" />
<spring:message code="kycSubject.nationalityOfTargetedContact.label" var="nationalityOfTargetedContactLabel" />
<spring:message code="kycSubject.emailAddressOfTargetedContact.label" var="emailAddressOfTargetedContactLabel" />
<spring:message code="kycSubject.phoneNoOfTargetedContact.label" var="phoneNoOfTargetedContactLabel" />
<spring:message code="kycSubject.proofDocument.file.extensions" var="proofDocumentFileExtensions" />
<spring:message code="cancel.label" var="cancelLabel" />
<input type="hidden" id="contextPathId" value="${contextPath}" />
<spring:message code="kycSubject.registrationName.label" var="registrationNameLabel" />
<spring:message code="kycSubject.dateOfIncorp.label" var="dateOfIncorpLabel" />
<spring:message code="kycSubject.countryOfIncorp.label" var="countryOfIncorpLabel" />
<spring:message code="kycSubject.proofDocument.file.extensions" var="proofDocumentFileExtensions" />
<spring:message code="kycSubject.mitigation.file.extensions" var="mitigationFileExtensions" />
<input type="hidden" value="${proofDocumentFileExtensions}" id="proofDocumentFileExtensionsId" />
<input type="hidden" value="${mitigationFileExtensions}" id="mitigationFileExtensionsId" />
<%-- <spring:message code="kycSubject.effectiveDate.label" var="effectiveDateLabel" /> --%>

<style>
.high-yes-risk {
	background-color: red;
	width: 50px;
	padding-left: 11px;
	color: white;
	padding-top: 4px;
	padding-bottom: 5px;
	margin-top: 4px;
}

.ui-datepicker { position: relative; z-index: 999999 !important; }

</style>

<div class="page-content-wrapper">
   <div class="page-content">
      <div class="page-bar search-page-bar">
         <ul class="page-breadcrumb pull-right">
            <li><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></li>
            <li>KYC Subjects<i class="fa fa-angle-right"></i></li>
            <li>Edit</li>
         </ul>
         <!-- <h4>&nbsp;KYC Subject</h4> -->
         <span class="header-scope">&nbsp;KYC Subject</span>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div class="portlet-body form">
               <div class="pull-right">
                  <button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" >View Remarks</button>
                  <input type="hidden" id="kycSubjectStatus" value="${kycSubjectBO.isActive}"/>
                  <c:choose>
                    <c:when test="${kycSubjectBO.isActive == 1}">
                    	<button type="button" disabled="disabled" class="btn-itg btn btn-sm grey-gallery saveButton" >
							<img src="/digiKYC/assets/global/img/submit.png" /> ${updateLabel}
	                  	</button>
                    </c:when>
                    <c:otherwise>
                    	<button type="button" id="saveButton" disabled="disabled" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/submit.png" /> ${updateLabel}
		                </button>
                    </c:otherwise>
                 </c:choose>
                 	<button type="button" id="saveKycButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/save.png" /> ${saveLabel} </button>
                  	<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
                  <div class="clearfix margin-bottom-5"></div>
               </div>
            </div>
         </div>
      </div>
      <!-- End Row -->
      <div class="row">
         <div class="col-md-12">
            <div class="portlet" id="form_wizard_1">
               <div class="portlet-body form">
                  <form:form id="frm" class="form-horizontal uk-form bt-flabels js-flabels" action="${contextPath}/kyc/subject/reviewAdd" role="form" method="POST" modelAttribute="kycSubjectBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true" enctype="multipart/form-data">
                     <input type="hidden" id="subjectId" value="${kycSubjectBO.id}" />
                     <input type="hidden" id="createdDate" value="${createdDate}" />
                     <input type="hidden" id="referenceId" name="referenceId" value="${kycSubjectBO.referenceId}"/>
                     <input type="hidden" id="subjectRequestNo" value="${kycSubjectBO.kycSubjectRequestNo}" />
                     <input type="hidden" name="manualScreening.kycSubjectId" value="${kycSubjectBO.id}" />
                     <%-- <form:hidden path="id" /> --%>
                     <textarea id="workflowId" style="display:none;"></textarea>
                     <textarea id="stateId" style="display:none;"></textarea>
                     <textarea id="masterId" style="display:none;">${kycSubjectBO.id}</textarea>
                     <div class="form-wizard">
                        <div class="form-body">
                           <ul class="nav nav-justified steps" style="padding: 0px !important;">
                              <li class="rfs nav_li active" id="nav_li_1">
                                 <a href="#" class="step">
                                 <span class="number"> 1 </span>
                                 <span class="desc"> <i class="fa fa-check"></i> KYC Subject Detail </span>
                                 </a>
                              </li>
                              <li class="ms nav_li" id="nav_li_2">
                                 <a href="#" class="step">
                                 <span class="number"> 2 </span>
                                 <span class="desc"> <i class="fa fa-check"></i>  Screening </span>
                                 </a>
                              </li>
                              <li class="tm nav_li" id="nav_li_3">
                                 <a href="#" class="step">
                                 <span class="number"> 3 </span>
                                 <span class="desc"> <i class="fa fa-check"></i> Document Collection </span>
                                 </a>
                              </li>
                              <li class="metigation mt nav_li" id="nav_li_4" style="display:none;">
								<a href="#" class="step">
									<span class="number"> 4 </span>
									<span class="desc" style="color: #312783;"> <i class="fa fa-check"></i> Mitigation </span>
								</a>
							  </li>
                           </ul>
                           <div id="bar" class="progress progress-striped hidden" role="progressbar">
                              <div class="progress-bar progress-bar-success"></div>
                           </div>
                           <div class="tab-content">
                              <div class="tab-pane active tab_pane" id="tab1">
                                 <!-- <div class="row">
                                    <div class="col-md-12">
                                       <div class="portlet-body form">
                                          <div class="pull-right">
                                             <button type="button" id="manualScreening" class="btn btn-sm grey-gallery" onclick="showHideTabpane(2)">
                                             <em class="fa fa-file-code-o"></em> Manual Screening
                                             </button>
                                             <button type="button" disabled="disabled" id="sendForScreening" class="btn btn-sm grey-gallery">                                                    
                                             <em class="fa fa-external-link"></em> Send for Screening
                                             </button>
                                          </div>
                                          <div class="clearfix margin-bottom-5"></div>
                                       </div>
                                    </div>
                                 </div> -->
                                 <!-- End Row -->
                                 <hr>
                                 <form:hidden path="id" />
                                 <form:hidden path="kycSubjectRequestNo" value="${kycSubjectBO.kycSubjectRequestNo}"></form:hidden>
                                 <div class="form-body">
                                    <div class="row">
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${counterPartyTypeLabel}</label>
                                                   <div class="field-background">
                                                      <form:select path="typeOfCounterpartyCode" class="form-control select2me" placeholder="${counterPartyTypeLabel}" data-parsley-required="true" data-parsley-group="kycSubjectGroup">
                                                         <option value=""></option>
                                                         <form:option  value="Individual">Individual</form:option>
                                                         <%-- <c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
                                                            <c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
                                                               <form:option value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</form:option>
                                                            </c:forEach>
                                                         </c:if> --%>
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
                                                   <form:input type="text" path="firstName" class="chk-field form-control field-background" placeholder="${firstNameLabel}" data-parsley-required="true" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
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
                                                   <form:input type="text" path="middleName" class="chk-field form-control" placeholder="${middleNameLabel}" data-parsley-required="false" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${lastNameLabel}</label>
                                                   <form:input type="text" path="lastName" class="chk-field form-control field-background" placeholder="${lastNameLabel}" data-parsley-required="true" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
                                                   <span class="bt-flabels__error-desc">Required</span>
                                                </div>
                                                <form:errors path="lastName" cssClass="help-block error" />
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End Row -->
                                    <div class="row">
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${dateOfBirthLabel}</label>
                                                   <div class="input-group" data-date-end-date="+0d">
                                                      <form:input type="text" path="dateOfBirth" placeholder="${dateOfBirthLabel}" data-parsley-required="true" class=" chk-field birthDatePicker form-control form-control-inline field-background" data-parsley-group="kycSubjectGroup" />
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
                                                   <form:input type="text" path="occupation" class=" form-control" placeholder="${occupationLabel}" maxlength="${maxLength255}" data-parsley-required="false" data-parsley-group="kycSubjectGroup" />
                                                   <span class="bt-flabels__error-desc">Required</span>
                                                </div>
                                                <form:errors path="occupation" cssClass="help-block error" />
                                             </div>
                                          </div>
                                       </div> 
                                       
                                       <div class="col-md-3">
											<div class="bt-form__wrapper">
												<div class="form-group uk-width-1-1">
													<div class="bt-flabels__wrapper">
														<label class="parsley_hide">${sourceOfWealthLabel}</label>
														<form:input type="text" path="sourceOfWealth" class=" form-control" placeholder="${sourceOfWealthLabel}" maxlength="${maxLength255}" data-parsley-required="false" data-parsley-group="kycSubjectGroup" />
														<span class="bt-flabels__error-desc">Missing</span>
													</div>
													<form:errors path="sourceOfWealth" cssClass="help-block error" />
												</div>
											</div>
										</div>
										
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
                                             
                                       <%-- <c:choose>
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
                                       </c:choose> --%>
                                    </div>
                                    <hr>
                                    <div class="row">
                                       <div class="col-md-6">
                                          <div class="form-group uk-width-1-1">
                                             <div class="bt-flabels__wrapper">
                                                <label class="parsley_hide">${residentialAddressLabel}</label>
                                                <form:input type="text" maxlength="${maxLength255}" path="residentialAddress"
                                                   class="form-control"
                                                   placeholder="${residentialAddressLabel}" data-parsley-required="false" data-parsley-group="kycSubjectGroup" />
                                                <span class="bt-flabels__error-desc">Missing</span>
                                             </div>
                                             <form:errors path="residentialAddress" cssClass="help-block error" />
                                          </div>
                                       </div>
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${stateCityLabel}</label>
                                                   <form:input type="text" path="stateCity"
                                                      class="form-control" placeholder="${stateCityLabel}"
                                                      data-parsley-required="false" maxlength="${maxLength255}" data-parsley-group="kycSubjectGroup" />
                                                   <span class="bt-flabels__error-desc">Missing</span>
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
                                                      class="form-control" placeholder="${zipCodeLabel}"
                                                      data-parsley-required="false" maxlength="${maxLength15}" data-parsley-group="kycSubjectGroup" />
                                                   <span class="bt-flabels__error-desc">Missing</span>
                                                </div>
                                                <form:errors path="zipCode" cssClass="help-block error" />
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End Row -->
                                    <div class="row">
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${countryOfResidencyLabel}</label>
                                                   <div class="parsley_hide">
                                                      <form:select id="countryOfResidencyCode"
                                                         path="countryOfResidencyCode"
                                                         placeholder="${countryOfResidencyLabel}"
                                                         class="form-control select2me" data-parsley-required="false" data-parsley-group="kycSubjectGroup">
                                                         <form:option value=""></form:option>
                                                         <c:if test="${countryData != null && countryData.length() > 0}">
                                                            <c:forEach begin="0" end="${countryData.length() -1}" var="index">
                                                               <form:option value="${countryData.get(index).get(countryShortCode)}">${countryData.get(index).get(countryName)}</form:option>
                                                            </c:forEach>
                                                         </c:if>
                                                      </form:select>
                                                   </div>
                                                   <span class="bt-flabels__error-desc_select">Missing</span>
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
                                                   <div class="parsley_hide">
                                                      <form:select id="countryOfBirthCode" path="countryOfBirthCode"
                                                         placeholder="${countryOfBirthLabel}" class=" form-control select2me"
                                                         data-parsley-required="false" data-parsley-group="kycSubjectGroup">
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
                                                   <label class="parsley_hide">${countryOfCitizenshipLabel}</label>
                                                   <div class="field-background">
                                                      <form:select id="countryOfCitizenshipCode"
                                                         path="countryOfCitizenshipCode"
                                                         placeholder="${countryOfCitizenshipLabel}"
                                                         class=" form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectGroup">
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
                                                <form:errors path="countryOfCitizenshipCode" cssClass="help-block error" />
                                             </div>
                                          </div>
                                       </div> 
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${emailAddressLabel}</label>
                                                   <form:input type="email" path="emailAddress"
                                                      class=" form-control" placeholder="${emailAddressLabel}"
                                                      data-parsley-required="false" data-parsley-group="kycSubjectGroup" />
                                                   <span class="bt-flabels__error-desc">Valid email required</span>
                                                </div>
                                                <form:errors path="emailAddress" cssClass="help-block error" />
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End Row -->
                                    <div class="row">
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${telephoneNumberLabel}</label>
                                                   <form:input type="text" path="telephoneNumber" maxlength="${maxLength15}"
                                                      class=" form-control" placeholder="${telephoneNumberLabel}"
                                                      data-parsley-required="false" data-parsley-group="kycSubjectGroup" />
                                                   <span class="bt-flabels__error-desc">Missing</span>
                                                </div>
                                                <form:errors path="telephoneNumber" cssClass="help-block error" />
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-md-3">
                                            <div class="bt-form__wrapper">
                                                <div class="form-group uk-width-1-1">
                                                    <div class="bt-flabels__wrapper">
                                                        <form:checkbox path="isExemptCategory" />
                                                        <label class="control-label">${exemptCatLabel}</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                       <%-- 
                                       <c:if test="${kycSubjectBO.isActive == 1}">
                                       		<div class="col-md-3">
	                                          <div class="bt-form__wrapper">
	                                             <div class="form-group uk-width-1-1">
	                                                <div class="bt-flabels__wrapper">
	                                                   <label class="parsley_hide">${effectiveDateLabel}</label>
	                                                   <div class="input-group">
	                                                      <form:input type="text" path="effectiveDate" placeholder="${effectiveDateLabel}" data-parsley-required="true" class="datePicker form-control form-control-inline field-background" data-parsley-group="kycSubjectGroup"/>
	                                                      <span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
	                                                   </div>
	                                                   <span class="bt-flabels__error-desc_date">Required</span>
	                                                </div>
	                                                <form:errors path="effectiveDate" cssClass="help-block error" />
	                                             </div>
	                                          </div>
	                                       </div>
                                       </c:if>
                                        --%>
                                       <c:if test="${instanceName == 'FCH'}">
											<c:if test="${otherDetails.has('stateOrCounty') && not empty otherDetails.get('stateOrCounty')}">
						                     	<div class="col-md-3 entity_class">
		                                          <div class="bt-form__wrapper">
		                                             <div class="form-group uk-width-1-1">
		                                                <div class="bt-flabels__wrapper">
		                                                   <label class="parsley_hide">State Or County</label>
		                                                   <div class="parsley_hide">
		                                                      <select class="form-control select2me" placeholder="State Or County" disabled="disabled">
		                                                         <option value="${otherDetails.get('stateOrCounty')}">${otherDetails.get('stateOrCounty')}</option>
		                                                      </select>
		                                                   </div>
		                                                </div>
		                                             </div>
		                                          </div>
		                                       </div>
						                  	</c:if>
						                  	<c:if test="${otherDetails.has('kycPartyType') && not empty otherDetails.get('kycPartyType')}">
							                     <div class="col-md-3">
													<div class="bt-form__wrapper">
														<div class="form-group uk-width-1-1">
															<div class="bt-flabels__wrapper">
																<label class="parsley_hide">KYC Party Type</label>
																<input disabled="disabled" type="text" class="form-control" placeholder="KYC Party Type" value="${otherDetails.get('kycPartyType')}"/>
															</div>
														</div>
													</div>
												</div>
							                </c:if>
									   </c:if>
									   
                                    </div>
                                    <!-- End Row -->
                                    <hr>
                                    <div class="row">
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${anyOtherFormerFirstNameLabel}</label>
                                                   <form:input type="text" path="anyOtherFirstName"
                                                      class=" form-control" placeholder="${anyOtherFormerFirstNameLabel}"
                                                      maxlength="${maxLength255}" />
                                                   <span class="bt-flabels__error-desc">Required</span>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${anyOtherFormerMiddleNameLabel}</label>
                                                   <form:input path="anyOtherMiddleName" class=" form-control"
                                                      placeholder="${anyOtherFormerMiddleNameLabel}" maxlength="${maxLength255}" />
                                                   <span class="bt-flabels__error-desc">Required</span>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${anyOtherFormerLastNameLabel}</label>
                                                   <form:input path="anyOtherLastName" class=" form-control"
                                                      placeholder="${anyOtherFormerLastNameLabel}" maxlength="${maxLength255}" />
                                                   <span class="bt-flabels__error-desc">Required</span>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${otherNationalityLabel}</label>
                                                   <div class="parsley_hide">
                                                      <form:select path="otherNationality" placeholder="${otherNationalityLabel}" class=" form-control select2me">
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
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- End Row -->
                                    <div class="clearfix margin-bottom-10"></div>
                                    <!-- <hr /> -->
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
                                          <div class="parsley_hide">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${addressOfTargetedContactLabel}</label>
                                                   <form:input path="addressOfTargetedContact" placeholder="${addressOfTargetedContactLabel}" class="form-control contactDetails" value="" data-parsley-required="false" data-parsley-group="kycSubjectGroup" disabled="true" />
                                                   <span class="bt-flabels__error-desc">Required</span>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${nationalityOfTargetedContactLabel}</label>
                                                   <div class="parsley_hide">
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
                                     <div class="row">
                                        <div class="page-bar">
                                           <ul class="page-breadcrumb">
                                              <li><em><strong>Add Relation</strong></em></li>
                                           </ul>
                                        	<hr style="border-top: 1px dashed; margin-top:-20px">
                                     	</div>
                                     </div>	
                                     <div class="row">
                                        <input type="button" class="btn-itg btn btn-sm grey-gallery" style="padding:0px 10px 0px 10px;" id="addrowbutton" value="Add new row" />
                                        <input type="button" class="btn-itg btn btn-sm grey-gallery" style="padding:0px 10px 0px 10px;" id="deleterowbutton" value="Delete selected row"/>
                                     </div>
                                     <div class="clearfix margin-bottom-15"></div>
                                     <span class="inCompleteRelationMsg" style="display:none;"><label class="error" style="display: inline-block;">Relation is missing.</label></span>
                                    <div class="row">
                                    	<div>
                                    		<div id="grid"></div>
                                    	</div>
                                    </div>
                                    <div class="clearfix margin-bottom-10"></div>
                                    <c:if test="${kycSubjectBO.consentList != null && kycSubjectBO.consentList.size() > 0}">
                                       <div class="row">
                                          <div class="page-bar">
                                             <ul class="page-breadcrumb">
                                                <li><em><strong>${userConsentLabel}</strong></em></li>
                                             </ul>
                                          </div>
                                       </div>
                                       <div class="clearfix margin-bottom-10"></div>
                                       <c:forEach items="${kycSubjectBO.consentList}" var="consentObject" varStatus="consentIndex">
                                          <div class="row">
                                             <div class="col-md-12">
                                                <c:choose>
                                                   <c:when test="${consentObject.isMandatory ==true}">
                                                      <div class="parsley_hide">
                                                         <div class="uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <div class="row">
                                                                  <form:hidden path="consentList[${consentIndex.index}].consentId" value="${consentObject.consentId}" />
                                                                  <form:checkbox path="consentList[${consentIndex.index}].isConsentChecked" autocomplete="off" required="required" data-parsley-group="kycSubjectGroup" />
                                                                  <label class="control-label">${consentObject.consentDescription}</label>
                                                               </div>
                                                               <div class="row">
                                                                  <div class="col-md-1" style="width: 4.5%;">
                                                                     <span class="bt-flabels__error-desc">Required</span>
                                                                  </div>
                                                               </div>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <div class="row">
                                                         <form:hidden path="consentList[${consentIndex.index}].consentId" value="${consentObject.consentId}" />
                                                         <form:checkbox path="consentList[${consentIndex.index}].isConsentChecked" autocomplete="off" data-parsley-group="kycSubjectGroup" />
                                                         <label class="control-label">${consentObject.consentDescription}</label>
                                                      </div>
                                                   </c:otherwise>
                                                </c:choose>
                                             </div>
                                          </div>
                                          <div class="clearfix margin-bottom-10"></div>
                                       </c:forEach>
                                    </c:if>
                                    <!-- End consentList -->
                                 </div>
                                 <!-- End form-body -->
                                 <hr>
                                 <div class="row">
                                    <div class="col-md-12" align="center">
                                       <!-- <a href="#" onclick="showHideTabpane(2)" class="btn blue button-next grey-gallery"> Continue <i class="m-icon-swapright m-icon-white"></i> </a> -->
                                       <div class="portlet-body form">
                                          	<button type="button" id="manualScreening" class="btn-itg btn btn-sm grey-gallery">
	                                            <em class="fa fa-file-code-o"></em> Manual screening
	                                        </button>
	                                        <button type="button" id="sendForScreening" class="btn-itg btn btn-sm grey-gallery">                                                    
	                                            <em class="fa fa-external-link"></em> Automatic screening
	                                     	</button>
                                       <div class="clearfix margin-bottom-5"></div>
                                      </div>
                                    </div>
                                 </div>
                              </div>
                              <!-- End Tab1 -->
                              <div class="tab-pane tab_pane" id="tab2">
                                 <div class="row">
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
                                             <label class="noteLabel typeOfCounterpartyName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Residency :</label> 
                                             <label class="noteLabel countryOfResidencyName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Birth :</label> 
                                             <label class="noteLabel countryOfBirthName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Citizenship :</label> 
											 <label class="noteLabel countryOfCitizenshipName"></label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">First Name :</label> 
                                             <label class="noteLabel doc-name-align firstName"></label>
                                             <br>
                                             <label class="noteLabel bold">Middle Name :</label> 
                                             <label class="noteLabel doc-name-align middleName"></label>						
                                             <br>
                                             <label class="noteLabel bold">Last Name :</label> 
                                             <label class="noteLabel doc-name-align lastName"></label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="portlet">
                                    <div class="portlet-body form">
                                       <div class="form-body">
                                          <div class="row">
                                             <div class="col-md-12">
                                                <h3 class="form-section">Screening Checks</h3>
                                                <div class="row">
                                                   <div class="col-md-1"></div>
                                                   <label class="col-md-2 control-label"> PEP</label>
                                                   <div class="col-md-2">
                                                      <div class="radio-list">
                                                         <c:choose>
                                                            <c:when test="${riskDataJson.isPepRisk}">
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" checked="checked" value="true" name="kycSubjectReview.isPepRisk"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="false" name="kycSubjectReview.isPepRisk"> No </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" value="true" name="kycSubjectReview.isPepRisk"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="false" name="kycSubjectReview.isPepRisk"> No </label>
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-2 hidden">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="pepRiskLevel" class="form-control select2me" data-parsley-required="true"  data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value="Yes">Yes</option>
                                                                     <option value="No">No</option>
                                                                  </select>
                                                               </div>
                                                               <span class="bt-flabels__error-desc_select">Required</span>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-1"></div>
                                                   <label class="col-md-2 control-label">Law Enforcement</label>
                                                   <div class="col-md-2">
                                                      <div class="radio-list">
                                                         <c:choose>
                                                            <c:when test="${riskDataJson.isLawEnforcement}">
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" checked="checked" value="true" name="kycSubjectReview.isLawEnforcement"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="false" name="kycSubjectReview.isLawEnforcement"> No </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" value="true" name="kycSubjectReview.isLawEnforcement"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="false" name="kycSubjectReview.isLawEnforcement"> No </label>
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-2 hidden">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="lawEnforcementRiskLevel" class="form-control select2me" data-parsley-required="true"  data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value="Yes">Yes</option>
                                                                     <option value="No">No</option>
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
                                                            <c:when test="${riskDataJson.isSanctionRisk}">
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="true" name="kycSubjectReview.isSanctionRisk"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="false" name="kycSubjectReview.isSanctionRisk"> No </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="true" name="kycSubjectReview.isSanctionRisk"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="false" name="kycSubjectReview.isSanctionRisk"> No </label>
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-2 hidden">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="sanctionsRiskLevel" class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value="Yes">Yes</option>
                                                                     <option value="No">No</option>
                                                                  </select>
                                                               </div>
                                                               <span class="bt-flabels__error-desc_select">Required</span>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-1"></div>
                                                   <label class="col-md-2 control-label">Regulatory Enforcement</label>
                                                   <div class="col-md-2">
                                                      <div class="radio-list">
                                                         <c:choose>
                                                            <c:when test="${riskDataJson.isRegulatoryEnforcement}">
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" checked="checked" value="true" name="kycSubjectReview.isRegulatoryEnforcement"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="false" name="kycSubjectReview.isRegulatoryEnforcement"> No </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" value="true" name="kycSubjectReview.isLawEnforcement"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="false" name="kycSubjectReview.isRegulatoryEnforcement"> No </label>
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-2 hidden">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="regulatoryEnforcementRiskLevel" class="form-control select2me" data-parsley-required="true"  data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value="Yes">Yes</option>
                                                                     <option value="No">No</option>
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
                                                   <label class="col-md-2 control-label"> Negative Media</label>
                                                   <div class="col-md-2">
                                                      <div class="radio-list">
                                                         <c:choose>
                                                            <c:when test="${riskDataJson.isActivitiesRisk}">
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="true" name="kycSubjectReview.isActivitiesRisk"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="false" name="kycSubjectReview.isActivitiesRisk"> No </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="true" name="kycSubjectReview.isActivitiesRisk"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="false" name="kycSubjectReview.isActivitiesRisk"> No </label>
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-2 hidden">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="activitiesRiskLevel" class="form-control select2me" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value="Yes">Yes</option>
                                                                     <option value="No">No</option>
                                                                  </select>
                                                               </div>
                                                               <span class="bt-flabels__error-desc_select">Required</span>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-1"></div>
                                                   <label class="col-md-2 control-label">Other Bodies</label>
                                                   <div class="col-md-2">
                                                      <div class="radio-list">
                                                         <c:choose>
                                                            <c:when test="${riskDataJson.isOtherBodies}">
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" checked="checked" value="true" name="kycSubjectReview.isOtherBodies"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" value="false" name="kycSubjectReview.isOtherBodies"> No </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                               <label class="radio-inline "> <input class="riskElement" type="radio" value="true" name="kycSubjectReview.isOtherBodies"> Yes </label>
                                                               <label class="radio-inline"> <input class="riskElement" type="radio" checked="checked" value="false" name="kycSubjectReview.isOtherBodies"> No </label>
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </div>
                                                   </div>
                                                   <div class="col-md-2 hidden">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="otherBodiesRiskLevel" class="form-control select2me" data-parsley-required="true"  data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value="Yes">Yes</option>
                                                                     <option value="No">No</option>
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
                                                   <div class="col-md-2">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="countryRiskLevel" name="kycSubjectReview.countryRiskLevel" class="form-control select2me riskElement" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value=""></option>
                                                                     <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
                                                                        <c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
                                                                           <option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</option>
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
                                                   <div class="col-md-2">
                                                      <div class="bt-form__wrapper">
                                                         <div class="form-group uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <label class="parsley_hide">Risk Level</label>
                                                               <div class="field-background">
                                                                  <select id="totalRiskLevel" name="kycSubjectReview.totalRiskLevel" class="form-control select2me riskElement" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
                                                                     <option value=""></option>
                                                                     <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
                                                                        <c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
                                                                           <option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</option>
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
                                 <hr>
                                 <div class="col-md-12" align="center">
                                    <a href="#" onclick="showHideTabpane(1); _paq.push(['trackEvent', 'KYCSubject', 'Back','Back to previous tab']);" class="btn-itg btn default button-previous"><img src="/digiKYC/assets/global/img/backward.png" /> Back </a>
                                    <a href="#" onclick="showHideTabpane(3); _paq.push(['trackEvent', 'KYCSubject', 'Continue','Continue to next tab']);" class="btn-itg btn blue button-next grey-gallery" id="btnContinue"> Continue <img src="/digiKYC/assets/global/img/forward.png" /></a>
                                 </div>
                                 <div class="clearfix margin-bottom-10"></div>
                              </div>
                              <!-- End Tab2 -->
                              <div class="tab-pane tab_pane" id="tab3">
                                 <div class="row">
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
                                             <label class="noteLabel typeOfCounterpartyName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Residency :</label> 
                                             <label class="noteLabel countryOfResidencyName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Birth :</label> 
                                             <label class="noteLabel countryOfBirthName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Citizenship :</label> 
											 <label class="noteLabel countryOfCitizenshipName"></label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">First Name :</label> 
                                             <label class="noteLabel doc-name-align firstName"></label>
                                             <br>
                                             <label class="noteLabel bold">Middle Name :</label> 
                                             <label class="noteLabel doc-name-align middleName"></label>						
                                             <br>
                                             <label class="noteLabel bold">Last Name :</label> 
                                             <label class="noteLabel doc-name-align lastName"></label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">Country Risk :</label>
                                             <label class="noteLabel">
                                             <span class="text-warning tm_CountryRiskLevel"></span>
                                             </label>
                                             <br>
                                             <label class="noteLabel bold">Total Risk Level :</label>
                                             <label class="noteLabel"> 
                                             <span class="text-warning tm_TotalRiskLevel"></span>
                                             </label>
                                             <br>
                                             <label class="noteLabel"> 
                                             <span class="text-warning info_mitigationTab"></span>
                                             </label>
                                             <br>
                                             <label class="noteLabel bold" style="display:none">PEP :</label>
                                             <label class="noteLabel" style="display:none">
                                             <span class="text-warning" id="tm_isPepRisk"></span>
                                             <span class="text-warning" id="tm_PepRiskLevel"></span>
                                             </label>
                                             <br>
                                             <label class="noteLabel bold" style="display:none">Sanctions :</label>
                                             <label class="noteLabel" style="display:none">
                                             <span class="text-warning" id="tm_isSanctionsRisk"></span>
                                             <span class="text-warning" id="tm_SanctionsRiskLevel"></span>	
                                             </label>
                                             <br>
                                             <label class="noteLabel bold" style="display:none">Negative Media :</label>
                                             <label class="noteLabel" style="display:none">
                                             <span class="text-warning" id="tm_isActivitiesRisk"></span>
                                             <span class="text-warning" id="tm_ActivitiesRiskLevel"></span>
                                             </label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="clearfix margin-bottom-10"></div>
                                 <div class="portlet">
                                    <div class="portlet-body form">
                                       <div class="form-body">
                                          <div class='row' id='noTemplateDiv' style='display:none;'>
                                             <div class='col-md-12'>
                                                <div><font color='red'><i class='fa fa-warning'></i>&nbsp;No active template !</font></div>
                                             </div>
                                          </div>
                                          <div class='row' id='kycTemplate' style='display:none;'>
                                             <div class='col-md-12'>
                                                <h3 class="form-section">Template Name: <span class="text-warning" id="templateNameDiv"></span></h3>
                                                <span class="inCompleteDocumentMsg" style="display:none;"><label class="error" style="display: inline-block;">Please attach at least one document for each proof.</label></span>
                                             </div>
                                          </div>
                                          <div id="templateDiv"></div>
                                          <hr>
                                          <div class="row">
                                          	<div class='col-md-2'>
                                          		<button type='button' class='btn-itg-file btn btn-sm grey-gallery' id='btnAddDocument'> <i class='fa fa-plus'></i>&nbsp;Additional Document</button>
                                          	</div>
                                          </div>
                                          <div id='main_document_section'></div>
                                          <c:if test="${instanceName == 'FCH'}">
                                          	  <div class="pull-right">
		                                       	  <div class='row' id='requestDocumentDiv' style='display:block;'>
		                                             <div class='col-md-2'>
		                                                <button type="button" class="btn-itg-file btn btn-sm grey-gallery" id="btnrequestDocument">&nbsp;Request Document</button>
		                                             </div>
		                                          </div>
		                                      </div>
                                          </c:if>
                                       </div>
                                    </div>
                                 </div>
                                 <hr>
                                 <div class="clearfix margin-bottom-10"></div>
                                 <div class="col-md-12" align="center">
                                    <a href="#" onclick="showHideTabpane(2); _paq.push(['trackEvent', 'KYCSubject', 'Back','Back to previous tab']);" class="btn-itg btn default button-previous"><img src='/digiKYC/assets/global/img/backward.png' /> Back </a>
                                    <a href="#" onclick="showHideTabpane(4); _paq.push(['trackEvent', 'KYCSubject', 'Continue','Continue to next tab']);" class="btn-itg btn blue button-next grey-gallery" id="btnContinueMitigation"> Continue <img src='/digiKYC/assets/global/img/forward.png' /></a>
                                 </div>
                                 <div class="clearfix margin-bottom-10"></div>
                              </div>
                              <!-- End Tab3 -->
                              <div class="tab-pane tab_pane" id="tab4">
                                 <div class="row">
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
                                             <label class="noteLabel typeOfCounterpartyName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Residency :</label> 
                                             <label class="noteLabel countryOfResidencyName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Birth :</label> 
                                             <label class="noteLabel countryOfBirthName"></label>
                                             <br>
                                             <label class="noteLabel bold">Country of Citizenship :</label> 
											 <label class="noteLabel countryOfCitizenshipName"></label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">First Name :</label> 
                                             <label class="noteLabel doc-name-align firstName"></label>
                                             <br>
                                             <label class="noteLabel bold">Middle Name :</label> 
                                             <label class="noteLabel doc-name-align middleName"></label>						
                                             <br>
                                             <label class="noteLabel bold">Last Name :</label> 
                                             <label class="noteLabel doc-name-align lastName"></label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="note note-grey-gallery">
                                          <p>
                                             <label class="noteLabel bold">Country Risk :</label>
                                             <label class="noteLabel">
                                             <span class="text-warning tm_CountryRiskLevel"></span>
                                             </label>
                                             <br>
                                             <label class="noteLabel bold">Total Risk Level :</label>
                                             <label class="noteLabel"> 
                                             <span class="text-warning tm_TotalRiskLevel"></span>
                                             </label>
                                             <br>
                                             <label class="noteLabel bold" style="display:none">PEP :</label>
                                             <label class="noteLabel" style="display:none">
                                             <span class="text-warning" id="tm_isPepRisk"></span>
                                             <span class="text-warning" id="tm_PepRiskLevel"></span>
                                             </label>
                                             <br>
                                             <label class="noteLabel bold" style="display:none">Sanctions :</label>
                                             <label class="noteLabel" style="display:none">
                                             <span class="text-warning" id="tm_isSanctionsRisk"></span>
                                             <span class="text-warning" id="tm_SanctionsRiskLevel"></span>	
                                             </label>
                                             <br>
                                             <label class="noteLabel bold" style="display:none">Negative Media :</label>
                                             <label class="noteLabel" style="display:none">
                                             <span class="text-warning" id="tm_isActivitiesRisk"></span>
                                             <span class="text-warning" id="tm_ActivitiesRiskLevel"></span>
                                             </label>
                                             <br>
                                          </p>
                                       </div>
                                    </div>
                                 </div>
                                 <!-- End Row -->
                                 <div class="row"><hr></div>
                                 	
                                 	<div id="activitySection">
                                 		<c:if test="${kycSubjectBO.mitigation.id != null && kycSubjectBO.mitigation.id ne ''}">
                                 			<form:hidden path="mitigation.id"/>
                                		</c:if>
                                		<c:set var="activityListCount" value="${0}" />
                                		<c:choose>
											<c:when test="${kycSubjectBO.mitigation == null || kycSubjectBO.mitigation.mitigationActivityList.size() == 0}">
												<div class="row">
													<div class="col-md-3">
									                    <div class="bt-form__wrapper">
									                        <div class="form-group uk-width-1-1">
									                            <div class="bt-flabels__wrapper">
									                                <label class="parsley_hide">Activity Performed</label>
									                                <input type="hidden" name="mitigation.mitigationActivityList[0].activityId" value= "0"/>
									                                <input type="text" name="mitigation.mitigationActivityList[0].activityPerformed" class="form-control field-background mitigation-activity" placeholder="Activity Performed" data-parsley-required="false" data-parsley-group="kycSubjectMitigationGroup" maxlength="255" />
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
										                                <textarea name="mitigation.mitigationActivityList[0].activityDescription" class="field-background mitigation-activity" data-parsley-required="false" data-parsley-group="kycSubjectMitigationGroup" placeholder="Activity Description" rows="5" style="min-width:100%;padding: 12px 0 0px 12px !important;"></textarea>
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
																		<input type="hidden" name="mitigation.mitigationActivityList[0].mitigationProofList[0].fileId" value= "0"/>
																		<input type="file" class="hidden" name="mitigation.mitigationActivityList[0].mitigationProofList[0].documentFile" id="mitigationFile_0_0" onchange="javascript:onChangeMitigationFile('0_0');" accept="${mitigationFileExtensions}">
																		<input type="text" readonly="readonly" class="form-control" name="mitigation.mitigationActivityList[0].mitigationProofList[0].documentName" id="mitigationFile0_0" placeholder="Proof/Evidence" onchange="javascript:onChangeMitigationFile('0_0');"/>
																	</div>
																</div>
															</div> 
															<div class="col-md-4">
																<button type="button" class="btn-itg-file btn btn-sm grey-gallery" id="mitigationUploadFile_0_0" value="Change" onclick="$('#mitigationFile_0_0').click()">
																	<i class="fa fa-folder-open-o"></i>&nbsp;Browse
																</button> 
																
																<button type="button" class="btn-itg-file btn btn-sm grey-gallery hidden" id="mitigationRemoveFile_0_0" value="Remove" onclick="javascript:removeMitigationOnClick('0_0');">
																	<i class="fa fa-trash"></i>
																</button>
														    </div>
														    <div class="col-md-2">
																<button type="button" class="btn-itg-file btn btn-sm grey-gallery" onclick="javascript:addMoreProof('0')" value="Add More">
																	<i class="fa fa-plus"></i> Add Proof
																</button>
														    </div>
											            </div>
												    </div>
							                
									                <div class="col-md-2">
														<button type="button" class="btn-itg-file btn btn-sm grey-gallery pull-right" id="addMoreActivity" value="Add More">
															<i class="fa fa-plus"></i>&nbsp;Add Activity
														</button> 
												    </div>
												</div>
												<!-- End Activity Row -->
												<div class="row"><div class="col-md-12"><hr></div></div>
											</c:when>
											<c:otherwise>
												<c:set var="activityListCount" value="${kycSubjectBO.mitigation.mitigationActivityList.size()}" />
												<c:forEach items="${kycSubjectBO.mitigation.mitigationActivityList}" var="mitigationObject" varStatus="activityStatus">
		                                 			<div class="row" id="activityRow_${activityStatus.index}">
		                                 				<div class="col-md-3">
										                    <div class="bt-form__wrapper">
										                        <div class="form-group uk-width-1-1">
										                            <div class="bt-flabels__wrapper">
										                                <label class="parsley_hide">Activity Performed</label>
										                                <div class="field-background">
																			<form:hidden path="mitigation.mitigationActivityList[${activityStatus.index}].activityId" value= "0"/>
										                                	<form:input type="text" path="mitigation.mitigationActivityList[${activityStatus.index}].activityPerformed" class="form-control field-background mitigation-activity" placeholder="Activity Performed" data-parsley-required="false" data-parsley-group="kycSubjectMitigationGroup" maxlength="255" />
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
										                                	<form:textarea path="mitigation.mitigationActivityList[${activityStatus.index}].activityDescription" class="field-background mitigation-activity" data-parsley-required="false" data-parsley-group="kycSubjectMitigationGroup" placeholder="Activity Description" rows="5" style="min-width:100%;padding: 12px 0 0px 12px !important;"/>
										                                	<span class="bt-flabels__error-desc">Required</span>
										                            	</div>
										                            </div>
										                        </div>
										                    </div>
										                </div>
										                
										                <div class="col-md-4" id="multiRowProof_${activityStatus.index}">
						                					<%-- <c:set var="proofListCount" value="${proofListCount + mitigationObject.mitigationProofList.size()}" /> --%>
						                					<c:forEach items="${mitigationObject.mitigationProofList}" var="mitigationProofObject" varStatus="proofStatus">
						                						<%-- <c:set var="proofListCount" value="0" />
						                						<c:if test="${proofStatus.index != 0}">
						                                 			<c:set var="proofListCount" value="${proofStatus.index}" />
						                                		</c:if> --%>
						                                		<div class="row" id="proofRow_${activityStatus.index}_${proofStatus.index}">
						                                			<div class="col-md-6">
																		<div class="bt-form__wrapper">
																			<div class="form-group uk-width-1-1">
																				<div class="bt-flabels__wrapper">
																					<label class="parsley_hide">Proof/Evidence</label>
																					<form:hidden path="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].fileId" value= "${proofStatus.index}"/>
																					<form:hidden path="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].documentId" value=""/>
																					<input type="file" class="hidden" name="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].documentFile" id="mitigationFile_${activityStatus.index}_${proofStatus.index}" onchange="javascript:onChangeMitigationFile('${activityStatus.index}_${proofStatus.index}');" accept="${mitigationFileExtensions}">
																					<form:input type="text" readonly="true" class="form-control mitigationFile_${activityStatus.index}_${proofStatus.index}" path="mitigation.mitigationActivityList[${activityStatus.index}].mitigationProofList[${proofStatus.index}].documentName" data-file-id="mitigationFile_${activityStatus.index}_${proofStatus.index}" id="mitigationFile${activityStatus.index}_${proofStatus.index}" placeholder="Proof/Evidence" onchange="javascript:onChangeMitigationFile('${activityStatus.index}_${proofStatus.index}');"/>
																				</div>
																			</div>
																		</div>
																	</div> 
																	<div class="col-md-4">
																		<button type="button" class="btn-itg-file btn btn-sm grey-gallery" id="mitigationUploadFile_${activityStatus.index}_${proofStatus.index}" value="Change" onclick="$('#mitigationFile_${activityStatus.index}_${proofStatus.index}').click()">
																			<i class="fa fa-folder-open-o"></i>&nbsp;Browse
																		</button>
																		<c:choose>
														                    <c:when test="${empty mitigationProofObject.documentName}">
														                    	<button type="button" class="btn-itg-file hidden btn btn-sm grey-gallery mitigationRemoveFile_${activityStatus.index}_${proofStatus.index}" id="mitigationRemoveFile_${activityStatus.index}_${proofStatus.index}" value="Remove" onclick="javascript:removeMitigationOnClick('${activityStatus.index}_${proofStatus.index}');">
																					<i class="fa fa-trash"></i>
																				</button>
														                    </c:when>
														                    <c:otherwise>
														                    	<button type="button" class="btn-itg-file btn btn-sm grey-gallery mitigationRemoveFile_${activityStatus.index}_${proofStatus.index}" id="mitigationRemoveFile_${activityStatus.index}_${proofStatus.index}" value="Remove" onclick="javascript:removeMitigationOnClick('${activityStatus.index}_${proofStatus.index}');">
																					<i class="fa fa-trash"></i>
																				</button>
														                    </c:otherwise>
														                 </c:choose>
																	</div>
																	
																	<c:choose>
															 			<c:when test="${proofStatus.index == 0}">
																			<div class="col-md-2">
																				<button type="button" class="btn-itg-file btn btn-sm grey-gallery" onclick="javascript:addMoreProof(${activityStatus.index})" value="Add More">
																					<i class="fa fa-plus"></i> Add Proof
																				</button>
																		    </div>
																		</c:when>
																		<c:otherwise>
																			<div class="col-md-2">
																				<button type="button" class="btn-itg btn btn-sm grey-gallery" onclick="javascript:jQuery('#proofRow_${activityStatus.index}_${proofStatus.index}').remove();" value="">
																					<img src="/digiKYC/assets/global/img/clear.png" />
																				</button>
																			</div>
																		</c:otherwise>
													 		        </c:choose>
						                                		</div>
						                                		<!-- End proofRow -->
						                					</c:forEach>
						                				</div>
						                				<!-- End multiRowProof -->
						                				<c:choose>
														    <c:when test="${activityStatus.index == 0}">
															    <div class="col-md-2">
																	<button type="button" class="btn-itg-file btn btn-sm grey-gallery pull-right" id="addMoreActivity" value="Add More">
																		<i class="fa fa-plus"></i>&nbsp;Add Activity
																	</button>
															    </div>
														    </c:when>
														    <c:otherwise>															
																<div class="col-md-2">
																	<button type="button" class="btn-itg btn btn-sm grey-gallery pull-right" onclick="javascript:jQuery('#activityRow_${activityStatus.index}').remove();" value="Remove">
																		<img src="/digiKYC/assets/global/img/clear.png" />
																	</button>
																</div>
														    </c:otherwise>
													    </c:choose>
				                                		<div class="row"><div class="col-md-12"><hr></div></div>
		                                 			</div>
		                                 			<%-- <c:if test="${activityStatus.index < kycSubjectBO.mitigation.mitigationActivityList.size()-1}">
			                                 			<div class="row"><hr></div>
			                                		</c:if> --%>
		                                 		</c:forEach>
											</c:otherwise>
										</c:choose>
                                 	</div>
                                 	<!-- End Activity Div -->
                                 	<!-- <hr> -->
                                          <div class="row">
                                             <div class="col-md-7">
                                                <label class="control-label">
                                                Do we have all the identity info that we need to satisfy the regulator of the given jurisdiction for this level of risk?
                                                </label>
                                             </div>
                                             <div class="col-md-5">
                                                <div class="radio-list">
                                                   <c:choose>
                                                      <c:when test="${kycSubjectBO.MITQ1 != '' && kycSubjectBO.MITQ1.length() > 0 && kycSubjectBO.MITQ1 != null}">
                                                         <c:if test="${kycSubjectBO.MITQ1 == 'PASS'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ1" checked="checked"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ1"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                         <c:if test="${kycSubjectBO.MITQ1 == 'FAIL'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ1"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ1" checked="checked"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                      </c:when>
                                                      <c:otherwise>
                                                         <c:if test="${kycSubjectBO.finalResult == null || kycSubjectBO.finalResult.length() == 0 || kycSubjectBO.finalResult == ''}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ1" checked="checked"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ1"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                         <c:if test="${kycSubjectBO.finalResult == 'PASS'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ1" checked="checked"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ1"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                         <c:if test="${kycSubjectBO.finalResult == 'FAIL'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ1"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ1" checked="checked"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                      </c:otherwise>
                                                   </c:choose>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="row">
                                             <div class="col-md-7">
                                                <label class="control-label">
                                                Do we have the supporting evidence (mitigants) that we need to satisfy the regulator of the given jurisdiction for this level of risk?
                                                </label>
                                             </div>
                                             <div class="col-md-5">
                                                <div class="radio-list">
                                                   <c:choose>
                                                      <c:when test="${kycSubjectBO.MITQ2 != '' && kycSubjectBO.MITQ2.length() > 0 && kycSubjectBO.MITQ2 != null}">
                                                         <c:if test="${kycSubjectBO.MITQ2 == 'PASS'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ2" checked="checked"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ2"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                         <c:if test="${kycSubjectBO.MITQ2 == 'FAIL'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ2"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ2" checked="checked"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                      </c:when>
                                                      <c:otherwise>
                                                         <c:if test="${kycSubjectBO.finalResult == null || kycSubjectBO.finalResult.length() == 0 || kycSubjectBO.finalResult == ''}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ2" checked="checked"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ2"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                         <c:if test="${kycSubjectBO.finalResult == 'PASS'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ2" checked="checked"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ2"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                         <c:if test="${kycSubjectBO.finalResult == 'FAIL'}">
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="PASS" path="MITQ2"/>
                                                               PASS
                                                            </label>
                                                            <label class="radio-inline">
                                                               <form:radiobutton class="MITQ" value="FAIL" path="MITQ2" checked="checked"/>
                                                               FAIL
                                                            </label>
                                                         </c:if>
                                                      </c:otherwise>
                                                   </c:choose>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="row">
                                             <div class="col-md-7"></div>
                                             <div class="col-md-5">
                                                <h3>
                                                   <span class="text-default">
                                                      STATUS : 
                                                      <form:hidden path="finalResult" value="PASS"/>
                                                      <c:if test="${kycSubjectBO.finalResult == '' || kycSubjectBO.finalResult.length() == 0 || kycSubjectBO.finalResult.length() == null}">
                                                         <span class="text-success PASS">[PASS]</span>
                                                         <span class="text-danger FAIL hidden">[FAIL]</span>
                                                      </c:if>
                                                      <c:if test="${kycSubjectBO.finalResult == 'PASS' && kycSubjectBO.finalResult.length() > 0}">
                                                         <span class="text-success PASS">[PASS]</span>
                                                         <span class="text-danger FAIL hidden">[FAIL]</span>
                                                      </c:if>
                                                      <c:if test="${kycSubjectBO.finalResult == 'FAIL' && kycSubjectBO.finalResult.length() > 0}">
                                                         <span class="text-success PASS hidden">[PASS]</span>
                                                         <span class="text-danger FAIL">[FAIL]</span>
                                                      </c:if>
                                                   </span>
                                                </h3>
                                             </div>
                                          </div>
                                 	<hr>
	                                <div class="col-md-12" align="center">
	                                    <a href="#" onclick="showHideTabpane(3); _paq.push(['trackEvent', 'KYCSubject', 'Back','Back to previous tab']);" class="btn-itg btn default button-previous"><img src="/digiKYC/assets/global/img/backward.png" /> Back </a>
	                                </div>
	                                <div class="clearfix margin-bottom-10"></div>
                                </div>
                                <!-- End Tab 4 -->
                           </div>
                           <!-- End tab-content -->
                        </div>
                        <!-- End form-body -->
                     </div>
                     <!-- End form-wizard -->
                     <input type="hidden" id="manualScreeningDetails" name="manualScreeningDetails"/>
                    <input type="hidden" id="relationListString" name="relationListString" value="${relationListString}"/>
                     <input type="hidden" id="screeningType" name="screeningType" value="${screeningType}" />
                     <!-- screening modal -->
                     <div id="screeningResultModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
					    <div class="modal-dialog modal-lg" style="width: 90%;">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal">&times;</button>
					                <h4 class="modal-title">Screening Requests</h4>
					            </div>
					            <div class="modal-body">
				            	    <div class="row">
					               		<div class="col-md-12">
					               			<div class="page-bar">
												<ul class="page-breadcrumb">
													<li><em><strong>Screening View Information</strong></em></li>
												</ul>
											</div>
											<div class="row">
												<div class="col-md-12">
													<c:choose>
														<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
															<label class="control-label col-md-2 bold">First Name:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblFirstName">-</p>
															</div>
															<label class="control-label col-md-2 bold">Middle Name:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblMiddleName">-</p>
															</div>
															<label class="control-label col-md-2 bold">Last Name:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblLastName">-</p>
															</div>
														</c:when>
														<c:otherwise>
															<label class="control-label col-md-2 bold">${registrationNameLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblRegistrationName">-</p>
															</div>
															<label class="control-label col-md-2 bold">${dateOfIncorpLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblDateOfIncorp">-</p>
															</div>
															<label class="control-label col-md-2 bold">${countryOfIncorpLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblCountryOfIncorp">-</p>
															</div>
														</c:otherwise>
													</c:choose>
												</div>	
											</div>
											<div class="row">
												<div class="col-md-12">
													<c:choose>
														<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
															<label class="control-label col-md-2 bold">DOB:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblDOB">-</p>
															</div>
															<label class="control-label col-md-2 bold">Country of Residence:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblCountryOfResidence">-</p>
															</div>
															<label class="control-label col-md-2 bold">Country of Citizenship:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblCountryOfCitizenship">-</p>
															</div>
														</c:when>
														<c:otherwise>
															
														</c:otherwise>
													</c:choose>
												</div>	
											</div>
											<div id="computedResultDivId">
												<div class="row">
													<div class="col-md-12">
														<label class="control-label col-md-2 bold">PEP:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedPepId">
															<p id="computedPep" class="form-control-static doc-name-align">
																-
															</p>
														</div>
														<label class="control-label col-md-2 bold">Negative Media:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedNegativeMediaId">
															<p id="computedNegativeMedia" class="form-control-static doc-name-align">
																-
															</p>
														</div>
														<label class="control-label col-md-2 bold">Sanctions:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedSanctionsId">
															<p id="computedSanctions" class="form-control-static doc-name-align">
																-
															</p>
														</div>														
														<label class="control-label col-md-2 bold">Law Enforcement:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedLawEnforcementId">
															<p id="computedLawEnforcement" class="form-control-static doc-name-align">
																-
															</p>
														</div>
														<label class="control-label col-md-2 bold">Regulatory Enforcement:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedRegulatoryEnforcementId">
															<p id="computedRegulatoryEnforcement" class="form-control-static doc-name-align">
																-
															</p>
														</div>
														<label class="control-label col-md-2 bold">Other Bodies:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedOtherBodiesId">
															<p id="computedOtherBodies" class="form-control-static doc-name-align">
																-
															</p>
														</div>
													</div>	
												</div>
												<div class="row">
													<div class="col-md-12">
														<label class="control-label col-md-2 bold">Risk Rating:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedRiskRatingId">
															<p id="computedRiskRating" class="form-control-static doc-name-align">
																-
															</p>
														</div>
														<label class="control-label col-md-2 bold">Risk Score:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedRiskScoreId">
															<p id="computedRiskScore" class="form-control-static doc-name-align">
																-
															</p>
														</div>
														<label class="control-label col-md-2 bold">Country Risk:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedCountryRiskId">
															<p id="computedCountryRisk" class="form-control-static doc-name-align">
																-
															</p>
														</div>
													</div>	
												</div>
												<div class="row">
													<div class="col-md-12">
														<label class="control-label col-md-2 bold">Selected Screening Solution:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedSelectedScreeningSolutionId">
															<p id="computedSelectedScreeningSolution" class="form-control-static doc-name-align">
																-
															</p>
														</div>
														<label class="control-label col-md-2 bold">Risk Score Calculated at:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedRiskScoreCalculatedAtId">
															<p id="computedRiskScoreCalculatedAt" class="form-control-static doc-name-align">
																-
															</p>
														</div>
													</div>	
												</div>
											</div>
											<div class="clearfix margin-bottom-10"></div>
											<div id="screeningErrorDiv"></div>
											<div class="page-bar" id="screeningResultBreadCrumId">
												<ul class="page-breadcrumb">
													<li><em><strong>Screening Result</strong></em></li>
												</ul>
											</div>
											<hr style="border-top: 1px dashed; margin-top:-20px">
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
                                     <button type="button" id="computeButton" class="btn-popup btn btn-sm grey-gallery">
                                     		<img src="/digiKYC/assets/global/img/settings.png" /> Compute Risk
                                     </button>
                                     <button type="button" id="saveScreeningRequest" class="btn-popup btn btn-sm grey-gallery">
                                     		<img src="/digiKYC/assets/global/img/submit.png" /> Save & Continue
                                     </button>
                                     <button type="button" class="btn-popup btn btn-sm" data-dismiss="modal">
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
											<div class="parsley_hide">
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
					<div id="remarkModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
					    <div class="modal-dialog modal-md">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal">&times;</button>
					                <h4 class="modal-title">Reason of edit</h4>
					            </div>
					            <div class="modal-body">
					                <div class="row">
					                    <div class="col-md-12">
				                            <div class="bt-flabels__wrapper">
				                            	<div class="uk-width-1-1">
													<div class="bt-flabels__wrapper">
						                                <label class="parsley_hide">Reason of edit</label>
						                                <form:textarea path="remark" rows="15" style="height: 140px;width: 567px;" data-parsley-required="false" data-parsley-group="RemarkGroup" placeholder="Reason of edit"></form:textarea>
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
                  </form:form>
                  <!-- End Form -->
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
                  <!-- End Remark -->
                  <div class="modal fade full-height from-right" id="AddRelationModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
                  		<div class="modal-dialog modal-md">
						    <div class="modal-content">
						        <div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Add Relation</h4>
								</div>
						        <form action="" id="legalEntityForm">
						        	<div class="modal-body">
							            <div class="row">
							            	<div class="col-md-12">
									   			<div class="">
                                                    <div class="form-group uk-width-1-1">
                                                       <div class="bt-flabels__wrapper">
                                                          <label class="">Entity</label>
                                                          <div class="">
                                                             <div id="txtLegalEntityName" class="inputField"></div>
                                                          </div>
                                                       </div>
                                                    </div>
                                                 </div>
									   		</div>
							            </div>
							            
							            <div class="row">
									   		<div class="col-md-12">
									   			<div class="form-group uk-width-1-1">
													<div class="bt-flabels__wrapper ">
														<label class="">Relation</label>
														<div class="">
															<select class="form-control select2me roleName" name="roleName" id="roleName" placeholder="Choose Relation">
																<option value=""></option>
																<c:if test="${roleMasterData != null && roleMasterData.length() > 0}">
																	<c:forEach begin="0" end="${roleMasterData.length() -1}" var="index">
																		<option value="${roleMasterData.get(index).get('LegalEntityRoleType_shortcode')}">${roleMasterData.get(index).get('Legal_Entity_Type_Name')}</option>
																	</c:forEach>
																</c:if>
															</select>
														</div>
													</div>
												</div>
									   		</div>
									   </div>
									   
									   <div class="row">
									   		<div class="col-md-6">
												<div class="form-group uk-width-1-1">
													<div class="bt-flabels__wrapper">
														<label class="">Appointment date</label>
														<div class="input-group date">
                                                            <input type="text" placeholder="Appointment date" id="appointmentDate" class="form-control datePicker form-control-inline"/>
															<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
														</div>
													</div>
												</div>
											</div>
											
											<div class="col-md-6">
												<div class="form-group uk-width-1-1">
													<div class="bt-flabels__wrapper">
														<label class="">Date of resignation</label>
														<div class="input-group date">
                                                            <input type="text" placeholder="Date of resignation" id="resignationDate" class="form-control datePicker form-control-inline"/>
															<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
														</div>
													</div>
												</div>
											</div>
									   </div>
									   
							        </div>
							        <div class="modal-footer">
							            <button type="submit" class="btn-modal-cls btn btn-sm grey-gallery">
				                            <img src="/digiKYC/assets/global/img/save.png" /> Save
				                        </button>
										<button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal"><img src="/digiKYC/assets/global/img/clear.png" /> Close
				                        </button>
							        </div>
						        </form>
						    </div>
						</div>
				  </div>
				  <!-- Duplitcate records modal -->
                     <div id="duplicateRecordsModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
					    <div class="modal-dialog modal-lg" style="width: 90%;">
					        <div class="modal-content">
					            <div class="modal-header">
					            	<div class="page-bar">
										<ul class="page-breadcrumb">
											<span class="duplicateHeader">This individual likely already exists in the database, do you still want to continue ?</span>
										</ul>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
					            </div>
					            <div class="modal-body">
				            	    <div class="row">
					               		<div class="col-md-12">
											<div class="row">
												<div class="col-md-12">
													<div id='jqxWidget'>
														<div id="duplicateRecordJqxgrid"></div>
													</div>
												</div>
											</div>
										</div>
					               </div>
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn-itg btn btn-sm grey-gallery" data-dismiss="modal"> Continue <img src="/digiKYC/assets/global/img/forward.png" />
			                        </button>
					            </div>
					        </div>
					    </div>
					</div>
					<!-- End Dupilcate Records modal -->
				  
				  	<!-- Duplitcate records By referenceId modal -->
                     <div id="duplicateReferModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
					    <div class="modal-dialog modal-lg" style="width: 90%;">
					        <div class="modal-content">
					            <div class="modal-header">
					            	<div class="page-bar">
										<ul class="page-breadcrumb">
											<span class="duplicateHeader">This record already exists within the KYC application.</span>
										</ul>
									</div>
					            </div>
					            <div class="modal-body">
				            	    <div class="row">
					               		<div class="col-md-12">
											<div class="row">
												<div class="col-md-12">
													<div id='jqxWidget'>
														<div id="duplicateReferJqxgrid"></div>
													</div>
												</div>
											</div>
										</div>
					               </div>
					            </div>
					        </div>
					    </div>
					</div>
					<!-- End Dupilcate Records By referenceId modal -->
               </div>
            </div>
         </div>
      </div>
      <!-- End Row -->
   </div>
   <!-- End page-content-->
   <textarea id="isDashboardRequestId" style="display: none;">${isDashboardRequest}</textarea>
   <textarea id="riskDataJson" style="display: none;">${screeningData}</textarea>
   <textarea id="proofList" style="display: none;">${proofList}</textarea>
   <div class="clearfix margin-bottom-10"></div>
</div>
<!-- End page-content-wrapper-->
<script src="${contextPath}/master/kycSubject/kycSubjectEdit.js" type="text/javascript"></script>
<script>

	var dataSource = [];
	$(document).ready(function () {
		// source
		var source = {
			datatype: "json",
	        datafields: [
	            { name: 'LegalEntity_shortcode', type: 'string' },
	            { name: 'ClientEntityName', type: 'string' }
	        ],
			url	: $("#commonContextPathId").val() +"/kyc/subject/fetchLegalEntity"
		};
		// data adapter
		var dataAdapter = new jQuery.jqx.dataAdapter(source, {
			formatData: function (data) {
				if (jQuery('#txtLegalEntityName').jqxComboBox('searchString') != undefined) {
					data.query = jQuery('#txtLegalEntityName').jqxComboBox('searchString');
					return data;
				}
			}
		});
		// comboBox
		jQuery('#txtLegalEntityName').jqxComboBox({
			width	: '100%',
			height	: 40,
			source	: dataAdapter,
			remoteAutoComplete	: true,
	        autoDropDownHeight: false,
			selectedIndex		: 0,
			placeHolder	: 'Enter Entity',
			displayMember	: 'ClientEntityName',
			valueMember	: 'LegalEntity_shortcode',
			renderer: function (index, label, value) {
				dataSource = dataAdapter.loadedData;
				var item = dataAdapter.records[index];
				if (item != null) {
					var label = item.ClientEntityName;
					return label;
				}
				return '';
			},
			renderSelectedItem: function(index, item) {
				var item = dataAdapter.records[index];
				if (item != null) {
					var label = item.ClientEntityName;
					return label;
				}
				return '';  
			},
			search: function (searchString) {
				dataAdapter.dataBind();
			}
		});
		
		$("#legalEntityForm").validate({
			submitHandler: function(){
				
				var checkFlag = false;
				
				if($('#txtLegalEntityName').val()==""){
	        		$('#txtLegalEntityName').after('<label for="roleName" class="error" style="display: inline-block;">This field is required.</label>')
	        		checkFlag = true;
	        	}
	        	
	        	if($('#roleName').val()==""){
	        		$('#roleName').after('<label for="roleName" class="error" style="display: inline-block;">This field is required.</label>')
	        		checkFlag = true;
	        	}
	        	
	        	if($('#appointmentDate').val()==""){
	        		$('#appointmentDate').after('<label for="roleName" class="error" style="display: inline-block;">This field is required.</label>')
	        		checkFlag = true;
	        	}
	        	
	        	if(checkFlag)
					return false;
	        	
	        	var item = $('#txtLegalEntityName').jqxComboBox('getSelectedItem');
	        	var datarow = {};
                
	        	if(item != null){
                	var legalEntityName = item.label;
                    var legalEntityCode = item.value;
                    for(var i=0;i<dataSource.length;i++){
    	        		var data = dataSource[i];
    	        		if(legalEntityCode==data.LegalEntity_shortcode){
    	        			datarow = {jurisdictionCode:data.REF_ServicingJurisdictioncode,jurisdictionName:data.Jurisdiction,legalEntityCode:data.LegalEntity_shortcode,legalEntityName:data.ClientEntityName,clientName:data.ClientName,clientShortcode:data.FK_ClientID};
    	        		}
    	        	}
                }else{
                	var data = $('#grid').jqxGrid('getrowdata', updateRowindex);
                	datarow = {jurisdictionCode:data.jurisdictionCode,jurisdictionName:data.jurisdictionName,legalEntityCode:data.legalEntityCode,legalEntityName:data.legalEntityName,clientName:data.clientName,clientShortcode:data.clientShortcode};
                }
	        	
	        	datarow.roleCode = $("#roleName").val();
	        	datarow.roleName = $("#roleName option:selected").text();
    			datarow.appointmentDate = $("#appointmentDate").val();
    			datarow.resignationDate = $("#resignationDate").val();
    			datarow.action = '<a class="btn btn-xs tooltips" id="btnEditRelation" title="Edit"><img src="/digiKYC/assets/global/img/edit.png"></a>';
    			
    			if(updateFlag){
    				var data = $('#grid').jqxGrid('getrowdata', updateRowindex);
    				if(data.hasOwnProperty("relationId") && data.relationId != "" && data.relationId != undefined)
    					datarow.relationId = data.relationId;
    				$('#grid').jqxGrid('updaterow', updateRowindex, datarow);
    			}else {
    				$("#grid").jqxGrid('addrow', null, datarow);
    				$(".inCompleteRelationMsg").css({"display": "none"});
        		}
        		
    			_paq.push(['trackEvent', 'KYCSubject', 'SaveRelation', 'Saving relation in KYC subject.']);
    			$("#AddRelationModal").modal("hide");
	        }
	    });
		
		var updateFlag = false;
		var updateRowindex = 0;
		$(document).on('click','#btnEditRelation',function(){
			_paq.push(['trackEvent', 'KYCSubject', 'EditRelation', 'Editing relation in KYC Subject.']);
			updateFlag = true;
			updateRowindex = $("#grid").jqxGrid('getselectedrowindex');
			var data = $('#grid').jqxGrid('getrowdata', updateRowindex);
			$("#txtLegalEntityName").jqxComboBox('clear');
			$("#txtLegalEntityName").val(data.legalEntityName);
			$("#roleName").select2("val", data.roleCode);
			$("#appointmentDate").val(new Date(data.appointmentDate).toLocaleDateString());
			if(data.resignationDate!="" && data.resignationDate != undefined && data.resignationDate != 'undefined')
				$("#resignationDate").val(new Date(data.resignationDate).toLocaleDateString());
			$("#AddRelationModal").modal("show");
			dataSource = [];
		});
		
		$("#addrowbutton").on('click', function () {
			_paq.push(['trackEvent', 'KYCSubject', 'AddRelation', 'Adding relation in KYC Subject.']);
			updateFlag = false;
			$("#txtLegalEntityName").jqxComboBox('clearSelection'); 
			$("#roleName").select2("val", "");
		    $("#AddRelationModal").modal("show");
		    
		    var today = new Date();
		    var dd = today.getDate();
		    var mm = today.getMonth()+1; 
		    var yyyy = today.getFullYear();
		    if(dd<10) 
		        dd='0'+dd;
		    if(mm<10) 
		        mm='0'+mm;
		    today = mm+'/'+dd+'/'+yyyy;
		    $("#appointmentDate").val(today);
		    
		    $("#resignationDate").val("");
		    dataSource = [];
		});
	});
	
	jQuery(document).ready(function() {
	    $(document).on("input", "#telephoneNumber", function() {
	        var self = $(this);
	        self.val(self.val().replace(/[^0-9\-]/g, ''));
	    });
	
	    var countryRiskLevel = "${countryRiskLevel}";
	    var totalRiskLevel = "${totalRiskLevel}";
	    $("#countryRiskLevel").val(countryRiskLevel);
	    $("#totalRiskLevel").val(totalRiskLevel);
	
	    var finalResult = "${kycSubjectBO.finalResult}";
	    $("#finalResult").val(finalResult);
	    $('.PASS').addClass('hidden');
	    $('.FAIL').removeClass('hidden');
	    if (finalResult == "PASS") {
	        $('.PASS').removeClass('hidden');
	        $('.FAIL').addClass('hidden');
	    }
	
	    try {
	        var existingActivityCount = ${activityListCount};
	
	        if (existingActivityCount > 0)
	            activityRowCount = existingActivityCount - 1;
	    } catch (err) {
	        console.log(err.message);
	    }
	
	    var oldRelation = ${relationListString};
	    try{
	    	$.each(oldRelation, function(index, relationObject) {
	    		relationObject.action = '<a class="btn btn-xs tooltips" id="btnEditRelation" title="Edit"><img src="/digiKYC/assets/global/img/edit.png"></a>';
		    });
	    }catch(err){
	    	console.log(err.message);
	    }
	    var gridSource = {
	        datatype: "array",
	        localdata: oldRelation,
	        datafields: [
				{name: 'relationId',type: 'string'},
				{name: 'jurisdictionCode',type: 'string'},
	            {name: 'legalEntityCode',type: 'string'},
	            {name: 'roleCode',type: 'string'},
	            { name: 'legalEntityName', type: 'string'},
				{ name: 'jurisdictionName', type: 'string'},
				{ name: 'roleName', type: 'string'},
				{ name: 'appointmentDate', type: 'string'},
				{ name: 'resignationDate', type: 'string'},
				{ name: 'clientName', type: 'string'},
				{ name: 'clientShortcode', type: 'string'},
				{ name: 'action', type: 'string'}
	        ]
	    };
	
	    var gridAdapter = new $.jqx.dataAdapter(gridSource);
	
	    $("#grid").jqxGrid({
	        width: '100%',
	        showtoolbar: true,
	        source: gridAdapter,
	        //editable: true,
	        sortable: true,
	        pageable: true,
	        autoheight: true,
	        rowsheight: 50,
	        columnsresize: true,
	        enabletooltips: true,
	        theme: 'ITGtheme',
	        rendertoolbar: function(toolbar) {
	            var me = this;
	            var container = $("<div style='margin: 5px;'></div>");
	            toolbar.append(container);
	            $("#addrowbutton").jqxButton();
	            $("#deleterowbutton").jqxButton();
	
	            // delete row.
	            $("#deleterowbutton").on('click', function() {
	            	_paq.push(['trackEvent', 'KYCSubject', 'DeleteRelation', 'Deleting relation from KYC Subject.']);
	                var selectedrowindex = $("#grid").jqxGrid('getselectedrowindex');
	                var rowscount = $("#grid").jqxGrid('getdatainformation').rowscount;
	                if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
	                    var id = $("#grid").jqxGrid('getrowid', selectedrowindex);
	                    var commit = $("#grid").jqxGrid('deleterow', id);
	                    _paq.push(['trackEvent', 'KYCSubject', 'DeleteRelation','Deleting relation']);
	                }
	            });
	        },
	        columns: [
				{ text: 'Legal Entity', datafield: 'legalEntityCode', displayfield: 'legalEntityName',filtertype: 'input', width: '25%', align: 'left'},
				{ text: 'Jurisdiction Name', datafield: 'jurisdictionCode', displayfield: 'jurisdictionName',filtertype: 'input', width: '18%', align: 'left'},
				{ text: 'Relation', datafield: 'roleCode', displayfield: 'roleName',filtertype: 'input', width: '25%', align: 'left'},
				{ text: 'Appointment Date',	datafield: 'appointmentDate', filtertype: 'input', width: '12%', align: 'left'},
				{ text: 'Date of Resignation',	datafield: 'resignationDate', filtertype: 'input', width: '12%', align: 'left'},
				{ text: 'Action', datafield: 'action', width: '8%', align: 'left'}
	        ]
	    });

	    if(oldRelation.length === 0) {
	    	existRelation = false;
	    	$(".inCompleteRelationMsg").css({"display": "block"});
		}
	    else {
	    	existRelation = true;
		}
		
	    $("#sourceOfWealth").attr("data-parsley-required", true);
	    $("#residentialAddress").attr("data-parsley-required", true);
	    $("#stateCity").attr("data-parsley-required", true);
	    $("#zipCode").attr("data-parsley-required", true);
	    $("#countryOfResidencyCode").attr("data-parsley-required", true);
	    $("#emailAddress").attr("data-parsley-required", true);
	    $("#telephoneNumber").attr("data-parsley-required", true);
	    
		$('#frm').parsley().validate("kycSubjectGroup");
	});

	function getViewPage(id) {
		_paq.push(['trackEvent', 'KYCSubject', 'View','Viewing subject']);
		window.open("${contextPath}/kyc/subject/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
	
	function getEditPage(contextPath, id) {
		_paq.push(['trackEvent', 'KYCSubject', 'Edit','Editing subject']);
		$('#frm').parsley().destroy();
		$('#frm').attr("action", contextPath + "/kyc/subject/editPage");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="subjectId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	}
</script>