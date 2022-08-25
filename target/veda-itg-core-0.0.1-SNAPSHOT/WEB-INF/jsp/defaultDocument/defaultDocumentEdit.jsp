<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="update.label" var="updateLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="defaultDocument.templateName.label" var="templateNameLabel" />
<spring:message code="defaultDocument.typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="defaultDocument.proofMapping.label" var="proofMappingLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="maxLength255" value="<%= ITGConstant.MAX_LENGTH_255%>" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i
					class="fa fa-angle-right"></i></li>
				<li><!-- <a href="#"> -->${kycMasterMenuName}<!-- </a> --> <i class="fa fa-angle-right"></i></li>
				<li>Default Document<i class="fa fa-angle-right"></i></li>
				<li>Edit</li>
			</ul>
			<!-- <h4>&nbsp;Default Document</h4> -->
			<span class="header-scope">&nbsp;Default Document</span>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">
						<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" >View Remarks</button>
						<button type="button" id="updateButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/save.png" /> ${updateLabel} </button>

						<button type="button" id="cancelButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/defaultDocument/edit" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" modelAttribute="kycTemplateBO" data-parsley-errors-messages-disabled="true">
			<form:hidden path="id" />
			<div class="row">
				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${templateNameLabel}</label>
								<form:input type="text"  path="templateName" id="templateName" class="form-control field-background" placeholder="Template Name" data-parsley-required="true" maxlength="${maxLength255}" data-parsley-id="4" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
							<form:errors path="templateName" cssClass="help-block error" />
						</div>
					</div>
				</div>

				<%-- <div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">Template Code</label>
								<form:input type="text" path="templateCode" id="templateName" class="form-control field-background" placeholder="Template Code" data-parsley-required="true" maxlength="${maxLength255}" data-parsley-id="4" />
								<span class="bt-flabels__error-desc">Required</span>
							</div>
						</div>
					</div>
				</div> --%>

				<div class="col-md-3">
					<div class="bt-form__wrapper">
						<div class="form-group uk-width-1-1">
							<div class="bt-flabels__wrapper">
								<label class="parsley_hide">${typeOfCounterPartyLabel}</label>
								<div class="field-background">
									<form:select disabled="true" path="typeOfCounterPartyCode" class="form-control select2me" data-parsley-required="true" placeholder="Type of Counter Party">
										<%-- <option value=""></option>
										
										<c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
											<c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
												<form:option value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</form:option>
											</c:forEach>
										</c:if> --%>
										<form:option value="${kycTemplateBO.typeOfCounterPartyCode}">${kycTemplateBO.typeOfCounterPartyName}</form:option>
										
										<%-- <c:if test="${dropdownData != null && dropdownData.getJSONArray('counterparty') != null && dropdownData.getJSONArray('counterparty').length() > 0}">
											<c:forEach begin="0" end="${dropdownData.getJSONArray('counterparty').length() -1}" var="index">
												<form:option value="${dropdownData.getJSONArray('counterparty').get(index)}">${dropdownData.getJSONArray('counterparty').get(index)}</form:option>
											</c:forEach>
										</c:if> --%>
									</form:select>
								</div>
								<span class="bt-flabels__error-desc_select">Required</span>
							</div>
							<form:errors path="typeOfCounterPartyCode" cssClass="help-block error" />
						</div>
					</div>
				</div>

			</div>

			<input type="hidden" id="legalEntityIdList" name="legalEntityIdList" />
			<input type="hidden" id="proofIdList" name="proofIdList" />

			<c:if test="${kycTemplateBO.kycTemplateDetailBO != null && kycTemplateBO.kycTemplateDetailBO.size() > 0}">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet-body">
							<div class="page-bar">
								<ul class="page-breadcrumb">
									<li><em><strong>${proofMappingLabel}</strong></em></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="kycProofList" style="" id="proofList">
							<div class="table-scrollable" style="!important;">
								<table class="table table-bordered table-hover" id="kycProofTable">
									<!-- <thead class="portlet box">
										<tr>
											<th width="20%">Proof Name</th>
											<th>Document Name</th>
										</tr>
									</thead> -->
									<tbody>
										<c:forEach items="${kycTemplateBO.kycTemplateDetailBO}" var="kycTemplateDetail" varStatus="proofStatus">
											<tr>
												<td width="20%">
													<c:choose>
														<c:when test="${kycTemplateDetail.isProofSelected}">
															<form:hidden path="kycTemplateDetailBO[${proofStatus.index}].isProofSelected" />
															<input type="checkbox" checked id="${kycTemplateDetail.proofId}" name="kycTemplateDetailBO[${proofStatus.index}].proofId" value="${kycTemplateDetail.proofId}" onclick="javascript:isChecked(this.id,this.value,'${proofStatus.index}');" />
															${kycTemplateDetail.proofName}
															
															</td>
															<td>
																<div id="kycDoc_${kycTemplateDetail.proofId}" >
														</c:when>
														<c:otherwise>
															<form:hidden path="kycTemplateDetailBO[${proofStatus.index}].isProofSelected" />
															<input type="checkbox" id="${kycTemplateDetail.proofId}" name="kycTemplateDetailBO[${proofStatus.index}].proofId" value="${kycTemplateDetail.proofId}" onclick="javascript:isChecked(this.id,this.value,'${proofStatus.index}');" />
															${kycTemplateDetail.proofName}
															</td>
															<td>
																<div id="kycDoc_${kycTemplateDetail.proofId}" style="display: none;">
														</c:otherwise>
													</c:choose>
												
														<table class="table table-bordered table-hover">
															<thead class="portlet box">
																<tr>
																	<th width="40%">Document Name</th>
																	<th width="30%" style="text-align: center;">Photocopy</th>
																	<th width="30%" style="text-align: center;">CTC</th>
																	<!-- <th width="20%" style="text-align: center;">Original</th> -->
																</tr>
															</thead>
															<tbody>
																<c:if test="${kycTemplateDetail.kycTemplateDocumentDetailBO != null && kycTemplateDetail.kycTemplateDocumentDetailBO.size() > 0}">
																	<c:forEach items="${kycTemplateDetail.kycTemplateDocumentDetailBO}" var="kycTemplateDocumentDetail" varStatus="docStatus">
																		<tr>
																			<td width="40%">
																				<form:hidden path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].documentId" value="${kycTemplateDocumentDetail.documentId}" />
																				${kycTemplateDocumentDetail.documentName}
																			</td>
																			<td width="30%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isPhotocopy}">
																						<form:checkbox checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isPhotocopy" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isPhotocopy" />
																					</c:otherwise>
																				</c:choose>
																				<%-- <input type="checkbox" id="${proofMasterList.getJSONObject(index).getString('proofId')}_photocopy"/> --%>
																			</td>
																			<td width="30%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isCTC}">
																						<form:checkbox checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isCTC" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isCTC" />
																					</c:otherwise>
																				</c:choose>
																				<%-- <input type="checkbox" checked id="${proofMasterList.getJSONObject(index).getString('proofId')}_ctc" /> --%>
																			</td>
																			<%-- <td width="20%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isOriginal}">
																						<form:checkbox checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isOriginal" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isOriginal" />
																					</c:otherwise>
																				</c:choose> --%>
																				<%-- <input type="checkbox" checked id="${proofMasterList.getJSONObject(index).getString('proofId')}_original" /> --%>
																			<!-- </td> -->
																		</tr>														
																	</c:forEach>
																</c:if>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:if>
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
		<div style="display:none">
			 <textarea id="proofListId">${proofIdList}</textarea>
		</div>

		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
	</div>
