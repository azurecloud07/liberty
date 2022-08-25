<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="update.label" var="updateLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="consentMaster.consentName.label" var="consentNameLabel" />
<spring:message code="consentMaster.consentType.label" var="consentTypeLabel" />
<spring:message code="consentMaster.typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="consentMaster.isMandatory.label" var="isMandatoryLabel" />
<spring:message code="consentMaster.effectiveDate.label" var="effectiveDateLabel" />
<spring:message code="consentMaster.effectiveEndDate.label" var="effectiveEndDateLabel" />
<spring:message code="consentMaster.consentDescription.label" var="consentDescriptionLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="consentTypeName" value="<%= ITGConstant.CONSENT_TYPE_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="consentTypeShortCode" value="<%= ITGConstant.CONSENT_TYPE_SHORT_CODE%>" />

<c:set var="maxLength50" value="<%= ITGConstant.MAX_LENGTH_50%>" />
<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />
<c:set var="maxLength500" value="<%= ITGConstant.MAX_LENGTH_500%>" />

<style>
.bt-flabels__wrapper textarea {
	padding: 12px 0 0px 12px !important;
	width: 100%;
}
</style>
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
				<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
				<li><a class="cancel redirect-kyc/consent/search"> Consent Master <i class="fa fa-angle-right"></i></a></li>
				<li>Update</li>
			</ul>
			<!-- <h4>&nbsp;Consent Master</h4> -->
			<span class="header-scope">&nbsp;Consent Master</span>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">
						<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'ConsentMaster', 'ViewRemarks','Viewing remark on edit consent']);" >View Remarks</button>
						<button type="button" id="updateButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/save.png" /> ${updateLabel} </button>

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/consent/edit" method="POST"
			id="frm" role="form"
			class="horizontal-form uk-form bt-flabels js-flabels"
			data-parsley-validate="true" modelAttribute="consentMasterBO"
			data-parsley-errors-messages-disabled="true">

			<form:hidden path="id" />
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${consentNameLabel}</label>
										<form:input type="text" maxlength="${maxLength50}" path="consentName" class="form-control field-background textRequired" data-parsley-required="true" placeholder="${consentNameLabel}" />
										<span class="bt-flabels__error-desc">Required</span>
									</div>
									<form:errors path="consentName" cssClass="help-block error" />
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${consentTypeLabel}</label>
										<div class="field-background">
											<form:select path="consentType" placeholder="${consentTypeLabel}"
												data-parsley-required="true" class="form-control select2me">
												<form:option value=""></form:option>
													<c:if test="${consentTypeData != null && consentTypeData.length() > 0}">
														<c:forEach begin="0" end="${consentTypeData.length() -1}" var="index">
															<form:option value="${consentTypeData.get(index).get(consentTypeShortCode)}">${consentTypeData.get(index).get(consentTypeName)}</form:option>
														</c:forEach>
													</c:if>
											</form:select>
										</div>
										<span class="bt-flabels__error-desc_select">Required</span>
									</div>
									<form:errors path="consentType" cssClass="help-block error" />
								</div>
							</div>
						</div>
						
						<%-- <div class="col-md-6">
		                    <div class="bt-form__wrapper">
		                        <div class="form-group uk-width-1-1">
		                            <div class="bt-flabels__wrapper">
		                                <label class="parsley_hide">Consent Code</label>
		                                <form:input path="consentCode" id="consentCodeId" class="form-control field-background textRequired" data-parsley-required="true" placeholder="Consent Code" />
		                                <span class="bt-flabels__error-desc">Required</span>
		                            </div>
		                        </div>
		                    </div>
		                </div> --%>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${typeOfCounterPartyLabel}</label>
										<div class="field-background">
											<form:select path="typeOfCounterpartyCode" placeholder="${typeOfCounterPartyLabel}"
												data-parsley-required="true" class="form-control select2me">
												<form:option value=""></form:option>
													<c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
														<c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
															<form:option value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</form:option>
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

						<div class="col-md-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<form:checkbox path="isMandatory" value="1" />
										<label class="control-label">${isMandatoryLabel}</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${consentDescriptionLabel}</label>
										<form:textarea type="text" maxlength="${maxLength500}" path="consentDescription" class="field-background" data-parsley-required="true" placeholder="${consentDescriptionLabel}" rows="5" cols="55" />
										<span class="bt-flabels__error-desc">Required</span>
									</div>
									<form:errors path="consentDescription" cssClass="help-block error" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${effectiveDateLabel}</label>
								<div class="input-group" data-date-format="mm/dd/yyyy" data-date-start-date="+0d">
									<form:input path="effectiveDate" id="effectiveDateId" placeholder="${effectiveDateLabel}" data-parsley-required="true" class="form-control form-control-inline field-background datePicker" />
									<span class="input-group-btn btn default"><i class="fa fa-calendar"></i></span>
									<span class="bt-flabels__error-desc_date">Required</span>
								</div>
							</div>
							<form:errors path="effectiveDate" cssClass="help-block error" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${effectiveEndDateLabel}</label>
								<div class="input-group" id="effectiveEndDatePickerId" data-date-format="mm/dd/yyyy" data-date-start-date="+0d">
								<form:input path="effectiveEndDate" id="effectiveEndDateId" placeholder="${effectiveEndDateLabel}" class="form-control form-control-inline datePicker" />
									<span class="input-group-btn btn default"> <i class="fa fa-calendar"></i></span>
									<span class="bt-flabels__error-desc_date">Required</span>
								</div>
							</div>
						</div>
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
		</form:form>
		<textarea id="isDashboardRequestId" style="display: none;">${isDashboardRequest}</textarea>
	</div>
