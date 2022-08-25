<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="search.label" var="searchLabel" />
<spring:message code="clear.label" var="clearLabel" />
<spring:message code="addNew.label" var="addNewLabel" />
<spring:message code="searchPanel.label" var="searchPanelLabel" />
<spring:message code="kycTemplate.templateName.label" var="templateNameLabel" />
<spring:message code="status.label" var="statusLabel" />
<spring:message code="itgJurisdiction.label" var="itgJurisdictionLabel" />
<spring:message code="typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="kycDataTemplate.legalEntityType.label" var="legalEntityTypeLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="jurisdictionName" value="<%= ITGConstant.JURISDICTION_NAME%>" />
<c:set var="riskCategoryName" value="<%= ITGConstant.RISK_CATEGORY_NAME%>" />
<c:set var="legalEntityTypeName" value="<%= ITGConstant.LEGAL_ENTITY_TYPE_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="jurisdictionShortCode" value="<%= ITGConstant.JURISDICTION_SHORT_CODE%>" />
<c:set var="riskCategoryShortCode" value="<%= ITGConstant.RISK_CATEGORY_SHORT_CODE%>" />
<c:set var="legalEntityTypeShortCode" value="<%= ITGConstant.LEGAL_ENTITY_SHORT_CODE%>" />


<c:choose>
	<c:when test="${! empty(templateSearchData)}">
		<c:set var="panelBlock" value="display:none;"></c:set>
		<c:set var="panelAction" value="expand"></c:set>
		<c:set var="searchResult" value="true"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="panelBlock" value="display:block;"></c:set>
		<c:set var="panelAction" value="collapse"></c:set>
		<c:set var="searchResult" value="false"></c:set>
	</c:otherwise>
</c:choose>

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a href="/digiKYC/dashboard/"><i class="fa fa-home"></i> Home <i class="fa fa-angle-right"></i></a></li>
				<li>${kycMasterMenuName}<i class="fa fa-angle-right"></i></li>
                <li>KYC Data Template<i class="fa fa-angle-right"></i></li>
				<li>Search</li>
			</ul>
			<span class="header-scope">KYC Data Template</span>
		</div>

		<c:if test="${successFlag != null}">
			<c:choose>
				<c:when test="${successFlag == true  && fn:length(successMessage)>0}">
					<div class="alert alert-success alertHide" style="padding: 9px;">
						<i class="fa fa-check"></i>&nbsp;${successMessage}
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
					</div>
				</c:when>
				<c:when test="${successFlag == false && fn:length(successMessage)>0}">
					<div class="alert alert-danger alertHide" style="padding: 9px;">
						<i class="fa fa-warning"></i>&nbsp;${successMessage}
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="alert alert-danger alertHide" style="padding: 9px;">
						<i class="fa fa-warning"></i>&nbsp;<spring:message code="label.exceptionMessage"></spring:message>. <spring:message code="label.sysAdmin"></spring:message>
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
					</div>
				</c:otherwise>
			</c:choose>
		</c:if>

		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
					<div class="pull-right">
						${addButton}
					</div>
					<div class="clearfix margin-bottom-5"></div>
					<div class="clearfix margin-bottom-10"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/template/searchfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels"
		 modelAttribute="kycDataTemplateBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<input type="hidden" id="instanceName" value="${instance}" />
			<div class="panel panel-default">
				<div class="panel-body">
					<div class=row>
						<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${templateNameLabel}</label>
										<form:select path="id" class="form-control select2me" data-parsley-required="false" placeholder="${templateNameLabel}">
											<form:option value=""></form:option>
											<c:if test="${kycDataTemplateBOs != null && kycDataTemplateBOs.size() > 0}">
												<c:forEach begin="0" end="${kycDataTemplateBOs.size() -1}" var="index">																													
													<form:option value="${kycDataTemplateBOs.get(index).id}">${kycDataTemplateBOs.get(index).templateName}</form:option>
												</c:forEach>
											</c:if>
										</form:select>
										<span class="bt-flabels__error-desc_select">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
						<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${itgJurisdictionLabel}</label>
										<form:select path="itgJurisdictionCode" class="form-control select2me" data-parsley-required="false" placeholder="${itgJurisdictionLabel}">
											<form:option value=""></form:option>
											<c:if test="${jurisdictionData != null && jurisdictionData.length() > 0}">
												<c:forEach begin="0" end="${jurisdictionData.length() -1}" var="index">
													<form:option value="${jurisdictionData.get(index).get(jurisdictionShortCode)}">${jurisdictionData.get(index).get(jurisdictionName)}</form:option>
												</c:forEach>
											</c:if>
										</form:select>
										<span class="bt-flabels__error-desc_select">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
						<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${typeOfCounterPartyLabel}</label>
										<form:select path="typeOfCounterPartyCode" class="form-control select2me" data-parsley-required="false" placeholder="${typeOfCounterPartyLabel}">
											<form:option value=""></form:option>
											<c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
												<c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
													<form:option value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</form:option>
												</c:forEach>
											</c:if>
										</form:select>
										<span class="bt-flabels__error-desc_select">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
						<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${legalEntityTypeLabel}</label>
										<select id="legalEntityTypeShortCodeList" name="legalEntityTypeShortCodeList" class="form-control select2me" placeholder="${legalEntityTypeLabel}">
											<option value=""></option>
											<c:if test="${legalEntityTypeData != null && legalEntityTypeData.length() > 0}">
												<c:forEach begin="0" end="${legalEntityTypeData.length() -1}" var="index">
													<option value="${legalEntityTypeData.get(index).get(legalEntityTypeShortCode)}">${legalEntityTypeData.get(index).get(legalEntityTypeName)}</option>
												</c:forEach>
											</c:if>
										<select>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
					</div>
					<!-- End Row -->
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">	
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${statusLabel}</label>
										<form:select Class="form-control select2me" path="isActive" id="status" data-parsley-required="false" placeholder="${statusLabel}">
											<form:option value=""></form:option>
											<form:option value="1">Active</form:option>
											<form:option value="0">In progress</form:option>
											<form:option value="3">Inactive</form:option>
										</form:select>
										<span class="bt-flabels__error-desc">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
						<div class="col-md-6 col-sm-6">
							${searchButtons}
						</div>
						<!-- End Column -->
					</div>
					<!-- End Row -->
			  	</div>
			  	<!-- End Panel body -->
			</div>
			<!-- End Panel -->
		</form:form>
		<div class="clearfix margin-bottom-5"></div>
		<textarea id="templateSearchJson" style="display: none;">${templateSearchData}</textarea>
		<input type="hidden" id="searchedEntityType" value="${entityTypeCode}"/>
		<c:if test="${!empty(templateSearchData)}">
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="templateJqxgrid"></div>
					</div>
				</div>
			</div>
		</c:if>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
		<div class="clearfix margin-bottom-10"></div>
	</div>
