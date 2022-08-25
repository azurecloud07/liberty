<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:message code="app.isGivenName" var="isGivenName" />
<spring:message code="app.isAddKYCSubjectButton" var="isAddKYCSubjectButton" />

<c:set var="counterPartyShortCode" value="<%= ITGConstant.COUNTER_PARTY_SHORT_CODE%>" />
<c:set var="counterPartyName" value="<%= ITGConstant.COUNTER_PARTY_NAME%>" />

<%
	String userName = "";
	if(session.getAttribute("userName") != null) {
		userName = (String)session.getAttribute("userName");
	}
%>

<spring:message code="kycSubject.counterPartyType.label" var="counterPartyTypeLabel" />
<spring:message code="search.label" var="searchLabel" />
<spring:message code="clear.label" var="clearLabel" />
<spring:message code="addNew.label" var="addNewLabel" />
<spring:message code="searchPanel.label" var="searchPanelLabel" />
<spring:message code="kycSubject.firstName.label" var="firstNameLabel" />
<spring:message code="kycSubject.givenName.label" var="givenNameLabel" />
<spring:message code="kycSubject.middleName.label" var="middleNameLabel" />
<spring:message code="kycSubject.lastName.label" var="lastNameLabel" />
<spring:message code="kycSubject.registrationName.label" var="registrationNameLabel" />
<spring:message code="kycSubject.countryOfIncorp.label" var="countryOfIncorpLabel" />
<spring:message code="status.label" var="statusLabel" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<input type="hidden" id="instanceName" value="${instance}" />
<c:choose>
	<c:when test="${! empty(subjectSearchData)}">
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

<style>
	#firstNameDiv, #givenNameDiv, #middleNameDiv, #lastNameDiv, #registrationNameDiv, #countryOfIncorpDiv {
		display : none;
	}
