<%@page import="com.viteos.itg.constant.ITGConstant"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="individualCounterparty" value="<%= ITGConstant.COUNTER_PARTY_TYPE_IND%>" />
<c:set var="entityCounterparty" value="<%= ITGConstant.COUNTER_PARTY_TYPE_NON_INDS%>" />

<spring:message code="app.isNewKYCRequest" var="isNewKYCRequest" />

<!-- Master Types -->
<input type="hidden" value="<%= ITGConstant.DOCUMENT_LIBRARY_TYPE%>" id="documentLibraryTypeId" />
<input type="hidden" value="<%= ITGConstant.PROOF_TYPE%>" id="proofTypeId" />
<input type="hidden" value="<%= ITGConstant.DEFAULT_DOCUMENT_TYPE%>" id="documentDocumentTypeId" />
<input type="hidden" value="<%= ITGConstant.KYC_TEMPLATE_TYPE%>" id="kycTemplateTypeId" />
<input type="hidden" value="<%= ITGConstant.KYC_DATA_TEMPLATE_TYPE%>" id="kycDataTemplateTypeId" />
<input type="hidden" value="<%= ITGConstant.CONSENT_TYPE%>" id="consentTypeId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_TYPE%>" id="kycSubjectTypeId" />

<!-- KYC Worflow Status -->
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_MAKER_DONE%>" id="kycSubjectMakerDoneId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_APPROVER_DONE%>" id="kycSubjectApproverDoneId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_COMPLIANCE_DONE%>" id="kycSubjectComplianceDoneId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_MANAGER_DONE%>" id="kycSubjectManagerDoneId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_GDPR_DONE%>" id="kycSubjectGDPRDoneId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_MANAGER_RETURN%>" id="kycSubjectManagerReturnId" />
<input type="hidden" value="<%= ITGConstant.KYC_SUBJECT_APPROVER_RETURN%>" id="kycSubjectApproverReturnId" />

<style>

	.blinkingOrange{
		/* animation:blinkingTextOrange 1s infinite; */
		text-decoration: blink !important;
		color: orange !important;
		font-weight: bold;
	}
	@keyframes blinkingTextOrange{
		0%{		color: transparent;	}
		49%{	color: orange;	}
		50%{	color: orange;	}
		99%{	color: orange;	}
		100%{	color: transparent;	}
		
	}
	.blinking{
		/* animation:blinkingText 1s infinite; */
		text-decoration: blink !important;
		color: red !important;
		font-weight: bold;
	}
	@keyframes blinkingText{
		0%{		color: transparent;	}
		49%{	color: red;	}
		50%{	color: red;	}
		99%{	color: red;	}
		100%{	color: transparent;	}
	}
		
	.multiselect, .multiselectCounterparty {
	  	width: 100%;
	}
	
	.selectBox, .selectBoxCounterparty {
	  	position: relative;
	  	display: inline-block;
	  	left: 10px;
    	width: 10%;
	}
	.selectBoxCounterparty {
		width: 12% !important;
	} 
	
	.selectBox select, .selectBoxCounterparty select {
	  	width: 100%;
	  	font-weight: bold;
	  	font-family: Ubuntu;
	  	font-style: normal;
	  	font-weight: normal;
	  	font-size: 14px !important;
	  	line-height: 22px;
	  	color: #B2B2B2;
	  	text-indent : 10px;
	  	height: 30px;
	  	border-radius: 10px !important;
	}
	
	.overSelect, .overSelectCounterparty {
	  	position: absolute;
	 	left: 0;
	  	right: 0;
	  	top: 0;
	  	bottom: 0;
	}
	
	#checkboxes, #checkboxesCounterparty {
	  	display: none;
	  	border: 1px #dadada solid;
	  	width: 15%;
    	margin-left: 7%;
	}
	
	#checkboxesCounterparty {
		width: 12% !important;
	}
	
	#checkboxes label,  #checkboxesCounterparty label{
	  display: block;
	  line-height: 25px;
	  color: #555;
	}
	
	#checkboxes label:hover, #checkboxesCounterparty label:hover {
	  background-color: #F7F9FF;
	}	
	#kyc_subject_request_new_count, #kyc_subject_request_progress_count, #kyc_subject_request_reject_count, #incomplete_individual_kyc_progress_count, #incomplete_entity_kyc_progress_count, #new_kyc_request_count {
		float: right;
		margin-right:5px;
	}
	.filterDiv {
	  	font-family: Ubuntu;
    	font-style: normal;
    	font-weight: normal;
    	font-size: 14px !important;
    	line-height: 22px;
    	color: #B2B2B2;
    	text-align: center;
    	display: inline-block;
    	width: 6%;
	}
