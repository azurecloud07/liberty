<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dataTypeName" value="<%= ITGConstant.DATA_TYPE_NAME%>" />
<c:set var="dataTypeShortCode" value="<%= ITGConstant.DATA_TYPE_SHORT_CODE%>" />

<spring:message code="addMore.label" var="addMoreLabel" />
<spring:message code="remove.label" var="removeLabel" />
<spring:message code="save.label" var="saveLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="documentLibrary.documentName.label" var="documentNameLabel" />
<spring:message code="documentLibrary.fieldsToBeCaptured.label" var="fieldsToBeCapturedLabel" />
<spring:message code="documentLibrary.description.label" var="descriptionLabel" />
<spring:message code="documentLibrary.dataType.label" var="dataTypeLabel" />
<spring:message code="documentLibrary.dataLenght.label" var="dataLenghtLabel" />
<spring:message code="documentLibrary.isPassport.label" var="isPassportLabel" />
<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />
<spring:message code="app.documentIsPassport" var="documentIsPassport" />

<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
	            <li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
	            <li><a class="cancel redirect-kyc/document/search"> Document Library <i class="fa fa-angle-right"></i></a></li>
				<li>Add</li>
			</ul>
			<!-- <h4>&nbsp;Document Library</h4> -->
			<span class="header-scope">&nbsp;Document Library</span>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">

						<button type="button" id="saveButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/save.png" /> ${saveLabel} </button>

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/document/add" method="POST"
			id="frm" role="form"
			class="horizontal-form uk-form bt-flabels js-flabels"
			data-parsley-validate="true" modelAttribute="documentLibraryBO"
			data-parsley-errors-messages-disabled="true">
			<div id="addNewDocument">
				<input type="hidden" id="json" name="json" /> <input type="hidden"
					id="newDocumentName" name="newDocumentName" />
				<div id="newDocument">
					<div class="row col-md-12">
						<div class="col-md-3">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<div class="field-background">
											<label class="parsley_hide">${documentNameLabel}</label>
											<form:input type="text" maxlength="${maxLength255}" path="documentName" id="documentName"
												class="form-control textRequired"
												data-parsley-required="true" placeholder="${documentNameLabel}" />
										</div>
										<span class="bt-flabels__error-desc">Required</span>
										<form:errors path="documentName" cssClass="help-block error" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-3">
                           <div class="bt-form__wrapper">
                              <div class="form-group uk-width-1-1">
                                 <div class="bt-flabels__wrapper">
                                    <label class="parsley_hide">${counterPartyTypeLabel}</label>
                                    <div class="field-background">
                                       <form:select path="typeOfCounterpartyCode" class="form-control select2me select" multiple="multiple" placeholder="${counterPartyTypeLabel}" data-parsley-required="true">
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
					<c:if test="${documentIsPassport == 'true'}">
						<div class="col-md-6">
							<div class="form-group">
								<label style="margin-left:-5px;" class="control-label">
									<form:checkbox path="isPassport" disabled="true"/>
									${isPassportLabel}
								</label>
							</div>
						</div>
					</c:if>
					
					<div class="col-md-12">
						<div id="divCheckDocumentName"></div>
					</div>
				
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-5 control-label"><strong>${fieldsToBeCapturedLabel}</strong></label>
							</div>
						</div>
					</div>
					<div id="documentDetails">
						<c:if test="${documentLibraryBO != null}">
							<c:if test="${documentLibraryBO.passportDocumentList != null && documentLibraryBO.passportDocumentList.size() > 0}">
								<div class="passportDocDiv" style="display:None">
								<c:forEach items="${documentLibraryBO.passportDocumentList}" varStatus="status">
									<div class="row col-md-12">
										<div id="passportDocDetailsDiv_${status.index}">
											<div class="col-md-3">
												<div class="bt-form__wrapper">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper bt-flabel__float">
															<div class="field-background">
																<label class="parsley_hide">${descriptionLabel}</label>
																<form:input
																	path="passportDocumentList[${status.index}].documentAttributeName"
																	data-parsley-required="true" readonly="true"
																	class="form-control textRequired"
																	placeholder="${descriptionLabel}" />
															</div>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="bt-form__wrapper">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">${dataTypeLabel}</label>
															<div class="field-background">
																<form:select
																	path="passportDocumentList[${status.index}].dataTypeCode"
																	onclick="disableDataLength(this.value, 'dataLength0');"
																	class="form-control select2me optDate"
																	data-parsley-required="true" placeholder="${dataTypeLabel}"
																	disabled="true">
																	<form:option value=""></form:option>
																	<c:if test="${dataTypeData != null && dataTypeData.length() > 0}">
																		<c:forEach begin="0" end="${dataTypeData.length() -1}" var="index">
																			<form:option value="${dataTypeData.get(index).get(dataTypeShortCode)}">${dataTypeData.get(index).get(dataTypeName)}</form:option>
																		</c:forEach>
																	</c:if>
																</form:select>
															</div>
															<span class="bt-flabels__error-desc_select">Required</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="bt-form__wrapper">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
																<label class="parsley_hide">${dataLenghtLabel}</label>
															<form:input
																path="passportDocumentList[${status.index}].dataLength"
																data-parsley-required="false" readonly="true"
																type="number" min="0"
																class="form-control numberField decimalValue dataLength0"
																placeholder="${dataLenghtLabel}" />
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<label class="control-label">Is Mandatory</label>
						                        <form:checkbox path="passportDocumentList[${status.index}].isMandatory" disabled = "true"/>
						                    </div>
										</div>
									</div>
								</c:forEach>
								</div>
							</c:if>
							<c:if test="${documentLibraryBO.documentList != null && documentLibraryBO.documentList.size() > 0}">
								<c:forEach items="${documentLibraryBO.documentList}" varStatus="status">
									<div class="row col-md-12">
										<div id="docDetailsDiv_${status.index}">
											<div class="col-md-3">
												<div class="bt-form__wrapper">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper bt-flabel__float">
															<div class="field-background">
																<label class="parsley_hide">${descriptionLabel}</label>
																<form:input
																	path="documentList[${status.index}].documentAttributeName"
																	data-parsley-required="true" readonly="true"
																	class="form-control textRequired"
																	placeholder="${descriptionLabel}" />
															</div>
															<span class="bt-flabels__error-desc">Required</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="bt-form__wrapper">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
															<label class="parsley_hide">${dataTypeLabel}</label>
															<div class="field-background">
																<form:select
																	path="documentList[${status.index}].dataTypeCode"
																	onclick="disableDataLength(this.value, 'dataLength0');"
																	class="form-control select2me optDate"
																	data-parsley-required="true" placeholder="${dataTypeLabel}"
																	disabled="true">
																	<form:option value=""></form:option>
																	<c:if test="${dataTypeData != null && dataTypeData.length() > 0}">
																		<c:forEach begin="0" end="${dataTypeData.length() -1}" var="index">
																			<form:option value="${dataTypeData.get(index).get(dataTypeShortCode)}">${dataTypeData.get(index).get(dataTypeName)}</form:option>
																		</c:forEach>
																	</c:if>
																</form:select>
															</div>
															<span class="bt-flabels__error-desc_select">Required</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-2">
												<div class="bt-form__wrapper">
													<div class="form-group uk-width-1-1">
														<div class="bt-flabels__wrapper">
																<label class="parsley_hide">${dataLenghtLabel}</label>
															<form:input
																path="documentList[${status.index}].dataLength"
																data-parsley-required="false" readonly="true"
																type="number" min="0"
																class="form-control numberField decimalValue dataLength0"
																placeholder="${dataLenghtLabel}" />
														</div>
													</div>
												</div>
											</div>
											<c:choose>
												<c:when test="${status.index eq 0}">
													<div class="col-md-2">
														<label class="control-label">Is Mandatory</label>
								                        <form:checkbox path="documentList[${status.index}].isMandatory" disabled = "true"/>
								                    </div>
                                                  	</c:when>
                                                  	<c:otherwise>
                                                  		<div class="col-md-2">
														<label class="control-label">Is Mandatory</label>
								                        <form:checkbox path="documentList[${status.index}].isMandatory" />
								                    </div>
								                    <div class="col-md-2">
								                    	<div class="form-group">
								                    		<button class="btn-itg btn btn-sm grey-gallery" onclick="javascript:removeParameter(${status.index})"><img src="/digiKYC/assets/global/img/clear.png" /> Remove &nbsp;&nbsp;&nbsp;</button>
								                    	</div>
								                    </div>
                                                  	</c:otherwise>
                                               </c:choose>
										</div>
										<c:if test="${status.count eq 1}">
											<div class="col-md-2">
												<div class="form-group">
													<button type="button" class="btn-itg btn btn-sm grey-gallery"
														onclick="addMoreParameter();">
														<img src="/digiKYC/assets/global/img/add.png" />&nbsp;${addMoreLabel}
													</button>
												</div>
											</div>
										</c:if>
									</div>
								</c:forEach>
							</c:if>
						</c:if>
						<div id="add_document"></div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>


