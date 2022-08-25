<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="close.label" var="closeLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="kycTemplate.templateDetails.label" var="templateDetailsLabel" />
<spring:message code="kycTemplate.templateName.label" var="templateNameLabel" />
<spring:message code="kycTemplate.templateCode.label" var="templateCodeLabel" />
<spring:message code="kycTemplate.jurisdiction.label" var="jurisdictionLabel" />
<spring:message code="kycTemplate.counterParty.label" var="counterPartyLabel" />
<spring:message code="kycTemplate.riskCategory.label" var="riskCategoryLabel" />
<spring:message code="kycTemplate.investorSubType.label" var="investorSubTypeLabel" />
<spring:message code="kycTemplate.proofMapping.label" var="proofMappingLabel" />
<spring:message code="kycTemplate.roles.label" var="rolesLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />
<spring:message code="kycTemplate.exemptCategory.label" var="exemptCatLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <c:choose>
				<c:when test="${nextStates != null && nextStates.length() > 0}">
             		<ul class="page-breadcrumb pull-right">
						<li><a class="cancel redirect-dashboard"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
            			<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
            			<li><a class="cancel redirect-kyc/template/search"> KYC Documents Template <i class="fa fa-angle-right"></i></a></li>
						<li>View</li>
					</ul>	
             	</c:when>
             	<c:otherwise>
             		<ul class="page-breadcrumb pull-right">
						<li><i class="fa fa-home"></i> Home  <i class="fa fa-angle-right"></i></li>
						<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
			            <li> KYC Documents Template <i class="fa fa-angle-right"></i></li>
						<li>View</li>
					</ul>
            	</c:otherwise>
            </c:choose>
			<span class="header-scope">&nbsp;KYC Documents Template</span>
        </div>
         <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
                    <button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'KYCTemplate', 'ViewRemarks','Viewing remark on view template']);" >View Remarks</button>
                    	<c:choose>
		                    <c:when test="${nextStates != null && nextStates.length() > 0}">
		                    	<c:forEach begin="0" end="${nextStates.length() -1}" var="index">
		                    		<button type="button" class="btn-itg btn btn-sm grey-gallery" data-toggle="modal" data-target="#remarkModalId" onclick="setUpdateWorkflowDetails('${workflowId}', '${nextStates.get(index).getString('State')}');">
			                            	${nextStates.get(index).getString('iconImage')} ${nextStates.get(index).getString('Label')}
			                        </button>
		                    	</c:forEach>
	                    		<button type="button" id="cancelBtn" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${cancelLabel} </button>
		                    </c:when>
		                    <c:otherwise>
		                    	<button type="button" id="closeButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${closeLabel} </button>
	                    	</c:otherwise>
	                    </c:choose>
                    </div>
                    <div class="clearfix margin-bottom-5"></div>
                </div>
            </div>
        </div>

		<form:form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels"
		 modelAttribute="kycTemplateBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
		
		<textarea id="workflowId" style="display:none;"></textarea>
		<textarea id="stateId" style="display:none;"></textarea>
		<textarea id="masterId" style="display:none;"> ${kycTemplateBO.id} </textarea>
		<input type="hidden" id="instanceName" value="${instance}" />
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="page-bar">
							<ul class="page-breadcrumb">
								<li><em><strong>${templateDetailsLabel}</strong></em></li>
							</ul>
						</div>
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${templateNameLabel}
							</div>
							<c:if test="${kycTemplateBO != null}"> 
								<div class="col-md-3 h5">${kycTemplateBO.templateName}</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${templateCodeLabel}
							</div>
							<c:if test="${kycTemplateBO != null}">
								<div class="col-md-3 h5">${kycTemplateBO.templateCode}</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">
								${jurisdictionLabel}
							</div>
							<c:if test="${kycTemplateBO != null}">
								<div class="col-md-3 h5">${kycTemplateBO.countryOfResidenceName}</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${counterPartyLabel}
							</div>
							<c:if test="${kycTemplateBO != null}">
								<div class="col-md-3 h5">${kycTemplateBO.typeOfCounterPartyName}</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<c:choose>
								<c:when test="${kycTemplateBO.subTypeOfCounterpartyCode != null}">
									<div class="col-md-2 bold h5">${investorSubTypeLabel}</div>
									<%-- <c:if test="${kycTemplateBO != null}">
										<div class="col-md-3 h5">${kycTemplateBO.subTypeOfCounterpartyName}</div>
									</c:if> --%>
									<c:choose>
										<c:when	test="${kycTemplateBO.subTypeOfCounterpartyName != null && kycTemplateBO.subTypeOfCounterpartyName !=''}">
											<div class="col-md-3 h5">
												<c:forEach items="${kycTemplateBO.subTypeOfCounterpartyName}" varStatus="status" var="subTypeName">
													<c:if test="${status.index > 0 }">
													,
													</c:if>
													<c:set var="tempSubTypeName">${subTypeName}</c:set>
													${tempSubTypeName}
												</c:forEach>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-md-3 h5"><spring:message code="message.defaultPlaceHolderView" /></div>
										</c:otherwise>
									</c:choose>
									<div class="col-md-2 bold h5">${riskCategoryLabel}</div>
									<c:if test="${kycTemplateBO != null}">
										<div class="col-md-3 h5">${kycTemplateBO.riskCategoryName}</div>
									</c:if>
								</c:when>
								<c:otherwise>
									<div class="col-md-2 bold h5">${riskCategoryLabel}</div>
									<c:if test="${kycTemplateBO != null}">
										<div class="col-md-3 h5">${kycTemplateBO.riskCategoryName}</div>
									</c:if>
									<div class="col-md-2 bold h5">${rolesLabel}</div>
									<c:if test="${kycTemplateBO != null}">
										<div class="col-md-3 h5">
											<c:forEach items="${kycTemplateBO.roleName}" var="role" varStatus="loop">
											    ${role}
											   <c:if test="${!loop.last}">,</c:if>
											</c:forEach>
										</div>
									</c:if>
								</c:otherwise>
							</c:choose>
										
							<%-- <c:if test="${instance == 'VEDA'}">
								<div class="col-md-2 bold h5">${investorSubTypeLabel}</div>
								<c:if test="${kycTemplateBO != null}">
									<div class="col-md-3 h5">${kycTemplateBO.subTypeOfCounterpartyName}</div>
								</c:if>
							</c:if>
							<div class="col-md-2 bold h5">${riskCategoryLabel}</div>
							<c:if test="${kycTemplateBO != null}">
								<div class="col-md-3 h5">${kycTemplateBO.riskCategoryName}</div>
							</c:if>
							<c:if test="${instance == 'FASTLANE' || instance == 'FCH'}">
								<div class="col-md-2 bold h5">${rolesLabel}</div>
								<c:if test="${kycTemplateBO != null}">
									<div class="col-md-3 h5">
										<c:forEach items="${kycTemplateBO.roleName}" var="role" varStatus="loop">
										    ${role}
										   <c:if test="${!loop.last}">,</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:if> --%>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">${createdByLabel}</div>
							<div class="col-md-3 h5">
								<c:if test="${kycTemplateBO != null && kycTemplateBO.createdBy != null}">
									<span>${kycTemplateBO.createdBy}</span>
								</c:if>
							</div>
							<div class="col-md-2 bold h5">${createdDateLabel}</div>
							<div class="col-md-3 h5">
								<c:if test="${kycTemplateBO != null && kycTemplateBO.createdDate != null}">
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycTemplateBO.createdDate}" />
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">${modifiedByLabel}</div>
							<div class="col-md-3 h5">
								<c:if test="${kycTemplateBO != null && kycTemplateBO.modifiedBy != null}">
									<span>${kycTemplateBO.modifiedBy}</span>
								</c:if>
							</div>
							<div class="col-md-2 bold h5">${modifiedDateLabel}</div>
							<div class="col-md-3 h5">
								<c:if test="${kycTemplateBO != null && kycTemplateBO.modifiedDate != null}">
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycTemplateBO.modifiedDate}" />
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${kycTemplateBO.subTypeOfCounterpartyCode == null}">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet-body">
							<div class="form-group" style="margin-left: -1px;">
								<div class="col-md-2 bold h5">${exemptCatLabel}</div>
								<div class="col-md-3 h5">
									<c:if test="${kycTemplateBO != null}">
										<c:choose>
										   <c:when test="${kycTemplateBO.isExemptCategory}"><span> Yes </span></c:when> 
										   <c:otherwise><span> No </span></c:otherwise>
										</c:choose>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<div class="clearfix margin-bottom-10"></div>

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
													<input type="checkbox" disabled checked id="${kycTemplateDetail.proofId}" name="kycTemplateDetailBO[${proofStatus.index}].proofId" value="${kycTemplateDetail.proofId}" onclick="javascript:isChecked(this.id,this.value,'${proofStatus.index}');" />
													${kycTemplateDetail.proofName}
													
												</td>
												<td>
													<div id="kycDoc_${kycTemplateDetail.proofId}" >
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
																						<form:checkbox disabled="true" checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isPhotocopy" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox disabled="true" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isPhotocopy" />
																					</c:otherwise>
																				</c:choose>
																				<%-- <input type="checkbox" id="${proofMasterList.getJSONObject(index).getString('proofId')}_photocopy"/> --%>
																			</td>
																			<td width="30%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isCTC}">
																						<form:checkbox disabled="true" checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isCTC" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox disabled="true" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isCTC" />
																					</c:otherwise>
																				</c:choose>
																				<%-- <input type="checkbox" checked id="${proofMasterList.getJSONObject(index).getString('proofId')}_ctc" /> --%>
																			</td>
																			<%-- <td width="20%" align="center">
																				<c:choose>
																					<c:when test="${kycTemplateDocumentDetail.isOriginal}">
																						<form:checkbox disabled="true" checked="checked" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isOriginal" />
																					</c:when>
																					<c:otherwise>
																						<form:checkbox disabled="true" path="kycTemplateDetailBO[${proofStatus.index}].kycTemplateDocumentDetailBO[${docStatus.index}].isOriginal" />
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

 			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
			<div class="clearfix margin-bottom-10"></div>
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
									<div class="form-group">
										<div class="bt-flabels__wrapper">
											<label class="parsley_hide">Remark</label>
											<textarea name="remark" id="remarkContent" rows="15" style="height: 140px;" data-parsley-required="true" placeholder="Remark"></textarea>
											<span class="bt-flabels__error-desc">Required</span>
										</div>
									</div>
								</div>												
						   </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn-modal-cls btn btn-sm grey-gallery" onclick="updateWorkflow('${contextPath}')">
								<img src="/digiKYC/assets/global/img/submit.png" /> Submit
							</button>
							<button type="button" class="btn-modal-cls btn btn-sm default" data-dismiss="modal">
	                            <img src="/digiKYC/assets/global/img/clear.png" /> Close
	                        </button>
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
		
	</div>
</div>

<script>

	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
	});

	$('#closeButton').click(function() {
		_paq.push(['trackEvent', 'KYCTemplate', 'Close','Closing template view']);
	    console.log("Closing current window...");
	    window.close();
	});
	
	$('#cancelBtn').click(function() {
		_paq.push(['trackEvent', 'KYCTemplate', 'Cancel','Cancel from approve']);
		location.href = "${contextPath}/dashboard";
	});
</script>