</style>
<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar search-page-bar">
            <ul class="page-breadcrumb pull-right">
                <li><i class="fa fa-home"></i> <!-- <a href="#"> --> Home <!-- </a> --> <i class="fa fa-angle-right"></i></li>
                <li><!-- <a href="#"> -->My Task(s)<!-- </a> --></li>
            </ul>
            <!-- <h4>&nbsp;My Task(s)</h4> -->
            <span class="header-scope">&nbsp;My Task(s)</span>
        </div>
        <div class="row">
        	<div class="col-md-12">
				<input type="button" id="btnViewOgs" style="display:none" class="pull-right btn btn-itg btn btn-sm grey-gallery" value="OGS Screening" />
			</div>
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
		
		<form action="#" method="POST" id="frm" role="form" class="horizontal-form uk-form bt-flabels js-flabels">
			
			<textarea id="newMasterData" style="display: none;">${newMasterData}</textarea>
			<textarea id="inProgressMasterData" style="display: none;">${inProgressMasterData}</textarea>
			<textarea id="rejectedMasterData" style="display: none;">${rejectedMasterData}</textarea>
			
			<textarea id="newKYCSubjectRequestData" style="display: none;">${newKYCSubjectRequestData}</textarea>
			<textarea id="inProgressKYCSubjectRequestData" style="display: none;">${inProgressKYCSubjectRequestData}</textarea>
			<textarea id="rejectedKYCSubjectRequestData" style="display: none;">${rejectedKYCSubjectRequestData}</textarea>
			<textarea id="newKYCRequestData" style="display: none;">${newKYCRequestData}</textarea>
			<textarea id="expKYCSubjectCount" style="display: none;">${expKYCSubjectCount}</textarea>
			<textarea id="incompleteKYCRequestCount" style="display: none;">${incompleteKYCRequestCount}</textarea>
			
	        <div class="form-body">
				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-tabs" id="tabDetails">
							<c:if test="${isMasterAccess == true}">
								<li class="dropdown" id="masters">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">KYC Configuration
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu" role="menu">
										<li class="active">
											<a href="#masters_1" tabindex="-1" data-toggle="tab" onclick="_paq.push(['trackEvent', 'Dashboard', 'KYC Configuration', 'New']);">
												<b>New</b> <span id="masters_new_count" class="badge badge-success">0</span>
											</a>
										</li>
										<li>
											<a href="#masters_2" tabindex="-1" data-toggle="tab" onclick="_paq.push(['trackEvent', 'Dashboard', 'KYC Configuration', 'In Progress']);">
												<b>In Progress</b> <span id="masters_progress_count" class="badge badge-info">0</span>
											</a>
										</li>
										<li>
											<a href="#masters_3" tabindex="-1" data-toggle="tab" onclick="_paq.push(['trackEvent', 'Dashboard', 'KYC Configuration', 'Rejected']);">
												<b>Rejected</b> <span id="masters_reject_count" class="badge badge-info">0</span>
											</a>
										</li>
									</ul>
								</li>
							</c:if>
							<!--
							<c:if test="${isKYCSubjectAccess == true}">
								<li class="dropdown" id="kyc_subject_request">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">KYC Request
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a href="#kyc_subject_request_1" tabindex="-1" data-toggle="tab">
												<b>New</b> <span id="kyc_subject_request_new_count" class="badge badge-success">0</span>
											</a>
										</li>
										<li>
											<a href="#kyc_subject_request_2" tabindex="-1" data-toggle="tab">
												<b>In Progress</b> <span id="kyc_subject_request_progress_count" class="badge badge-info">0</span>
											</a>
										</li>
										<li>
											<a href="#kyc_subject_request_3" tabindex="-1" data-toggle="tab">
												<b>Rejected</b> <span id="kyc_subject_request_reject_count" class="badge badge-info">0</span>
											</a>
										</li>
										<c:if test="${isKYCSubjectAddAccess == true}">
											<li>
												<a href="#kyc_subject_request_4" tabindex="-1" data-toggle="tab">
													<b>Expiry Dashboard</b> <span id="new_kyc_request_count" class="badge badge-success">0</span>
												</a>
											</li>
										</c:if>
										<li>
											<a href="#kyc_subject_request_5" tabindex="-1" data-toggle="tab">
												<b>Incomplete Records</b> <span id="kyc_subject_request_incomplete_count" class="badge badge-info">0</span>
											</a>
										</li> 
									</ul>
								</li>
							</c:if> 
							-->
							
							<c:if test="${isKYCSubjectAccess == true}">
								<li>
									<a id="kyc_subject_request" href="#kyc_subject_request_1" style="color: #312783;" tabindex="-1" data-toggle="tab"> KYC Request
									</a>
								</li>
								<li>
									<a id="kyc_expiry_dashboard" href="#kyc_expiry_dashboard_1" style="color: #312783;" tabindex="-1" data-toggle="tab">Expiry Dashboard
									</a>
								</li>
							</c:if>
							<li>
								<a id="kyc_incomplete_records" href="#kyc_incomplete_records_1" style="color: #312783;" tabindex="-1" data-toggle="tab"> Incomplete Records 
								</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="masters_1">
								<div id='jqxWidget'>
									<div id="jqxgridNewMaster"></div>
								</div>
							</div>
							<div class="tab-pane fade" id="masters_2">
								<div id='jqxWidget'>
									<div id="jqxgridInProgressMaster"></div>
								</div>
							</div>
							<div class="tab-pane fade" id="masters_3">
								<div id="jqxgridRejectedMaster"></div>
							</div>
							<div class="tab-pane fade" id="masters_4">
								<div id="jqxgridnewKYCRequestMaster"></div>
							</div>
							
							<div class="tab-pane fade" id="kyc_subject_request_1">
								<div class="multiselect">
									<div class="filterDiv"><img src="/digiKYC/assets/global/img/filter.png" style="width: 20px; height: 20px;"/> &nbsp;Filter</div>
									<div class="selectBox" onclick="showCheckboxes()" style="width: 15%;">
										<select class="selectStatus">
								        	<option id="filterStatus">Status</option>
								      	</select>
								      	<div class="overSelect"></div>
								    </div>
								    <div id="checkboxes">
								      <label for="newKYC">&nbsp; &nbsp;<input type="checkbox" id="newKYC" /><b>&nbsp; New</b> <span id="kyc_subject_request_new_count" class="badge badge-success">0</span></label>
								      <label for="inProgressKYC">&nbsp; &nbsp;<input type="checkbox" id="inProgressKYC" /><b>&nbsp; In Progress</b> <span id="kyc_subject_request_progress_count" class="badge badge-info">0</span> </label>
								      <label for="rejectedKYC">&nbsp; &nbsp;<input type="checkbox" id="rejectedKYC" /><b>&nbsp; Rejected</b> <span id="kyc_subject_request_reject_count" class="badge badge-info">0</span></label>
								      <c:if test="${isNewKYCRequest == 'true'}">
									  	<label for="newKYCRequest">&nbsp; &nbsp;<input type="checkbox" id="newKYCRequest" /><b>&nbsp; New KYC Request</b> <span id="new_kyc_request_count" class="badge badge-info">0</span></label>
									  </c:if>
								  	</div>
								</div>
								<div id='jqxWidget'>
									<div id="jqxgridAllKYCSubjectRequest"></div>
								</div>
							</div>
							<!-- 
							<div class="tab-pane fade" id="kyc_subject_request_1">
								<div id='jqxWidget'>
									<div id="jqxgridNewKYCSubjectRequest"></div>
								</div>
							</div>
							<div class="tab-pane fade" id="kyc_subject_request_2">
								<div id='jqxWidget'>
									<div id="jqxgridInProgressKYCSubjectRequest"></div>
								</div>
							</div>
							<div class="tab-pane fade" id="kyc_subject_request_3">
								<div id="jqxgridRejectedKYCSubjectRequest"></div>
							</div>
							 -->
							<div class="tab-pane fade" id="kyc_expiry_dashboard_1">
								<div id='jqxWidget'>
									<div id="jqxgridExpiredRequest"></div>
								</div>
							</div>
							<div class="tab-pane fade" id="kyc_incomplete_records_1">
								<div class="multiselectCounterparty">
									<div class="filterDiv"><img src="/digiKYC/assets/global/img/filter.png" style="width: 20px; height: 20px;"/> &nbsp;Filter</div>
									<div class="selectBoxCounterparty" onclick="showCounterPartyCheckboxes()">
										<select class="selectStatusCounterparty">
								        	<option id="filterStatusCounterparty">Counterparty Type</option>
								      	</select>
								      	<div class="overSelectCounterparty"></div>
								    </div>
								    <div id="checkboxesCounterparty">
								      <label for="individualCounterparty">&nbsp; &nbsp;<input type="checkbox" id="individualCounterparty" /><b>&nbsp; ${individualCounterparty}</b> <span id="incomplete_individual_kyc_progress_count" class="badge badge-info">0</span></label>
								      <label for="entityCounterparty">&nbsp; &nbsp;<input type="checkbox" id="entityCounterparty" /><b>&nbsp; ${entityCounterparty}</b> <span id="incomplete_entity_kyc_progress_count" class="badge badge-info">0</span></label>
								  	</div>
								</div>
								<div id='jqxWidget'>
									<div id="jqxgridIncompleteKYCRequest"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="clearfix margin-bottom-20"></div>
<div class="clearfix margin-bottom-20"></div>
<script type="text/javascript" src='https://vitdevvuweb01:4061/assets/admin/layout/scripts/shortcut.js'></script>
<script src="${contextPath}/master/dashboard/dashboard.js" type="text/javascript"></script>
<script>
	var expanded = false;
	function showCheckboxes() {
	  var checkboxes = document.getElementById("checkboxes");
	  if (!expanded) {
	    checkboxes.style.display = "block";
	    expanded = true;
	  } else {
	    checkboxes.style.display = "none";
	    expanded = false;
	  }
	}

	var expandedCounterParty = false;
	function showCounterPartyCheckboxes() {
		  var checkboxes = document.getElementById("checkboxesCounterparty");
		  if (!expandedCounterParty) {
		    checkboxes.style.display = "block";
		    expandedCounterParty = true;
		  } else {
		    checkboxes.style.display = "none";
		    expandedCounterParty = false;
		  }
	}
	
	$("#btnViewOgs").click(function(){
		var riskEngineOgsApi = "${riskEngineOgsApi}";
		window.open(riskEngineOgsApi, "vedaNewWindow", "toolbar=no, scrollbars=yes, resizable=no, top=0, left=0, width=1200, height=800");
	});
</script>