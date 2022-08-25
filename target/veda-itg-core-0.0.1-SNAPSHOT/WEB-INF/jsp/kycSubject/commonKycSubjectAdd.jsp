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
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="jurisdictionShortCode" value="<%= ITGConstant.JURISDICTION_SHORT_CODE%>" />
<c:set var="countryShortCode" value="<%= ITGConstant.COUNTRY_SHORT_CODE%>" />
<c:set var="countryName" value="<%= ITGConstant.COUNTRY_NAME%>" />
<c:set var="nationalityShortCode" value="<%= ITGConstant.NATIONALITY_SHORT_CODE%>" />
<c:set var="nationalityName" value="<%= ITGConstant.NATIONALITY_NAME%>" />
<c:set var="genderShortCode" value="<%= ITGConstant.GENDER_SHORT_CODE%>" />
<c:set var="genderName" value="<%= ITGConstant.GENDER_NAME%>" />
<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />
<c:set var="maxLength15" value="<%= ITGConstant.MAX_LENGTH_15%>" />
<c:set var="maxLength20" value="<%= ITGConstant.MAX_LENGTH_20%>" />
<c:set var="maxLength500" value="<%= ITGConstant.MAX_LENGTH_500%>" />
<spring:message code="kycSubject.registrationName.label" var="registrationNameLabel" />
<spring:message code="kycSubject.registrationNumber.label" var="registrationNumberLabel" />
<spring:message code="kycSubject.dateOfIncorp.label" var="dateOfIncorpLabel" />
<spring:message code="kycSubject.countryOfIncorp.label" var="countryOfIncorpLabel" />
<spring:message code="kycSubject.address.label" var="addressLabel" />
<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />
<spring:message code="submit.label" var="submitLabel" />
<spring:message code="save.label" var="saveLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="kycSubject.firstName.label" var="firstNameLabel" />
<spring:message code="kycSubject.middleName.label" var="middleNameLabel" />
<spring:message code="kycSubject.givenName.label" var="givenNameLabel" />
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
<spring:message code="cancel.label" var="cancelLabel" />
<input type="hidden" id="contextPathId" value="${contextPath}" />

<spring:message code="kycSubject.proofDocument.file.extensions" var="proofDocumentFileExtensions" />
<spring:message code="kycSubject.mitigation.file.extensions" var="mitigationFileExtensions" />
<input type="hidden" value="${proofDocumentFileExtensions}" id="proofDocumentFileExtensionsId" />
<input type="hidden" value="${mitigationFileExtensions}" id="mitigationFileExtensionsId" />

<spring:message code="kycSubject.viewOtherDetailsLabel.label" var="viewOtherDetailsLabel" />
<spring:message code="kycSubject.exemptCategory.label" var="exemptCatLabel" />

<spring:message code="app.isRelationList" var="isRelationList" />
<spring:message code="app.isExemptCategory" var="exemptCategory" />
<spring:message code="app.isRequestDocument" var="isRequestDocument" />
<spring:message code="app.isOtherDetails" var="isOtherDetails" />
<spring:message code="app.isGivenName" var="isGivenName" />
<spring:message code="app.isFieldBackground" var="isFieldBackground" />
<spring:message code="app.isShowMitigatedRisk" var="isShowMitigatedRisk" />
<spring:message code="app.isMitigationWorkflow" var="isMitigationWorkflow" />
<spring:message code="ocrServiceHostPort" var="ocrServiceHostPort" />

<!--Flags for drop down menu -->
<spring:message code="app.isSubTypeOfCounterparty" var="isSubTypeOfCounterparty" />
<spring:message code="app.isCountryOfNationality" var="isCountryOfNationality" />

<!--Flags for Document Bypass Checkbox -->
<spring:message code="kycSubject.isDocumentConfigCheckBox.label" var="isDocumentConfigCheckBoxLabel" />
<spring:message code="kycSubject.isDocumentConfigCheckBoxBy.label" var="isDocumentConfigCheckBoxByLabel" />
<spring:message code="kycSubject.isDocumentConfigCheckBoxDate.label" var="isDocumentConfigCheckBoxDateLabel" />

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

.zoomInOutRefresh {
    width: 30px;
    height: 30px;
    border: 1px solid #E5E5E5;
    box-sizing: border-box;
    border-radius: 4px !important;
    margin: 0px 3px;
}
.ocrTextSpan {
    position: absolute;
    top: 15px;
    font-family: Ubuntu;
    font-style: normal;
    font-weight: 300;
    font-size: 12px;
    right: 20px;
    line-height: 14px;
    color: rgba(0, 0, 0, 0.5);
}
.ui-datepicker { position: relative; z-index: 999999 !important; }

.kyc-profile-lookup {
	font-family: ScopeOne-Regular;
    font-style: normal;
    font-weight: normal;
    font-size: 25px;
    line-height: 56px;
    color: #000000;
}

.kyc-type {padding-left: 17px;}

.kyc-radio-type {padding-left: 12px;}

.jqx-tooltip-text {
    color: #ffffff;
    background-color: #312783;
}

