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
<spring:message code="documentLibrary.documentName.label" var="documentNameLabel" />
<spring:message code="status.label" var="statusLabel" />
<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />

<spring:message code="app.kycMasterMenuName" var="kycMasterMenuName" />

<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />
<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${! empty(documentLibrarySearchData)}">
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
                <li>Document Library<i class="fa fa-angle-right"></i></li>
				<li>Search</li>
			</ul>
			<!-- <h4>&nbsp;Document Library</h4> -->
			<span class="header-scope">&nbsp;Document Library</span>
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

		<form:form action="${contextPath}/kyc/document/searchfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" 
			modelAttribute="documentLibraryBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<div class="panel panel-default">
			  <div class="panel-body">
			  		<div class=row>
			  		
			  			<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">	
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${documentNameLabel}</label>
										<form:select path="id" class="form-control select2me" data-parsley-required="false" placeholder="${documentNameLabel}">
											<form:option value=""></form:option>
											<c:if test="${dropdownData != null && dropdownData.size() > 0}">
												<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
													<form:option value="${dropdownData.get(index).id}">${dropdownData.get(index).documentName}</form:option>
												</c:forEach>															
											</c:if>
										</form:select>
										<span class="bt-flabels__error-desc">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
						
			  			<div class="col-md-3 col-sm-6">
                           <div class="bt-form__wrapper">
                              <div class="form-group uk-width-1-1">
                                 <div class="bt-flabels__wrapper">
                                    <input type="hidden" id="counterPartyType" value="${counterPartyType}"/>
                                    <label class="parsley_hide">${counterPartyTypeLabel}</label>
                                    <select id="typeOfCounterpartyCode" name="typeOfCounterpartyCode" class="form-control select2me" placeholder="${counterPartyTypeLabel}">
                                       <option value=""></option>
                                       <c:if test="${counterPartyData != null && counterPartyData.length() > 0}">
                                          <c:forEach begin="0" end="${counterPartyData.length() -1}" var="index">
                                             <option  value="${counterPartyData.get(index).get(counterPartyShortCode)}">${counterPartyData.get(index).get(counterPartyName)}</option>
                                          </c:forEach>
                                       </c:if>
                                    </select>
                                 </div>
                              </div>
                           </div>
                        </div>
						
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
						
						<div class="col-md-3 col-sm-6">
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
		<textarea id="documentSearchJson" style="display: none;">${documentLibrarySearchData}</textarea>
		<c:if test="${!empty(documentLibrarySearchData)}">
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="documentJqxgrid"></div>
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
		
		var counterPartyType = $("#counterPartyType").val();
		if(counterPartyType!=""){
			$("#typeOfCounterpartyCode").val(counterPartyType);
		}
	});
	
	$(window).bind("load", function() {
		
		if($("#documentSearchJson").val() != null && $("#documentSearchJson").val() != undefined && $("#documentSearchJson").val() != "") {
			var documentSearchJson = JSON.parse($("#documentSearchJson").val());
			console.log("documentSearchJson:::" + documentSearchJson);
			var documentDataSource =
			{
				datatype: "json",
				localdata: documentSearchJson,
				datafields: [
							{ name: 'documentName', type: 'string'},
							{ name: 'typeOfCounterpartyName', type: 'string'},
							{ name: 'approvalStatus', type: 'string'},
							{ name: 'status', type: 'string'},
							{ name: 'action', type: 'string'}
							],
			};
			var documentDataAdapter = new $.jqx.dataAdapter(documentDataSource);
			// Create jqxGrid
			$("#documentJqxgrid").jqxGrid(
			{
				width: '100%',
				source: documentDataAdapter,
				autoloadstate: false,
				autosavestate: false,
				groupable: true,
				groupsexpandedbydefault: true,
				sortable: true,
				pageable: true,
				theme: 'ITGtheme',
				height: 480,
				selectionmode: 'multiplecellsextended',
				showfilterrow: true,
				filterable: true,
				enabletooltips: true,
		        columnsresize: true,
		        columnsreorder: true,
		        rowsheight: 50,
				columns: [
				  { text: 'Document Name', datafield: 'documentName', filtertype: 'input', width: '30%', align: 'left'},
				  { text: 'Counterparty(CP) Type', datafield: 'typeOfCounterpartyName', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Approval Status', datafield: 'approvalStatus', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Status', datafield: 'status', filtertype: 'input', width: '15%', align: 'left', enabletooltips:false},
				  { text: 'Action', datafield: 'action', filtertype: 'input', width: '15%', align: 'left' , enabletooltips:false}
				],
				pageSize:documentSearchJson.length,
				pageSizeOptions:["5","10","20",documentSearchJson.length]				
			});
		}
	});
	
	$('#searchButton').click(function() {
		_paq.push(['trackEvent', 'DocumentLibrary', 'SearchFilter','Filtering document']);
		var typeOfCounterpartyCode = [];
		if($("#typeOfCounterpartyCode").val()!=""){
			typeOfCounterpartyCode.push($("#typeOfCounterpartyCode").val());
		}
		$("#typeOfCounterpartyCode").val(typeOfCounterpartyCode);
		$('#frm').submit();
		buffer();
	});
	
	$('#addNewButton').click(function() {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Add','Adding document']);
		location.href = "${contextPath}/kyc/document/add";
		buffer();
	});
	
	$('#clearButton').click(function() {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Clear','Clear filter']);
		location.href = "${contextPath}/kyc/document/search";
		buffer();
	});
	
	function getViewPage(contextPath, id) {
		_paq.push(['trackEvent', 'DocumentLibrary', 'View', 'Viewing document']);
		window.open(contextPath + "/kyc/document/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
	
	function getEditPage(contextPath, id) {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Edit','Editing document']);
		$('#frm').attr("action", contextPath + "/kyc/document/editPage");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="editDocumentId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	}
	
	function getAuditLogPage(contextPath, id) {
		_paq.push(['trackEvent', 'DocumentLibrary', 'Audit','Auditing document']);
		$('#frm').attr("action", contextPath + "/kyc/document/audit");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="auditDocumentId" value="' +id+ '" />');
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
	        		if(status == '1')
	        			_paq.push(['trackEvent', 'DocumentLibrary', 'Activate', 'Activating document']);
	        		else if(status == '3')
	        			_paq.push(['trackEvent', 'DocumentLibrary', 'Deactivate', 'Deactivating document']);
        			
	        		$('#frm').attr("action", contextPath + "/kyc/document/process");
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