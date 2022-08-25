<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="close.label" var="closeLabel" />
<spring:message code="kycTemplate.templateDetails.label" var="templateDetailsLabel" />
<spring:message code="kycTemplate.templateName.label" var="templateNameLabel" />
<spring:message code="kycTemplate.templateCode.label" var="templateCodeLabel" />
<spring:message code="kycTemplate.jurisdiction.label" var="jurisdictionLabel" />
<spring:message code="typeOfCounterParty.label" var="counterPartyLabel" />
<spring:message code="kycTemplate.riskCategory.label" var="riskCategoryLabel" />
<spring:message code="kycTemplate.roles.label" var="rolesLabel" />
<spring:message code="createdBy.label" var="createdByLabel" />
<spring:message code="createdDate.label" var="createdDateLabel" />
<spring:message code="modifiedBy.label" var="modifiedByLabel" />
<spring:message code="modifiedDate.label" var="modifiedDateLabel" />
<spring:message code="kycDataTemplate.legalEntityType.label" var="entityTypeLabel" />
<spring:message code="kycDataTemplate.fieldsDetails.label" var="fieldsDetailsLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i class="fa fa-angle-right"></i></li>
				<li><!-- <a href="#"> -->${kycMasterMenuName}<!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li>KYC Data Template<i class="fa fa-angle-right"></i></li>
                <li>Audit View</li>
            </ul>
			<span class="header-scope">&nbsp;KYC Data Template</span>
        </div>
        
         <div class="row">
            <div class="col-md-12">
                <div class="portlet-body form">
                    <div class="pull-right">
                    	<button type="button" class="btn-remark btn-link" data-toggle="modal" data-target="#remarkHistoryModalId" onclick="_paq.push(['trackEvent', 'KYCDataTemplate', 'ViewRemarks','Viewing remark on auditview data template']);" >View Remarks</button>
                        <button type="button" id="closeButton" class="btn-itg btn btn-sm grey-gallery"><img src="/digiKYC/assets/global/img/clear.png" /> ${closeLabel} </button>
                    </div>
                    <div class="clearfix margin-bottom-5"></div>
                </div>
            </div>
        </div>

		<form:form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels"
		 modelAttribute="kycDataTemplateBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
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
		_paq.push(['trackEvent', 'KYCDataTemplate', 'Close','Closing Data template audit view']);
	    console.log("Closing current window...");
	    window.close();
	});
</script>