</div>


<script>
	$(window).load(function() {
	
		var savedProofIdList = [];
		proofIdList = JSON.parse($('#proofListId').val());
		//console.log("----proofIdList---"+proofIdList);
		console.log("proofIdList :: "+JSON.stringify(proofIdList));
		for(var i in proofIdList){
			console.log(proofIdList[i]);
			$('#uniform-'+proofIdList[i]+'>span').addClass('checked');
			$('#'+proofIdList[i]).prop('checked', true);
			$('#kycDoc_'+proofIdList[i]).show();
		}
	
	});

	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
	});

	$('#updateButton').click(function() {
		console.log("Initiating Parsley Validation.....");
		$('#frm').parsley().validate();
		var response = $('#frm').parsley().isValid();
		console.log("Validation Response : " + response);

		if (response) {
			
			var proofCount = 0;
			//console.log("proofCount : " + proofCount);
			$('#kycProofTable').find('input[type="checkbox"]:checked').each( function() {
				var proofId = this.value;
				console.log("proofId : " + proofId);
				if(proofId === "true"){
					//console.log("Inside if");
				} else {
					proofCount++;
				}
			});

			//console.log("proofCount : " + proofCount);
			if(proofCount==0){
				bootbox.alert("Please Select Atleast One Proof!", function(){});
				return false;
			} else {
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
			        		$("#typeOfCounterPartyCode").attr("disabled", false);
			        		$('#frm').submit();
			        		$("#typeOfCounterPartyCode").attr("disabled", true);
			    			buffer();
			        	}
			        }
				});
			}
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
	        		if($("#isDashboardRequestId").val() != null && $("#isDashboardRequestId").val() != "")
	        			location.href = "${contextPath}/dashboard";
	        		else
						location.href = "${contextPath}/kyc/defaultDocument/search";
	        		buffer();
	        	}
	        }
		});
	});

	function isChecked(id,value,index) {

		console.log("index :: " + index);
		console.log("id :: " + id);
		var kycId = "kycDoc_" + value;
		console.log("kycId :: " + kycId);
		if ($('#' + id).is(':checked')) {
			$('#' + kycId).show();
			document.getElementById('kycTemplateDetailBO'+index+'.isProofSelected').value = true;
		} else {
			$('#' + kycId).hide();
			document.getElementById('kycTemplateDetailBO'+index+'.isProofSelected').value = false;
		}
	}
</script>