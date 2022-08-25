<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<spring:message code="search.label" var="searchLabel" />
<spring:message code="clear.label" var="clearLabel" />
<spring:message code="addNew.label" var="addNewLabel" />
<spring:message code="searchPanel.label" var="searchPanelLabel" />
<spring:message code="consentMaster.consentName.label" var="consentNameLabel" />
<spring:message code="status.label" var="statusLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${! empty(consentSearchData)}">
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
                <li>Consent Master<i class="fa fa-angle-right"></i></li>
				<li>Search</li>
			</ul>
			<!-- <h4>&nbsp;Consent Master</h4> -->
			<span class="header-scope">Consent Master</span>
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

		<form:form action="${contextPath}/kyc/consent/searchfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" data-parsley-validate="true" 
		modelAttribute="consentMasterBO" data-parsley-errors-messages-disabled="true">
			<div class="panel panel-default">
			  <div class="panel-body">
			  		<div class=row>
						<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${consentNameLabel}</label>
										<form:select path="id" class="form-control select2me" data-parsley-required="false" placeholder="${consentNameLabel}">
											<form:option value=""></form:option>
											<c:if test="${dropdownData != null && dropdownData.size() > 0}">
												<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
													<form:option value="${dropdownData.get(index).id}">${dropdownData.get(index).consentName}</form:option>
												</c:forEach>
											</c:if>
										</form:select>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
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
		<textarea id="consentSearchJson" style="display: none;">${consentSearchData}</textarea>

		<c:if test="${!empty(consentSearchData)}">
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="consentJqxgrid"></div>
					</div>
				</div>
			</div>
		</c:if>
		<div class="clearfix margin-bottom-20"></div>
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
		
		if($("#consentSearchJson").val() != null && $("#consentSearchJson").val() != undefined && $("#consentSearchJson").val() != "") {
			var consentSearchJson = JSON.parse($("#consentSearchJson").val());
			console.log("consentSearchJson:::" + JSON.stringify(consentSearchJson));
			var consentDataSource =
			{
				datatype: "json",
				localdata: consentSearchJson,
				datafields: [
							{ name: 'consentName', 		type: 'string'},
							{ name: 'consentCode', 		type: 'string'},
							{ name: 'effectiveDate', 	type: 'date'},
							{ name: 'effectiveEndDate', type: 'date'},
							{ name: 'counterparty', 	type: 'string'},
							{ name: 'approvalStatus',	type: 'string'},
							{ name: 'status', 			type: 'string'},
							{ name: 'action', 			type: 'string'}
							],
			};
			var consentDataAdapter = new $.jqx.dataAdapter(consentDataSource);
			// Create jqxGrid
			$("#consentJqxgrid").jqxGrid(
			{
				width: '100%',
				source: consentDataAdapter,
				autoloadstate: false,
				autosavestate: false,
				groupable: true,
				groupsexpandedbydefault: true,
				sortable: true,
				pageable: true,
				theme: 'ITGtheme',
				height: 500,
				selectionmode: 'multiplecellsextended',
				showfilterrow: true,
				filterable: true,
				enabletooltips: true,
		        columnsresize: true,
		        columnsreorder: true,
		        rowsheight: 50,
				columns: [
				  { text: 'Consent Name', 		datafield: 'consentName', 		filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Consent Code', 		datafield: 'consentCode', 		filtertype: 'input', width: '15%', align: 'left'},
				  { text: 'Effective Date', 	datafield: 'effectiveDate', 	filtertype: 'range', width: '10%', align: 'left', cellsformat: 'dd-MMM-yyyy'},
				  { text: 'Effective End Date', datafield: 'effectiveEndDate', 	filtertype: 'range', width: '10%', align: 'left', cellsformat: 'dd-MMM-yyyy'},
				  { text: 'Counter Party', 		datafield: 'counterparty', 		filtertype: 'input', width: '15%', align: 'left'},
				  { text: 'Approval Status',	datafield: 'approvalStatus',	filtertype: 'input', width: '10%', align: 'left'},
				  { text: 'Status',             datafield: 'status',			filtertype: 'input', width: '10%', align: 'left' , enabletooltips:false},
				  { text: 'Action', 			datafield: 'action', 			filtertype: 'input', width: '10%', align: 'left' , enabletooltips:false}
				],
				pageSize:consentSearchJson.length,
				pageSizeOptions:["5","10","20",consentSearchJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {
		_paq.push(['trackEvent', 'ConsentMaster', 'SearchFilter','Filtering consent']);
		$('#frm').submit();
		buffer();
	});
	
	$('#addNewButton').click(function() {
		_paq.push(['trackEvent', 'ConsentMaster', 'Add','Adding consent']);
		location.href = "${contextPath}/kyc/consent/add";
		buffer();
	});
	
	$('#clearButton').click(function() {
		_paq.push(['trackEvent', 'ConsentMaster', 'Clear','Clear filter']);
		location.href = "${contextPath}/kyc/consent/search";
		buffer();
	});
	
	function getEditPage(contextPath, id) {
		_paq.push(['trackEvent', 'ConsentMaster', 'Edit','Editing consent']);
		$('#frm').attr("action", contextPath + "/kyc/consent/editPage");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="consentEditId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	}
	
	function getAuditLogPage(contextPath, id) {
		_paq.push(['trackEvent', 'ConsentMaster', 'Audit','Auditing consent']);
		$('#frm').attr("action", contextPath + "/kyc/consent/audit");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="auditConsentId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	} 

	function getViewPage(contextPath, id) {
		_paq.push(['trackEvent', 'ConsentMaster', 'View','Viewing consent']);
		window.open(contextPath + "/kyc/consent/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
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
	        			_paq.push(['trackEvent', 'ConsentMaster', 'Activate','Activating consent']);
	        		else if(status == '3')
	        			_paq.push(['trackEvent', 'ConsentMaster', 'Deactivate','Deactivating consent']);
	        		$('#frm').attr("action", contextPath + "/kyc/consent/process");
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