<script>
	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
	});

	function dataLength(code, index) {
		if (code != null && code == "Date") {
			$('#dataLength_' + index).prop('readonly', true);
			$("#dataLength_" + index).removeClass("textRequired");
			$("#dataLength_" + index).removeClass("has-error");
			$("#dataLength_" + index).next('span.help-block.error').remove();
		} else {
			if ($('#dataLength_' + index).length) {
				$('#dataLength_' + index).prop('readonly', false);
				$("#dataLength_" + index).addClass("textRequired");
			}
		}
	}

	function removeNewDoc(index) {
		$('#newDoc_' + index).remove();
	}

	$('#saveButton').click(function() {
		$('#frm').parsley().validate();
		var response = $('#frm').parsley().isValid();
		if (!response)
			return false;
		
		var documentName = $("#documentName").val();
		if(documentName != ""){
			var templateObject = {};
			templateObject["documentName"] = documentName;
		    ajaxCallBack("POST", $("#commonContextPathId").val() + "/kyc/document/search", templateObject,"text", function(response) {
		    	$("#divCheckDocumentName").html("");
				if(response != "" && response != null && response == "exist"){
					var checkDiv = '<div class="alert alert-danger alertHide" style="padding: 9px;"><i class="fa fa-warning"></i>&nbsp;'+
						'Document name already in use !<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button></div>';
					$("#divCheckDocumentName").html(checkDiv);
					$("#documentName").val("");
				}else{
					bootbox.confirm({
				        message: "Are you sure you want to save?",
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
				        		document.getElementById("documentList0.isMandatory1").disabled = false;
				        		$(".optDate").prop("disabled", false);
				        		if(!$("#isPassport1").is(":checked")) {
				        			$('.passportDocDiv').remove();
				        		}
				        		_paq.push(['trackEvent', 'DocumentLibrary', 'Save','Saving document']);
				        		$('#frm').submit();
				    			buffer();
				        	} else {
				        		$(".optDate").prop("disabled", true);
				        	}
				        }
					});
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
	        		_paq.push(['trackEvent', 'DocumentLibrary', 'Cancel', 'Cancel saving document']);
					location.href = "${contextPath}/kyc/document/search";
					buffer();
	        	}
	        }
		});
	});

	/* -------------- new functions ----------- */

	function disableDataLength(dataTypeVal, className) {
		if (dataTypeVal == 'Date') { // Temporary using value
			$('#docDetailsDiv_' + documentSize - 1 + '').find(".numberField").attr('disabled', true);
			$('.'+className+'').attr('readonly', true);
		} else {
			$('#docDetailsDiv_' + documentSize - 1 + '').find(".numberField").attr('disabled', false);
			$('.'+className+'').attr('readonly', false);
		}
	}

	var documentSize = 3;
	function addMoreParameter() {
		//validateParsley();
		$('#frm').parsley().validate();

		var flag = $('#frm').parsley().isValid();
		if (!flag)
			return false;

		var c = 0;

		if (documentSize == 3) {
			var c = 0;
			while ($("#docDetailsDiv_" + c).length > 0) {
				c++;
			}
			documentSize = c;
		}

		console.log("documentSize  :  " + documentSize);
		var x = 0;

		var regex = new RegExp("documentList[\\[\\]']" + x + "]", 'g');
		var regex1 = new RegExp("documentDetails" + x + ".", 'g');
		var documentListIdRegex = new RegExp("documentList0", 'g');
		var dataLengtClass = new RegExp("dataLength0", 'g');
		var regex2 = new RegExp("checked", 'g');
		var regex3 = new RegExp("disabled", 'g');
		
		$.uniform.restore("input:checkbox");
		$("select").select2("destroy");
		var dynamicData = '<div id="docDetailsDiv_'+documentSize+'" class="row col-md-12">';
		dynamicData += document.getElementById("docDetailsDiv_0").innerHTML
				.replace(regex, "documentList[" + documentSize + "]")
				.replace(regex1, "documentDetails" + documentSize + ".")
				.replace(regex2, "")
				.replace(regex3, "")
				.replace(documentListIdRegex, "documentList" + documentSize)
				.replace(dataLengtClass, "dataLength" + documentSize);

		dynamicData += '<div class="col-md-2"><div class="form-group"><button class="btn-itg btn btn-sm grey-gallery" onclick="javascript:removeParameter('
				+ documentSize
				+ ')"><img src="/digiKYC/assets/global/img/clear.png" /> Remove &nbsp;&nbsp;&nbsp;</button></div></div>';

		$("#add_document").append(dynamicData);

		$('#docDetailsDiv_' + documentSize + '').find('input:text').val('')
				.prop("readonly", false);
		$('#docDetailsDiv_' + documentSize + '').find(".numberField").val('')
				.prop("readonly", true);
		$('#docDetailsDiv_' + documentSize + '').children().find('select')
			.each(function() {
			$("select").select2("destroy");
			$(this).select2('val', '');
			$(this).trigger('change');
			$(this).prop("disabled", false);
		});

		$('select').select2({
			'allowClear' : true
		});
		pcframework.initUniform();

		$("#docDetailsDiv_" + documentSize + ">div .bt-flabel__float")
				.removeClass("bt-flabel__float");
		documentSize++;

		initParsely($);
	}

	function removeParameter(index) {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Remove','Removing field of document']);
		$('#docDetailsDiv_' + index).remove();
	}

	$(function() {
		$(document).on("keypress", '.decimalValue', function(event) {
			return isDecimal(event, this)
		});

		$(document).on("keypress", '.decimalValueNegetive', function(event) {
			return isDecimalNegetive(event, this)
		});

		$(".numberValue").keypress(function(event) {
			return isNumber(event, this)
		});
	});
	
	$(document).ready(function() {
		$("#frm").submit(function(event) {
			$(".decimalValue").each(function() {
				if (this.value !== undefined && this.value != "") {
					this.value = Number(this.value.replace(/[^0-9.-]+/g, ""));
				}
			});
			$(".decimalValueNegetive").each(function() {
				if (this.value !== undefined && this.value != "") {
					this.value = Number(this.value.replace(/[^0-9.-]+/g, ""));
				}
			});
			return true;
		});
	});
	
	$("#typeOfCounterpartyCode").change(function(){
		$.uniform.restore("input:checkbox");
		$("#isPassport1").attr("disabled",true);
		$("#isPassport1").attr("checked",false);
		var counterParty  = $(this).val();
		if(counterParty != null && counterParty.length == 1 && counterParty[0] == "Individual"){
			$("#isPassport1").attr("disabled",false);
		}
		pcframework.initUniform();
	});
	
	$("#isPassport1").change(function(){
		if($(this).is(":checked")) {
			$('.passportDocDiv').show();
		} else {
			$('.passportDocDiv').hide();
		}
	});
</script>