</style>
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar search-page-bar">
			<ul class="page-breadcrumb pull-right">
				<li><a href="/digiKYC/dashboard/"><i class="fa fa-home"></i> Home <i
					class="fa fa-angle-right"></i></a></li>
				<li>KYC Subjects<i class="fa fa-angle-right"></i></li>
				<li>Search</li>
			</ul>
			<!-- <h4>&nbsp;KYC Subject</h4> -->
            <span class="header-scope">KYC Subject</span>
            
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
		
		<c:if test="${isAddKYCSubjectButton == 'true'}">
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
		</c:if>

		<form:form action="${contextPath}/kyc/subject/searchfilter" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels" 
		modelAttribute="kycSubjectBO" data-parsley-validate="true" data-parsley-errors-messages-disabled="true">
			<input type="hidden" id="isGivenName" value="${isGivenName}" />
			<div class="panel panel-default">
			  <div class="panel-body">
			  		<div class=row>
			  			<div class="col-md-3 col-sm-6">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${counterPartyTypeLabel}</label>
										<form:select path="typeOfCounterpartyCode" class="form-control select2me" data-parsley-required="false" placeholder="${counterPartyTypeLabel}">
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
						<c:choose>
							<c:when test="${isGivenName == 'false'}">
								<div class="col-md-3 col-sm-6" id="firstNameDiv">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">${firstNameLabel}</label>
												<form:select path="firstName" class="form-control select2me" data-parsley-required="false" placeholder="${firstNameLabel}">													
													<form:option value=""></form:option>
													<c:if test="${dropdownData.size() > 0}">
														<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
														<c:set var="firstName" value="${dropdownData.get(index).firstName}" />
														<c:if test="${firstName != null && not empty firstName}">
															<form:option value="${firstName}">${firstName}</form:option>
														</c:if>
														</c:forEach>
													</c:if>
												</form:select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div>
								<!-- End Column -->
								<div class="col-md-3 col-sm-6" id="middleNameDiv">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">${middleNameLabel}</label>
												<form:select path="middleName" class="form-control select2me" data-parsley-required="false" placeholder="${middleNameLabel}">													
													<form:option value=""></form:option>
													<c:if test="${dropdownData.size() > 0}">
														<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
														<c:set var="middleName" value="${dropdownData.get(index).middleName}" />
														<c:if test="${middleName != null && not empty middleName}">
															<form:option value="${middleName}">${middleName}</form:option>
														</c:if>
														</c:forEach>
													</c:if>
												</form:select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div>
								<!-- End Column -->
							</c:when>
							<c:otherwise>
								<div class="col-md-3 col-sm-6" id="givenNameDiv">
									<div class="bt-form__wrapper">
										<div class="form-group uk-width-1-1">
											<div class="bt-flabels__wrapper">
												<label class="parsley_hide">${givenNameLabel}</label>
												<form:select path="givenName" class="form-control select2me" data-parsley-required="false" placeholder="${givenNameLabel}">													
													<form:option value=""></form:option>
													<c:if test="${dropdownData.size() > 0}">
														<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
														<c:set var="givenName" value="${dropdownData.get(index).givenName}" />
														<c:if test="${givenName != null && not empty givenName}">
															<form:option value="${givenName}">${givenName}</form:option>
														</c:if>
														</c:forEach>
													</c:if>
												</form:select>
												<span class="bt-flabels__error-desc_select">Required</span>
											</div>
										</div>
									</div>
								</div>
								<!-- End Column -->
							</c:otherwise>
						</c:choose>
						
						<div class="col-md-3 col-sm-6" id="lastNameDiv">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${lastNameLabel}</label>
										<form:select path="lastName" class="form-control select2me" data-parsley-required="false" placeholder="${lastNameLabel}">													
											<form:option value=""></form:option>
											<c:if test="${dropdownData.size() > 0}">
												<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
												<c:set var="lastName" value="${dropdownData.get(index).lastName}" />
												<c:if test="${lastName != null && not empty lastName}">
													<form:option value="${lastName}">${lastName}</form:option>
												</c:if>
												</c:forEach>
											</c:if>
										</form:select>
										<span class="bt-flabels__error-desc_select">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
						<div class="col-md-3 col-sm-6" id="registrationNameDiv">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${registrationNameLabel}</label>
										<form:select path="registrationName" class="form-control select2me" data-parsley-required="false" placeholder="${registrationNameLabel}">													
											<form:option value=""></form:option>
											<c:if test="${dropdownData.size() > 0}">
												<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
													<c:set var="registrationName" value="${dropdownData.get(index).registrationName}" />
													<c:if test="${registrationName != null && not empty registrationName}">
														<form:option value="${dropdownData.get(index).registrationName}">${registrationName}</form:option>
													</c:if>
												</c:forEach>
											</c:if>
										</form:select>
										<span class="bt-flabels__error-desc_select">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
						<div class="col-md-3 col-sm-6" id="countryOfIncorpDiv">
							<div class="bt-form__wrapper">
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${countryOfIncorpLabel}</label>
										<form:select path="countryOfIncorporationCode" class="form-control select2me" data-parsley-required="false" placeholder="${countryOfIncorpLabel}">													
											<form:option value=""></form:option>
											<c:if test="${dropdownData.size() > 0}">
												<c:forEach begin="0" end="${dropdownData.size() -1}" var="index">
												<c:set var="countryOfIncorporationName" value="${dropdownData.get(index).countryOfIncorporationName}" />
												<c:if test="${countryOfIncorporationName != null && not empty countryOfIncorporationName}">
													<form:option value="${dropdownData.get(index).countryOfIncorporationCode}">${countryOfIncorporationName}</form:option>
												</c:if>
												</c:forEach>
											</c:if>
										</form:select>
										<span class="bt-flabels__error-desc_select">Required</span>
									</div>
								</div>
							</div>
						</div>
						<!-- End Column -->
					</div>
					<!-- End Row -->
					<div class="row">
						<div class="col-md-3 col-sm-6" id="statusDiv">
							<div class="bt-form__wrapper">	
								<div class="form-group uk-width-1-1">
									<div class="bt-flabels__wrapper">
										<label class="parsley_hide">${statusLabel}</label>
										<form:select Class="form-control select2me" path="isActive" id="status" data-parsley-required="false" placeholder="${statusLabel}">
											<form:option value=""></form:option>
											<form:option value="1">Active</form:option>
											<form:option value="0">In progress</form:option>
											<form:option value="2">Inactive</form:option>
										</form:select>
									</div>
								</div>
							</div>
						</div>
						<!--  End Column-->
						<div class="col-md-6 col-sm-6">
							${searchButtons}
						</div>
					</div>
					<!-- End Row -->
			  </div>
			  <!-- End Panel body -->
			</div>
			<!-- End Panel -->
		</form:form>
		<div class="clearfix margin-bottom-5"></div>
		<textarea id="subjectSearchJson" style="display: none;">${subjectSearchData}</textarea>
		<textarea id="typeOfCounterpartyCode" style="display:none;">${kycSubjectBO.typeOfCounterpartyCode}</textarea>
		<textarea id="inCorpCountryCode" style="display:none;">${kycSubjectBO.countryOfIncorporationCode}</textarea>
		<textarea id="inCorpCountryName" style="display:none;">${kycSubjectBO.countryOfIncorporationName}</textarea>
		<c:if test="${!empty(subjectSearchData)}">
			<div class="row">
				<div class="col-md-12">
					<div id='jqxWidget'>
						<div id="subjectJqxgrid"></div>
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
	var instanceName = $("#instanceName").val();
	var counterPartyType = $("#typeOfCounterpartyCode").val();
	var isGivenName;
	jQuery(document).ready(function() {
		jQuery("#subject").addClass("active");
		jQuery("#master").removeClass("active");
		jQuery("#dashboard").removeClass("active");
		isGivenName = $("#isGivenName").val();
		if(counterPartyType === 'Individual') {
			if(isGivenName == 'true') {
				$("#givenNameDiv").show();
			}else{
				$("#firstNameDiv").show();
				$("#middleNameDiv").show();
			}
			
			$("#lastNameDiv").show();
		}
		else if(counterPartyType === 'Entity') {
			$("#registrationNameDiv").show();
			$("#countryOfIncorpDiv").show();
		}
		else {
			if(isGivenName == 'true') {
				$("#givenNameDiv").hide();
			}else{
				$("#firstNameDiv").hide();
				$("#middleNameDiv").hide();
			}				
			
			$("#lastNameDiv").hide();
			$("#registrationNameDiv").hide();
			$("#countryOfIncorpDiv").hide();
		}
	});
	
	$(window).bind("load", function() {
		
		if($("#typeOfCounterpartyCode").val() === 'Entity') {
			var uniqueCountry = {};
			$('#countryOfIncorporationCode option').each(function () {
			    if (uniqueCountry[this.value]) {
			        $(this).remove()
			    }
			    uniqueCountry[this.value] = true;
			});
		}
		
		if($("#subjectSearchJson").val() != null && $("#subjectSearchJson").val() != undefined && $("#subjectSearchJson").val() != "") {
			var subjectSearchJson = JSON.parse($("#subjectSearchJson").val());
			// console.log("subjectSearchJson:::" + JSON.stringify(subjectSearchJson));
			var subjectDataSource =
			{
				datatype: "json",
				localdata: subjectSearchJson,
				datafields: [
							{ name: 'kycSubjectRequestNumber', type: 'string'},
							{ name: 'name', type: 'string'},
							{ name: 'typeOfCounterparty', type: 'string'},
							{ name: 'countryOfResidencyName', type: 'string'},
							{ name: 'approvalStatus',			type: 'string'},
							{ name: 'status', 			type: 'string'},		
							{ name: 'action', type: 'string'}
							],
			};
			var subjectDataAdapter = new $.jqx.dataAdapter(subjectDataSource);
			// Create jqxGrid
			$("#subjectJqxgrid").jqxGrid(
			{
				width: '100%',
				source: subjectDataAdapter,
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
				  { text: 'Request Number', datafield: 'kycSubjectRequestNumber', filtertype: 'input', width: '10%', align: 'left'},
				  { text: 'Counterparty Type', datafield: 'typeOfCounterparty', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Name', datafield: 'name', filtertype: 'input', width: '25%', align: 'left'},
				  //{ text: 'Country of Residence', datafield: 'countryOfResidencyName', filtertype: 'input', width: '12%', align: 'left'},
				  { text: 'Approval Status',	datafield: 'approvalStatus', filtertype: 'input', width: '20%', align: 'left'},
				  { text: 'Status', datafield: 'status', filtertype: 'input', width: '10%', align: 'left' , enabletooltips:false},  
				  { text: 'Action', datafield: 'action', filtertype: 'input', width: '15%', align: 'left' , enabletooltips:false}
				],
				//--pageSize:subjectSearchJson.length,
				//--pageSizeOptions:["5","10","20",subjectSearchJson.length]				
			});
			var subjectGridRows = $('#subjectJqxgrid').jqxGrid('getrows');
	        var subjectGridCount = subjectGridRows.length;
	        if (subjectGridCount > 10) {
	        	$('#subjectJqxgrid').jqxGrid({ pageable: true, pagesize: 10 });
	       	}
		}
	});
	
	$('#searchButton').click(function() {
		_paq.push(['trackEvent', 'KYCSubject', 'SearchFilter']);
		$('#frm').attr("action", "${contextPath}/kyc/subject/searchfilter");
		$('#frm').attr("method", "post");
		$('#frm').submit();
		buffer();
	});
	
	$('#typeOfCounterpartyCode').change(function() {
		if($("#typeOfCounterpartyCode").val() === 'Entity') {
			if(isGivenName == 'true') {
				$("#givenNameDiv").hide();
			}else{
				$("#firstNameDiv").hide();
				$("#middleNameDiv").hide();
			}
			
			$("#lastNameDiv").hide();
			$("#registrationNameDiv").show();
			$("#countryOfIncorpDiv").show();
			var uniqueCountry = {};
			$('#countryOfIncorporationCode option').each(function () {
			    if (uniqueCountry[this.value]) {
			        $(this).remove()
			    }
			    uniqueCountry[this.value] = true;
			});
		}
		else if($("#typeOfCounterpartyCode").val() === 'Individual') {
			$("#registrationNameDiv").hide();
			$("#countryOfIncorpDiv").hide();
			if(isGivenName == 'true') {
				$("#givenNameDiv").show();
			}else{
				$("#firstNameDiv").show();
				$("#middleNameDiv").show();
			} 
			
			$("#lastNameDiv").show();
		}
		else {
			if(isGivenName == 'true') {
				$("#givenNameDiv").hide();
			}else{
				$("#firstNameDiv").hide();
				$("#middleNameDiv").hide();
			}
			
			$("#lastNameDiv").hide();
			$("#registrationNameDiv").hide();
			$("#countryOfIncorpDiv").hide();
		}
	});
	
	$('#addNewButton').click(function() {
		_paq.push(['trackEvent', 'KYCSubject', 'Add']);
		location.href = "${contextPath}/kyc/subject/add";
		buffer();
	});
	
	$('#clearButton').click(function() {
		_paq.push(['trackEvent', 'KYCSubject', 'Clear']);
		location.href = "${contextPath}/kyc/subject/search";
		buffer();
	});
	
	function getViewPage(id) {
		_paq.push(['trackEvent', 'KYCSubject', 'View']);
		window.open("${contextPath}/kyc/subject/view/" + id, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	}
	
	function getAuditLogPage(contextPath, id) {
		_paq.push(['trackEvent', 'KYCSubject', 'Audit']);
		$('#frm').attr("action", contextPath + "/kyc/subject/audit");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="subjectId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	} 
	
	function getEditPage(contextPath, id) {
		_paq.push(['trackEvent', 'KYCSubject', 'Edit']);
		$('#frm').attr("action", contextPath + "/kyc/subject/editPage");
		$('#frm').attr("method", "post");
		$('#frm').append('<input type="hidden" name="subjectId" value="' +id+ '" />');
		$('#frm').submit();
		buffer();
	}
	
	var reportDownload = function(kycSubjectRequestNo){
		var searchObject = {};
		searchObject.jurisdiction = "";
		searchObject.entityCode = "";
		searchObject.subjectId = kycSubjectRequestNo;
		
		var url = $("#commonContextPathId").val() + '/kyc/subject/generateReportLink';
		ajaxCallBack("POST", url,searchObject,"text",function(response){
			if (response !== null && response !== "") {
                event.preventDefault();
                event.stopPropagation();
                window.open(response, '_blank');
            }
		});
	};
</script>