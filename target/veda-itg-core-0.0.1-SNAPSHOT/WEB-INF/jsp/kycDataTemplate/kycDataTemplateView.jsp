<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="close.label" var="closeLabel" />
<spring:message code="cancel.label" var="cancelLabel" />
<spring:message code="kycTemplate.templateDetails.label" var="templateDetailsLabel" />
<spring:message code="kycDataTemplate.fieldsDetails.label" var="fieldsDetailsLabel" />
<spring:message code="kycTemplate.templateName.label" var="templateNameLabel" />
<spring:message code="kycTemplate.templateCode.label" var="templateCodeLabel" />
<spring:message code="kycTemplate.jurisdiction.label" var="jurisdictionLabel" />
<spring:message code="typeOfCounterParty.label" var="counterPartyLabel" />
<spring:message code="kycTemplate.roles.label" var="rolesLabel" />
<spring:message code="kycDataTemplate.legalEntityType.label" var="entityTypeLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />

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
            			<li><a class="cancel redirect-kyc/dataTemplate/search"> KYC Data Template <i class="fa fa-angle-right"></i></a></li>
						<li>View</li>
					</ul>	
             	</c:when>
             	<c:otherwise>
             		<ul class="page-breadcrumb pull-right">
						<li><i class="fa fa-home"></i> Home  <i class="fa fa-angle-right"></i></li>
						<li> ${kycMasterMenuName} <i class="fa fa-angle-right"></i></li>
			            <li> KYC Data Template <i class="fa fa-angle-right"></i></li>
						<li>View</li>
					</ul>
            	</c:otherwise>
            </c:choose>
			<span class="header-scope">&nbsp;KYC Data Template</span>
        </div>
         <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
                    <button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'KYCDataTemplate', 'ViewRemarks','Viewing remark on view data template']);" >View Remarks</button>
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
		 modelAttribute="kycDataTemplateBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
		
		<textarea id="workflowId" style="display:none;"></textarea>
		<textarea id="stateId" style="display:none;"></textarea>
		<textarea id="masterId" style="display:none;"> ${kycDataTemplateBO.id} </textarea>
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
							<c:if test="${kycDataTemplateBO != null}"> 
								<div class="col-md-3 h5">${kycDataTemplateBO.templateName}</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${templateCodeLabel}
							</div>
							<c:if test="${kycDataTemplateBO != null}">
								<div class="col-md-3 h5">${kycDataTemplateBO.templateCode}</div>
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
							<c:if test="${kycDataTemplateBO != null}">
								<div class="col-md-3 h5">${kycDataTemplateBO.itgJurisdictionName}</div>
							</c:if>
							<div class="col-md-2 bold h5">
								${counterPartyLabel}
							</div>
							<c:if test="${kycDataTemplateBO != null}">
								<div class="col-md-3 h5">${kycDataTemplateBO.typeOfCounterPartyName}</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="form-group" style="margin-left: -1px;">
							<div class="col-md-2 bold h5">${rolesLabel}</div>
							<c:if test="${kycDataTemplateBO != null}">
								<div class="col-md-3 h5">
									<c:forEach items="${kycDataTemplateBO.roleName}" var="role" varStatus="loop">
									    ${role}
									   <c:if test="${!loop.last}">,</c:if>
									</c:forEach>
								</div>
							</c:if>
							<div class="col-md-2 bold h5">${entityTypeLabel}</div>
							<c:if test="${kycDataTemplateBO != null}">
								<div class="col-md-3 h5">
									<c:forEach items="${kycDataTemplateBO.legalEntityTypeNameList}" var="eachLEntity" varStatus="loop">
									    ${eachLEntity}
									   <c:if test="${!loop.last}">,</c:if>
									</c:forEach>
								</div>
							</c:if>
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
								<c:if test="${kycDataTemplateBO != null && kycDataTemplateBO.createdBy != null}">
									<span>${kycDataTemplateBO.createdBy}</span>
								</c:if>
							</div>
							<div class="col-md-2 bold h5">${createdDateLabel}</div>
							<div class="col-md-3 h5">
								<c:if test="${kycDataTemplateBO != null && kycDataTemplateBO.createdDate != null}">
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycDataTemplateBO.createdDate}" />
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
								<c:if test="${kycDataTemplateBO != null && kycDataTemplateBO.modifiedBy != null}">
									<span>${kycDataTemplateBO.modifiedBy}</span>
								</c:if>
							</div>
							<div class="col-md-2 bold h5">${modifiedDateLabel}</div>
							<div class="col-md-3 h5">
								<c:if test="${kycDataTemplateBO != null && kycDataTemplateBO.modifiedDate != null}">
									<fmt:formatDate pattern="dd-MMM-yyyy" value="${kycDataTemplateBO.modifiedDate}" />
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix margin-bottom-10"></div>
			<c:if test="${kycDataTemplateBO.fieldList != null}">
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li><em><strong>${fieldsDetailsLabel}</strong></em></li>
					</ul>
				</div>
				<hr style="border-top: 1px dashed; margin-top:-20px">
				<div id="viewFieldGrid"></div>
	 			<div class="clearfix margin-bottom-10"></div>
			</c:if>
 			<textarea id="fieldsViewData" style="display: none;">${fieldsViewData}</textarea>
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
		
		var data = $("#fieldsViewData").val();
		if(data.length > 0) {
			jQuery('#viewFieldGrid').jqxGrid("refresh");
		
			var source = {
				datatype : "json",
				localdata : data,
				datafields : [ 
				               {name : 'FieldMaster_shortcode',type : 'String'},
				               {name : 'Name',type : 'string'},
				               {name : 'DisplayName',type : 'string'},
				               {name : 'Description',type : 'string'}
				             ],
			};
			var dataAdapter = new $.jqx.dataAdapter(source);
	
			// Create jqxGrid
			$('#viewFieldGrid').jqxGrid({
				autoheight: true,
				width: '100%',
				source: dataAdapter,
				columnsresize : true,
				theme: 'ITGtheme',
				enabletooltips: true,
		        columnsreorder: true,
		        rowsheight: 50,
				columns : [
							{ text: 'Short Code', datafield: 'FieldMaster_shortcode', filtertype: 'input', width: '10%', align: 'left'},
							{ text: 'Field Name', datafield: 'Name', filtertype: 'input', width: '29%', align: 'left'},
							{ text: 'DisplayName', datafield: 'DisplayName', filtertype: 'input', width: '29%', align: 'left'},
							{ text: 'Description', datafield: 'Description', filtertype: 'input', width: '29%', align: 'left'}
				]
			});
		}
	});

	$('#closeButton').click(function() {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'Close','Closing data template view']);
	    console.log("Closing current window...");
	    window.close();
	});
	
	$('#cancelBtn').click(function() {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'Cancel','Cancel from approve']);
		location.href = "${contextPath}/dashboard";
	});
</script>