</div>

<script>

	jQuery(document).ready(function() {
		jQuery("#master").addClass("active");
		jQuery("#subject").remove("active");
		jQuery("#dashboard").remove("active");
		
		var entityTypeCode = $("#searchedEntityType").val();
		if(entityTypeCode!=""){
			$("#legalEntityTypeShortCodeList").val(entityTypeCode);
		}
	});

	$(window).bind("load", function() {
		
		var instanceName = $("#instanceName").val();
		if($("#templateSearchJson").val() != null && $("#templateSearchJson").val() != undefined && $("#templateSearchJson").val() != "") {
			var templateSearchJson = JSON.parse($("#templateSearchJson").val());
			console.log("templateSearchJson:::" + templateSearchJson);
			var templateDataSource = {
					datatype: "json",
					localdata: templateSearchJson,
					datafields: [
								{ name: 'templateName', type: 'string'},
								{ name: 'templateCode', type: 'string'},
								{ name: 'jurisdiction', type: 'string'},
								{ name: 'counterparty', type: 'string'},
								{ name: 'entityTypeName', type: 'string'},
								{ name: 'roleName', type: 'string'},
								{ name: 'approvalStatus', type: 'string'},
								{ name: 'status', type: 'string'},
								{ name: 'action', type: 'string'}
					],
				};
			var templateDataAdapter = new $.jqx.dataAdapter(templateDataSource);
			// Create jqxGrid
			$("#templateJqxgrid").jqxGrid(
					{
						width: '100%',
						source: templateDataAdapter,
						autoloadstate: false,
						autosavestate: false,
						groupable: true,
						groupsexpandedbydefault: true,
						sortable: true,
						pageable: true,
						theme: 'ITGtheme',
						height: 520,
						selectionmode: 'multiplecellsextended',
						showfilterrow: true,
						filterable: true,
						enabletooltips: true,
				        columnsresize: true,
				        columnsreorder: true,
				        rowsheight: 50,
						columns: [
						  { text: 'Template Name', datafield: 'templateName', filtertype: 'input', width: '15%', align: 'left'},
						  { text: 'Template Code', datafield: 'templateCode', filtertype: 'input', width: '8%', align: 'left'},
						  { text: 'Jurisdiction', datafield: 'jurisdiction', filtertype: 'input', width: '10%', align: 'left'},
						  { text: 'Party Type', datafield: 'counterparty', filtertype: 'input', width: '8%', align: 'left'},
						  { text: 'Legal Entity Types', datafield: 'entityTypeName', filtertype: 'input', width: '15%', align: 'left'},
						  { text: 'Roles', datafield: 'roleName', filtertype: 'input', width: '15%', align: 'left'},
						  { text: 'Approval Status', datafield: 'approvalStatus', filtertype: 'input', width: '10%', align: 'left'},
						  { text: 'Status', datafield: 'status', filtertype: 'input', width: '6%', align: 'left' , enabletooltips:false},
						  { text: 'Action', datafield: 'action', filtertype: 'input', width: '12%', align: 'left' , enabletooltips:false}
						],
						pageSize:templateSearchJson.length,
						pageSizeOptions:["5","10","20",templateSearchJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'SearchFilter','Filtering template']);
		var entityTypeShortCodes = [];
		if($("#legalEntityTypeShortCodeList").val()!=""){
			entityTypeShortCodes.push($("#legalEntityTypeShortCodeList").val());
		}
		$("#legalEntityTypeShortCodeList").val(entityTypeShortCodes);
		
		$('#frm').attr("action", "${contextPath}/kyc/dataTemplate/searchfilter");
		$('#frm').attr("method", "post");
		$('#frm').submit();
		buffer();
	});
	
	$('#addNewButton').click(function() {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'Add','Adding KYC Data template']);
		location.href = "${contextPath}/kyc/dataTemplate/add";
		buffer();
	});
	
	$('#clearButton').click(function() {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'Clear','Clear filter']);
		location.href = "${contextPath}/kyc/dataTemplate/search";
		buffer();
	});
	
	function getViewPage(contextPath, id) {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'View','Viewing template']);
		window.open(contextPath + "/kyc/dataTemplate/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
	
	function getEditPage(contextPath, id) {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'Edit','Editing template']);
		$('#frm').attr("action", contextPath + "/kyc/dataTemplate/editPage");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="templateEditId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	}
	
	function getAuditLogPage(contextPath, id) {
		_paq.push(['trackEvent', 'KYCDataTemplate', 'Audit','Auditing template']);
		$('#frm').attr("action", contextPath + "/kyc/dataTemplate/audit");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="auditTemplateId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	}
	
	function cloneTemplate(contextPath, id) {
		_paq.push(['trackEvent', 'KYCTemplate', 'Clone','Cloning Datatemplate']);
		var newForm = jQuery('<form>', {
	        'action': '${contextPath}/kyc/dataTemplate/clone',
	        'method':'POST'
	    }).append(jQuery('<input>', {
	        'name': 'id',
	        'value': id,
	        'type': 'hidden'
	    }));
		newForm.appendTo(document.body);
	    newForm.submit();		    
		buffer();
	}

	function setActivateOrDeactivate(contextPath, id, status) {
		var statusMessage = "Are you sure?";
		if(status == '1')
			statusMessage = "Are you sure you want to activate?";
		else if(status == '3')
			statusMessage = "Are you sure you want to deactivate?";
		bootbox.confirm({
	        message: statusMessage,
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
	        		if(status == '1')
	        			_paq.push(['trackEvent', 'KYCDataTemplate', 'Activate', 'Activating template']);
	        		else if(status == '3')
	        			_paq.push(['trackEvent', 'KYCDataTemplate', 'Deactivate', 'Deactivating template']);
		        	
	        		$('#frm').attr("action", contextPath + "/kyc/dataTemplate/process");
	        		$('#frm').attr("method", "post");
	        		$('#frm').append('<input type="hidden" name="masterId" value="' +id+ '" />');
	        		$('#frm').append('<input type="hidden" name="masterStatus" value="' +status+ '" />');
	        		$('#frm').submit();
	        		buffer();
	        	}
	        }
		});
		
	}
</script>