.disable-click{
    pointer-events:none;
}
</style>
<div class="page-content-wrapper">
   <div class="page-content">
      <div class="page-bar search-page-bar">
         <ul class="page-breadcrumb pull-right">
            <li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
            <li><a class="cancel redirect-kyc/subject/search"> KYC Subjects <i class="fa fa-angle-right"></i></a></li>
            <li>Add</li>
         </ul>
         <!-- <h4>&nbsp;KYC Subject</h4> -->
         <span class="header-scope">KYC Subject</span>
         
      </div>
      <div class="row">
         <div class="col-md-12">
            <div class="portlet-body form">
               <div class="pull-right">
                  <button type="button" id="saveButton" disabled="disabled" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/submit.png" /> ${submitLabel}
                  </button>
                   <button type="button" id="saveKycButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/save.png" /> ${saveLabel}
                  </button>
                  <button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel}
                  </button>
                  <div class="clearfix margin-bottom-5"></div>
               </div>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div class="portlet" id="form_wizard_1">
               <div class="portlet-body form">
                  <form:form id="frm" class="form-horizontal uk-form bt-flabels js-flabels" action="${contextPath}/kyc/subject/reviewAdd" role="form" method="POST" modelAttribute="kycSubjectBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true" enctype="multipart/form-data">
                     <input type="hidden" id="subjectId" value="${kycSubjectBO.id}" />
                     <input type="hidden" id="subjectRequestNo" value="${kycSubjectBO.kycSubjectRequestNo}" />
                     <input type="hidden" id="consentLabel" value="${userConsentLabel}" />
                     <input type="hidden" id="userName" value="${userName}" />
                     <input type="hidden" id="instanceName" value="${instance}" />
                     <input type="hidden" id="isRequestFromNec" value="${isRequestFromNec}" />
                     <input type="hidden" id="typeOfCounterParty" value="${typeOfCounterParty}" />
                     <input type="hidden" id="isRelationList" value="${isRelationList}" />
                     <input type="hidden" id="exemptCategory" value="${exemptCategory}" />
                     <input type="hidden" id="isGivenName" value="${isGivenName}" />
                     <input type="hidden" id="ocrServiceHostPort" value="${ocrServiceHostPort}" />
                     <input type="hidden" id="isFieldBackground" value="${isFieldBackground}" />
                     <input type="hidden" id="isMitigationWorkflow" value="${isMitigationWorkflow}" />
                     <input type="hidden" id="isRequestDocument" value="${isRequestDocument}" />
                     <input type="hidden" id="isSubTypeOfCounterparty" value="${isSubTypeOfCounterparty}" />
                     <input type="hidden" id="isCountryOfNationality" value="${isCountryOfNationality}" />
                     
                     <%-- <input type='hidden' id='jurisdictionData' value='${jurisdictionData}' /> --%>
                     <textarea id="jurisdictionData" style="display:none;">${jurisdictionData}</textarea>
                     <%-- <input type='hidden' id='countryData' value='${countryData}' /> --%>
                     <textarea id="countryData" style="display:none;">${countryData}</textarea>
                     <textarea id="investorSubTypeData" style="display:none;">${investorSubTypeData}</textarea>
                     <%-- <input type='hidden' id='nationalityData' value='${nationalityData}' /> --%>
                     <textarea id="nationalityData" style="display:none;">${nationalityData}</textarea>
                     <textarea id="genderData" style="display:none;">${genderData}</textarea>
                     <textarea id="MRZCodeUrl" style="display:none;">${MRZCodeUrl}</textarea>
                     <textarea id="entitySchema" style="display:none;">${entitySchema}</textarea>
                     <textarea id="individualSchema" style="display:none;">${individualSchema}</textarea>
                     <input type="hidden" id="referenceId" name="referenceId" value="${kycSubjectBO.referenceId}"/>
                     <input type="hidden" id="subjectRequestNo" value="${kycSubjectBO.kycSubjectRequestNo}" />
                     <input type="hidden" name="manualScreening.kycSubjectId" value="${kycSubjectBO.id}" />
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
                                 <hr>
                                 <form:hidden path="kycSubjectRequestNo" value="${kycSubjectBO.kycSubjectRequestNo}"></form:hidden>
                                 <div class="form-body">
                                    <div class="row">
                                       <div class="col-md-3">
                                          <div class="bt-form__wrapper">
                                             <div class="form-group uk-width-1-1">
                                                <div class="bt-flabels__wrapper">
                                                   <label class="parsley_hide">${counterPartyTypeLabel}</label>
                                                   <div class="field-background">
                                                      <form:select path="typeOfCounterpartyCode" class="form-control select2me" data-parsley-required="true" data-parsley-group="singleForm" placeholder="${counterPartyTypeLabel}">
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
                                    </div>
                                    <!-- End Row -->
									<div class="row">
										<div class="col-md-12">
											<div id="editor"></div>
										</div>
									</div>
                                    <!-- End Row -->
                                    <div class="row">
                                       <c:if test="${isOtherDetails == 'true' && typeOfCounterParty == 'Entity' && isRequestFromNec == true}">
						                  	<div class="col-md-9 entity_class" style="float: right; display:none;">
						                  		<button type="button" data-toggle="modal" data-target="#otherDetailsModal" id="btnScreeningDetails" class="pull-right btn-itg btn btn-sm grey-gallery" ><i class="fa fa-info-circle"></i>&nbsp;${viewOtherDetailsLabel}</button>
						                  	</div>
									   </c:if>
                                    </div>
                                    <!-- End Row -->
                                    <c:if test="${isRelationList == 'true' }">
                                    	<div class="row addRelationClass" style="display:none;">
	                                        <div class="page-bar">
	                                           <ul class="page-breadcrumb">
	                                              <li><em><strong>Add Relation</strong></em></li>
	                                           </ul>
	                                        </div>
	                                      	<hr style="border-top: 1px dashed; margin-top:-20px">
	                                    </div>
	                                    <div class="row addRelationClass" style="display:none;">
	                                        <input type="button" class="btn-itg btn btn-sm grey-gallery" style="padding:0px 10px 0px 10px;" id="addrowbutton" value="Add new row" />
	                                        <input type="button" class="btn-itg btn btn-sm grey-gallery" style="padding:0px 10px 0px 10px;" id="deleterowbutton" value="Delete selected row"/>
	                                     </div>
	                                    <div class="row addRelationClass" style="display:none;">
	                                    	<div class="parsley_hide">
	                                    		<div id="grid"></div>
	                                    	</div>
	                                    </div>
                                    </c:if>
                                    <div class="clearfix margin-bottom-10"></div>
                                    <c:if test="${kycSubjectBO.consentList != null && kycSubjectBO.consentList.size() > 0}">
                                       <div class="row consentClass" style="display:none;">
                                          <div class="page-bar">
                                             <ul class="page-breadcrumb">
                                                <li><em><strong>${userConsentLabel}</strong></em></li>
                                             </ul>
                                          </div>
                                       </div>
                                       <div class="clearfix margin-bottom-10"></div>
                                       <c:forEach items="${kycSubjectBO.consentList}" var="consentObject" varStatus="consentIndex">
                                          <div class="row consentClass" style="display:none;">
                                             <div class="col-md-12">
                                                <c:choose>
                                                   <c:when test="${consentObject.isMandatory ==true}">
                                                      <div class="">
                                                         <div class="uk-width-1-1">
                                                            <div class="bt-flabels__wrapper">
                                                               <div class="row">
                                                                  <form:hidden path="consentList[${consentIndex.index}].consentId" value="${consentObject.consentId}" />
                                                                  <form:hidden path="consentList[${consentIndex.index}].consentName" value="${consentObject.consentName}" />
                                                                  <form:checkbox path="consentList[${consentIndex.index}].isConsentChecked" value="true" autocomplete="off" data-parsley-required="true" data-parsley-group="singleForm"/>
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
                                                         <form:checkbox path="consentList[${consentIndex.index}].isConsentChecked" value="true" autocomplete="off"/>
                                                         <label class="control-label">${consentObject.consentDescription}</label>
                                                      </div>
                                                   </c:otherwise>
                                                </c:choose>
                                             </div>
                                          </div>
                                          <div class="clearfix margin-bottom-10"></div>
                                       </c:forEach>
                                    </c:if>
                                    <!-- End Consent -->
                                    <div class="screeningClass" style="display:none;">	
	                                    <hr>
	                                    <div class="row">
	                                       <div class="col-md-12" align="center">
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
                                 </div>
                                 <!-- End Form Body -->
                              </div>
                              <!-- End Tab1 -->
                              <div class="tab-pane tab_pane" id="tab2">
                              	<div class="row">
                              		<div class="viewTab1"></div>
                              		<div class="viewTab2"></div>
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
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="true" name="kycSubjectReview.isPepRisk" /> 
                                                         Yes
                                                         </label> 
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="false" name="kycSubjectReview.isPepRisk" checked /> 
                                                         No
                                                         </label>
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
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="true" name="kycSubjectReview.isLawEnforcement" /> 
                                                         Yes
                                                         </label> 
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="false" name="kycSubjectReview.isLawEnforcement" checked /> 
                                                         No
                                                         </label>
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
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="true" name="kycSubjectReview.isSanctionRisk" /> 
                                                         Yes
                                                         </label> 
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="false" name="kycSubjectReview.isSanctionRisk" checked /> 
                                                         No
                                                         </label>
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
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="true" name="kycSubjectReview.isRegulatoryEnforcement" /> 
                                                         Yes
                                                         </label> 
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="false" name="kycSubjectReview.isRegulatoryEnforcement" checked /> 
                                                         No
                                                         </label>
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
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="true" name="kycSubjectReview.isActivitiesRisk" /> 
                                                         Yes
                                                         </label> 
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="false" name="kycSubjectReview.isActivitiesRisk" checked /> 
                                                         No
                                                         </label>
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
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="true" name="kycSubjectReview.isOtherBodies" /> 
                                                         Yes
                                                         </label> 
                                                         <label class="radio-inline"><input class="riskElement" type="radio" value="false" name="kycSubjectReview.isOtherBodies" checked /> 
                                                         No
                                                         </label>
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
                                                                  <select id="countryRiskLevel" class="form-control select2me riskElement" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
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
                                                                  <select id="totalRiskLevel" class="form-control select2me riskElement" data-parsley-required="true" data-parsley-group="kycSubjectReviewGroup">
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
                                    <a href="#" onclick="showHideTabpane(1)" class="btn-itg btn default button-previous"><img src="/digiKYC/assets/global/img/backward.png" /> Back </a>
                                    <a href="#" onclick="showHideTabpane(3)" class="btn-itg btn blue button-next grey-gallery" id="btnContinue"> Continue <img src="/digiKYC/assets/global/img/forward.png" /> </a>
                                 </div>
                                 <div class="clearfix margin-bottom-10"></div>
                              </div>
                              <!-- End Tab2 -->
                              <div class="tab-pane tab_pane" id="tab3">
                              	<div class="row">
                              		<div class="viewTab1"></div>
                              		<div class="viewTab2"></div>
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
                              	
                              	<%-- <c:choose>
                                 	<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
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
		                                             <label class="noteLabel bold">${countryOfBirthLabel} :</label> 
		                                             <label class="noteLabel countryOfBirthName"></label>
		                                             <br>
		                                             <c:if test="${instance == 'VEDA'}">
		                                             	<label class="noteLabel bold">Country Of Nationality :</label> 
													 	<label class="noteLabel countryOfCitizenshipName"></label>
		                                             	<br>
		                                             </c:if>
		                                             <c:if test="${instance != 'VEDA'}">
		                                             	<label class="noteLabel bold">${countryOfCitizenshipLabel} :</label> 
													 	<label class="noteLabel countryOfCitizenshipName"></label>
		                                             	<br>
		                                             </c:if>
		                                          </p>
		                                       </div>
		                                    </div>
		                                    <div class="col-md-4">
		                                       <div class="note note-grey-gallery">
		                                          <p>
		                                          	<c:choose>
														<c:when test="${instance == 'VEDA'}">
															<label class="noteLabel bold">${firstNameLabel} :</label> 
				                                            <label class="noteLabel doc-name-align firstName"></label>
				                                            <br>
				                                            <label class="noteLabel bold">${middleNameLabel} :</label> 
				                                            <label class="noteLabel doc-name-align middleName"></label>						
				                                            <br>
														</c:when>
														<c:otherwise>
															<label class="noteLabel bold">${givenNameLabel} :</label> 
				                                            <label class="noteLabel doc-name-align givenName"></label>
				                                            <br>
														</c:otherwise>
													</c:choose>
		                                             
		                                             <label class="noteLabel bold">${lastNameLabel} :</label> 
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
                                 	</c:when>
                                 	<c:otherwise>
                                 		<div class="row">
		                                    <div class="col-md-4">
		                                       <div class="note note-grey-gallery">
		                                          <p>
		                                             <label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
		                                             <label class="noteLabel typeOfCounterpartyName"></label>
		                                             <br>
		                                             <label class="noteLabel bold">${countryOfIncorpLabel} :</label> 
		                                             <label class="noteLabel countryOfIncorporationName"></label>
		                                             <br>
		                                          </p>
		                                       </div>
		                                    </div>
		                                    <div class="col-md-4">
		                                       <div class="note note-grey-gallery">
		                                          <p>
		                                             <label class="noteLabel bold">${registrationNameLabel} :</label> 
		                                             <label class="noteLabel doc-name-align registrationName"></label>
		                                             <br>
		                                             <c:if test="${instance != 'VEDA'}">
		                                             	<label class="noteLabel bold">${registrationNumberLabel} :</label> 
		                                             	<label class="noteLabel doc-name-align registrationNumber"></label>
		                                             	<br>
		                                             </c:if>
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
		                                             <label class="noteLabel bold" style="display:none">Sanctions Risk :</label>
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
                                 	</c:otherwise>
                                 </c:choose> --%>
                                 <div class="clearfix margin-bottom-10"></div>
                                 
                                 <c:if test="${documentConfigCheckBox == 'true'}">
                                 	<div class="clearfix margin-bottom-10"></div>
                           			<div class="portlet">
                                    	<div class="portlet-body form">
                                       		<div class="form-body">
												<label style="margin-left:-5px;" class="control-label">
													<form:checkbox path="isDocumentConfigCheckBox"/>
													${isDocumentConfigCheckBoxLabel}
												</label>
												<div class="clearfix margin-bottom-10"></div>
												<div class="col-md-12">
												    <div class="portlet-body">
												        <div class="abc" style="margin-left: -31px; margin-right: 157px;">
												        	<input type="hidden" id="documentConfigCheckBoxCheckedBy" name="documentConfigCheckBoxCheckedBy" value="" />
												        	<input type="hidden" id="documentConfigCheckBoxCheckedDate" name="documentConfigCheckBoxCheckedDate" value="" />
												            <div class="col-md-3"><label class="bold">${isDocumentConfigCheckBoxByLabel} :&nbsp;&nbsp;</label><label id="clickedName"></label></div>
												            <div class="col-md-3"><label class="bold">${isDocumentConfigCheckBoxDateLabel} :&nbsp;&nbsp;</label><label id="clickedTimestamp"></label></div>
												        </div>
												    </div>
												</div>
											</div>
                                		</div>
                                	</div>
                                 </c:if>
                                 
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
                              		<div class="viewTab1"></div>
                              		<div class="viewTab2"></div>
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
                              		<%-- <c:choose>
                                 	<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
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
		                                             <label class="noteLabel bold">${countryOfBirthLabel} :</label> 
		                                             <label class="noteLabel countryOfBirthName"></label>
		                                             <br>
		                                             <c:if test="${instance == 'VEDA'}">
		                                             	<label class="noteLabel bold">Country Of Nationality :</label> 
													 	<label class="noteLabel countryOfCitizenshipName"></label>
		                                             	<br>
		                                             </c:if>
		                                             <c:if test="${instance != 'VEDA'}">
		                                             	<label class="noteLabel bold">${countryOfCitizenshipLabel} :</label> 
													 	<label class="noteLabel countryOfCitizenshipName"></label>
		                                             	<br>
		                                             </c:if>
		                                          </p>
		                                       </div>
		                                    </div>
		                                    <div class="col-md-4">
		                                       <div class="note note-grey-gallery">
		                                          <p>
		                                          	<c:choose>
														<c:when test="${instance == 'VEDA'}">
															<label class="noteLabel bold">${firstNameLabel} :</label> 
				                                            <label class="noteLabel doc-name-align firstName"></label>
				                                            <br>
				                                            <label class="noteLabel bold">${middleNameLabel} :</label> 
				                                            <label class="noteLabel doc-name-align middleName"></label>						
				                                            <br>
														</c:when>
														<c:otherwise>
															<label class="noteLabel bold">${givenNameLabel} :</label> 
				                                            <label class="noteLabel doc-name-align givenName"></label>
				                                            <br>
														</c:otherwise>
													</c:choose>
		                                             
		                                             <label class="noteLabel bold">${lastNameLabel} :</label> 
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
                                 	</c:when>
                                 	<c:otherwise>
                                 		<div class="row">
		                                    <div class="col-md-4">
		                                       <div class="note note-grey-gallery">
		                                          <p>
		                                             <label class="noteLabel bold">${counterPartyTypeLabel} :</label> 
		                                             <label class="noteLabel typeOfCounterpartyName"></label>
		                                             <br>
		                                             <label class="noteLabel bold">${countryOfIncorpLabel} :</label> 
		                                             <label class="noteLabel countryOfIncorporationName"></label>
		                                             <br>
		                                          </p>
		                                       </div>
		                                    </div>
		                                    <div class="col-md-4">
		                                       <div class="note note-grey-gallery">
		                                          <p>
		                                             <label class="noteLabel bold">${registrationNameLabel} :</label> 
		                                             <label class="noteLabel doc-name-align registrationName"></label>
		                                             <br>
		                                             <c:if test="${instance != 'VEDA'}">
		                                             	<label class="noteLabel bold">${registrationNumberLabel} :</label> 
		                                             	<label class="noteLabel doc-name-align registrationNumber"></label>
		                                             	<br>
		                                             </c:if>
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
		                                             <label class="noteLabel bold" style="display:none">Sanctions Risk :</label>
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
                                 	</c:otherwise>
                                </c:choose> --%>
                                 	<!-- End Row -->
                                 	<div class="row"><hr></div>
                                 	
                                 	<div id="activitySection">
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
                                 	</div>
                                 	<!-- End Activity Div -->
                                 	<hr>
                                    <div class="row">
                                       <div class="col-md-6">
                                          <label class="control-label">
                                          Do we have all the identity info that we need to satisfy the regulator of the given jurisdiction for this level of risk?
                                          </label>
                                       </div>
                                       <div class="col-md-2">
                                          <div class="radio-list">
                                             <label class="radio-inline">
                                                <form:radiobutton class="MITQ" value="PASS" path="MITQ1" checked="checked"/>
                                                PASS
                                             </label>
                                             <label class="radio-inline">
                                                <form:radiobutton class="MITQ" value="FAIL" path="MITQ1" />
                                                FAIL
                                             </label>
                                          </div>
                                       </div>
                                       <c:if test="${isShowMitigatedRisk == 'true'}">
	                                       <div class="col-md-4">
	                                       		<div class="row">
	                                       		   <label class="col-md-4 control-label">Mitigation Risk Level</label>
			                                       <div class="col-md-5">
			                                           <div class="bt-form__wrapper">
			                                              <div class="form-group uk-width-1-1">
			                                                 <div class="bt-flabels__wrapper">
			                                                    <label class="parsley_hide">Mitigation Risk Level</label>
			                                                      <select name="mitigation.mitigationRiskLevel" id="mitigationRiskLevel" class="form-control select2me riskElement" data-parsley-required="false" data-parsley-group="kycSubjectMitigationGroup">
			                                                         <option value=""></option>
			                                                         <c:if test="${riskCategoryData != null && riskCategoryData.length() > 0}">
			                                                            <c:forEach begin="0" end="${riskCategoryData.length() -1}" var="index">
			                                                               <option value="${riskCategoryData.get(index).get(riskCategoryShortCode)}">${riskCategoryData.get(index).get(riskCategoryName)}</option>
			                                                            </c:forEach>
			                                                         </c:if>
			                                                      </select>
			                                                 </div>
			                                              </div>
			                                           </div>
			                                       </div>
	                                       		</div>
	                                       </div>
	                                   </c:if>
                                    </div>
                                    <div class="row">
                                       <div class="col-md-6">
                                          <label class="control-label">
                                          Do we have the supporting evidence (mitigants) that we need to satisfy the regulator of the given jurisdiction for this level of risk?
                                          </label>
                                       </div>
                                       <div class="col-md-2">
                                          <div class="radio-list">
                                             <label class="radio-inline">
                                                <form:radiobutton class="MITQ" value="PASS" path="MITQ2" checked="checked"/>
                                                PASS
                                             </label>
                                             <label class="radio-inline">
                                                <form:radiobutton class="MITQ" value="FAIL" path="MITQ2" />
                                                FAIL
                                             </label>
                                          </div>
                                       </div>
                                       <c:if test="${isShowMitigatedRisk == 'true'}">
	                                       <div class="col-md-3">
	                                       		<div class="bt-form__wrapper">
	                                       			<div class="form-group uk-width-1-1">
	                                       				<div class="bt-flabels__wrapper">
															<label class="parsley_hide">Mitigation Comment</label>
															<input type="text" name="mitigation.mitigationComment" id="mitigationComment" class="form-control" placeholder="Mitigation Comment" data-parsley-required="false" data-parsley-group="kycSubjectMitigationGroup"  maxlength="255" />
														</div>
													</div>
												</div>
										   </div>
									   </c:if>
                                    </div>
                                    <div class="row">
                                       <div class="col-md-6"></div>
                                       <div class="col-md-2">
                                          <h3>
                                             <span class="text-default">
                                                STATUS : 
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
                                 	<hr>
	                                <div class="col-md-12" align="center">
	                                    <a href="#" onclick="showHideTabpane(3)" class="btn-itg btn default button-previous"><img src="/digiKYC/assets/global/img/backward.png" /> Back </a>
	                                </div>
	                                <div class="clearfix margin-bottom-10"></div>
                                </div>
                                <!-- End Tab 4 -->
                              <input type="hidden" id="manualScreeningDetails" name="manualScreeningDetails"/>
                              <input type="hidden" id="relationListString" name="relationListString"/>
                              <input type="hidden" id="docRequestJsonString" name="docRequestJsonString"/>
                              <input type="hidden" id="screeningType" name="screeningType" value="${screeningType}" />
                           </div>
                           <!-- End Tab Content -->
                        </div>
                        <!-- End Form Body -->
                     </div>
                     <!-- End Form Wizard -->
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
												<div class="col-md-12 isAutoScreeningTab">
													<%-- <c:choose>
														<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
															<c:choose>
																<c:when test="${instance == 'VEDA'}">
																	<label class="control-label col-md-2 bold">${firstNameLabel}:</label>
																	<div class="col-md-2">
																		<p class="form-control-static doc-name-align" id="lblFirstName">-</p>
																	</div>
																	<label class="control-label col-md-2 bold">${middleNameLabel}:</label>
																	<div class="col-md-2">
																		<p class="form-control-static doc-name-align" id="lblMiddleName">-</p>
																	</div>
																</c:when>
																<c:otherwise>
																	<label class="control-label col-md-2 bold">${givenNameLabel}:</label>
																	<div class="col-md-2">
																		<p class="form-control-static doc-name-align" id="lblGivenName">-</p>
																	</div>
																</c:otherwise>
															</c:choose>
															
															<label class="control-label col-md-2 bold">${lastNameLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblLastName">-</p>
															</div>
														</c:when>
														<c:otherwise>
															<label class="control-label col-md-2 bold">${registrationNameLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblRegistrationName">-</p>
															</div>
															<label class="control-label col-md-2 bold">${registrationNumberLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblRegistrationNumber">-</p>
															</div>
															<label class="control-label col-md-2 bold">${countryOfIncorpLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblCountryOfIncorp">-</p>
															</div>
														</c:otherwise>
													</c:choose> --%>
												<!-- </div>	
											</div>
											<div class="row">
												<div class="col-md-12"> -->
													<%-- <c:choose>
														<c:when test="${kycSubjectBO.typeOfCounterpartyCode == 'Individual'}">
															<label class="control-label col-md-2 bold">DOB:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblDOB">-</p>
															</div>
															<label class="control-label col-md-2 bold">Country of Residence:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblCountryOfResidence">-</p>
															</div>
															<label class="control-label col-md-2 bold">${countryOfCitizenshipLabel}:</label>
															<div class="col-md-2">
																<p class="form-control-static doc-name-align" id="lblCountryOfCitizenship">-</p>
															</div>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose> --%>
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
														<label class="control-label col-md-2 bold">Country Risk:</label>
														<div class="col-md-2">
														<input type="hidden" value="" id="computedCountryRiskId">
															<p id="computedCountryRisk" class="form-control-static doc-name-align">
																-
															</p>
														</div>
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
									<button type="button" class="btn-modal-cls btn btn-sm grey-gallery" data-dismiss="modal"><img src="/digiKYC/assets/global/img/clear.png" />  Close
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
                  <!-- Add Relation Model -->
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
				  <!-- End AddRelationModal Model -->
				  
                  <!-- Duplitcate records modal -->
                   <div id="duplicateRecordsModalId" class="modal fade modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
					    <div class="modal-dialog modal-lg" style="width: 90%;">
					        <div class="modal-content">
					            <div class="modal-header">
					            	<div class="">
					            		<c:choose>
											<c:when test="${typeOfCounterParty == 'Individual'}">
												<span class="duplicateHeader">This individual likely already exists in the database, do you still want to continue ?</span>
											</c:when>
											<c:otherwise>
												<span class="duplicateHeader">This non-individual likely already exists in the database, do you still want to continue ?</span>
											</c:otherwise>
										</c:choose>
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
					            	<div class="">
										<span class="duplicateHeader">This record already exists within the KYC application.</span>
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
					                  <p class="form-control-static doc-name-align" id="kycPartyType">${kycPartyType}</p>
					               </div>
					               <div class="col-md-6">
					                  <label class="control-label col-md-6 bold">Country: </label>
					                  <c:set var="countryName" value="-" />
					                  <c:if test="${otherDetails.has('countryName') && not empty otherDetails.get('countryName')}">
					                     <c:set var="countryName" value="${otherDetails.get('countryName')}" />
					                  </c:if>
					                  <p class="form-control-static doc-name-align">${countryName}</p>
					               </div>
					            </div>
					            <!-- End Row -->
					            <div class="row">
					               <div class="col-md-6">
					                  <label class="control-label col-md-6 bold">State Or County: </label>
					                  <c:set var="stateOrCounty" value="-" />
					                  <c:if test="${otherDetails.has('stateOrCounty') && not empty otherDetails.get('stateOrCounty')}">
					                     <c:set var="stateOrCounty" value="${otherDetails.get('stateOrCounty')}" />
					                  </c:if>
					                  <p class="form-control-static doc-name-align">${stateOrCounty}</p>
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
					                  <p class="form-control-static doc-name-align" id="clubContactEmailId">${clubContactEmailId}</p>
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
					            <button type="button" class="btn-modal-cls btn btn-sm grey-gallery" data-dismiss="modal"><img src="/digiKYC/assets/global/img/clear.png" />  Close
			                    </button>
					         </div>
					      </div>
					   </div>
					</div>
					<!-- End other details modal -->
					<!-- Start Compare MRZ code Modal -->
					<div id="comparePassportModal" class="modal fade modal-md" tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" id="clsPPmodal" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="modal-title">Passport Validation</h4>
                              <h5>Please verify if Machine Readable Zone (MRZ) matches</h5>
                           </div>
                           <div class="modal-body">
                              <div id="comparePassportDiv">
                              	<label class="noteLabel bold">Uploaded Passport</label>
                              	<div style="height: 350px;border: 1px solid #dad9d9a1;">
	                              	<div class="col-md-6">
	                              		<div>
		                              		<div id="passportImgDiv" style="width: 400px; height: 315px; overflow: hidden;">
		                              			<img id="passportImg" style="width: 100%; height: 100%; cursor: move;" src="" alt="your image" />
		                              		</div>
	                              		</div>
	                              		<div align="center">
	                              			<img src="/digiKYC/assets/global/img/plus.png" id="zoomInPassport" class="zoomInOutRefresh" />
	                              			<img src="/digiKYC/assets/global/img/minus.png" id="zoomOutPassport" class="zoomInOutRefresh" />
	                              			<img src="/digiKYC/assets/global/img/rotate.png" id="rotatePassport" class="zoomInOutRefresh" onclick="rotateImage('passportImg')" />
	                              		</div>
	                              	</div>
	                              	<div class="col-md-6">
	                              		<div class="row" id="passportPopupFlds" style="height: 350px;overflow-y: auto;overflow-x: hidden;">
	                              			<div class="col-md-6">
		                              			<label class="noteLabel bold">Passport/ID Number</label>
		                              			<input type="text" class="form-control passportfields" id="pPassportNum" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Given Name(s)</label>
		                              			<input type="text" class="form-control passportfields" id="pGivenName" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Last Name(s)</label>
		                              			<input type="text" class="form-control passportfields" id="pSurname" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Gender</label>
		                              			<select class="form-control select2me passportfields" id="pGender">
	                                               <option value=""></option>
	                                               <c:if test="${genderData != null && genderData.length() > 0}">
	                                                  <c:forEach begin="0" end="${genderData.length() -1}" var="index">
	                                                     <option  value="${genderData.get(index).get(genderShortCode)}">${genderData.get(index).get(genderName)}</option>
	                                                  </c:forEach>
	                                               </c:if>
	                                            </select>
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Date Of Birth</label>
		                              			<div class="input-group" data-date-end-date="+0d">
	                                               <input type="text" class="birthDatePicker form-control form-control-inline passportfields" id="pDateOfBirth" />
	                                               <span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
	                                            </div>
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Issuing State</label>
		                              			<input type="text" class="form-control passportfields" id="pIssueState" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Country Code</label>
		                              			<select class="form-control select2me passportfields" id="pNationality">
	                                               <option value=""></option>
	                                               <c:if test="${countryData != null && countryData.length() > 0}">
														<c:forEach begin="0" end="${countryData.length() -1}" var="index">
															<option value="${countryData.get(index).get('Country_shortcode')}">${countryData.get(index).get('ISO3166_1_alpha_3')}</option>
														</c:forEach>
													</c:if>
	                                            </select>
		                              		</div>
		                              		<div class="col-md-6">
										    	<label class="noteLabel passportExpiryDate bold">Date of Expiry</label>
											    <div class="input-group date">
											        <input type="text" class="form-control datePicker form-control-inline passportfields" id="pExpiryDate">
											        <span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
												</div>
											    <label class="noteLabel passportExpiryError" style="color: #ff0000;display: none;">Passport Expired</label>
											</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Type</label>
		                              			<input type="text" class="form-control passportfields" id="pDocType" maxlength="255" />
		                              		</div>
	                              		</div>
	                              	</div>
                              	</div>
                              	<div class="row">
                              		<div class="col-md-12" id="rescreenRow" style="display: none">
                              		<div id="rescreenDiv" style="display: inline-block;background: #FFFBF3;padding: 15px;border-radius:  4px !important;">
	                              			<img src="/digiKYC/assets/global/img/needToVerify.png">
	                              			<label class="noteLabel bold" style="text-indent: 5px;">Since Details have beed edited, Subject needs to be rescreened</label>
                              		</div>
                              		<button type="button" id="reScreenBtn" class="alert-no btn btn-md btn-default" style="border: 1px solid #E5E5E5;border-radius: 4px !important;line-height: 30px;color: #000000;">Screen Passport</button>
                              		</div>
                              	</div>
                              	<div class="row">
                              		<div id="worldChkMRZDiv" class="col-md-12">
                              			<label class="noteLabel bold">World Check MRZ Code</label>
                              			<div class="col-md-12">
	                              			<input type="text" class="chk-field form-control" id="mrzLine0" maxlength="255" />
	                              		</div>
	                              		<div class="col-md-12">
	                              			<input type="text" class="chk-field form-control" id="mrzLine1" maxlength="255" />
	                              		</div>
                              		</div>
                              	</div>
                              	<div class="row">
                              		<div id="iCAOconfirmedDiv" class="col-md-12">
                              			<label class="noteLabel bold">International Civil Avialation Organisation (ICAO) Confirmation</label>
                              			<div class="col-md-12">
	                              			<input type="text" style="background: url('/digiKYC/assets/global/img/indicator.png') no-repeat scroll 10px 12px; text-indent: 15px;" class="chk-field form-control iCAOconfirmed" maxlength="255" />
	                              		</div>
                              		</div>
                              	</div>
                              	<div class="row" style="padding: 15px;">
                              		<div id="confirmationDiv" class="col-md-12">
	                              		<input type="checkbox" id="confirmationChkBox" />
	                              		<label class="noteLabel bold" style="text-indent: 5px;">MRZ from uploaded passport and from worldcheck matches.</label>
	                              		<label class="noteLabel bold" style="font-style: italic;">Note: Characters marked with * are used at the discretion of the passport issuing country and were disregarded to determine the outcome of the MRZ comparison</label>
                              		</div>
                              	</div>
                              </div>
                           </div>
                           <div class="modal-footer footerBtns">
                           	  <button type="button" id="invalidPassport" class="alert-no btn btn-sm btn-default">No, Invalid Passport</button>
                              <button type="button" id="validPassport" class="alert-yes btn btn-sm grey-gallery">Yes, Passport Verified</button>
                           </div>
                        </div>
                     </div>
                   </div>
					<!-- End Compare MRZ code Modal -->
					
					<div id="verifiedPassportModal" class="modal fade modal-md" tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="modal-title">Passport Validation</h4>
                              <h5>Please verify if Machine Readable Zone (MRZ) matches</h5>
                           </div>
                           <div class="modal-body">
                              <div id="vcomparePassportDiv">
                              	<label class="noteLabel bold">Uploaded Passport</label>
                              	<div style="height: 350px;border: 1px solid #dad9d9a1;">
	                              	<div class="col-md-6">
	                              		<div>
		                              		<div id="vpassportImgDiv" style="width: 400px; height: 315px; overflow: hidden;">
		                              			<img id="vpassportImg" style="width: 100%; height: 100%; cursor: move;" src="" alt="your image" />
		                              		</div>
	                              		</div>
	                              		<div align="center">
	                              			<img src="/digiKYC/assets/global/img/plus.png" id="vzoomInPassport" class="zoomInOutRefresh" />
	                              			<img src="/digiKYC/assets/global/img/minus.png" id="vzoomOutPassport" class="zoomInOutRefresh" />
	                              			<img src="/digiKYC/assets/global/img/rotate.png" id="vrotatePassport" class="zoomInOutRefresh" onclick="rotateImage('vpassportImg')" />
	                              		</div>
	                              	</div>
	                              	<div class="col-md-6">
	                              		<div class="row" id="vpassportPopupFlds" style="height: 350px;overflow-y: auto;overflow-x: hidden;">
	                              			<div class="col-md-6">
		                              			<label class="noteLabel bold">Passport Number</label>
		                              			<input type="text" class="form-control passportfields" id="vPassportNum" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Given Name</label>
		                              			<input type="text" class="form-control passportfields" id="vGivenName" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Surname</label>
		                              			<input type="text" class="form-control passportfields" id="vSurname" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Gender</label>
		                              			<select class="form-control select2me passportfields" id="vGender">
	                                               <option value=""></option>
	                                               <c:if test="${genderData != null && genderData.length() > 0}">
	                                                  <c:forEach begin="0" end="${genderData.length() -1}" var="index">
	                                                     <option  value="${genderData.get(index).get(genderShortCode)}">${genderData.get(index).get(genderName)}</option>
	                                                  </c:forEach>
	                                               </c:if>
	                                            </select>
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Date Of Birth</label>
		                              			<div class="input-group" data-date-end-date="+0d">
	                                               <input type="text" class="birthDatePicker form-control form-control-inline passportfields" id="vDateOfBirth" />
	                                               <span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
	                                            </div>
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Place of Issue</label>
		                              			<input type="text" class="form-control passportfields" id="vIssueState" maxlength="255" />
		                              		</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Country Code</label>
		                              			<select class="form-control select2me passportfields" id="vNationality">
	                                               <option value=""></option>
	                                               <c:if test="${countryData != null && countryData.length() > 0}">
														<c:forEach begin="0" end="${countryData.length() -1}" var="index">
															<option value="${countryData.get(index).get('Country_shortcode')}">${countryData.get(index).get('ISO3166_1_alpha_3')}</option>
														</c:forEach>
													</c:if>
	                                            </select>
		                              		</div>
		                              		<div class="col-md-6">
										    	<label class="noteLabel vpassportExpiryDate bold">Date of Expiry</label>
											    <div class="input-group date">
											        <input type="text" class="form-control datePicker form-control-inline passportfields" id="vExpiryDate">
											        <span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
												</div>
											    <label class="noteLabel vpassportExpiryError" style="color: #ff0000;display: none;">Passport Expired</label>
											</div>
		                              		<div class="col-md-6">
		                              			<label class="noteLabel bold">Type</label>
		                              			<input type="text" class="form-control passportfields" id="vDocType" maxlength="255" />
		                              		</div>
	                              		</div>
	                              	</div>
                              	</div>
                              	<div class="row">
                              		<div id="vworldChkMRZDiv" class="col-md-12">
                              			<label class="noteLabel bold">World Check MRZ Code</label>
                              			<div class="col-md-12">
	                              			<input type="text" class="chk-field form-control" id="vmrzLine0" maxlength="255" />
	                              		</div>
	                              		<div class="col-md-12">
	                              			<input type="text" class="chk-field form-control" id="vmrzLine1" maxlength="255" />
	                              		</div>
                              		</div>
                              	</div>
                              	<div class="row">
                              		<div id="viCAOconfirmedDiv" class="col-md-12">
                              			<label class="noteLabel bold">International Civil Avialation Organisation (ICAO) Confirmation</label>
                              			<div class="col-md-12">
	                              			<input type="text" style="background: url('/digiKYC/assets/global/img/indicator.png') no-repeat scroll 10px 12px; text-indent: 15px;" class="chk-field form-control viCAOconfirmed" maxlength="255" />
	                              		</div>
                              		</div>
                              	</div>
                              	<div class="row" style="padding: 15px;">
                              		<div id="vconfirmationDiv" class="col-md-12">
	                              		<input type="checkbox" id="vconfirmationChkBox" />
	                              		<label class="noteLabel bold" style="text-indent: 5px;">MRZ from uploaded passport and from worldcheck matches.</label>
	                              		<label class="noteLabel bold" style="font-style: italic;">Note: Characters marked with * are used at the discretion of the passport issuing country and were disregarded to determine the outcome of the MRZ comparison</label>
                              		</div>
                              	</div>
                              </div>
                           </div>
                        </div>
                     </div>
                   </div>
					<textarea id="jsonSchemaSampleId" style="display: none;">${jsonSchemaSample}</textarea>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<script src="${contextPath}/master/kycSubject/kycSubject.js" type="text/javascript"></script>
<script src="${contextPath}/master/kycSubject/addKycSubject.js?v=1.2" type="text/javascript"></script>
<script src="${contextPath}/common/renderer.js?v=1.1" type="text/javascript"></script>
<script src="${contextPath}/common/panzoom.js" type="text/javascript"></script>
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
    	        			datarow = {jurisdictionCode:data.REF_ServicingJurisdictioncode,jurisdictionName:data.Jurisdiction,legalEntityCode:data.LegalEntity_shortcode,legalEntityName:data.ClientEntityName,clientName:data.ClientName,clientShortcode:data.FK_ClientID, clientEntityId:data.ClientEntityID, entityType:data.EntityType};
    	        		}
    	        	}
                }else{
                	var data = $('#grid').jqxGrid('getrowdata', updateRowindex);
                	datarow = {jurisdictionCode:data.jurisdictionCode,jurisdictionName:data.jurisdictionName,legalEntityCode:data.legalEntityCode,legalEntityName:data.legalEntityName,clientName:data.clientName,clientShortcode:data.clientShortcode, clientEntityId:data.ClientEntityID, entityType:data.EntityType};
                }
	        	
	        	datarow.roleCode = $("#roleName").val();
	        	datarow.roleName = $("#roleName option:selected").text();
    			datarow.appointmentDate = getSimplifiedDate($("#appointmentDate").val());
    			datarow.resignationDate = getSimplifiedDate($("#resignationDate").val());
    			datarow.action = '<a class="btn btn-xs tooltips" id="btnEditRelation" title="Edit"><img src="/digiKYC/assets/global/img/edit.png"></a>';
    			
    			if(updateFlag)
    				$('#grid').jqxGrid('updaterow', updateRowindex, datarow);
    			else
    				$("#grid").jqxGrid('addrow', null, datarow);
    			
    			_paq.push(['trackEvent', 'KYCSubject', 'SaveRelation', 'Saved relation in KYC Subject']);
    			
    			$("#AddRelationModal").modal("hide");
	        }
	    });
	});

	var updateFlag = false;
	var updateRowindex = 0;
	$(document).on('click','#btnEditRelation',function(){
		updateFlag = true;
		_paq.push(['trackEvent', 'KYCSubject', 'EditRelation', 'Editing relation in KYC Subject.']);
		updateRowindex = $("#grid").jqxGrid('getselectedrowindex');
		var data = $('#grid').jqxGrid('getrowdata', updateRowindex);
		$("#txtLegalEntityName").jqxComboBox('clear');
		$("#txtLegalEntityName").val(data.legalEntityName);
		$("#roleName").select2("val", data.roleCode);
		$("#appointmentDate").val(formatDate(data.appointmentDate));
	    if(data.resignationDate!="" && data.resignationDate != undefined && data.resignationDate != 'undefined')
			$("#resignationDate").val(formatDate(data.resignationDate));
		$("#AddRelationModal").modal("show");
		dataSource = [];
		dateRangePicker('appointmentDate','resignationDate');
	    $("#appointmentDate").change();
	});
	
	$("#addrowbutton").on('click', function () {
		_paq.push(['trackEvent', 'KYCSubject', 'AddRelation', 'Adding relation in KYC Subject.']);
		updateFlag = false;
		$("#txtLegalEntityName").jqxComboBox('clear');
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
	    dateRangePicker('appointmentDate','resignationDate');
	    $("#appointmentDate").change();
	});
	 
	 
	$(document).ready(function () {
		var instanceName = $("#instanceName").val();
		var isRelationList = $("#isRelationList").val();
		if(isRelationList == 'true'){
			var gridSource = {
				datatype: "array",
			    localdata: [],
			    datafields: [
					{ name: 'relationId', type: 'string'},
					{ name: 'legalEntityName', value: 'legalEntityCode'},
					{ name: 'jurisdictionName', value: 'jurisdictionCode'},
					{ name: 'roleName', value: 'roleCode'},
					{ name: 'appointmentDate', type: 'date'},
					{ name: 'resignationDate', type: 'date'},
					{ name: 'clientEntityId', type: 'string'},
					{ name: 'entityType', type: 'string'},
					{ name: 'action', type: 'string'}
			   	]
			};
			     
			var gridAdapter = new $.jqx.dataAdapter(gridSource);
			
			$("#grid").jqxGrid({
				width: '100%',
			    showtoolbar: true,
			    source: gridAdapter,
				sortable: true,
				pageable: true,
				autoheight: true,
				theme: 'ITGtheme',
			   	columnsresize: true,
			   	enabletooltips: true,
			   	rowsheight: 50,
			    rendertoolbar: function (toolbar) {
			    	var me = this;
			        var container = $("<div style='margin: 5px;'></div>");
			        toolbar.append(container);
					$("#addrowbutton").jqxButton();
			        $("#deleterowbutton").jqxButton();
					
			        // delete row.
			        $("#deleterowbutton").on('click', function () {
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
					{ text: 'Appointment Date',	datafield: 'appointmentDate', filtertype: 'input', width: '12%', align: 'left',cellsformat: 'dd-MMM-yyyy'},
					{ text: 'Date of Resignation',	datafield: 'resignationDate', filtertype: 'input', width: '12%', align: 'left',cellsformat: 'dd-MMM-yyyy'},
					{ text: 'Action', datafield: 'action', width: '8%', align: 'left',enabletooltips:false}
			    ]
			});
		}
	 });
	 
	function formatDate(dateString){
		var dateObject = new Date(dateString);
	    var dd = dateObject.getDate();
	    var mm = dateObject.getMonth()+1; 
	    var yyyy = dateObject.getFullYear();
	    if(dd<10) 
	        dd='0'+dd;
	    if(mm<10) 
	        mm='0'+mm;
	    dateObject = mm+'/'+dd+'/'+yyyy;
	    return dateObject;
	}
	
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
	
    const elem = document.getElementById('passportImgDiv');
    const zoomInButton = document.getElementById('zoomInPassport');
    const zoomOutButton = document.getElementById('zoomOutPassport');
    // const resetButton = document.getElementById('reset');
    const panzoom = Panzoom(elem);
    const parent = elem.parentElement;
        
	// No function bind needed
	parent.addEventListener('wheel', panzoom.zoomWithWheel);
	zoomInButton.addEventListener('click', panzoom.zoomIn);
	zoomOutButton.addEventListener('click', panzoom.zoomOut);
	// resetButton.addEventListener('click', panzoom.reset);
	
	const velem = document.getElementById('vpassportImgDiv');
    const vzoomInButton = document.getElementById('vzoomInPassport');
    const vzoomOutButton = document.getElementById('vzoomOutPassport');
    // const resetButton = document.getElementById('reset');
    const vpanzoom = Panzoom(velem);
    const vparent = velem.parentElement;
        
	// No function bind needed
	vparent.addEventListener('wheel', vpanzoom.zoomWithWheel);
	vzoomInButton.addEventListener('click', vpanzoom.zoomIn);
	vzoomOutButton.addEventListener('click', vpanzoom.zoomOut);
	// resetButton.addEventListener('click', vpanzoom.reset);
</script>