<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="search.label" var="searchLabel" />
<spring:message code="clear.label" var="clearLabel" />
<spring:message code="addNew.label" var="addNewLabel" />
<spring:message code="searchPanel.label" var="searchPanelLabel" />
<spring:message code="defaultDocument.templateName.label" var="templateNameLabel" />
<spring:message code="defaultDocument.typeOfCounterParty.label" var="typeOfCounterPartyLabel" />
<spring:message code="status.label" var="statusLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />

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
				<li><i class="fa fa-home"></i>Home<i class="fa fa-angle-right"></i></li>
				<li>${kycMasterMenuName}<i class="fa fa-angle-right"></i></li>
                <li>Default Document<i class="fa fa-angle-right"></i></li>
				<li>Search</li>
			</ul>
			<!-- <h4>&nbsp;Default Document</h4> -->
			<span class="header-scope">&nbsp;Default Document</span>
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
						${buttons}
						<%-- <button type="button" id="searchButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-check-circle"></em> ${searchLabel}
						</button>

						<button type="button" id="clearButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-times-circle"></em> ${clearLabel}
						</button>
						
						<button type="button" id="addNewButton" class="btn btn-sm grey-gallery">
							<em class="fa fa-plus"></em> ${addNewLabel}
						</button> --%>
					</div>
					<div class="clearfix margin-bottom-5"></div>
				</div>
			</div>
		</div>

		<form:form action="${contextPath}/kyc/defaultDocument/searchfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels"
		 modelAttribute="kycTemplateBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet search bg-inverse">
						<%-- <div class="portlet-title search-title">
							<div class="caption">
								<i class="fa fa-search"></i><span class="pull-left font-12 bolder">${searchPanelLabel}</span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="${panelAction}"> </a>
								</a>
							</div>
						</div> --%>
						
						<div class="portlet-body form">
							<div class="row">
								<div class="col-md-3">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">${templateNameLabel}</label>
												<form:select path="id" class="form-control select2me" data-parsley-required="false" placeholder="${templateNameLabel}">
													<form:option value=""></form:option>
													
													<c:if test="${kycTemplateBOs != null && kycTemplateBOs.size() > 0}"> 											
															<c:forEach begin="0" end="${kycTemplateBOs.size() - 1}" var="index">
																	<form:option value="${kycTemplateBOs.get(index).id}">${kycTemplateBOs.get(index).templateName}</form:option>
															</c:forEach>
													</c:if>
												</form:select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div>
								<%-- <div class="col-md-3">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">Template Code</label>
												<form:select path="templateCode" class="form-control select2me" data-parsley-required="false" placeholder="Template Code">
													<form:option value=""></form:option>
													<c:forEach var="entry" items="${templateData.templateCodeList}">
													<form:option value="${entry.key}">${entry.value}</form:option>
													</c:forEach>
												</form:select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div> --%>
								<div class="col-md-3">
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
													<%-- <c:if test="${dropdownData != null && dropdownData.getJSONArray('counterparty') != null && dropdownData.getJSONArray('counterparty').length() > 0}"> 		
														<c:forEach begin="0" end="${dropdownData.getJSONArray('counterparty').length() -1}" var="index">
															<form:option value="${dropdownData.getJSONArray('counterparty').get(index)}">${dropdownData.getJSONArray('counterparty').get(index)}</form:option>
														</c:forEach>														
													</c:if> --%>
												</form:select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3">
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
		<textarea id="templateSearchJson" style="display: none;">${templateSearchData}</textarea>
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
	});

	$(window).bind("load", function() {
		
		if($("#templateSearchJson").val() != null && $("#templateSearchJson").val() != undefined && $("#templateSearchJson").val() != "") {
			var templateSearchJson = JSON.parse($("#templateSearchJson").val());
			console.log("templateSearchJson:::" + templateSearchJson);
			var templateDataSource =
			{
				datatype: "json",
				localdata: templateSearchJson,
				datafields: [
							{ name: 'templateName', type: 'string'},
							{ name: 'templateCode', type: 'string'},
							{ name: 'jurisdiction', type: 'string'},
							{ name: 'counterparty', type: 'string'},
							{ name: 'riskCategory', type: 'string'},
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
				  { text: 'Template Name', datafield: 'templateName', filtertype: 'input', width: '16%', align: 'left'},
				  { text: 'Template Code', datafield: 'templateCode', filtertype: 'input', width: '16%', align: 'left'},
				  { text: 'Counter Party', datafield: 'counterparty', filtertype: 'input', width: '16%', align: 'left'},
				  { text: 'Approval Status', datafield: 'approvalStatus', filtertype: 'input', width: '16%', align: 'left'},
				  { text: 'Status', datafield: 'status', filtertype: 'input', width: '16%', align: 'left', enabletooltips:false},
				  { text: 'Action', datafield: 'action', filtertype: 'input', width: '20%', align: 'left', enabletooltips:false}
				],
				pageSize:templateSearchJson.length,
				pageSizeOptions:["5","10","20",templateSearchJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {
		$('#frm').attr("action", "${contextPath}/kyc/defaultDocument/searchfilter");
		$('#frm').attr("method", "post");
		$('#frm').submit();
		buffer();
	});
	
	$('#addNewButton').click(function() {
		location.href = "${contextPath}/kyc/defaultDocument/add";
		buffer();
	});
	
	$('#clearButton').click(function() {
		location.href = "${contextPath}/kyc/defaultDocument/search";
		buffer();
	});
	
	function getViewPage(contextPath, id) {
		window.open(contextPath + "/kyc/defaultDocument/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
	
	function getEditPage(contextPath, id) {
		$('#frm').attr("action", contextPath + "/kyc/defaultDocument/editPage");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="templateEditId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	}
	
	function getAuditLogPage(contextPath, id) {
		$('#frm').attr("action", contextPath + "/kyc/defaultDocument/audit");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="auditTemplateId" value="' +id+ '" />');
		$('#frm').submit();
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
	        		$('#frm').attr("action", contextPath + "/kyc/defaultDocument/process");
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