</div>

<script>
	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
		try{
			dateRangePicker('effectiveDateId','effectiveEndDateId');
			//disableDates();
		}catch(err){
			console.log(err.message);
		}

		if($('#consentType').val() == "Passporting") {
			$("#isMandatory1").attr("disabled",true);
			if($('#uniform-isMandatory1>span').hasClass('checked')){
				$('#uniform-isMandatory1>span').removeClass('checked');
				$('#isMandatory1').prop('checked', false);
				$('#isMandatory1').val(false);
			}
		}

	});
	
	/* function disableDates(){
		startDate = new Date($("#effectiveDateId").val());
		
		// if end date is selected & start date is greater than end date than clear end date
		if($("#effectiveEndDateId").val() != ''){
			endDate = new Date($("#effectiveEndDateId").val());
			if(startDate > endDate){
				$("#effectiveEndDateId").val("");
				$("#effectiveEndDateId").trigger("change");
			}
		} 
		
		$('#effectiveEndDatePickerId').datepicker('setStartDate', $.datepicker.formatDate('MM/dd/yyyy', startDate));
	} */
	
	$('#consentType').change(function () {
		console.log("this.value :: " + this.value);
		if(this.value == "Passporting") {
			$("#isMandatory1").attr("disabled",true);
			$('#uniform-isMandatory1>span').removeClass('checked');
			$('#isMandatory1').prop('checked', false);
			$('#isMandatory1').val(false);
		} else {
			if($("#uniform-isMandatory1").hasClass("disabled"))
				$("#uniform-isMandatory1").removeClass("disabled");
			$("#isMandatory1").attr("disabled",false);
		}
	});
	
	$('#updateButton').click(function() {
		console.log("Initiating Parsley Validation.....");
		$('#frm').parsley().validate();
		var response = $('#frm').parsley().isValid();
		console.log("Validation Response : " + response);

		if (!response)
			return false;
		else {
			bootbox.confirm({
		        message: "Are you sure you want to update?",
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
		        		_paq.push(['trackEvent', 'ConsentMaster', 'Update','Updating consent']);
		        		$('#frm').submit();
		    			buffer();
		        	}
		        }
			});
		}
	});

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
	        		_paq.push(['trackEvent', 'ConsentMaster', 'Cancel','Cancel updating consent']);
	        		if($("#isDashboardRequestId").val() != null && $("#isDashboardRequestId").val() != "")
	        			location.href = "${contextPath}/dashboard";
	        		else
						location.href = "${contextPath}/kyc/consent/search";
	        		buffer();
	        	}
	        }
		});
	});
</script>
